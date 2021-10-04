Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6195A421137
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 16:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201519.356084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOmf-0006Vp-Lm; Mon, 04 Oct 2021 14:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201519.356084; Mon, 04 Oct 2021 14:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXOmf-0006TN-Hd; Mon, 04 Oct 2021 14:17:37 +0000
Received: by outflank-mailman (input) for mailman id 201519;
 Mon, 04 Oct 2021 14:17:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/Qt=OY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mXOi0-0008QG-Ea
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 14:12:48 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ba3d850-b21d-4a3c-8497-b91f56f96571;
 Mon, 04 Oct 2021 14:12:09 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y15so6465418lfk.7
 for <xen-devel@lists.xenproject.org>; Mon, 04 Oct 2021 07:12:09 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id n12sm1076809lfe.145.2021.10.04.07.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:12:06 -0700 (PDT)
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
X-Inumbo-ID: 9ba3d850-b21d-4a3c-8497-b91f56f96571
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yH0ib0fYHnpnXYuN0yIUp+P4aLOSl8TIjVaiKqqDoME=;
        b=FTHD1NrKz0elS/22hvRlyOVDFIaBeZCOjaYcvaH/NI4fV0l5+mCWELmxleSwhfqgA2
         IxkBWtN5/1FBPLoqIGvY/7fUhsV57sWlA23IANz+DNsYGoTwbGuQSVK/PH6YWoTs3U4a
         nIA5oSI7sPmuAH7xgyMVjnx+k+kbZZWWfXzGzz1pZXAbFJ9aHEZ7rAcjwv6rkk6nITr3
         KF5VKOnWFC0a4dYcXo0Bacz8X8NC8Wp1JjhUMy5WfwTCVhCHi0fZBDCk4RXg7lfoqK0Y
         h4HB1VKDZ+y/L4yb+fAqFnmEs9LuR+VfuUR60QXcR95hzIYd4zKENoUw4cq13IBDpEJB
         jxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yH0ib0fYHnpnXYuN0yIUp+P4aLOSl8TIjVaiKqqDoME=;
        b=NeMGuai8SsEBHvE62YEb3+es/Twwzrut10j47YZoq3GA/BVjkUwjOW77rXQCURYn9b
         6L5gT55wF8xv20FXZoOINjC6lxAXnPOo/ZWfTgD30yGBlBXy4QZK1Y1D1DOWwPW1PCky
         g45+JwRTVUjL2FTkhUBxLCCkmEk/lAIMBflGR/OobVgw2nBsvTDX0497Y+bbSGSyifAL
         h2aZnjLlE9xG57fs70x0MpRRhSfIXW8DkAJU5g1VtA6QkycsrFkck3Qu6Xqeb7WMvtxS
         DOaLkxgaCReGIg2ktN2ZfyiXfSQAQzfpSU0WwC1G5hxYpfQpa1HR9MJmQ4l2cn/XyvTG
         WqjQ==
X-Gm-Message-State: AOAM533HidWK0EAvTYf6MzegQgEjXHueJHKMMhw0C+RhDlRcG9bHTNRr
	RQ4sCGpwzGWVQS3onu79nXbkYdnMQmmFmQ==
X-Google-Smtp-Source: ABdhPJxVEGVDIYMCWDv/jI0j9PHqrZZVAaBwU09bl5gdNZ5UX5C9BDoC8SDNudI2U3hzaJ41m+FXaw==
X-Received: by 2002:a05:6512:acd:: with SMTP id n13mr14617608lfu.247.1633356726402;
        Mon, 04 Oct 2021 07:12:06 -0700 (PDT)
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
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v4 09/11] xen/arm: Setup MMIO range trap handlers for hardware domain
Date: Mon,  4 Oct 2021 17:11:49 +0300
Message-Id: <20211004141151.132231-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004141151.132231-1-andr2000@gmail.com>
References: <20211004141151.132231-1-andr2000@gmail.com>
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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Since v3:
- fixed comment formatting
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
 xen/arch/arm/pci/pci-host-common.c | 28 ++++++++++++++++++++++++
 xen/arch/arm/vpci.c                | 34 ++++++++++++++++++++++++++++++
 xen/arch/arm/vpci.h                |  6 ++++++
 xen/include/asm-arm/pci.h          |  5 +++++
 5 files changed, 75 insertions(+)

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
index 76c12b92814f..6e179cd3010b 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -80,17 +80,51 @@ static const struct mmio_handler_ops vpci_mmio_handler = {
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
+         * +1 for a single emulated host bridge's configuration space.
+         */
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
index ea87ec6006fc..a62d8bc60086 100644
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


