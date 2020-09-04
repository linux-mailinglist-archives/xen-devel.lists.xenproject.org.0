Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929D725D9E0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEBs0-0004lX-Vc; Fri, 04 Sep 2020 13:35:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FXMv=CN=samsung.com=m.szyprowski@srs-us1.protection.inumbo.net>)
 id 1kEBry-0004lS-Cc
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 13:35:10 +0000
X-Inumbo-ID: c6403b35-521c-43fd-ace2-70eec3d23bea
Received: from mailout2.w1.samsung.com (unknown [210.118.77.12])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6403b35-521c-43fd-ace2-70eec3d23bea;
 Fri, 04 Sep 2020 13:35:08 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200904133507euoutp0262af423fb563ebc209372ee0df34cb0f~xmAkOXkT22949829498euoutp02J
 for <xen-devel@lists.xenproject.org>; Fri,  4 Sep 2020 13:35:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200904133507euoutp0262af423fb563ebc209372ee0df34cb0f~xmAkOXkT22949829498euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1599226507;
 bh=M6LUpUR0yeAQpj3I0Hzt+0kX5PVbzJKyJpNcEwtoCPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rJ7vpQZd6k/ci8vZ9dNBFafOcWJX/a61zmJeRw8vmkv/yq5SIMF/EitQPqlxsDPO2
 U9J28iMeduQMOl+NdItqrrrX9N4sh8F14oKzzyOh47arjiyL/WhbX/ZiCpeQWSDAAQ
 VdVOh1bKD+cNEkHl9i4Q7uUdewBdzM4xDwM7Y7+s=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200904133506eucas1p16f875fb1a1d79b21dfd37ea6cc11a0ff~xmAjujuXO1156611566eucas1p1K;
 Fri,  4 Sep 2020 13:35:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 0D.39.06318.A82425F5; Fri,  4
 Sep 2020 14:35:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133506eucas1p170dd4d393f12bf79c9ba4a3c9532c29f~xmAjaoAAZ0117201172eucas1p1y;
 Fri,  4 Sep 2020 13:35:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200904133506eusmtrp2d63e1b01372524ece3713ef834439e25~xmAjZ9k5q0977109771eusmtrp2J;
 Fri,  4 Sep 2020 13:35:06 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-b1-5f52428aa09e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8E.A0.06017.A82425F5; Fri,  4
 Sep 2020 14:35:06 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200904133505eusmtip163609e20523e3ff142d855a3f0b8eaa4~xmAiz6CsY1932019320eusmtip1S;
 Fri,  4 Sep 2020 13:35:05 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Christoph Hellwig
 <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>, Bartlomiej Zolnierkiewicz
 <b.zolnierkie@samsung.com>, linux-arm-kernel@lists.infradead.org, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
Subject: [PATCH v10 21/30] drm: xen: fix common struct sg_table related issues
Date: Fri,  4 Sep 2020 15:17:02 +0200
Message-Id: <20200904131711.12950-22-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904131711.12950-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSfSxVcRjH+51zz73HzbHTJX5RsbvVqg0Zf5zlTrHWzj9tprU2ltvFCcWl
 e1DMMMrL9TJiCIuFvFO6EUrIa3IZMm8NsRnztrwU85LTQf99n8/3++x59uzBUUkDZox7KwMY
 lVLhIxWKBTXtm73magcn+eXGCksqUduFUG8zqzBqryYFpQbXl4VUSVkbQuV9tqXWBqcQqnp6
 CKMG6nOEVEXrDxG1UraMUc0rMxj1W5OKXCPo8pflgB4vrAP0p408AV27MYnRE/EdCP2uIJwe
 251G6dThIkB/WRkU0A0jEUI6SVMK6NXqs466zmKZB+PjHcSoLO3uib1yS9uBf5Lek5jdcRAB
 Fo+rgQ4OSRuYtLAiUgMxLiGLAVztTBbwxRqA9W2jKF+sApi29wI5bEkYikZ4owjAzZwicNRS
 3b8LuJSQtILqRbWQ0wbkMwA7E3W5EEr+QaD2daeIM/RJR7gW24SpAY4LyHMwr8eDwwRpB0uK
 p0T8NFNY9qYJ5bTOPn+fOYPxXCuC6RsyXl+HE0sLB3l9ON+hOdCn4V5d7r9NIRkF4JS2QsQX
 CQAORGYCPmULx7VbQm4JlLwIq+oteWwP4yNrBByGpB4cXjzBYXRfPq/JQHlMwNhoCZ8+D7M6
 Ko/GNvf1o7ymYUll/8FJU/bPMLEpSgamWf+H5QFQCoyYQNbXk2GtlcxjC1bhywYqPS3c/Xyr
 wf5Lde92rH8AjdtuLYDEgVSXOHbVSS7BFEFssG8LgDgqNSAcerpdJYSHIjiEUfnJVYE+DNsC
 THCB1IiwfjV3V0J6KgKYhwzjz6gOXQTXMY4AITvu2XoDGtd58/xbUbRh3Pf0EKMLJz+2C0+F
 a9c2escXikeXXB4k22blGzWa6c3P0cTtgZ4r2yOzoTfCCsesSqU7X72UT+8vnXG702RmUtn1
 KzotTGa4VTApaw1KrmD7bL45yzJu/oyTx+S7aOxDzQ2JbNnmbKshVe82XSsXP5IKWC+F1SVU
 xSr+AqiFDBtOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xu7pdTkHxBse3S1j0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs1h75C67xYfV71ktDn54wmrx
 fctkJgdejzXz1jB63Fm6k9Fj77cFLB7bvz1g9bjffZzJY/OSeo/b/x4ze0y+sZzR4/CHKywe
 u282sHn0bVnF6PF5k1wAT5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
 TUpqTmZZapG+XYJexvxVxxgL+vgq2v/dYWxgfMvdxcjJISFgItFzrY2pi5GLQ0hgKaNEX+MU
 NoiEjMTJaQ2sELawxJ9rXWwQRZ8YJfY0PmcBSbAJGEp0vYVIiAh0MkpM6/7IDuIwC/xjkjix
 dzsTSJWwgJ/E1u9XGbsYOThYBFQlFpxNAQnzCthJrFzxkB1ig7zE6g0HmEFsTqD41hlPwDYL
 CdhKfJizmGUCI98CRoZVjCKppcW56bnFRnrFibnFpXnpesn5uZsYgVGz7djPLTsYu94FH2IU
 4GBU4uFlsA+KF2JNLCuuzD3EKMHBrCTC63T2dJwQb0piZVVqUX58UWlOavEhRlOgmyYyS4km
 5wMjOq8k3tDU0NzC0tDc2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA6NZYzFDSrT+
 zEYH20lhl1sVs9t9z81h2F3m6iVk8K3lgOffF6wS1WH3/t2Pn5H8mKPzesEVxdblAt2tPhqM
 UmZcT1V2b+T4dmKebaoJm6mZi98WBTX1ZcmFMh/O/edUiS8/v7z+0Ml9P1p/fdsk/2ReqVTa
 kYvJOZf7vA9XtsqpFLx7u//+ESWW4oxEQy3mouJEAH4u/TOwAgAA
X-CMS-MailID: 20200904133506eucas1p170dd4d393f12bf79c9ba4a3c9532c29f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200904133506eucas1p170dd4d393f12bf79c9ba4a3c9532c29f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200904133506eucas1p170dd4d393f12bf79c9ba4a3c9532c29f
References: <20200904131711.12950-1-m.szyprowski@samsung.com>
 <CGME20200904133506eucas1p170dd4d393f12bf79c9ba4a3c9532c29f@eucas1p1.samsung.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
returns the number of the created entries in the DMA address space.
However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
dma_unmap_sg must be called with the original number of the entries
passed to the dma_map_sg().

struct sg_table is a common structure used for describing a non-contiguous
memory buffer, used commonly in the DRM and graphics subsystems. It
consists of a scatterlist with memory pages and DMA addresses (sgl entry),
as well as the number of scatterlist entries: CPU pages (orig_nents entry)
and DMA mapped pages (nents entry).

It turned out that it was a common mistake to misuse nents and orig_nents
entries, calling DMA-mapping functions with a wrong number of entries or
ignoring the number of mapped entries returned by the dma_map_sg()
function.

Fix the code to refer to proper nents or orig_nents entries. This driver
reports the number of the pages in the imported scatterlist, so it should
refer to sg_table->orig_nents entry.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 39ff95b75357..0e57c80058b2 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -216,7 +216,7 @@ xen_drm_front_gem_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(ret);
 
 	DRM_DEBUG("Imported buffer of size %zu with nents %u\n",
-		  size, sgt->nents);
+		  size, sgt->orig_nents);
 
 	return &xen_obj->base;
 }
-- 
2.17.1


