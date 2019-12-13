Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8932411E5BB
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:39:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifm3H-0005EN-Ro; Fri, 13 Dec 2019 14:36:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifm3G-0005ED-ID
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:36:18 +0000
X-Inumbo-ID: e6d49414-1db5-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6d49414-1db5-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 14:36:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2B126B24C;
 Fri, 13 Dec 2019 14:36:08 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1576154413.git.hongyxia@amazon.com>
 <77acf62cab293ae99bd1fc079e1b0853faaf1242.1576154413.git.hongyxia@amazon.com>
 <2717096f-21d7-f184-b606-a3defffad847@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <345f27f4-c2d3-0501-6d48-e1b757c0154d@suse.com>
Date: Fri, 13 Dec 2019 15:36:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2717096f-21d7-f184-b606-a3defffad847@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyxia@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxNToxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8xMi8yMDE5
IDEyOjQ2LCBIb25neWFuIFhpYSB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
bS5jIGIveGVuL2FyY2gveDg2L21tLmMKPj4gaW5kZXggN2Q0ZGQ4MGE4NS4uOGRlZjRmYjhkOCAx
MDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21t
LmMKPj4gQEAgLTUxNTEsNiArNTE1MSw1MiBAQCBsMV9wZ2VudHJ5X3QgKnZpcnRfdG9feGVuX2wx
ZSh1bnNpZ25lZCBsb25nIHYpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmx1c2hfYXJl
YV9sb2NhbCgoY29uc3Qgdm9pZCAqKXYsIGYpIDogXAo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGZsdXNoX2FyZWFfYWxsKChjb25zdCB2b2lkICopdiwgZikpCj4+ICAKPj4gKy8qIFNoYXR0
ZXIgYW4gbDMgZW50cnkgYW5kIHBvcHVsYXRlIGwyLiBJZiB2aXJ0IGlzIHBhc3NlZCBpbiwgYWxz
byBkbyBmbHVzaC4gKi8KPj4gK3N0YXRpYyBib29sIHNoYXR0ZXJfbDNlKGwzX3BnZW50cnlfdCAq
cGwzZSwgdW5zaWduZWQgbG9uZyB2aXJ0LCBib29sIGxvY2tpbmcpCj4+ICt7Cj4+ICsgICAgdW5z
aWduZWQgaW50IGk7Cj4+ICsgICAgbDNfcGdlbnRyeV90IG9sM2UgPSAqcGwzZTsKPj4gKyAgICBs
Ml9wZ2VudHJ5X3QgbDJlID0gbDJlX2Zyb21faW50cHRlKGwzZV9nZXRfaW50cHRlKG9sM2UpKTsK
Pj4gKyAgICBsMl9wZ2VudHJ5X3QgKmwydCA9IGFsbG9jX3hlbl9wYWdldGFibGUoKTsKPj4gKwo+
PiArICAgIGlmICggIWwydCApCj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsKPj4gKwo+PiArICAg
IGZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKyApCj4+ICsgICAgewo+
PiArICAgICAgICBsMmVfd3JpdGUobDJ0ICsgaSwgbDJlKTsKPj4gKyAgICAgICAgbDJlID0gbDJl
X2Zyb21faW50cHRlKAo+PiArICAgICAgICAgICAgICAgICAgbDJlX2dldF9pbnRwdGUobDJlKSAr
IChQQUdFX1NJWkUgPDwgUEFHRVRBQkxFX09SREVSKSk7Cj4+ICsgICAgfQo+PiArCj4+ICsgICAg
aWYgKCBsb2NraW5nICkKPj4gKyAgICAgICAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7Cj4+
ICsgICAgaWYgKCAobDNlX2dldF9mbGFncygqcGwzZSkgJiBfUEFHRV9QUkVTRU5UKSAmJgo+PiAr
ICAgICAgICAgKGwzZV9nZXRfZmxhZ3MoKnBsM2UpICYgX1BBR0VfUFNFKSApCj4+ICsgICAgewo+
PiArICAgICAgICBsM2Vfd3JpdGVfYXRvbWljKHBsM2UsCj4+ICsgICAgICAgICAgICBsM2VfZnJv
bV9wYWRkcih2aXJ0X3RvX21hZGRyKGwydCksIF9fUEFHRV9IWVBFUlZJU09SKSk7Cj4+ICsgICAg
ICAgIGwydCA9IE5VTEw7Cj4+ICsgICAgfQo+PiArICAgIGlmICggbG9ja2luZyApCj4+ICsgICAg
ICAgIHNwaW5fdW5sb2NrKCZtYXBfcGdkaXJfbG9jayk7Cj4+ICsKPj4gKyAgICBpZiAoIHZpcnQg
KQo+PiArICAgIHsKPj4gKyAgICAgICAgdW5zaWduZWQgaW50IGZsdXNoX2ZsYWdzID0KPj4gKyAg
ICAgICAgICAgIEZMVVNIX1RMQiB8IEZMVVNIX09SREVSKDIgKiBQQUdFVEFCTEVfT1JERVIpOwo+
PiArCj4+ICsgICAgICAgIGlmICggbDNlX2dldF9mbGFncyhvbDNlKSAmIF9QQUdFX0dMT0JBTCAp
Cj4+ICsgICAgICAgICAgICBmbHVzaF9mbGFncyB8PSBGTFVTSF9UTEJfR0xPQkFMOwo+IAo+IEFu
b3RoZXIgcHJvYmxlbWF0aWMgdXNlIG9mIG9sM2Ugd2hpY2ggaXMgcmFjeSBvbiBjb25mbGljdC7C
oCBZb3UgbmVlZCB0bwo+IHN0cmljdGx5IHVzZSB0aGUgY29udGVudCBvZiAqcGwzZSBmcm9tIHdp
dGhpbiB0aGUgbG9ja2VkIHJlZ2lvbi4KCkJ1dCB0aGlzIGlzbid0IGEgcHJvYmxlbSBpbnRyb2R1
Y2VkIGhlcmUsIGkuZS4gZml4aW5nIG9mIGl0IGRvZXNuJ3QKc3RyaWN0bHkgZmFsbCB1bmRlciAi
cmUtZmFjdG9yIi4gKEknbSBjZXJ0YWlubHkgbm90IG9wcG9zZWQgdG8KZ2V0dGluZyB0aGlzIHJp
Z2h0IGF0IHRoZSBzYW1lIHRpbWUuKQoKPiBIb3dldmVyLCB3aHkgaGF2ZSB5b3UgbW92ZWQgdGhl
IGZsdXNoaW5nIGluIGhlcmU/wqAgT25seSBvbmUgb2YgdGhlIHR3bwo+IGNhbGxlcnMgYWN0dWFs
bHkgd2FudGVkIGl0LCBhbmQgZXZlbiB0aGVuIEknbSBub3QgdG90YWxseSBzdXJlIGl0IGlzCj4g
bmVjZXNzYXJ5Lgo+IAo+IEJvdGggY2FsbGVycyBvcGVyYXRlIG9uIGFuIGFyYml0cmFyeSByYW5n
ZSBvZiBhZGRyZXNzZXMsIGFuZCBmb3IKPiBhbnl0aGluZyBvdGhlciB0aGFuIGEgc2luZ2xldG9u
IHVwZGF0ZSwgd2lsbCB3YW50IHRvIGlzc3VlIGEgc2luZ2xlCj4gZmx1c2ggYXQgdGhlIGVuZCwg
cmF0aGVyIHRoYW4gYSBzcGF0ZSBvZiBmbHVzaGVzIGZvciBzdWItYXJlYXMuCj4gCj4gKEFsdGhv
dWdoIHNvbWVvbmUgcmVhbGx5IHBsZWFzZSBjaGVjayBteSByZWFzb25pbmcgaGVyZSBmb3IgdGhl
Cj4gbWFwX3BhZ2VzX3RvX3hlbigpIGNhc2Ugd2hpY2ggY3VycmVudGx5IGRvZXMgaGF2ZSBzdWIt
YXJlYSBmbHVzaGluZy4pCj4gCj4gRWl0aGVyIHRoZSBmbHVzaCB3YW50cyBkcm9wcGluZyAoYW5k
IGJlc3QgdmlhIGEgcHJlcmVxIHBhdGNoIGFsdGVyaW5nCj4gbWFwX3BhZ2VzX3RvX3hlbigpKSwg
b3IgeW91IG5lZWQgdG8gY2FjaGUgb2wzZSBpbiB0aGUgbG9ja2VkIHJlZ2lvbiB3aXRoCj4gQUND
RVNTX09OQ0UoKSBvciBlcXVpdmFsZW50LgoKV2VsbCwgYXQgYmVzdCByZXBsYWNpbmcgYnkgYSBz
aW5nbGUgb25lIGF0IHRoZSBlbmQsIGJ1dCBJIGd1ZXNzCnRoZSBjdXJyZW50IHBpZWNlbWVhbCBi
ZWhhdmlvciBpcyB0byBjb3BlIHdpdGggZXJyb3IgcGF0aHMgKHNlZQpKdWxpZW4ncyByZXBvcnQg
YWdhaW5zdCBtb2RpZnlfeGVuX21hcHBpbmdzKCksIHdoZXJlIGl0J3MKZXhhY3RseSB0aGUgb3Ro
ZXIgd2F5IGFyb3VuZCkuIENvbnNpZGVyaW5nIGVzcGVjaWFsbHkgc3BlY3VsYXRpdmUKYWNjZXNz
ZXMgSSB0aGluayBpdCBpc24ndCB0aGUgd29yc3QgaWRlYSB0byBrZWVwIHRoZSB3aW5kb3cgc21h
bGwKYmV0d2VlbiBzaGF0dGVyIGFuZCBmbHVzaCAoc2hvcnQgb2YgdXMgZG9pbmcgYSBwcm9wZXIg
YnJlYWstdGhlbi0KbWFrZSBzZXF1ZW5jZSkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
