Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A75A011AD
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 03:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864845.1276152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtTA-0001wn-Ou; Sat, 04 Jan 2025 02:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864845.1276152; Sat, 04 Jan 2025 02:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtTA-0001sW-Gv; Sat, 04 Jan 2025 02:00:52 +0000
Received: by outflank-mailman (input) for mailman id 864845;
 Sat, 04 Jan 2025 02:00:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQr-0005Ax-SB
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e0b4e27-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 477C45C61FB;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5750FC4CEE7;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 525B5E7719A;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5e0b4e27-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=0RiCLC0xOzoXE8zM6GuJsL0mR/n/aR+zKy5BKY4AmRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Cc+SrVU8OiRGBxa/MQxYepNdpwn1YwuBa8DTaKdhhiesGN00s8ObKq73IJpqjMV+q
	 NqC+aGc0snCvnnlXnutTjAjzUEKx/xSEkpqDlKS3PdI5Sn40BUE4DRTorkB5BJMpv/
	 KzQuWptl2wNWjsOz2vIfRESQUKIt1sf3nXyqyztc8RVwZ0w1tnsa5M4OgY2U1wRiRw
	 wDbCwZPFnD1xla36YaMWcRekbujrSHyQKy6pK8lk//fdBuyki2ScSBciBDH8/uhoXb
	 FzOt7PwJLnG/7uoF1Ssb880YEFHIrYiStrgPDMaeainhDywtTs8EO00YlX1o6akHIh
	 6sjiHFj4lOdJg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:17 -0800
Subject: [PATCH v3 11/24] xen/domain: move get_initial_domain_id() to
 arch-independent header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-11-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=10763;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=KSx1P0KAHxW1DtHrVs4w4BNN0t0xYk4+xwM0DZycLC0=;
 b=XY8kJ57Z4bAPPueW7p5ElCjXAaQkou+MZAejExcnaHDRFAST3sVyhGy8HHUaFQ/I3HOrYvOr9
 kG+gPZ8+uGPBzexLC9uHJVRrvnzrJyKzRcZMyLj3faeCcwACnOdKPfS
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Honor 'hardware_domid=' parameter across all architectures and update
max_init_domid correctly so that toolstack and, subsequently, console driver
could iterate across known domains more efficiently.

Also, move max_init_domid to arch-independent location.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/dom0less-build.c      |  6 +++---
 xen/arch/arm/domain_build.c        |  7 ++++---
 xen/arch/arm/include/asm/setup.h   |  2 --
 xen/arch/arm/setup.c               |  2 --
 xen/arch/ppc/include/asm/setup.h   |  2 --
 xen/arch/riscv/include/asm/setup.h |  2 --
 xen/arch/x86/include/asm/pv/shim.h |  5 +++--
 xen/arch/x86/include/asm/setup.h   |  2 --
 xen/arch/x86/pv/shim.c             |  5 +----
 xen/common/domain.c                | 15 +++++++++++++++
 xen/common/domctl.c                | 11 +++++------
 xen/common/kernel.c                |  8 ++++++++
 xen/include/xen/domain.h           |  4 ++++
 13 files changed, 43 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 818e693222059a5e99a44831be62644ac442392b..b0c6c0b5c7762439dc74025333be092687c191e5 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -971,9 +971,9 @@ void __init create_domUs(void)
             panic("'llc-colors' found, but LLC coloring is disabled\n");
 
         /*
-         * The variable max_init_domid is initialized with zero, so here it's
-         * very important to use the pre-increment operator to call
-         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
+         * NB: it's very important to use the pre-increment operator to call
+         * domain_create() with a domid > get_initial_domain_id().
+         * domid == get_initial_domain_id() is reserved for Dom0.
          */
         d = domain_create(++max_init_domid, &d_cfg, flags);
         if ( IS_ERR(d) )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b072a16249feaab3eabe214040e4331e208ffae4..5fe2f397c8b1f7088b08c3435bc75a1acb8742b3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2357,6 +2357,7 @@ void __init create_dom0(void)
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
     unsigned int flags = CDF_privileged;
+    domid_t domid = get_initial_domain_id();
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
@@ -2387,15 +2388,15 @@ void __init create_dom0(void)
     if ( !llc_coloring_enabled )
         flags |= CDF_directmap;
 
-    dom0 = domain_create(0, &dom0_cfg, flags);
+    dom0 = domain_create(domid, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) )
-        panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
+        panic("Error creating domain %d (rc = %ld)\n", domid, PTR_ERR(dom0));
 
     if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
         panic("Error initializing LLC coloring for domain 0 (rc = %d)\n", rc);
 
     if ( alloc_dom0_vcpu0(dom0) == NULL )
-        panic("Error creating domain 0 vcpu0\n");
+        panic("Error creating domain %d vcpu0\n", domid);
 
     rc = construct_dom0(dom0);
     if ( rc )
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 6cf272c160ef2443cb50bfa4ae2d2591c52e043d..f107e8eebb4904a4455167e8792a66994a093d86 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -25,8 +25,6 @@ struct map_range_data
     struct rangeset *irq_ranges;
 };
 
-extern domid_t max_init_domid;
-
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(unsigned int mem_nr_banks);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c1f2d1b89d4317224bb1011e0db3a7372df807e2..47d80fcd43289ebbd751007f02eab2def60bebad 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -60,8 +60,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
 bool __read_mostly acpi_disabled;
 #endif
 
-domid_t __read_mostly max_init_domid;
-
 static __used void init_done(void)
 {
     int rc;
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/setup.h
index e4f64879b68ca5aac24bd9544255143e6ef693f3..956fa6985adb23375bd41d3e5d34d9d5f0712bd5 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -1,6 +1,4 @@
 #ifndef __ASM_PPC_SETUP_H__
 #define __ASM_PPC_SETUP_H__
 
-#define max_init_domid (0)
-
 #endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index c9d69cdf51666c0ec31196411b52e9b39439ba5f..d1fc64b673ab618d9ad7a78c0a8b32b70a2daae6 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,8 +5,6 @@
 
 #include <xen/types.h>
 
-#define max_init_domid (0)
-
 void setup_mm(void);
 
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/pv/shim.h
index 6153e27005986881ad87e9db0b555b30edc59fc0..27053d4f6fb93a619edba2d34d92ea5e5cd27303 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -31,7 +31,7 @@ long cf_check pv_shim_cpu_up(void *data);
 long cf_check pv_shim_cpu_down(void *data);
 void pv_shim_online_memory(unsigned int nr, unsigned int order);
 void pv_shim_offline_memory(unsigned int nr, unsigned int order);
-domid_t get_initial_domain_id(void);
+domid_t pv_shim_get_initial_domain_id(void);
 uint64_t pv_shim_mem(uint64_t avail);
 void pv_shim_fixup_e820(void);
 const struct platform_bad_page *pv_shim_reserved_pages(unsigned int *size);
@@ -76,8 +76,9 @@ static inline void pv_shim_offline_memory(unsigned int nr, unsigned int order)
 {
     ASSERT_UNREACHABLE();
 }
-static inline domid_t get_initial_domain_id(void)
+static inline domid_t pv_shim_get_initial_domain_id(void)
 {
+    ASSERT_UNREACHABLE();
     return 0;
 }
 static inline uint64_t pv_shim_mem(uint64_t avail)
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 5c2391a8684b66efdf4b092409ed33935db6b40c..296348655b9d146c73acc305cc9edd5fd46f7d47 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -69,6 +69,4 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
 
-#define max_init_domid (0)
-
 #endif
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 9eb120258aeaf7068eae88d1e7d1b95ea7a00f31..8435f347ce31aed49309e942f9692a2307bcd93f 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -1018,13 +1018,10 @@ void pv_shim_offline_memory(unsigned int nr, unsigned int order)
     }
 }
 
-domid_t get_initial_domain_id(void)
+domid_t pv_shim_get_initial_domain_id(void)
 {
     uint32_t eax, ebx, ecx, edx;
 
-    if ( !pv_shim )
-        return 0;
-
     cpuid(xen_cpuid_base + 4, &eax, &ebx, &ecx, &edx);
 
     return (eax & XEN_HVM_CPUID_DOMID_PRESENT) ? ecx : 1;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 711ec3bf3b7845a6c295575421c252193ccbc0ae..61e0890052eb0c7ff7c19cc2fbdbfb9af512a545 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -43,6 +43,9 @@
 #include <xsm/xsm.h>
 #include <xen/trace.h>
 #include <asm/setup.h>
+#ifdef CONFIG_PV_SHIM
+#include <asm/pv/shim.h>
+#endif
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
@@ -65,6 +68,9 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
 
+/* Last known non-system domain ID. */
+domid_t __read_mostly max_init_domid;
+
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be looked
  * up by domid, and therefore to be the subject of hypercalls/etc.
@@ -2261,6 +2267,15 @@ int continue_hypercall_on_cpu(
     return 0;
 }
 
+domid_t get_initial_domain_id(void)
+{
+#ifdef CONFIG_PV_SHIM
+    if ( pv_shim )
+        return pv_shim_get_initial_domain_id();
+#endif
+    return hardware_domid;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 05abb581a03d9c4deaea432a8d5e65d6906f70b4..498bffe56e1fac217c868a0ed79a14db98cb025d 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -415,10 +415,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     case XEN_DOMCTL_createdomain:
     {
         domid_t        dom;
-        static domid_t rover = 0;
 
         dom = op->domain;
-        if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
+        if ( (dom > max_init_domid) && (dom < DOMID_FIRST_RESERVED) )
         {
             ret = -EEXIST;
             if ( !is_free_domid(dom) )
@@ -426,19 +425,19 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         }
         else
         {
-            for ( dom = rover + 1; dom != rover; dom++ )
+            for ( dom = max_init_domid + 1; dom != max_init_domid; dom++ )
             {
                 if ( dom == DOMID_FIRST_RESERVED )
-                    dom = 1;
+                    dom = max_init_domid + 1;
                 if ( is_free_domid(dom) )
                     break;
             }
 
             ret = -ENOMEM;
-            if ( dom == rover )
+            if ( dom == max_init_domid )
                 break;
 
-            rover = dom;
+            max_init_domid = dom;
         }
 
         d = domain_create(dom, &op->u.createdomain, false);
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 8b63ca55f14fb81b6b803a8f28d487dd954ef862..1a079c9bddcb705dad256b0be1673122d77f4dd7 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -568,6 +568,14 @@ static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     return sz;
 }
 
+static int __init cf_check globals_init(void)
+{
+    max_init_domid = get_initial_domain_id();
+
+    return 0;
+}
+__initcall(globals_init);
+
 long do_xen_version(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     bool deny = xsm_xen_version(XSM_OTHER, cmd);
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 4ae5def08eda40db58b6506b60a9393c82ba9aa7..eef36bafd3574c97d2f1f5c1fc93b4b7b46b78ba 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -175,4 +175,8 @@ extern bool vmtrace_available;
 
 extern bool vpmu_is_available;
 
+extern domid_t max_init_domid;
+
+domid_t get_initial_domain_id(void);
+
 #endif /* __XEN_DOMAIN_H__ */

-- 
2.34.1



