Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305D5BF009
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:48:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRHg-0002mJ-5z; Thu, 26 Sep 2019 10:46:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDRHe-0002m2-MN
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:46:02 +0000
X-Inumbo-ID: d4c8abfa-e04a-11e9-964e-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by localhost (Halon) with ESMTPS
 id d4c8abfa-e04a-11e9-964e-12813bfff9fa;
 Thu, 26 Sep 2019 10:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569494761; x=1601030761;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+jRpH0Z6uvcSjNXUUKjFDNqN7KOBaacaQBwOWRTu1KM=;
 b=tPLSZ4ZhyJIjhdLyqSqO/qd1crxTr/ccLM/7idlwDOTOf1jXoKZ2J/tq
 hSJ7MsWjhA5BKBmSzncxddk4MUfXZm/vcUjxAShxKDuSUhpHOohmng1cQ
 niCDeJIAM7NljrbMfD6bJdIEWpBegkbfiOHYHHEv/8mGrxXxHh0/p1ITZ Y=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="417797308"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 26 Sep 2019 10:46:00 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-97fdccfd.us-east-1.amazon.com (Postfix) with ESMTPS
 id DD9E8A1D3E; Thu, 26 Sep 2019 10:45:56 +0000 (UTC)
Received: from EX13D31UWA003.ant.amazon.com (10.43.160.130) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 10:45:56 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D31UWA003.ant.amazon.com (10.43.160.130) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 10:45:55 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 10:45:51 +0000
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <6d79e6301ff15af71b21c64d10760abb9775b626.1569489002.git.hongyax@amazon.com>
 <7219684f-39b6-984c-340b-cd118c212636@arm.com>
From: <hongyax@amazon.com>
Message-ID: <0483a404-2884-c271-b589-4b60e446e96f@amazon.com>
Date: Thu, 26 Sep 2019 11:45:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7219684f-39b6-984c-340b-cd118c212636@arm.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 58/84] x86/mm: fix leaks in
 map_xen_pagetable.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxMToyMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE5JVDog
d2UgZG9uJ3QgdXN1YWxseSBhZGQgZnVsbCBzdG9wIGF0IHRoZSBlbmQgb2YgdGhlIHRpdGxlLiBU
aGlzIGFwcGxpZXMgZm9yIAo+IHRoZSByZXN0IG9mIHRoZSBzZXJpZXMuCgpUaGFua3MuCgo+IAo+
IE9uIDkvMjYvMTkgMTA6NDYgQU0sIGhvbmd5YXhAYW1hem9uLmNvbSB3cm90ZToKPj4gRnJvbTog
SG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KPj4KPj4gTm90IHVubWFwcGluZyBwYWdl
cyBhZnRlciBtYXBfeGVuX3BhZ2V0YWJsZSBjYW4gbGVhayB0aGUgdmlydHVhbCBhZGRyZXNzCj4+
IHNwYWNlIG92ZXIgdGltZS4gQWxzbyB0aGlzIGZpeCBtYWtlcyB2bWFwX3RvX21mbiBub24tdHJp
dmlhbCB0byBiZSBhCj4+IG1hY3JvLiBUaGVyZSBtaWdodCBiZSBiZXR0ZXIgb3B0aW9ucyBidXQg
bW92ZSBpdCBpbnRvIHZtYXAuYyBmb3Igbm93Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIb25neWFu
IFhpYSA8aG9uZ3lheEBhbWF6b24uY29tPgo+PiAtLS0KPj4gwqAgeGVuL2FyY2gveDg2L21tLmPC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDUgKy0tLS0KPj4gwqAgeGVuL2NvbW1vbi92bWFwLmPCoMKg
wqDCoMKgwqDCoMKgwqAgfCAxMyArKysrKysrKysrKysrCj4+IMKgIHhlbi9pbmNsdWRlL2FzbS1h
cm0vbW0uaMKgwqAgfMKgIDIgLS0KPj4gwqAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9wYWdlLmggfMKg
IDIgLS0KPj4gwqAgeGVuL2luY2x1ZGUveGVuL3ZtYXAuaMKgwqDCoMKgIHzCoCAzICsrKwo+PiDC
oCA1IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4+IGlu
ZGV4IGIyYjJlZGJlZDEuLjE0NWM1YWI0N2MgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9t
bS5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4+IEBAIC01MTYwLDYgKzUxNjAsNyBAQCBp
bnQgbWFwX3BhZ2VzX3RvX3hlbigKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICEobDJlX2dldF9mbGFncyhvbDJlKSAmIF9QQUdF
X1BTRSkgKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGZyZWVfeGVuX3BhZ2V0YWJsZShsMmVfZ2V0X21mbihvbDJlKSk7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBVTk1BUF9YRU5fUEFHRVRBQkxFKGwydCk7Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmVlX3hlbl9wYWdl
dGFibGUobDJ0X21mbik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IEBAIC01MjI1LDcgKzUyMjYsNiBAQCBp
bnQgbWFwX3BhZ2VzX3RvX3hlbigKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBsM2Vfd3JpdGVfYXRvbWljKHBsM2UsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGwzZV9mcm9tX21mbihsMnRf
bWZuLCBfX1BBR0VfSFlQRVJWSVNPUikpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFVOTUFQX1hFTl9QQUdFVEFCTEUobDJ0KTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBsMnQgPSBOVUxMOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggbG9ja2luZyApCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKPj4g
QEAgLTUzNDYsNyArNTM0Niw2IEBAIGludCBtYXBfcGFnZXNfdG9feGVuKAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbDJlX3dyaXRlX2F0b21pYyhwbDJlLCBs
MmVfZnJvbV9tZm4obDF0X21mbiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fUEFHRV9IWVBFUlZJU09SKSk7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBVTk1BUF9YRU5fUEFHRVRBQkxFKGwx
dCk7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsMXQgPSBOVUxM
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGxvY2tpbmcgKQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsK
Pj4gQEAgLTU1ODksNyArNTU4OCw2IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVk
IGxvbmcgcywgdW5zaWduZWQgbG9uZyAKPj4gZSwgdW5zaWduZWQgaW50IG5mKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbDNlX3dyaXRlX2F0b21pYyhwbDNlLCBsM2VfZnJvbV9tZm4obWZuLCBfX1BBR0VfSFlQRVJW
SVNPUikpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFVOTUFQX1hFTl9Q
QUdFVEFCTEUobDJ0KTsKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsMnQgPSBO
VUxMOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICggbG9ja2luZyApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Bpbl91bmxvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKPj4gQEAgLTU2NTcsNyArNTY1NSw2
IEBAIGludCBtb2RpZnlfeGVuX21hcHBpbmdzKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9u
ZyAKPj4gZSwgdW5zaWduZWQgaW50IG5mKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbDJlX3dyaXRlX2F0b21pYyhwbDJlLCBsMmVfZnJvbV9tZm4obWZuLAo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgX19QQUdFX0hZUEVSVklTT1IpKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFVOTUFQX1hFTl9QQUdFVEFCTEUobDF0KTsKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGwxdCA9IE5VTEw7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGlmICggbG9ja2luZyApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwo+PiBkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi92bWFwLmMgYi94ZW4vY29tbW9uL3ZtYXAuYwo+PiBpbmRleCBmYWViYzFkZGYxLi5mY2Ri
ODQ5NWM4IDEwMDY0NAo+PiAtLS0gYS94ZW4vY29tbW9uL3ZtYXAuYwo+PiArKysgYi94ZW4vY29t
bW9uL3ZtYXAuYwo+PiBAQCAtMTksNiArMTksMTkgQEAgc3RhdGljIHVuc2lnbmVkIGludCBfX3Jl
YWRfbW9zdGx5IHZtX2VuZFtWTUFQX1JFR0lPTl9OUl07Cj4+IMKgIC8qIGxvd2VzdCBrbm93biBj
bGVhciBiaXQgaW4gdGhlIGJpdG1hcCAqLwo+PiDCoCBzdGF0aWMgdW5zaWduZWQgaW50IHZtX2xv
d1tWTUFQX1JFR0lPTl9OUl07Cj4+ICttZm5fdCB2bWFwX3RvX21mbih2b2lkICp2YSkKPj4gK3sK
Pj4gK8KgwqDCoCBsMV9wZ2VudHJ5X3QgKnBsMWUgPSB2aXJ0X3RvX3hlbl9sMWUoKHVuc2lnbmVk
IGxvbmcpKHZhKSk7Cj4+ICvCoMKgwqAgbWZuX3QgcmV0ID0gX21mbihsMWVfZ2V0X3BmbigqcGwx
ZSkpOwo+IAo+IFdlIGFscmVhZHkKPiAKPj4gK8KgwqDCoCB1bm1hcF94ZW5fcGFnZXRhYmxlKHBs
MWUpOwo+IAo+IE15IGtub3dsZWRnZSBvZiB0aGUgeDg2IHBvcnQgaXMgcXVpdGUgbGltaXRlZCwg
YnV0IHRoaXMgZmVlbHMgc3VzcGljaW91cyB0byBzZWUgCj4gYW4gdW5tYXAgaW4gYSBmdW5jdGlv
biBjYWxsIHZtYXBfdG9fbWZuKCkuIFdoZXJlIGRvZXMgaXMgdGhlIG1hcCBkb25lPwo+IAo+IEZ1
cnRoZXJtb3JlLCB0aGlzIGlzIG5vdCBnb2luZyB0byBjb21waWxlIG9uIEFybS4gWW91IHByb2Jh
Ymx5IHdhbnQgdG8gCj4gaW1wbGVtZW50IHRoaXMgZnVuY3Rpb24gaW4geDg2IGNvZGUgYW5kIGtl
ZXAgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gZm9yIEFybS4KPiAKCldpdGhvdXQgdGhlIGRp
cmVjdCBtYXAsIFhlbiBwYWdlIHRhYmxlcyBhcmUgYWNjZXNzZWQgYWZ0ZXIgbWFwcGluZyB0aGVt
IGludG8gCnRoZSBhZGRyZXNzIHNwYWNlIHdpdGggbWFwX2RvbWFpbl9wYWdlKCksIGFuZCB1bm1h
cHBlZCB3aGVuIGRvbmUuIFRvIHJlYWQgdGhlIApsMWUgZm9yIHRoZSB2bWFwLCB0aGUgcGFnZSB0
aGUgbDFlIGlzIGluIGlzIGZpcnN0IG1hcHBlZCwgdGhlbiB0aGUgbWZuIGlzIHJlYWQsIAp0aGVu
IHRoZSBwYWdlIGlzIHVubWFwcGVkLgoKVGhpcyBzZXJpZXMgaXMgYmFzZWQgb24gNjAgcGF0Y2hl
cyBmcm9tIFdlaSwgc28gaGUgbWlnaHQgYWxzbyBiZSBhYmxlIHRvIApjb21tZW50IG1vcmUgb24g
dGhlIGRldGFpbHMuCgo+PiArwqDCoMKgIHJldHVybiByZXQ7Cj4+ICt9Cj4+ICsKPj4gK3N0cnVj
dCBwYWdlX2luZm8gKnZtYXBfdG9fcGFnZSh2b2lkICp2YSkKPj4gK3sKPj4gK8KgwqDCoCByZXR1
cm4gbWZuX3RvX3BhZ2Uodm1hcF90b19tZm4odmEpKTsKPj4gK30KPiAKPiBUaGlzIGlzIHRoZSBl
eGFjdCBzYW1lIGltcGxlbWVudGF0aW9uIGFzIGluIG1tLmguIFNvIHdoYXQncyB0aGUgYWR2YW50
YWdlIG9mIHRoaXM/Cj4gCgpJIGFncmVlLiBUaGlzIGNhbiBqdXN0IGJlIGEgbWFjcm8uCgpIb25n
eWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
