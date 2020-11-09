Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7817B2AB89B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 13:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22471.48822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc6dO-00049D-E6; Mon, 09 Nov 2020 12:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22471.48822; Mon, 09 Nov 2020 12:50:58 +0000
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
	id 1kc6dO-00048c-9B; Mon, 09 Nov 2020 12:50:58 +0000
Received: by outflank-mailman (input) for mailman id 22471;
 Mon, 09 Nov 2020 12:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc6dM-0003tf-GV
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:56 +0000
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7f8e413-9a77-403b-9adb-a160bd28eaa2;
 Mon, 09 Nov 2020 12:50:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 11so10138049ljf.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:39 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 04:50:38 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc6dM-0003tf-GV
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 12:50:56 +0000
X-Inumbo-ID: b7f8e413-9a77-403b-9adb-a160bd28eaa2
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b7f8e413-9a77-403b-9adb-a160bd28eaa2;
	Mon, 09 Nov 2020 12:50:39 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 11so10138049ljf.2
        for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2020 04:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PUERNr5enj9JC+Z7u0WMW7Vxpi+i1ufmU0togeFlHo0=;
        b=ANLRTH/4Hv3bHw8eON/a0Fq8FEpojEHcja+6e0UW2+ObVjfMN1VQpp/h6Il4p0fjre
         1/DnkOA4VpgHyY90+eIFSrwo0FToUsb8RclBLNOxRU1t5EZsRnqGb3ZNPFKmRXT4xnmY
         XoR7+URrhpmjZWptwHnuFuvTYPGFWCc32LM9n6ItABHncX57D3W6Os7pkcLkd1/UOdqm
         NrcHEtBmqjUZR8VcB6AICzcaDiboqs2KmyFB9TAz1K3Snjgg/L8rnByfJAEluRxD/CQq
         7fp06FQgKXqFmonTlk5vqol2WQXkGD5OeUiquzzmSDmvyjmxVJ0dUWHH/r6tHVcQ4E0D
         A4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PUERNr5enj9JC+Z7u0WMW7Vxpi+i1ufmU0togeFlHo0=;
        b=lcE5aq74yjtSQNmXmmi6luO63zEU1VdptoHTDx6FGfgO/5gSy5nG88F5m8GjPzEIMR
         ZqFGUf6atCww+K3xmcDVqpYk79wXcASk7IwtxUUsBRRdjBi0LMOdYKN5Sqv+7ZyvPYvk
         F8nAJz0soiRole8wDxi7rM1IUJkSM3NSkt1nsVBArzxWdNzi4GAF25PBy38dIursBu15
         Ex507irkynDwJvpvjDqfnBKLfwx4jh8XimXLWcDyg7pn4XFWul0B8gRUEI7cM7l6Iyq1
         1RSxLenOmAaVC89OaqMBuRYDOFVssGH3/R/6gHTuHy7zg8cHQ262CWrb/PFa//mOz14a
         C5jQ==
X-Gm-Message-State: AOAM533nWVPO99/pzlpDt3yMVrvkcUxJ4iVUreR7w5ib2b97xN/eIsXB
	RHdNJpQuC9IEuxrpxpGUbkw=
X-Google-Smtp-Source: ABdhPJxpHQoFZaGQdiyFojJGSAIuDJP5u+AqQp44p0HbAoz1/DbVFC+0Clu3bBtYGLbmbtezoClYRA==
X-Received: by 2002:a05:651c:544:: with SMTP id q4mr6213912ljp.468.1604926238541;
        Mon, 09 Nov 2020 04:50:38 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id i1sm1736447lfr.176.2020.11.09.04.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 04:50:38 -0800 (PST)
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
Subject: [PATCH 04/10] [WORKAROUND] xen/arm: Update hwdom's p2m to trap ECAM space
Date: Mon,  9 Nov 2020 14:50:25 +0200
Message-Id: <20201109125031.26409-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109125031.26409-1-andr2000@gmail.com>
References: <20201109125031.26409-1-andr2000@gmail.com>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Host bridge controller's ECAM space is mapped into Domain-0's p2m,
thus it is not possible to trap the same for vPCI via MMIO handlers.
For this to work we need to unmap those mappings in p2m.

TODO (Julien): It would be best if we avoid the map/unmap operation.
So, maybe we want to introduce another way to avoid the mapping.
Maybe by changing the type of the controller to "PCI_HOSTCONTROLLER"
and checking if this is a PCI hostcontroller avoid the mapping.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/arch/arm/domain_build.c         | 10 +++++++++-
 xen/arch/arm/pci/pci-host-common.c  | 15 +++++++++++++++
 xen/arch/arm/pci/pci-host-generic.c | 28 ++++++++++++++++++++++++++++
 xen/include/asm-arm/pci.h           |  2 ++
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1f83f9048146..3f696d2a6672 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2566,7 +2566,15 @@ int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
 
-    return construct_domain(d, &kinfo);
+    rc = construct_domain(d, &kinfo);
+    if ( rc < 0 )
+        return rc;
+
+#ifdef CONFIG_HAS_PCI
+    if ( has_vpci(d) )
+        rc = pci_host_bridge_update_mappings(d);
+#endif
+    return rc;
 }
 
 /*
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index b81184d34980..b6c4d7b636b1 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -235,6 +235,21 @@ int pci_host_iterate_bridges(struct domain *d,
     }
     return 0;
 }
+
+static int pci_host_bridge_update_mapping(struct domain *d,
+                                          struct pci_host_bridge *bridge)
+{
+    if ( !bridge->ops->update_mappings )
+        return 0;
+
+    return bridge->ops->update_mappings(d, bridge);
+}
+
+int pci_host_bridge_update_mappings(struct domain *d)
+{
+    return pci_host_iterate_bridges(d, pci_host_bridge_update_mapping);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/pci/pci-host-generic.c b/xen/arch/arm/pci/pci-host-generic.c
index 469df3da0116..772c53c881bc 100644
--- a/xen/arch/arm/pci/pci-host-generic.c
+++ b/xen/arch/arm/pci/pci-host-generic.c
@@ -21,6 +21,8 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <xen/pci.h>
+#include <xen/sched.h>
+#include <asm/p2m.h>
 #include <asm/pci.h>
 
 /*
@@ -85,6 +87,31 @@ int pci_ecam_config_read(struct pci_host_bridge *bridge, uint32_t sbdf,
     return 0;
 }
 
+/*
+ * TODO: This is called late on domain creation to mangle p2m if needed:
+ * for ECAM host controller for mmio region traps to work for Domain-0
+ * we need to unmap those mappings in p2m.
+ * This is WIP:
+ * julieng: I think it would be best if we avoid the map/unmap operation.
+ * So maybe we want to introduce another way to avoid the mapping.
+ * Maybe by changing the type of the controller to "PCI_HOSTCONTROLLER"
+ * and check if this is a PCI hostcontroller avoid the mapping.
+ */
+static int pci_ecam_update_mappings(struct domain *d,
+                                    struct pci_host_bridge *bridge)
+{
+    struct pci_config_window *cfg = bridge->sysdata;
+    int ret;
+
+    /* Only for control domain which owns this PCI host bridge. */
+    if ( !is_control_domain(d) )
+        return 0;
+
+    ret = unmap_regions_p2mt(d, gaddr_to_gfn(cfg->phys_addr),
+                             cfg->size >> PAGE_SHIFT, INVALID_MFN);
+    return ret;
+}
+
 static int pci_ecam_register_mmio_handler(struct domain *d,
                                           struct pci_host_bridge *bridge,
                                           const struct mmio_handler_ops *ops)
@@ -101,6 +128,7 @@ struct pci_ecam_ops pci_generic_ecam_ops = {
     .pci_ops    = {
         .read                  = pci_ecam_config_read,
         .write                 = pci_ecam_config_write,
+        .update_mappings       = pci_ecam_update_mappings,
         .register_mmio_handler = pci_ecam_register_mmio_handler,
     }
 };
diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
index e3a02429b8d4..d94e8a6628de 100644
--- a/xen/include/asm-arm/pci.h
+++ b/xen/include/asm-arm/pci.h
@@ -65,6 +65,7 @@ struct pci_ops {
                     uint32_t sbdf, int where, int size, u32 *val);
     int (*write)(struct pci_host_bridge *bridge,
                     uint32_t sbdf, int where, int size, u32 val);
+    int (*update_mappings)(struct domain *d, struct pci_host_bridge *bridge);
     int (*register_mmio_handler)(struct domain *d,
                                  struct pci_host_bridge *bridge,
                                  const struct mmio_handler_ops *ops);
@@ -108,6 +109,7 @@ bool dt_pci_parse_bus_range(struct dt_device_node *dev,
 int pci_host_iterate_bridges(struct domain *d,
                              int (*clb)(struct domain *d,
                                         struct pci_host_bridge *bridge));
+int pci_host_bridge_update_mappings(struct domain *d);
 #else   /*!CONFIG_ARM_PCI*/
 struct arch_pci_dev { };
 static inline void  pci_init(void) { }
-- 
2.17.1


