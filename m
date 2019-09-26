Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3A9BF321
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 14:39:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDT0V-0000wz-8p; Thu, 26 Sep 2019 12:36:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDT0T-0000wu-Qc
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 12:36:25 +0000
X-Inumbo-ID: 41024f1a-e05a-11e9-97fb-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 41024f1a-e05a-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569501384; x=1601037384;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=06m0DaqEGtMzxpwiJ5gVnP10LzRqjnNQwsbrk0M8Qt8=;
 b=ReKcB7dNPce7lb7C5DVl2MiUrLF4/dHL5c0dHZ8jdl+dNSSHZekat5sB
 EOIn1KOoNF4SYPhFjh9BjEZoCpKe0tVYtHGA2whVakdMZdd2RQb2xgK3q
 be8AH3x/3mppmga0/TCQv5YkbVTEagemNy7AKoK7gaX7vlwMTJIAln+Ei c=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="753381302"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 26 Sep 2019 12:36:23 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id A07B4A00C7; Thu, 26 Sep 2019 12:36:20 +0000 (UTC)
Received: from EX13D11UEE001.ant.amazon.com (10.43.62.132) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 12:36:20 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D11UEE001.ant.amazon.com (10.43.62.132) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 12:36:20 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 12:36:18 +0000
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <96f10f9693fdc795152a7f24c6df65f7f345b0f4.1569489002.git.hongyax@amazon.com>
 <3d7f6e45-4c62-b314-7110-2e998bcdddcc@arm.com>
From: <hongyax@amazon.com>
Message-ID: <1066155a-a378-c8a8-893b-159d96962c8e@amazon.com>
Date: Thu, 26 Sep 2019 13:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3d7f6e45-4c62-b314-7110-2e998bcdddcc@arm.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 79/84] Don't assume bootmem_region_list
 is mapped. Also fix a double unmap bug.
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxMjoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+ICBGcm9t
IHRoZSB0aXRsZSwgdGhpcyBwYXRjaCBpcyBkb2luZyB0d28gdGhpbmdzOgo+ICDCoMKgIDEpIE1h
cCBib290bWVtX3JlZ2lvbl9saXN0Cj4gIMKgwqAgMikgRml4IGRvdWJsZSB1bm1hcCBidWcKPiAK
PiBJdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgaG93IHRoZSBsYXR0ZXIgaXMgcmVsYXRlZCB0byB0
aGUgZm9ybWVyLiBDYW4geW91IAo+IGV4cGxhaW4gaXQ/CgpBY3R1YWxseSB0aGV5IGFyZSBub3Qg
cmVsYXRlZC4gVGhlIHNlY29uZCBvbmUgc2hvdWxkIHByb2JhYmx5IGJlIHNxdWFzaGVkIGludG8g
CnNvbWUgb3RoZXIgcGF0Y2guCgo+IAo+IE9uIDkvMjYvMTkgMTA6NDYgQU0sIGhvbmd5YXhAYW1h
em9uLmNvbSB3cm90ZToKPj4gRnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4K
PiAKPiBQbGVhc2UgcHJvdmlkZSBhIGNvbW1pdCBtZXNzYWdlIGRlc2NyaXB0aW9uLgo+IAoKVGhl
IGRlc2NyaXB0aW9uIGlzIGp1c3QgYSBvbmUtbGluZXIgaW4gdGhlIHN1YmplY3QuIFNob3VsZCBi
ZSB0aGVyZSB3aGVuIHlvdSAKaW1wb3J0IHRoaXMgcGF0Y2guCgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBIb25neWFuIFhpYSA8aG9uZ3lheEBhbWF6b24uY29tPgo+PiAtLS0KPj4gwqAgeGVuL2FyY2gv
eDg2L3B2L2RvbTBfYnVpbGQuYyB8wqAgMiArLQo+PiDCoCB4ZW4vY29tbW9uL3BhZ2VfYWxsb2Mu
Y8KgwqDCoMKgwqAgfCAxMiArKysrKysrKysrLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3B2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMKPj4gaW5k
ZXggMjAyZWRjYWExNy4uMTU1NWE2MWI4NCAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L3B2
L2RvbTBfYnVpbGQuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvcHYvZG9tMF9idWlsZC5jCj4+IEBA
IC0yMzYsNyArMjM2LDcgQEAgc3RhdGljIF9faW5pdCB2b2lkIHNldHVwX3B2X3BoeXNtYXAoc3Ry
dWN0IGRvbWFpbiAqZCwgCj4+IHVuc2lnbmVkIGxvbmcgcGd0YmxfcGZuLAo+PiDCoMKgwqDCoMKg
IGlmICggcGwzZSApCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB1bm1hcF9kb21haW5fcGFnZShwbDNl
KTsKPj4gLcKgwqDCoCB1bm1hcF9kb21haW5fcGFnZShsNHN0YXJ0KTsKPj4gK8KgwqDCoCAvL3Vu
bWFwX2RvbWFpbl9wYWdlKGw0c3RhcnQpOwo+IAo+IEkgZ3Vlc3MgeW91IHdhbnRlZCB0byByZW1v
dmUgaXQgY29tcGxldGVseSBhbmQgbm90IGNvbW1lbnQgaXQ/Cj4gCgpUaGFua3MuIFdpbGwgZml4
LgoKPj4gwqAgfQo+PiDCoCBzdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyAqIF9faW5pdCBhbGxvY19j
aHVuayhzdHJ1Y3QgZG9tYWluICpkLAo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdlX2Fs
bG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+PiBpbmRleCBkZWVlYWMwNjVjLi42YWNj
MWM3OGE0IDEwMDY0NAo+PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+PiArKysgYi94
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+PiBAQCAtMjQ3LDYgKzI0Nyw3IEBAIG1mbl90IGZpcnN0
X3ZhbGlkX21mbiA9IElOVkFMSURfTUZOX0lOSVRJQUxJWkVSOwo+PiDCoCBzdGF0aWMgc3RydWN0
IGJvb3RtZW1fcmVnaW9uIHsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHMsIGU7IC8qIE1G
TnMgQHMgdGhyb3VnaCBAZS0xIGluY2x1c2l2ZSBhcmUgZnJlZSAqLwo+PiDCoCB9ICpfX2luaXRk
YXRhIGJvb3RtZW1fcmVnaW9uX2xpc3Q7Cj4+ICtzdHJ1Y3QgcGFnZV9pbmZvICpib290bWVtX3Jl
Z2lvbl9saXN0X3BnOwo+IAo+IEkgZ3Vlc3MgdGhpcyBzaG91bGQgYmUgc3RhdGljLiBCdXQuLi4K
PiAKClllcy4KCj4+IMKgIHN0YXRpYyB1bnNpZ25lZCBpbnQgX19pbml0ZGF0YSBucl9ib290bWVt
X3JlZ2lvbnM7Cj4+IMKgIHN0cnVjdCBzY3J1Yl9yZWdpb24gewo+PiBAQCAtMjY0LDcgKzI2NSwx
MSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYm9vdG1lbV9yZWdpb25fYWRkKHVuc2lnbmVkIGxvbmcg
cywgCj4+IHVuc2lnbmVkIGxvbmcgZSkKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgaTsKPj4g
wqDCoMKgwqDCoCBpZiAoIChib290bWVtX3JlZ2lvbl9saXN0ID09IE5VTEwpICYmIChzIDwgZSkg
KQo+PiAtwqDCoMKgwqDCoMKgwqAgYm9vdG1lbV9yZWdpb25fbGlzdCA9IG1mbl90b192aXJ0KHMr
Kyk7Cj4+ICvCoMKgwqAgewo+PiArwqDCoMKgwqDCoMKgwqAgYm9vdG1lbV9yZWdpb25fbGlzdF9w
ZyA9IG1mbl90b19wYWdlKF9tZm4ocykpOwo+IAo+IC4uLiBhdCBsZWFzdCBvbiBBcm0sIHRoZSBm
cmFtZXRhYmxlIGlzIGFsbG9jYXRlZCBhZnRlciB0aGUgYm9vdCBhbGxvY2F0b3IgaGFzIAo+IGJl
ZW4gaW5pdGlhbGl6ZWQuIFNvIG1mbl90b19wYWdlKCkgd2lsbCBub3Qgd29yayBwcm9wZXJseSBo
ZXJlLgo+IAoKSXQgd29ya3MgYmVjYXVzZSB0aGUgYm9vdG1lbV9yZWdpb25fbGlzdF9wZyBpcyBv
bmx5IGFjY2Vzc2VkIGxhdGVyIGluIAplbmRfYm9vdF9hbGxvY2F0b3IoKSB3aGVuIHRoZSBmcmFt
ZXRhYmxlIGhhcyBiZWVuIGluaXRpYWxpc2VkLiBUaGlzIHBnIGlzIGp1c3QgCnRvIHJlbWVtYmVy
IHdoYXQgdGhlIHBnIHdpbGwgYmUgd2hlbiB0aGUgZnJhbWV0YWJsZSBpcyByZWFkeS4gT2YgY291
cnNlLCB0byAKYXZvaWQgY29uZnVzaW9uLCBJIGNvdWxkIGtlZXAgdGhlIGJvb3RtZW1fcmVnaW9u
X2xpc3RfbWZuIGFuZCBvbmx5IGNvbnZlcnQgdG8gCnBnIGxhdGVyIGluIGVuZF9ib290X2FsbG9j
YXRvcigpLgoKPj4gK8KgwqDCoMKgwqDCoMKgIGJvb3RtZW1fcmVnaW9uX2xpc3QgPSBtYXBfZG9t
YWluX3BhZ2UoX21mbihzKSk7Cj4gCj4gU28gSSB3b3VsZCBzdWdnZXN0IHRvIGxvb2sgYXQgc3Rh
dGljYWxseSBhbGxvY2F0aW5nIHRoZSBib290bWVtX3JlZ2lvbl9saXN0LiAKPiBUaGlzIHdhcyBh
Y3R1YWxseSBkaXNjdXNzZWQgcmVjZW50bHkgYXMgcGFydCBvZiBvbi1nb2luZyBwcm9ibGVtIHdp
dGggQXJtMzIgCj4gKHNlZSBbMV0pLgo+IAoKQWN0dWFsbHkgdGhpcyBwYXRjaCBzZXJpZXMgaW50
cm9kdWNlcyBQTUFQIGluZnJhc3RydWN0dXJlIGZvciB4ODYsIHNvIHRoaXMgCm1hcF9kb21haW5f
cGFnZSgpIHdvcmtzLiBJdCBjZXJ0YWlubHkgd29uJ3Qgd29yayBmb3IgQVJNIHRob3VnaCB3aXRo
b3V0IGFsc28gCmludHJvZHVjaW5nIFBNQVAuCgpIb25neWFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
