Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8236A29FA
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 00:45:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3T7B-0000vD-IY; Thu, 29 Aug 2019 22:42:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/L5Q=WZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i3T7A-0000uw-5Z
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 22:42:00 +0000
X-Inumbo-ID: 3620b7a6-caae-11e9-ae74-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3620b7a6-caae-11e9-ae74-12813bfff9fa;
 Thu, 29 Aug 2019 22:41:59 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A31312189D;
 Thu, 29 Aug 2019 22:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567118519;
 bh=K4rt8zt90Kmj60EUr8Ldv/KP5AZNgIOkytellVQSzmc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1YN/3xioK/sOkd2EHLYyrqoX59ZRTxCvQ8FvQpisRpYOU/0fSb7JKuj23nCZQH6hu
 /RlPCh5ef2sQ3bgqTFLrsqntATI/sGsYVmmUrwpiJsHK6U8JdkHPxtUByH2AGJpzQ0
 jVl7lnqoqH4YW8dX0danw5b7kBAaiscoagXBaJPM=
Date: Thu, 29 Aug 2019 15:41:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190826121944.515-4-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908281431390.8175@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de> <20190826121944.515-4-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 03/11] xen/arm: simplify dma_cache_maint
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNiBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gQ2FsY3VsYXRl
IHRoZSByZXF1aXJlZCBvcGVyYXRpb24gaW4gdGhlIGNhbGxlciwgYW5kIHBhc3MgaXQgZGlyZWN0
bHkKPiBpbnN0ZWFkIG9mIHJlY2FsY3VsYXRpbmcgaXQgZm9yIGVhY2ggcGFnZSwgYW5kIHVzZSBz
aW1wbGUgYXJpdGhtZXRpY3MKPiB0byBnZXQgZnJvbSB0aGUgcGh5c2ljYWwgYWRkcmVzcyB0byBY
ZW4gcGFnZSBzaXplIGFsaWduZWQgY2h1bmtzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+ICBhcmNoL2FybS94ZW4vbW0uYyB8IDYyICsr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA0MCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwo+IGluZGV4IDkwNTc0ZDg5
ZDBkNC4uMTQyMTBlYmRlYTFhIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCj4gKysr
IGIvYXJjaC9hcm0veGVuL21tLmMKPiBAQCAtMzUsNjQgKzM1LDQ2IEBAIHVuc2lnbmVkIGxvbmcg
eGVuX2dldF9zd2lvdGxiX2ZyZWVfcGFnZXModW5zaWduZWQgaW50IG9yZGVyKQo+ICAJcmV0dXJu
IF9fZ2V0X2ZyZWVfcGFnZXMoZmxhZ3MsIG9yZGVyKTsKPiAgfQo+ICAKPiAtZW51bSBkbWFfY2Fj
aGVfb3Agewo+IC0gICAgICAgRE1BX1VOTUFQLAo+IC0gICAgICAgRE1BX01BUCwKPiAtfTsKPiAg
c3RhdGljIGJvb2wgaHlwZXJjYWxsX2NmbHVzaCA9IGZhbHNlOwo+ICAKPiAtLyogZnVuY3Rpb25z
IGNhbGxlZCBieSBTV0lPVExCICovCj4gLQo+IC1zdGF0aWMgdm9pZCBkbWFfY2FjaGVfbWFpbnQo
ZG1hX2FkZHJfdCBoYW5kbGUsIHVuc2lnbmVkIGxvbmcgb2Zmc2V0LAo+IC0Jc2l6ZV90IHNpemUs
IGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpciwgZW51bSBkbWFfY2FjaGVfb3Agb3ApCj4gKy8q
IGJ1ZmZlcnMgaW4gaGlnaG1lbSBvciBmb3JlaWduIHBhZ2VzIGNhbm5vdCBjcm9zcyBwYWdlIGJv
dW5kYXJpZXMgKi8KPiArc3RhdGljIHZvaWQgZG1hX2NhY2hlX21haW50KGRtYV9hZGRyX3QgaGFu
ZGxlLCBzaXplX3Qgc2l6ZSwgdTMyIG9wKQo+ICB7Cj4gIAlzdHJ1Y3QgZ250dGFiX2NhY2hlX2Zs
dXNoIGNmbHVzaDsKPiAtCXVuc2lnbmVkIGxvbmcgeGVuX3BmbjsKPiAtCXNpemVfdCBsZWZ0ID0g
c2l6ZTsKPiAgCj4gLQl4ZW5fcGZuID0gKGhhbmRsZSA+PiBYRU5fUEFHRV9TSElGVCkgKyBvZmZz
ZXQgLyBYRU5fUEFHRV9TSVpFOwo+IC0Jb2Zmc2V0ICU9IFhFTl9QQUdFX1NJWkU7Cj4gKwljZmx1
c2guYS5kZXZfYnVzX2FkZHIgPSBoYW5kbGUgJiBYRU5fUEFHRV9NQVNLOwo+ICsJY2ZsdXNoLm9m
ZnNldCA9IHhlbl9vZmZzZXRfaW5fcGFnZShoYW5kbGUpOwo+ICsJY2ZsdXNoLm9wID0gb3A7Cj4g
IAo+ICAJZG8gewo+IC0JCXNpemVfdCBsZW4gPSBsZWZ0Owo+IC0JCj4gLQkJLyogYnVmZmVycyBp
biBoaWdobWVtIG9yIGZvcmVpZ24gcGFnZXMgY2Fubm90IGNyb3NzIHBhZ2UKPiAtCQkgKiBib3Vu
ZGFyaWVzICovCj4gLQkJaWYgKGxlbiArIG9mZnNldCA+IFhFTl9QQUdFX1NJWkUpCj4gLQkJCWxl
biA9IFhFTl9QQUdFX1NJWkUgLSBvZmZzZXQ7Cj4gLQo+IC0JCWNmbHVzaC5vcCA9IDA7Cj4gLQkJ
Y2ZsdXNoLmEuZGV2X2J1c19hZGRyID0geGVuX3BmbiA8PCBYRU5fUEFHRV9TSElGVDsKPiAtCQlj
Zmx1c2gub2Zmc2V0ID0gb2Zmc2V0Owo+IC0JCWNmbHVzaC5sZW5ndGggPSBsZW47Cj4gLQo+IC0J
CWlmIChvcCA9PSBETUFfVU5NQVAgJiYgZGlyICE9IERNQV9UT19ERVZJQ0UpCj4gLQkJCWNmbHVz
aC5vcCA9IEdOVFRBQl9DQUNIRV9JTlZBTDsKPiAtCQlpZiAob3AgPT0gRE1BX01BUCkgewo+IC0J
CQlpZiAoZGlyID09IERNQV9GUk9NX0RFVklDRSkKPiAtCQkJCWNmbHVzaC5vcCA9IEdOVFRBQl9D
QUNIRV9JTlZBTDsKPiAtCQkJZWxzZQo+IC0JCQkJY2ZsdXNoLm9wID0gR05UVEFCX0NBQ0hFX0NM
RUFOOwo+IC0JCX0KPiAtCQlpZiAoY2ZsdXNoLm9wKQo+IC0JCQlIWVBFUlZJU09SX2dyYW50X3Rh
YmxlX29wKEdOVFRBQk9QX2NhY2hlX2ZsdXNoLCAmY2ZsdXNoLCAxKTsKPiArCQlpZiAoc2l6ZSAr
IGNmbHVzaC5vZmZzZXQgPiBYRU5fUEFHRV9TSVpFKQo+ICsJCQljZmx1c2gubGVuZ3RoID0gWEVO
X1BBR0VfU0laRSAtIGNmbHVzaC5vZmZzZXQ7Cj4gKwkJZWxzZQo+ICsJCQljZmx1c2gubGVuZ3Ro
ID0gc2l6ZTsKCmlzbid0IGl0IG1pc3NpbmcgYToKCiAgY2ZsdXNoLmEuZGV2X2J1c19hZGRyID0g
aGFuZGxlICYgWEVOX1BBR0VfTUFTSzsKCmhlcmU/CgoKPiArCQlIWVBFUlZJU09SX2dyYW50X3Rh
YmxlX29wKEdOVFRBQk9QX2NhY2hlX2ZsdXNoLCAmY2ZsdXNoLCAxKTsKPiArCj4gKwkJaGFuZGxl
ICs9IGNmbHVzaC5sZW5ndGg7Cj4gKwkJc2l6ZSAtPSBjZmx1c2gubGVuZ3RoOwo+ICAKPiAtCQlv
ZmZzZXQgPSAwOwo+IC0JCXhlbl9wZm4rKzsKPiAtCQlsZWZ0IC09IGxlbjsKPiAtCX0gd2hpbGUg
KGxlZnQpOwo+ICsJCWNmbHVzaC5vZmZzZXQgPSAwOwo+ICsJfSB3aGlsZSAoc2l6ZSk7Cj4gIH0K
PiAgCj4gIHN0YXRpYyB2b2lkIF9feGVuX2RtYV9wYWdlX2Rldl90b19jcHUoc3RydWN0IGRldmlj
ZSAqaHdkZXYsIGRtYV9hZGRyX3QgaGFuZGxlLAo+ICAJCXNpemVfdCBzaXplLCBlbnVtIGRtYV9k
YXRhX2RpcmVjdGlvbiBkaXIpCj4gIHsKPiAtCWRtYV9jYWNoZV9tYWludChoYW5kbGUgJiBQQUdF
X01BU0ssIGhhbmRsZSAmIH5QQUdFX01BU0ssIHNpemUsIGRpciwgRE1BX1VOTUFQKTsKPiArCWlm
IChkaXIgIT0gRE1BX1RPX0RFVklDRSkKPiArCQlkbWFfY2FjaGVfbWFpbnQoaGFuZGxlLCBzaXpl
LCBHTlRUQUJfQ0FDSEVfSU5WQUwpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBfX3hlbl9kbWFf
cGFnZV9jcHVfdG9fZGV2KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBkbWFfYWRkcl90IGhhbmRsZSwK
PiAgCQlzaXplX3Qgc2l6ZSwgZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyKQo+ICB7Cj4gLQlk
bWFfY2FjaGVfbWFpbnQoaGFuZGxlICYgUEFHRV9NQVNLLCBoYW5kbGUgJiB+UEFHRV9NQVNLLCBz
aXplLCBkaXIsIERNQV9NQVApOwo+ICsJaWYgKGRpciA9PSBETUFfRlJPTV9ERVZJQ0UpCj4gKwkJ
ZG1hX2NhY2hlX21haW50KGhhbmRsZSwgc2l6ZSwgR05UVEFCX0NBQ0hFX0lOVkFMKTsKPiArCWVs
c2UKPiArCQlkbWFfY2FjaGVfbWFpbnQoaGFuZGxlLCBzaXplLCBHTlRUQUJfQ0FDSEVfQ0xFQU4p
Owo+ICB9Cj4gIAo+ICB2b2lkIF9feGVuX2RtYV9tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpod2Rl
diwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gLS0gCj4gMi4yMC4xCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
