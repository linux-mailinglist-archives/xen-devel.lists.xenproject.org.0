Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE922AB8A0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22485.48870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6di-0004Xp-Ug; Mon, 09 Nov 2020 12:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22485.48870; Mon, 09 Nov 2020 12:51:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6di-0004X6-QS; Mon, 09 Nov 2020 12:51:18 +0000
Received: by outflank-mailman (input) for mailman id 22485;
 Mon, 09 Nov 2020 12:51:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6dg-0003tf-HB
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:16 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9373c888-deb2-488e-818e-fa0740b97367;
 Mon, 09 Nov 2020 12:50:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id f11so5953619lfs.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:44 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:42 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6dg-0003tf-HB
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:51:16 +0000
X-Inumbo-ID: 9373c888-deb2-488e-818e-fa0740b97367
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9373c888-deb2-488e-818e-fa0740b97367;
	Mon, 09 Nov 2020 12:50:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id f11so5953619lfs.3
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nvNmRBs0yMdCUG+5+G3i3M5jvG9+T7PAVH/ULtYwZd8=;
        b=BhLucB5unsgmpqCexxIviXoItX2knYBdsgr+yYELfc6dr8nME0oNQOEI3yc8ktBgNQ
         j5qG9gXFioPOtAz9b1XK70s8Q7w3Qo+on1JDA/vcCoN1xAwNuClbRiCFKnIpiKdJ/2bK
         fGyPd6VUEqYTvU9skirT/6Fp6HSM6ToAyr52K+IoSd8ASPbwjfS4EiYUIrBFa6m9ZA4B
         Reext1joqqooXwsl7kXl7+z2os2td3jxJkZlcBWSrQcGrT2tX8xo18fauv0twLpimoY8
         WojJROH0jW7I9TJnPUy8gNbladV7e9Oz9GkwPe5VVe+QHLcX6aw+rG7/46lOqMPmbeY8
         SN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nvNmRBs0yMdCUG+5+G3i3M5jvG9+T7PAVH/ULtYwZd8=;
        b=WXirXJ3Slfo/KxpylhnAgvXlFO8qIn479DhhaM7jHHnU0nNOsecY5K+i1FHRLeDbqd
         iFnPIJ1cGSTANWq6CEz1Exe1TYdGQ8wC1udjsbQ1kILx3DwhQ6aDxsNR7GWcwRNpsiO9
         kExnRtwJ3+latMRh6r8no/agu965hLcq9xH8XooQWq2ybfbkzJ/j9AuEK+OQfkYxUiU5
         MbUldKT9zoJt/FunsRiFt8v2u9udiBhy6Y02pG88MWt/JoakDTuUiied51TA9ex1e9Uy
         H77rR01TPYPH5zYx4/YPiDPlxhfLeaADKelyQNzARgalDz/nz6sFC8zmkx3jIXLg7KsW
         1LOg==
X-Gm-Message-State: AOAM531q+C3dP2JhgSn+vzeohBvBKv0XXmPlxjAccgirkgbnbN893Vzm
	9yd1TCEZVtMKx5X5m1BNKnA=
X-Google-Smtp-Source: ABdhPJwIxNZ+eFf7k5nHNhhjoeffUH3DJiF6DgEDs7OPTcsBJLtqcKWT+tf2/kVSMShVjyHxOj/DWw==
X-Received: by 2002:ac2:57d3:: with SMTP id k19mr6188423lfo.386.1604926243125;
        Mon, 09 Nov 2020 04:50:43 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:42 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: Rahul.Singh@arm.com,
	Bertrand.Marquis@arm.com,
	julien.grall@arm.com,
	jbeulich@suse.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	wl@xen.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 08/10] vpci/arm: Allow updating BAR's header for non-ECAM bridges
Date: Mon,  9 Nov 2020 14:50:29 +0200
Message-Id: <20201109125031.26409-9-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Non-ECAM host bridges in hwdom go directly to PCI config space,
not through vpci (they use their specific method for accessing PCI
configuration, e.g. dedicated registers etc.). Thus hwdom's vpci BARs are
never updated via vPCI MMIO handlers, so implement a dedicated method
for a PCI host bridge, so it has a chance to update the initial state of
the device BARs.

Note, we rely on the fact that control/hardware domain will not update
physical BAR locations for the given devices.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/pci/pci-host-common.c | 13 +++++++++++++
 xen/drivers/vpci/header.c          |  9 ++++++++-
 xen/include/asm-arm/pci.h          |  8 ++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index b6c4d7b636b1..5f4239afa41f 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -250,6 +250,19 @@ int pci_host_bridge_update_mappings(struct domain *d)
     return pci_host_iterate_bridges(d, pci_host_bridge_update_mapping);
 }
 
+void pci_host_bridge_update_bar_header(const struct pci_dev *pdev,
+                                       struct vpci_header *header)
+{
+    struct pci_host_bridge *bridge;
+
+    bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
+    if ( unlikely(!bridge) )
+        return;
+
+    if ( bridge->ops->update_bar_header )
+        bridge->ops->update_bar_header(pdev, header);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 7dc7c70e24f2..1f326c894d16 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -77,7 +77,14 @@ static struct vpci_header *get_vpci_header(struct domain *d,
     if ( !is_hardware_domain(d) )
     {
         struct vpci_header *hwdom_header = get_hwdom_vpci_header(pdev);
-
+#ifdef CONFIG_ARM
+        /*
+         * Non-ECAM host bridges in hwdom go directly to PCI
+         * config space, not through vpci. Thus hwdom's vpci BARs are
+         * never updated.
+         */
+        pci_host_bridge_update_bar_header(pdev, hwdom_header);
+#endif
         /* Make a copy of the hwdom's BARs as the initial state for vBARs. */
         memcpy(header, hwdom_header, sizeof(*header));
     }
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index d94e8a6628de..723b2a99b6e1 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -60,6 +60,9 @@ struct pci_config_window {
 /* Forward declaration as pci_host_bridge and pci_ops depend on each other. */
 struct pci_host_bridge;
 
+struct pci_dev;
+struct vpci_header;
+
 struct pci_ops {
     int (*read)(struct pci_host_bridge *bridge,
                     uint32_t sbdf, int where, int size, u32 *val);
@@ -69,6 +72,8 @@ struct pci_ops {
     int (*register_mmio_handler)(struct domain *d,
                                  struct pci_host_bridge *bridge,
                                  const struct mmio_handler_ops *ops);
+    void (*update_bar_header)(const struct pci_dev *pdev,
+                              struct vpci_header *header);
 };
 
 /*
@@ -110,6 +115,9 @@ int pci_host_iterate_bridges(struct domain *d,
                              int (*clb)(struct domain *d,
                                         struct pci_host_bridge *bridge));
 int pci_host_bridge_update_mappings(struct domain *d);
+void pci_host_bridge_update_bar_header(const struct pci_dev *pdev,
+                                       struct vpci_header *header);
+
 #else   /*!CONFIG_ARM_PCI*/
 struct arch_pci_dev { };
 static inline void  pci_init(void) { }
-- 
2.17.1


