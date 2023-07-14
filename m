Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA0753A21
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 13:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563585.880896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHJ6-0005vp-87; Fri, 14 Jul 2023 11:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563585.880896; Fri, 14 Jul 2023 11:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKHJ6-0005qg-1A; Fri, 14 Jul 2023 11:49:56 +0000
Received: by outflank-mailman (input) for mailman id 563585;
 Fri, 14 Jul 2023 11:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z95V=DA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qKHJ4-0005Xk-EZ
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 11:49:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bae35d5-223c-11ee-b239-6b7b168915f2;
 Fri, 14 Jul 2023 13:49:53 +0200 (CEST)
Received: from nico.bugseng.com (unknown [37.163.94.163])
 by support.bugseng.com (Postfix) with ESMTPSA id 464074EE0C8B;
 Fri, 14 Jul 2023 13:49:52 +0200 (CEST)
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
X-Inumbo-ID: 8bae35d5-223c-11ee-b239-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 3/4] xen/arm: initialize conditionally uninitialized local variables
Date: Fri, 14 Jul 2023 13:49:20 +0200
Message-Id: <c7d2cd46f06f75f8a1810168c508f05d242f831c.1689329728.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689329728.git.nicola.vetrini@bugseng.com>
References: <cover.1689329728.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch aims to fix some occurrences of possibly uninitialized
variables, that may be read before being written. This behaviour would
violate MISRA C:2012 Rule 9.1, besides being generally undesirable.

In all the analyzed cases, such accesses were actually safe, but it's
quite difficult to prove so by automatic checking, therefore a safer
route is to change the code so as to avoid the behaviour from occurring,
while preserving the semantics.

An initialization to a safe value is provided to reach this aim.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Additional input on which values may be 'safe' in each context is
surely welcome, to avoid possibly compromising the correctness of
the function semantics.
---
 xen/arch/arm/cpuerrata.c                    |  6 +++---
 xen/arch/arm/domctl.c                       |  8 ++++----
 xen/arch/arm/gic-v3-lpi.c                   | 17 +++++++++--------
 xen/arch/arm/include/asm/p2m.h              | 10 ++++++----
 xen/arch/arm/platforms/xilinx-zynqmp-eemi.c | 10 ++--------
 xen/arch/arm/psci.c                         | 10 +++++-----
 xen/drivers/char/pl011.c                    |  2 +-
 7 files changed, 30 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index d0658aedb6..14694c6081 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -159,7 +159,7 @@ extern char __mitigate_spectre_bhb_loop_start_32[],
 
 static int enable_smccc_arch_workaround_1(void *data)
 {
-    struct arm_smccc_res res;
+    struct arm_smccc_res res = {0};
     const struct arm_cpu_capabilities *entry = data;
 
     /*
@@ -252,7 +252,7 @@ static int enable_spectre_bhb_workaround(void *data)
 
     if ( cpus_have_cap(ARM_WORKAROUND_BHB_SMCC_3) )
     {
-        struct arm_smccc_res res;
+        struct arm_smccc_res res = {0};
 
         if ( smccc_ver < SMCCC_VERSION(1, 1) )
             goto warn;
@@ -393,7 +393,7 @@ DEFINE_PER_CPU_READ_MOSTLY(register_t, ssbd_callback_required);
 
 static bool has_ssbd_mitigation(const struct arm_cpu_capabilities *entry)
 {
-    struct arm_smccc_res res;
+    struct arm_smccc_res res = {0};
     bool required;
 
     if ( smccc_ver < SMCCC_VERSION(1, 1) )
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad56efb0f5..b38fed72be 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -29,10 +29,10 @@ static int handle_vuart_init(struct domain *d,
                              struct xen_domctl_vuart_op *vuart_op)
 {
     int rc;
-    struct vpl011_init_info info;
-
-    info.console_domid = vuart_op->console_domid;
-    info.gfn = _gfn(vuart_op->gfn);
+    struct vpl011_init_info info = {
+        .console_domid = vuart_op->console_domid,
+        .gfn = _gfn(vuart_op->gfn)
+    };
 
     if ( d->creation_finished )
         return -EPERM;
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index eb0a5535e4..12f2af2e4d 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -210,7 +210,10 @@ out:
 void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
                                  uint32_t virt_lpi)
 {
-    union host_lpi *hlpip, hlpi;
+    union host_lpi *hlpip, hlpi = {
+        .virt_lpi = virt_lpi,
+        .dom_id = domain_id
+    };
 
     ASSERT(host_lpi >= LPI_OFFSET);
 
@@ -218,9 +221,6 @@ void gicv3_lpi_update_host_entry(uint32_t host_lpi, int domain_id,
 
     hlpip = &lpi_data.host_lpis[host_lpi / HOST_LPIS_PER_PAGE][host_lpi % HOST_LPIS_PER_PAGE];
 
-    hlpi.virt_lpi = virt_lpi;
-    hlpi.dom_id = domain_id;
-
     write_u64_atomic(&hlpip->data, hlpi.data);
 }
 
@@ -542,14 +542,15 @@ int gicv3_allocate_host_lpi_block(struct domain *d, uint32_t *first_lpi)
 
     for ( i = 0; i < LPI_BLOCK; i++ )
     {
-        union host_lpi hlpi;
-
         /*
          * Mark this host LPI as belonging to the domain, but don't assign
          * any virtual LPI or a VCPU yet.
          */
-        hlpi.virt_lpi = INVALID_LPI;
-        hlpi.dom_id = d->domain_id;
+        union host_lpi hlpi = {
+            .virt_lpi = INVALID_LPI,
+            .dom_id = d->domain_id
+        };
+
         write_u64_atomic(&lpi_data.host_lpis[chunk][lpi_idx + i].data,
                          hlpi.data);
 
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 940495d42b..413e2a7add 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -345,7 +345,7 @@ static inline struct page_info *get_page_from_gfn(
     struct domain *d, unsigned long gfn, p2m_type_t *t, p2m_query_t q)
 {
     mfn_t mfn;
-    p2m_type_t _t;
+    p2m_type_t _t = p2m_invalid;
     struct page_info *page;
 
     /*
@@ -355,10 +355,12 @@ static inline struct page_info *get_page_from_gfn(
     if ( likely(d != dom_xen) )
         return p2m_get_page_from_gfn(d, _gfn(gfn), t);
 
-    if ( !t )
+    /* Allow t to be NULL */
+    if ( t )
+        *t = _t;
+    else {
         t = &_t;
-
-    *t = p2m_invalid;
+    }
 
     /*
      * DOMID_XEN sees 1-1 RAM. The p2m_type is based on the type of the
diff --git a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
index 2053ed7ac5..39d9ab4fa9 100644
--- a/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
+++ b/xen/arch/arm/platforms/xilinx-zynqmp-eemi.c
@@ -51,11 +51,11 @@ static inline bool domain_has_reset_access(struct domain *d, uint32_t rst)
 
 bool zynqmp_eemi(struct cpu_user_regs *regs)
 {
-    struct arm_smccc_res res;
+    struct arm_smccc_res res = {0};
     uint32_t fid = get_user_reg(regs, 0);
     uint32_t nodeid = get_user_reg(regs, 1);
     unsigned int pm_fn = fid & 0xFFFF;
-    enum pm_ret_status ret;
+    enum pm_ret_status ret = XST_PM_NO_ACCESS;
 
     switch ( fid )
     {
@@ -89,7 +89,6 @@ bool zynqmp_eemi(struct cpu_user_regs *regs)
         {
             gprintk(XENLOG_WARNING,
                     "zynqmp-pm: fn=%u No access to node %u\n", pm_fn, nodeid);
-            ret = XST_PM_NO_ACCESS;
             goto done;
         }
         goto forward_to_fw;
@@ -100,7 +99,6 @@ bool zynqmp_eemi(struct cpu_user_regs *regs)
         {
             gprintk(XENLOG_WARNING,
                     "zynqmp-pm: fn=%u No access to reset %u\n", pm_fn, nodeid);
-            ret = XST_PM_NO_ACCESS;
             goto done;
         }
         goto forward_to_fw;
@@ -116,7 +114,6 @@ bool zynqmp_eemi(struct cpu_user_regs *regs)
     case EEMI_FID(PM_MMIO_READ):
         gprintk(XENLOG_WARNING,
                 "zynqmp-pm: fn=%u No MMIO access to %u\n", pm_fn, nodeid);
-        ret = XST_PM_NO_ACCESS;
         goto done;
 
     /* Exclusive to the hardware domain.  */
@@ -146,14 +143,12 @@ bool zynqmp_eemi(struct cpu_user_regs *regs)
         if ( !is_hardware_domain(current->domain) )
         {
             gprintk(XENLOG_WARNING, "eemi: fn=%u No access", pm_fn);
-            ret = XST_PM_NO_ACCESS;
             goto done;
         }
         goto forward_to_fw;
 
     /* These calls are never allowed.  */
     case EEMI_FID(PM_SYSTEM_SHUTDOWN):
-        ret = XST_PM_NO_ACCESS;
         goto done;
 
     case IPI_MAILBOX_FID(IPI_MAILBOX_OPEN):
@@ -166,7 +161,6 @@ bool zynqmp_eemi(struct cpu_user_regs *regs)
         if ( !is_hardware_domain(current->domain) )
         {
             gprintk(XENLOG_WARNING, "IPI mailbox: fn=%u No access", pm_fn);
-            ret = XST_PM_NO_ACCESS;
             goto done;
         }
         goto forward_to_fw;
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 695d2fa1f1..47e46af608 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -38,7 +38,7 @@ static uint32_t psci_cpu_on_nr;
 
 int call_psci_cpu_on(int cpu)
 {
-    struct arm_smccc_res res;
+    struct arm_smccc_res res = {0};
 
     arm_smccc_smc(psci_cpu_on_nr, cpu_logical_map(cpu), __pa(init_secondary),
                   &res);
@@ -50,7 +50,7 @@ void call_psci_cpu_off(void)
 {
     if ( psci_ver > PSCI_VERSION(0, 1) )
     {
-        struct arm_smccc_res res;
+        struct arm_smccc_res res = {0};
 
         /* If successfull the PSCI cpu_off call doesn't return */
         arm_smccc_smc(PSCI_0_2_FN32_CPU_OFF, &res);
@@ -73,7 +73,7 @@ void call_psci_system_reset(void)
 
 static int __init psci_features(uint32_t psci_func_id)
 {
-    struct arm_smccc_res res;
+    struct arm_smccc_res res = {0};
 
     if ( psci_ver < PSCI_VERSION(1, 0) )
         return PSCI_NOT_SUPPORTED;
@@ -115,7 +115,7 @@ static void __init psci_init_smccc(void)
 
     if ( psci_features(ARM_SMCCC_VERSION_FID) != PSCI_NOT_SUPPORTED )
     {
-        struct arm_smccc_res res;
+        struct arm_smccc_res res = {0};
 
         arm_smccc_smc(ARM_SMCCC_VERSION_FID, &res);
         if ( PSCI_RET(res) != ARM_SMCCC_NOT_SUPPORTED )
@@ -168,7 +168,7 @@ static int __init psci_init_0_2(void)
         { /* sentinel */ },
     };
     int ret;
-    struct arm_smccc_res res;
+    struct arm_smccc_res res = {0};
 
     if ( acpi_disabled )
     {
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index f7bf3ad117..34ce90be52 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -285,7 +285,7 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
     const char *config = data;
     int res;
     paddr_t addr, size;
-    uint32_t io_width;
+    uint32_t io_width = 0;
     bool mmio32 = false, sbsa;
 
     if ( strcmp(config, "") )
-- 
2.34.1


