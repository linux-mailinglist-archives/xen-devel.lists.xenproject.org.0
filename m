Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983353886B
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 23:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338751.563637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmVC-0000ux-L3; Mon, 30 May 2022 21:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338751.563637; Mon, 30 May 2022 21:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvmVC-0000he-A1; Mon, 30 May 2022 21:00:38 +0000
Received: by outflank-mailman (input) for mailman id 338751;
 Mon, 30 May 2022 21:00:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pxv1=WG=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nvmV9-0007Kr-OS
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 21:00:35 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cc035c3-e05b-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 23:00:35 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id bf44so2884940lfb.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 May 2022 14:00:35 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a2ea275000000b0025550e2693asm581541ljm.38.2022.05.30.14.00.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 May 2022 14:00:34 -0700 (PDT)
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
X-Inumbo-ID: 8cc035c3-e05b-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6yQqHGmllGTqv5b6W6sRDmvHNQ6gC3VDGqt+iST1GP4=;
        b=S9MQR0ujpwPcnAyQYtPOzs9RCcNptzk0O/ZMxmFkOJnlI6mtmjxlbztcN0YE14G+/O
         CACKu4Iom63FSxFErPfKqe3D8u1NBDzLCPW0bP4ReCA8eMTw2li9C6ziCtU4wpuuXFOv
         qt8hKg4Ch3uraBa6Tn2+BZTqz64LBuzU3H+Y3p7d156cESE/deH1HCsjxMQApA/hMabB
         SVd/urKJWwl1w0Od8Z4zjUY6waUfCEhfljhE6SeNVuuV96Jjyfsdnq6mtPjXwQC9I81N
         93RwoCNTdcACEhMhE6pcdd8EPkimavXlYSfpVDIUPItTBv+rAA4J2jKLCkS4egHb/581
         YKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6yQqHGmllGTqv5b6W6sRDmvHNQ6gC3VDGqt+iST1GP4=;
        b=lCuzT43KFWQ22T4geEuejMVIYecf+KBnL2Hsw9MtUSCtV+6cytoVdtM2YEEaKE0k7O
         BppglSwkgSPJxHh9WLAYp8HKbhGiJ4nDj+EZrMpe1T9BSygtRHkolDEIeeRTv/k4zeJP
         efSBXPksl7rbzENPMepfAN8qjKtU44eEuAHo+tok5a4v7nukw5A40I0xobW2ft/mkr4Z
         7nD0qgg8I3DkyqzrzU2KNojen20rFq6oTdSl+5HcxtKyVyHpaQOr4A4oMiZSrXUKq+tT
         qs57WCsF7nHbX7zRN74Nd8ZnVhvNtmP+exuSWyaL0C4GLWgou8C99l5rB6XTABBx+9mN
         VPDg==
X-Gm-Message-State: AOAM531xE5CHhO+I0InHE47vQVw48w0EqntaxQq/e2suSyeflhDJDD8F
	LEHHrzmVkEm8PK0ZHoedjWqK0dO+lwY=
X-Google-Smtp-Source: ABdhPJxRI3M09HPtHmhTVLy5lEGHXzz2fTw91+bnwCJ2p93uOzuCHkjvEzV3hyRjrqV1bLRUpJbu/Q==
X-Received: by 2002:a05:6512:22c2:b0:478:3ed7:f0f7 with SMTP id g2-20020a05651222c200b004783ed7f0f7mr37717893lfu.112.1653944434440;
        Mon, 30 May 2022 14:00:34 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Christoph Hellwig <hch@infradead.org>
Subject: [PATCH V3 8/8] arm/xen: Assign xen-grant DMA ops for xen-grant DMA devices
Date: Tue, 31 May 2022 00:00:17 +0300
Message-Id: <1653944417-17168-9-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>
References: <1653944417-17168-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

By assigning xen-grant DMA ops we will restrict memory access for
passed device using Xen grant mappings. This is needed for using any
virtualized device (e.g. virtio) in Xen guests in a safe manner.

Please note, for the virtio devices the XEN_VIRTIO config should
be enabled (it forces ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS).

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes RFC -> V1:
   - update commit subject/description
   - remove #ifdef CONFIG_XEN_VIRTIO
   - re-organize the check taking into the account that
     swiotlb and virtio cases are mutually exclusive
   - update according to the new naming scheme:
     s/virtio/grant_dma

Changes V1 -> V2:
   - add Stefano's R-b
   - remove arch_has_restricted_virtio_memory_access() check
   - update commit description
   - remove the inclusion of virtio_config.h

Changes V2 -> V3:
   - no changes
---
 include/xen/arm/xen-ops.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
index 288deb1..b0766a6 100644
--- a/include/xen/arm/xen-ops.h
+++ b/include/xen/arm/xen-ops.h
@@ -3,11 +3,14 @@
 #define _ASM_ARM_XEN_OPS_H
 
 #include <xen/swiotlb-xen.h>
+#include <xen/xen-ops.h>
 
 static inline void xen_setup_dma_ops(struct device *dev)
 {
 #ifdef CONFIG_XEN
-	if (xen_swiotlb_detect())
+	if (xen_is_grant_dma_device(dev))
+		xen_grant_setup_dma_ops(dev);
+	else if (xen_swiotlb_detect())
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
-- 
2.7.4


