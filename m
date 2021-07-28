Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C53D9307
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 18:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161719.296796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8mGd-0004Xh-5z; Wed, 28 Jul 2021 16:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161719.296796; Wed, 28 Jul 2021 16:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8mGd-0004Vr-1T; Wed, 28 Jul 2021 16:18:47 +0000
Received: by outflank-mailman (input) for mailman id 161719;
 Wed, 28 Jul 2021 16:18:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tdfR=MU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1m8mGa-0004Vl-L6
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 16:18:44 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5beb3372-ab88-4787-88f7-41a3e87d78bf;
 Wed, 28 Jul 2021 16:18:42 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h14so4981335lfv.7
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jul 2021 09:18:42 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l11sm42162lfe.81.2021.07.28.09.18.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Jul 2021 09:18:40 -0700 (PDT)
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
X-Inumbo-ID: 5beb3372-ab88-4787-88f7-41a3e87d78bf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=rtGLTu5WvJzmoeG/lwD0OT0TkFZgPNP86HNxh5o9df8=;
        b=rnO6c2ykGqTjVwp0adatoazyLFibHkPlLjIUAv+1awif/EAtqlS5t4h9dx2i/c0HGe
         WUegkUfiWDJf2MBsoZrN6QH/tJqr0hIiXFJEcB5DDPRpUcseKJgBL0sQElczGUPvtoEd
         bwKHEXYkK9Uk0DX4sI6vCCtgEwv45sMY6W0TbmhwIQUpyVowy5f8gBbconAO7OXV2TEt
         cyMBREqcSLvtdd9LxlufuuEPd+8eJ8T7RokXtMYCAgmH42DfUoZeCWWnRqC3NOKRZkGa
         y6Kf7paNA2llnOc223En7BWFV2OmqZyuW4/RXptDUFjR7ljzaEvqsIfcJCkBYbiwq5N7
         L13w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=rtGLTu5WvJzmoeG/lwD0OT0TkFZgPNP86HNxh5o9df8=;
        b=DjqlY3rr+8+C9lJ8buVEILJD1UIrp5W7MuKBYvoLwujaBKhV4APnJS/Dnma8eCDqAb
         UcgftXKrpUBgESIsUdK8yOOvjqNuyOt13tllZsoqW4q0Dt1MENoKJi9TMhcvqxDCE8kS
         82auZjLqYu01mSVxxSaR3TL40hyrtHXajccSt5jfUd/tT6v8UTia657wC5MomdsIa/1Y
         2ZfFl5BGqqqlUTyPRAoZreUa4i/mU+YWwTzg4mF5CaVbOK46N88ii3rZoGWALPhAtEbv
         YYMLhcnNL5WtXdg4RgYrd8BPu1zc1YPyHGsTTp5WjygPzBRtR2n7ptq6AsV3bizg1s/6
         pULA==
X-Gm-Message-State: AOAM532/K9wfmdA59QhIb2gR4qJqPgoNXeuC1YaEwd2I+sc5/T6XHZQG
	DFWgDxQ8v1WN+LUoY4Y5hEMF5s3BJ3/AWA==
X-Google-Smtp-Source: ABdhPJxPD7fsfzyaGAZntl1DcujeDcyCVVt2C/C+VBwoRnt6YfPoCitxO/mksH7RWWWaOkP9Udi+sA==
X-Received: by 2002:a05:6512:3237:: with SMTP id f23mr290323lfe.524.1627489120885;
        Wed, 28 Jul 2021 09:18:40 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: [RFC PATCH] xen/memory: Introduce a hypercall to provide unallocated space
Date: Wed, 28 Jul 2021 19:18:30 +0300
Message-Id: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Add XENMEM_get_unallocated_space hypercall which purpose is to
query hypervisor to find regions of guest physical address space
which are unused and can be used to create grant/foreign mappings
instead of wasting real pages from the domain memory for
establishing these mappings. The problem with the current Linux
on Xen on Arm behaviour is if we want to map some guest memory
regions in advance or to perform cache mappings in the backend
we might run out of memory in the host (see XSA-300).
This of course, depends on the both host and guest memory sizes.

The "unallocated space" can't be figured out precisely by
the domain on Arm without hypervisor involvement:
- not all device I/O regions are known by the time domain starts
  creating grant/foreign mappings
- the Dom0 is not aware of memory regions used for the identity
  mappings needed for the PV drivers to work
In both cases we might end up re-using these regions by
a mistake. So, the hypervisor which maintains the P2M for the domain
is in the best position to provide "unallocated space".

The arch code is in charge of finding these regions and filling
in corresponding array in new helper arch_get_unallocated_space().

This patch implements common and Arm parts, the x86 specific bits
are left uniplemented for now.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Current patch is based on the latest staging branch:
73c932d tools/libxc: use uint32_t for pirq in xc_domain_irq_permission
and also available at:
https://github.com/otyshchenko1/xen/commits/map_opt_ml1

The corresponding Linux changes you can find at:
https://github.com/otyshchenko1/linux/commits/map_opt_ml1
I am going to publish them soon.
---
 tools/flask/policy/modules/dom0.te  |  2 +-
 xen/arch/arm/mm.c                   | 18 ++++++++++++
 xen/common/memory.c                 | 56 +++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/mm.h            |  4 +++
 xen/include/asm-x86/mm.h            |  8 ++++++
 xen/include/public/memory.h         | 37 +++++++++++++++++++++++-
 xen/include/xsm/dummy.h             |  6 ++++
 xen/include/xsm/xsm.h               |  6 ++++
 xen/xsm/dummy.c                     |  1 +
 xen/xsm/flask/hooks.c               |  6 ++++
 xen/xsm/flask/policy/access_vectors |  2 ++
 11 files changed, 144 insertions(+), 2 deletions(-)

diff --git a/tools/flask/policy/modules/dom0.te b/tools/flask/policy/modules/dom0.te
index 0a63ce1..b40091f 100644
--- a/tools/flask/policy/modules/dom0.te
+++ b/tools/flask/policy/modules/dom0.te
@@ -39,7 +39,7 @@ allow dom0_t dom0_t:domain {
 };
 allow dom0_t dom0_t:domain2 {
 	set_cpu_policy gettsc settsc setscheduler set_vnumainfo
-	get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy
+	get_vnumainfo psr_cmt_op psr_alloc get_cpu_policy get_unallocated_space
 };
 allow dom0_t dom0_t:resource { add remove };
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0e07335..8a70fe0 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1635,6 +1635,24 @@ unsigned long get_upper_mfn_bound(void)
     return max_page - 1;
 }
 
+#define GPFN_ALIGN_TO_GB(x) (((x) + (1UL << 18) - 1) & (~((1UL << 18) - 1)))
+
+int arch_get_unallocated_space(struct domain *d,
+                               struct xen_unallocated_region *regions,
+                               unsigned int *nr_regions)
+{
+    /*
+     * Everything not mapped into P2M could be treated as unused. Taking into
+     * the account that we have a lot of unallocated space above max_mapped_gfn
+     * and in order to simplify things, just provide a single 8GB memory
+     * region aligned to 1GB boundary for now.
+     */
+    regions->start_gpfn = GPFN_ALIGN_TO_GB(domain_get_maximum_gpfn(d) + 1);
+    regions->nr_gpfns = (1UL << 18) * 8;
+    *nr_regions = 1;
+
+    return 0;
+}
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/memory.c b/xen/common/memory.c
index e07bd9a..3f9b816 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1811,6 +1811,62 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             start_extent);
         break;
 
+    case XENMEM_get_unallocated_space:
+    {
+        struct xen_get_unallocated_space xgus;
+        struct xen_unallocated_region *regions;
+
+        if ( unlikely(start_extent) )
+            return -EINVAL;
+
+        if ( copy_from_guest(&xgus, arg, 1) ||
+             !guest_handle_okay(xgus.buffer, xgus.nr_regions) )
+            return -EFAULT;
+
+        d = rcu_lock_domain_by_any_id(xgus.domid);
+        if ( d == NULL )
+            return -ESRCH;
+
+        rc = xsm_get_unallocated_space(XSM_HOOK, d);
+        if ( rc )
+        {
+            rcu_unlock_domain(d);
+            return rc;
+        }
+
+        if ( !xgus.nr_regions || xgus.nr_regions > XEN_MAX_UNALLOCATED_REGIONS )
+        {
+            rcu_unlock_domain(d);
+            return -EINVAL;
+        }
+
+        regions = xzalloc_array(struct xen_unallocated_region, xgus.nr_regions);
+        if ( !regions )
+        {
+            rcu_unlock_domain(d);
+            return -ENOMEM;
+        }
+
+        rc = arch_get_unallocated_space(d, regions, &xgus.nr_regions);
+        if ( rc )
+            goto unallocated_out;
+
+        if ( __copy_to_guest(xgus.buffer, regions, xgus.nr_regions) )
+        {
+            rc = -EFAULT;
+            goto unallocated_out;
+        }
+
+        if ( __copy_to_guest(arg, &xgus, 1) )
+            rc = -EFAULT;
+
+unallocated_out:
+        rcu_unlock_domain(d);
+        xfree(regions);
+
+        break;
+    }
+
     default:
         rc = arch_memory_op(cmd, arg);
         break;
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index ded74d2..99a2824 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -359,6 +359,10 @@ void clear_and_clean_page(struct page_info *page);
 
 unsigned int arch_get_dma_bitsize(void);
 
+int arch_get_unallocated_space(struct domain *d,
+                               struct xen_unallocated_region *regions,
+                               unsigned int *nr_regions);
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index cb90527..6244bc4 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -652,4 +652,12 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
     return mfn <= (virt_to_mfn(eva - 1) + 1);
 }
 
+static inline
+int arch_get_unallocated_space(struct domain *d,
+                               struct xen_unallocated_region *regions,
+                               unsigned int *nr_regions)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 383a946..040201b 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -739,7 +739,42 @@ struct xen_vnuma_topology_info {
 typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
 DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
 
-/* Next available subop number is 29 */
+/*
+ * Get the unallocated space (regions of guest physical address space which
+ * are unused) and can be used to create grant/foreign mappings.
+ */
+#define XENMEM_get_unallocated_space 29
+struct xen_unallocated_region {
+    xen_pfn_t start_gpfn;
+    xen_ulong_t nr_gpfns;
+};
+typedef struct xen_unallocated_region xen_unallocated_region_t;
+DEFINE_XEN_GUEST_HANDLE(xen_unallocated_region_t);
+
+#define XEN_MAX_UNALLOCATED_REGIONS 32
+
+struct xen_get_unallocated_space {
+    /* IN - Which domain to provide unallocated space for */
+    domid_t domid;
+
+    /*
+     * IN/OUT - As an IN parameter number of memory regions which
+     *          can be written to the buffer (maximum size of the array)
+     *          As OUT parameter number of memory regions which
+     *          have been written to the buffer
+     */
+    unsigned int nr_regions;
+
+    /*
+     * OUT - An array of memory regions, the regions must be placed in
+     *       ascending order, there must be no overlap between them.
+     */
+    XEN_GUEST_HANDLE(xen_unallocated_region_t) buffer;
+};
+typedef struct xen_get_unallocated_space xen_get_unallocated_space_t;
+DEFINE_XEN_GUEST_HANDLE(xen_get_unallocated_space_t);
+
+/* Next available subop number is 30 */
 
 #endif /* __XEN_PUBLIC_MEMORY_H__ */
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 363c6d7..2761fbd 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -772,3 +772,9 @@ static XSM_INLINE int xsm_domain_resource_map(XSM_DEFAULT_ARG struct domain *d)
     XSM_ASSERT_ACTION(XSM_DM_PRIV);
     return xsm_default_action(action, current->domain, d);
 }
+
+static XSM_INLINE int xsm_get_unallocated_space(XSM_DEFAULT_ARG struct domain *d)
+{
+    XSM_ASSERT_ACTION(XSM_HOOK);
+    return xsm_default_action(action, current->domain, d);
+}
diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
index ad3cddb..b01619c 100644
--- a/xen/include/xsm/xsm.h
+++ b/xen/include/xsm/xsm.h
@@ -180,6 +180,7 @@ struct xsm_operations {
     int (*dm_op) (struct domain *d);
     int (*xen_version) (uint32_t cmd);
     int (*domain_resource_map) (struct domain *d);
+    int (*get_unallocated_space) (struct domain *d);
 #ifdef CONFIG_ARGO
     int (*argo_enable) (const struct domain *d);
     int (*argo_register_single_source) (const struct domain *d,
@@ -701,6 +702,11 @@ static inline int xsm_domain_resource_map(xsm_default_t def, struct domain *d)
     return xsm_ops->domain_resource_map(d);
 }
 
+static inline int xsm_get_unallocated_space(xsm_default_t def, struct domain *d)
+{
+    return xsm_ops->get_unallocated_space(d);
+}
+
 #ifdef CONFIG_ARGO
 static inline int xsm_argo_enable(const struct domain *d)
 {
diff --git a/xen/xsm/dummy.c b/xen/xsm/dummy.c
index de44b10..45efadb 100644
--- a/xen/xsm/dummy.c
+++ b/xen/xsm/dummy.c
@@ -151,6 +151,7 @@ void __init xsm_fixup_ops (struct xsm_operations *ops)
     set_to_dummy_if_null(ops, dm_op);
     set_to_dummy_if_null(ops, xen_version);
     set_to_dummy_if_null(ops, domain_resource_map);
+    set_to_dummy_if_null(ops, get_unallocated_space);
 #ifdef CONFIG_ARGO
     set_to_dummy_if_null(ops, argo_enable);
     set_to_dummy_if_null(ops, argo_register_single_source);
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index f1a1217..38a9b20 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1715,6 +1715,11 @@ static int flask_domain_resource_map(struct domain *d)
     return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__RESOURCE_MAP);
 }
 
+static int flask_get_unallocated_space(struct domain *d)
+{
+    return current_has_perm(d, SECCLASS_DOMAIN2, DOMAIN2__GET_UNALLOCATED_SPACE);
+}
+
 #ifdef CONFIG_ARGO
 static int flask_argo_enable(const struct domain *d)
 {
@@ -1875,6 +1880,7 @@ static struct xsm_operations flask_ops = {
     .dm_op = flask_dm_op,
     .xen_version = flask_xen_version,
     .domain_resource_map = flask_domain_resource_map,
+    .get_unallocated_space = flask_get_unallocated_space,
 #ifdef CONFIG_ARGO
     .argo_enable = flask_argo_enable,
     .argo_register_single_source = flask_argo_register_single_source,
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index 6359c7f..3cbdc19 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -245,6 +245,8 @@ class domain2
     resource_map
 # XEN_DOMCTL_get_cpu_policy
     get_cpu_policy
+# XENMEM_get_unallocated_space
+    get_unallocated_space
 }
 
 # Similar to class domain, but primarily contains domctls related to HVM domains
-- 
2.7.4


