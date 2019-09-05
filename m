Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D713BAA1F1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 13:46:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5q8b-0002BT-J9; Thu, 05 Sep 2019 11:41:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C2sq=XA=bombadil.srs.infradead.org=batv+6d116066f5ba208d77c0+5856+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1i5q8Z-0002Ae-V1
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 11:41:15 +0000
X-Inumbo-ID: 0b86982a-cfd2-11e9-a337-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b86982a-cfd2-11e9-a337-bc764e2007e4;
 Thu, 05 Sep 2019 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ta9M2b2y7wj8yOyfpMAIMWmSlpU0UyW1ZNcRY8yDGCI=; b=AwL8wt4pWATWp3lmEcCq8Od5sT
 LLtjMGYUO8ITIwvHTzrZjk4T8wmEHxwQx4o5TMg99IrQgIYtJM5pkBRZht6MIf0HXdW/daTjGOPkc
 2fdigBEBZj/Wd84pb/LwODoQ5uSfOx726vfgX5EACmUC/QJmVbzfuclAOcKhk33gpcjPVk+dViz0N
 oSciaEU3UqX1UT6TZhMzHyWqHmttmyEzkh3ER57mDQFLqSlS0oyxFJtjYaTi39ZL3Z5IuT3rUnxHc
 PMrftY03g3Ukh+xblnzyEnBGX0tftexx3FJfB7TlwBav2Bx4qgBCRCrgxIlYAUKY/T6M1/JPkfQIh
 4KXKrmHw==;
Received: from [2001:4bb8:18c:1755:a4b2:9562:6bf1:4bb9] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5q8L-000519-Cd; Thu, 05 Sep 2019 11:41:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, gross@suse.com,
 boris.ostrovsky@oracle.com
Date: Thu,  5 Sep 2019 13:34:04 +0200
Message-Id: <20190905113408.3104-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190905113408.3104-1-hch@lst.de>
References: <20190905113408.3104-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 07/11] swiotlb-xen: remove xen_swiotlb_dma_mmap
 and xen_swiotlb_dma_get_sgtable
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
