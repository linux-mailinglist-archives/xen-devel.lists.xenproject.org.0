Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4096690255
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 15:02:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybqU-0006xC-Lo; Fri, 16 Aug 2019 13:00:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5/9Y=WM=bombadil.srs.infradead.org=batv+66fbed4ec5b4f711ea06+5836+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1hybqT-0006wS-98
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 13:00:41 +0000
X-Inumbo-ID: d9152aca-c025-11e9-b90c-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9152aca-c025-11e9-b90c-bc764e2007e4;
 Fri, 16 Aug 2019 13:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F0ZI04Z2gl4VC4ZX/bC4s2RBWhX0MgY8nzQR4wraKNQ=; b=f1vxxzFyKA+NCJifPzzho2TNum
 7baPwqfQVRG0dylDRRGaGGlyUVGTsv49YQpMVi+tq9WAq+6D3zpThw3aCUbX/C/ucKbiW3gVoI9Af
 m1pqd1oqN6cMc46T7UjFqg7cpffaKDVd/5Pe20GH8TVf6xKYhxL3wpYxTOKPFPNINvcxqUE7gUVop
 oZP76PPVIbyS0hgpMOWHaIBqwMAGrnbTkcZRTArY1KdKphVAKvPTB6ZAkCIqPKWyD6BOFiWRENYC3
 Y75e/OOxsdlHzDHwUI0wnLO5e2xmU+rj+IyECYg9d1Occ4pG/Z4Q5dFb6WDpS1OQ+N8/8L77PDOjt
 QC9IVg2A==;
Received: from [91.112.187.46] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hybqQ-0006UJ-AW; Fri, 16 Aug 2019 13:00:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 16 Aug 2019 15:00:08 +0200
Message-Id: <20190816130013.31154-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816130013.31154-1-hch@lst.de>
References: <20190816130013.31154-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 06/11] swiotlb-xen: always use dma-direct
 helpers to alloc coherent pages
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

eDg2IGN1cnJlbnRseSBjYWxscyBhbGxvY19wYWdlcywgYnV0IHVzaW5nIGRtYS1kaXJlY3Qgd29y
a3MgYXMgd2VsbAp0aGVyZSwgd2l0aCB0aGUgYWRkZWQgYmVuZWZpdCBvZiB1c2luZyB0aGUgQ01B
IHBvb2wgaWYgYXZhaWxhYmxlLgpUaGUgYmlnZ2VzdCBhZHZhbnRhZ2UgaXMgb2YgY291cnNlIHRv
IHJlbW92ZSBhIHBvaW50bGVzcyBiaXQgb2YKYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGNvZGUuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBhcmNoL3g4
Ni9pbmNsdWRlL2FzbS94ZW4vcGFnZS1jb2hlcmVudC5oIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQog
ZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyAgICAgICAgICAgICAgICB8ICA3ICsrKy0tLS0KIGlu
Y2x1ZGUveGVuL2FybS9wYWdlLWNvaGVyZW50LmggICAgICAgICAgfCAxMiAtLS0tLS0tLS0tLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcGFnZS1jb2hlcmVudC5oIGIvYXJjaC94
ODYvaW5jbHVkZS9hc20veGVuL3BhZ2UtY29oZXJlbnQuaAppbmRleCAxMTY3NzdlN2YzODcuLjhl
ZTMzYzVlZGRlZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20veGVuL3BhZ2UtY29o
ZXJlbnQuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vcGFnZS1jb2hlcmVudC5oCkBA
IC01LDIyICs1LDYgQEAKICNpbmNsdWRlIDxhc20vcGFnZS5oPgogI2luY2x1ZGUgPGxpbnV4L2Rt
YS1tYXBwaW5nLmg+CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCAqeGVuX2FsbG9jX2NvaGVyZW50X3Bh
Z2VzKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzaXplX3Qgc2l6ZSwKLQkJZG1hX2FkZHJfdCAqZG1h
X2hhbmRsZSwgZ2ZwX3QgZmxhZ3MsCi0JCXVuc2lnbmVkIGxvbmcgYXR0cnMpCi17Ci0Jdm9pZCAq
dnN0YXJ0ID0gKHZvaWQqKV9fZ2V0X2ZyZWVfcGFnZXMoZmxhZ3MsIGdldF9vcmRlcihzaXplKSk7
Ci0JKmRtYV9oYW5kbGUgPSB2aXJ0X3RvX3BoeXModnN0YXJ0KTsKLQlyZXR1cm4gdnN0YXJ0Owot
fQotCi1zdGF0aWMgaW5saW5lIHZvaWQgeGVuX2ZyZWVfY29oZXJlbnRfcGFnZXMoc3RydWN0IGRl
dmljZSAqaHdkZXYsIHNpemVfdCBzaXplLAotCQl2b2lkICpjcHVfYWRkciwgZG1hX2FkZHJfdCBk
bWFfaGFuZGxlLAotCQl1bnNpZ25lZCBsb25nIGF0dHJzKQotewotCWZyZWVfcGFnZXMoKHVuc2ln
bmVkIGxvbmcpIGNwdV9hZGRyLCBnZXRfb3JkZXIoc2l6ZSkpOwotfQotCiBzdGF0aWMgaW5saW5l
IHZvaWQgeGVuX2RtYV9tYXBfcGFnZShzdHJ1Y3QgZGV2aWNlICpod2Rldiwgc3RydWN0IHBhZ2Ug
KnBhZ2UsCiAJICAgICBkbWFfYWRkcl90IGRldl9hZGRyLCB1bnNpZ25lZCBsb25nIG9mZnNldCwg
c2l6ZV90IHNpemUsCiAJICAgICBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXIsIHVuc2lnbmVk
IGxvbmcgYXR0cnMpIHsgfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYyBi
L2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKaW5kZXggYjg4MDg2NzdhZTFkLi5mOWRkNGNiNmU0
YjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKKysrIGIvZHJpdmVycy94
ZW4vc3dpb3RsYi14ZW4uYwpAQCAtMjk5LDggKzI5OSw3IEBAIHhlbl9zd2lvdGxiX2FsbG9jX2Nv
aGVyZW50KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzaXplX3Qgc2l6ZSwKIAkgKiBhZGRyZXNzLiBJ
biBmYWN0IG9uIEFSTSB2aXJ0X3RvX3BoeXMgb25seSB3b3JrcyBmb3Iga2VybmVsIGRpcmVjdAog
CSAqIG1hcHBlZCBSQU0gbWVtb3J5LiBBbHNvIHNlZSBjb21tZW50IGJlbG93LgogCSAqLwotCXJl
dCA9IHhlbl9hbGxvY19jb2hlcmVudF9wYWdlcyhod2Rldiwgc2l6ZSwgZG1hX2hhbmRsZSwgZmxh
Z3MsIGF0dHJzKTsKLQorCXJldCA9IGRtYV9kaXJlY3RfYWxsb2MoaHdkZXYsIHNpemUsIGRtYV9o
YW5kbGUsIGZsYWdzLCBhdHRycyk7CiAJaWYgKCFyZXQpCiAJCXJldHVybiByZXQ7CiAKQEAgLTMx
OSw3ICszMTgsNyBAQCB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpo
d2Rldiwgc2l6ZV90IHNpemUsCiAJZWxzZSB7CiAJCWlmICh4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNf
cmVnaW9uKHBoeXMsIG9yZGVyLAogCQkJCQkJIGZsczY0KGRtYV9tYXNrKSwgZG1hX2hhbmRsZSkg
IT0gMCkgewotCQkJeGVuX2ZyZWVfY29oZXJlbnRfcGFnZXMoaHdkZXYsIHNpemUsIHJldCwgKGRt
YV9hZGRyX3QpcGh5cywgYXR0cnMpOworCQkJZG1hX2RpcmVjdF9mcmVlKGh3ZGV2LCBzaXplLCBy
ZXQsIChkbWFfYWRkcl90KXBoeXMsIGF0dHJzKTsKIAkJCXJldHVybiBOVUxMOwogCQl9CiAJCVNl
dFBhZ2VYZW5SZW1hcHBlZCh2aXJ0X3RvX3BhZ2UocmV0KSk7CkBAIC0zNTEsNyArMzUwLDcgQEAg
eGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpod2Rldiwgc2l6ZV90IHNp
emUsIHZvaWQgKnZhZGRyLAogCSAgICBUZXN0Q2xlYXJQYWdlWGVuUmVtYXBwZWQodmlydF90b19w
YWdlKHZhZGRyKSkpCiAJCXhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVy
KTsKIAotCXhlbl9mcmVlX2NvaGVyZW50X3BhZ2VzKGh3ZGV2LCBzaXplLCB2YWRkciwgKGRtYV9h
ZGRyX3QpcGh5cywgYXR0cnMpOworCWRtYV9kaXJlY3RfZnJlZShod2Rldiwgc2l6ZSwgdmFkZHIs
IChkbWFfYWRkcl90KXBoeXMsIGF0dHJzKTsKIH0KIAogLyoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
eGVuL2FybS9wYWdlLWNvaGVyZW50LmggYi9pbmNsdWRlL3hlbi9hcm0vcGFnZS1jb2hlcmVudC5o
CmluZGV4IGRhMmNjMDljOGVkYS4uNDI5NGEzMTMwNWNhIDEwMDY0NAotLS0gYS9pbmNsdWRlL3hl
bi9hcm0vcGFnZS1jb2hlcmVudC5oCisrKyBiL2luY2x1ZGUveGVuL2FybS9wYWdlLWNvaGVyZW50
LmgKQEAgLTE2LDE4ICsxNiw2IEBAIHZvaWQgX194ZW5fZG1hX3N5bmNfc2luZ2xlX2Zvcl9jcHUo
c3RydWN0IGRldmljZSAqaHdkZXYsCiB2b2lkIF9feGVuX2RtYV9zeW5jX3NpbmdsZV9mb3JfZGV2
aWNlKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LAogCQlkbWFfYWRkcl90IGhhbmRsZSwgc2l6ZV90IHNp
emUsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcik7CiAKLXN0YXRpYyBpbmxpbmUgdm9pZCAq
eGVuX2FsbG9jX2NvaGVyZW50X3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzaXplX3Qgc2l6
ZSwKLQkJZG1hX2FkZHJfdCAqZG1hX2hhbmRsZSwgZ2ZwX3QgZmxhZ3MsIHVuc2lnbmVkIGxvbmcg
YXR0cnMpCi17Ci0JcmV0dXJuIGRtYV9kaXJlY3RfYWxsb2MoaHdkZXYsIHNpemUsIGRtYV9oYW5k
bGUsIGZsYWdzLCBhdHRycyk7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9pZCB4ZW5fZnJlZV9jb2hl
cmVudF9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpod2Rldiwgc2l6ZV90IHNpemUsCi0JCXZvaWQgKmNw
dV9hZGRyLCBkbWFfYWRkcl90IGRtYV9oYW5kbGUsIHVuc2lnbmVkIGxvbmcgYXR0cnMpCi17Ci0J
ZG1hX2RpcmVjdF9mcmVlKGh3ZGV2LCBzaXplLCBjcHVfYWRkciwgZG1hX2hhbmRsZSwgYXR0cnMp
OwotfQotCiBzdGF0aWMgaW5saW5lIHZvaWQgeGVuX2RtYV9zeW5jX3NpbmdsZV9mb3JfY3B1KHN0
cnVjdCBkZXZpY2UgKmh3ZGV2LAogCQlkbWFfYWRkcl90IGhhbmRsZSwgc2l6ZV90IHNpemUsIGVu
dW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikKIHsKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
