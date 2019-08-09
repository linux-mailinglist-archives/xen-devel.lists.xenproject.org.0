Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65CD87A68
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 14:46:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw4F0-0004dX-7K; Fri, 09 Aug 2019 12:43:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw4Ey-0004dR-Ue
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 12:43:28 +0000
X-Inumbo-ID: 458bb760-baa3-11e9-a239-57261d631340
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 458bb760-baa3-11e9-a239-57261d631340;
 Fri, 09 Aug 2019 12:43:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A79B2AEBB;
 Fri,  9 Aug 2019 12:43:21 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <e686a008-1e0f-c82e-e9ab-83e966d11243@suse.com>
 <7a920e20-c6f9-4276-ef30-679b77c074ac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f7bbe866-aee9-fed5-0789-4e6018e6c83b@suse.com>
Date: Fri, 9 Aug 2019 14:43:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a920e20-c6f9-4276-ef30-679b77c074ac@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/desc: Build boot_{,
 compat_}gdt[] in C
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNDoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wOC8yMDE5
IDExOjQwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4KPj4gSW50cm9kdWNlIFNFTDJHRFQoKS4g
Q29ycmVjdCBHRFQgaW5kaWNlcyBpbiBwdWJsaWMgaGVhZGVyLgo+IAo+ICJDb3JyZWN0IiBoZXJl
IGlzIGFtYmlndW91cyBiZWNhdXNlIGl0IGltcGxpZXMgdGhlcmUgaXMgYSBicmVha2FnZS4KPiAK
PiBZb3UgYXBwZWFyIHRvIGhhdmUgcmV2ZXJzZWQgRkxBVF9SSU5HM19DUzY0IGFuZCBEUzMyIChy
ZXRhaW5pbmcgdGhlCj4gb3JpZ2luYWwgY29tbWVudHMpIGFuZCBjaGFuZ2VkIHRoZSBjb21tZW50
cyBmb3IgRkxBVF9SSU5HM19TU3szMiw2NH0uCgpXZWxsIC0gdGhlIGNvbW1lbnRzIHdlcmUgd2hh
dCB3YXMgd3JvbmcgYWZ0ZXIgYWxsLgoKPiBFeGNlcHQgdGhhdCBub3cgdGhleSBhcmUgb3V0IG9m
IHRoZWlyIGxvZ2ljYWwgb3JkZXIgKENTIDMyIHRoZW4gNjQsIERTCj4gMzIgdGhlbiA2NCwgU1Mg
MzIgdGhlbiA2NCkuCj4gCj4gV2hhdCBpcyB0aGUgcmVhc29uaW5nIGZvciB0aGUgbmV3IG9yZGVy
P8KgIEl0IGlzbid0IHNvcnRlZCBieSBpbmRleC4KCkl0IGlzLCBhcyBtdWNoIGFzIGl0IGxvb2tz
IHRvIGhhdmUgYmVlbiB0aGUgb3JpZ2luYWwgYXV0aG9yJ3MKaW50ZW50LiBJLmUuIEkgZGlkbid0
IHJlLW9yZGVyIHRoaW5ncyBhY3Jvc3MgdGhlIG51bCBzZWxlY3RvcgpiZXR3ZWVuIHRoZSB0d28g
Z3JvdXBzLkkgY2FuIHB1bGwgRkxBVF9SSU5HM19TUyogdXAgaWYgdGhhdCdzCndoYXQgeW91IHdh
bnQuIEknbSBhbHNvIGhhcHB5IHdpdGggYW55IG90aGVyIG9yZGVyIHRoYXQgeW91Cm1heSBwcmVm
ZXIgLSBqdXN0IGxldCBtZSBrbm93IHdoaWNoIG9uZS4gQWxsIEkgY2FyZSBhYm91dCBpcwpmb3Ig
dGhlIGNvbW1lbnRzIHRvIGJlIGluIHN5bmMgd2l0aCB0aGUgYWN0dWFsIHZhbHVlcy4KCj4+IC0t
LSAvZGV2L251bGwKPj4gKysrIGIveGVuL2FyY2gveDg2L2Rlc2MuYwo+PiBAQCAtMCwwICsxLDEw
OSBAQAo+PiArCj4+ICsjZGVmaW5lIFNFTDJHRFQoc2VsKSAoKChzZWwpID4+IDMpIC0gRklSU1Rf
UkVTRVJWRURfR0RUX0VOVFJZKQo+PiArCj4+ICtfX3NlY3Rpb24oIi5kYXRhLnBhZ2VfYWxpZ25l
ZCIpIF9fYWxpZ25lZChQQUdFX1NJWkUpCj4+ICtzZWdfZGVzY190IGJvb3RfZ2R0W1BBR0VfU0la
RSAvIHNpemVvZihzZWdfZGVzY190KV0gPQo+PiArewo+PiArwqDCoMKgIC8qIDB4ZTAwOCAtIFJp
bmcgMCBjb2RlLCA2NGJpdCBtb2RlICovCj4+ICvCoMKgwqAgW1NFTDJHRFQoX19IWVBFUlZJU09S
X0NTNjQpXSA9IHsgMHgwMGFmOWIwMDAwMDBmZmZmIH0sCj4+ICsKPj4gK8KgwqDCoCAvKiAweGUw
MTAgLSBSaW5nIDAgZGF0YSAqLwo+PiArwqDCoMKgIFtTRUwyR0RUKF9fSFlQRVJWSVNPUl9EUzMy
KV0gPSB7IDB4MDBjZjkzMDAwMDAwZmZmZiB9LAo+PiArCj4+ICvCoMKgwqAgLyogMHhlMDE4IC0g
cmVzZXJ2ZWQgKi8KPj4gKwo+PiArwqDCoMKgIC8qIDB4ZTAyMyAtIFJpbmcgMyBjb2RlLCBjb21w
YXRpYmlsaXR5ICovCj4+ICvCoMKgwqAgW1NFTDJHRFQoRkxBVF9SSU5HM19DUzMyKV0gPSB7IDB4
MDBjZmZiMDAwMDAwZmZmZiB9LAo+PiArCj4+ICvCoMKgwqAgLyogMHhlMDJiIC0gUmluZyAzIGRh
dGEgKi8KPj4gK8KgwqDCoCBbU0VMMkdEVChGTEFUX1JJTkczX0RTMzIpXSA9IHsgMHgwMGNmZjMw
MDAwMDBmZmZmIH0sCj4+ICsKPj4gK8KgwqDCoCAvKiAweGUwMzMgLSBSaW5nIDMgY29kZSwgNjQt
Yml0IG1vZGUgKi8KPj4gK8KgwqDCoCBbU0VMMkdEVChGTEFUX1JJTkczX0NTNjQpXSA9IHsgMHgw
MGFmZmIwMDAwMDBmZmZmIH0sCj4+ICsKPj4gK8KgwqDCoCAvKiAweGUwMzggLSBSaW5nIDAgY29k
ZSwgY29tcGF0aWJpbGl0eSAqLwo+PiArwqDCoMKgIFtTRUwyR0RUKF9fSFlQRVJWSVNPUl9DUzMy
KV0gPSB7IDB4MDBjZjliMDAwMDAwZmZmZiB9LAo+PiArCj4+ICvCoMKgwqAgLyogMHhlMDQwIC0g
VFNTICovCj4+ICvCoMKgwqAgLyogMHhlMDUwIC0gTERUICovCj4+ICsKPj4gK8KgwqDCoCAvKiAw
eGUwNjAgLSBwZXItQ1BVIGVudHJ5IChsaW1pdCA9PSBjcHUpICovCj4+ICvCoMKgwqAgW1NFTDJH
RFQoUEVSX0NQVV9HRFRfU0VMRUNUT1IpXSA9IHsgMHgwMDAwOTEwMDAwMDAwMDAwIH0sCj4gCj4g
SXQgd291bGQgYmUgYmV0dGVyIGlmIHRoZSA9IHsgfSB3ZXJlIHZlcnRpY2FsbHkgYWxpZ25lZC7C
oCBJdCBtYWtlcwo+IHJlYWRpbmcgdGhlbSBlYXNpZXIuCj4gCj4gQWxzbywgbm93IHRoYXQgU0VM
MkdEVCgpIGlzIHByZXNlbnQsIHdlIG5lZWQgYSBCVUlMRF9CVUdfT04oKSB0byBjaGVjawo+IHRo
YXQgdGhlIHNpemUgZG9lc24ndCB2YXJ5IGZyb20gb25lIHBhZ2UuwqAgQXQgdGhlIG1vbWVudCwg
Y2hhbmdpbmcgYQo+IHNlbGVjdG9yIHRvIHVzZSAweGZ4eHggd2lsbCBjYXVzZSB0aGlzIHRvIGdy
b3cgYmV5b25kIDEgcGFnZSB3aXRob3V0IGFueQo+IGNvbXBpbGVyIGRpYWdub3N0aWMuwqAgSSdk
IGdvIHdpdGgKPiAKPiBzdGF0aWMgdm9pZCBfX2luaXQgX19tYXliZV91bnVzZWQKPiBidWlsZF9h
c3NlcnRpb25zKHZvaWQpCj4gCj4gewo+ICDCoMKgwqAgQlVJTERfQlVHX09OKHNpemVvZihib290
X2dkdCkgIT0gUEFHRV9TSVpFKTsKPiAgwqDCoMKgIEJVSUxEX0JVR19PTihzaXplb2YoYm9vdF9j
b21wYXRfZ2R0KSAhPSBQQUdFX1NJWkUpOwo+IH0KCldpbGwgZG8sIGFsYmVpdCBmb3IgdGhlIGJ1
aWxkIGFzc2VydGlvbnMgdGhpcyBpc24ndCByZWFsbHkgdGhlCnJpZ2h0IHBsYWNlIGltbywgYmVj
YXVzZSB0aGlzIGlzbid0IHRoZSBwbGFjZSB3aGVyZSB3ZSBkZXBlbmQKb24gdGhlbSBiZWluZyBq
dXN0IHNpbmdsZSBwYWdlcy4gSSdsbCBwdXQgaXQgdGhlcmUgbmV2ZXJ0aGVsZXNzLApidXQgSSds
bCBhZGQgYSBjb21tZW50IGZvciB3aHkgdGhleSdyZSB0aGVyZS4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
