Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680072433F4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 08:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k66c8-00026F-BV; Thu, 13 Aug 2020 06:21:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cFh=BX=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1k66c7-00025f-5K
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 06:21:23 +0000
X-Inumbo-ID: f6652202-d1b8-4314-92bd-23d5f617ab86
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6652202-d1b8-4314-92bd-23d5f617ab86;
 Thu, 13 Aug 2020 06:21:18 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z14so4921460ljm.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 23:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C9rQWo6syT3cF37ubQbW7IMBpmbXyJ1+Ny4Hmm3+D9g=;
 b=IdrdS+jhl4Oa2APlUEh5hsmWHLnjlvcEeLbNwd/9wCAajQpSXHE0zHJiFdgcdiK26J
 WFO1pugdzNj04qdFOagFuIp86Sv+478MpJWML1/H1kFhojn/ZOWrcGdudLoSBrsxQlzR
 EcAC59A3E3nwwwp9ENtv3ctQM7YTyIq69C2d3wIoR6R4PQMfsF7LGC2lLBut5bKO3Zu/
 4WoL1gVFon0Xdx/deulTB/UQkk/ztsecEql/JO68s3NP1mEPDzfT/LNeQz9VllyIv0PT
 9Tj8AssK9SOO8AwcvjXm8WGOQKyaIJFbORNO4CgMimKGYH01+Ebjmr55PZr3TuSs8iQd
 jupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C9rQWo6syT3cF37ubQbW7IMBpmbXyJ1+Ny4Hmm3+D9g=;
 b=gwVgcolGLpiZfwKKl4BDnOtpUyCvhJl3HzTlEku1LA8pFE9jQSJF05FNj6VBIUmfEr
 6KP61ADiitUy0GNZmA0eCYEWOawIgoRS1+kySaHYx4s91n30/rfXDSFJtA4fIssVcKE3
 Wlm3dGtZW2ALBTW4Lr1/hOZoC04LZUPxUibeDA4D3DIpg/wFFewLRGjdQ+TKH8m8eL7m
 ZRtJCqg4ewQzit3jrNZd+ApymA8frWzpUeA/aCgOPEtQD9qzjbhONbUY/RgUflr8eJNc
 hOwCL9d8S29ZXHVeIHOLkdP2fo0RnUuF7u5+fW+fXBFFYhygw3iDqtzcU0bRM5H5iyc3
 gFlg==
X-Gm-Message-State: AOAM531fHde+L7Cg305ENj/4FSZRQUs2q3GzgxtmbU7lkmFZ8Pi8+Hqu
 ZpUq/Q6jKHcS4VAigqbSGYL/tx/vORk=
X-Google-Smtp-Source: ABdhPJw/Ec8BtgwxAUxLq9z6Cta34KMASOkvjBC0EU4THFS9zVDqv01yrhycLJUzJXCaRxXFKv6jLg==
X-Received: by 2002:a2e:8098:: with SMTP id i24mr1308903ljg.50.1597299676613; 
 Wed, 12 Aug 2020 23:21:16 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:16 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Cc: sstabellini@kernel.org, dan.carpenter@oracle.com,
 intel-gfx@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 stable@vger.kernel.org
Subject: [PATCH v2 1/5] xen/gntdev: Fix dmabuf import with non-zero sgt offset
Date: Thu, 13 Aug 2020 09:21:09 +0300
Message-Id: <20200813062113.11030-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813062113.11030-1-andr2000@gmail.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
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

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

It is possible that the scatter-gather table during dmabuf import has
non-zero offset of the data, but user-space doesn't expect that.
Fix this by failing the import, so user-space doesn't access wrong data.

Fixes: bf8dc55b1358 ("xen/gntdev: Implement dma-buf import functionality")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Juergen Gross <jgross@suse.com>
Cc: <stable@vger.kernel.org>
---
 drivers/xen/gntdev-dmabuf.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 75d3bb948bf3..b1b6eebafd5d 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -613,6 +613,14 @@ dmabuf_imp_to_refs(struct gntdev_dmabuf_priv *priv, struct device *dev,
 		goto fail_detach;
 	}
 
+	/* Check that we have zero offset. */
+	if (sgt->sgl->offset) {
+		ret = ERR_PTR(-EINVAL);
+		pr_debug("DMA buffer has %d bytes offset, user-space expects 0\n",
+			 sgt->sgl->offset);
+		goto fail_unmap;
+	}
+
 	/* Check number of pages that imported buffer has. */
 	if (attach->dmabuf->size != gntdev_dmabuf->nr_pages << PAGE_SHIFT) {
 		ret = ERR_PTR(-EINVAL);
-- 
2.17.1


