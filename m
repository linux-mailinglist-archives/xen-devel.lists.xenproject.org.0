Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540AE283397
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2948.8451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPN7P-0000fC-DS; Mon, 05 Oct 2020 09:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2948.8451; Mon, 05 Oct 2020 09:49:19 +0000
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
	id 1kPN7P-0000ef-9Y; Mon, 05 Oct 2020 09:49:19 +0000
Received: by outflank-mailman (input) for mailman id 2948;
 Mon, 05 Oct 2020 09:49:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kPN7O-0000a7-94
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:18 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b0d67c1-f441-4482-81d8-0a448f5a7faf;
 Mon, 05 Oct 2020 09:49:13 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7G-00018X-Ub; Mon, 05 Oct 2020 09:49:10 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7G-0007gW-Lf; Mon, 05 Oct 2020 09:49:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kPN7O-0000a7-94
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:18 +0000
X-Inumbo-ID: 3b0d67c1-f441-4482-81d8-0a448f5a7faf
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3b0d67c1-f441-4482-81d8-0a448f5a7faf;
	Mon, 05 Oct 2020 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=GCHQt2qpyFKezc4RlS7bJaSqJ0rTh54jgHtmbo053rM=; b=E2g7sHQL6sF7iRLQ5d3rqFKtlM
	u2WzzcXp5l6efaJe6jQBRqspjBtYvVfC3NxlgOQmfm+6tv+rrHJaZ8fB9/V8YUvKoOs52qZogLpBZ
	UCP2oh7QgEFrBdkRoE89KMpve1YNUYAvS1Z5CDgBkmPBkLJWJjaLmV/YRVi/Zo0yULXs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7G-00018X-Ub; Mon, 05 Oct 2020 09:49:10 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7G-0007gW-Lf; Mon, 05 Oct 2020 09:49:10 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/5] iommu / domctl: introduce XEN_DOMCTL_iommu_ctl
Date: Mon,  5 Oct 2020 10:49:02 +0100
Message-Id: <20201005094905.2929-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005094905.2929-1-paul@xen.org>
References: <20201005094905.2929-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

A subsequent patch will introduce code to apply a cap to memory used for
IOMMU page-tables for a domain. This patch simply introduces the boilerplate
for the new domctl.

The implementation of new sub-operations of the new domctl will be added to
iommu_ctl() and hence, whilst this initially only returns -EOPNOTSUPP, the
code in iommu_do_domctl() is modified to set up a hypercall continuation
should iommu_ctl() return -ERESTART.

NOTE: The op code is passed into the newly introduced xsm_iommu_ctl()
      function, but for the moment only a single default 'ctl' perm is
      defined in the new 'iommu' class.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/flask/policy/modules/dom0.te    |  2 ++
 xen/drivers/passthrough/iommu.c       | 39 ++++++++++++++++++++++++---
 xen/include/public/domctl.h           | 14 ++++++++++
 xen/include/xsm/dummy.h               | 17 +++++++++---
 xen/include/xsm/xsm.h                 | 26 ++++++++++++------
 xen/xsm/dummy.c                       |  6 +++--
 xen/xsm/flask/hooks.c                 | 26 +++++++++++++-----
 xen/xsm/flask/policy/access_vectors   |  7 +++++
 xen/xsm/flask/policy/security_classes |  1 +
 9 files changed, 114 insertions(+), 24 deletions(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index 0a63ce15b6..ab5eb682c7 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -69,6 +69,8 @@ auditallow dom0_t security_t:security { load_policy setenforce setbool };
 # Allow dom0 to report platform configuration changes back to the hypervisor
 allow dom0_t xen_t:resource setup;
 
+allow dom0_t xen_t:iommu ctl;
+
 admin_device(dom0_t, device_t)
 admin_device(dom0_t, irq_t)
 admin_device(dom0_t, ioport_t)
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 87f9a857bb..bef0405984 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -502,6 +502,27 @@ void iommu_resume()
         iommu_get_ops()->resume();
 }
 
+static int iommu_ctl(
+    struct xen_domctl *domctl, struct domain *d,
+    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    struct xen_domctl_iommu_ctl *ctl = &domctl->u.iommu_ctl;
+    int rc;
+
+    rc = xsm_iommu_ctl(XSM_HOOK, d, ctl->op);
+    if ( rc )
+        return rc;
+
+    switch ( ctl->op )
+    {
+    default:
+        rc = -EOPNOTSUPP;
+        break;
+    }
+
+    return rc;
+}
+
 int iommu_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
@@ -511,14 +532,26 @@ int iommu_do_domctl(
     if ( !is_iommu_enabled(d) )
         return -EOPNOTSUPP;
 
+    switch ( domctl->cmd )
+    {
+    case XEN_DOMCTL_iommu_ctl:
+        ret = iommu_ctl(domctl, d, u_domctl);
+        if ( ret == -ERESTART )
+            ret = hypercall_create_continuation(__HYPERVISOR_domctl,
+                                                "h", u_domctl);
+        break;
+
+    default:
 #ifdef CONFIG_HAS_PCI
-    ret = iommu_do_pci_domctl(domctl, d, u_domctl);
+        ret = iommu_do_pci_domctl(domctl, d, u_domctl);
 #endif
 
 #ifdef CONFIG_HAS_DEVICE_TREE
-    if ( ret == -ENODEV )
-        ret = iommu_do_dt_domctl(domctl, d, u_domctl);
+        if ( ret == -ENODEV )
+            ret = iommu_do_dt_domctl(domctl, d, u_domctl);
 #endif
+        break;
+    }
 
     return ret;
 }
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 791f0a2592..75e855625a 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1130,6 +1130,18 @@ struct xen_domctl_vuart_op {
                                  */
 };
 
+/*
+ * XEN_DOMCTL_iommu_ctl
+ *
+ * Control of VM IOMMU settings
+ */
+
+#define XEN_DOMCTL_IOMMU_INVALID 0
+
+struct xen_domctl_iommu_ctl {
+    uint32_t op; /* XEN_DOMCTL_IOMMU_* */
+};
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1214,6 +1226,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vuart_op                      81
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
+#define XEN_DOMCTL_iommu_ctl                     84
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1274,6 +1287,7 @@ struct xen_domctl {
         struct xen_domctl_monitor_op        monitor_op;
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
+        struct xen_domctl_iommu_ctl         iommu_ctl;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 2368acebed..9825533c75 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -348,7 +348,15 @@ static XSM_INLINE int xsm_get_vnumainfo(XSM_DEFAULT_ARG struct domain *d)
     return xsm_default_action(action, current->domain, d);
 }
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH)
+static XSM_INLINE int xsm_iommu_ctl(XSM_DEFAULT_ARG struct domain *d,
+                                    unsigned int op)
+{
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, current->domain, d);
+}
+
+#if defined(CONFIG_HAS_PCI)
 static XSM_INLINE int xsm_get_device_group(XSM_DEFAULT_ARG uint32_t machine_bdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
@@ -367,9 +375,9 @@ static XSM_INLINE int xsm_deassign_device(XSM_DEFAULT_ARG struct domain *d, uint
     return xsm_default_action(action, current->domain, d);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_PCI */
+#endif /* HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_DEVICE_TREE)
 static XSM_INLINE int xsm_assign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
                                           const char *dtpath)
 {
@@ -384,7 +392,8 @@ static XSM_INLINE int xsm_deassign_dtdevice(XSM_DEFAULT_ARG struct domain *d,
     return xsm_default_action(action, current->domain, d);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
+#endif /* HAS_DEVICE_TREE */
+#endif /* HAS_PASSTHROUGH */
 
 static XSM_INLINE int xsm_resource_plug_core(XSM_DEFAULT_VOID)
 {
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index b21c3783d3..1a96d3502c 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -106,17 +106,19 @@ struct xsm_operations {
     int (*irq_permission) (struct domain *d, int pirq, uint8_t allow);
     int (*iomem_permission) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
     int (*iomem_mapping) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
-    int (*pci_config_permission) (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access);
+    int (*pci_config_permission) (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access); 
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH)
+    int (*iommu_ctl) (struct domain *d, unsigned int op);
+#if defined(CONFIG_HAS_PCI)
     int (*get_device_group) (uint32_t machine_bdf);
     int (*assign_device) (struct domain *d, uint32_t machine_bdf);
     int (*deassign_device) (struct domain *d, uint32_t machine_bdf);
 #endif
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_DEVICE_TREE)
     int (*assign_dtdevice) (struct domain *d, const char *dtpath);
     int (*deassign_dtdevice) (struct domain *d, const char *dtpath);
+#endif
 #endif
 
     int (*resource_plug_core) (void);
@@ -466,7 +468,14 @@ static inline int xsm_pci_config_permission (xsm_default_t def, struct domain *d
     return xsm_ops->pci_config_permission(d, machine_bdf, start, end, access);
 }
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH)
+static inline int xsm_iommu_ctl(xsm_default_t def, struct domain *d,
+                                unsigned int op)
+{
+    return xsm_ops->iommu_ctl(d, op);
+}
+
+#if defined(CONFIG_HAS_PCI)
 static inline int xsm_get_device_group(xsm_default_t def, uint32_t machine_bdf)
 {
     return xsm_ops->get_device_group(machine_bdf);
@@ -481,9 +490,9 @@ static inline int xsm_deassign_device(xsm_default_t def, struct domain *d, uint3
 {
     return xsm_ops->deassign_device(d, machine_bdf);
 }
-#endif /* HAS_PASSTHROUGH && HAS_PCI) */
+#endif /* HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_DEVICE_TREE)
 static inline int xsm_assign_dtdevice(xsm_default_t def, struct domain *d,
                                       const char *dtpath)
 {
@@ -496,7 +505,8 @@ static inline int xsm_deassign_dtdevice(xsm_default_t def, struct domain *d,
     return xsm_ops->deassign_dtdevice(d, dtpath);
 }
 
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
+#endif /* HAS_DEVICE_TREE */
+#endif /* HAS_PASSTHROUGH */
 
 static inline int xsm_resource_plug_pci (xsm_default_t def, uint32_t machine_bdf)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index d4cce68089..a924f1dfd1 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -84,14 +84,16 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
     set_to_dummy_if_null(ops, get_vnumainfo);
 
 #if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+    set_to_dummy_if_null(ops, iommu_ctl);
+#if defined(CONFIG_HAS_PCI)
     set_to_dummy_if_null(ops, get_device_group);
     set_to_dummy_if_null(ops, assign_device);
     set_to_dummy_if_null(ops, deassign_device);
 #endif
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_DEVICE_TREE)
     set_to_dummy_if_null(ops, assign_dtdevice);
     set_to_dummy_if_null(ops, deassign_dtdevice);
+#endif
 #endif
 
     set_to_dummy_if_null(ops, resource_plug_core);
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b3addbf701..a2858fb0c0 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -624,6 +624,7 @@ static int flask_domctl(struct domain *d, int cmd)
      * These have individual XSM hooks
      * (drivers/passthrough/{pci,device_tree.c)
      */
+    case XEN_DOMCTL_iommu_ctl:
     case XEN_DOMCTL_get_device_group:
     case XEN_DOMCTL_test_assign_device:
     case XEN_DOMCTL_assign_device:
@@ -1278,7 +1279,15 @@ static int flask_mem_sharing(struct domain *d)
 }
 #endif
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH)
+
+static int flask_iommu_ctl(struct domain *d, unsigned int op)
+{
+    /* All current ops are subject to default 'ctl' perm */
+    return current_has_perm(d, SECCLASS_IOMMU, IOMMU__CTL);
+}
+
+#if defined(CONFIG_HAS_PCI)
 static int flask_get_device_group(uint32_t machine_bdf)
 {
     u32 rsid;
@@ -1348,9 +1357,9 @@ static int flask_deassign_device(struct domain *d, uint32_t machine_bdf)
 
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE, NULL);
 }
-#endif /* HAS_PASSTHROUGH && HAS_PCI */
+#endif /* HAS_PCI */
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_DEVICE_TREE)
 static int flask_test_assign_dtdevice(const char *dtpath)
 {
     u32 rsid;
@@ -1410,7 +1419,8 @@ static int flask_deassign_dtdevice(struct domain *d, const char *dtpath)
     return avc_current_has_perm(rsid, SECCLASS_RESOURCE, RESOURCE__REMOVE_DEVICE,
                                 NULL);
 }
-#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
+#endif /* HAS_DEVICE_TREE */
+#endif /* HAS_PASSTHROUGH */
 
 static int flask_platform_op(uint32_t op)
 {
@@ -1855,15 +1865,17 @@ static struct xsm_operations flask_ops = {
     .remove_from_physmap = flask_remove_from_physmap,
     .map_gmfn_foreign = flask_map_gmfn_foreign,
 
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+#if defined(CONFIG_HAS_PASSTHROUGH)
+    .iommu_ctl = flask_iommu_ctl,
+#if defined(CONFIG_HAS_PCI)
     .get_device_group = flask_get_device_group,
     .assign_device = flask_assign_device,
     .deassign_device = flask_deassign_device,
 #endif
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+#if defined(CONFIG_HAS_DEVICE_TREE)
     .assign_dtdevice = flask_assign_dtdevice,
     .deassign_dtdevice = flask_deassign_dtdevice,
+#endif
 #endif
 
     .platform_op = flask_platform_op,
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index fde5162c7e..c017a38666 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -542,3 +542,10 @@ class argo
     # Domain sending a message to another domain.
     send
 }
+
+# Class iommu describes operations on the IOMMU resources of a domain
+class iommu
+{
+    # Miscellaneous control
+    ctl
+}
diff --git a/xen/xsm/flask/policy/security_classes b/xen/xsm/flask/policy/security_classes
index 50ecbabc5c..882968e79c 100644
--- a/xen/xsm/flask/policy/security_classes
+++ b/xen/xsm/flask/policy/security_classes
@@ -20,5 +20,6 @@ class grant
 class security
 class version
 class argo
+class iommu
 
 # FLASK
-- 
2.20.1


