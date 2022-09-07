Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB215B0A2A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 18:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402068.644075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVxyi-00022j-MD; Wed, 07 Sep 2022 16:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402068.644075; Wed, 07 Sep 2022 16:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVxyi-0001ys-If; Wed, 07 Sep 2022 16:32:40 +0000
Received: by outflank-mailman (input) for mailman id 402068;
 Wed, 07 Sep 2022 16:32:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a/dp=ZK=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oVxyh-0001dU-Mn
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 16:32:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id af70ebc6-2eca-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 18:32:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E840D13D5;
 Wed,  7 Sep 2022 09:32:43 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BDB6E3F71A;
 Wed,  7 Sep 2022 09:32:36 -0700 (PDT)
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
X-Inumbo-ID: af70ebc6-2eca-11ed-a016-b9edf5238543
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 7/7] xen/arm: introduce xen-evtchn dom0less property
Date: Wed,  7 Sep 2022 17:27:38 +0100
Message-Id: <f56939423b0b2d9330ff5e88f5f52e5a538f52d0.1662563170.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662563170.git.rahul.singh@arm.com>
References: <cover.1662563170.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new sub-node under /chosen node to establish static event
channel communication between domains on dom0less systems.

An event channel will be created beforehand to allow the domains to
send notifications to each other.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
Changes in v5:
 - fix minor comments
Changes in v4:
 - move documentation to common place for evtchn node in booting.txt
 - Add comment why we use dt_device_static_evtchn_created()
 - check if dt_get_parent() returns NULL
 - fold process_static_evtchn_node() in alloc_static_evtchn()
Changes in v3:
 - use device-tree used_by to find the domain id of the evtchn node.
 - add new static_evtchn_create variable in struct dt_device_node to
   hold the information if evtchn is already created.
 - fix minor comments
Changes in v2:
 - no change
---
---
 docs/misc/arm/device-tree/booting.txt |  98 +++++++++++++++++
 xen/arch/arm/domain_build.c           | 147 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/setup.h      |   1 +
 xen/arch/arm/setup.c                  |   2 +
 xen/include/xen/device_tree.h         |  16 +++
 5 files changed, 264 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 47567b3906..e03e5e9e4c 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -382,3 +382,101 @@ device-tree:
 
 This will reserve a 512MB region starting at the host physical address
 0x30000000 to be exclusively used by DomU1.
+
+Static Event Channel
+====================
+The event channel communication will be established statically between two
+domains (dom0 and domU also). Event channel connection information between
+domains will be passed to Xen via the device tree node. The event channel
+will be created and established in Xen before the domain started. The domain
+does not need to do any operation to establish a connection. Domain only
+needs hypercall EVTCHNOP_send(local port) to send notifications to the
+remote guest.
+
+There is no need to describe the static event channel info in the domU device
+tree. Static event channels are only useful in fully static configurations,
+and in those configurations, the domU device tree dynamically generated by Xen
+is not needed.
+
+To enable the event-channel interface for domU guests include the
+xen,enhanced = "no-xenstore" property in the domU Xen device tree node.
+
+Under the "xen,domain" compatible node for domU, there needs to be sub-nodes
+with compatible "xen,evtchn" that describe the event channel connection
+between two domUs. For dom0, there needs to be sub-nodes with compatible
+"xen,evtchn" under the chosen node.
+
+The static event channel node has the following properties:
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
+    It is recommended to use low event channel IDs.
+
+    link-to-foreign-evtchn is a single phandle to a remote evtchn to which
+    local-evtchn will be connected.
+
+Example
+=======
+
+chosen {
+
+    /* One sub-node per local event channel. This sub-node is for Dom0. */
+    ec1: evtchn@1 {
+         compatible = "xen,evtchn-v1";
+         /* local-evtchn link-to-foreign-evtchn */
+         xen,evtchn = <0xa &ec2>;
+    };
+
+    domU1 {
+        compatible = "xen,domain";
+        #address-cells = <0x2>;
+        #size-cells = <0x1>;
+        xen,enhanced = "no-xenstore";
+
+        /* One sub-node per local event channel */
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
+    };
+
+    domU2 {
+        compatible = "xen,domain";
+        #address-cells = <0x2>;
+        #size-cells = <0x1>;
+        xen,enhanced = "no-xenstore";
+
+        /* One sub-node per local event channel */
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
+    };
+};
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 580ed70b9c..1a59bd7e29 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -33,6 +33,8 @@
 #include <xen/grant_table.h>
 #include <xen/serial.h>
 
+#define STATIC_EVTCHN_NODE_SIZE_CELLS 2
+
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
 
@@ -3052,6 +3054,150 @@ void __init evtchn_allocate(struct domain *d)
     d->arch.hvm.params[HVM_PARAM_CALLBACK_IRQ] = val;
 }
 
+static int __init get_evtchn_dt_property(const struct dt_device_node *np,
+                                         uint32_t *port, uint32_t *phandle)
+{
+    const __be32 *prop = NULL;
+    uint32_t len;
+
+    prop = dt_get_property(np, "xen,evtchn", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_ERR "xen,evtchn property should not be empty.\n");
+        return -EINVAL;
+    }
+
+    if ( !len || len < dt_cells_to_size(STATIC_EVTCHN_NODE_SIZE_CELLS) )
+    {
+        printk(XENLOG_ERR "xen,evtchn property value is not valid.\n");
+        return -EINVAL;
+    }
+
+    *port = dt_next_cell(1, &prop);
+    *phandle = dt_next_cell(1, &prop);
+
+    return 0;
+}
+
+static int __init alloc_domain_evtchn(struct dt_device_node *node)
+{
+    int rc;
+    uint32_t domU1_port, domU2_port, remote_phandle;
+    struct dt_device_node *remote_node;
+    const struct dt_device_node *p1_node, *p2_node;
+    struct evtchn_alloc_unbound alloc_unbound;
+    struct evtchn_bind_interdomain bind_interdomain;
+    struct domain *d1 = NULL, *d2 = NULL;
+
+    if ( !dt_device_is_compatible(node, "xen,evtchn-v1") )
+        return 0;
+
+    /*
+     * Event channel is already created while parsing the other side of
+     * evtchn node.
+     */
+    if ( dt_device_static_evtchn_created(node) )
+        return 0;
+
+    rc = get_evtchn_dt_property(node, &domU1_port, &remote_phandle);
+    if ( rc )
+        return rc;
+
+    remote_node = dt_find_node_by_phandle(remote_phandle);
+    if ( !remote_node )
+    {
+        printk(XENLOG_ERR
+                "evtchn: could not find remote evtchn phandle\n");
+        return -EINVAL;
+    }
+
+    rc = get_evtchn_dt_property(remote_node, &domU2_port, &remote_phandle);
+    if ( rc )
+        return rc;
+
+    if ( node->phandle != remote_phandle )
+    {
+        printk(XENLOG_ERR "xen,evtchn property is not setup correctly.\n");
+        return -EINVAL;
+    }
+
+    p1_node = dt_get_parent(node);
+    if ( !p1_node )
+    {
+        printk(XENLOG_ERR "evtchn: evtchn parent node is NULL\n" );
+        return -EINVAL;
+    }
+
+    p2_node = dt_get_parent(remote_node);
+    if ( !p2_node )
+    {
+        printk(XENLOG_ERR "evtchn: remote parent node is NULL\n" );
+        return -EINVAL;
+    }
+
+    d1 = get_domain_by_id(p1_node->used_by);
+    d2 = get_domain_by_id(p2_node->used_by);
+
+    if ( !d1 || !d2 )
+    {
+        printk(XENLOG_ERR "evtchn: could not find domains\n" );
+        return -EINVAL;
+    }
+
+    alloc_unbound.dom = d1->domain_id;
+    alloc_unbound.remote_dom = d2->domain_id;
+
+    rc = evtchn_alloc_unbound(&alloc_unbound, domU1_port);
+    if ( rc < 0 )
+    {
+        printk(XENLOG_ERR
+                "evtchn_alloc_unbound() failure (Error %d) \n", rc);
+        return rc;
+    }
+
+    bind_interdomain.remote_dom  = d1->domain_id;
+    bind_interdomain.remote_port = domU1_port;
+
+    rc = evtchn_bind_interdomain(&bind_interdomain, d2, domU2_port);
+    if ( rc < 0 )
+    {
+        printk(XENLOG_ERR
+                "evtchn_bind_interdomain() failure (Error %d) \n", rc);
+        return rc;
+    }
+
+    dt_device_set_static_evtchn_created(node);
+    dt_device_set_static_evtchn_created(remote_node);
+
+    return 0;
+}
+
+void __init alloc_static_evtchn(void)
+{
+    struct dt_device_node *node, *evtchn_node;
+    struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
+
+    BUG_ON(chosen == NULL);
+
+    if ( hardware_domain )
+        dt_device_set_used_by(chosen, hardware_domain->domain_id);
+
+    dt_for_each_child_node(chosen, node)
+    {
+        if ( hardware_domain )
+        {
+            if ( alloc_domain_evtchn(node) != 0 )
+                panic("Could not set up domains evtchn\n");
+        }
+
+        dt_for_each_child_node(node, evtchn_node)
+        {
+            if ( alloc_domain_evtchn(evtchn_node) != 0 )
+                panic("Could not set up domains evtchn\n");
+        }
+    }
+}
+
 static void __init find_gnttab_region(struct domain *d,
                                       struct kernel_info *kinfo)
 {
@@ -3369,6 +3515,7 @@ void __init create_domUs(void)
             panic("Error creating domain %s\n", dt_node_name(node));
 
         d->is_console = true;
+        dt_device_set_used_by(node, d->domain_id);
 
         if ( construct_domU(d, node) != 0 )
             panic("Could not set up domain %s\n", dt_node_name(node));
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 5815ccf8c5..5ee28b270f 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -106,6 +106,7 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
 
 void create_domUs(void);
 void create_dom0(void);
+void alloc_static_evtchn(void);
 
 void discard_initial_modules(void);
 void fw_unreserved_regions(paddr_t s, paddr_t e,
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7814fe323d..909013992e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -1078,6 +1078,8 @@ void __init start_xen(unsigned long boot_phys_offset,
     if ( acpi_disabled )
         create_domUs();
 
+    alloc_static_evtchn();
+
     /*
      * This needs to be called **before** heap_init_late() so modules
      * will be scrubbed (unless suppressed).
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 430a1ef445..a28937d12a 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -92,6 +92,10 @@ struct dt_device_node {
 
     /* IOMMU specific fields */
     bool is_protected;
+
+    /* HACK: Remove this if there is a need of space */
+    bool_t static_evtchn_created;
+
     /*
      * The main purpose of this list is to link the structure in the list
      * of devices assigned to domain.
@@ -317,6 +321,18 @@ static inline bool_t dt_property_name_is_equal(const struct dt_property *pp,
     return !dt_prop_cmp(pp->name, name);
 }
 
+static inline void
+dt_device_set_static_evtchn_created(struct dt_device_node *device)
+{
+    device->static_evtchn_created = true;
+}
+
+static inline bool_t
+dt_device_static_evtchn_created(const struct dt_device_node *device)
+{
+    return device->static_evtchn_created;
+}
+
 /**
  * dt_find_compatible_node - Find a node based on type and one of the
  *                           tokens in its "compatible" property
-- 
2.25.1


