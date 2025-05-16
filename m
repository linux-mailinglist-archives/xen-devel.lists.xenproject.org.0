Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0F6AB9A07
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986812.1372343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsDl-0001E4-Ez; Fri, 16 May 2025 10:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986812.1372343; Fri, 16 May 2025 10:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsDl-0001Al-9x; Fri, 16 May 2025 10:23:17 +0000
Received: by outflank-mailman (input) for mailman id 986812;
 Fri, 16 May 2025 10:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4w7r=YA=bounce.vates.tech=bounce-md_30504962.68271210.v1-e4369dd05760456da708e1454a2b2ce5@srs-se1.protection.inumbo.net>)
 id 1uFsDj-0000kS-HI
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:23:15 +0000
Received: from mail133-28.atl131.mandrillapp.com
 (mail133-28.atl131.mandrillapp.com [198.2.133.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5a53bcc-323f-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:23:13 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-28.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZzNSw4kMszMQxhr2
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 10:23:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e4369dd05760456da708e1454a2b2ce5; Fri, 16 May 2025 10:23:12 +0000
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
X-Inumbo-ID: c5a53bcc-323f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747390992; x=1747660992;
	bh=DandEhzp+qPKdWdpmRXBmMLVVVlG3pQoydJsD7Um6to=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gtSQHzLaiFJmwd3fY/To9E6iJGVRkCHSG2ZuIkc0Op0kIZhCpmBL1FMtQ0RRzjGhT
	 +6UUlVSrIFt5X2KIvYJem9ub7n2DZlDuhjo4ql6GA8xRHMxof553+GlCluS5QT7h6A
	 uAyUug7ybmUkDsBm4N1YIY3ZNrGE0IxOoS+Dspjb5SdtRdHl1jQ0Fk2pg62/aCaMHV
	 BivaPSdUJ6LJKsmlFCCTv7nDmTBgyal8pQH9rcNerdOtaWGfrCdHVTJFa3u8MTMG8F
	 TwAu6wjYelUgpxgK6P4Jcxi6HNfdf960BJs9j2BwbFAPElaw/wxJGLc8QNR7DJeV+1
	 EU8LCBYPLwD9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747390992; x=1747651492; i=teddy.astie@vates.tech;
	bh=DandEhzp+qPKdWdpmRXBmMLVVVlG3pQoydJsD7Um6to=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OSzdryaztxGhQKUhl1b2SIM1J900Y41ZP6cTY31ujCh2PSc90ruH92ZAcYhmNwt6X
	 EFVQ6BHBq5pbchzf9BnN+isz7mIJ42WC15MGY9kXG6NWfmuxH+MF3xGVdw06ymVzHw
	 y1v4eSXDrTcKCWT8vjy8jzA1hUTXqMf8hgQoE3Z1/q9rYQM9MRlhAc8oZzimHQS3bh
	 /AeEAI4AxO8Ak83uE4vArIO6rY3QG15uXtW8Qgd2sB8pCjgP3Eym8Jj/1vVUzw/Vq2
	 sZoxH+KvWXD2uepKLDQMrdoNmafKPB9CtcCl1QCzPEaNp1wEXN0ZOpwNWNbYbqTE5J
	 +YDYgmVJNPwlw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2009/16]=20common:=20Introduce=20confidential=20computing=20infrastructure?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747390991298
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <2bff74440483be3c59156257a60d632727a18582.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e4369dd05760456da708e1454a2b2ce5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 10:23:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce a subsystem that is used for future confidential computing
platforms. This subsystem manages and provides hooks for domain management
and exposes various informations for toolstack (COCO platform, supported
features, ...).

Add a domain creation flag to build a confidential computing guest.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/domain.c         |   4 +
 xen/arch/x86/hvm/hvm.c        |  10 ++-
 xen/common/Kconfig            |   5 ++
 xen/common/Makefile           |   1 +
 xen/common/coco.c             | 134 ++++++++++++++++++++++++++++++++++
 xen/common/domain.c           |  41 ++++++++++-
 xen/include/hypercall-defs.c  |   2 +
 xen/include/public/domctl.h   |   5 +-
 xen/include/public/hvm/coco.h |  65 +++++++++++++++++
 xen/include/public/xen.h      |   1 +
 xen/include/xen/coco.h        |  88 ++++++++++++++++++++++
 xen/include/xen/sched.h       |  10 +++
 12 files changed, 363 insertions(+), 3 deletions(-)
 create mode 100644 xen/common/coco.c
 create mode 100644 xen/include/public/hvm/coco.h
 create mode 100644 xen/include/xen/coco.h

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index f197dad4c0..a5783154ad 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -12,6 +12,7 @@
  */
 
 #include <xen/acpi.h>
+#include <xen/coco.h>
 #include <xen/compat.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
@@ -948,6 +949,9 @@ void arch_domain_destroy(struct domain *d)
     free_xenheap_page(d->shared_info);
     cleanup_domain_irq_mapping(d);
 
+    if ( is_coco_domain(d) )
+        coco_domain_destroy(d);
+
     psr_domain_free(d);
 }
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 625ae2098b..e1bcf8e086 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -15,6 +15,7 @@
 #include <xen/sched.h>
 #include <xen/irq.h>
 #include <xen/softirq.h>
+#include <xen/coco.h>
 #include <xen/domain.h>
 #include <xen/domain_page.h>
 #include <xen/hypercall.h>
@@ -702,7 +703,11 @@ int hvm_domain_initialise(struct domain *d,
     if ( rc )
         goto fail2;
 
-    rc = hvm_asid_alloc(&d->arch.hvm.asid);
+    if ( is_coco_domain(d) && d->coco_ops && d->coco_ops->asid_alloc )
+        rc = d->coco_ops->asid_alloc(d, &d->arch.hvm.asid);
+    else
+        rc = hvm_asid_alloc(&d->arch.hvm.asid);
+
     if ( rc )
         goto fail2;
 
@@ -710,6 +715,9 @@ int hvm_domain_initialise(struct domain *d,
     if ( rc != 0 )
         goto fail2;
 
+    if ( is_coco_domain(d) )
+        coco_domain_initialise(d);
+
     return 0;
 
  fail2:
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6d43be2e6e..1ddb73e707 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -576,4 +576,9 @@ config BUDDY_ALLOCATOR_SIZE
 	  Amount of memory reserved for the buddy allocator to serve Xen heap,
 	  working alongside the colored one.
 
+config COCO
+	bool "Enable COnfidential COmputing support for guests" if EXPERT
+	default n
+	help
+	  Allows to run guests in private encrypted memory space.
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 98f0873056..4409510fc0 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
 obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
 obj-$(CONFIG_CORE_PARKING) += core_parking.o
 obj-y += cpu.o
+obj-$(CONFIG_COCO) += coco.o
 obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device.o
 obj-$(filter-out $(CONFIG_X86),$(CONFIG_ACPI)) += device.o
diff --git a/xen/common/coco.c b/xen/common/coco.c
new file mode 100644
index 0000000000..d9bd17628d
--- /dev/null
+++ b/xen/common/coco.c
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * General confidential computing functions.
+ */
+ 
+#include <xen/coco.h>
+#include <xen/errno.h>
+#include <xen/domain.h>
+#include <xen/domain_page.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/sched.h>
+#include <xen/sections.h>
+#include <xen/types.h>
+
+#include <asm/p2m.h>
+
+#include <public/hvm/coco.h>
+
+static __ro_after_init struct coco_ops *coco_ops;
+__read_mostly struct coco_platform_status platform_status;
+
+void __init coco_register_ops(struct coco_ops *ops)
+{
+    coco_ops = ops;
+}
+
+int __init coco_init(void)
+{
+    int rc = 0;
+
+    if ( coco_ops )
+        printk("coco: Using '%s'\n", coco_ops->name);
+    else
+    {
+        printk("coco: No platform found\n");
+        return 0;
+    }
+
+    if ( coco_ops->init )
+    {
+        rc = coco_ops->init();
+        
+        if ( rc )
+        {
+            printk("coco: Unable to initialize coco platform (%d)", rc);
+            goto err;
+        }
+    }
+
+    rc = coco_ops->get_platform_status(&platform_status);
+    if ( rc )
+    {
+        printk("coco: Unable to get platform status\n");
+        goto err;
+    }
+
+    return 0;
+
+err:
+    /* Disable confidential computing if initialization failed. */
+    coco_ops = NULL;
+    return rc;
+}
+
+void coco_set_domain_ops(struct domain *d)
+{
+    ASSERT(is_coco_domain(d));
+
+    d->coco_ops = coco_ops->get_domain_ops(d);
+}
+
+int coco_prepare_initial_memory(struct domain *d, gfn_t gfn, size_t page_count)
+{
+    /* TODO: Check prepare_initial_memory constraints (no dangling mapping). */
+
+    if ( d->coco_ops->prepare_initial_mem )
+        return d->coco_ops->prepare_initial_mem(d, gfn, page_count);
+    
+    return 0;
+}
+
+long coco_op_prepare_initial_mem(struct coco_prepare_initial_mem arg)
+{
+    long rc = 0;
+    struct domain *d = get_domain_by_id(arg.domid);
+
+    if ( !d )
+        return -ENOENT;
+    
+    if ( !is_coco_domain(d) )
+    {
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    rc = coco_prepare_initial_memory(d, arg.gfn, arg.count);
+
+out:
+    put_domain(d);
+    return rc;
+}
+
+long do_coco_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    if ( !is_hardware_domain(current->domain) )
+        return -EPERM;
+
+    switch (cmd)
+    {
+        case XEN_COCO_platform_status:
+        {
+            if ( copy_to_guest(arg, &platform_status, 1) )
+                return -EFAULT;
+
+            return 0;
+        }
+        
+        case XEN_COCO_prepare_initial_mem:
+        {
+            struct coco_prepare_initial_mem prepare_initial_mem;
+
+            if ( copy_from_guest(&prepare_initial_mem, arg, 1) )
+                return -EFAULT;
+
+            return coco_op_prepare_initial_mem(prepare_initial_mem);
+        }
+
+        default:
+            return -ENOSYS;
+    }
+}
+
+__initcall(coco_init);
\ No newline at end of file
diff --git a/xen/common/domain.c b/xen/common/domain.c
index abf1969e60..c29d6efd29 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -4,6 +4,7 @@
  * Generic domain-handling functions.
  */
 
+#include <xen/coco.h>
 #include <xen/compat.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -716,17 +717,51 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
     bool hap = config->flags & XEN_DOMCTL_CDF_hap;
     bool iommu = config->flags & XEN_DOMCTL_CDF_iommu;
     bool vpmu = config->flags & XEN_DOMCTL_CDF_vpmu;
+    bool coco = config->flags & XEN_DOMCTL_CDF_coco;
 
     if ( config->flags &
          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
-           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
+           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu | XEN_DOMCTL_CDF_coco) )
     {
         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", config->flags);
         return -EINVAL;
     }
 
+    if ( coco )
+    {
+        if ( !IS_ENABLED(CONFIG_COCO) )
+        {
+            dprintk(XENLOG_INFO, "COCO support is compiled out\n");
+            return -EINVAL;
+        }
+
+        if ( !coco_is_supported() )
+        {
+            dprintk(XENLOG_INFO, "COCO is not available\n");
+            return -EINVAL;
+        }
+    
+        if ( !hvm )
+        {
+            dprintk(XENLOG_INFO, "COCO requested for non-HVM guest\n");
+            return -EINVAL;
+        }
+
+        if ( !hap )
+        {
+            dprintk(XENLOG_INFO, "COCO cannot work without HAP\n");
+            return -EINVAL;
+        }
+
+        if ( config->flags & XEN_DOMCTL_CDF_nested_virt )
+        {
+            dprintk(XENLOG_INFO, "Nested virtualization isn't supported with COCO\n");
+            return -EINVAL;
+        }
+    }
+
     if ( config->grant_opts & ~XEN_DOMCTL_GRANT_version_mask )
     {
         dprintk(XENLOG_INFO, "Unknown grant options %#x\n", config->grant_opts);
@@ -836,6 +871,9 @@ struct domain *domain_create(domid_t domid,
     /* Holding CDF_* internal flags. */
     d->cdf = flags;
 
+    if ( is_coco_domain(d) )
+        coco_set_domain_ops(d);
+
     TRACE_TIME(TRC_DOM0_DOM_ADD, d->domain_id);
 
     lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
@@ -1617,6 +1655,7 @@ int domain_unpause_by_systemcontroller(struct domain *d)
     {
         d->creation_finished = true;
         arch_domain_creation_finished(d);
+        coco_domain_creation_finished(d); /* TODO: or before arch_* ? */
     }
 
     domain_unpause(d);
diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 7720a29ade..6c01a9e395 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -209,6 +209,7 @@ hypfs_op(unsigned int cmd, const char *arg1, unsigned long arg2, void *arg3, uns
 #ifdef CONFIG_X86
 xenpmu_op(unsigned int op, xen_pmu_params_t *arg)
 #endif
+coco_op(unsigned int cmd, void *arg)
 
 #ifdef CONFIG_PV
 caller: pv64
@@ -295,5 +296,6 @@ mca                                do       do       -        -        -
 #ifndef CONFIG_PV_SHIM_EXCLUSIVE
 paging_domctl_cont                 do       do       do       do       -
 #endif
+coco_op                            do       do       do       do       do
 
 #endif /* !CPPCHECK */
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 5b2063eed9..f4f69556b6 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -67,8 +67,11 @@ struct xen_domctl_createdomain {
 /* Should we expose the vPMU to the guest? */
 #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
 
+#define _XEN_DOMCTL_CDF_coco         8
+#define XEN_DOMCTL_CDF_coco          (1U << _XEN_DOMCTL_CDF_coco)
+
 /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
-#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
+#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_coco
 
     uint32_t flags;
 
diff --git a/xen/include/public/hvm/coco.h b/xen/include/public/hvm/coco.h
new file mode 100644
index 0000000000..2e23d91e12
--- /dev/null
+++ b/xen/include/public/hvm/coco.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __XEN_PUBLIC_HVM_COCO_H__
+#define __XEN_PUBLIC_HVM_COCO_H__
+
+#include "../xen.h"
+
+#define XEN_COCO_platform_status 0
+
+/**
+ * XEN_COCO_platform_status: Get the status of confidential computing platform.
+ *
+ * Query informations regarding the current confidential computing platform.
+ *
+ * Confidential computing is supposed working as long as COCO_STATUS_FLAG_SUPPORTED bit
+ * is set, and additionally security-supported only if COCO_STATUS_FLAG_UNSAFE bit
+ * is cleared.
+ *
+ * If COCO_PLATFORM_FLAG_UNSAFE is set but COCO_PLATFORM_FLAG_SUPPORTED is not,
+ * then confidential computing is explicitly present but intentionally disabled
+ * or forbidden by policy.
+ */
+struct coco_platform_status {
+#define COCO_PLATFORM_none        0 /* None */
+#define COCO_PLATFORM_amd_sev     1 /* AMD Secure Encrypted Virtualization */
+#define COCO_PLATFORM_intel_tdx   2 /* Intel Trust Domain Extensions */
+#define COCO_PLATFORM_arm_rme     3 /* ARM Realm Management Extension */
+    uint32_t platform; /* OUT */
+
+#define COCO_PLATFORM_FLAG_sev_es  (1 << 0) /* AMD SEV Encrypted State */
+#define COCO_PLATFORM_FLAG_sev_snp (1 << 1) /* AMD SEV Secure Nested Paging */
+#define COCO_PLATFORM_FLAG_sev_tio (1 << 2) /* AMD SEV Trusted I/O */
+    uint32_t platform_flags; /* OUT */
+
+#define COCO_STATUS_FLAG_supported (1 << 0) /* Confidential computing is supported and usable */
+#define COCO_STATUS_FLAG_unsafe    (1 << 1) /* Confidential computing is unsafe (e.g debug mode) */
+    uint32_t flags;    /* OUT */
+    uint32_t features; /* OUT */
+
+    uint32_t version_major; /* OUT */
+    uint32_t version_minor; /* OUT */
+};
+typedef struct coco_platform_status coco_platform_status_t;
+DEFINE_XEN_GUEST_HANDLE(coco_platform_status_t);
+
+#define XEN_COCO_prepare_initial_mem 1
+
+/**
+ * XEN_COCO_prepare_initial_mem: Prepare early memory pages of a guest
+ * 
+ * During guest construction, the confidential computing platform may require memory
+ * to be prepared (e.g., encrypted) before the guest is started.
+ * 
+ * After preparation, any further access to these pages is invalid, as they may be
+ * encrypted, sealed, or tracked by the platform.
+ */
+struct coco_prepare_initial_mem {
+    domid_t domid;      /* IN */
+    uint16_t _rsvd[3];  /* ZERO */
+    uint64_t gfn;       /* IN */
+    uint64_t count;     /* IN */
+};
+typedef struct coco_prepare_initial_mem coco_prepare_initial_mem_t;
+DEFINE_XEN_GUEST_HANDLE(coco_prepare_initial_mem_t);
+
+#endif /* __XEN_PUBLIC_HVM_COCO_H__ */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index 82b9c05a76..e656d6f617 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -118,6 +118,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #define __HYPERVISOR_xenpmu_op            40
 #define __HYPERVISOR_dm_op                41
 #define __HYPERVISOR_hypfs_op             42
+#define __HYPERVISOR_coco_op              43
 
 /* Architecture-specific hypercall definitions. */
 #define __HYPERVISOR_arch_0               48
diff --git a/xen/include/xen/coco.h b/xen/include/xen/coco.h
new file mode 100644
index 0000000000..2ae43995ec
--- /dev/null
+++ b/xen/include/xen/coco.h
@@ -0,0 +1,88 @@
+#ifndef _XEN_COCO_H
+#define _XEN_COCO_H
+
+#include <asm/nospec.h>
+
+#include <xen/stdint.h>
+#include <xen/sched.h>
+
+#include <public/hvm/coco.h>
+
+extern __read_mostly struct coco_platform_status platform_status;
+
+struct coco_domain_ops {
+    int (*prepare_initial_mem)(struct domain *d, gfn_t gfn, size_t page_count);
+    /* domain_creation_finished, ... */    
+
+    /* HVM domain hooks */
+    int (*domain_initialise)(struct domain *d);
+    int (*domain_creation_finished)(struct domain *d);
+    void (*domain_destroy)(struct domain *d);
+
+#ifdef CONFIG_X86
+    /* COCO-specific ASID allocation logic */
+    int (*asid_alloc)(struct domain *d, struct hvm_asid *asid);
+#endif
+};
+
+struct coco_ops {
+    const char *name;
+    
+    int (*init)(void);
+    int (*get_platform_status)(coco_platform_status_t *status);
+    struct coco_domain_ops *(*get_domain_ops)(struct domain *d);
+};
+
+void __init coco_register_ops(struct coco_ops *ops);
+int __init coco_init(void);
+void coco_set_domain_ops(struct domain *d);
+
+#ifdef CONFIG_COCO
+static inline bool coco_is_supported(void)
+{
+    return evaluate_nospec(platform_status.flags & COCO_STATUS_FLAG_supported);
+}
+
+static inline int coco_domain_initialise(struct domain *d)
+{
+    if ( d->coco_ops && d->coco_ops->domain_initialise )
+        return d->coco_ops->domain_initialise(d);
+
+    return 0;
+}
+
+static inline int coco_domain_creation_finished(struct domain *d)
+{
+    if ( d->coco_ops && d->coco_ops->domain_creation_finished )
+        return d->coco_ops->domain_creation_finished(d);
+
+    return 0;
+}
+
+static inline void coco_domain_destroy(struct domain *d)
+{
+    if ( d->coco_ops && d->coco_ops->domain_destroy )
+        d->coco_ops->domain_destroy(d);
+}
+#else
+static inline bool coco_is_supported(void)
+{
+    return false;
+}
+
+static inline int coco_domain_initialise(struct domain *d)
+{
+    return 0;
+}
+
+static inline int coco_domain_creation_finished(struct domain *d)
+{
+    return 0;
+}
+
+static inline void coco_domain_destroy(struct domain *d)
+{
+}
+#endif
+
+#endif /* _XEN_COCO_H */
\ No newline at end of file
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index f2f5a98534..c57bedc30a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -630,6 +630,10 @@ struct domain
     struct argo_domain *argo;
 #endif
 
+#ifdef CONFIG_COCO
+    struct coco_domain_ops *coco_ops;
+#endif
+
     /*
      * Continuation information for domain_teardown().  All fields entirely
      * private.
@@ -1198,6 +1202,12 @@ static always_inline bool is_hvm_vcpu(const struct vcpu *v)
     return is_hvm_domain(v->domain);
 }
 
+static always_inline bool is_coco_domain(const struct domain *d)
+{
+    return IS_ENABLED(CONFIG_COCO) &&
+        evaluate_nospec(d->options & XEN_DOMCTL_CDF_coco);
+}
+
 static always_inline bool hap_enabled(const struct domain *d)
 {
     /* sanitise_domain_config() rejects HAP && !HVM */
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


