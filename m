Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E597C234628
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:51:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UVL-0001JL-PU; Fri, 31 Jul 2020 12:51:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YcXq=BK=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1k1UVK-0001HZ-I5
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:51:18 +0000
X-Inumbo-ID: 84af1b9c-d32c-11ea-8e30-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84af1b9c-d32c-11ea-8e30-bc764e2007e4;
 Fri, 31 Jul 2020 12:51:15 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j22so10896253lfm.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2020 05:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=P8zgpF044pgTW1uK5Q8AXrv/7bel3rEWKcAtjS7WDeo=;
 b=WgUyGPBfwmJ9bTlFZ1iykzmaC+/eyxO2mETTCyh0EN7DEuu6cfihmRQOfjN0UX17KJ
 1XK/aClkr4jouIfR2Uq33SHtLP56E4y8DgZ87NMJDRnE/5HMKnL0qQRmTaRqEurFsoxI
 D/R3+eHgdIAl42+OdJRKAhPJheLy6IATe2ljDZKS9Ir/9TnHfgeT9ND6Q078g/e5NeAs
 I2W7ZBR4JYFb7XWCyVQlSdl0Ydv93Ytn/B8SI+DrRwYKxIF7FMjE6FYcroqJuyHyrA1S
 e7Z785IPUZkU0urptiMhDbgonuN0KgLkpcNKcT+5pvixgh0YZDlTJ29FOCn97utl+t8+
 hahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=P8zgpF044pgTW1uK5Q8AXrv/7bel3rEWKcAtjS7WDeo=;
 b=rv3q0HIgph9RvopwE15MHDPbwNdcwxyW/8MD9y7kG0wdGxSvZyEq9LTD3oNsMmjBdK
 3nzYVXiRKX4aTVYg7aDg4YhjPrav2dZdMwOqs3mfIQLcuT7UqhE+6NDDk9PRuHVPpqy8
 a2MdvIUZdLX1fFXggRSXH2HjB2Jf9dhqXrOlR3JFCsNqJVYyze04ik+s9+qr5yaT1bHx
 zPpiQn9af63FnNBoM+1NNf+rIfNpgKZ1lURqAgYB9rMaJHAon4dpg0lsgvtEm2sDLRdV
 6lzXbe5buBhfmJqOxxm8xPgr9i1eqYnG5UqcYMTZk33b4x/ewuyeIukwpDESFpToDv8S
 cSTg==
X-Gm-Message-State: AOAM531M4tTvHi68nwPo4T0owXUZV02iETMwvwQpqfrkD7arbrhs7CwJ
 AXoHVCYoAWB0tuMgYr17A4j0guzb45Y=
X-Google-Smtp-Source: ABdhPJzATe0fCD2sbhssHSnUfNXc6kWFAY41kSspFrVQTiQcz0U9VH0isUKE3+W9ohrCIfVkdQXBSg==
X-Received: by 2002:ac2:5683:: with SMTP id 3mr1948307lfr.69.1596199873919;
 Fri, 31 Jul 2020 05:51:13 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id s2sm1923362lfs.4.2020.07.31.05.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 05:51:13 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/6] xen/gntdev: Fix dmabuf import with non-zero sgt offset
Date: Fri, 31 Jul 2020 15:51:04 +0300
Message-Id: <20200731125109.18666-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731125109.18666-1-andr2000@gmail.com>
References: <20200731125109.18666-1-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

It is possible that the scatter-gather table during dmabuf import has
non-zero offset of the data, but user-space doesn't expect that.
Fix this by failing the import, so user-space doesn't access wrong data.

Fixes: 37ccb44d0b00 ("xen/gntdev: Implement dma-buf import functionality")

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
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


