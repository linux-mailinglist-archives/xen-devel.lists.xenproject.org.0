Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C566E98045
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 18:38:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Taa-0002zu-7v; Wed, 21 Aug 2019 16:36:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hgEl=WR=bombadil.srs.infradead.org=batv+7dfb623598596b9e0251+5841+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1i0TaZ-0002zY-0K
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 16:35:59 +0000
X-Inumbo-ID: b8d4d8b8-c431-11e9-8980-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8d4d8b8-c431-11e9-8980-bc764e2007e4;
 Wed, 21 Aug 2019 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n4sDkddhj539PENN9LJA59rsK4PK3ek+FLJLPaYhWT0=; b=XGdm+zKHT+jsOfRU4pRGtcg0B2
 5BSQiElGTjhurNzIZQseQHnY6ENzGxWuk3xczsSXqXlrWei6JrojapIF6ncu/8+xFSMPREFoHBTLs
 qJDkywFf3uzhAhcl2HCtMpeAieLfk9SQfXzWu/L6OE++0h9P7BL0nftvFYPHJviHne6XgVBgUVIw2
 6KROqY8+w+UmfDPc5fhjlXwMKQ3ZUdlee5amFS+MYvPsDDD6stgToqik2hnuDDrOwEfDXFxM/HXcV
 9J5MCyvxNGCm0Z4J2rxSH9Dx0qyJtmkEdZ7fHTSC9/6MwDnLb3uf0PZnfVrHw7KpwDjVfL2nY8KGu
 ETEZ0GwQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0TaJ-0003Jx-Rs; Wed, 21 Aug 2019 16:35:43 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1i0TaI-000ilt-Jt; Wed, 21 Aug 2019 17:35:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Wed, 21 Aug 2019 17:35:38 +0100
Message-Id: <20190821163542.172063-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <012a0e6de52d8a0ad50b0b784362cf509768990e.camel@infradead.org>
References: <012a0e6de52d8a0ad50b0b784362cf509768990e.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH v3 1/5] x86/boot: Only jump into low trampoline
 code for real-mode boot
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCklmIHRoZSBuby1yZWFs
LW1vZGUgZmxhZyBpcyBzZXQsIGRvbid0IGdvIHRoZXJlIGF0IGFsbC4gVGhpcyBpcyBhIHByZWx1
ZGUKdG8gbm90IGV2ZW4gcHV0dGluZyBpdCB0aGVyZSBpbiB0aGUgZmlyc3QgcGxhY2UuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdAYW1hem9uLmNvLnVrPgotLS0KIHhlbi9h
cmNoL3g4Ni9ib290L2hlYWQuUyAgICAgICB8IDEwICsrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9i
b290L3RyYW1wb2xpbmUuUyB8ICA0IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFk
LlMgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKaW5kZXggMjZiNjgwNTIxZC4uZDMwMzM3OTA4
MyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNoL3g4
Ni9ib290L2hlYWQuUwpAQCAtNzI3LDcgKzcyNywxNyBAQCB0cmFtcG9saW5lX3NldHVwOgogICAg
ICAgICAvKiBTd2l0Y2ggdG8gbG93LW1lbW9yeSBzdGFjayB3aGljaCBsaXZlcyBhdCB0aGUgZW5k
IG9mIHRyYW1wb2xpbmUgcmVnaW9uLiAqLwogICAgICAgICBtb3YgICAgIHN5bV9mcyh0cmFtcG9s
aW5lX3BoeXMpLCVlZGkKICAgICAgICAgbGVhICAgICBUUkFNUE9MSU5FX1NQQUNFK1RSQU1QT0xJ
TkVfU1RBQ0tfU1BBQ0UoJWVkaSksJWVzcAorICAgICAgICBjbXBiICAgICQwLCBzeW1fZnMoc2tp
cF9yZWFsbW9kZSkKKyAgICAgICAganogICAgICAxZgorICAgICAgICAvKiBJZiBuby1yZWFsLW1v
ZGUsIGp1bXAgc3RyYWlnaHQgdG8gdHJhbXBvbGluZV9wcm90bW9kZV9lbnRyeSAqLworICAgICAg
ICBsZWEgICAgIHRyYW1wb2xpbmVfcHJvdG1vZGVfZW50cnktdHJhbXBvbGluZV9zdGFydCglZWRp
KSwlZWF4CisgICAgICAgIC8qIEVCWCA9PSAwIGluZGljYXRlcyB3ZSBhcmUgdGhlIEJQIChCb290
IFByb2Nlc3NvcikuICovCisgICAgICAgIHhvciAgICAgJWVieCwlZWJ4CisgICAgICAgIGptcCAg
ICAgMmYKKzE6CisgICAgICAgIC8qIEdvIHZpYSAxNi1iaXQgY29kZSBpbiB0cmFtcG9saW5lX2Jv
b3RfY3B1X2VudHJ5ICovCiAgICAgICAgIGxlYSAgICAgdHJhbXBvbGluZV9ib290X2NwdV9lbnRy
eS10cmFtcG9saW5lX3N0YXJ0KCVlZGkpLCVlYXgKKzI6CiAgICAgICAgIHB1c2hsICAgJEJPT1Rf
Q1MzMgogICAgICAgICBwdXNoICAgICVlYXgKIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Jv
b3QvdHJhbXBvbGluZS5TIGIveGVuL2FyY2gveDg2L2Jvb3QvdHJhbXBvbGluZS5TCmluZGV4IDdj
NmEyMzI4ZDIuLjQyOWEwODhiMTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L3RyYW1w
b2xpbmUuUworKysgYi94ZW4vYXJjaC94ODYvYm9vdC90cmFtcG9saW5lLlMKQEAgLTE5NCw5ICsx
OTQsNiBAQCBnZHRfNDg6IC53b3JkICAgNio4LTEKIAogICAgICAgICAuY29kZTMyCiB0cmFtcG9s
aW5lX2Jvb3RfY3B1X2VudHJ5OgotICAgICAgICBjbXBiICAgICQwLGJvb3RzeW1fcmVsKHNraXBf
cmVhbG1vZGUsNSkKLSAgICAgICAgam56ICAgICAuTHNraXBfcmVhbG1vZGUKLQogICAgICAgICAv
KiBMb2FkIHBzZXVkby1yZWFsLW1vZGUgc2VnbWVudHMuICovCiAgICAgICAgIG1vdiAgICAgJEJP
T1RfUFNFVURPUk1fRFMsJWVheAogICAgICAgICBtb3YgICAgICVlYXgsJWRzCkBAIC0yNzYsNyAr
MjczLDYgQEAgdHJhbXBvbGluZV9ib290X2NwdV9lbnRyeToKICAgICAgICAgbW92ICAgICAlZWF4
LCVncwogICAgICAgICBtb3YgICAgICVlYXgsJXNzCiAKLS5Mc2tpcF9yZWFsbW9kZToKICAgICAg
ICAgLyogRUJYID09IDAgaW5kaWNhdGVzIHdlIGFyZSB0aGUgQlAgKEJvb3QgUHJvY2Vzc29yKS4g
Ki8KICAgICAgICAgeG9yICAgICAlZWJ4LCVlYngKIAotLSAKMi4yMS4wCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
