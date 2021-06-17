Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646B3ABF93
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 01:33:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144235.265545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1V9-00063i-Td; Thu, 17 Jun 2021 23:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144235.265545; Thu, 17 Jun 2021 23:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lu1V9-000612-PP; Thu, 17 Jun 2021 23:32:47 +0000
Received: by outflank-mailman (input) for mailman id 144235;
 Thu, 17 Jun 2021 23:32:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uRdX=LL=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1lu1V8-00060e-Eg
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 23:32:46 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15bb2d43-5a71-4c24-a6f1-e3023f6de940;
 Thu, 17 Jun 2021 23:32:44 +0000 (UTC)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1623972576629514.3458375101217;
 Thu, 17 Jun 2021 16:29:36 -0700 (PDT)
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
X-Inumbo-ID: 15bb2d43-5a71-4c24-a6f1-e3023f6de940
ARC-Seal: i=1; a=rsa-sha256; t=1623972579; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NQqgNX9OxrUfo0glFexSXGJn9emKXMOn+AKVzJNBy8L8GSkzOXd+R4ZsUULFyK1j/9dTVLZ6ckkbbG77mVC+qIy9Dm7kH9cYTZr5k/Y55VSTd/ekZMH0AMLVSq0UGAcd0PIwAr1hokJIOpm0O/ncjP/cb/TLRTb8dqhbI+Stp/g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1623972579; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=3mB5hO2757p/4LpDpnIePDctsNS8pYN/1zi4yPRAbnY=; 
	b=fujkNITP9QyuBVP4iL5sg7C+yQsMbdqMIdvfgeSTheI0EB9wx+MX+RLyy0+RaP0oU9w8jLM9+aHLH+EJ79uP4abkZ7RdM62S3F7yCdQiGgqoXJgMjV5XUEJGCK5orzn8fVruus11lQjtG0T8RteVksWv/1E1c/238nSb36mzbGA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1623972579;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3mB5hO2757p/4LpDpnIePDctsNS8pYN/1zi4yPRAbnY=;
	b=rG/FbrAIkzq7xRAxDNpl6Ro2ZW/1pbT3wvD0pM7I2mKuFGqVOcnUhqnhocn+ajlC
	xWBsHteAvQF1cGoOtrgwPcnjKrkq5bdvWuV7938DWguUgKzfe4ZtBIHNNrACudZ62nM
	TJZWxcK7XoCFGqFR1XK8wngLi4JYjyLg5XUP61YA=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	persaur@gmail.com,
	christopher.w.clark@gmail.com,
	adam.schwalm@starlab.io,
	scott.davis@starlab.io
Subject: [PATCH 2/6] xsm: decouple xsm header inclusion selection
Date: Thu, 17 Jun 2021 19:39:14 -0400
Message-Id: <20210617233918.10095-3-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617233918.10095-1-dpsmith@apertussolutions.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Multiple preprocessor defines were used as a mechanism to selective
include parts of the xsm.h header file. This makes it difficult to know
which portion is being included at anyone time. This commit works to
simplify this by separating the core structure and functions of XSM into
xsm-core.h away from the wrapper functions which remain in xsm.h and
dummy.h.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/include/xsm/dummy.h    |   2 +-
 xen/include/xsm/xsm-core.h | 262 +++++++++++++++++++++++++++++++++++++
 xen/include/xsm/xsm.h      | 240 +--------------------------------
 xen/xsm/dummy.c            |   1 -
 xen/xsm/silo.c             |   1 -
 5 files changed, 264 insertions(+), 242 deletions(-)
 create mode 100644 xen/include/xsm/xsm-core.h

diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 363c6d7798..c445c5681b 100644
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
index 0000000000..5297c73fe6
--- /dev/null
+++ b/xen/include/xsm/xsm-core.h
@@ -0,0 +1,262 @@
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
+typedef void xsm_op_t;
+DEFINE_XEN_GUEST_HANDLE(xsm_op_t);
+
+/* policy magic number (defined by XSM_MAGIC) */
+typedef u32 xsm_magic_t;
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
+    XSM_HOOK,     /* Guests can normally access the hypercall */
+    XSM_DM_PRIV,  /* Device model can perform on its target domain */
+    XSM_TARGET,   /* Can perform on self or your target domain */
+    XSM_PRIV,     /* Privileged - normally restricted to dom0 */
+    XSM_XS_PRIV,  /* Xenstore domain - can do some privileged operations */
+    XSM_OTHER     /* Something more complex */
+};
+typedef enum xsm_default xsm_default_t;
+
+struct xsm_operations {
+    void (*security_domaininfo) (struct domain *d,
+                                        struct xen_domctl_getdomaininfo *info);
+    int (*domain_create) (struct domain *d, u32 ssidref);
+    int (*getdomaininfo) (struct domain *d);
+    int (*domctl_scheduler_op) (struct domain *d, int op);
+    int (*sysctl_scheduler_op) (int op);
+    int (*set_target) (struct domain *d, struct domain *e);
+    int (*domctl) (struct domain *d, int cmd);
+    int (*sysctl) (int cmd);
+    int (*readconsole) (uint32_t clear);
+
+    int (*evtchn_unbound) (struct domain *d, struct evtchn *chn, domid_t id2);
+    int (*evtchn_interdomain) (struct domain *d1, struct evtchn *chn1,
+                                        struct domain *d2, struct evtchn *chn2);
+    void (*evtchn_close_post) (struct evtchn *chn);
+    int (*evtchn_send) (struct domain *d, struct evtchn *chn);
+    int (*evtchn_status) (struct domain *d, struct evtchn *chn);
+    int (*evtchn_reset) (struct domain *d1, struct domain *d2);
+
+    int (*grant_mapref) (struct domain *d1, struct domain *d2, uint32_t flags);
+    int (*grant_unmapref) (struct domain *d1, struct domain *d2);
+    int (*grant_setup) (struct domain *d1, struct domain *d2);
+    int (*grant_transfer) (struct domain *d1, struct domain *d2);
+    int (*grant_copy) (struct domain *d1, struct domain *d2);
+    int (*grant_query_size) (struct domain *d1, struct domain *d2);
+
+    int (*alloc_security_domain) (struct domain *d);
+    void (*free_security_domain) (struct domain *d);
+    int (*alloc_security_evtchns) (struct evtchn chn[], unsigned int nr);
+    void (*free_security_evtchns) (struct evtchn chn[], unsigned int nr);
+    char *(*show_security_evtchn) (struct domain *d, const struct evtchn *chn);
+    int (*init_hardware_domain) (struct domain *d);
+
+    int (*get_pod_target) (struct domain *d);
+    int (*set_pod_target) (struct domain *d);
+    int (*memory_exchange) (struct domain *d);
+    int (*memory_adjust_reservation) (struct domain *d1, struct domain *d2);
+    int (*memory_stat_reservation) (struct domain *d1, struct domain *d2);
+    int (*memory_pin_page) (struct domain *d1, struct domain *d2, struct page_info *page);
+    int (*add_to_physmap) (struct domain *d1, struct domain *d2);
+    int (*remove_from_physmap) (struct domain *d1, struct domain *d2);
+    int (*map_gmfn_foreign) (struct domain *d, struct domain *t);
+    int (*claim_pages) (struct domain *d);
+
+    int (*console_io) (struct domain *d, int cmd);
+
+    int (*profile) (struct domain *d, int op);
+
+    int (*kexec) (void);
+    int (*schedop_shutdown) (struct domain *d1, struct domain *d2);
+
+    char *(*show_irq_sid) (int irq);
+    int (*map_domain_pirq) (struct domain *d);
+    int (*map_domain_irq) (struct domain *d, int irq, const void *data);
+    int (*unmap_domain_pirq) (struct domain *d);
+    int (*unmap_domain_irq) (struct domain *d, int irq, const void *data);
+    int (*bind_pt_irq) (struct domain *d, struct xen_domctl_bind_pt_irq *bind);
+    int (*unbind_pt_irq) (struct domain *d, struct xen_domctl_bind_pt_irq *bind);
+    int (*irq_permission) (struct domain *d, int pirq, uint8_t allow);
+    int (*iomem_permission) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
+    int (*iomem_mapping) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
+    int (*pci_config_permission) (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access);
+
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
+    int (*get_device_group) (uint32_t machine_bdf);
+    int (*assign_device) (struct domain *d, uint32_t machine_bdf);
+    int (*deassign_device) (struct domain *d, uint32_t machine_bdf);
+#endif
+
+#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
+    int (*assign_dtdevice) (struct domain *d, const char *dtpath);
+    int (*deassign_dtdevice) (struct domain *d, const char *dtpath);
+#endif
+
+    int (*resource_plug_core) (void);
+    int (*resource_unplug_core) (void);
+    int (*resource_plug_pci) (uint32_t machine_bdf);
+    int (*resource_unplug_pci) (uint32_t machine_bdf);
+    int (*resource_setup_pci) (uint32_t machine_bdf);
+    int (*resource_setup_gsi) (int gsi);
+    int (*resource_setup_misc) (void);
+
+    int (*page_offline)(uint32_t cmd);
+    int (*hypfs_op)(void);
+
+    long (*do_xsm_op) (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op);
+#ifdef CONFIG_COMPAT
+    int (*do_compat_op) (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op);
+#endif
+
+    int (*hvm_param) (struct domain *d, unsigned long op);
+    int (*hvm_control) (struct domain *d, unsigned long op);
+    int (*hvm_param_altp2mhvm) (struct domain *d);
+    int (*hvm_altp2mhvm_op) (struct domain *d, uint64_t mode, uint32_t op);
+    int (*get_vnumainfo) (struct domain *d);
+
+    int (*vm_event_control) (struct domain *d, int mode, int op);
+
+#ifdef CONFIG_MEM_ACCESS
+    int (*mem_access) (struct domain *d);
+#endif
+
+#ifdef CONFIG_MEM_PAGING
+    int (*mem_paging) (struct domain *d);
+#endif
+
+#ifdef CONFIG_MEM_SHARING
+    int (*mem_sharing) (struct domain *d);
+#endif
+
+    int (*platform_op) (uint32_t cmd);
+
+#ifdef CONFIG_X86
+    int (*do_mca) (void);
+    int (*shadow_control) (struct domain *d, uint32_t op);
+    int (*mem_sharing_op) (struct domain *d, struct domain *cd, int op);
+    int (*apic) (struct domain *d, int cmd);
+    int (*memtype) (uint32_t access);
+    int (*machine_memory_map) (void);
+    int (*domain_memory_map) (struct domain *d);
+#define XSM_MMU_UPDATE_READ      1
+#define XSM_MMU_UPDATE_WRITE     2
+#define XSM_MMU_NORMAL_UPDATE    4
+#define XSM_MMU_MACHPHYS_UPDATE  8
+    int (*mmu_update) (struct domain *d, struct domain *t,
+                       struct domain *f, uint32_t flags);
+    int (*mmuext_op) (struct domain *d, struct domain *f);
+    int (*update_va_mapping) (struct domain *d, struct domain *f, l1_pgentry_t pte);
+    int (*priv_mapping) (struct domain *d, struct domain *t);
+    int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
+    int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
+    int (*pmu_op) (struct domain *d, unsigned int op);
+#endif
+    int (*dm_op) (struct domain *d);
+    int (*xen_version) (uint32_t cmd);
+    int (*domain_resource_map) (struct domain *d);
+#ifdef CONFIG_ARGO
+    int (*argo_enable) (const struct domain *d);
+    int (*argo_register_single_source) (const struct domain *d,
+                                        const struct domain *t);
+    int (*argo_register_any_source) (const struct domain *d);
+    int (*argo_send) (const struct domain *d, const struct domain *t);
+#endif
+};
+
+#ifdef CONFIG_XSM
+
+#ifdef CONFIG_MULTIBOOT
+extern int xsm_multiboot_init(unsigned long *module_map,
+                              const multiboot_info_t *mbi);
+extern int xsm_multiboot_policy_init(unsigned long *module_map,
+                                     const multiboot_info_t *mbi,
+                                     void **policy_buffer,
+                                     size_t *policy_size);
+#endif
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+/*
+ * Initialize XSM
+ *
+ * On success, return 1 if using SILO mode else 0.
+ */
+extern int xsm_dt_init(void);
+extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
+extern bool has_xsm_magic(paddr_t);
+#endif
+
+extern int register_xsm(struct xsm_operations *ops);
+
+extern struct xsm_operations dummy_xsm_ops;
+extern void xsm_fixup_ops(struct xsm_operations *ops);
+
+#ifdef CONFIG_XSM_FLASK
+extern void flask_init(const void *policy_buffer, size_t policy_size);
+#else
+static inline void flask_init(const void *policy_buffer, size_t policy_size)
+{
+}
+#endif
+
+#ifdef CONFIG_XSM_FLASK_POLICY
+extern const unsigned char xsm_flask_init_policy[];
+extern const unsigned int xsm_flask_init_policy_size;
+#endif
+
+#ifdef CONFIG_XSM_SILO
+extern void silo_init(void);
+#else
+static inline void silo_init(void) {}
+#endif
+
+#else /* CONFIG_XSM */
+
+#ifdef CONFIG_MULTIBOOT
+static inline int xsm_multiboot_init (unsigned long *module_map,
+                                      const multiboot_info_t *mbi)
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
index 86ca045e74..ecbdee2c7d 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -20,184 +20,12 @@
 #endif
 #include <xen/sched.h>
 #include <xen/multiboot.h>
-
-typedef void xsm_op_t;
-DEFINE_XEN_GUEST_HANDLE(xsm_op_t);
-
-/* policy magic number (defined by XSM_MAGIC) */
-typedef u32 xsm_magic_t;
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
-    XSM_HOOK,     /* Guests can normally access the hypercall */
-    XSM_DM_PRIV,  /* Device model can perform on its target domain */
-    XSM_TARGET,   /* Can perform on self or your target domain */
-    XSM_PRIV,     /* Privileged - normally restricted to dom0 */
-    XSM_XS_PRIV,  /* Xenstore domain - can do some privileged operations */
-    XSM_OTHER     /* Something more complex */
-};
-typedef enum xsm_default xsm_default_t;
-
-struct xsm_operations {
-    void (*security_domaininfo) (struct domain *d,
-                                        struct xen_domctl_getdomaininfo *info);
-    int (*domain_create) (struct domain *d, u32 ssidref);
-    int (*getdomaininfo) (struct domain *d);
-    int (*domctl_scheduler_op) (struct domain *d, int op);
-    int (*sysctl_scheduler_op) (int op);
-    int (*set_target) (struct domain *d, struct domain *e);
-    int (*domctl) (struct domain *d, int cmd);
-    int (*sysctl) (int cmd);
-    int (*readconsole) (uint32_t clear);
-
-    int (*evtchn_unbound) (struct domain *d, struct evtchn *chn, domid_t id2);
-    int (*evtchn_interdomain) (struct domain *d1, struct evtchn *chn1,
-                                        struct domain *d2, struct evtchn *chn2);
-    void (*evtchn_close_post) (struct evtchn *chn);
-    int (*evtchn_send) (struct domain *d, struct evtchn *chn);
-    int (*evtchn_status) (struct domain *d, struct evtchn *chn);
-    int (*evtchn_reset) (struct domain *d1, struct domain *d2);
-
-    int (*grant_mapref) (struct domain *d1, struct domain *d2, uint32_t flags);
-    int (*grant_unmapref) (struct domain *d1, struct domain *d2);
-    int (*grant_setup) (struct domain *d1, struct domain *d2);
-    int (*grant_transfer) (struct domain *d1, struct domain *d2);
-    int (*grant_copy) (struct domain *d1, struct domain *d2);
-    int (*grant_query_size) (struct domain *d1, struct domain *d2);
-
-    int (*alloc_security_domain) (struct domain *d);
-    void (*free_security_domain) (struct domain *d);
-    int (*alloc_security_evtchns) (struct evtchn chn[], unsigned int nr);
-    void (*free_security_evtchns) (struct evtchn chn[], unsigned int nr);
-    char *(*show_security_evtchn) (struct domain *d, const struct evtchn *chn);
-    int (*init_hardware_domain) (struct domain *d);
-
-    int (*get_pod_target) (struct domain *d);
-    int (*set_pod_target) (struct domain *d);
-    int (*memory_exchange) (struct domain *d);
-    int (*memory_adjust_reservation) (struct domain *d1, struct domain *d2);
-    int (*memory_stat_reservation) (struct domain *d1, struct domain *d2);
-    int (*memory_pin_page) (struct domain *d1, struct domain *d2, struct page_info *page);
-    int (*add_to_physmap) (struct domain *d1, struct domain *d2);
-    int (*remove_from_physmap) (struct domain *d1, struct domain *d2);
-    int (*map_gmfn_foreign) (struct domain *d, struct domain *t);
-    int (*claim_pages) (struct domain *d);
-
-    int (*console_io) (struct domain *d, int cmd);
-
-    int (*profile) (struct domain *d, int op);
-
-    int (*kexec) (void);
-    int (*schedop_shutdown) (struct domain *d1, struct domain *d2);
-
-    char *(*show_irq_sid) (int irq);
-    int (*map_domain_pirq) (struct domain *d);
-    int (*map_domain_irq) (struct domain *d, int irq, const void *data);
-    int (*unmap_domain_pirq) (struct domain *d);
-    int (*unmap_domain_irq) (struct domain *d, int irq, const void *data);
-    int (*bind_pt_irq) (struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-    int (*unbind_pt_irq) (struct domain *d, struct xen_domctl_bind_pt_irq *bind);
-    int (*irq_permission) (struct domain *d, int pirq, uint8_t allow);
-    int (*iomem_permission) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
-    int (*iomem_mapping) (struct domain *d, uint64_t s, uint64_t e, uint8_t allow);
-    int (*pci_config_permission) (struct domain *d, uint32_t machine_bdf, uint16_t start, uint16_t end, uint8_t access);
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_PCI)
-    int (*get_device_group) (uint32_t machine_bdf);
-    int (*assign_device) (struct domain *d, uint32_t machine_bdf);
-    int (*deassign_device) (struct domain *d, uint32_t machine_bdf);
-#endif
-
-#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
-    int (*assign_dtdevice) (struct domain *d, const char *dtpath);
-    int (*deassign_dtdevice) (struct domain *d, const char *dtpath);
-#endif
-
-    int (*resource_plug_core) (void);
-    int (*resource_unplug_core) (void);
-    int (*resource_plug_pci) (uint32_t machine_bdf);
-    int (*resource_unplug_pci) (uint32_t machine_bdf);
-    int (*resource_setup_pci) (uint32_t machine_bdf);
-    int (*resource_setup_gsi) (int gsi);
-    int (*resource_setup_misc) (void);
-
-    int (*page_offline)(uint32_t cmd);
-    int (*hypfs_op)(void);
-
-    long (*do_xsm_op) (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op);
-#ifdef CONFIG_COMPAT
-    int (*do_compat_op) (XEN_GUEST_HANDLE_PARAM(xsm_op_t) op);
-#endif
-
-    int (*hvm_param) (struct domain *d, unsigned long op);
-    int (*hvm_control) (struct domain *d, unsigned long op);
-    int (*hvm_param_altp2mhvm) (struct domain *d);
-    int (*hvm_altp2mhvm_op) (struct domain *d, uint64_t mode, uint32_t op);
-    int (*get_vnumainfo) (struct domain *d);
-
-    int (*vm_event_control) (struct domain *d, int mode, int op);
-
-#ifdef CONFIG_MEM_ACCESS
-    int (*mem_access) (struct domain *d);
-#endif
-
-#ifdef CONFIG_MEM_PAGING
-    int (*mem_paging) (struct domain *d);
-#endif
-
-#ifdef CONFIG_MEM_SHARING
-    int (*mem_sharing) (struct domain *d);
-#endif
-
-    int (*platform_op) (uint32_t cmd);
-
-#ifdef CONFIG_X86
-    int (*do_mca) (void);
-    int (*shadow_control) (struct domain *d, uint32_t op);
-    int (*mem_sharing_op) (struct domain *d, struct domain *cd, int op);
-    int (*apic) (struct domain *d, int cmd);
-    int (*memtype) (uint32_t access);
-    int (*machine_memory_map) (void);
-    int (*domain_memory_map) (struct domain *d);
-#define XSM_MMU_UPDATE_READ      1
-#define XSM_MMU_UPDATE_WRITE     2
-#define XSM_MMU_NORMAL_UPDATE    4
-#define XSM_MMU_MACHPHYS_UPDATE  8
-    int (*mmu_update) (struct domain *d, struct domain *t,
-                       struct domain *f, uint32_t flags);
-    int (*mmuext_op) (struct domain *d, struct domain *f);
-    int (*update_va_mapping) (struct domain *d, struct domain *f, l1_pgentry_t pte);
-    int (*priv_mapping) (struct domain *d, struct domain *t);
-    int (*ioport_permission) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
-    int (*ioport_mapping) (struct domain *d, uint32_t s, uint32_t e, uint8_t allow);
-    int (*pmu_op) (struct domain *d, unsigned int op);
-#endif
-    int (*dm_op) (struct domain *d);
-    int (*xen_version) (uint32_t cmd);
-    int (*domain_resource_map) (struct domain *d);
-#ifdef CONFIG_ARGO
-    int (*argo_enable) (const struct domain *d);
-    int (*argo_register_single_source) (const struct domain *d,
-                                        const struct domain *t);
-    int (*argo_register_any_source) (const struct domain *d);
-    int (*argo_send) (const struct domain *d, const struct domain *t);
-#endif
-};
+#include <xsm/xsm-core.h>
 
 #ifdef CONFIG_XSM
 
 extern struct xsm_operations xsm_ops;
 
-#ifndef XSM_NO_WRAPPERS
-
 static inline void xsm_security_domaininfo (struct domain *d,
                                         struct xen_domctl_getdomaininfo *info)
 {
@@ -731,76 +559,10 @@ static inline int xsm_argo_send(const struct domain *d, const struct domain *t)
 
 #endif /* CONFIG_ARGO */
 
-#endif /* XSM_NO_WRAPPERS */
-
-#ifdef CONFIG_MULTIBOOT
-extern int xsm_multiboot_init(unsigned long *module_map,
-                              const multiboot_info_t *mbi);
-extern int xsm_multiboot_policy_init(unsigned long *module_map,
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
-extern int xsm_dt_init(void);
-extern int xsm_dt_policy_init(void **policy_buffer, size_t *policy_size);
-extern bool has_xsm_magic(paddr_t);
-#endif
-
-extern int register_xsm(struct xsm_operations *ops);
-
-extern struct xsm_operations dummy_xsm_ops;
-extern void xsm_fixup_ops(struct xsm_operations *ops);
-
-#ifdef CONFIG_XSM_FLASK
-extern void flask_init(const void *policy_buffer, size_t policy_size);
-#else
-static inline void flask_init(const void *policy_buffer, size_t policy_size)
-{
-}
-#endif
-
-#ifdef CONFIG_XSM_FLASK_POLICY
-extern const unsigned char xsm_flask_init_policy[];
-extern const unsigned int xsm_flask_init_policy_size;
-#endif
-
-#ifdef CONFIG_XSM_SILO
-extern void silo_init(void);
-#else
-static inline void silo_init(void) {}
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
index 066694763a..de4d6cf2cf 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -10,7 +10,6 @@
  *  as published by the Free Software Foundation.
  */
 
-#define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
 #define set_to_dummy_if_null(ops, function)                            \
diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index fc2ca5cd2d..b96dacd181 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -17,7 +17,6 @@
  * You should have received a copy of the GNU General Public License along with
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
-#define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
 /*
-- 
2.20.1


