Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B89B87B00
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 15:22:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw4nD-00073k-5c; Fri, 09 Aug 2019 13:18:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hw4nB-00073f-W9
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 13:18:50 +0000
X-Inumbo-ID: 37683c08-baa8-11e9-a587-efadf0d239eb
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37683c08-baa8-11e9-a587-efadf0d239eb;
 Fri, 09 Aug 2019 13:18:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F70EAFB7;
 Fri,  9 Aug 2019 13:18:45 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <a9651ce7-bdd2-ac6d-6670-0abbe4442b14@suse.com>
 <e686a008-1e0f-c82e-e9ab-83e966d11243@suse.com>
 <7a920e20-c6f9-4276-ef30-679b77c074ac@citrix.com>
 <f7bbe866-aee9-fed5-0789-4e6018e6c83b@suse.com>
 <070c7421-04b6-23e5-88a8-7d05bb26568c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef79ee24-af84-aabd-95f5-a4363ec2a78d@suse.com>
Date: Fri, 9 Aug 2019 15:18:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <070c7421-04b6-23e5-88a8-7d05bb26568c@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNTowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8wOC8yMDE5
IDEzOjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDkuMDguMjAxOSAxNDoxOSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA5LzA4LzIwMTkgMTE6NDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi94ZW4vYXJjaC94ODYvZGVzYy5jCj4+Pj4g
QEAgLTAsMCArMSwxMDkgQEAKPj4+PiArCj4+Pj4gKyNkZWZpbmUgU0VMMkdEVChzZWwpICgoKHNl
bCkgPj4gMykgLSBGSVJTVF9SRVNFUlZFRF9HRFRfRU5UUlkpCj4+Pj4gKwo+Pj4+ICtfX3NlY3Rp
b24oIi5kYXRhLnBhZ2VfYWxpZ25lZCIpIF9fYWxpZ25lZChQQUdFX1NJWkUpCj4+Pj4gK3NlZ19k
ZXNjX3QgYm9vdF9nZHRbUEFHRV9TSVpFIC8gc2l6ZW9mKHNlZ19kZXNjX3QpXSA9Cj4+Pj4gK3sK
Pj4+PiArwqDCoMKgIC8qIDB4ZTAwOCAtIFJpbmcgMCBjb2RlLCA2NGJpdCBtb2RlICovCj4+Pj4g
K8KgwqDCoCBbU0VMMkdEVChfX0hZUEVSVklTT1JfQ1M2NCldID0geyAweDAwYWY5YjAwMDAwMGZm
ZmYgfSwKPj4+PiArCj4+Pj4gK8KgwqDCoCAvKiAweGUwMTAgLSBSaW5nIDAgZGF0YSAqLwo+Pj4+
ICvCoMKgwqAgW1NFTDJHRFQoX19IWVBFUlZJU09SX0RTMzIpXSA9IHsgMHgwMGNmOTMwMDAwMDBm
ZmZmIH0sCj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyogMHhlMDE4IC0gcmVzZXJ2ZWQgKi8KPj4+PiAr
Cj4+Pj4gK8KgwqDCoCAvKiAweGUwMjMgLSBSaW5nIDMgY29kZSwgY29tcGF0aWJpbGl0eSAqLwo+
Pj4+ICvCoMKgwqAgW1NFTDJHRFQoRkxBVF9SSU5HM19DUzMyKV0gPSB7IDB4MDBjZmZiMDAwMDAw
ZmZmZiB9LAo+Pj4+ICsKPj4+PiArwqDCoMKgIC8qIDB4ZTAyYiAtIFJpbmcgMyBkYXRhICovCj4+
Pj4gK8KgwqDCoCBbU0VMMkdEVChGTEFUX1JJTkczX0RTMzIpXSA9IHsgMHgwMGNmZjMwMDAwMDBm
ZmZmIH0sCj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyogMHhlMDMzIC0gUmluZyAzIGNvZGUsIDY0LWJp
dCBtb2RlICovCj4+Pj4gK8KgwqDCoCBbU0VMMkdEVChGTEFUX1JJTkczX0NTNjQpXSA9IHsgMHgw
MGFmZmIwMDAwMDBmZmZmIH0sCj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyogMHhlMDM4IC0gUmluZyAw
IGNvZGUsIGNvbXBhdGliaWxpdHkgKi8KPj4+PiArwqDCoMKgIFtTRUwyR0RUKF9fSFlQRVJWSVNP
Ul9DUzMyKV0gPSB7IDB4MDBjZjliMDAwMDAwZmZmZiB9LAo+Pj4+ICsKPj4+PiArwqDCoMKgIC8q
IDB4ZTA0MCAtIFRTUyAqLwo+Pj4+ICvCoMKgwqAgLyogMHhlMDUwIC0gTERUICovCj4+Pj4gKwo+
Pj4+ICvCoMKgwqAgLyogMHhlMDYwIC0gcGVyLUNQVSBlbnRyeSAobGltaXQgPT0gY3B1KSAqLwo+
Pj4+ICvCoMKgwqAgW1NFTDJHRFQoUEVSX0NQVV9HRFRfU0VMRUNUT1IpXSA9IHsgMHgwMDAwOTEw
MDAwMDAwMDAwIH0sCj4+Pgo+Pj4gSXQgd291bGQgYmUgYmV0dGVyIGlmIHRoZSA9IHsgfSB3ZXJl
IHZlcnRpY2FsbHkgYWxpZ25lZC7CoCBJdCBtYWtlcwo+Pj4gcmVhZGluZyB0aGVtIGVhc2llci4K
Pj4+Cj4+PiBBbHNvLCBub3cgdGhhdCBTRUwyR0RUKCkgaXMgcHJlc2VudCwgd2UgbmVlZCBhIEJV
SUxEX0JVR19PTigpIHRvIGNoZWNrCj4+PiB0aGF0IHRoZSBzaXplIGRvZXNuJ3QgdmFyeSBmcm9t
IG9uZSBwYWdlLsKgIEF0IHRoZSBtb21lbnQsIGNoYW5naW5nIGEKPj4+IHNlbGVjdG9yIHRvIHVz
ZSAweGZ4eHggd2lsbCBjYXVzZSB0aGlzIHRvIGdyb3cgYmV5b25kIDEgcGFnZSB3aXRob3V0IGFu
eQo+Pj4gY29tcGlsZXIgZGlhZ25vc3RpYy7CoCBJJ2QgZ28gd2l0aAo+Pj4KPj4+IHN0YXRpYyB2
b2lkIF9faW5pdCBfX21heWJlX3VudXNlZAo+Pj4gYnVpbGRfYXNzZXJ0aW9ucyh2b2lkKQo+Pj4K
Pj4+IHsKPj4+ICDCoMKgwqDCoCBCVUlMRF9CVUdfT04oc2l6ZW9mKGJvb3RfZ2R0KSAhPSBQQUdF
X1NJWkUpOwo+Pj4gIMKgwqDCoMKgIEJVSUxEX0JVR19PTihzaXplb2YoYm9vdF9jb21wYXRfZ2R0
KSAhPSBQQUdFX1NJWkUpOwo+Pj4gfQo+Pgo+PiBXaWxsIGRvLCBhbGJlaXQgZm9yIHRoZSBidWls
ZCBhc3NlcnRpb25zIHRoaXMgaXNuJ3QgcmVhbGx5IHRoZQo+PiByaWdodCBwbGFjZSBpbW8sIGJl
Y2F1c2UgdGhpcyBpc24ndCB0aGUgcGxhY2Ugd2hlcmUgd2UgZGVwZW5kCj4+IG9uIHRoZW0gYmVp
bmcganVzdCBzaW5nbGUgcGFnZXMuIEknbGwgcHV0IGl0IHRoZXJlIG5ldmVydGhlbGVzcywKPj4g
YnV0IEknbGwgYWRkIGEgY29tbWVudCBmb3Igd2h5IHRoZXkncmUgdGhlcmUuCj4gCj4gSU1PIHRo
aXMgaXMgdGhlIHJpZ2h0IHBsYWNlLCBiZWNhdXNlIGl0IGlzIHJpZ2h0IGJlc2lkZSB3aGVyZSB0
aGUgYXJyYXkKPiBpcyBzcGVjaWZpY2FsbHkgZGVmaW5lZCB0byBiZSBbUEFHRV9TSVpFIC8gc2l6
ZW9mKCldLgoKSSB3YXMgYWJvdXQgdG8gYXNrIHdoeSB3ZSB0aGVuIG5lZWQgYnVpbGRfYXNzZXJ0
aW9ucygpIGF0IGFsbCwKdW50aWwgSSBhbHNvIHNhdyAuLi4KCj4gV2hhdCBpdCBpcyBkb2luZyBp
cyB3b3JraW5nIGFyb3VuZCB3aGF0IGlzIGFyZ3VhYmx5IGEgY29tcGlsZXIgYnVnIGJ5Cj4gYWxs
b3dpbmcgZm9vW3hdID0geyBbeCArIDFdID0gLi4uIH0gdG8gd29yay4KCi4uLiB0aGlzLiBXaGlj
aCBtYWRlIG1lIGdvIGNoZWNrLCBhbmQgYm90aCBnY2MgNC4zIGFuZCBnY2MgOS4xCmNvcnJlY3Rs
eSBjb21wbGFpbiAiYXJyYXkgaW5kZXggaW4gaW5pdGlhbGl6ZXIgZXhjZWVkcyBhcnJheQpib3Vu
ZHMiLgoKPiBBbnl3YXksIHdpdGggdGhlc2UgYXNzZXJ0aW9ucyBhbmQgdGhlIHR3ZWFrZWQgY29u
c3RhbnQgY2xlbmF1cCwKPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KClRoYW5rcywgYnV0IGFzIHBlciBhYm92ZSBJJ20gbm93IGlycml0YXRl
ZDogV2l0aCB0aGUgZXhwbGljaXQKc3BlY2lmaWNhdGlvbiBvZiB0aGUgYXJyYXkgc2l6ZSwgYnVp
bGRfYXNzZXJ0aW9ucygpIHNob3VsZCBlaXRoZXIKYmUgZHJvcHBlZCBhZ2Fpbiwgb3IgaXRzIGNv
bW1lbnQgYmUgZXh0ZW5kZWQgdG8gY292ZXIgd2h5IGl0J3MKbmVlZGVkIF9kZXNwaXRlXyB0aGUg
c3BlY2lmaWVkIGFycmF5IHNpemUgKGkuZS4gaW4gd2hpY2ggY2FzZQp5b3VyIGV4YW1wbGUgYWJv
dmUgd291bGQgbm90IGNhdXNlIGEgYnVpbGQgZmFpbHVyZSkuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
