Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3541E41D458
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 09:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199441.353539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqJd-0001uB-CQ; Thu, 30 Sep 2021 07:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199441.353539; Thu, 30 Sep 2021 07:17:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVqJd-0001s7-8k; Thu, 30 Sep 2021 07:17:13 +0000
Received: by outflank-mailman (input) for mailman id 199441;
 Thu, 30 Sep 2021 07:17:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAwA=OU=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mVqGq-0004B3-Ak
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 07:14:20 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68e97808-1059-4749-9c40-e1fa980222f6;
 Thu, 30 Sep 2021 07:13:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id z24so21167038lfu.13
 for <xen-devel@lists.xenproject.org>; Thu, 30 Sep 2021 00:13:37 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id y3sm267835lfh.132.2021.09.30.00.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:13:36 -0700 (PDT)
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
X-Inumbo-ID: 68e97808-1059-4749-9c40-e1fa980222f6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ed0cb37zU/24QxEPfk3Zh0UOvwcZKTudBJfaTlZ2/uM=;
        b=HSe7JfAQdriC3ZOfjhvs1qHTJcCnMu5luam2DqethH9rst2ywFP4j5/KS/rE6tPfsC
         /9hXHbefKF40vX1HA9T5roPW8CTYykp093i//AZbnwYh75tzLf6iRhxI5DQQvyyb9VNY
         STaMAxJZlD8dtJUKCNPiG1zLg+SiQ9/bDO/6OCuDotfYs5kre+7ZP+9jeHKPqPJWb2EV
         ERcUbFEsA54oaWI9RPTSjugVcXnE6qIsNQXA+zBvYNvtBJa8qgqMSLsaNnBaRohugRdc
         wiS7jW66GBKPL0IBNav1MPBja4vX0/1X0PI99qEPzvWHRRlhrV8Kswzcig8IMnmGocoj
         9k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ed0cb37zU/24QxEPfk3Zh0UOvwcZKTudBJfaTlZ2/uM=;
        b=MzpeClWebIA3NSHxtUcC4cTz6Noz70eB+9Ez0MAuF4qCx7lJGPJ5sa3mCsOd0sAeDs
         ME61teX5w91qTOkZY3Jb9wfDqlhjA/RB7WGackASzyPpBH5TgN4ytB8PYkUlgeVA778w
         b9J6UWz3KbHsC0un4olzOgmmCsEWpGJpdLUvcFh8hiRkHICUOrQ+ad7FxKCcPE9OicWO
         lO41HfU5xbcGkAYsxgTznazWwgHu71pEc/a+mHi3Exzly+F9kw5PfOrFGARF6Uv14H83
         HUuOJm0Ed97RMN03gfENJnnB+CfCagkSY4rbcqXj0zfoCO5k8qLC/XCJv8k3AvVFCEE7
         6IeQ==
X-Gm-Message-State: AOAM5312mryDk5ovubnxVuApDO4auDMysfHujui3+m+JAPka6RLu5VfF
	OHs9CDGBMcR76EshwH8HGBi13gNj5oY=
X-Google-Smtp-Source: ABdhPJwVw+tTaWEnG4vCJ2L8eQD0NQFZzHaVSmlxZ4kRzOcOMsOqFQ/APk7egIw+0tz53PGxMYTINw==
X-Received: by 2002:a19:8c0f:: with SMTP id o15mr4428022lfd.464.1632986016583;
        Thu, 30 Sep 2021 00:13:36 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	volodymyr_babchuk@epam.com,
	Artem_Mygaiev@epam.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v3 09/11] xen/arm: Setup MMIO range trap handlers for hardware domain
Date: Thu, 30 Sep 2021 10:13:24 +0300
Message-Id: <20210930071326.857390-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930071326.857390-1-andr2000@gmail.com>
References: <20210930071326.857390-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

In order for vPCI to work it needs to maintain guest and hardware
domain's views of the configuration space. For example, BARs and
COMMAND registers require emulation for guests and the guest view
of the registers needs to be in sync with the real contents of the
relevant registers. For that ECAM address space needs to also be
trapped for the hardware domain, so we need to implement PCI host
bridge specific callbacks to properly setup MMIO handlers for those
ranges depending on particular host bridge implementation.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
Since v2:
- removed unneeded assignment (count = 0)
- removed unneeded header inclusion
- update commit message
Since v1:
 - Dynamically calculate the number of MMIO handlers required for vPCI
   and update the total number accordingly
 - s/clb/cb
 - Do not introduce a new callback for MMIO handler setup
---
 xen/arch/arm/domain.c              |  2 ++
 xen/arch/arm/pci/pci-host-common.c | 28 +++++++++++++++++++++++++
 xen/arch/arm/vpci.c                | 33 ++++++++++++++++++++++++++++++
 xen/arch/arm/vpci.h                |  6 ++++++
 xen/include/asm-arm/pci.h          |  5 +++++
 5 files changed, 74 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 79012bf77757..fa6fcc5e467c 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -733,6 +733,8 @@ int arch_domain_create(struct domain *d,
     if ( (rc = domain_vgic_register(d, &count)) != 0 )
         goto fail;
 
+    count += domain_vpci_get_num_mmio_handlers(d);
+
     if ( (rc = domain_io_init(d, count + MAX_IO_HANDLER)) != 0 )
         goto fail;
 
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 592c01aae5bb..1eb4daa87365 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -292,6 +292,34 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
     }
     return bridge->dt_node;
 }
+
+int pci_host_iterate_bridges(struct domain *d,
+                             int (*cb)(struct domain *d,
+                                       struct pci_host_bridge *bridge))
+{
+    struct pci_host_bridge *bridge;
+    int err;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+    {
+        err = cb(d, bridge);
+        if ( err )
+            return err;
+    }
+    return 0;
+}
+
+int pci_host_get_num_bridges(void)
+{
+    struct pci_host_bridge *bridge;
+    int count = 0;
+
+    list_for_each_entry( bridge, &pci_host_bridges, node )
+        count++;
+
+    return count;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 76c12b92814f..5d6c29c8dcd9 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -80,17 +80,50 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
     .write = vpci_mmio_write,
 };
 
+static int vpci_setup_mmio_handler(struct domain *d,
+                                   struct pci_host_bridge *bridge)
+{
+    struct pci_config_window *cfg = bridge->cfg;
+
+    register_mmio_handler(d, &vpci_mmio_handler,
+                          cfg->phys_addr, cfg->size, NULL);
+    return 0;
+}
+
 int domain_vpci_init(struct domain *d)
 {
     if ( !has_vpci(d) )
         return 0;
 
+    if ( is_hardware_domain(d) )
+        return pci_host_iterate_bridges(d, vpci_setup_mmio_handler);
+
+    /* Guest domains use what is programmed in their device tree. */
     register_mmio_handler(d, &vpci_mmio_handler,
                           GUEST_VPCI_ECAM_BASE, GUEST_VPCI_ECAM_SIZE, NULL);
 
     return 0;
 }
 
+int domain_vpci_get_num_mmio_handlers(struct domain *d)
+{
+    int count;
+
+    if ( is_hardware_domain(d) )
+        /* For each PCI host bridge's configuration space. */
+        count = pci_host_get_num_bridges();
+    else
+        /*
+         * VPCI_MSIX_MEM_NUM handlers for MSI-X tables per each PCI device
+         * being passed through. Maximum number of supported devices
+         * is 32 as virtual bus topology emulates the devices as embedded
+         * endpoints.
+         * +1 for a single emulated host bridge's configuration space. */
+        count = VPCI_MSIX_MEM_NUM * 32 + 1;
+
+    return count;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpci.h b/xen/arch/arm/vpci.h
index d8a7b0e3e802..27a2b069abd2 100644
--- a/xen/arch/arm/vpci.h
+++ b/xen/arch/arm/vpci.h
@@ -17,11 +17,17 @@
 
 #ifdef CONFIG_HAS_VPCI
 int domain_vpci_init(struct domain *d);
+int domain_vpci_get_num_mmio_handlers(struct domain *d);
 #else
 static inline int domain_vpci_init(struct domain *d)
 {
     return 0;
 }
+
+static inline int domain_vpci_get_num_mmio_handlers(struct domain *d)
+{
+    return 0;
+}
 #endif
 
 #endif /* __ARCH_ARM_VPCI_H__ */
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index 566a9436a18e..0d0266b13cba 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -108,6 +108,11 @@ static always_inline bool is_pci_passthrough_enabled(void)
 
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
+int pci_host_iterate_bridges(struct domain *d,
+                             int (*clb)(struct domain *d,
+                                        struct pci_host_bridge *bridge));
+int pci_host_get_num_bridges(void);
+
 #else   /*!CONFIG_HAS_PCI*/
 
 struct arch_pci_dev { };
-- 
2.25.1


