Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBD5352FF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 01:14:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYIbA-0008MH-GK; Tue, 04 Jun 2019 23:12:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYIb8-0008Lj-HL
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 23:12:06 +0000
X-Inumbo-ID: 2b47f647-871e-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2b47f647-871e-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 23:12:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32F642067C;
 Tue,  4 Jun 2019 23:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559689925;
 bh=GOEW6HV8y28lpHhH/GgmWazlHQDIjn9IrMVMVxD/ACY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=LrV2A4UnHa5/LpPbEoJZKcRMCd4BSROJtTI7Q5vo7lvru+qsNzp+lU76ll2nsbFZ9
 2DUZDfU2tjdFXPIHCdzHeVCpYKnVP5q6GWtvUtzpHCQaTDtxmTnBgDrIKnAgVLd93a
 3cFeCMm5HXqYcfOazF5Gna2bCG+ro31cSG4beHeE=
Date: Tue, 4 Jun 2019 16:12:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-19-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906041053150.14041@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-19-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 18/19] xen/arm: mm: Check
 start is always before end in {destroy, modify}_xen_mappings
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

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSB0d28gaGVscGVy
cyB7ZGVzdHJveSwgbW9kaWZ5fV94ZW5fbWFwcGluZ3MgZG9uJ3QgY2hlY2sgdGhhdCB0aGUKPiBz
dGFydCBpcyBhbHdheXMgYmVmb3JlIHRoZSBlbmQuIFRoaXMgc2hvdWxkIG5ldmVyIGhhcHBlbiBi
dXQgaWYgaXQKPiBoYXBwZW5zLCBpdCB3aWxsIHJlc3VsdCB0byB1bmV4cGVjdGVkIGJlaGF2aW9y
Lgo+IAo+IENhdGNoIHN1Y2ggaXNzdWVzIGVhcmxpZXIgb24gYnkgYWRkaW5nIGFuIEFTU0VSVCBp
biBkZXN0cm95X3hlbl9tYXBwaW5ncwo+IGFuZCBtb2RpZnlfeGVuX21hcHBpbmdzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gUmV2aWV3
ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgpBY2tlZC1ieTog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gICAg
IENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAtIEFkZCBBbmRyaWkncyByZXZpZXdlZC1ieQo+IC0t
LQo+ICB4ZW4vYXJjaC9hcm0vbW0uYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2Fy
bS9tbS5jCj4gaW5kZXggZWFjYzE2NDdlMC4uYjQwOGRlN2M3NSAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC9hcm0vbW0uYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9tbS5jCj4gQEAgLTEwNzcsMTEgKzEw
NzcsMTMgQEAgaW50IHBvcHVsYXRlX3B0X3JhbmdlKHVuc2lnbmVkIGxvbmcgdmlydCwgdW5zaWdu
ZWQgbG9uZyBucl9tZm5zKQo+ICAKPiAgaW50IGRlc3Ryb3lfeGVuX21hcHBpbmdzKHVuc2lnbmVk
IGxvbmcgdiwgdW5zaWduZWQgbG9uZyBlKQo+ICB7Cj4gKyAgICBBU1NFUlQodiA8PSBlKTsKPiAg
ICAgIHJldHVybiBjcmVhdGVfeGVuX2VudHJpZXMoUkVNT1ZFLCB2LCBJTlZBTElEX01GTiwgKGUg
LSB2KSA+PiBQQUdFX1NISUZULCAwKTsKPiAgfQo+ICAKPiAgaW50IG1vZGlmeV94ZW5fbWFwcGlu
Z3ModW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHVuc2lnbmVkIGludCBmbGFncykK
PiAgewo+ICsgICAgQVNTRVJUKHMgPD0gZSk7Cj4gICAgICByZXR1cm4gY3JlYXRlX3hlbl9lbnRy
aWVzKE1PRElGWSwgcywgSU5WQUxJRF9NRk4sIChlIC0gcykgPj4gUEFHRV9TSElGVCwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmxhZ3MpOwo+ICB9Cj4gLS0gCj4gMi4xMS4wCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
