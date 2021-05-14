Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E9C38120B
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 22:51:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127554.239752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhemZ-0003Sw-Iu; Fri, 14 May 2021 20:51:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127554.239752; Fri, 14 May 2021 20:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhemZ-0003QO-G0; Fri, 14 May 2021 20:51:39 +0000
Received: by outflank-mailman (input) for mailman id 127554;
 Fri, 14 May 2021 20:51:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l2R2=KJ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lhemY-0003Po-HX
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 20:51:38 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9973e2f-0f1c-4300-af93-06caf840ab44;
 Fri, 14 May 2021 20:51:37 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1621025174137572.2487861385831;
 Fri, 14 May 2021 13:46:14 -0700 (PDT)
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
X-Inumbo-ID: a9973e2f-0f1c-4300-af93-06caf840ab44
ARC-Seal: i=1; a=rsa-sha256; t=1621025176; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j29W/jvDvHchWTZy87G1FmjM7/1/qoCbhnR0Q+0s1nFfn4bO1FSeKPtIpX/Zzv1315U8wVkGpTH1QBkgHbzqAa2OW0qX8eEBk1u1CJPpQt4WKNTgPlB40LVrJqK61ffGX4RzHlt28QBeogJd6Y0LsZzbvy9rddLTWNNPtbjtN7g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1621025176; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UOuUY/j2uqB9R7XKS5OSaop21yJAw0RickXVL7Xgjpg=; 
	b=biGDvtKposTKEZW5zKxADvfVpQelxWMZt3wKsIf8C4AB7Ymrlebs7wyRtGBiqpd0HB7fRn7W4fUr3WgqI31VYo6AneKQXQNV00MT3+WufoMOgFVhiukjxyrQJSNkIyZAxjAWb+NIxc809WUelede7U6stKjrrXblynKk0zbIe88=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1621025176;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UOuUY/j2uqB9R7XKS5OSaop21yJAw0RickXVL7Xgjpg=;
	b=X1v2pp3Tp0QSW2NOqS2evUr2UdMYHFbuYdOg/FvtTVZN00VSpjEc511lnm/HrRY0
	uINmdGBSrV1Htc9i2vXDRXzVB+JXp9Xbe+tSVUK7NqWpu5RqREBnJK43EpWri4/wLHb
	OqFFL3Ek/AQkZ5a/2AYTTQHA0FSyBIkW0W/wn49E=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	andrew.cooper3@citrix.com,
	george.dunlap@citrix.com,
	iwj@xenproject.org,
	jbeulich@suse.com,
	wl@xen.org,
	roger.pau@citrix.com,
	tamas@tklengyel.com,
	tim@xen.org,
	jgross@suse.com,
	aisaila@bitdefender.com,
	ppircalabu@bitdefender.com,
	dfaggioli@suse.com,
	paul@xen.org,
	kevin.tian@intel.com,
	dgdegra@tycho.nsa.gov,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [RFC PATCH 07/10] xsm-roles: adjusting core xsm
Date: Fri, 14 May 2021 16:54:34 -0400
Message-Id: <20210514205437.13661-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210514205437.13661-1-dpsmith@apertussolutions.com>
References: <20210514205437.13661-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This is adjustments and clean ups to the core of xsm for adoption of the domain
roles.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xen/sched.h |   2 +-
 xen/include/xsm/xsm.h   |  26 -------
 xen/xsm/Makefile        |   3 +-
 xen/xsm/dummy.c         | 160 ----------------------------------------
 xen/xsm/xsm_core.c      |  46 +++---------
 5 files changed, 14 insertions(+), 223 deletions(-)
 delete mode 100644 xen/xsm/dummy.c

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index d84b047359..a00d7fc260 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -120,7 +120,7 @@ struct evtchn
     unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
     uint32_t fifo_lastq;           /* Data for identifying last queue. */
 
-#ifdef CONFIG_XSM
+#ifdef CONFIG_XSM_POLICY
     union {
 #ifdef XSM_NEED_GENERIC_EVTCHN_SSID
         /*
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index 50f2f547dc..8b5e9c737b 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -995,8 +995,6 @@ extern void silo_init(void);
 static inline void silo_init(void) {}
 #endif
 
-#ifdef CONFIG_XSM_POLICY_MODULES
-
 #ifdef CONFIG_MULTIBOOT
 extern int xsm_multiboot_init(unsigned long *module_map,
                               const multiboot_info_t *mbi);
@@ -1017,28 +1015,4 @@ extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
 extern bool has_xsm_magic(paddr_t);
 #endif
 
-#else /* CONFIG_XSM_POLICY_MODULES */
-
-#ifdef CONFIG_MULTIBOOT
-static inline int xsm_multiboot_init (unsigned long *module_map,
-                                      const multiboot_info_t *mbi)
-{
-    return 0;
-}
-#endif
-
-#ifdef CONFIG_HAS_DEVICE_TREE
-static inline int xsm_dt_init(void)
-{
-    return 0;
-}
-
-static inline bool has_xsm_magic(paddr_t start)
-{
-    return false;
-}
-#endif /* CONFIG_HAS_DEVICE_TREE */
-
-#endif /* CONFIG_XSM_POLICY_MODULES */
-
 #endif /* __XSM_H */
diff --git a/xen/xsm/Makefile b/xen/xsm/Makefile
index cf0a728f1c..870bbb8247 100644
--- a/xen/xsm/Makefile
+++ b/xen/xsm/Makefile
@@ -1,6 +1,5 @@
 obj-y += xsm_core.o
-obj-$(CONFIG_XSM) += xsm_policy.o
-obj-$(CONFIG_XSM) += dummy.o
+obj-$(CONFIG_XSM_POLICY) += xsm_policy.o
 obj-$(CONFIG_XSM_SILO) += silo.o
 
 obj-$(CONFIG_XSM_FLASK) += flask/
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
deleted file mode 100644
index 627f12dbff..0000000000
--- a/xen/xsm/dummy.c
+++ /dev/null
@@ -1,160 +0,0 @@
-/*
- *  This work is based on the LSM implementation in Linux 2.6.13.4.
- *
- *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
- *
- *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2,
- *  as published by the Free Software Foundation.
- */
-
-#define XSM_NO_WRAPPERS
-#include <xsm/dummy.h>
-
-struct xsm_operations dummy_xsm_ops;
-
-#define set_to_dummy_if_null(ops, function)                            \
-    do {                                                               \
-        if ( !ops->function )                                          \
-            ops->function = xsm_##function;                            \
-    } while (0)
-
-void __init xsm_fixup_ops (struct xsm_operations *ops)
-{
-    set_to_dummy_if_null(ops, security_domaininfo);
-    set_to_dummy_if_null(ops, domain_create);
-    set_to_dummy_if_null(ops, getdomaininfo);
-    set_to_dummy_if_null(ops, domctl_scheduler_op);
-    set_to_dummy_if_null(ops, sysctl_scheduler_op);
-    set_to_dummy_if_null(ops, set_target);
-    set_to_dummy_if_null(ops, domctl);
-    set_to_dummy_if_null(ops, sysctl);
-    set_to_dummy_if_null(ops, readconsole);
-
-    set_to_dummy_if_null(ops, evtchn_unbound);
-    set_to_dummy_if_null(ops, evtchn_interdomain);
-    set_to_dummy_if_null(ops, evtchn_close_post);
-    set_to_dummy_if_null(ops, evtchn_send);
-    set_to_dummy_if_null(ops, evtchn_status);
-    set_to_dummy_if_null(ops, evtchn_reset);
-
-    set_to_dummy_if_null(ops, grant_mapref);
-    set_to_dummy_if_null(ops, grant_unmapref);
-    set_to_dummy_if_null(ops, grant_setup);
-    set_to_dummy_if_null(ops, grant_transfer);
-    set_to_dummy_if_null(ops, grant_copy);
-    set_to_dummy_if_null(ops, grant_query_size);
-
-    set_to_dummy_if_null(ops, alloc_security_domain);
-    set_to_dummy_if_null(ops, free_security_domain);
-    set_to_dummy_if_null(ops, alloc_security_evtchns);
-    set_to_dummy_if_null(ops, free_security_evtchns);
-    set_to_dummy_if_null(ops, show_security_evtchn);
-    set_to_dummy_if_null(ops, init_hardware_domain);
-
-    set_to_dummy_if_null(ops, get_pod_target);
-    set_to_dummy_if_null(ops, set_pod_target);
-
-    set_to_dummy_if_null(ops, memory_exchange);
-    set_to_dummy_if_null(ops, memory_adjust_reservation);
-    set_to_dummy_if_null(ops, memory_stat_reservation);
-    set_to_dummy_if_null(ops, memory_pin_page);
-    set_to_dummy_if_null(ops, claim_pages);
-
-    set_to_dummy_if_null(ops, console_io);
-
-    set_to_dummy_if_null(ops, profile);
-
-    set_to_dummy_if_null(ops, kexec);
-    set_to_dummy_if_null(ops, schedop_shutdown);
-
-    set_to_dummy_if_null(ops, show_irq_sid);
-    set_to_dummy_if_null(ops, map_domain_pirq);
-    set_to_dummy_if_null(ops, map_domain_irq);
-    set_to_dummy_if_null(ops, unmap_domain_pirq);
-    set_to_dummy_if_null(ops, unmap_domain_irq);
-    set_to_dummy_if_null(ops, bind_pt_irq);
-    set_to_dummy_if_null(ops, unbind_pt_irq);
-    set_to_dummy_if_null(ops, irq_permission);
-    set_to_dummy_if_null(ops, iomem_permission);
-    set_to_dummy_if_null(ops, iomem_mapping);
-    set_to_dummy_if_null(ops, pci_config_permission);
-    set_to_dummy_if_null(ops, get_vnumainfo);
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-    set_to_dummy_if_null(ops, get_device_group);
-    set_to_dummy_if_null(ops, assign_device);
-    set_to_dummy_if_null(ops, deassign_device);
-#endif
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-    set_to_dummy_if_null(ops, assign_dtdevice);
-    set_to_dummy_if_null(ops, deassign_dtdevice);
-#endif
-
-    set_to_dummy_if_null(ops, resource_plug_core);
-    set_to_dummy_if_null(ops, resource_unplug_core);
-    set_to_dummy_if_null(ops, resource_plug_pci);
-    set_to_dummy_if_null(ops, resource_unplug_pci);
-    set_to_dummy_if_null(ops, resource_setup_pci);
-    set_to_dummy_if_null(ops, resource_setup_gsi);
-    set_to_dummy_if_null(ops, resource_setup_misc);
-
-    set_to_dummy_if_null(ops, page_offline);
-    set_to_dummy_if_null(ops, hypfs_op);
-    set_to_dummy_if_null(ops, hvm_param);
-    set_to_dummy_if_null(ops, hvm_control);
-    set_to_dummy_if_null(ops, hvm_param_altp2mhvm);
-    set_to_dummy_if_null(ops, hvm_altp2mhvm_op);
-
-    set_to_dummy_if_null(ops, do_xsm_op);
-#ifdef CONFIG_COMPAT
-    set_to_dummy_if_null(ops, do_compat_op);
-#endif
-
-    set_to_dummy_if_null(ops, add_to_physmap);
-    set_to_dummy_if_null(ops, remove_from_physmap);
-    set_to_dummy_if_null(ops, map_gmfn_foreign);
-
-    set_to_dummy_if_null(ops, vm_event_control);
-
-#ifdef CONFIG_MEM_ACCESS
-    set_to_dummy_if_null(ops, mem_access);
-#endif
-
-#ifdef CONFIG_HAS_MEM_PAGING
-    set_to_dummy_if_null(ops, mem_paging);
-#endif
-
-#ifdef CONFIG_MEM_SHARING
-    set_to_dummy_if_null(ops, mem_sharing);
-#endif
-
-    set_to_dummy_if_null(ops, platform_op);
-#ifdef CONFIG_X86
-    set_to_dummy_if_null(ops, do_mca);
-    set_to_dummy_if_null(ops, shadow_control);
-    set_to_dummy_if_null(ops, mem_sharing_op);
-    set_to_dummy_if_null(ops, apic);
-    set_to_dummy_if_null(ops, machine_memory_map);
-    set_to_dummy_if_null(ops, domain_memory_map);
-    set_to_dummy_if_null(ops, mmu_update);
-    set_to_dummy_if_null(ops, mmuext_op);
-    set_to_dummy_if_null(ops, update_va_mapping);
-    set_to_dummy_if_null(ops, priv_mapping);
-    set_to_dummy_if_null(ops, ioport_permission);
-    set_to_dummy_if_null(ops, ioport_mapping);
-    set_to_dummy_if_null(ops, pmu_op);
-#endif
-    set_to_dummy_if_null(ops, dm_op);
-    set_to_dummy_if_null(ops, xen_version);
-    set_to_dummy_if_null(ops, domain_resource_map);
-#ifdef CONFIG_ARGO
-    set_to_dummy_if_null(ops, argo_enable);
-    set_to_dummy_if_null(ops, argo_register_single_source);
-    set_to_dummy_if_null(ops, argo_register_any_source);
-    set_to_dummy_if_null(ops, argo_send);
-#endif
-}
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 6bd8ad8751..89c16511b8 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -26,14 +26,12 @@
 #include <asm/setup.h>
 #endif
 
-#define XSM_FRAMEWORK_VERSION    "1.0.0"
+#define XSM_FRAMEWORK_VERSION    "2.0.0"
 
 struct xsm_operations *xsm_ops;
 
-#ifdef CONFIG_XSM
-
 enum xsm_bootparam {
-    XSM_BOOTPARAM_DUMMY,
+    XSM_BOOTPARAM_ROLE,
     XSM_BOOTPARAM_FLASK,
     XSM_BOOTPARAM_SILO,
 };
@@ -44,15 +42,15 @@ static enum xsm_bootparam __initdata xsm_bootparam =
 #elif CONFIG_XSM_SILO_DEFAULT
     XSM_BOOTPARAM_SILO;
 #else
-    XSM_BOOTPARAM_DUMMY;
+    XSM_BOOTPARAM_ROLE;
 #endif
 
 static int __init parse_xsm_param(const char *s)
 {
     int rc = 0;
 
-    if ( !strcmp(s, "dummy") )
-        xsm_bootparam = XSM_BOOTPARAM_DUMMY;
+    if ( !strcmp(s, "role") )
+        xsm_bootparam = XSM_BOOTPARAM_ROLE;
 #ifdef CONFIG_XSM_FLASK
     else if ( !strcmp(s, "flask") )
         xsm_bootparam = XSM_BOOTPARAM_FLASK;
@@ -68,15 +66,6 @@ static int __init parse_xsm_param(const char *s)
 }
 custom_param("xsm", parse_xsm_param);
 
-static inline int verify(struct xsm_operations *ops)
-{
-    /* verify the security_operations structure exists */
-    if ( !ops )
-        return -EINVAL;
-    xsm_fixup_ops(ops);
-    return 0;
-}
-
 static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
 {
 #ifdef CONFIG_XSM_FLASK_POLICY
@@ -87,17 +76,9 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
     }
 #endif
 
-    if ( verify(&dummy_xsm_ops) )
-    {
-        printk(XENLOG_ERR "Could not verify dummy_xsm_ops structure\n");
-        return -EIO;
-    }
-
-    xsm_ops = &dummy_xsm_ops;
-
     switch ( xsm_bootparam )
     {
-    case XSM_BOOTPARAM_DUMMY:
+    case XSM_BOOTPARAM_ROLE:
         break;
 
     case XSM_BOOTPARAM_FLASK:
@@ -116,6 +97,7 @@ static int __init xsm_core_init(const void *policy_buffer, size_t policy_size)
     return 0;
 }
 
+
 #ifdef CONFIG_MULTIBOOT
 int __init xsm_multiboot_init(unsigned long *module_map,
                               const multiboot_info_t *mbi)
@@ -126,6 +108,7 @@ int __init xsm_multiboot_init(unsigned long *module_map,
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
 
+#ifdef CONFIG_XSM_POLICY
     if ( XSM_MAGIC )
     {
         ret = xsm_multiboot_policy_init(module_map, mbi,
@@ -137,6 +120,7 @@ int __init xsm_multiboot_init(unsigned long *module_map,
             return -EINVAL;
         }
     }
+#endif
 
     ret = xsm_core_init(policy_buffer, policy_size);
     bootstrap_map(NULL);
@@ -154,6 +138,7 @@ int __init xsm_dt_init(void)
 
     printk("XSM Framework v" XSM_FRAMEWORK_VERSION " initialized\n");
 
+#ifdef CONFIG_XSM_POLICY
     if ( XSM_MAGIC )
     {
         ret = xsm_dt_policy_init(&policy_buffer, &policy_size);
@@ -163,6 +148,7 @@ int __init xsm_dt_init(void)
             return -EINVAL;
         }
     }
+#endif
 
     ret = xsm_core_init(policy_buffer, policy_size);
 
@@ -197,13 +183,7 @@ bool __init has_xsm_magic(paddr_t start)
 
 int __init register_xsm(struct xsm_operations *ops)
 {
-    if ( verify(ops) )
-    {
-        printk(XENLOG_ERR "Could not verify xsm_operations structure\n");
-        return -EINVAL;
-    }
-
-    if ( xsm_ops != &dummy_xsm_ops )
+    if ( xsm_ops != NULL )
         return -EAGAIN;
 
     xsm_ops = ops;
@@ -211,8 +191,6 @@ int __init register_xsm(struct xsm_operations *ops)
     return 0;
 }
 
-#endif
-
 long do_xsm_op (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op)
 {
     return xsm_do_xsm_op(op);
-- 
2.20.1


