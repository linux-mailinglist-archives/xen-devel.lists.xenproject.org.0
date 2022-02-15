Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A790B4B6904
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 11:16:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272926.467972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusW-0004OU-Vf; Tue, 15 Feb 2022 10:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272926.467972; Tue, 15 Feb 2022 10:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJusW-0004Ie-Mr; Tue, 15 Feb 2022 10:16:12 +0000
Received: by outflank-mailman (input) for mailman id 272926;
 Tue, 15 Feb 2022 10:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h622=S6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1nJusV-0003iX-BH
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 10:16:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4bb02719-8e48-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 11:16:10 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEDBD1063;
 Tue, 15 Feb 2022 02:16:09 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44AAE3F66F;
 Tue, 15 Feb 2022 02:16:08 -0800 (PST)
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
X-Inumbo-ID: 4bb02719-8e48-11ec-8eb8-a37418f5ba1a
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/5] arm/dom0less: assign dom0less guests to cpupools
Date: Tue, 15 Feb 2022 10:15:51 +0000
Message-Id: <20220215101551.23101-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220215101551.23101-1-luca.fancellu@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>

Introduce domain-cpupool property of a xen,domain device tree node,
that specifies the cpupool device tree handle of a xen,cpupool node
that identifies a cpupool created at boot time where the guest will
be assigned on creation.

Add member to the xen_arch_domainconfig public interface so the
XEN_DOMCTL_INTERFACE_VERSION version is bumped.

Update documentation about the property.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 5 +++++
 xen/arch/arm/domain.c                 | 6 ++++++
 xen/arch/arm/domain_build.c           | 9 ++++++++-
 xen/arch/x86/domain.c                 | 6 ++++++
 xen/common/domain.c                   | 5 ++++-
 xen/include/public/arch-arm.h         | 2 ++
 xen/include/public/domctl.h           | 2 +-
 xen/include/xen/domain.h              | 3 +++
 8 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 71895663a4de..0f1f210fa449 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -182,6 +182,11 @@ with the following properties:
     Both #address-cells and #size-cells need to be specified because
     both sub-nodes (described shortly) have reg properties.
 
+- domain-cpupool
+
+    Optional. Handle to a xen,cpupool device tree node that identifies the
+    cpupool where the guest will be started at boot.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 92a6c509e5c5..be350b28b588 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -788,6 +788,12 @@ fail:
     return rc;
 }
 
+unsigned int
+arch_get_domain_cpupool_id(const struct xen_domctl_createdomain *config)
+{
+    return config->arch.cpupool_id;
+}
+
 void arch_domain_destroy(struct domain *d)
 {
     /* IOMMU page table is shared with P2M, always call
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6931c022a2e8..4f239e756775 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3015,7 +3015,8 @@ static int __init construct_domU(struct domain *d,
 void __init create_domUs(void)
 {
     struct dt_device_node *node;
-    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+    const struct dt_device_node *cpupool_node,
+                                *chosen = dt_find_node_by_path("/chosen");
 
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
@@ -3053,6 +3054,12 @@ void __init create_domUs(void)
                                          GUEST_VPL011_SPI - 32 + 1);
         }
 
+        /* Get the optional property domain-cpupool */
+        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
+        if ( cpupool_node )
+            dt_property_read_u32(cpupool_node, "cpupool-id",
+                                 &d_cfg.arch.cpupool_id);
+
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc1402..3e3cf88c9c82 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -880,6 +880,12 @@ int arch_domain_create(struct domain *d,
     return rc;
 }
 
+unsigned int
+arch_get_domain_cpupool_id(const struct xen_domctl_createdomain *config)
+{
+    return 0;
+}
+
 void arch_domain_destroy(struct domain *d)
 {
     if ( is_hvm_domain(d) )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2048ebad86ff..d42ca8292025 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -665,6 +665,8 @@ struct domain *domain_create(domid_t domid,
 
     if ( !is_idle_domain(d) )
     {
+        unsigned int domain_cpupool_id;
+
         watchdog_domain_init(d);
         init_status |= INIT_watchdog;
 
@@ -698,7 +700,8 @@ struct domain *domain_create(domid_t domid,
         if ( !d->pbuf )
             goto fail;
 
-        if ( (err = sched_init_domain(d, 0)) != 0 )
+        domain_cpupool_id = arch_get_domain_cpupool_id(config);
+        if ( (err = sched_init_domain(d, domain_cpupool_id)) != 0 )
             goto fail;
 
         if ( (err = late_hwdom_init(d)) != 0 )
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 94b31511ddea..2c5d1ea7f01a 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -321,6 +321,8 @@ struct xen_arch_domainconfig {
     uint16_t tee_type;
     /* IN */
     uint32_t nr_spis;
+    /* IN */
+    unsigned int cpupool_id;
     /*
      * OUT
      * Based on the property clock-frequency in the DT timer node.
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index b85e6170b0aa..31ec083cb06e 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -38,7 +38,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 160c8dbdab33..fb018871bc17 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -63,6 +63,9 @@ void unmap_vcpu_info(struct vcpu *v);
 int arch_domain_create(struct domain *d,
                        struct xen_domctl_createdomain *config);
 
+unsigned int
+arch_get_domain_cpupool_id(const struct xen_domctl_createdomain *config);
+
 void arch_domain_destroy(struct domain *d);
 
 void arch_domain_shutdown(struct domain *d);
-- 
2.17.1


