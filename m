Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50555CBB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 02:03:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfvN9-0007Gc-5a; Wed, 26 Jun 2019 00:01:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfvN7-0007GU-1G
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 00:01:09 +0000
X-Inumbo-ID: 7f8092c0-97a5-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f8092c0-97a5-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 00:01:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31B40208E3;
 Wed, 26 Jun 2019 00:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561507267;
 bh=gkITwhTc1BG4MjVl9ZwRhydo8v+/DOOXNI4pMhmLmAE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Syl8zK6s3luCF4S1/8taQIWou8IhO8g9IoswJPOUITdR4g9ekSS81MKECqtVTP5gJ
 8lkBmDGqi3RX7KmYm1h0kvkvckwLPxwtP1rsjBMM0ND4xAKvolkvKbIrQZWRtknyCI
 fuapdX3g+X0efiJqpCCcuLM2jyrn8r+MxaqZvPj4=
Date: Tue, 25 Jun 2019 17:01:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-5-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251700190.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-5-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 04/17] xen/arm64: head: Don't "reserve" x24
 for the CPUID
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFmdGVyIHRoZSByZWNl
bnQgcmV3b3JrLCB0aGUgQ1BVSUQgaXMgb25seSB1c2VkIGF0IHRoZSB2ZXJ5IGJlZ2lubmluZyBv
Zgo+IHRoZSBzZWNvbmRhcnkgQ1BVcyBib290IHBhdGguIFNvIHRoZXJlIGlzIG5vIG5lZWQgdG8g
InJlc2VydmUiIHgyNCBmb3IKPiBoZSBDUFVJRC4KCklmIHlvdSBhcmUgZ29pbmcgdG8gcmVzZW5k
IHRoZSBzZXJpZXMgaXQgd291bGQgcHJvYmFibHkgbWFrZSBzZW5zZSB0bwpmb2xkIGl0IGluIHRo
ZSBwcmV2aW91cyBwYXRjaCwgYnV0IGl0IGlzIGFsc28gT0sgYXMgaXMKCkFja2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
UyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRleCBmZDQzMmVlMTVkLi44NGUyNjU4
MmM0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiArKysgYi94ZW4v
YXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gQEAgLTY5LDcgKzY5LDcgQEAKPiAgICogIHgyMSAtIERU
QiBhZGRyZXNzIChib290IGNwdSBvbmx5KQo+ICAgKiAgeDIyIC0gaXNfc2Vjb25kYXJ5X2NwdQo+
ICAgKiAgeDIzIC0gVUFSVCBhZGRyZXNzCj4gLSAqICB4MjQgLSBjcHVpZAo+ICsgKiAgeDI0IC0K
PiAgICogIHgyNSAtIGlkZW50aXR5IG1hcCBpbiBwbGFjZQo+ICAgKiAgeDI2IC0gc2tpcF96ZXJv
X2Jzcwo+ICAgKiAgeDI3IC0KPiAtLSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
