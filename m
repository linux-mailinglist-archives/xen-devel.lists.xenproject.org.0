Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E9D13463A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:31:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDHI-0005pK-LN; Wed, 08 Jan 2020 15:29:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipDHG-0005ot-GJ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:29:46 +0000
X-Inumbo-ID: b2f089fc-322b-11ea-b830-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2f089fc-322b-11ea-b830-12813bfff9fa;
 Wed, 08 Jan 2020 15:29:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4AD00AAD0;
 Wed,  8 Jan 2020 15:29:45 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200108143439.25580-1-jgross@suse.com>
 <8b0a131b-91e8-d557-8a87-476790158ca2@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7a28029b-761b-a509-4ff7-920fff28ce37@suse.com>
Date: Wed, 8 Jan 2020 16:29:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <8b0a131b-91e8-d557-8a87-476790158ca2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: clear per cpu stub page
 information in cpu_smpboot_free()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAgMTY6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA4LjAxLjIwMjAgMTU6
MzQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IGNwdV9zbXBib290X2ZyZWUoKSByZW1vdmVzIHRo
ZSBzdHVicyBmb3IgdGhlIGNwdSBnb2luZyBvZmZsaW5lLCBidXQgaXQKPj4gaXNuJ3QgY2xlYXJp
bmcgdGhlIHJlbGF0ZWQgcGVyY3B1IHZhcmlhYmxlcy4gVGhpcyB3aWxsIHJlc3VsdCBpbgo+PiBj
cmFzaGVzIHdoZW4gYSBzdHViIHBhZ2UgaXMgcmVsZWFzZWQgZHVlIHRvIGFsbCByZWxhdGVkIGNw
dXMgZ29uZQo+PiBvZmZsaW5lIGFuZCBvbmUgb2YgdGhvc2UgY3B1cyBnb2luZyBvbmxpbmUgbGF0
ZXIuCj4+Cj4+IEZpeCB0aGF0IGJ5IGNsZWFyaW5nIHN0dWJzLmFkZHIgYW5kIHN0dWJzLm1mbiBp
biBvcmRlciB0byBhbGxvY2F0ZSBhCj4+IG5ldyBzdHViIHBhZ2Ugd2hlbiBuZWVkZWQuCj4gCj4g
SSB3YXMgcmVhbGx5IGhvcGluZyBmb3IgeW91IHRvIG1lbnRpb24gQ1BVIHBhcmtpbmcgaGVyZS4g
SG93IGFib3V0Cj4gCj4gIkZpeCB0aGF0IGJ5IGNsZWFyaW5nIHN0dWJzLm1mbiAoYW5kIGFsc28g
c3R1YnMuYWRkciBqdXN0IHRvIGJlIG9uCj4gICB0aGUgc2FmZSBzaWRlKSBpbiBvcmRlciB0byBh
bGxvY2F0ZSBhIG5ldyBzdHViIHBhZ2Ugd2hlbiBuZWVkZWQsCj4gICBpcnJlc3BlY3RpdmUgb2Yg
d2hldGhlciB0aGUgQ1BVIGdldHMgcGFya2VkIG9yIHJlbW92ZWQuIgo+IAo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvc21wYm9vdC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPj4gQEAg
LTk0NSw2ICs5NDUsOCBAQCBzdGF0aWMgdm9pZCBjcHVfc21wYm9vdF9mcmVlKHVuc2lnbmVkIGlu
dCBjcHUsIGJvb2wgcmVtb3ZlKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHBl
cl9jcHUoc3R1YnMuYWRkciwgY3B1KSB8IH5QQUdFX01BU0spICsgMSk7Cj4+ICAgICAgICAgICBp
ZiAoIGkgPT0gU1RVQlNfUEVSX1BBR0UgKQo+PiAgICAgICAgICAgICAgIGZyZWVfZG9taGVhcF9w
YWdlKG1mbl90b19wYWdlKG1mbikpOwo+PiArICAgICAgICBwZXJfY3B1KHN0dWJzLmFkZHIsIGNw
dSkgPSAwOwo+PiArICAgICAgICBwZXJfY3B1KHN0dWJzLm1mbiwgY3B1KSA9IDA7Cj4gCj4gTG9v
a2luZyBtb3JlIGNsb3NlbHksIEkgdGhpbmsgSSdkIHByZWZlciB0aGVzZSB0d28gbGluZXMgKG9m
IHdoaWNoCj4gdGhlIGFkZHIgb25lIGlzbid0IHN0cmljdGx5IG5lZWRlZCBhbnl3YXkpIHRvIG1v
dmUgYWhlYWQgb2YgdGhlCj4gaWYoKS4KPiAKPiBJZiB5b3UgYWdyZWUsIEknbGwgYmUgaGFwcHkg
dG8gZG8gYm90aCB3aGlsZSBjb21taXR0aW5nLgoKSSBhZ3JlZS4KCkknbSBub3Qgc3VyZSB0aGUg
YWRkciBjbGVhcmluZyBjYW4gYmUgb21pdHRlZC4gVGhpcyBtaWdodCByZXN1bHQgaW4KcHJvYmxl
bXMgd2hlbiBkdXJpbmcgb25saW5pbmcgYW4gZWFybHkgZXJyb3IgaGFwcGVucyBpbgpjcHVfc21w
Ym9vdF9hbGxvYygpIGFuZCB0aHVzIHNraXBwaW5nIHRoZSBjYWxsIG9mIGFsbG9jX3N0dWJfcGFn
ZSgpLgpUaGUgc3Vic2VxdWVudCBjYWxsIG9mIGNwdV9zbXBib290X2ZyZWUoKSB3aWxsIHRoZW4g
b3ZlcndyaXRlIG1mbiAwLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
