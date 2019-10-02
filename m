Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6D0C4595
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 03:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFTVI-00071r-CG; Wed, 02 Oct 2019 01:32:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFTVH-00071m-4H
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 01:32:31 +0000
X-Inumbo-ID: 7fe51ff6-e4b4-11e9-970b-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 7fe51ff6-e4b4-11e9-970b-12813bfff9fa;
 Wed, 02 Oct 2019 01:32:30 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BB2C20873;
 Wed,  2 Oct 2019 01:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569979949;
 bh=NCguvm8ZH0VuZJmubMT+6CVArPYEWQ8h34WUk935RPo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=KNhJvieS/cKytIVJyr+/bHg0NN3WQ7WX9xcFf7l3A93WhPtSRUHFCSgAKAzhTyJAF
 ZUNKk3lQuokC9cBJ/I+caASRiSbZW/pD+ziAuaOntm2CgVs0/PXZjLRX4DbevPnsiX
 0HKawEnzhFk8qy/tQQKc1k4Zs7pegRK+GmI2XO0k=
Date: Tue, 1 Oct 2019 18:32:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Peng Fan <peng.fan@nxp.com>
In-Reply-To: <1568627400-21335-1-git-send-email-peng.fan@nxp.com>
Message-ID: <alpine.DEB.2.21.1910011832200.26319@sstabellini-ThinkPad-T480s>
References: <1568627400-21335-1-git-send-email-peng.fan@nxp.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V3] arm: xen: mm: use __GPF_DMA32 for arm64
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
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "will@kernel.org" <will@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxNiBTZXAgMjAxOSwgUGVuZyBGYW4gd3JvdGU6Cj4gRnJvbTogUGVuZyBGYW4gPHBl
bmcuZmFuQG54cC5jb20+Cj4gCj4gYXJtNjQgc2hhcmVzIHNvbWUgY29kZSB1bmRlciBhcmNoL2Fy
bS94ZW4sIGluY2x1ZGluZyBtbS5jLgo+IEhvd2V2ZXIgWk9ORV9ETUEgaXMgcmVtb3ZlZCBieSBj
b21taXQKPiBhZDY3ZjVhNjU0NSgiYXJtNjQ6IHJlcGxhY2UgWk9ORV9ETUEgd2l0aCBaT05FX0RN
QTMyIikuCj4gCj4gU28gYWRkIGEgY2hlY2sgaWYgQ09ORklHX1pPTkVfRE1BMzIgaXMgZW5hYmxl
ZCB1c2UgX19HRlBfRE1BMzIuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFu
QG54cC5jb20+CgpBY2tlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKCj4gLS0tCj4gCj4gVjM6Cj4gIFVzZSBJU19FTkFCTEVEKENPTkZJR19aT05FX0RN
QTMyKSBhbmQgZHJvcCB4ZW5fc2V0X2dmcF9kbWEuCj4gCj4gVjI6Cj4gIEZvbGxvdyBzdWdnZXN0
aW9uIGZyb20gU3RlZmFubywKPiAgaW50cm9kdWNlIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5fc2V0
X2dmcF9kbWEoZ2ZwX3QgKmZsYWdzKSBmb3IgYXJtMzIvYXJtNjQsIGFuZAo+ICBmb3IgYXJtNjQg
dXNpbmcgX19HRlBfRE1BIGZvciB0aGUgZm9ybWVyIGFuZCBfX0dGUF9ETUEzMiBmb3IgdGhlIGxh
dHRlci4KPiAKPiAKPiAgYXJjaC9hcm0veGVuL21tLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0veGVuL21tLmMgYi9hcmNoL2FybS94ZW4vbW0uYwo+IGluZGV4IDJiMmMyMDg0MDhiYi4u
MzhmYTkxN2M4NTg1IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCj4gKysrIGIvYXJj
aC9hcm0veGVuL21tLmMKPiBAQCAtMjgsNyArMjgsMTAgQEAgdW5zaWduZWQgbG9uZyB4ZW5fZ2V0
X3N3aW90bGJfZnJlZV9wYWdlcyh1bnNpZ25lZCBpbnQgb3JkZXIpCj4gIAo+ICAJZm9yX2VhY2hf
bWVtYmxvY2sobWVtb3J5LCByZWcpIHsKPiAgCQlpZiAocmVnLT5iYXNlIDwgKHBoeXNfYWRkcl90
KTB4ZmZmZmZmZmYpIHsKPiAtCQkJZmxhZ3MgfD0gX19HRlBfRE1BOwo+ICsJCQlpZiAoSVNfRU5B
QkxFRChDT05GSUdfWk9ORV9ETUEzMikpCj4gKwkJCQlmbGFncyB8PSBfX0dGUF9ETUEzMjsKPiAr
CQkJZWxzZQo+ICsJCQkJZmxhZ3MgfD0gX19HRlBfRE1BOwo+ICAJCQlicmVhazsKPiAgCQl9Cj4g
IAl9Cj4gLS0gCj4gMi4xNi40Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
