Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDA1AACF3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 22:25:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5yG7-0000pl-R1; Thu, 05 Sep 2019 20:21:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/daD=XA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i5yG5-0000pe-U6
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 20:21:33 +0000
X-Inumbo-ID: c0495016-d01a-11e9-abda-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c0495016-d01a-11e9-abda-12813bfff9fa;
 Thu, 05 Sep 2019 20:21:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 554FE1000;
 Thu,  5 Sep 2019 13:21:32 -0700 (PDT)
Received: from [10.37.12.167] (unknown [10.37.12.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D4603F67D;
 Thu,  5 Sep 2019 13:21:29 -0700 (PDT)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-5-paul.durrant@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <32f4990a-5806-04b8-9bbe-6bdb232bf8e9@arm.com>
Date: Thu, 5 Sep 2019 21:21:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902145014.36442-5-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 4/6] remove late (on-demand) construction
 of IOMMU page tables
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzIvMTkgMzo1MCBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IGRpZmYgLS1naXQg
YS90b29scy9saWJ4bC9saWJ4bF9tZW0uYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCj4gaW5k
ZXggNDQ4YTJhZjhmZC4uZmQ2ZjMzMzEyZSAxMDA2NDQKPiAtLS0gYS90b29scy9saWJ4bC9saWJ4
bF9tZW0uYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX21lbS5jCj4gQEAgLTQ2MSwxNSArNDYx
LDE3IEBAIGludCBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkobGlieGxfY3R4ICpjdHgsCj4gICAg
ICAgaWYgKHJjKSBnb3RvIG91dDsKPiAgIAo+ICAgICAgICpuZWVkX21lbWtiID0gYl9pbmZvLT50
YXJnZXRfbWVta2I7Cj4gKyAgICAqbmVlZF9tZW1rYiArPSBiX2luZm8tPnNoYWRvd19tZW1rYiAr
IGJfaW5mby0+aW9tbXVfbWVta2I7CgpBRkFJQ1QsIGlvbW11X21lbWtiIHdpbGwgYmUgbm9uLTAg
ZXZlbiB3aGVuIHRoZSBJT01NVSBzaGFyZSB0aGUgCnBhZ2UtdGFibGUgd2l0aCB0aGUgQ1BVcy4g
SWYgc28sIHdoeSBpcyB0aGlzIHJlcXVpcmVkIGZvciB0aGF0IGNhc2U/Cgo+ICsKPiAgICAgICBz
d2l0Y2ggKGJfaW5mby0+dHlwZSkgewo+ICAgICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfUFZI
Ogo+ICAgICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfSFZNOgo+IC0gICAgICAgICpuZWVkX21l
bWtiICs9IGJfaW5mby0+c2hhZG93X21lbWtiICsgTElCWExfSFZNX0VYVFJBX01FTU9SWTsKPiAr
ICAgICAgICAqbmVlZF9tZW1rYiArPSBMSUJYTF9IVk1fRVhUUkFfTUVNT1JZOwo+ICAgICAgICAg
ICBpZiAobGlieGxfZGVmYm9vbF92YWwoYl9pbmZvLT5kZXZpY2VfbW9kZWxfc3R1YmRvbWFpbikp
Cj4gICAgICAgICAgICAgICAqbmVlZF9tZW1rYiArPSAzMiAqIDEwMjQ7Cj4gICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgIGNhc2UgTElCWExfRE9NQUlOX1RZUEVfUFY6Cj4gLSAgICAgICAgKm5lZWRf
bWVta2IgKz0gYl9pbmZvLT5zaGFkb3dfbWVta2IgKyBMSUJYTF9QVl9FWFRSQV9NRU1PUlk7Cj4g
KyAgICAgICAgKm5lZWRfbWVta2IgKz0gTElCWExfUFZfRVhUUkFfTUVNT1JZOwo+ICAgICAgICAg
ICBicmVhazsKPiAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAgICByYyA9IEVSUk9SX0lOVkFMOwo+
IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgYi90b29scy9saWJ4bC9s
aWJ4bF90eXBlcy5pZGwKPiBpbmRleCBiNjEzOTljZTM2Li5kOTRiNzQ1M2NiIDEwMDY0NAo+IC0t
LSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhs
X3R5cGVzLmlkbAo+IEBAIC00ODYsNiArNDg2LDcgQEAgbGlieGxfZG9tYWluX2J1aWxkX2luZm8g
PSBTdHJ1Y3QoImRvbWFpbl9idWlsZF9pbmZvIixbCj4gICAgICAgKCJ0YXJnZXRfbWVta2IiLCAg
ICBNZW1LQiksCj4gICAgICAgKCJ2aWRlb19tZW1rYiIsICAgICBNZW1LQiksCj4gICAgICAgKCJz
aGFkb3dfbWVta2IiLCAgICBNZW1LQiksCj4gKyAgICAoImlvbW11X21lbWtiIiwgICAgIE1lbUtC
KSwKCkkgdGhpbmsgeW91IHdhbnQgYSBjb3JyZXNwb25kaW5nIExJQlhMX0hBVkUgaW4gbGlieGwu
aCB0byB0ZWxsIGV4dGVybmFsIAp0b29sc3RhY2sgd2hldGhlciB0aGUgZmllbGQgZXhpc3QuCgo+
ICAgICAgICgicnRjX3RpbWVvZmZzZXQiLCAgdWludDMyKSwKPiAgICAgICAoImV4ZWNfc3NpZHJl
ZiIsICAgIHVpbnQzMiksCj4gICAgICAgKCJleGVjX3NzaWRfbGFiZWwiLCBzdHJpbmcpLAoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
