Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51B415EEE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194112.345835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOG4-00004y-Mi; Thu, 23 Sep 2021 12:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194112.345835; Thu, 23 Sep 2021 12:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTOG4-0008UR-I8; Thu, 23 Sep 2021 12:55:24 +0000
Received: by outflank-mailman (input) for mailman id 194112;
 Thu, 23 Sep 2021 12:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JD/Q=ON=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mTOG3-0004it-3p
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:55:23 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 915cde92-d924-4b0b-9871-d2ec30d41a07;
 Thu, 23 Sep 2021 12:54:52 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b20so26421266lfv.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 05:54:52 -0700 (PDT)
Received: from localhost.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l7sm453584lfk.52.2021.09.23.05.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 05:54:51 -0700 (PDT)
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
X-Inumbo-ID: 915cde92-d924-4b0b-9871-d2ec30d41a07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1TrjF5t3o30buNEbCcSZ6J+pkIyzH+w8BkXrdAyRKN4=;
        b=ivM99SULTQHo3nshuAEGZKlbuXXaVaw6z/XPmvCfBqjSwhxnIlZ/bPAK2/B9U2XbZA
         DLyBvRDtzt4cCP0pPvUqlNAzh5PdOzeyNvCU3UI48NsRLk0k/OxA61v4Mq8uG7rzL/Ic
         1IbbjpU6rtXdQfuTpNU7bCaZGg8EAxCcatB07HL2y/aLj7gSeab9hWVuljnxC0134TCO
         xopJ3qRjy86VKkjVH3E6GO7a7X63/EVS9JRHF1aooXlz8Ww90py3FdtmSELFQWjaW/Fy
         dZUXUfAYDI2bfRdoLCWPyMZ6aJzakLCWbEAQ/m2EmrExUy5htTCM6caCg52zHkq18bTw
         zcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1TrjF5t3o30buNEbCcSZ6J+pkIyzH+w8BkXrdAyRKN4=;
        b=fmL9ZY/Nr2Et0lyzOAjrek88FSBc2JDK3sD/yMjV7DeWBm7iKM6qzv4t/EUmmhcvZH
         tMdvzSPH6eI30YVtZh5DxId81uCsS3qTjzXHHe/a9EVK7qvCyAlVx0fla2jKVF5XOlJS
         ymYwpQ/TlTef4Jr+Y5Zd/+awukDZf4jAsZjv+7zKZ0P9YL+v2PmFknffoc25kx22jtAc
         rhUXdYaKo2GuLbxbgYxe8zRcD7GA5PJadM9nnH2Z3n5xevBizGLpGlQHIHdEbYI7mnT9
         6lMweLcoxWp3/lWAN4U0DwKsFH29Xg+50h8B4GLn4VD+pcB0zyFDZ2bFstQ6TVfVXgp9
         9Ydg==
X-Gm-Message-State: AOAM530X8pD6SyIW5O9pnsCtxsVBfg1uGa4ovSqPd6w6e6arb4a/KcHK
	H9/JER35W46bljQ4yNZGHlPAmFtSkxGHPA==
X-Google-Smtp-Source: ABdhPJzPqQaEl2/aIGz3AwANRVvhbdk4cidmrdFeJlcv41FfPhRPal5UzVCuBJYk5BalAfuXbi6WUg==
X-Received: by 2002:a05:6512:2302:: with SMTP id o2mr4119509lfu.297.1632401691504;
        Thu, 23 Sep 2021 05:54:51 -0700 (PDT)
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
Subject: [PATCH v2 09/11] xen/arm: Setup MMIO range trap handlers for hardware domain
Date: Thu, 23 Sep 2021 15:54:36 +0300
Message-Id: <20210923125438.234162-10-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923125438.234162-1-andr2000@gmail.com>
References: <20210923125438.234162-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

In order for vPCI to work it needs to maintain guest and hardware
domain's views on the configuration space. For example, BARs and
COMMAND registers require emulation for guests and the guest view
on the registers needs to be in sync with the real contents of the
relevant registers. For that ECAM address space needs to also be
trapped for the hardware domain, so we need to implement PCI host
bridge specific callbacks to properly setup MMIO handlers for those
ranges depending on particular host bridge implementation.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

---
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
 xen/include/asm-arm/pci.h          |  7 +++++++
 5 files changed, 76 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 854e8fed0393..c7b25bc70439 100644
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
index 1567b6e2956c..155f2a2743af 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -300,6 +300,34 @@ struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
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
index 76c12b92814f..14947e975d69 100644
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
+    int count = 0;
+
+    if ( is_hardware_domain(d) )
+        /* For each PCI host bridge's configuration space. */
+        count += pci_host_get_num_bridges();
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
index 5b100556225e..7618f0b6725b 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -15,6 +15,8 @@
 #ifndef __ARM_PCI_H__
 #define __ARM_PCI_H__
 
+#include <asm/mmio.h>
+
 #ifdef CONFIG_HAS_PCI
 
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
@@ -109,6 +111,11 @@ static always_inline bool is_pci_passthrough_enabled(void)
 {
     return !!pci_passthrough_enabled;
 }
+
+int pci_host_iterate_bridges(struct domain *d,
+                             int (*clb)(struct domain *d,
+                                        struct pci_host_bridge *bridge));
+int pci_host_get_num_bridges(void);
 #else   /*!CONFIG_HAS_PCI*/
 
 #define pci_passthrough_enabled (false)
-- 
2.25.1


