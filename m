Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A99A0947
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 20:12:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i32OE-0001V7-1H; Wed, 28 Aug 2019 18:09:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3SZS=WY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i32OC-0001UM-Qy
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 18:09:48 +0000
X-Inumbo-ID: 056cb172-c9bf-11e9-b95f-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 056cb172-c9bf-11e9-b95f-bc764e2007e4;
 Wed, 28 Aug 2019 18:09:48 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0953F2053B;
 Wed, 28 Aug 2019 18:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567015787;
 bh=pEW7d4+ki1j7cGrysUa/rs6+n6aWIK6WXN6/tbYAFzs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=SPT3DChX1H83A9Qle/0AqSTbAk6v+FbOYww2pgDUZeRbOYCEyK/D4OEH5eWuzjVuC
 xDRQFHaR+yKsCIOSiA8B8PhK8UDu1KCgDFfj4b4ahORsC/TvPnQROWaAKyTMWTCALu
 t81UTiYo2w495kttG20MKcBuBREwFON4EDlYJMPY=
Date: Wed, 28 Aug 2019 11:09:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Peng Fan <peng.fan@nxp.com>
In-Reply-To: <AM0PR04MB4481386D2C54AEA6987E1B1588A30@AM0PR04MB4481.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.1908281103290.25361@sstabellini-ThinkPad-T480s>
References: <20190709083729.11135-1-peng.fan@nxp.com>
 <d70b3a5c-647c-2147-99be-4572f76e898b@arm.com>
 <AM0PR04MB4481386D2C54AEA6987E1B1588A30@AM0PR04MB4481.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "van.freenix@gmail.com" <van.freenix@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyOCBBdWcgMjAxOSwgUGVuZyBGYW4gd3JvdGU6Cj4gSGkgUm9iaW4sCj4gCj4gPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBhcm06IHhlbjogbW06IHVzZSBfX0dQRl9ETUEzMiBmb3IgYXJt
NjQKPiA+IAo+ID4gT24gMDkvMDcvMjAxOSAwOToyMiwgUGVuZyBGYW4gd3JvdGU6Cj4gPiA+IGFy
bTY0IHNoYXJlcyBzb21lIGNvZGUgdW5kZXIgYXJjaC9hcm0veGVuLCBpbmNsdWRpbmcgbW0uYy4K
PiA+ID4gSG93ZXZlciBaT05FX0RNQSBpcyByZW1vdmVkIGJ5IGNvbW1pdAo+ID4gPiBhZDY3ZjVh
NjU0NSgiYXJtNjQ6IHJlcGxhY2UgWk9ORV9ETUEgd2l0aCBaT05FX0RNQTMyIikuCj4gPiA+IFNv
IHRvIEFSTTY0LCBuZWVkIHVzZSBfX0dGUF9ETUEzMi4KCkhpIFBlbmcsCgpTb3JyeSBmb3IgYmVp
bmcgc28gbGF0ZSBpbiByZXBseWluZywgdGhpcyBlbWFpbCBnb3QgbG9zdCBpbiB0aGUgbm9pc2Uu
CgoKPiA+ID4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Cj4gPiA+
IC0tLQo+ID4gPiAgIGFyY2gvYXJtL3hlbi9tbS5jIHwgMiArLQo+ID4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYyBpbmRleAo+ID4gPiBlMWQ0
NGI5MDNkZmMuLmE5NWU3NmQxOGJmOSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcm0veGVuL21t
LmMKPiA+ID4gKysrIGIvYXJjaC9hcm0veGVuL21tLmMKPiA+ID4gQEAgLTI3LDcgKzI3LDcgQEAg
dW5zaWduZWQgbG9uZyB4ZW5fZ2V0X3N3aW90bGJfZnJlZV9wYWdlcyh1bnNpZ25lZAo+ID4gPiBp
bnQgb3JkZXIpCj4gPiA+Cj4gPiA+ICAgCWZvcl9lYWNoX21lbWJsb2NrKG1lbW9yeSwgcmVnKSB7
Cj4gPiA+ICAgCQlpZiAocmVnLT5iYXNlIDwgKHBoeXNfYWRkcl90KTB4ZmZmZmZmZmYpIHsKPiA+
ID4gLQkJCWZsYWdzIHw9IF9fR0ZQX0RNQTsKPiA+ID4gKwkJCWZsYWdzIHw9IF9fR0ZQX0RNQSB8
IF9fR0ZQX0RNQTMyOwo+ID4gCj4gPiBHaXZlbiB0aGUgZGVmaW5pdGlvbiBvZiBHRlBfWk9ORV9C
QUQsIEknbSBub3Qgc3VyZSB0aGlzIGNvbWJpbmF0aW9uIG9mIGZsYWdzCj4gPiBpcyBzdHJpY3Rs
eSB2YWxpZCwgYnV0IHJhdGhlciBpcyBpbXBsaWNpdGx5IHJlbGlhbnQgb24gb25seSBvbmUgb2Yg
dGhvc2Ugem9uZXMgZXZlcgo+ID4gYWN0dWFsbHkgZXhpc3RpbmcuIEFzIHN1Y2gsIGl0IHNlZW1z
IGxpYWJsZSB0byBibG93IHVwIGlmIHRoZSBwbGFucyB0byBhZGQKPiA+IFpPTkVfRE1BIHRvIGFy
bTY0WzFdIGdvIGFoZWFkLgo+IAo+IEhvdyBhYm91dCB0aGlzLCBvciBkbyB5b3UgaGF2ZSBhbnkg
c3VnZ2VzdGlvbnM/Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIvYXJjaC9hcm0v
eGVuL21tLmMKPiBpbmRleCBkMzNiNzdlOWFkZDMuLmY2MWMyOWE0NDMwZiAxMDA2NDQKPiAtLS0g
YS9hcmNoL2FybS94ZW4vbW0uYwo+ICsrKyBiL2FyY2gvYXJtL3hlbi9tbS5jCj4gQEAgLTI4LDcg
KzI4LDExIEBAIHVuc2lnbmVkIGxvbmcgeGVuX2dldF9zd2lvdGxiX2ZyZWVfcGFnZXModW5zaWdu
ZWQgaW50IG9yZGVyKQo+IAo+ICAgICAgICAgZm9yX2VhY2hfbWVtYmxvY2sobWVtb3J5LCByZWcp
IHsKPiAgICAgICAgICAgICAgICAgaWYgKHJlZy0+YmFzZSA8IChwaHlzX2FkZHJfdCkweGZmZmZm
ZmZmKSB7Cj4gKyNpZmRlZiBDT05GSUdfQVJNNjQKPiArICAgICAgICAgICAgICAgICAgICAgICBm
bGFncyB8PSBfX0dGUF9ETUEzMjsKPiArI2Vsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICBm
bGFncyB8PSBfX0dGUF9ETUE7Cj4gKyNlbmRpZgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9CgpZZXMgSSB0aGluayB0aGlzIGlz
IHRoZSB3YXkgdG8gZ28sIGJ1dCB3ZSBhcmUgdHJ5aW5nIG5vdCB0byBhZGQgYW55CiNpZmRlZiBD
T05GSUdfQVJNNjQgdW5kZXIgYXJjaC9hcm0uIE1heWJlIHlvdSBjb3VsZCBpbnRyb2R1Y2UgYSBz
dGF0aWMKaW5saW5lIGZ1bmN0aW9uIHRvIHNldCBHRlBfRE1BOgoKICBzdGF0aWMgaW5saW5lIHZv
aWQgeGVuX3NldF9nZnBfZG1hKGdmcF90ICpmbGFncykKCml0IGNvdWxkIGJlIGltcGxlbWVudGVk
IHVuZGVyIGFyY2gvYXJtL2luY2x1ZGUvYXNtL3hlbi9wYWdlLmggZm9yIGFybQphbmQgdW5kZXIg
YXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vcGFnZS5oIGZvciBhcm02NCB1c2luZyBfX0dGUF9E
TUEKZm9yIHRoZSBmb3JtZXIgYW5kIF9fR0ZQX0RNQTMyIGZvciB0aGUgbGF0dGVyLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
