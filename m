Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AF613487C
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 17:51:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEVx-0005kM-G6; Wed, 08 Jan 2020 16:49:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipEVw-0005kH-Bu
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 16:49:00 +0000
X-Inumbo-ID: c3bee37d-3236-11ea-b853-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3bee37d-3236-11ea-b853-12813bfff9fa;
 Wed, 08 Jan 2020 16:48:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6EC10AD37;
 Wed,  8 Jan 2020 16:48:58 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200108143439.25580-1-jgross@suse.com>
 <8b0a131b-91e8-d557-8a87-476790158ca2@suse.com>
 <7a28029b-761b-a509-4ff7-920fff28ce37@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b48e3a20-7a24-494d-c978-9102a43ca907@suse.com>
Date: Wed, 8 Jan 2020 17:48:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <7a28029b-761b-a509-4ff7-920fff28ce37@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxNjoyOSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwOC4wMS4yMCAx
NjoyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA4LjAxLjIwMjAgMTU6MzQsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBjcHVfc21wYm9vdF9mcmVlKCkgcmVtb3ZlcyB0aGUgc3R1YnMgZm9y
IHRoZSBjcHUgZ29pbmcgb2ZmbGluZSwgYnV0IGl0Cj4+PiBpc24ndCBjbGVhcmluZyB0aGUgcmVs
YXRlZCBwZXJjcHUgdmFyaWFibGVzLiBUaGlzIHdpbGwgcmVzdWx0IGluCj4+PiBjcmFzaGVzIHdo
ZW4gYSBzdHViIHBhZ2UgaXMgcmVsZWFzZWQgZHVlIHRvIGFsbCByZWxhdGVkIGNwdXMgZ29uZQo+
Pj4gb2ZmbGluZSBhbmQgb25lIG9mIHRob3NlIGNwdXMgZ29pbmcgb25saW5lIGxhdGVyLgo+Pj4K
Pj4+IEZpeCB0aGF0IGJ5IGNsZWFyaW5nIHN0dWJzLmFkZHIgYW5kIHN0dWJzLm1mbiBpbiBvcmRl
ciB0byBhbGxvY2F0ZSBhCj4+PiBuZXcgc3R1YiBwYWdlIHdoZW4gbmVlZGVkLgo+Pgo+PiBJIHdh
cyByZWFsbHkgaG9waW5nIGZvciB5b3UgdG8gbWVudGlvbiBDUFUgcGFya2luZyBoZXJlLiBIb3cg
YWJvdXQKPj4KPj4gIkZpeCB0aGF0IGJ5IGNsZWFyaW5nIHN0dWJzLm1mbiAoYW5kIGFsc28gc3R1
YnMuYWRkciBqdXN0IHRvIGJlIG9uCj4+ICAgdGhlIHNhZmUgc2lkZSkgaW4gb3JkZXIgdG8gYWxs
b2NhdGUgYSBuZXcgc3R1YiBwYWdlIHdoZW4gbmVlZGVkLAo+PiAgIGlycmVzcGVjdGl2ZSBvZiB3
aGV0aGVyIHRoZSBDUFUgZ2V0cyBwYXJrZWQgb3IgcmVtb3ZlZC4iCj4+Cj4+PiAtLS0gYS94ZW4v
YXJjaC94ODYvc21wYm9vdC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4+PiBA
QCAtOTQ1LDYgKzk0NSw4IEBAIHN0YXRpYyB2b2lkIGNwdV9zbXBib290X2ZyZWUodW5zaWduZWQg
aW50IGNwdSwgYm9vbCByZW1vdmUpCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KHBlcl9jcHUoc3R1YnMuYWRkciwgY3B1KSB8IH5QQUdFX01BU0spICsgMSk7Cj4+PiAgICAgICAg
ICAgaWYgKCBpID09IFNUVUJTX1BFUl9QQUdFICkKPj4+ICAgICAgICAgICAgICAgZnJlZV9kb21o
ZWFwX3BhZ2UobWZuX3RvX3BhZ2UobWZuKSk7Cj4+PiArICAgICAgICBwZXJfY3B1KHN0dWJzLmFk
ZHIsIGNwdSkgPSAwOwo+Pj4gKyAgICAgICAgcGVyX2NwdShzdHVicy5tZm4sIGNwdSkgPSAwOwo+
Pgo+PiBMb29raW5nIG1vcmUgY2xvc2VseSwgSSB0aGluayBJJ2QgcHJlZmVyIHRoZXNlIHR3byBs
aW5lcyAob2Ygd2hpY2gKPj4gdGhlIGFkZHIgb25lIGlzbid0IHN0cmljdGx5IG5lZWRlZCBhbnl3
YXkpIHRvIG1vdmUgYWhlYWQgb2YgdGhlCj4+IGlmKCkuCj4+Cj4+IElmIHlvdSBhZ3JlZSwgSSds
bCBiZSBoYXBweSB0byBkbyBib3RoIHdoaWxlIGNvbW1pdHRpbmcuCj4gCj4gSSBhZ3JlZS4KPiAK
PiBJJ20gbm90IHN1cmUgdGhlIGFkZHIgY2xlYXJpbmcgY2FuIGJlIG9taXR0ZWQuIFRoaXMgbWln
aHQgcmVzdWx0IGluCj4gcHJvYmxlbXMgd2hlbiBkdXJpbmcgb25saW5pbmcgYW4gZWFybHkgZXJy
b3IgaGFwcGVucyBpbgo+IGNwdV9zbXBib290X2FsbG9jKCkgYW5kIHRodXMgc2tpcHBpbmcgdGhl
IGNhbGwgb2YgYWxsb2Nfc3R1Yl9wYWdlKCkuCj4gVGhlIHN1YnNlcXVlbnQgY2FsbCBvZiBjcHVf
c21wYm9vdF9mcmVlKCkgd2lsbCB0aGVuIG92ZXJ3cml0ZSBtZm4gMC4KCk9oLCBnb29kIHBvaW50
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
