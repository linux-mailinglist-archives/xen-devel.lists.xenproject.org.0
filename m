Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3786A2A4F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 00:51:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3TDX-0001mT-If; Thu, 29 Aug 2019 22:48:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/L5Q=WZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i3TDW-0001mD-CM
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 22:48:34 +0000
X-Inumbo-ID: 21294cea-caaf-11e9-ae74-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21294cea-caaf-11e9-ae74-12813bfff9fa;
 Thu, 29 Aug 2019 22:48:34 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7AD72189D;
 Thu, 29 Aug 2019 22:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567118913;
 bh=ZGRvcaq/a8pJd+ywMIWiJwEFzqT0vsYzNvrp/+e8HkA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=wnkNFIIv+4LJV93bbLL55j9Hxy9G2m3QtVn4rgC4iUTgVBDhTaNaO2ubx36Anoprj
 /xtSvbGDC2SgW8e7dEuJQF71Y045fGovXpA3c1vi7wuauPYe1W8Ib/cgSSGlSTK4Qd
 G4oXD/PaKu6vmQypn5BNG22/goyVDTLPSBwEAb58=
Date: Thu, 29 Aug 2019 15:48:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20190826121944.515-12-hch@lst.de>
Message-ID: <alpine.DEB.2.21.1908281527130.8175@sstabellini-ThinkPad-T480s>
References: <20190826121944.515-1-hch@lst.de>
 <20190826121944.515-12-hch@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 11/11] arm64: use asm-generic/dma-mapping.h
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
 xen-devel@lists.xenproject.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyNiBBdWcgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTm93IHRoYXQg
dGhlIFhlbiBzcGVjaWFsIGNhc2VzIGFyZSBnb25lIG5vdGhpbmcgd29ydGggbWVudGlvbmluZyBp
cwo+IGxlZnQgaW4gdGhlIGFybTY0IDxhc20vZG1hLW1hcHBpbmcuaD4gZmlsZSwgc28gc3dpdGNo
IHRvIHVzZSB0aGUKPiBhc20tZ2VuZXJpYyB2ZXJzaW9uIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gQWNrZWQtYnk6IFdpbGwgRGVh
Y29uIDx3aWxsQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20v
S2J1aWxkICAgICAgICB8ICAxICsKPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEtbWFwcGlu
Zy5oIHwgMjIgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL2FybTY0L21tL2RtYS1tYXBw
aW5nLmMgICAgICAgICAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyMiBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvaW5jbHVk
ZS9hc20vZG1hLW1hcHBpbmcuaAo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUv
YXNtL0tidWlsZCBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vS2J1aWxkCj4gaW5kZXggYzUyZTE1
MWFmYWIwLi45OGE1NDA1Yzg1NTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2Fz
bS9LYnVpbGQKPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL0tidWlsZAo+IEBAIC00LDYg
KzQsNyBAQCBnZW5lcmljLXkgKz0gZGVsYXkuaAo+ICBnZW5lcmljLXkgKz0gZGl2NjQuaAo+ICBn
ZW5lcmljLXkgKz0gZG1hLmgKPiAgZ2VuZXJpYy15ICs9IGRtYS1jb250aWd1b3VzLmgKPiArZ2Vu
ZXJpYy15ICs9IGRtYS1tYXBwaW5nLmgKPiAgZ2VuZXJpYy15ICs9IGVhcmx5X2lvcmVtYXAuaAo+
ICBnZW5lcmljLXkgKz0gZW1lcmdlbmN5LXJlc3RhcnQuaAo+ICBnZW5lcmljLXkgKz0gaHdfaXJx
LmgKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEtbWFwcGluZy5oIGIv
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS9kbWEtbWFwcGluZy5oCj4gZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggNjcyNDMyNTVhODU4Li4wMDAwMDAwMDAwMDAKPiAtLS0gYS9hcmNoL2Fy
bTY0L2luY2x1ZGUvYXNtL2RtYS1tYXBwaW5nLmgKPiArKysgL2Rldi9udWxsCj4gQEAgLTEsMjIg
KzAsMCBAQAo+IC0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5ICovCj4g
LS8qCj4gLSAqIENvcHlyaWdodCAoQykgMjAxMiBBUk0gTHRkLgo+IC0gKi8KPiAtI2lmbmRlZiBf
X0FTTV9ETUFfTUFQUElOR19ICj4gLSNkZWZpbmUgX19BU01fRE1BX01BUFBJTkdfSAo+IC0KPiAt
I2lmZGVmIF9fS0VSTkVMX18KPiAtCj4gLSNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+IC0jaW5j
bHVkZSA8bGludXgvdm1hbGxvYy5oPgo+IC0KPiAtI2luY2x1ZGUgPHhlbi94ZW4uaD4KPiAtI2lu
Y2x1ZGUgPGFzbS94ZW4vaHlwZXJ2aXNvci5oPgo+IC0KPiAtc3RhdGljIGlubGluZSBjb25zdCBz
dHJ1Y3QgZG1hX21hcF9vcHMgKmdldF9hcmNoX2RtYV9vcHMoc3RydWN0IGJ1c190eXBlICpidXMp
Cj4gLXsKPiAtCXJldHVybiBOVUxMOwo+IC19Cj4gLQo+IC0jZW5kaWYJLyogX19LRVJORUxfXyAq
Lwo+IC0jZW5kaWYJLyogX19BU01fRE1BX01BUFBJTkdfSCAqLwo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L21tL2RtYS1tYXBwaW5nLmMgYi9hcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMKPiBp
bmRleCA0YjI0NGEwMzczNDkuLjY1NzhhYmNmYmJjNyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0
L21tL2RtYS1tYXBwaW5nLmMKPiArKysgYi9hcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMKPiBA
QCAtOCw2ICs4LDcgQEAKPiAgI2luY2x1ZGUgPGxpbnV4L2NhY2hlLmg+Cj4gICNpbmNsdWRlIDxs
aW51eC9kbWEtbm9uY29oZXJlbnQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RtYS1pb21tdS5oPgo+
ICsjaW5jbHVkZSA8eGVuL3hlbi5oPgo+ICAjaW5jbHVkZSA8eGVuL3N3aW90bGIteGVuLmg+Cj4g
IAo+ICAjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
