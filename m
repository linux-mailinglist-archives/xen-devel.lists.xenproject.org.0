Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35FE14DEBF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:16:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCSo-0004io-ME; Thu, 30 Jan 2020 16:14:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RwoG=3T=merlin.srs.infradead.org=batv+f9651308fc69d1c188a8+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCSm-0004hg-NL
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:14:40 +0000
X-Inumbo-ID: 78caf2ba-437b-11ea-a933-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78caf2ba-437b-11ea-a933-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQFPxvjbG/EwWLKgg6TYeH0pv/puTiqYoV1kR249sSU=; b=zgFQVEzgsQJyVaVsS8xoOhqMF4
 Ab/RzYf/MeImA12hEreW19krDoLRE/piY5yiR9ZDnDTyGnG+Adv4puHGY4WXK0boQSyPVRNW17m1s
 Ay8ayT3KedPQYdxAcYQuHw08igydv+I2w1t5uRO+5F0CoKVrxdVeQd2oscLHwkhtQQIVGTSY++9Fr
 +eJ8gedinb0A10nk0NlIm4M8QY11gS1pHymebjwdWt+FZ76V6go08zEeiGyyogAZukLm/QI72IMKR
 Hm5ctlb+27a/plOklIVKew0Y5mORR7OF/FgEypP4hZ33vhV8hftuGin2DguOQpkW4uuJy2eV2u0WO
 RFS6t1Vw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-0005Tj-6S; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009kdT-Co; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:17 +0000
Message-Id: <20200130161330.2324143-9-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130161330.2324143-1-dwmw2@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
 <20200130161330.2324143-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 09/22] Add basic lu_save_all() shell
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 paul@xen.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Hongyan Xia <hongyxia@amazon.com>, Amit Shah <aams@amazon.de>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCi0tLQogeGVuL2NvbW1v
bi9rZXhlYy5jICAgICB8ICA2ICsrKysrCiB4ZW4vY29tbW9uL2x1L01ha2VmaWxlIHwgIDIgKy0K
IHhlbi9jb21tb24vbHUvc2F2ZS5jICAgfCA1NiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL3hlbi9sdS5oICAgfCAgMyArKysKIDQgZmlsZXMg
Y2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHhlbi9jb21tb24vbHUvc2F2ZS5jCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9rZXhlYy5j
IGIveGVuL2NvbW1vbi9rZXhlYy5jCmluZGV4IGE3OGFhNGY1YjAuLjY1OGZlM2QzZDQgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24va2V4ZWMuYworKysgYi94ZW4vY29tbW9uL2tleGVjLmMKQEAgLTI5
LDYgKzI5LDcgQEAKICNpbmNsdWRlIDxwdWJsaWMvZWxmbm90ZS5oPgogI2luY2x1ZGUgPHhzbS94
c20uaD4KICNpbmNsdWRlIDx4ZW4vY3B1Lmg+CisjaW5jbHVkZSA8eGVuL2x1Lmg+CiAjaWZkZWYg
Q09ORklHX0NPTVBBVAogI2luY2x1ZGUgPGNvbXBhdC9rZXhlYy5oPgogI2VuZGlmCkBAIC00MDcs
NiArNDA4LDExIEBAIHN0YXRpYyBsb25nIGtleGVjX3JlYm9vdCh2b2lkICpfaW1hZ2UpCiBzdGF0
aWMgbG9uZyBrZXhlY19saXZlX3VwZGF0ZSh2b2lkICpfaW1hZ2UpCiB7CiAgICAgc3RydWN0IGtl
eGVjX2ltYWdlICppbWFnZSA9IF9pbWFnZTsKKyAgICBpbnQgcmV0OworCisgICAgcmV0ID0gbHVf
c2F2ZV9hbGwoaW1hZ2UpOworICAgIGlmIChyZXQpCisgICAgICAgIHJldHVybiByZXQ7CiAKICAg
ICBrZXhlY2luZyA9IFRSVUU7CiAKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbHUvTWFrZWZpbGUg
Yi94ZW4vY29tbW9uL2x1L01ha2VmaWxlCmluZGV4IDY4OTkxYjNjYTQuLjdiN2Q5NzVmNjUgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vbHUvTWFrZWZpbGUKKysrIGIveGVuL2NvbW1vbi9sdS9NYWtl
ZmlsZQpAQCAtMSArMSBAQAotb2JqLXkgKz0gc3RyZWFtLm8KK29iai15ICs9IHN0cmVhbS5vIHNh
dmUubwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9sdS9zYXZlLmMgYi94ZW4vY29tbW9uL2x1L3Nh
dmUuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5jNDM5NjJjNDRlCi0t
LSAvZGV2L251bGwKKysrIGIveGVuL2NvbW1vbi9sdS9zYXZlLmMKQEAgLTAsMCArMSw1NiBAQAor
CisjaW5jbHVkZSA8eGVuL3R5cGVzLmg+CisjaW5jbHVkZSA8eGVuL3ZtYXAuaD4KKyNpbmNsdWRl
IDx4ZW4vbHUuaD4KKyNpbmNsdWRlIDx4ZW4va2ltYWdlLmg+CisjaW5jbHVkZSA8eGVuL3NjaGVk
Lmg+CisKK2ludCBsdV9zYXZlX2dsb2JhbChzdHJ1Y3QgbHVfc3RyZWFtICpzdHJlYW0pCit7Cisg
ICAgcmV0dXJuIDA7Cit9CisKKworaW50IGx1X3NhdmVfZG9tYWluKHN0cnVjdCBsdV9zdHJlYW0g
KnN0cmVhbSwgc3RydWN0IGRvbWFpbiAqZCkKK3sKKyAgICByZXR1cm4gMDsKK30KKworaW50IGx1
X3NhdmVfYWxsKHN0cnVjdCBrZXhlY19pbWFnZSAqaW1hZ2UpCit7CisgICAgc3RydWN0IGx1X3N0
cmVhbSBzdHJlYW07CisgICAgc3RydWN0IGRvbWFpbiAqZDsKKyAgICBpbnQgcmV0OworCisgICAg
bWVtc2V0KCZzdHJlYW0sIDAsIHNpemVvZihzdHJlYW0pKTsKKworICAgIHJldCA9IGx1X3NhdmVf
Z2xvYmFsKCZzdHJlYW0pOworCisgICAgZm9yX2VhY2hfZG9tYWluICggZCApCisgICAgeworICAg
ICAgICBpZiAocmV0KQorICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgcmV0ID0gbHVfc2F2
ZV9kb21haW4oJnN0cmVhbSwgZCk7CisgICAgfQorCisgICAgaWYgKCFyZXQpCisgICAgICAgIHJl
dCA9IGtpbWFnZV9hZGRfbGl2ZV91cGRhdGVfZGF0YShpbWFnZSwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgX21mbih2aXJ0X3RvX21mbihzdHJlYW0ucGFnZWxpc3QpKSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RyZWFtLm5yX3BhZ2VzKTsKKworICAgIGlmIChyZXQpCisgICAgICAg
IGx1X3N0cmVhbV9mcmVlKCZzdHJlYW0pOworCisgICAgcmV0dXJuIHJldDsKK30KKworLyoKKyAq
IExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKKyAq
IGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lkdGg6IDQKKyAqIGluZGVudC10YWJzLW1vZGU6
IG5pbAorICogRW5kOgorICovCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbHUuaCBiL3hl
bi9pbmNsdWRlL3hlbi9sdS5oCmluZGV4IDIxZWUxODI1ZDMuLmYyMzJhNTY5NTAgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9sdS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9sdS5oCkBAIC0x
OSw2ICsxOSw5IEBAIHZvaWQgbHVfc3RyZWFtX2VuZF9yZXNlcnZhdGlvbihzdHJ1Y3QgbHVfc3Ry
ZWFtICpzdHJlYW0sIHNpemVfdCBzaXplKTsKIGludCBsdV9zdHJlYW1fYXBwZW5kKHN0cnVjdCBs
dV9zdHJlYW0gKnN0cmVhbSwgY29uc3Qgdm9pZCAqZGF0YSwgc2l6ZV90IHNpemUpOwogdm9pZCBs
dV9zdHJlYW1fZnJlZShzdHJ1Y3QgbHVfc3RyZWFtICpzdHJlYW0pOwogCitzdHJ1Y3Qga2V4ZWNf
aW1hZ2U7CitpbnQgbHVfc2F2ZV9hbGwoc3RydWN0IGtleGVjX2ltYWdlICppbWFnZSk7CisKICNl
bmRpZiAvKiBfX1hFTl9MVV9IX18gKi8KIAogLyoKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
