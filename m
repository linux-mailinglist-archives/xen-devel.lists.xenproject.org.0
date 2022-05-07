Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6BC51E923
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 20:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323761.545643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1i-00008G-Iw; Sat, 07 May 2022 18:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323761.545643; Sat, 07 May 2022 18:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnP1i-0008WF-Em; Sat, 07 May 2022 18:19:34 +0000
Received: by outflank-mailman (input) for mailman id 323761;
 Sat, 07 May 2022 18:19:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y6lb=VP=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nnP1g-00079i-5q
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 18:19:32 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d24b932-ce32-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 20:19:31 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so6133525wmn.1
 for <xen-devel@lists.xenproject.org>; Sat, 07 May 2022 11:19:31 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d4d8a000000b0020c5253d8f3sm8198457wru.63.2022.05.07.11.19.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 May 2022 11:19:29 -0700 (PDT)
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
X-Inumbo-ID: 3d24b932-ce32-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JQ4/wPcUQ3XIBwyiOH+85aEeFtvLk17ZXfaTMabSQhQ=;
        b=M0nL9AqbUiqgoGeBXuGJocL7BzhM9dpf6lZVm6z1MjjHA7Ksx3fAI6nsxT0Nt1TL05
         V9n3RuTkUTnoTUTcWzbDZzYyXq+nDqhodBqF5QWBpLz3KG7WkLCJw+dMLaWXpmXERYF1
         Z/ciVWktZyebFps/o8q2Oq5Yq41Pu3hxh+stWpNbBkwcaCkgIOQ5WYEwn7lV+jJsEdSh
         +HhxY/jdkwpoWo5uCgqY6+fdKmpb5rQY+LpZDKBI6NpE+HUIsQOlFS0+S/WN3zq9WuIL
         TiiJg4uvRYrYvsi0W51dYzG/nuX5J3xAnuGzn1LhIo6s+ydhszeik8BNC8Hg3Kloj1TO
         zwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JQ4/wPcUQ3XIBwyiOH+85aEeFtvLk17ZXfaTMabSQhQ=;
        b=QKuK7H4mHW4Rb2TWgRjgWF1dfvgqErexTsqBgTKml00O+VM8PJiFhefq5+P6EQg6fF
         +s9m2h4EdQG6KTbhlsE6zeFL0zGD9CWVMjc9/OlfNjD+r1hbRBmwFY15NRfgaMGVo3iX
         lqYURc6UhBBTkf3auVrEgsuxy/ypz9LfMnuEn/L0UrjRsqnTXpRowDUQqch+Rt3bG6JP
         IK5psoGYcHXPoEG9Erzn7AwvXjThBdzgnI5H2hzkGucBhYIMVo2ckiUtE6macY+0VcKh
         t2zVCYm+XRVFHaOz2xJgo/lEer0nTDyfQ0QDRoPrULYj9Mq94buj16fyc1Mul5F/kK7V
         kpDA==
X-Gm-Message-State: AOAM531WipuSW3tgh8U5619w7wi87yaTonjC9r/QwbY60vhjck9PHfg4
	OZPcPXDbyOeV7BZmAfgHzwUmWvHJSjg=
X-Google-Smtp-Source: ABdhPJx4KKTzPkd6Pb55J8tu0qaETBwCwPrhXqxi1bGV5Mve7UPIQCUHgzJRC6duNfUV/2m203EIIQ==
X-Received: by 2002:a1c:3b54:0:b0:394:3910:3c7b with SMTP id i81-20020a1c3b54000000b0039439103c7bmr8718493wma.3.1651947570262;
        Sat, 07 May 2022 11:19:30 -0700 (PDT)
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
Subject: [PATCH V2 7/7] arm/xen: Assign xen-grant DMA ops for xen-grant DMA devices
Date: Sat,  7 May 2022 21:19:08 +0300
Message-Id: <1651947548-4055-8-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>
References: <1651947548-4055-1-git-send-email-olekstysh@gmail.com>

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


