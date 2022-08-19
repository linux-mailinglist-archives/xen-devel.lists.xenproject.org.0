Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D3559996B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 12:06:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390217.627545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOytL-0002ud-79; Fri, 19 Aug 2022 10:06:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390217.627545; Fri, 19 Aug 2022 10:06:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOytL-0002s6-3K; Fri, 19 Aug 2022 10:06:15 +0000
Received: by outflank-mailman (input) for mailman id 390217;
 Fri, 19 Aug 2022 10:06:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sWlb=YX=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oOytJ-0002G7-EC
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 10:06:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8d9f2eed-1fa6-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 12:06:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CFF71042;
 Fri, 19 Aug 2022 03:06:13 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 879A43F70D;
 Fri, 19 Aug 2022 03:06:10 -0700 (PDT)
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
X-Inumbo-ID: 8d9f2eed-1fa6-11ed-bd2e-47488cf2e6aa
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 6/7] xen: introduce xen-evtchn dom0less property
Date: Fri, 19 Aug 2022 11:02:43 +0100
Message-Id: <02993cf398573adf9e9bad62aa8d6e753b2c6ab9.1660902588.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660902588.git.rahul.singh@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new sub-node under /chosen node to establish static event
channel communication between domains on dom0less systems.

An event channel will be created beforehand to allow the domains to
send notifications to each other.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v2:
 - no change
---
---
 docs/misc/arm/device-tree/booting.txt |  63 +++++++++++-
 xen/arch/arm/domain_build.c           | 136 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/domain.h     |   1 +
 xen/arch/arm/include/asm/setup.h      |   1 +
 xen/arch/arm/setup.c                  |   2 +
 5 files changed, 202 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 98253414b8..ec7dbcaf8f 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -212,7 +212,7 @@ with the following properties:
     enable only selected interfaces.
 
 Under the "xen,domain" compatible node, one or more sub-nodes are present
-for the DomU kernel and ramdisk.
+for the DomU kernel, ramdisk and static event channel.
 
 The kernel sub-node has the following properties:
 
@@ -254,11 +254,43 @@ The ramdisk sub-node has the following properties:
     property because it will be created by the UEFI stub on boot.
     This option is needed only when UEFI boot is used.
 
+The static event channel sub-node has the following properties:
+
+- compatible
+
+    "xen,evtchn"
+
+- xen,evtchn
+
+    The property is tuples of two numbers
+    (local-evtchn link-to-foreign-evtchn) where:
+
+    local-evtchn is an integer value that will be used to allocate local port
+    for a domain to send and receive event notifications to/from the remote
+    domain. Maximum supported value is 2^17 for FIFO ABI and 4096 for 2L ABI.
+    It is recommended to use low event channel ID.
+
+    link-to-foreign-evtchn is a single phandle to a remote evtchn to which
+    local-evtchn will be connected.
 
 Example
 =======
 
 chosen {
+
+    module@0 {
+        compatible = "multiboot,kernel", "multiboot,module";
+        xen,uefi-binary = "...";
+        bootargs = "...";
+
+        /* one sub-node per local event channel */
+        ec1: evtchn@1 {
+            compatible = "xen,evtchn-v1";
+            /* local-evtchn link-to-foreign-evtchn */
+            xen,evtchn = <0xa &ec2>;
+        };
+    };
+
     domU1 {
         compatible = "xen,domain";
         #address-cells = <0x2>;
@@ -277,6 +309,23 @@ chosen {
             compatible = "multiboot,ramdisk", "multiboot,module";
             reg = <0x0 0x4b000000 0xffffff>;
         };
+
+        /* one sub-node per local event channel */
+        ec2: evtchn@2 {
+            compatible = "xen,evtchn-v1";
+            /* local-evtchn link-to-foreign-evtchn */
+            xen,evtchn = <0xa &ec1>;
+        };
+
+        ec3: evtchn@3 {
+            compatible = "xen,evtchn-v1";
+            xen,evtchn = <0xb &ec5>;
+        };
+
+        ec4: evtchn@4 {
+            compatible = "xen,evtchn-v1";
+            xen,evtchn = <0xc &ec6>;
+        };
     };
 
     domU2 {
@@ -296,6 +345,18 @@ chosen {
             compatible = "multiboot,ramdisk", "multiboot,module";
             reg = <0x0 0x4d000000 0xffffff>;
         };
+
+        /* one sub-node per local event channel */
+        ec5: evtchn@5 {
+            compatible = "xen,evtchn-v1";
+            /* local-evtchn link-to-foreign-evtchn */
+            xen,evtchn = <0xb &ec3>;
+        };
+
+        ec6: evtchn@6 {
+            compatible = "xen,evtchn-v1";
+            xen,evtchn = <0xd &ec4>;
+        };
     };
 };
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 11a8c6b8b5..5101bca979 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3052,6 +3052,141 @@ void __init evtchn_allocate(struct domain *d)
     d->arch.hvm.params[HVM_PARAM_CALLBACK_IRQ] = val;
 }
 
+static const void *__init get_evtchn_dt_property(
+        const struct dt_device_node *np)
+{
+    const void *prop = NULL;
+    uint32_t len;
+
+    prop = dt_get_property(np, "xen,evtchn", &len);
+    if ( !prop )
+        return NULL;
+
+    if ( !len )
+    {
+        printk(XENLOG_ERR "xen,evtchn property cannot be empty.\n");
+        return ERR_PTR(-EINVAL);
+    }
+
+    return prop;
+}
+
+static int __init allocate_domain_evtchn(const struct dt_device_node *node)
+{
+    const void *prop = NULL;
+    const __be32 *cell;
+    uint32_t domU1_port, domU2_port, remote_phandle;
+    const struct dt_device_node *evtchn_node, *remote_node;
+    struct evtchn_alloc_unbound alloc_unbound;
+    struct evtchn_bind_interdomain bind_interdomain;
+    int rc;
+
+    dt_for_each_child_node(node, evtchn_node)
+    {
+        struct domain *d, *d1 = NULL, *d2 = NULL;
+
+        if ( !dt_device_is_compatible(evtchn_node, "xen,evtchn-v1") )
+            continue;
+
+        prop = get_evtchn_dt_property(evtchn_node);
+        /* If the property is not found, return without errors */
+        if ( !prop || IS_ERR(prop) )
+            return IS_ERR(prop) ? PTR_ERR(prop) : 0;
+
+        cell = (const __be32 *)prop;
+        domU1_port = dt_next_cell(1, &cell);
+        remote_phandle = dt_next_cell(1, &cell);
+
+        remote_node = dt_find_node_by_phandle(remote_phandle);
+        if ( !remote_node )
+        {
+            printk(XENLOG_ERR
+                   "evtchn: could not find remote evtchn phandle\n");
+            return -EINVAL;
+        }
+
+        prop = get_evtchn_dt_property(remote_node);
+        /* If the property is not found, return without errors */
+        if ( !prop || IS_ERR(prop) )
+            return IS_ERR(prop) ? PTR_ERR(prop) : 0;
+
+        cell = (const __be32 *)prop;
+        domU2_port = dt_next_cell(1, &cell);
+        remote_phandle = dt_next_cell(1, &cell);
+
+        if ( evtchn_node->phandle != remote_phandle )
+        {
+            printk(XENLOG_ERR "xen,evtchn property is not setup correctly.\n");
+            return -EINVAL;
+        }
+
+        for_each_domain ( d )
+        {
+            if ( d->arch.node == node )
+            {
+                d1 = d;
+                continue;
+            }
+            if ( d->arch.node == dt_get_parent(remote_node) )
+                d2 = d;
+        }
+
+        if ( !d1 && dt_device_is_compatible(node, "multiboot,kernel") )
+            d1 = hardware_domain;
+
+        if ( !d2 && dt_device_is_compatible(dt_get_parent(remote_node),
+                                            "multiboot,kernel") )
+            d2 = hardware_domain;
+
+        if ( !d1 || !d2 )
+        {
+            printk(XENLOG_ERR "evtchn: could not find domains\n" );
+            return -EINVAL;
+        }
+
+        alloc_unbound.dom = d1->domain_id;
+        alloc_unbound.remote_dom = d2->domain_id;
+
+        rc = evtchn_alloc_unbound(&alloc_unbound, domU1_port);
+        if ( rc < 0 && rc != -EBUSY )
+        {
+            printk(XENLOG_ERR
+                   "evtchn_alloc_unbound() failure (Error %d) \n", rc);
+            return rc;
+        }
+
+        bind_interdomain.remote_dom  = d1->domain_id;
+        bind_interdomain.remote_port = domU1_port;
+
+        rc = evtchn_bind_interdomain(&bind_interdomain, d2, domU2_port);
+        if ( rc < 0 && rc != -EBUSY )
+        {
+            printk(XENLOG_ERR
+                   "evtchn_bind_interdomain() failure (Error %d) \n", rc);
+            return rc;
+        }
+    }
+
+    return 0;
+}
+
+void __init allocate_static_evtchn(void)
+{
+    struct dt_device_node *node;
+    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+
+    BUG_ON(chosen == NULL);
+    dt_for_each_child_node(chosen, node)
+    {
+        if ( dt_device_is_compatible(node, "xen,domain") ||
+             dt_device_is_compatible(node, "multiboot,kernel") )
+        {
+            if ( allocate_domain_evtchn(node) != 0 )
+                panic("Could not set up domains evtchn\n");
+        }
+    }
+}
+
 static void __init find_gnttab_region(struct domain *d,
                                       struct kernel_info *kinfo)
 {
@@ -3358,6 +3493,7 @@ void __init create_domUs(void)
             panic("Error creating domain %s\n", dt_node_name(node));
 
         d->is_console = true;
+        d->arch.node = node;
 
         if ( construct_domU(d, node) != 0 )
             panic("Could not set up domain %s\n", dt_node_name(node));
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index cd9ce19b4b..51192b28ee 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -105,6 +105,7 @@ struct arch_domain
 #endif
 
     bool directmap;
+    struct dt_device_node *node;
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 2bb01ecfa8..bac876e68e 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -106,6 +106,7 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
 
 void create_domUs(void);
 void create_dom0(void);
+void allocate_static_evtchn(void);
 
 void discard_initial_modules(void);
 void fw_unreserved_regions(paddr_t s, paddr_t e,
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 500307edc0..8eead619ae 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1063,6 +1063,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     if ( acpi_disabled )
         create_domUs();
 
+    allocate_static_evtchn();
+
     /*
      * This needs to be called **before** heap_init_late() so modules
      * will be scrubbed (unless suppressed).
-- 
2.25.1


