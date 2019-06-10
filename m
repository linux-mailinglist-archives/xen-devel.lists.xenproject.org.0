Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD8F3BDAA
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:43:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haR5p-0006ug-2b; Mon, 10 Jun 2019 20:40:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haR5n-0006uX-Hn
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:40:35 +0000
X-Inumbo-ID: fee02118-8bbf-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id fee02118-8bbf-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 20:40:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AAD3344;
 Mon, 10 Jun 2019 13:40:34 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 675673F73C;
 Mon, 10 Jun 2019 13:40:33 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1906041113220.14041@sstabellini-ThinkPad-T480s>
 <f2908fd8-f72f-fdc9-45c0-d0b09288b5f3@arm.com>
 <alpine.DEB.2.21.1906101322480.8691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ec030ed9-c44b-c476-866e-6c9c47def506@arm.com>
Date: Mon, 10 Jun 2019 21:40:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906101322480.8691@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 14/19] xen/arm32: mm:
 Avoid cleaning the cache for secondary CPUs page-tables
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlYW5vLAoKT24gNi8xMC8xOSA5OjI4IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gT24gV2VkLCA1IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDA1LzA2LzIw
MTkgMDA6MTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIFR1ZSwgMTQgTWF5IDIw
MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBUaGUgcGFnZS10YWJsZSB3YWxrZXIgaXMgY29u
ZmlndXJlZCB0byB1c2UgdGhlIHNhbWUgc2hhcmVhYmlsaXR5IGFuZAo+Pj4+IGNhY2hlYWJpbGl0
eSBhcyB0aGUgYWNjZXNzIHBlcmZvcm1lZCB3aGVuIHVwZGF0aW5nIHRoZSBwYWdlLXRhYmxlcy4g
VGhpcwo+Pj4+IG1lYW5zIGNsZWFuaW5nIHRoZSBjYWNoZSBmb3Igc2Vjb25kYXJ5IENQVXMgcnVu
dGltZSBwYWdlLXRhYmxlcyBpcwo+Pj4+IHVubmVjZXNzYXJ5Lgo+Pj4KPj4+IEFsbCByaWdodC4g
SXMgdGhlcmUgYW4gZXhwbGljaXQgY29uZmlndXJhdGlvbiBmb3IgdGhlIHNoYXJlYWJpbGl0eSBh
bmQKPj4+IGNhY2hlYWJpbGl0eSB1c2VkIGJ5IHRoZSBwYWdlLXRhYmxlIHdhbGtlciBvciBpcyBp
dCBzcGVjaWZpZWQgYXMgc3VjaCBpbgo+Pj4gdGhlIEFybSBBcm0/Cj4+Cj4+IFNlZSB0aGUgY29u
ZmlndXJhdGlvbiBvZiBUQ1JfRUwyLCBJIGNhbiBtZW50aW9uIGl0Lgo+ICAgCj4gVGhhdCB3b3Vs
ZCBiZSBuaWNlLiBJIGRvdWJsZS1jaGVja2VkIGFuZCBpdCBpcyBhcyB5b3Ugd3JvdGUuCgpTdXJl
LiBIb3cgYWJvdXQ6CgoiVGhlIHBhZ2UtdGFibGUgd2Fsa2VyIGlzIGNvbmZpZ3VyZWQgYnkgVENS
X0VMMiB0byB1c2Ugc2hhcmVhYmlsaXR5IGFuZCAKY2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3Mg
cGVyZm9ybWVkIHdoZW4gdXBkYXRpbmcgdGhlIHBhZ2UtdGFibGVzLiBbLi4uXSIKCj4gCj4gCj4+
PiBBbHNvLCBpc24ndCBpdCBwb3NzaWJsZSB0aGF0IENQVXMgb24gYSBkaWZmZXJlbnQgY2x1c3Rl
cgo+Pj4gKGJpZy5MSVRUTEUpIHdvdWxkIGhhdmUgaXNzdWVzIHdpdGggdGhpcyBpZiB0aGUgY2Fj
aGUgY291bGQgYmUgc3BsaXQKPj4+IGJldHdlZW4gdGhlIHR3byBjbHVzdGVycz8KPj4KPj4gSSBk
b24ndCB1bmRlcnN0YW5kIHRoaXMuLi4gQ2FjaGUgc2hvdWxkIGJlIGNvaGVyZW50IHdoZW4gYSBD
UFUgbGVhdmVzIEVMMy4KPj4gQnV0IHdlIGFscmVhZHkgc2hhcmUgc29tZSBiaXRzIG9mIHRoZSBw
YWdlIHRhYmxlcyBiZXR3ZWVuIHRoZSBwcm9jZXNzb3IgKHNlZQo+PiBjcmVhdGVfeGVuX3BhZ2Vf
dGFibGVzKS4gU28gSSBkb24ndCBzZWUgd2hlcmUgdGhlcmUgaXMgYSBwb3NzaWJsZSBwcm9ibGVt
Cj4+IGhlcmUuCj4gCj4gSWYgdGhlIGNhY2hlIGlzIGFsd2F5cyBjb2hlcmVudCBhY3Jvc3MgdGhl
IGNsdXN0ZXJzIGFuZCB0aGUKPiBwYWdldGFibGUtd2Fsa2VycyBvZiBkaWZmZXJlbnQgY2x1c3Rl
cnMsIHRoZW4gdGhpcyBpcyBmaW5lLgoKWGVuIChhbmQgTGludXgpIGJ1aWx0IG9uIHRoZSBhc3N1
bXB0aW9uIHRoYXQgYWxsIHRoZSBDUFVzIChhbmQgCnBhZ2UtdGFibGUgd2Fsa2VyKSBhcmUgaW4g
dGhlIHNhbWUgc2hhcmVhYmxlIGRvbWFpbiAoaS5lIAppbm5lcnNoYXJlYWJsZSkuIElmIHlvdSBo
YXZlIGEgcGxhdGZvcm0gd2hlcmUgaXQgaXMgbm90IHRoZSBjYXNlLCB0aGVuIApYZW4gaXMgZ29p
bmcgdG8gYmUgYmFkbHkgYnJva2VuLgoKVGhpcyBpcyBhbHNvIGlubGluZSB3aXRoIHRoZSBleHBl
Y3RhdGlvICBmcm9tIHRoZSBBcm0gQXJtIChCMi0xMjMgaW4gRERJIAowNDg3RC5hKToKCiJUaGUg
SW5uZXIgU2hhcmVhYmxlIGRvbWFpbiBpcyBleHBlY3RlZCB0byBiZSB0aGUgc2V0IG9mIFBFcyBj
b250cm9sbGVkIApieSBhIHNpbmdsZSBoeXBlcnZpc29yIG9yIG9wZXJhdGluZyBzeXN0ZW0uIgoK
RG8geW91IGhhdmUgYSBjYXNlIHdoZXJlIFhlbiBuZWVkcyB0byBydW4gb24gUEVzIGluIGRpZmZl
cmVudCBkb21haW5zPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
