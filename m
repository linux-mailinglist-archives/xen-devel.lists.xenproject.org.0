Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96690258
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:02:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybqO-0006sx-1l; Fri, 16 Aug 2019 13:00:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5/9Y=WM=bombadil.srs.infradead.org=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hybqM-0006sb-Vj
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:00:35 +0000
X-Inumbo-ID: d5692e1c-c025-11e9-aee9-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5692e1c-c025-11e9-aee9-bc764e2007e4;
 Fri, 16 Aug 2019 13:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A8TgmbGKEJf5DnlqfFLbfgD5onBHfiIzC6S2cbT3aPg=; b=TAcDzDZy4qJ0lZsWjexQmidVAN
 9LF1aX+PVux/pqMPkvMm8ZPGeuHfd21LkGX9LRQehRwiIsDWgbmylxHordMaJuXhGjpcdOYPl88PK
 KWFK1s1VYoUkFbuYqZBrN7RFsNe/FpRdRNKef9IUcEBw2sPKzOFHQ+bFFxot8TyqgzRtNzSgnvd0D
 9GERvzEfo70/GiybmplzyYHArwfnIPBgNdR59iAFrUv+llv1WISjQUY1GRzkUvdyjjaieXEkpVjyL
 ijFUAQHuI3DBnbvBRNo2wtLVERfBbCA7Ow/L2mCW5jabdmG5S6XTMYkVBNnhST/CTxQ2rfu7P1dQb
 jgbTdmhA==;
Received: from [91.112.187.46] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hybqI-0006PW-1E; Fri, 16 Aug 2019 13:00:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 16 Aug 2019 15:00:06 +0200
Message-Id: <20190816130013.31154-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816130013.31154-1-hch@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 04/11] xen/arm: remove xen_dma_ops
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YXJtIGFuZCBhcm02NCBjYW4ganVzdCB1c2UgeGVuX3N3aW90bGJfZG1hX29wcyBkaXJlY3RseSBs
aWtlIHg4Niwgbm8KbmVlZCBmb3IgYSBwb2ludGVyIGluZGlyZWN0aW9uLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogYXJjaC9hcm0vbW0vZG1hLW1h
cHBpbmcuYyAgICB8IDMgKystCiBhcmNoL2FybS94ZW4vbW0uYyAgICAgICAgICAgIHwgNCAtLS0t
CiBhcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMgIHwgMyArKy0KIGluY2x1ZGUveGVuL2FybS9o
eXBlcnZpc29yLmggfCAyIC0tCiA0IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tbS9kbWEtbWFwcGluZy5jIGIvYXJj
aC9hcm0vbW0vZG1hLW1hcHBpbmcuYwppbmRleCA3MzgwOTczOTY0NDUuLjI2NjFjYWQzNjM1OSAx
MDA2NDQKLS0tIGEvYXJjaC9hcm0vbW0vZG1hLW1hcHBpbmcuYworKysgYi9hcmNoL2FybS9tbS9k
bWEtbWFwcGluZy5jCkBAIC0zNSw2ICszNSw3IEBACiAjaW5jbHVkZSA8YXNtL21hY2gvbWFwLmg+
CiAjaW5jbHVkZSA8YXNtL3N5c3RlbV9pbmZvLmg+CiAjaW5jbHVkZSA8YXNtL2RtYS1jb250aWd1
b3VzLmg+CisjaW5jbHVkZSA8eGVuL3N3aW90bGIteGVuLmg+CiAKICNpbmNsdWRlICJkbWEuaCIK
ICNpbmNsdWRlICJtbS5oIgpAQCAtMjM2MCw3ICsyMzYxLDcgQEAgdm9pZCBhcmNoX3NldHVwX2Rt
YV9vcHMoc3RydWN0IGRldmljZSAqZGV2LCB1NjQgZG1hX2Jhc2UsIHU2NCBzaXplLAogCiAjaWZk
ZWYgQ09ORklHX1hFTgogCWlmICh4ZW5faW5pdGlhbF9kb21haW4oKSkKLQkJZGV2LT5kbWFfb3Bz
ID0geGVuX2RtYV9vcHM7CisJCWRldi0+ZG1hX29wcyA9ICZ4ZW5fc3dpb3RsYl9kbWFfb3BzOwog
I2VuZGlmCiAJZGV2LT5hcmNoZGF0YS5kbWFfb3BzX3NldHVwID0gdHJ1ZTsKIH0KZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL3hlbi9tbS5jIGIvYXJjaC9hcm0veGVuL21tLmMKaW5kZXggZDlkYTI0ZmRh
MmY3Li4zODhhNDUwMDJiYWQgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCisrKyBiL2Fy
Y2gvYXJtL3hlbi9tbS5jCkBAIC0xODMsMTYgKzE4MywxMiBAQCB2b2lkIHhlbl9kZXN0cm95X2Nv
bnRpZ3VvdXNfcmVnaW9uKHBoeXNfYWRkcl90IHBzdGFydCwgdW5zaWduZWQgaW50IG9yZGVyKQog
fQogRVhQT1JUX1NZTUJPTF9HUEwoeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24pOwogCi1j
b25zdCBzdHJ1Y3QgZG1hX21hcF9vcHMgKnhlbl9kbWFfb3BzOwotRVhQT1JUX1NZTUJPTCh4ZW5f
ZG1hX29wcyk7Ci0KIGludCBfX2luaXQgeGVuX21tX2luaXQodm9pZCkKIHsKIAlzdHJ1Y3QgZ250
dGFiX2NhY2hlX2ZsdXNoIGNmbHVzaDsKIAlpZiAoIXhlbl9pbml0aWFsX2RvbWFpbigpKQogCQly
ZXR1cm4gMDsKIAl4ZW5fc3dpb3RsYl9pbml0KDEsIGZhbHNlKTsKLQl4ZW5fZG1hX29wcyA9ICZ4
ZW5fc3dpb3RsYl9kbWFfb3BzOwogCiAJY2ZsdXNoLm9wID0gMDsKIAljZmx1c2guYS5kZXZfYnVz
X2FkZHIgPSAwOwpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9tbS9kbWEtbWFwcGluZy5jIGIvYXJj
aC9hcm02NC9tbS9kbWEtbWFwcGluZy5jCmluZGV4IGJkMmIwMzlmNDNhNi4uNGIyNDRhMDM3MzQ5
IDEwMDY0NAotLS0gYS9hcmNoL2FybTY0L21tL2RtYS1tYXBwaW5nLmMKKysrIGIvYXJjaC9hcm02
NC9tbS9kbWEtbWFwcGluZy5jCkBAIC04LDYgKzgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2NhY2hl
Lmg+CiAjaW5jbHVkZSA8bGludXgvZG1hLW5vbmNvaGVyZW50Lmg+CiAjaW5jbHVkZSA8bGludXgv
ZG1hLWlvbW11Lmg+CisjaW5jbHVkZSA8eGVuL3N3aW90bGIteGVuLmg+CiAKICNpbmNsdWRlIDxh
c20vY2FjaGVmbHVzaC5oPgogCkBAIC02NCw2ICs2NSw2IEBAIHZvaWQgYXJjaF9zZXR1cF9kbWFf
b3BzKHN0cnVjdCBkZXZpY2UgKmRldiwgdTY0IGRtYV9iYXNlLCB1NjQgc2l6ZSwKIAogI2lmZGVm
IENPTkZJR19YRU4KIAlpZiAoeGVuX2luaXRpYWxfZG9tYWluKCkpCi0JCWRldi0+ZG1hX29wcyA9
IHhlbl9kbWFfb3BzOworCQlkZXYtPmRtYV9vcHMgPSAmeGVuX3N3aW90bGJfZG1hX29wczsKICNl
bmRpZgogfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS94ZW4vYXJtL2h5cGVydmlzb3IuaCBiL2luY2x1
ZGUveGVuL2FybS9oeXBlcnZpc29yLmgKaW5kZXggMjk4MjU3MWY3Y2MxLi40M2VmMjRkZDAzMGUg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUveGVuL2FybS9oeXBlcnZpc29yLmgKKysrIGIvaW5jbHVkZS94
ZW4vYXJtL2h5cGVydmlzb3IuaApAQCAtMTksOCArMTksNiBAQCBzdGF0aWMgaW5saW5lIGVudW0g
cGFyYXZpcnRfbGF6eV9tb2RlIHBhcmF2aXJ0X2dldF9sYXp5X21vZGUodm9pZCkKIAlyZXR1cm4g
UEFSQVZJUlRfTEFaWV9OT05FOwogfQogCi1leHRlcm4gY29uc3Qgc3RydWN0IGRtYV9tYXBfb3Bz
ICp4ZW5fZG1hX29wczsKLQogI2lmZGVmIENPTkZJR19YRU4KIHZvaWQgX19pbml0IHhlbl9lYXJs
eV9pbml0KHZvaWQpOwogI2Vsc2UKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
