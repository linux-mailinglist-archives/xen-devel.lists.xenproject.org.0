Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7E550BD93
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 18:51:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311118.528211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwVG-0007uP-4H; Fri, 22 Apr 2022 16:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311118.528211; Fri, 22 Apr 2022 16:51:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhwVF-0007nE-UG; Fri, 22 Apr 2022 16:51:29 +0000
Received: by outflank-mailman (input) for mailman id 311118;
 Fri, 22 Apr 2022 16:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyV/=VA=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nhwVD-00064C-NI
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 16:51:27 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7367ed71-c25c-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 18:51:27 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id br15so894077lfb.9
 for <xen-devel@lists.xenproject.org>; Fri, 22 Apr 2022 09:51:27 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a056512310200b0046e2f507a3asm279742lfb.167.2022.04.22.09.51.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Apr 2022 09:51:26 -0700 (PDT)
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
X-Inumbo-ID: 7367ed71-c25c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FWaKUpxpKzKjbtSZ6ZKtWz+3C1vj9orKjhUr2xwY4lM=;
        b=hZs3izeCtmtt43a0UNm5IqmPSa6o2CTFdv4hT95HlTt8sq4U8H2GVbe8LO7gpfIx9P
         nUCA0BIFr8bWe4R+3Vx5F5V5bZlcVUxVU6cfKnoKPtW9fYpu4rM0I3NA6A9jDYVP/9eT
         5v6R6JbVvZdOMWrOceZlrUlagLbrTSPHZ85X9eWLHsTTCGbqBvoaWLAPWUgbs6Idby5s
         4LtwH2Lnu3gjEMNKSbuabCyQMifLdMh/r+T6OpIX4rBGG1FX/6XuNg2Nq2vJTPVMJqWK
         NdOH6K0tTIKQxd1NLk5+6LC7bTT/3ZCxi4f0143G79Y5OyjlhU1DkqwMqAELZuYMQgwV
         5rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FWaKUpxpKzKjbtSZ6ZKtWz+3C1vj9orKjhUr2xwY4lM=;
        b=QHrDY9ByWpy7nSgRO9MCsHDZRgcnE+2Qk4z4dcZmyuMg57TYzcwm9hzq106MN9jg7U
         Mik5h1dYKluLVepMlcQa/F+W/D9kDcKrAjBGdfKK1oMqsa+s4nblnc2h2cYhnkXieHss
         hoJGIMVRa+llpcp7nY7enJ9vZbDBGJ9OdXeVq3sGfZfl4SPY7K1fI8aCYcWY6QWFkLqj
         g0WDPqylg3LIarYL+7EjScVrXDiejmmF/jMFEOqN06ZzOz3bGwN4TR47q16s7ezLg00u
         Nj78ESvHmcCvHNUckhv1KJjHF/PbtM2k7yN9moWhpqnQAtYxW5z8zo+Szhj4zFVt1oKk
         IsiA==
X-Gm-Message-State: AOAM532KWLwI9s2m3qzoqwacgBsJsizY6Q7DJskvMCUtQ8qhQya9vqd8
	JkB5wu+2JjpW8xjaSBdHEH6KapkHoVw=
X-Google-Smtp-Source: ABdhPJw7+T0P6Ouxeu7dgpNbQZDF5EXBC/YTqVl/e4VxLwsPs+mJYBXNMvJhS0HMKIGJGQ32Omz2oQ==
X-Received: by 2002:a05:6512:3d14:b0:46b:81d9:b9ee with SMTP id d20-20020a0565123d1400b0046b81d9b9eemr3709015lfv.109.1650646286428;
        Fri, 22 Apr 2022 09:51:26 -0700 (PDT)
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
Subject: [PATCH V1 6/6] arm/xen: Assign xen-grant DMA ops for xen-grant DMA devices
Date: Fri, 22 Apr 2022 19:51:03 +0300
Message-Id: <1650646263-22047-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>
References: <1650646263-22047-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As the main (and single at the moment) purpose of xen-grant
DMA devices is to enable using virtio devices in Xen guests
in a safe manner, assign xen-grant DMA ops only if restricted
access to the guest memory is enabled.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes RFC -> V1:
   - update commit subject/description
   - remove #ifdef CONFIG_XEN_VIRTIO
   - re-organize the check taking into the account that
     swiotlb and virtio cases are mutually exclusive
   - update according to the new naming scheme:
     s/virtio/grant_dma
---
 include/xen/arm/xen-ops.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/xen/arm/xen-ops.h b/include/xen/arm/xen-ops.h
index 288deb1..26954e5 100644
--- a/include/xen/arm/xen-ops.h
+++ b/include/xen/arm/xen-ops.h
@@ -2,12 +2,17 @@
 #ifndef _ASM_ARM_XEN_OPS_H
 #define _ASM_ARM_XEN_OPS_H
 
+#include <linux/virtio_config.h>
 #include <xen/swiotlb-xen.h>
+#include <xen/xen-ops.h>
 
 static inline void xen_setup_dma_ops(struct device *dev)
 {
 #ifdef CONFIG_XEN
-	if (xen_swiotlb_detect())
+	if (arch_has_restricted_virtio_memory_access() &&
+			xen_is_grant_dma_device(dev))
+		xen_grant_setup_dma_ops(dev);
+	else if (xen_swiotlb_detect())
 		dev->dma_ops = &xen_swiotlb_dma_ops;
 #endif
 }
-- 
2.7.4


