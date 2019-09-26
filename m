Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0468EBF365
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 14:53:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTEt-0003C5-GK; Thu, 26 Sep 2019 12:51:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDTEs-0003C0-5U
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 12:51:18 +0000
X-Inumbo-ID: 53e9f3a6-e05c-11e9-9651-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 53e9f3a6-e05c-11e9-9651-12813bfff9fa;
 Thu, 26 Sep 2019 12:51:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0FA5142F;
 Thu, 26 Sep 2019 05:51:15 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D48363F763;
 Thu, 26 Sep 2019 05:51:12 -0700 (PDT)
To: hongyax@amazon.com, xen-devel@lists.xenproject.org
References: <cover.1569489002.git.hongyax@amazon.com>
 <96f10f9693fdc795152a7f24c6df65f7f345b0f4.1569489002.git.hongyax@amazon.com>
 <3d7f6e45-4c62-b314-7110-2e998bcdddcc@arm.com>
 <1066155a-a378-c8a8-893b-159d96962c8e@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b864d695-5c48-ddd2-79fc-e8925757842d@arm.com>
Date: Thu, 26 Sep 2019 13:51:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1066155a-a378-c8a8-893b-159d96962c8e@amazon.com>
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

SGksCgpPbiA5LzI2LzE5IDE6MzYgUE0sIGhvbmd5YXhAYW1hem9uLmNvbSB3cm90ZToKPiBPbiAy
Ni8wOS8yMDE5IDEyOjIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiDCoEZyb20g
dGhlIHRpdGxlLCB0aGlzIHBhdGNoIGlzIGRvaW5nIHR3byB0aGluZ3M6Cj4+IMKgwqDCoCAxKSBN
YXAgYm9vdG1lbV9yZWdpb25fbGlzdAo+PiDCoMKgwqAgMikgRml4IGRvdWJsZSB1bm1hcCBidWcK
Pj4KPj4gSXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIGhvdyB0aGUgbGF0dGVyIGlzIHJlbGF0ZWQg
dG8gdGhlIGZvcm1lci4gQ2FuIAo+PiB5b3UgZXhwbGFpbiBpdD8KPiAKPiBBY3R1YWxseSB0aGV5
IGFyZSBub3QgcmVsYXRlZC4gVGhlIHNlY29uZCBvbmUgc2hvdWxkIHByb2JhYmx5IGJlIAo+IHNx
dWFzaGVkIGludG8gc29tZSBvdGhlciBwYXRjaC4KPiAKPj4KPj4gT24gOS8yNi8xOSAxMDo0NiBB
TSwgaG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+Pj4gRnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5
YXhAYW1hem9uLmNvbT4KPj4KPj4gUGxlYXNlIHByb3ZpZGUgYSBjb21taXQgbWVzc2FnZSBkZXNj
cmlwdGlvbi4KPj4KPiAKPiBUaGUgZGVzY3JpcHRpb24gaXMganVzdCBhIG9uZS1saW5lciBpbiB0
aGUgc3ViamVjdC4gU2hvdWxkIGJlIHRoZXJlIHdoZW4gCj4geW91IGltcG9ydCB0aGlzIHBhdGNo
LgoKSSBhbSBhZnJhaWQgdGhpcyBpcyBub3QgZW5vdWdoIHRvIHVuZGVyc3RhbmQgdGhlIHBhdGNo
LiBZb3Ugc2hvdWxkIApleHBsYWluIGluIHRoZSBwYXRjaCB5b3UgbmVlZCBpdC4uLgoKPiAKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBIb25neWFuIFhpYSA8aG9uZ3lheEBhbWF6b24uY29tPgo+Pj4g
LS0tCj4+PiDCoCB4ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jIHzCoCAyICstCj4+PiDCoCB4
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuY8KgwqDCoMKgwqAgfCAxMiArKysrKysrKysrLS0KPj4+IMKg
IDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4
Ni9wdi9kb20wX2J1aWxkLmMKPj4+IGluZGV4IDIwMmVkY2FhMTcuLjE1NTVhNjFiODQgMTAwNjQ0
Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCj4+PiArKysgYi94ZW4vYXJj
aC94ODYvcHYvZG9tMF9idWlsZC5jCj4+PiBAQCAtMjM2LDcgKzIzNiw3IEBAIHN0YXRpYyBfX2lu
aXQgdm9pZCBzZXR1cF9wdl9waHlzbWFwKHN0cnVjdCBkb21haW4gCj4+PiAqZCwgdW5zaWduZWQg
bG9uZyBwZ3RibF9wZm4sCj4+PiDCoMKgwqDCoMKgIGlmICggcGwzZSApCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgdW5tYXBfZG9tYWluX3BhZ2UocGwzZSk7Cj4+PiAtwqDCoMKgIHVubWFwX2RvbWFp
bl9wYWdlKGw0c3RhcnQpOwo+Pj4gK8KgwqDCoCAvL3VubWFwX2RvbWFpbl9wYWdlKGw0c3RhcnQp
Owo+Pgo+PiBJIGd1ZXNzIHlvdSB3YW50ZWQgdG8gcmVtb3ZlIGl0IGNvbXBsZXRlbHkgYW5kIG5v
dCBjb21tZW50IGl0Pwo+Pgo+IAo+IFRoYW5rcy4gV2lsbCBmaXguCj4gCj4+PiDCoCB9Cj4+PiDC
oCBzdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqIF9faW5pdCBhbGxvY19jaHVuayhzdHJ1Y3QgZG9t
YWluICpkLAo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGIveGVuL2Nv
bW1vbi9wYWdlX2FsbG9jLmMKPj4+IGluZGV4IGRlZWVhYzA2NWMuLjZhY2MxYzc4YTQgMTAwNjQ0
Cj4+PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+Pj4gKysrIGIveGVuL2NvbW1vbi9w
YWdlX2FsbG9jLmMKPj4+IEBAIC0yNDcsNiArMjQ3LDcgQEAgbWZuX3QgZmlyc3RfdmFsaWRfbWZu
ID0gSU5WQUxJRF9NRk5fSU5JVElBTElaRVI7Cj4+PiDCoCBzdGF0aWMgc3RydWN0IGJvb3RtZW1f
cmVnaW9uIHsKPj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyBzLCBlOyAvKiBNRk5zIEBzIHRo
cm91Z2ggQGUtMSBpbmNsdXNpdmUgYXJlIGZyZWUgKi8KPj4+IMKgIH0gKl9faW5pdGRhdGEgYm9v
dG1lbV9yZWdpb25fbGlzdDsKPj4+ICtzdHJ1Y3QgcGFnZV9pbmZvICpib290bWVtX3JlZ2lvbl9s
aXN0X3BnOwo+Pgo+PiBJIGd1ZXNzIHRoaXMgc2hvdWxkIGJlIHN0YXRpYy4gQnV0Li4uCj4+Cj4g
Cj4gWWVzLgo+IAo+Pj4gwqAgc3RhdGljIHVuc2lnbmVkIGludCBfX2luaXRkYXRhIG5yX2Jvb3Rt
ZW1fcmVnaW9uczsKPj4+IMKgIHN0cnVjdCBzY3J1Yl9yZWdpb24gewo+Pj4gQEAgLTI2NCw3ICsy
NjUsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGJvb3RtZW1fcmVnaW9uX2FkZCh1bnNpZ25lZCAK
Pj4+IGxvbmcgcywgdW5zaWduZWQgbG9uZyBlKQo+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQg
aTsKPj4+IMKgwqDCoMKgwqAgaWYgKCAoYm9vdG1lbV9yZWdpb25fbGlzdCA9PSBOVUxMKSAmJiAo
cyA8IGUpICkKPj4+IC3CoMKgwqDCoMKgwqDCoCBib290bWVtX3JlZ2lvbl9saXN0ID0gbWZuX3Rv
X3ZpcnQocysrKTsKPj4+ICvCoMKgwqAgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGJvb3RtZW1fcmVn
aW9uX2xpc3RfcGcgPSBtZm5fdG9fcGFnZShfbWZuKHMpKTsKPj4KPj4gLi4uIGF0IGxlYXN0IG9u
IEFybSwgdGhlIGZyYW1ldGFibGUgaXMgYWxsb2NhdGVkIGFmdGVyIHRoZSBib290IAo+PiBhbGxv
Y2F0b3IgaGFzIGJlZW4gaW5pdGlhbGl6ZWQuIFNvIG1mbl90b19wYWdlKCkgd2lsbCBub3Qgd29y
ayAKPj4gcHJvcGVybHkgaGVyZS4KPj4KPiAKPiBJdCB3b3JrcyBiZWNhdXNlIHRoZSBib290bWVt
X3JlZ2lvbl9saXN0X3BnIGlzIG9ubHkgYWNjZXNzZWQgbGF0ZXIgaW4gCj4gZW5kX2Jvb3RfYWxs
b2NhdG9yKCkgd2hlbiB0aGUgZnJhbWV0YWJsZSBoYXMgYmVlbiBpbml0aWFsaXNlZC4gVGhpcyBw
ZyAKPiBpcyBqdXN0IHRvIHJlbWVtYmVyIHdoYXQgdGhlIHBnIHdpbGwgYmUgd2hlbiB0aGUgZnJh
bWV0YWJsZSBpcyByZWFkeS4gT2YgCj4gY291cnNlLCB0byBhdm9pZCBjb25mdXNpb24sIEkgY291
bGQga2VlcCB0aGUgYm9vdG1lbV9yZWdpb25fbGlzdF9tZm4gYW5kIAo+IG9ubHkgY29udmVydCB0
byBwZyBsYXRlciBpbiBlbmRfYm9vdF9hbGxvY2F0b3IoKS4KClRoaXMgb25seSB3b3JrcyBiZWNh
dXNlIG1mbl90b19wYWdlKCkgZG9lcyBub3QgZGVwZW5kIG9uIGFueXRoaW5nIAppbml0aWFsaXpl
ZCBhZnRlcndhcmRzIGZvciB4ODYuIFRoaXMgaXMgbm90IHRydWUgb24gQXJtIGJlY2F1c2UgdGhl
IApoZWxwZXIgZGVwZW5kcyBvbiBmcmFtZXRhYmxlX2Jhc2VfcGR4IHdoaWNoIGlzIG5vdCBpbml0
aWFsaXplZCB1bnRpbCAKc2V0dXBfZnJhbWV0YWJsZV9tYXBwaW5ncygpIGlzIGNhbGxlZC4KClNv
IHlvdSB3aWxsIGhhdmUgdGhlIHdyb25nIHBvaW50ZXIgdG8gdGhlIHBhZ2UuCgo+IC4gCj4+PiAr
wqDCoMKgwqDCoMKgwqAgYm9vdG1lbV9yZWdpb25fbGlzdCA9IG1hcF9kb21haW5fcGFnZShfbWZu
KHMpKTsKPj4KPj4gU28gSSB3b3VsZCBzdWdnZXN0IHRvIGxvb2sgYXQgc3RhdGljYWxseSBhbGxv
Y2F0aW5nIHRoZSAKPj4gYm9vdG1lbV9yZWdpb25fbGlzdC4gVGhpcyB3YXMgYWN0dWFsbHkgZGlz
Y3Vzc2VkIHJlY2VudGx5IGFzIHBhcnQgb2YgCj4+IG9uLWdvaW5nIHByb2JsZW0gd2l0aCBBcm0z
MiAoc2VlIFsxXSkuCj4+Cj4gCj4gQWN0dWFsbHkgdGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNl
cyBQTUFQIGluZnJhc3RydWN0dXJlIGZvciB4ODYsIHNvIAo+IHRoaXMgbWFwX2RvbWFpbl9wYWdl
KCkgd29ya3MuIEl0IGNlcnRhaW5seSB3b24ndCB3b3JrIGZvciBBUk0gdGhvdWdoIAo+IHdpdGhv
dXQgYWxzbyBpbnRyb2R1Y2luZyBQTUFQLgoKV2VsbCwgbWFwX2RvbWFpbl9wYWdlKCkgaXMgbWVh
bnQgdG8gYmUgdXNlZCBmb3IgZG9tYWluIGhlYXAgcGFnZS4KCkF0IHRoZSBtb21lbnQsIHRoZSBi
b290IGFsbG9jYXRvciByZXF1aXJlcyBhIHhlbmhlYXAgcGFnZSBvbiB0aGUgZmlyc3QgCmNhbGwu
IFNvIElITU8sIHlvdSBhcmUgYmUgbWlzdXNpbmcgdGhlIGZ1bmN0aW9uLgoKSGVuY2UsIEkgc3Ry
b25nbHkgdGhpbmsgdGhlIHN0YXRpYyBhbGxvY2F0aW9uIGlzIHRoZSBiZXN0IGhlcmUuCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
