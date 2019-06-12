Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ADB431A2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 00:24:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbBdX-0004qZ-OG; Wed, 12 Jun 2019 22:22:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yIha=UL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hbBdV-0004qT-Nt
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 22:22:29 +0000
X-Inumbo-ID: 8fb9ee08-8d60-11e9-a82e-2bb46ae6fda8
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8fb9ee08-8d60-11e9-a82e-2bb46ae6fda8;
 Wed, 12 Jun 2019 22:22:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B9F4206BB;
 Wed, 12 Jun 2019 22:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560378147;
 bh=oXOgX+qSbpkhcxQQ2qHTB3VCMJy+Mw7CIo5JVyvqVEU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FGJ97NL1VmxOmedBqhF7+zn7bX/5rTnxWOlpIPRGz8wNkqivB3hpVMeFWyWGDvbya
 laLuo2dgZYHo0FlwZaxKIaEKU1wCmEtXXmNEjwngmv1dw6GvnUOHvTbJ13UepXM/nF
 0Jgp2puYdSj7jNyBMhpP75zqkCBIPKot9ouypCyE=
Date: Wed, 12 Jun 2019 15:22:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514123125.29086-8-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906121522160.13737@sstabellini-ThinkPad-T480s>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-8-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 07/12] xen/arm: mm: Rework
 xen_pt_update_entry to avoid use xenmap_operation
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdpdGggdGhlIG5ld2x5
IGludHJvZHVjZWQgZmxhZ3MsIGl0IGlzIG5vdyBwb3NzaWJsZSB0byBrbm93IGhvdyB0aGUgcGFn
ZQo+IHdpbGwgYmUgdXBkYXRlZCB0aHJvdWdoIHRoZSBmbGFncy4KPiAKPiBBbGwgdGhlIHVzZSBv
ZiB4ZW5tYXBfb3BlcmF0aW9uIGFyZSBub3cgcmVwbGFjZWQgd2l0aCB0aGUgZmxhZ3MuIEF0IHRo
ZQo+IHNhbWUgdGltZSwgdmFsaWRpdHkgY2hlY2sgYXJlIG5vdyByZW1vdmVkIGFzIHRoZXkgYXJl
IGdhdGhlcmVkIGluCj4geGVuX3B0X2NoZWNrX2VudHJ5KCkuCj4gCj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmlp
IEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAKPiAgICAgQ2hhbmdl
cyBpbiB2MjoKPiAgICAgICAgIC0gRml4IHR5cG8gaW4gdGhlIGNvbW1pdCBtZXNzYWdlCj4gICAg
ICAgICAtIEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vbW0u
YyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IGluZGV4
IDQ1YTZmOTI4N2YuLjg2ZTFmYWVlYjUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMK
PiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+IEBAIC0xMDY3LDM0ICsxMDY3LDMzIEBAIHN0YXRp
YyBpbnQgeGVuX3B0X3VwZGF0ZV9lbnRyeShlbnVtIHhlbm1hcF9vcGVyYXRpb24gb3AsIHVuc2ln
bmVkIGxvbmcgYWRkciwKPiAgICAgIGlmICggIXhlbl9wdF9jaGVja19lbnRyeSgqZW50cnksIG1m
biwgZmxhZ3MpICkKPiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgCj4gLSAgICBzd2l0Y2gg
KCBvcCApIHsKPiAtICAgICAgICBjYXNlIElOU0VSVDoKPiAtICAgICAgICBjYXNlIFJFU0VSVkU6
Cj4gLSAgICAgICAgICAgIGlmICggb3AgPT0gUkVTRVJWRSApCj4gLSAgICAgICAgICAgICAgICBi
cmVhazsKPiArICAgIC8qIElmIHdlIGFyZSBvbmx5IHBvcHVsYXRpbmcgcGFnZS10YWJsZSwgdGhl
biB3ZSBhcmUgZG9uZS4gKi8KPiArICAgIGlmICggZmxhZ3MgJiBfUEFHRV9QT1BVTEFURSApCj4g
KyAgICAgICAgcmV0dXJuIDA7Cj4gKwo+ICsgICAgLyogV2UgYXJlIHJlbW92aW5nIHRoZSBwYWdl
ICovCj4gKyAgICBpZiAoICEoZmxhZ3MgJiBfUEFHRV9QUkVTRU5UKSApCj4gKyAgICAgICAgbWVt
c2V0KCZwdGUsIDB4MDAsIHNpemVvZihwdGUpKTsKPiArICAgIGVsc2UKPiArICAgIHsKPiArICAg
ICAgICAvKiBXZSBhcmUgaW5zZXJ0aW5nIGEgbWFwcGluZyA9PiBDcmVhdGUgbmV3IHB0ZS4gKi8K
PiArICAgICAgICBpZiAoICFtZm5fZXEobWZuLCBJTlZBTElEX01GTikgKQo+ICsgICAgICAgIHsK
PiAgICAgICAgICAgICAgcHRlID0gbWZuX3RvX3hlbl9lbnRyeShtZm4sIFBBR0VfQUlfTUFTSyhm
bGFncykpOwo+IC0gICAgICAgICAgICBwdGUucHQucm8gPSBQQUdFX1JPX01BU0soZmxhZ3MpOwo+
IC0gICAgICAgICAgICBwdGUucHQueG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpOwo+IC0gICAgICAg
ICAgICBCVUdfT04oIXB0ZS5wdC5ybyAmJiAhcHRlLnB0LnhuKTsKPiArCj4gKyAgICAgICAgICAg
IC8qIFRoaXJkIGxldmVsIGVudHJpZXMgc2V0IHB0ZS5wdC50YWJsZSA9IDEgKi8KPiAgICAgICAg
ICAgICAgcHRlLnB0LnRhYmxlID0gMTsKPiAtICAgICAgICAgICAgd3JpdGVfcHRlKGVudHJ5LCBw
dGUpOwo+IC0gICAgICAgICAgICBicmVhazsKPiAtICAgICAgICBjYXNlIE1PRElGWToKPiAtICAg
ICAgICBjYXNlIFJFTU9WRToKPiAtICAgICAgICAgICAgaWYgKCBvcCA9PSBSRU1PVkUgKQo+IC0g
ICAgICAgICAgICAgICAgcHRlLmJpdHMgPSAwOwo+IC0gICAgICAgICAgICBlbHNlCj4gLSAgICAg
ICAgICAgIHsKPiAtICAgICAgICAgICAgICAgIHB0ZSA9ICplbnRyeTsKPiAtICAgICAgICAgICAg
ICAgIHB0ZS5wdC5ybyA9IFBBR0VfUk9fTUFTSyhmbGFncyk7Cj4gLSAgICAgICAgICAgICAgICBw
dGUucHQueG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpOwo+IC0gICAgICAgICAgICB9Cj4gLSAgICAg
ICAgICAgIHdyaXRlX3B0ZShlbnRyeSwgcHRlKTsKPiAtICAgICAgICAgICAgYnJlYWs7Cj4gLSAg
ICAgICAgZGVmYXVsdDoKPiAtICAgICAgICAgICAgQlVHKCk7Cj4gKyAgICAgICAgfQo+ICsgICAg
ICAgIGVsc2UgLyogV2UgYXJlIHVwZGF0aW5nIHRoZSBwZXJtaXNzaW9uID0+IENvcHkgdGhlIGN1
cnJlbnQgcHRlLiAqLwo+ICsgICAgICAgICAgICBwdGUgPSAqZW50cnk7Cj4gKwo+ICsgICAgICAg
IC8qIFNldCBwZXJtaXNzaW9uICovCj4gKyAgICAgICAgcHRlLnB0LnJvID0gUEFHRV9ST19NQVNL
KGZsYWdzKTsKPiArICAgICAgICBwdGUucHQueG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpOwo+ICAg
ICAgfQo+ICAKPiArICAgIHdyaXRlX3B0ZShlbnRyeSwgcHRlKTsKPiArCj4gICAgICByZXR1cm4g
MDsKPiAgfQo+ICAKPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
