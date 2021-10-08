Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF07942645B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 07:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204348.359551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirn-00034k-03; Fri, 08 Oct 2021 05:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204348.359551; Fri, 08 Oct 2021 05:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYirm-00031D-Qg; Fri, 08 Oct 2021 05:56:22 +0000
Received: by outflank-mailman (input) for mailman id 204348;
 Fri, 08 Oct 2021 05:56:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ipo1=O4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1mYirk-0007cA-L0
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 05:56:20 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5954495-a0ca-4fe0-b2cd-34b6d81c89a3;
 Fri, 08 Oct 2021 05:55:48 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m3so34761580lfu.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 22:55:48 -0700 (PDT)
Received: from localhost.localdomain (host-176-36-245-220.b024.la.net.ua.
 [176.36.245.220])
 by smtp.gmail.com with ESMTPSA id f8sm151147lfq.168.2021.10.07.22.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 22:55:47 -0700 (PDT)
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
X-Inumbo-ID: f5954495-a0ca-4fe0-b2cd-34b6d81c89a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vUC5D9zEKV/jAgD73pTREAGOQdOnzNJSZwkzfwspuNk=;
        b=btx7oai46Hsj7sP/cha3qJ3x9r8kcGUjfyCmfdEk44+qTEZcYDyycvw5eL6MD8MAh0
         St6VY3ebKsjwyliy4IxBKxtEIq5d1jHrf8CtR67T+DClevPS93sGP0qOyUygQy7voKb2
         xVTFNr4oKHDQz/RX0AbTPPiUgWUvMDmWuEHApGcpEvVK0ZxOVF/10e/bNxg8O85DbC1P
         ww0VF2qCkncREg1UR9IyQOjDjGcYA8oiLA6wot4kgDQJyx8/1nX8QRyGGO4I0M5bSLNI
         Akpu47x7THgh9GCLEpZOPMHhoj8TeMYEOknD3CCVfOsabt55irOSWYSkUbVxTJn1t+S9
         GjLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vUC5D9zEKV/jAgD73pTREAGOQdOnzNJSZwkzfwspuNk=;
        b=dI4ZFDkIJs08PBdw9H3OgKKAk301yZGYrutVD7xjC3ZrXnuamdw1HlRku1bKhswSWr
         MKhfLNf/6yNclqldN5cmd8wwetl/jHhuEMNgliwlxj+Eo49FK3M9A66wagEYtDnWcz3q
         x5cVG15w2/VO8Wud4b3wrsdvub9O2QxsaJUcGXY/Lnp4IePY+aR6+NEMcWor+OVBsFQF
         LnB9IWt5GF/BoHD2TOoAvKchQ26Ej97jVse/FEzcRQ0jTqoHy4O3uEzcAeuAsSv+CUdt
         liaz9J7X7oJLZGegBVez0/HUAxq29evFT8uJS6Q0uLWJ+5URCZnFv5EtS6eAReSSGKaf
         DPFA==
X-Gm-Message-State: AOAM533k3F/bHLmpc5+TWb55Lv6sEN6LAUx/0YshgbSk4SR9MhwBRNsu
	BiqJJJ1RuluKMLB3/hQJJKmtY3djPbY=
X-Google-Smtp-Source: ABdhPJyuSbpU0STi1lKVUx508Xiu5O+z312hu9KPeQtMDgnailV2dI8p2Obn72TAS3BJAyZFr7SHXw==
X-Received: by 2002:a05:6512:2396:: with SMTP id c22mr8686787lfv.55.1633672547618;
        Thu, 07 Oct 2021 22:55:47 -0700 (PDT)
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
Subject: [PATCH v5 08/10] xen/arm: Setup MMIO range trap handlers for hardware domain
Date: Fri,  8 Oct 2021 08:55:33 +0300
Message-Id: <20211008055535.337436-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211008055535.337436-1-andr2000@gmail.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
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
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
Tested-by: Rahul Singh <rahul.singh@arm.com>
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
index 98cb22d39ef1..a71b0eea8cb9 100644
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


