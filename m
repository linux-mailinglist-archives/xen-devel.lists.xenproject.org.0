Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65BCBF13A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 13:24:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRqP-0000O7-2A; Thu, 26 Sep 2019 11:21:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDRqN-0000NL-Cu
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 11:21:55 +0000
X-Inumbo-ID: d7d6888a-e04f-11e9-9650-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id d7d6888a-e04f-11e9-9650-12813bfff9fa;
 Thu, 26 Sep 2019 11:21:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4F28142F;
 Thu, 26 Sep 2019 04:21:53 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D33E23F67D;
 Thu, 26 Sep 2019 04:21:50 -0700 (PDT)
To: hongyax@amazon.com, xen-devel@lists.xenproject.org
References: <cover.1569489002.git.hongyax@amazon.com>
 <96f10f9693fdc795152a7f24c6df65f7f345b0f4.1569489002.git.hongyax@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3d7f6e45-4c62-b314-7110-2e998bcdddcc@arm.com>
Date: Thu, 26 Sep 2019 12:21:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <96f10f9693fdc795152a7f24c6df65f7f345b0f4.1569489002.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 79/84] Don't assume bootmem_region_list
 is mapped. Also fix a double unmap bug.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgogRnJvbSB0aGUgdGl0bGUsIHRoaXMgcGF0Y2ggaXMgZG9pbmcgdHdvIHRoaW5nczoKICAg
IDEpIE1hcCBib290bWVtX3JlZ2lvbl9saXN0CiAgICAyKSBGaXggZG91YmxlIHVubWFwIGJ1ZwoK
SXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIGhvdyB0aGUgbGF0dGVyIGlzIHJlbGF0ZWQgdG8gdGhl
IGZvcm1lci4gQ2FuIAp5b3UgZXhwbGFpbiBpdD8KCk9uIDkvMjYvMTkgMTA6NDYgQU0sIGhvbmd5
YXhAYW1hem9uLmNvbSB3cm90ZToKPiBGcm9tOiBIb25neWFuIFhpYSA8aG9uZ3lheEBhbWF6b24u
Y29tPgoKUGxlYXNlIHByb3ZpZGUgYSBjb21taXQgbWVzc2FnZSBkZXNjcmlwdGlvbi4KCj4gCj4g
U2lnbmVkLW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KPiAtLS0KPiAg
IHhlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgfCAgMiArLQo+ICAgeGVuL2NvbW1vbi9wYWdl
X2FsbG9jLmMgICAgICB8IDEyICsrKysrKysrKystLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvcHYvZG9tMF9idWlsZC5jIGIveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYwo+IGluZGV4
IDIwMmVkY2FhMTcuLjE1NTVhNjFiODQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3B2L2Rv
bTBfYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKPiBAQCAtMjM2
LDcgKzIzNiw3IEBAIHN0YXRpYyBfX2luaXQgdm9pZCBzZXR1cF9wdl9waHlzbWFwKHN0cnVjdCBk
b21haW4gKmQsIHVuc2lnbmVkIGxvbmcgcGd0YmxfcGZuLAo+ICAgICAgIGlmICggcGwzZSApCj4g
ICAgICAgICAgIHVubWFwX2RvbWFpbl9wYWdlKHBsM2UpOwo+ICAgCj4gLSAgICB1bm1hcF9kb21h
aW5fcGFnZShsNHN0YXJ0KTsKPiArICAgIC8vdW5tYXBfZG9tYWluX3BhZ2UobDRzdGFydCk7CgpJ
IGd1ZXNzIHlvdSB3YW50ZWQgdG8gcmVtb3ZlIGl0IGNvbXBsZXRlbHkgYW5kIG5vdCBjb21tZW50
IGl0PwoKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHN0cnVjdCBwYWdlX2luZm8gKiBfX2luaXQgYWxs
b2NfY2h1bmsoc3RydWN0IGRvbWFpbiAqZCwKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdl
X2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+IGluZGV4IGRlZWVhYzA2NWMuLjZh
Y2MxYzc4YTQgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiArKysgYi94
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+IEBAIC0yNDcsNiArMjQ3LDcgQEAgbWZuX3QgZmlyc3Rf
dmFsaWRfbWZuID0gSU5WQUxJRF9NRk5fSU5JVElBTElaRVI7Cj4gICBzdGF0aWMgc3RydWN0IGJv
b3RtZW1fcmVnaW9uIHsKPiAgICAgICB1bnNpZ25lZCBsb25nIHMsIGU7IC8qIE1GTnMgQHMgdGhy
b3VnaCBAZS0xIGluY2x1c2l2ZSBhcmUgZnJlZSAqLwo+ICAgfSAqX19pbml0ZGF0YSBib290bWVt
X3JlZ2lvbl9saXN0Owo+ICtzdHJ1Y3QgcGFnZV9pbmZvICpib290bWVtX3JlZ2lvbl9saXN0X3Bn
OwoKSSBndWVzcyB0aGlzIHNob3VsZCBiZSBzdGF0aWMuIEJ1dC4uLgoKPiAgIHN0YXRpYyB1bnNp
Z25lZCBpbnQgX19pbml0ZGF0YSBucl9ib290bWVtX3JlZ2lvbnM7Cj4gICAKPiAgIHN0cnVjdCBz
Y3J1Yl9yZWdpb24gewo+IEBAIC0yNjQsNyArMjY1LDExIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBi
b290bWVtX3JlZ2lvbl9hZGQodW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUpCj4gICAg
ICAgdW5zaWduZWQgaW50IGk7Cj4gICAKPiAgICAgICBpZiAoIChib290bWVtX3JlZ2lvbl9saXN0
ID09IE5VTEwpICYmIChzIDwgZSkgKQo+IC0gICAgICAgIGJvb3RtZW1fcmVnaW9uX2xpc3QgPSBt
Zm5fdG9fdmlydChzKyspOwo+ICsgICAgewo+ICsgICAgICAgIGJvb3RtZW1fcmVnaW9uX2xpc3Rf
cGcgPSBtZm5fdG9fcGFnZShfbWZuKHMpKTsKCi4uLiBhdCBsZWFzdCBvbiBBcm0sIHRoZSBmcmFt
ZXRhYmxlIGlzIGFsbG9jYXRlZCBhZnRlciB0aGUgYm9vdCAKYWxsb2NhdG9yIGhhcyBiZWVuIGlu
aXRpYWxpemVkLiBTbyBtZm5fdG9fcGFnZSgpIHdpbGwgbm90IHdvcmsgcHJvcGVybHkgCmhlcmUu
Cgo+ICsgICAgICAgIGJvb3RtZW1fcmVnaW9uX2xpc3QgPSBtYXBfZG9tYWluX3BhZ2UoX21mbihz
KSk7CgpTbyBJIHdvdWxkIHN1Z2dlc3QgdG8gbG9vayBhdCBzdGF0aWNhbGx5IGFsbG9jYXRpbmcg
dGhlIApib290bWVtX3JlZ2lvbl9saXN0LiBUaGlzIHdhcyBhY3R1YWxseSBkaXNjdXNzZWQgcmVj
ZW50bHkgYXMgcGFydCBvZiAKb24tZ29pbmcgcHJvYmxlbSB3aXRoIEFybTMyIChzZWUgWzFdKS4K
CkkgYW0gcGxhbm5pbmcgdG8gaGF2ZSBhIGxvb2sgYWZ0ZXIgSSBmaW5pc2ggc29tZSBpbXBvcnRh
bnQgYnVnIGZpeGVzIGZvciAKWGVuIDQuMTMuIEJ1dCBmZWVsIGZyZWUgdG8gaGF2ZSBhIGxvb2su
Cgo+ICsgICAgICAgIHMrKzsKPiArICAgIH0KPiAgIAo+ICAgICAgIGlmICggcyA+PSBlICkKPiAg
ICAgICAgICAgcmV0dXJuOwo+IEBAIC0xODY5LDcgKzE4NzQsMTAgQEAgdm9pZCBfX2luaXQgZW5k
X2Jvb3RfYWxsb2NhdG9yKHZvaWQpCj4gICAgICAgICAgICAgICBpbml0X2hlYXBfcGFnZXMobWZu
X3RvX3BhZ2UoX21mbihyLT5zKSksIHItPmUgLSByLT5zKTsKPiAgICAgICB9Cj4gICAgICAgbnJf
Ym9vdG1lbV9yZWdpb25zID0gMDsKPiAtICAgIGluaXRfaGVhcF9wYWdlcyh2aXJ0X3RvX3BhZ2Uo
Ym9vdG1lbV9yZWdpb25fbGlzdCksIDEpOwo+ICsgICAgaW5pdF9oZWFwX3BhZ2VzKGJvb3RtZW1f
cmVnaW9uX2xpc3RfcGcsIDEpOwo+ICsgICAgLyogUmVtZW1iZXIgdG8gZGlzY2FyZCB0aGUgbWFw
cGluZyBmb3IgYm9vdG1lbV9yZWdpb25fbGlzdC4gKi8KPiArICAgIHVubWFwX2RvbWFpbl9wYWdl
KGJvb3RtZW1fcmVnaW9uX2xpc3QpOwo+ICsgICAgZmx1c2hfdGxiX29uZV9sb2NhbChib290bWVt
X3JlZ2lvbl9saXN0KTsKPiAgIAo+ICAgICAgIGlmICggIWRtYV9iaXRzaXplICYmIChudW1fb25s
aW5lX25vZGVzKCkgPiAxKSApCj4gICAgICAgICAgIGRtYV9iaXRzaXplID0gYXJjaF9nZXRfZG1h
X2JpdHNpemUoKTsKPiAKCkNoZWVycywKClsxXSBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wOS9tc2cwMTQwNy5odG1sCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
