Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8743134954
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:27:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipF4y-0003OZ-99; Wed, 08 Jan 2020 17:25:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DQVU=25=merlin.srs.infradead.org=batv+2c4203d137aea531db05+5981+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ipF4x-0003OD-1j
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:25:11 +0000
X-Inumbo-ID: ceed300a-323b-11ea-8599-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ceed300a-323b-11ea-8599-bc764e2007e4;
 Wed, 08 Jan 2020 17:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UXxkiVeIWuWUN6bod/uMuc68HNLOFFwcnidb1kQMKyw=; b=25Ow2VaDVPakX7nXdurS9edIsy
 AuOKa8hY0kO0R8mYfps7QUtDUYe8J0p7sSZ7o9uQf7ksgE+AlDGTB5PbR3ZVTPcujddhX9HyNKq76
 m7/Pj1zQqEIXkNPdRU6NSvGqPMdax+eGfVBlOMpqgrKcyJMy0bo/D+YyClrVrL1GUXWDBoRHcI56A
 ZiYopDQRfyBXuFi4fo36cLMH05yRPsTyHaazi5DfpMQ8eULDLuXROkyXj/sEPKdA/aLh5kUGYbzHs
 lr8Mou2zrpqDEeK8shaappFItltJp7diU2zxxeZWFKG7QJaI9uK3ah+rGgMcskWrDaoPygBmLeSfu
 Kx64Hc8A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipF4o-0004uu-7W; Wed, 08 Jan 2020 17:25:02 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ipF4m-005xKV-97; Wed, 08 Jan 2020 17:25:00 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed,  8 Jan 2020 17:24:58 +0000
Message-Id: <20200108172500.1419665-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
References: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH 1/3] x86/setup: Don't skip 2MiB underneath
 relocated Xen image
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, paul@xen.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClNldCAnZScgY29ycmVj
dGx5IHRvIHJlZmxlY3QgdGhlIGxvY2F0aW9uIHRoYXQgWGVuIGlzIGFjdHVhbGx5IHJlbG9jYXRl
ZAp0byBmcm9tIGl0cyBkZWZhdWx0IDJNaUIgbG9jYXRpb24uIE5vdCAyTWlCIGJlbG93IHRoYXQu
CgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgotLS0K
IHhlbi9hcmNoL3g4Ni9zZXR1cC5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0
dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCmluZGV4IDUwMWYzZjVlNGIuLjQ3ZTA2NWU1ZmUg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1
cC5jCkBAIC0xMDc3LDkgKzEwNzcsOSBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hl
bih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwdGVfdXBk
YXRlX2xpbWl0OwogCiAgICAgICAgICAgICAvKiBTZWxlY3QgcmVsb2NhdGlvbiBhZGRyZXNzLiAq
LwotICAgICAgICAgICAgZSA9IGVuZCAtIHJlbG9jX3NpemU7Ci0gICAgICAgICAgICB4ZW5fcGh5
c19zdGFydCA9IGU7Ci0gICAgICAgICAgICBib290c3ltKHRyYW1wb2xpbmVfeGVuX3BoeXNfc3Rh
cnQpID0gZTsKKyAgICAgICAgICAgIHhlbl9waHlzX3N0YXJ0ID0gZW5kIC0gcmVsb2Nfc2l6ZTsK
KyAgICAgICAgICAgIGUgPSB4ZW5fcGh5c19zdGFydCArIFhFTl9JTUdfT0ZGU0VUOworICAgICAg
ICAgICAgYm9vdHN5bSh0cmFtcG9saW5lX3hlbl9waHlzX3N0YXJ0KSA9IHhlbl9waHlzX3N0YXJ0
OwogCiAgICAgICAgICAgICAvKgogICAgICAgICAgICAgICogTm8gUFRFcyBwb2ludGluZyBhYm92
ZSB0aGlzIGFkZHJlc3MgYXJlIGNhbmRpZGF0ZXMgZm9yIHJlbG9jYXRpb24uCkBAIC0xMDk2LDcg
KzEwOTYsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25n
IG1iaV9wKQogICAgICAgICAgICAgICogZGF0YSB1bnRpbCBhZnRlciB3ZSBoYXZlIHN3aXRjaGVk
IHRvIHRoZSByZWxvY2F0ZWQgcGFnZXRhYmxlcyEKICAgICAgICAgICAgICAqLwogICAgICAgICAg
ICAgYmFycmllcigpOwotICAgICAgICAgICAgbW92ZV9tZW1vcnkoZSArIFhFTl9JTUdfT0ZGU0VU
LCBYRU5fSU1HX09GRlNFVCwgX2VuZCAtIF9zdGFydCwgMSk7CisgICAgICAgICAgICBtb3ZlX21l
bW9yeShlLCBYRU5fSU1HX09GRlNFVCwgX2VuZCAtIF9zdGFydCwgMSk7CiAKICAgICAgICAgICAg
IC8qIFdhbGsgaW5pdGlhbCBwYWdldGFibGVzLCByZWxvY2F0aW5nIHBhZ2UgZGlyZWN0b3J5IGVu
dHJpZXMuICovCiAgICAgICAgICAgICBwbDRlID0gX192YShfX3BhKGlkbGVfcGdfdGFibGUpKTsK
LS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
