Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE72D45B612
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 09:00:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230144.397885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC1-0006Ld-Fp; Wed, 24 Nov 2021 07:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230144.397885; Wed, 24 Nov 2021 07:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpnC1-0006Jt-Cf; Wed, 24 Nov 2021 07:59:49 +0000
Received: by outflank-mailman (input) for mailman id 230144;
 Wed, 24 Nov 2021 07:59:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CYi7=QL=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1mpnBz-000641-MT
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:59:47 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dcc7a3a-4cfc-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:59:46 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id t26so4895181lfk.9
 for <xen-devel@lists.xenproject.org>; Tue, 23 Nov 2021 23:59:46 -0800 (PST)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i24sm1750358ljm.135.2021.11.23.23.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:59:45 -0800 (PST)
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
X-Inumbo-ID: 7dcc7a3a-4cfc-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rH0iLPl/lC8zdfMkSvOZAn1ZGtgBTiLGnIq2zauCwpU=;
        b=CvHAJ1xE04NRPrR9uFUw3/zuzpPFg3u9wujjKFYXCAW/WtikFS4AZMgWnoVUWp0YU0
         WghuxtO9EsC8Apr/X1cAc5gCPxm5sVb7+XgBZRz9IvgQS3XEnRxHo0/9okx8EMxAxI9q
         ItCDsuuiPjULzGue5LgYRctAbEAl/Nk2rLP5k9OnTJGB0VQJMxKHtAb1AbVe+H2VFqhd
         XdorHPa8OrhdN58sPA3/4UtEGA4vrK6FHYfSctMS8eDq9LxvMX6ZPeYfN7vE+KrgzyW4
         YZ9ww4dByLm2snpsOm/G6MlIVwWOOWMdY1fzGUQWbcAmHikUQGkDXlUH9AMQ440cYec3
         /nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rH0iLPl/lC8zdfMkSvOZAn1ZGtgBTiLGnIq2zauCwpU=;
        b=GtoXhd+ipb4Dm19umfnOknFJwXOHTd+mQPO7iqCDfVh3gevf0+YOrEYyXpZSGFX+CJ
         4k6ZzY/TN3xeBIhRhLwjXeymHWjzJ/PlUyFDTptpMlt45t0ompBaKKfVvBKOZ5n/O0uc
         T0lJid0lKMTXOy/Q3AFaZ4U0hUU2hAgkzVn53Lh7rIaerrWPU4Z8lBq7NUYsOl55wwWI
         IprGJpv/BrdYNqnA6ufashwes92rna3ontsYZjERRx4w44lHll+7EeCNd8MBQRfbdriS
         jBFkpBPHIgYBGY2mQbnVmAQiXio0JVY2VB4hBFG5aq297rFfqlhkHpEBzc85fdkUVzLg
         nx8g==
X-Gm-Message-State: AOAM532BB0BPNGCEE0bE5BI42m4lJeE57KlubL6vbbx4Ev2wIFbqXRPn
	KrV8v8nKKUbhnhqaxFs9ZIoz5Pbg7ynSMQ==
X-Google-Smtp-Source: ABdhPJwaEXhquUg9pSW7bS6CfvB2jhMl4knsYLQ7J3g/8mUX/NuU13lGyedBYurgkmEk6JZwO9+UtQ==
X-Received: by 2002:a05:6512:15a2:: with SMTP id bp34mr12389295lfb.65.1637740786174;
        Tue, 23 Nov 2021 23:59:46 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	paul@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 1/7] xen/arm: rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE
Date: Wed, 24 Nov 2021 09:59:36 +0200
Message-Id: <20211124075942.2645445-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211124075942.2645445-1-andr2000@gmail.com>
References: <20211124075942.2645445-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

To better reflect the nature of the device type and not to make any
confusion rename DEVICE_PCI to DEVICE_PCI_HOSTBRIDGE which it
really is.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
New in v6
---
 xen/arch/arm/pci/pci-host-generic.c | 2 +-
 xen/arch/arm/pci/pci-host-zynqmp.c  | 2 +-
 xen/arch/arm/pci/pci.c              | 2 +-
 xen/include/asm-arm/device.h        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
index 33457fbe9615..46de6e43cc72 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -32,7 +32,7 @@ static int __init pci_host_generic_probe(struct dt_device_node *dev,
     return pci_host_common_probe(dev, &pci_generic_ecam_ops);
 }
 
-DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI)
+DT_DEVICE_START(pci_gen, "PCI HOST GENERIC", DEVICE_PCI_HOSTBRIDGE)
 .dt_match = gen_pci_dt_match,
 .init = pci_host_generic_probe,
 DT_DEVICE_END
diff --git a/xen/arch/arm/pci/pci-host-zynqmp.c b/xen/arch/arm/pci/pci-host-zynqmp.c
index 61a9807d3d58..516982bca833 100644
--- a/xen/arch/arm/pci/pci-host-zynqmp.c
+++ b/xen/arch/arm/pci/pci-host-zynqmp.c
@@ -49,7 +49,7 @@ static int __init pci_host_generic_probe(struct dt_device_node *dev,
     return pci_host_common_probe(dev, &nwl_pcie_ops);
 }
 
-DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI)
+DT_DEVICE_START(pci_gen, "PCI HOST ZYNQMP", DEVICE_PCI_HOSTBRIDGE)
 .dt_match = nwl_pcie_dt_match,
 .init = pci_host_generic_probe,
 DT_DEVICE_END
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 082c14e127a8..78b97beaef12 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -46,7 +46,7 @@ static int __init dt_pci_init(void)
 
     dt_for_each_device_node(dt_host, np)
     {
-        rc = device_init(np, DEVICE_PCI, NULL);
+        rc = device_init(np, DEVICE_PCI_HOSTBRIDGE, NULL);
         /*
          * Ignore the following error codes:
          *   - EBADF: Indicate the current device is not a pci device.
diff --git a/xen/include/asm-arm/device.h b/xen/include/asm-arm/device.h
index 3782660751b6..086dde13eb6b 100644
--- a/xen/include/asm-arm/device.h
+++ b/xen/include/asm-arm/device.h
@@ -37,7 +37,7 @@ enum device_class
     DEVICE_SERIAL,
     DEVICE_IOMMU,
     DEVICE_GIC,
-    DEVICE_PCI,
+    DEVICE_PCI_HOSTBRIDGE,
     /* Use for error */
     DEVICE_UNKNOWN,
 };
-- 
2.25.1


