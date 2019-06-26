Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBF755D31
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 03:04:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfwJC-00087c-KN; Wed, 26 Jun 2019 01:01:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfwJA-0007Y4-Jt
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 01:01:08 +0000
X-Inumbo-ID: e0f83b4c-97ad-11e9-91bb-0b56786fd641
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0f83b4c-97ad-11e9-91bb-0b56786fd641;
 Wed, 26 Jun 2019 01:01:07 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35D272085A;
 Wed, 26 Jun 2019 01:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561510866;
 bh=+4pXggepnC4UzZGYGwfKmt+hrpXrNCbBdJRQptzOpIw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=MVGLv/ScxphGUdI39WkRKdA4farCjriJ3G65Ou9dXMHr0S+yo8FxGgDncF5RR8HQ0
 mEREIg/+Oo7acLJvuRAje5yJBrRDNP6fYsQ3B+r6K9aq1mX6ltg78AhSnwWJKpzr4D
 82+lWrGDmCcUC1RgOpTWbR8JzEKruMy+hQnHNQn4=
Date: Tue, 25 Jun 2019 18:01:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-9-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251745260.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-9-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 08/17] xen/arm64: head: Rework and document
 zero_bss()
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

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIHNlY29uZGFyeSBD
UFVzLCB6ZXJvX2JzcygpIHdpbGwgYmUgYSBOT1AgYmVjYXVzZSBCU1Mgb25seSBuZWVkIHRvIGJl
Cj4gemVyb2VkIG9uY2UgYXQgYm9vdC4gU28gdGhlIGNhbGwgaW4gdGhlIHNlY29uZGFyeSBDUFVz
IHBhdGggY2FuIGJlCj4gcmVtb3ZlZC4gSXQgYWxzbyBtZWFucyB0aGF0IHgyNiBkb2VzIG5vdCBu
ZWVkIHRvIHNldCBhbmQgaXMgbm93IG9ubHkKPiB1c2VkIGJ5IHRoZSBib290IENQVS4KPiAKPiBM
YXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdl
IHdpdGhpbiB0aGUKPiBmdW5jdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
IHwgMTMgKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
IGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IGluZGV4IDg3ZmNkM2JlNmMuLjZhYTMxNDgx
OTIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+ICsrKyBiL3hlbi9h
cmNoL2FybS9hcm02NC9oZWFkLlMKPiBAQCAtNzEsNyArNzEsNyBAQAo+ICAgKiAgeDIzIC0gVUFS
VCBhZGRyZXNzCj4gICAqICB4MjQgLQo+ICAgKiAgeDI1IC0gaWRlbnRpdHkgbWFwIGluIHBsYWNl
Cj4gLSAqICB4MjYgLSBza2lwX3plcm9fYnNzCj4gKyAqICB4MjYgLSBza2lwX3plcm9fYnNzIChi
b290IGNwdSBvbmx5KQoKeW91IGNvdWxkIHJlbW92ZSB0aGlzLCBzZWUgYmVsb3cuLi4KCgo+ICAg
KiAgeDI3IC0KPiAgICogIHgyOCAtCj4gICAqICB4MjkgLQo+IEBAIC0zMTMsOCArMzEzLDYgQEAg
R0xPQkFMKGluaXRfc2Vjb25kYXJ5KQo+ICAgICAgICAgIHN1YiAgIHgyMCwgeDE5LCB4MCAgICAg
ICAgICAgLyogeDIwIDo9IHBoeXMtb2Zmc2V0ICovCj4gIAo+ICAgICAgICAgIG1vdiAgIHgyMiwg
IzEgICAgICAgICAgICAgICAgLyogeDIyIDo9IGlzX3NlY29uZGFyeV9jcHUgKi8KPiAtICAgICAg
ICAvKiBCb290IENQVSBhbHJlYWR5IHplcm8gQlNTIHNvIHNraXAgaXQgb24gc2Vjb25kYXJ5IENQ
VXMuICovCj4gLSAgICAgICAgbW92ICAgeDI2LCAjMSAgICAgICAgICAgICAgICAvKiBYMjYgOj0g
c2tpcF96ZXJvX2JzcyAqLwo+ICAKPiAgICAgICAgICBtcnMgICB4MCwgbXBpZHJfZWwxCj4gICAg
ICAgICAgbGRyICAgeDEzLCA9KH5NUElEUl9IV0lEX01BU0spCj4gQEAgLTMzNyw3ICszMzUsNiBA
QCBHTE9CQUwoaW5pdF9zZWNvbmRhcnkpCj4gICAgICAgICAgUFJJTlQoIiBib290aW5nIC1cclxu
IikKPiAgI2VuZGlmCj4gICAgICAgICAgYmwgICAgY2hlY2tfY3B1X21vZGUKPiAtICAgICAgICBi
bCAgICB6ZXJvX2Jzcwo+ICAgICAgICAgIGJsICAgIGNwdV9pbml0Cj4gICAgICAgICAgYmwgICAg
Y3JlYXRlX3BhZ2VfdGFibGVzCj4gICAgICAgICAgYmwgICAgZW5hYmxlX21tdQo+IEBAIC0zNzUs
NiArMzcyLDE0IEBAIGNoZWNrX2NwdV9tb2RlOgo+ICAgICAgICAgIGIgZmFpbAo+ICBFTkRQUk9D
KGNoZWNrX2NwdV9tb2RlKQo+ICAKPiArLyoKPiArICogWmVybyBCU1MKPiArICoKPiArICogSW5w
dXRzOgo+ICsgKiAgIHgyNjogRG8gd2UgbmVlZCB0byB6ZXJvIEJTUz8KPiArICoKPiArICogQ2xv
YmJlcnMgeDAgLSB4Mwo+ICsgKi8KPiAgemVyb19ic3M6Cj4gICAgICAgICAgLyogWmVybyBCU1Mg
b25seSB3aGVuIHJlcXVlc3RlZCAqLwo+ICAgICAgICAgIGNibnogIHgyNiwgc2tpcF9ic3MKCklu
IHRoZSBjb21taXQgbWVzc2FnZSB5b3Ugd3JvdGU6ICJJdCBhbHNvIG1lYW5zIHRoYXQgeDI2IGRv
ZXMgbm90IG5lZWQKdG8gc2V0IGFuZCBpcyBub3cgb25seSB1c2VkIGJ5IHRoZSBib290IENQVS4i
IEkgdGhpbmsgdGhpcyBzdGF0ZW1lbnQgaXMKY29ycmVjdCwgc28geW91IGNvdWxkIGFsc28gcmVt
b3ZlIHRoaXMgImNibnogIHgyNiwgc2tpcF9ic3MiIGFuZCBhbHNvCnRoZSBza2lwX2JzcyBsYWJl
bCBiZWxvdy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
