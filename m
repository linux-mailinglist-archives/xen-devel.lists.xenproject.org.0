Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C945F595C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 19:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416381.661054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og8Va-0004DE-17; Wed, 05 Oct 2022 17:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416381.661054; Wed, 05 Oct 2022 17:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og8VZ-0004B7-Ta; Wed, 05 Oct 2022 17:48:37 +0000
Received: by outflank-mailman (input) for mailman id 416381;
 Wed, 05 Oct 2022 17:48:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QTo3=2G=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1og8VY-0003fH-Af
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 17:48:36 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef7b0aa5-44d5-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 19:48:35 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id o21so744309ejm.11
 for <xen-devel@lists.xenproject.org>; Wed, 05 Oct 2022 10:48:35 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 ee32-20020a056402292000b0044e7862ab3fsm4320697edb.7.2022.10.05.10.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 10:48:34 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ef7b0aa5-44d5-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ygXgrMvwI83oTWciRbWlrh/kQps7FfPG+yghSVi9/U=;
        b=NDy/TvK3L7DC7SkJDhT99xIPSRmwqUPUnB9VOPISmgU4v7mI2YvcoR1ddz/qLrnw+0
         JtBz1FcFB8Hh4CpZJIL5Q+9dR1Kvk7FSPZ0QY57RKem+vG3zMyPQvs2nEtW3eP9DlSte
         Q4Q00ZX8taSGQ9FGTZwSmDEE/CU7q3Waw2GQgwV/QleXYiFIkD1QBokMpLj5yTgyFGg3
         H2LNVp4TR3NuYpy0KYQENae1x6fej8VH6Je2Fa2B8fJCHhTADIKgj4isSF/rvP0nhV5E
         3bMD3Rl83GS3q/aaSd70GK9gqKLw7jMxWByorqPO22D1SN2zgBz4kAvKbkZBYcwxBZDh
         KA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ygXgrMvwI83oTWciRbWlrh/kQps7FfPG+yghSVi9/U=;
        b=C+zR+qAQUNDA/CDhPkDrXXZDFlTPIYt7TSB7J4ImKmKcs3C4nrW3EUkmtfyoRVmNjR
         c6XZk4h7BmO/dQujdUHFHrUXnlIcfdB/jCTn/GLZfxe8dO+GnU1plmMvcXReJoPgk4Ph
         D5lyxxq14z1jyfyV4HQC3o2P+3a7C96lzfYNuxP7mXYOKP0g77wq9iST2EVyW/HcQVGM
         RLqYlRgRPJskYxy8HlWpPs30Q8lCIULDHszmvoJyGyh9zbpL6e5pQ4oNXYkSk0zOUrob
         5rW0/YPvLs8SOwjkiodv3eCUwSthMAAB+BSK7yeMrdTsDW4K3csOCstDbEmWm9OihaMB
         zbgg==
X-Gm-Message-State: ACrzQf2N0d0k7r4rqb22vO0LKsqQMyHeoyYBfC4EBbR5Fx4w0ewkob5S
	a6EzfYUMMKHB9obDrhOifVLSTtbhCDM=
X-Google-Smtp-Source: AMsMyM4gLayulwBKZ3oV/w4C4GfrZsOmtMMi5W8Of0+00e76+GDcK9bgiaaGE+JcXnb5caWk4vJrHg==
X-Received: by 2002:a17:906:cc14:b0:78d:2267:3a57 with SMTP id ml20-20020a170906cc1400b0078d22673a57mr596908ejb.241.1664992114759;
        Wed, 05 Oct 2022 10:48:34 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] xen/virtio: Fix potential deadlock when accessing xen_grant_dma_devices
Date: Wed,  5 Oct 2022 20:48:23 +0300
Message-Id: <20221005174823.1800761-3-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221005174823.1800761-1-olekstysh@gmail.com>
References: <20221005174823.1800761-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As find_xen_grant_dma_data() is called from both interrupt and process
contexts, the access to xen_grant_dma_devices XArray must be protected
by xa_lock_irqsave to avoid deadlock scenario.
As XArray API doesn't provide xa_store_irqsave helper, call lockless
__xa_store directly and guard it externally.

Also move the storage of the XArray's entry to a separate helper.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Fixes: d6aca3504c7d ("xen/grant-dma-ops: Add option to restrict memory access under Xen")
---
 drivers/xen/grant-dma-ops.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 1998d0e8ce82..c66f56d24013 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -25,7 +25,7 @@ struct xen_grant_dma_data {
 	bool broken;
 };
 
-static DEFINE_XARRAY(xen_grant_dma_devices);
+static DEFINE_XARRAY_FLAGS(xen_grant_dma_devices, XA_FLAGS_LOCK_IRQ);
 
 #define XEN_GRANT_DMA_ADDR_OFF	(1ULL << 63)
 
@@ -42,14 +42,29 @@ static inline grant_ref_t dma_to_grant(dma_addr_t dma)
 static struct xen_grant_dma_data *find_xen_grant_dma_data(struct device *dev)
 {
 	struct xen_grant_dma_data *data;
+	unsigned long flags;
 
-	xa_lock(&xen_grant_dma_devices);
+	xa_lock_irqsave(&xen_grant_dma_devices, flags);
 	data = xa_load(&xen_grant_dma_devices, (unsigned long)dev);
-	xa_unlock(&xen_grant_dma_devices);
+	xa_unlock_irqrestore(&xen_grant_dma_devices, flags);
 
 	return data;
 }
 
+static int store_xen_grant_dma_data(struct device *dev,
+				    struct xen_grant_dma_data *data)
+{
+	unsigned long flags;
+	int ret;
+
+	xa_lock_irqsave(&xen_grant_dma_devices, flags);
+	ret = xa_err(__xa_store(&xen_grant_dma_devices, (unsigned long)dev, data,
+			GFP_ATOMIC));
+	xa_unlock_irqrestore(&xen_grant_dma_devices, flags);
+
+	return ret;
+}
+
 /*
  * DMA ops for Xen frontends (e.g. virtio).
  *
@@ -338,8 +353,7 @@ void xen_grant_setup_dma_ops(struct device *dev)
 	 */
 	data->backend_domid = iommu_spec.args[0];
 
-	if (xa_err(xa_store(&xen_grant_dma_devices, (unsigned long)dev, data,
-			GFP_KERNEL))) {
+	if (store_xen_grant_dma_data(dev, data)) {
 		dev_err(dev, "Cannot store Xen grant DMA data\n");
 		goto err;
 	}
-- 
2.25.1


