Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9414001BC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 17:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178157.324074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAnU-0000vv-Gk; Fri, 03 Sep 2021 15:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178157.324074; Fri, 03 Sep 2021 15:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMAnU-0000sK-Br; Fri, 03 Sep 2021 15:08:04 +0000
Received: by outflank-mailman (input) for mailman id 178157;
 Fri, 03 Sep 2021 15:08:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yFRs=NZ=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mMAnT-0000pX-0h
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 15:08:03 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2297f24f-9416-4fb5-bc0e-68d572178f48;
 Fri, 03 Sep 2021 15:08:00 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1630681605135159.2520943143012;
 Fri, 3 Sep 2021 08:06:45 -0700 (PDT)
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
X-Inumbo-ID: 2297f24f-9416-4fb5-bc0e-68d572178f48
ARC-Seal: i=1; a=rsa-sha256; t=1630681608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IQmOrMmsWZWhcfJ9fvxJAdohJmDd40GONJ3M5td8t5OdqcLTbICTt1ALGf6ldTJTBkJNV5gCoN1c6+B+yoEhbVrF+yfEPuRkqbOxWHt6gjeP0Wc7J+mLTG1vY07W658gFV7ttiJQnew4HRc1FQ6pXjLl3TZfkm6DULmW8fM4HUU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1630681608; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Ck3QWAp7r648NxHUI1GTuSv4TTuwb5biDai25m+bty4=; 
	b=nsi9j5FJcmTMPj2cVVQ6HdXTH5z/865Ykr7IGoh7FUtKc6joz+Gm1pr6uNppNQ6B9IIXtvSX92Sky1CJn1JqWWRhHh/UtqMPdo82CUPN51YIiZRjhcIUxcXMoujDx8UEDZxvVV+Y8F/AHNNQJ08onneexhbu8bSlUKJx1gMFHR8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1630681608;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ck3QWAp7r648NxHUI1GTuSv4TTuwb5biDai25m+bty4=;
	b=N04u9Idu71mnjJY/MdL8vU0GRbyPX8+G/XWTguSk7mi73yh9b/lLKlhtPKSdokb1
	99gfY7JBgQuxmoz/Rv5Xty7HEkl4B0m0S8Tis5mupM/sPR+4JTxVKkXmmoyb9O9JLZ6
	QGfADe5hHvXA4B5FiguhKklw4/ZXV1iVKBQmSCbo=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: [PATCH v4 07/11] xsm: decouple xsm header inclusion selection
Date: Fri,  3 Sep 2021 15:06:25 -0400
Message-Id: <20210903190629.11917-8-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903190629.11917-1-dpsmith@apertussolutions.com>
References: <20210903190629.11917-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Multiple preprocessor defines were used as a mechanism to selective include
parts of the xsm.h header file. This makes it difficult to know which portion
is being included at any one time. This commit works to simplify this by
separating the core structures and functions of XSM into xsm-core.h away from
the wrapper functions which remain in xsm.h and dummy.h.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/dummy.h    |   2 +-
 xen/include/xsm/xsm-core.h | 274 +++++++++++++++++++++++++++++++++++++
 xen/include/xsm/xsm.h      | 255 +---------------------------------
 xen/xsm/dummy.c            |   1 -
 xen/xsm/silo.c             |   1 -
 xen/xsm/xsm_core.c         |   5 +
 6 files changed, 281 insertions(+), 257 deletions(-)
 create mode 100644 xen/include/xsm/xsm-core.h

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index deaf23035e..78d0b7d07a 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -16,7 +16,7 @@
  */
 
 #include <xen/sched.h>
-#include <xsm/xsm.h>
+#include <xsm/xsm-core.h>
 #include <public/hvm/params.h>
 
 /* Cannot use BUILD_BUG_ON here because the expressions we check are not
diff --git a/xen/include/xsm/xsm-core.h b/xen/include/xsm/xsm-core.h
new file mode 100644
index 0000000000..4555e111dc
--- /dev/null
+++ b/xen/include/xsm/xsm-core.h
@@ -0,0 +1,274 @@
+/*
+ *  This file contains the XSM hook definitions for Xen.
+ *
+ *  This work is based on the LSM implementation in Linux 2.6.13.4.
+ *
+ *  Author:  George Coker, <gscoker@alpha.ncsc.mil>
+ *
+ *  Contributors: Michael LeMay, <mdlemay@epoch.ncsc.mil>
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License version 2,
+ *  as published by the Free Software Foundation.
+ */
+
+#ifndef __XSM_CORE_H__
+#define __XSM_CORE_H__
+
+#include <xen/sched.h>
+#include <xen/multiboot.h>
+
+/* policy magic number (defined by XSM_MAGIC) */
+typedef uint32_t xsm_magic_t;
+
+#ifdef CONFIG_XSM_FLASK
+#define XSM_MAGIC 0xf97cff8c
+#else
+#define XSM_MAGIC 0x0
+#endif
+
+/* These annotations are used by callers and in dummy.h to document the
+ * default actions of XSM hooks. They should be compiled out otherwise.
+ */
+enum xsm_default {
+    /* Guests can normally access the hypercall */
+    XSM_HOOK,
+    /* Device model can perform on its target domain */
+    XSM_DM_PRIV,
+    /* Can perform on self or your target domain */
+    XSM_TARGET,
+    /* Privileged - normally restricted to dom0 */
+    XSM_PRIV,
+    /* Xenstore domain - can do some privileged operations */
+    XSM_XS_PRIV,
+    /* Something more complex */
+    XSM_OTHER
+};
+typedef enum xsm_default xsm_default_t;
+
+struct xsm_ops {
+    void (*security_domaininfo)(struct domain *d,
+                                struct xen_domctl_getdomaininfo *info);
+    int (*domain_create)(struct domain *d, uint32_t ssidref);
+    int (*getdomaininfo)(struct domain *d);
+    int (*domctl_scheduler_op)(struct domain *d, int op);
+    int (*sysctl_scheduler_op)(int op);
+    int (*set_target)(struct domain *d, struct domain *e);
+    int (*domctl)(struct domain *d, int cmd);
+    int (*sysctl)(int cmd);
+    int (*readconsole)(uint32_t clear);
+
+    int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t id2);
+    int (*evtchn_interdomain)(struct domain *d1, struct evtchn *chn1,
+                              struct domain *d2, struct evtchn *chn2);
+    void (*evtchn_close_post)(struct evtchn *chn);
+    int (*evtchn_send)(struct domain *d, struct evtchn *chn);
+    int (*evtchn_status)(struct domain *d, struct evtchn *chn);
+    int (*evtchn_reset)(struct domain *d1, struct domain *d2);
+
+    int (*grant_mapref)(struct domain *d1, struct domain *d2, uint32_t flags);
+    int (*grant_unmapref)(struct domain *d1, struct domain *d2);
+    int (*grant_setup)(struct domain *d1, struct domain *d2);
+    int (*grant_transfer)(struct domain *d1, struct domain *d2);
+    int (*grant_copy)(struct domain *d1, struct domain *d2);
+    int (*grant_query_size)(struct domain *d1, struct domain *d2);
+
+    int (*alloc_security_domain)(struct domain *d);
+    void (*free_security_domain)(struct domain *d);
+    int (*alloc_security_evtchns)(struct evtchn chn[], unsigned int nr);
+    void (*free_security_evtchns)(struct evtchn chn[], unsigned int nr);
+    char *(*show_security_evtchn)(struct domain *d, const struct evtchn *chn);
+    int (*init_hardware_domain)(struct domain *d);
+
+    int (*get_pod_target)(struct domain *d);
+    int (*set_pod_target)(struct domain *d);
+    int (*memory_exchange)(struct domain *d);
+    int (*memory_adjust_reservation)(struct domain *d1, struct domain *d2);
+    int (*memory_stat_reservation)(struct domain *d1, struct domain *d2);
+    int (*memory_pin_page)(struct domain *d1, struct domain *d2,
+                           struct page_info *page);
+    int (*add_to_physmap)(struct domain *d1, struct domain *d2);
+    int (*remove_from_physmap)(struct domain *d1, struct domain *d2);
+    int (*map_gmfn_foreign)(struct domain *d, struct domain *t);
+    int (*claim_pages)(struct domain *d);
+
+    int (*console_io)(struct domain *d, int cmd);
+
+    int (*profile)(struct domain *d, int op);
+
+    int (*kexec)(void);
+    int (*schedop_shutdown)(struct domain *d1, struct domain *d2);
+
+    char *(*show_irq_sid)(int irq);
+    int (*map_domain_pirq)(struct domain *d);
+    int (*map_domain_irq)(struct domain *d, int irq, const void *data);
+    int (*unmap_domain_pirq)(struct domain *d);
+    int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
+    int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
+    int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
+    int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
+    int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
+                            uint8_t allow);
+    int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
+                         uint8_t allow);
+    int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
+                                 uint16_t start, uint16_t end, uint8_t access);
+
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+    int (*get_device_group)(uint32_t machine_bdf);
+    int (*assign_device)(struct domain *d, uint32_t machine_bdf);
+    int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
+#endif
+
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+    int (*assign_dtdevice)(struct domain *d, const char *dtpath);
+    int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
+#endif
+
+    int (*resource_plug_core)(void);
+    int (*resource_unplug_core)(void);
+    int (*resource_plug_pci)(uint32_t machine_bdf);
+    int (*resource_unplug_pci)(uint32_t machine_bdf);
+    int (*resource_setup_pci)(uint32_t machine_bdf);
+    int (*resource_setup_gsi)(int gsi);
+    int (*resource_setup_misc)(void);
+
+    int (*page_offline)(uint32_t cmd);
+    int (*hypfs_op)(void);
+
+    long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
+#ifdef CONFIG_COMPAT
+    int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
+#endif
+
+    int (*hvm_param)(struct domain *d, unsigned long op);
+    int (*hvm_control)(struct domain *d, unsigned long op);
+    int (*hvm_param_altp2mhvm)(struct domain *d);
+    int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
+    int (*get_vnumainfo)(struct domain *d);
+
+    int (*vm_event_control)(struct domain *d, int mode, int op);
+
+#ifdef CONFIG_MEM_ACCESS
+    int (*mem_access)(struct domain *d);
+#endif
+
+#ifdef CONFIG_MEM_PAGING
+    int (*mem_paging)(struct domain *d);
+#endif
+
+#ifdef CONFIG_MEM_SHARING
+    int (*mem_sharing)(struct domain *d);
+#endif
+
+    int (*platform_op)(uint32_t cmd);
+
+#ifdef CONFIG_X86
+    int (*do_mca)(void);
+    int (*shadow_control)(struct domain *d, uint32_t op);
+    int (*mem_sharing_op)(struct domain *d, struct domain *cd, int op);
+    int (*apic)(struct domain *d, int cmd);
+    int (*memtype)(uint32_t access);
+    int (*machine_memory_map)(void);
+    int (*domain_memory_map)(struct domain *d);
+#define XSM_MMU_UPDATE_READ      1
+#define XSM_MMU_UPDATE_WRITE     2
+#define XSM_MMU_NORMAL_UPDATE    4
+#define XSM_MMU_MACHPHYS_UPDATE  8
+    int (*mmu_update)(struct domain *d, struct domain *t,
+                      struct domain *f, uint32_t flags);
+    int (*mmuext_op)(struct domain *d, struct domain *f);
+    int (*update_va_mapping)(struct domain *d, struct domain *f,
+                             l1_pgentry_t pte);
+    int (*priv_mapping)(struct domain *d, struct domain *t);
+    int (*ioport_permission)(struct domain *d, uint32_t s, uint32_t e,
+                             uint8_t allow);
+    int (*ioport_mapping)(struct domain *d, uint32_t s, uint32_t e,
+                          uint8_t allow);
+    int (*pmu_op)(struct domain *d, unsigned int op);
+#endif
+
+    int (*dm_op)(struct domain *d);
+
+    int (*xen_version)(uint32_t cmd);
+
+    int (*domain_resource_map)(struct domain *d);
+
+#ifdef CONFIG_ARGO
+    int (*argo_enable)(const struct domain *d);
+    int (*argo_register_single_source)(const struct domain *d,
+                                       const struct domain *t);
+    int (*argo_register_any_source)(const struct domain *d);
+    int (*argo_send)(const struct domain *d, const struct domain *t);
+#endif
+};
+
+void xsm_fixup_ops(struct xsm_ops *ops);
+
+#ifdef CONFIG_XSM
+
+#ifdef CONFIG_MULTIBOOT
+int xsm_multiboot_init(unsigned long *module_map,
+                       const multiboot_info_t *mbi);
+int xsm_multiboot_policy_init(unsigned long *module_map,
+                              const multiboot_info_t *mbi,
+                              void **policy_buffer,
+                              size_t *policy_size);
+#endif
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+/*
+ * Initialize XSM
+ *
+ * On success, return 1 if using SILO mode else 0.
+ */
+int xsm_dt_init(void);
+int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
+bool has_xsm_magic(paddr_t);
+#endif
+
+#ifdef CONFIG_XSM_FLASK
+const struct xsm_ops *flask_init(const void *policy_buffer,
+                                 size_t policy_size);
+#else
+static inline const struct xsm_ops *flask_init(const void *policy_buffer,
+                                               size_t policy_size)
+{
+    return NULL;
+}
+#endif
+
+#ifdef CONFIG_XSM_SILO
+const struct xsm_ops *silo_init(void);
+#else
+static const inline struct xsm_ops *silo_init(void)
+{
+    return NULL;
+}
+#endif
+
+#else /* CONFIG_XSM */
+
+#ifdef CONFIG_MULTIBOOT
+static inline int xsm_multiboot_init(unsigned long *module_map,
+                                     const multiboot_info_t *mbi)
+{
+    return 0;
+}
+#endif
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+static inline int xsm_dt_init(void)
+{
+    return 0;
+}
+
+static inline bool has_xsm_magic(paddr_t start)
+{
+    return false;
+}
+#endif /* CONFIG_HAS_DEVICE_TREE */
+
+#endif /* CONFIG_XSM */
+
+#endif /* __XSM_CORE_H */
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index d7ef412874..1517443173 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -18,194 +18,12 @@
 #include <xen/alternative-call.h>
 #include <xen/sched.h>
 #include <xen/multiboot.h>
-
-/* policy magic number (defined by XSM_MAGIC) */
-typedef uint32_t xsm_magic_t;
-
-#ifdef CONFIG_XSM_FLASK
-#define XSM_MAGIC 0xf97cff8c
-#else
-#define XSM_MAGIC 0x0
-#endif
-
-/* These annotations are used by callers and in dummy.h to document the
- * default actions of XSM hooks. They should be compiled out otherwise.
- */
-enum xsm_default {
-    /* Guests can normally access the hypercall */
-    XSM_HOOK,
-    /* Device model can perform on its target domain */
-    XSM_DM_PRIV,
-    /* Can perform on self or your target domain */
-    XSM_TARGET,
-    /* Privileged - normally restricted to dom0 */
-    XSM_PRIV,
-    /* Xenstore domain - can do some privileged operations */
-    XSM_XS_PRIV,
-    /* Something more complex */
-    XSM_OTHER
-};
-typedef enum xsm_default xsm_default_t;
-
-struct xsm_ops {
-    void (*security_domaininfo)(struct domain *d,
-                                struct xen_domctl_getdomaininfo *info);
-    int (*domain_create)(struct domain *d, uint32_t ssidref);
-    int (*getdomaininfo)(struct domain *d);
-    int (*domctl_scheduler_op)(struct domain *d, int op);
-    int (*sysctl_scheduler_op)(int op);
-    int (*set_target)(struct domain *d, struct domain *e);
-    int (*domctl)(struct domain *d, int cmd);
-    int (*sysctl)(int cmd);
-    int (*readconsole)(uint32_t clear);
-
-    int (*evtchn_unbound)(struct domain *d, struct evtchn *chn, domid_t id2);
-    int (*evtchn_interdomain)(struct domain *d1, struct evtchn *chn1,
-                              struct domain *d2, struct evtchn *chn2);
-    void (*evtchn_close_post)(struct evtchn *chn);
-    int (*evtchn_send)(struct domain *d, struct evtchn *chn);
-    int (*evtchn_status)(struct domain *d, struct evtchn *chn);
-    int (*evtchn_reset)(struct domain *d1, struct domain *d2);
-
-    int (*grant_mapref)(struct domain *d1, struct domain *d2, uint32_t flags);
-    int (*grant_unmapref)(struct domain *d1, struct domain *d2);
-    int (*grant_setup)(struct domain *d1, struct domain *d2);
-    int (*grant_transfer)(struct domain *d1, struct domain *d2);
-    int (*grant_copy)(struct domain *d1, struct domain *d2);
-    int (*grant_query_size)(struct domain *d1, struct domain *d2);
-
-    int (*alloc_security_domain)(struct domain *d);
-    void (*free_security_domain)(struct domain *d);
-    int (*alloc_security_evtchns)(struct evtchn chn[], unsigned int nr);
-    void (*free_security_evtchns)(struct evtchn chn[], unsigned int nr);
-    char *(*show_security_evtchn)(struct domain *d, const struct evtchn *chn);
-    int (*init_hardware_domain)(struct domain *d);
-
-    int (*get_pod_target)(struct domain *d);
-    int (*set_pod_target)(struct domain *d);
-    int (*memory_exchange)(struct domain *d);
-    int (*memory_adjust_reservation)(struct domain *d1, struct domain *d2);
-    int (*memory_stat_reservation)(struct domain *d1, struct domain *d2);
-    int (*memory_pin_page)(struct domain *d1, struct domain *d2,
-                           struct page_info *page);
-    int (*add_to_physmap)(struct domain *d1, struct domain *d2);
-    int (*remove_from_physmap)(struct domain *d1, struct domain *d2);
-    int (*map_gmfn_foreign)(struct domain *d, struct domain *t);
-    int (*claim_pages)(struct domain *d);
-
-    int (*console_io)(struct domain *d, int cmd);
-
-    int (*profile)(struct domain *d, int op);
-
-    int (*kexec)(void);
-    int (*schedop_shutdown)(struct domain *d1, struct domain *d2);
-
-    char *(*show_irq_sid)(int irq);
-    int (*map_domain_pirq)(struct domain *d);
-    int (*map_domain_irq)(struct domain *d, int irq, const void *data);
-    int (*unmap_domain_pirq)(struct domain *d);
-    int (*unmap_domain_irq)(struct domain *d, int irq, const void *data);
-    int (*bind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-    int (*unbind_pt_irq)(struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-    int (*irq_permission)(struct domain *d, int pirq, uint8_t allow);
-    int (*iomem_permission)(struct domain *d, uint64_t s, uint64_t e,
-                            uint8_t allow);
-    int (*iomem_mapping)(struct domain *d, uint64_t s, uint64_t e,
-                         uint8_t allow);
-    int (*pci_config_permission)(struct domain *d, uint32_t machine_bdf,
-                                 uint16_t start, uint16_t end, uint8_t access);
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-    int (*get_device_group)(uint32_t machine_bdf);
-    int (*assign_device)(struct domain *d, uint32_t machine_bdf);
-    int (*deassign_device)(struct domain *d, uint32_t machine_bdf);
-#endif
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-    int (*assign_dtdevice)(struct domain *d, const char *dtpath);
-    int (*deassign_dtdevice)(struct domain *d, const char *dtpath);
-#endif
-
-    int (*resource_plug_core)(void);
-    int (*resource_unplug_core)(void);
-    int (*resource_plug_pci)(uint32_t machine_bdf);
-    int (*resource_unplug_pci)(uint32_t machine_bdf);
-    int (*resource_setup_pci)(uint32_t machine_bdf);
-    int (*resource_setup_gsi)(int gsi);
-    int (*resource_setup_misc)(void);
-
-    int (*page_offline)(uint32_t cmd);
-    int (*hypfs_op)(void);
-
-    long (*do_xsm_op)(XEN_GUEST_HANDLE_PARAM(void) op);
-#ifdef CONFIG_COMPAT
-    int (*do_compat_op)(XEN_GUEST_HANDLE_PARAM(void) op);
-#endif
-
-    int (*hvm_param)(struct domain *d, unsigned long op);
-    int (*hvm_control)(struct domain *d, unsigned long op);
-    int (*hvm_param_altp2mhvm)(struct domain *d);
-    int (*hvm_altp2mhvm_op)(struct domain *d, uint64_t mode, uint32_t op);
-    int (*get_vnumainfo)(struct domain *d);
-
-    int (*vm_event_control)(struct domain *d, int mode, int op);
-
-#ifdef CONFIG_MEM_ACCESS
-    int (*mem_access)(struct domain *d);
-#endif
-
-#ifdef CONFIG_MEM_PAGING
-    int (*mem_paging)(struct domain *d);
-#endif
-
-#ifdef CONFIG_MEM_SHARING
-    int (*mem_sharing)(struct domain *d);
-#endif
-
-    int (*platform_op)(uint32_t cmd);
-
-#ifdef CONFIG_X86
-    int (*do_mca)(void);
-    int (*shadow_control)(struct domain *d, uint32_t op);
-    int (*mem_sharing_op)(struct domain *d, struct domain *cd, int op);
-    int (*apic)(struct domain *d, int cmd);
-    int (*memtype)(uint32_t access);
-    int (*machine_memory_map)(void);
-    int (*domain_memory_map)(struct domain *d);
-#define XSM_MMU_UPDATE_READ      1
-#define XSM_MMU_UPDATE_WRITE     2
-#define XSM_MMU_NORMAL_UPDATE    4
-#define XSM_MMU_MACHPHYS_UPDATE  8
-    int (*mmu_update)(struct domain *d, struct domain *t,
-                      struct domain *f, uint32_t flags);
-    int (*mmuext_op)(struct domain *d, struct domain *f);
-    int (*update_va_mapping)(struct domain *d, struct domain *f,
-                             l1_pgentry_t pte);
-    int (*priv_mapping)(struct domain *d, struct domain *t);
-    int (*ioport_permission)(struct domain *d, uint32_t s, uint32_t e,
-                             uint8_t allow);
-    int (*ioport_mapping)(struct domain *d, uint32_t s, uint32_t e,
-                          uint8_t allow);
-    int (*pmu_op)(struct domain *d, unsigned int op);
-#endif
-    int (*dm_op)(struct domain *d);
-    int (*xen_version)(uint32_t cmd);
-    int (*domain_resource_map)(struct domain *d);
-#ifdef CONFIG_ARGO
-    int (*argo_enable)(const struct domain *d);
-    int (*argo_register_single_source)(const struct domain *d,
-                                       const struct domain *t);
-    int (*argo_register_any_source)(const struct domain *d);
-    int (*argo_send)(const struct domain *d, const struct domain *t);
-#endif
-};
+#include <xsm/xsm-core.h>
 
 #ifdef CONFIG_XSM
 
 extern struct xsm_ops xsm_ops;
 
-#ifndef XSM_NO_WRAPPERS
-
 static inline void xsm_security_domaininfo(struct domain *d,
     struct xen_domctl_getdomaininfo *info)
 {
@@ -780,81 +598,10 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #endif /* CONFIG_ARGO */
 
-#endif /* XSM_NO_WRAPPERS */
-
-#ifdef CONFIG_MULTIBOOT
-int xsm_multiboot_init(unsigned long *module_map,
-                              const multiboot_info_t *mbi);
-int xsm_multiboot_policy_init(unsigned long *module_map,
-                                     const multiboot_info_t *mbi,
-                                     void **policy_buffer,
-                                     size_t *policy_size);
-#endif
-
-#ifdef CONFIG_HAS_DEVICE_TREE
-/*
- * Initialize XSM
- *
- * On success, return 1 if using SILO mode else 0.
- */
-int xsm_dt_init(void);
-int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
-bool has_xsm_magic(paddr_t);
-#endif
-
-extern struct xsm_ops dummy_xsm_ops;
-
-void xsm_fixup_ops(struct xsm_ops *ops);
-
-#ifdef CONFIG_XSM_FLASK
-extern const struct xsm_ops *flask_init(const void *policy_buffer,
-                                        size_t policy_size);
-#else
-static const inline struct xsm_ops *flask_init(const void *policy_buffer,
-                                               size_t policy_size)
-{
-    return NULL;
-}
-#endif
-
-#ifdef CONFIG_XSM_FLASK_POLICY
-extern const unsigned char xsm_flask_init_policy[];
-extern const unsigned int xsm_flask_init_policy_size;
-#endif
-
-#ifdef CONFIG_XSM_SILO
-extern const struct xsm_ops *silo_init(void);
-#else
-static const inline struct xsm_ops *silo_init(void)
-{
-    return NULL;
-}
-#endif
-
 #else /* CONFIG_XSM */
 
 #include <xsm/dummy.h>
 
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
 #endif /* CONFIG_XSM */
 
 #endif /* __XSM_H */
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index d8c935328e..b848580eaa 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -10,7 +10,6 @@
  *  as published by the Free Software Foundation.
  */
 
-#define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
 #define set_to_dummy_if_null(ops, function)                            \
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index 3550dded7b..6db793f35c 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -17,7 +17,6 @@
  * You should have received a copy of the GNU General Public License along with
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
 /*
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 859af3fe9a..112d11fa6a 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -32,6 +32,11 @@
 
 struct xsm_ops __read_mostly xsm_ops;
 
+#ifdef CONFIG_XSM_FLASK_POLICY
+extern const unsigned char xsm_flask_init_policy[];
+extern const unsigned int xsm_flask_init_policy_size;
+#endif
+
 enum xsm_ops_state {
     XSM_OPS_UNREGISTERED,
     XSM_OPS_REG_FAILED,
-- 
2.20.1


