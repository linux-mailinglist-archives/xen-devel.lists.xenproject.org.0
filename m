Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEF8A5738
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 15:07:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4m0V-0003hP-UL; Mon, 02 Sep 2019 13:04:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hpg3=W5=bombadil.srs.infradead.org=batv+8d7e6b8ef813b711cfc0+5853+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i4m0T-0003gY-Um
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:04:29 +0000
X-Inumbo-ID: 26388ae0-cd82-11e9-8980-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26388ae0-cd82-11e9-8980-bc764e2007e4;
 Mon, 02 Sep 2019 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ta9M2b2y7wj8yOyfpMAIMWmSlpU0UyW1ZNcRY8yDGCI=; b=R/7x+fHstCiuPGDtTHZn3ll3Vq
 Bje0x8mwce/f0sqmLfpKhlzht358B2ZCHH5NQIfoFuM4jMAzL8nXsLiMLhuXBa0imvQ1m2YnjijdP
 m4damP9kMDPrjWt5jsPBW9o/EL1AfD2NDjGpsag7XmbClPAsxIcv/QuF5Zryeen6r3c6KjjSP7qe0
 qv/l3JSmpx00SKgeMwjRNwlMp/NhSOLsl37N6vA4sslaJhHkNqFFFXNGxmxDHqiUPr8HKjrvv10Wh
 yusnBdKDI2O1aOBewMIYkw/jzkmP8HJQI6gU1gh+JtUdwrZdhzm23/WXdtwKfbDjrZnqdFeiFkesu
 poUiRbxA==;
Received: from [2001:4bb8:18c:1755:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i4m04-0001Ym-VB; Mon, 02 Sep 2019 13:04:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Mon,  2 Sep 2019 15:03:33 +0200
Message-Id: <20190902130339.23163-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190902130339.23163-1-hch@lst.de>
References: <20190902130339.23163-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 07/13] swiotlb-xen: remove xen_swiotlb_dma_mmap
 and -xen_swiotlb_dma_get_sgtable
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

VGhlcmUgaXMgbm8gbmVlZCB0byB3cmFwIHRoZSBjb21tb24gdmVyc2lvbiwganVzdCB3aXJlIHRo
ZW0gdXAgZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KLS0tCiBkcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jIHwgMjkgKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDI3IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJz
L3hlbi9zd2lvdGxiLXhlbi5jCmluZGV4IGVlZTg2Y2M3MDQ2Yi4uYjg4MDg2NzdhZTFkIDEwMDY0
NAotLS0gYS9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCisrKyBiL2RyaXZlcnMveGVuL3N3aW90
bGIteGVuLmMKQEAgLTU0NywzMSArNTQ3LDYgQEAgeGVuX3N3aW90bGJfZG1hX3N1cHBvcnRlZChz
dHJ1Y3QgZGV2aWNlICpod2RldiwgdTY0IG1hc2spCiAJcmV0dXJuIHhlbl92aXJ0X3RvX2J1cyh4
ZW5faW9fdGxiX2VuZCAtIDEpIDw9IG1hc2s7CiB9CiAKLS8qCi0gKiBDcmVhdGUgdXNlcnNwYWNl
IG1hcHBpbmcgZm9yIHRoZSBETUEtY29oZXJlbnQgbWVtb3J5LgotICogVGhpcyBmdW5jdGlvbiBz
aG91bGQgYmUgY2FsbGVkIHdpdGggdGhlIHBhZ2VzIGZyb20gdGhlIGN1cnJlbnQgZG9tYWluIG9u
bHksCi0gKiBwYXNzaW5nIHBhZ2VzIG1hcHBlZCBmcm9tIG90aGVyIGRvbWFpbnMgd291bGQgbGVh
ZCB0byBtZW1vcnkgY29ycnVwdGlvbi4KLSAqLwotc3RhdGljIGludAoteGVuX3N3aW90bGJfZG1h
X21tYXAoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKLQkJ
ICAgICB2b2lkICpjcHVfYWRkciwgZG1hX2FkZHJfdCBkbWFfYWRkciwgc2l6ZV90IHNpemUsCi0J
CSAgICAgdW5zaWduZWQgbG9uZyBhdHRycykKLXsKLQlyZXR1cm4gZG1hX2NvbW1vbl9tbWFwKGRl
diwgdm1hLCBjcHVfYWRkciwgZG1hX2FkZHIsIHNpemUsIGF0dHJzKTsKLX0KLQotLyoKLSAqIFRo
aXMgZnVuY3Rpb24gc2hvdWxkIGJlIGNhbGxlZCB3aXRoIHRoZSBwYWdlcyBmcm9tIHRoZSBjdXJy
ZW50IGRvbWFpbiBvbmx5LAotICogcGFzc2luZyBwYWdlcyBtYXBwZWQgZnJvbSBvdGhlciBkb21h
aW5zIHdvdWxkIGxlYWQgdG8gbWVtb3J5IGNvcnJ1cHRpb24uCi0gKi8KLXN0YXRpYyBpbnQKLXhl
bl9zd2lvdGxiX2dldF9zZ3RhYmxlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNnX3RhYmxl
ICpzZ3QsCi0JCQl2b2lkICpjcHVfYWRkciwgZG1hX2FkZHJfdCBoYW5kbGUsIHNpemVfdCBzaXpl
LAotCQkJdW5zaWduZWQgbG9uZyBhdHRycykKLXsKLQlyZXR1cm4gZG1hX2NvbW1vbl9nZXRfc2d0
YWJsZShkZXYsIHNndCwgY3B1X2FkZHIsIGhhbmRsZSwgc2l6ZSwgYXR0cnMpOwotfQotCiBjb25z
dCBzdHJ1Y3QgZG1hX21hcF9vcHMgeGVuX3N3aW90bGJfZG1hX29wcyA9IHsKIAkuYWxsb2MgPSB4
ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudCwKIAkuZnJlZSA9IHhlbl9zd2lvdGxiX2ZyZWVfY29o
ZXJlbnQsCkBAIC01ODQsNiArNTU5LDYgQEAgY29uc3Qgc3RydWN0IGRtYV9tYXBfb3BzIHhlbl9z
d2lvdGxiX2RtYV9vcHMgPSB7CiAJLm1hcF9wYWdlID0geGVuX3N3aW90bGJfbWFwX3BhZ2UsCiAJ
LnVubWFwX3BhZ2UgPSB4ZW5fc3dpb3RsYl91bm1hcF9wYWdlLAogCS5kbWFfc3VwcG9ydGVkID0g
eGVuX3N3aW90bGJfZG1hX3N1cHBvcnRlZCwKLQkubW1hcCA9IHhlbl9zd2lvdGxiX2RtYV9tbWFw
LAotCS5nZXRfc2d0YWJsZSA9IHhlbl9zd2lvdGxiX2dldF9zZ3RhYmxlLAorCS5tbWFwID0gZG1h
X2NvbW1vbl9tbWFwLAorCS5nZXRfc2d0YWJsZSA9IGRtYV9jb21tb25fZ2V0X3NndGFibGUsCiB9
OwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
