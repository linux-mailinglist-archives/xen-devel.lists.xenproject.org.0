Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678661341B4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 13:29:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipAQH-0002Gf-1T; Wed, 08 Jan 2020 12:26:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipAQF-0002GM-4U
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 12:26:51 +0000
X-Inumbo-ID: 25065cfc-3212-11ea-b7d9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25065cfc-3212-11ea-b7d9-12813bfff9fa;
 Wed, 08 Jan 2020 12:26:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC3D1AD78;
 Wed,  8 Jan 2020 12:26:49 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200108110148.18988-1-jgross@suse.com>
 <20200108121606.yr25b27mrnawu6um@debian>
 <61ec5633-05b7-fab3-ceac-e6c7649893e3@suse.com>
 <20200108122355.3js5sbis2yxxszqc@debian>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <62c457b3-dd02-ad2b-4d17-f11739a27dc3@suse.com>
Date: Wed, 8 Jan 2020 13:26:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200108122355.3js5sbis2yxxszqc@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: clear per cpu stub page
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAgMTM6MjMsIFdlaSBMaXUgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMDgsIDIwMjAg
YXQgMDE6MTg6NDZQTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24gMDguMDEuMjAg
MTM6MTYsIFdlaSBMaXUgd3JvdGU6Cj4+PiBPbiBXZWQsIEphbiAwOCwgMjAyMCBhdCAxMjowMTo0
OFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4+IGNwdV9zbXBib290X2ZyZWUoKSBy
ZW1vdmVzIHRoZSBzdHVicyBmb3IgdGhlIGNwdSBnb2luZyBvZmZsaW5lLCBidXQgaXQKPj4+PiBp
c24ndCBjbGVhcmluZyB0aGUgcmVsYXRlZCBwZXJjcHUgdmFyaWFibGVzLiBUaGlzIHdpbGwgcmVz
dWx0IGluCj4+Pj4gY3Jhc2hlcyB3aGVuIGEgc3R1YiBwYWdlIGlzIHJlbGVhc2VkIGR1ZSB0byBh
bGwgcmVsYXRlZCBjcHVzIGdvbmUKPj4+PiBvZmZsaW5lIGFuZCBvbmUgb2YgdGhvc2UgY3B1cyBn
b2luZyBvbmxpbmUgbGF0ZXIuCj4+Pj4KPj4+PiBGaXggdGhhdCBieSBjbGVhcmluZyBzdHVicy5h
ZGRyIGFuZCBzdHVicy5tZm4gaW4gb3JkZXIgdG8gYWxsb2NhdGUgYQo+Pj4+IG5ldyBzdHViIHBh
Z2Ugd2hlbiBuZWVkZWQuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAgeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8
IDIgKysKPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290
LmMKPj4+PiBpbmRleCA3ZTI5NzA0MDgwLi40NmMwNzI5MjE0IDEwMDY0NAo+Pj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9zbXBib290LmMKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4+
Pj4gQEAgLTk0NSw2ICs5NDUsOCBAQCBzdGF0aWMgdm9pZCBjcHVfc21wYm9vdF9mcmVlKHVuc2ln
bmVkIGludCBjcHUsIGJvb2wgcmVtb3ZlKQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKHBlcl9jcHUoc3R1YnMuYWRkciwgY3B1KSB8IH5QQUdFX01BU0spICsgMSk7Cj4+Pj4g
ICAgICAgICAgICBpZiAoIGkgPT0gU1RVQlNfUEVSX1BBR0UgKQo+Pj4+ICAgICAgICAgICAgICAg
IGZyZWVfZG9taGVhcF9wYWdlKG1mbl90b19wYWdlKG1mbikpOwo+Pj4+ICsgICAgICAgIHBlcl9j
cHUoc3R1YnMuYWRkciwgY3B1KSA9IDA7Cj4+Pj4gKyAgICAgICAgcGVyX2NwdShzdHVicy5tZm4s
IGNwdSkgPSAwOwo+Pj4KPj4+IFNob3VsZG4ndCB0aGUgbWZuIGJlIHNldCB0byBJTlZBTElEX01G
TiBpbnN0ZWFkPwo+Pgo+PiBUaGlzIHdvdWxkIHJlcXVpcmUgbW9kaWZ5aW5nIGFsbG9jX3N0dWJf
cGFnZSgpOgo+Pgo+PiAgICAgIGlmICggKm1mbiApCj4+ICAgICAgICAgIHBnID0gbWZuX3RvX3Bh
Z2UoX21mbigqbWZuKSk7Cj4+ICAgICAgZWxzZQo+IAo+IE9LLiBJIHRoaW5rIHRoZSBjaGFuY2Ug
b2YgYWxsb2NhdGluZyBtZm4gMCBmcm9tIHRoZSBhbGxvY2F0b3IgaXMKPiBleGNlZWRpbmdseSBs
b3csIHNvIEkgY2VydGFpbmx5IGhhdmUgbm8gb2JqZWN0aW9uIHRvIHJlc2V0IGl0IHRvIDAuCgpU
aGUgY2hhbmNlIHNob3VsZCBiZSBleGFjdGx5IHplcm8uIE90aGVyd2lzZSB3ZSdkIGhhdmUgYSBi
aWcgcHJvYmxlbQpkdWUgdG8gTDFURi4uLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
