Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62AA19F8BF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 17:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLTYC-0006Bu-JO; Mon, 06 Apr 2020 15:20:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rOh1=5W=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jLTYB-0006Bl-2o
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 15:20:35 +0000
X-Inumbo-ID: 259c7fcc-781a-11ea-b4f4-bc764e2007e4
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 259c7fcc-781a-11ea-b4f4-bc764e2007e4;
 Mon, 06 Apr 2020 15:20:28 +0000 (UTC)
IronPort-SDR: 5Ytmwc35Ff1HNhDdbajRk2vpL68TBqYP5rBDztSeYXeZB9ntEENuzEsq0nWbop99vh/5Yd4s4v
 Rp18rsf7Savw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 08:20:28 -0700
IronPort-SDR: C1kEkknVL+EwGT4VssxJpsPEQS+PS07Nltr3u13rfjHwpSma1aBBw79siZXBFXG0oT2oKJJBAV
 l/Jwj32/Cmgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; d="scan'208";a="269107418"
Received: from jreyna-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.25.73])
 by orsmga002.jf.intel.com with ESMTP; 06 Apr 2020 08:20:25 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v14 1/3] xen/mem_sharing: VM forking
Date: Mon,  6 Apr 2020 08:20:03 -0700
Message-Id: <423e48743b969f2fe65c1101e32cc1c958912c99.1586185752.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1586185752.git.tamas.lengyel@intel.com>
References: <cover.1586185752.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VM forking is the process of creating a domain with an empty memory space and a
parent domain specified from which to populate the memory when necessary. For
the new domain to be functional the VM state is copied over as part of the fork
operation (HVM params, hap allocation, etc).

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v14: constify some function inputs
     minor fixes pointed out by Roger
---
 xen/arch/x86/domain.c             |  13 ++
 xen/arch/x86/hvm/hvm.c            |   4 +-
 xen/arch/x86/mm/hap/hap.c         |   3 +-
 xen/arch/x86/mm/mem_sharing.c     | 342 ++++++++++++++++++++++++++++++
 xen/arch/x86/mm/p2m.c             |   9 +-
 xen/include/asm-arm/page.h        |   1 +
 xen/include/asm-x86/hap.h         |   1 +
 xen/include/asm-x86/hvm/hvm.h     |   2 +
 xen/include/asm-x86/mem_sharing.h |  18 ++
 xen/include/asm-x86/page.h        |   1 +
 xen/include/public/memory.h       |   5 +
 xen/include/xen/sched.h           |   1 +
 12 files changed, 395 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 683bc619aa..a008d7df1c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2211,6 +2211,19 @@ int domain_relinquish_resources(struct domain *d)
             ret = relinquish_shared_pages(d);
             if ( ret )
                 return ret;
+
+            /*
+             * If the domain is forked, decrement the parent's pause count
+             * and release the domain.
+             */
+            if ( mem_sharing_is_fork(d) )
+            {
+                struct domain *parent = d->parent;
+
+                d->parent = NULL;
+                domain_unpause(parent);
+                put_domain(parent);
+            }
         }
 #endif
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index a3d115b650..304b3d1562 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1917,7 +1917,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
     }
 #endif
 
-    /* Spurious fault? PoD and log-dirty also take this path. */
+    /* Spurious fault? PoD, log-dirty and VM forking also take this path. */
     if ( p2m_is_ram(p2mt) )
     {
         rc = 1;
@@ -4377,7 +4377,7 @@ static int hvm_allow_get_param(struct domain *d,
     return rc;
 }
 
-static int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
+int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value)
 {
     int rc;
 
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index a6d5e39b02..814d0c3253 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -321,8 +321,7 @@ static void hap_free_p2m_page(struct domain *d, struct page_info *pg)
 }
 
 /* Return the size of the pool, rounded up to the nearest MB */
-static unsigned int
-hap_get_allocation(struct domain *d)
+unsigned int hap_get_allocation(struct domain *d)
 {
     unsigned int pg = d->arch.paging.hap.total_pages
         + d->arch.paging.hap.p2m_pages;
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index f49f27a3ef..64cd706e5a 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -22,6 +22,7 @@
 
 #include <xen/types.h>
 #include <xen/domain_page.h>
+#include <xen/event.h>
 #include <xen/spinlock.h>
 #include <xen/rwlock.h>
 #include <xen/mm.h>
@@ -36,6 +37,8 @@
 #include <asm/altp2m.h>
 #include <asm/atomic.h>
 #include <asm/event.h>
+#include <asm/hap.h>
+#include <asm/hvm/hvm.h>
 #include <xsm/xsm.h>
 
 #include "mm-locks.h"
@@ -1443,6 +1446,309 @@ static inline int mem_sharing_control(struct domain *d, bool enable)
     return 0;
 }
 
+/*
+ * Forking a page only gets called when the VM faults due to no entry being
+ * in the EPT for the access. Depending on the type of access we either
+ * populate the physmap with a shared entry for read-only access or
+ * fork the page if its a write access.
+ *
+ * The client p2m is already locked so we only need to lock
+ * the parent's here.
+ */
+int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
+{
+    int rc = -ENOENT;
+    shr_handle_t handle;
+    struct domain *parent = d->parent;
+    struct p2m_domain *p2m;
+    unsigned long gfn_l = gfn_x(gfn);
+    mfn_t mfn, new_mfn;
+    p2m_type_t p2mt;
+    struct page_info *page;
+
+    if ( !mem_sharing_is_fork(d) )
+        return -ENOENT;
+
+    if ( !unsharing )
+    {
+        /* For read-only accesses we just add a shared entry to the physmap */
+        while ( parent )
+        {
+            if ( !(rc = nominate_page(parent, gfn, 0, &handle)) )
+                break;
+
+            parent = parent->parent;
+        }
+
+        if ( !rc )
+        {
+            /* The client's p2m is already locked */
+            p2m = p2m_get_hostp2m(parent);
+
+            p2m_lock(p2m);
+            rc = add_to_physmap(parent, gfn_l, handle, d, gfn_l, false);
+            p2m_unlock(p2m);
+
+            if ( !rc )
+                return 0;
+        }
+    }
+
+    /*
+     * If it's a write access (ie. unsharing) or if adding a shared entry to
+     * the physmap failed we'll fork the page directly.
+     */
+    p2m = p2m_get_hostp2m(d);
+    parent = d->parent;
+
+    while ( parent )
+    {
+        mfn = get_gfn_query(parent, gfn_l, &p2mt);
+
+        /* We can't fork grant memory from the parent, only regular ram */
+        if ( mfn_valid(mfn) && p2m_is_ram(p2mt) )
+            break;
+
+        put_gfn(parent, gfn_l);
+        parent = parent->parent;
+    }
+
+    if ( !parent )
+        return -ENOENT;
+
+    if ( !(page = alloc_domheap_page(d, 0)) )
+    {
+        put_gfn(parent, gfn_l);
+        return -ENOMEM;
+    }
+
+    new_mfn = page_to_mfn(page);
+    copy_domain_page(new_mfn, mfn);
+    set_gpfn_from_mfn(mfn_x(new_mfn), gfn_l);
+
+    put_gfn(parent, gfn_l);
+
+    return p2m->set_entry(p2m, gfn, new_mfn, PAGE_ORDER_4K, p2m_ram_rw,
+                          p2m->default_access, -1);
+}
+
+static int bring_up_vcpus(struct domain *cd, struct domain *d)
+{
+    unsigned int i;
+    int ret = -EINVAL;
+
+    if ( d->max_vcpus != cd->max_vcpus ||
+        (ret = cpupool_move_domain(cd, d->cpupool)) )
+        return ret;
+
+    for ( i = 0; i < cd->max_vcpus; i++ )
+    {
+        if ( !d->vcpu[i] || cd->vcpu[i] )
+            continue;
+
+        if ( !vcpu_create(cd, i) )
+            return -EINVAL;
+    }
+
+    domain_update_node_affinity(cd);
+    return 0;
+}
+
+static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
+{
+    unsigned int i;
+    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
+    int ret = -EINVAL;
+
+    for ( i = 0; i < cd->max_vcpus; i++ )
+    {
+        const struct vcpu *d_vcpu = d->vcpu[i];
+        struct vcpu *cd_vcpu = cd->vcpu[i];
+        mfn_t vcpu_info_mfn;
+
+        if ( !d_vcpu || !cd_vcpu )
+            continue;
+
+        /* Copy & map in the vcpu_info page if the guest uses one */
+        vcpu_info_mfn = d_vcpu->vcpu_info_mfn;
+        if ( !mfn_eq(vcpu_info_mfn, INVALID_MFN) )
+        {
+            mfn_t new_vcpu_info_mfn = cd_vcpu->vcpu_info_mfn;
+
+            /* Allocate & map the page for it if it hasn't been already */
+            if ( mfn_eq(new_vcpu_info_mfn, INVALID_MFN) )
+            {
+                gfn_t gfn = mfn_to_gfn(d, vcpu_info_mfn);
+                unsigned long gfn_l = gfn_x(gfn);
+                struct page_info *page;
+
+                if ( !(page = alloc_domheap_page(cd, 0)) )
+                    return -ENOMEM;
+
+                new_vcpu_info_mfn = page_to_mfn(page);
+                set_gpfn_from_mfn(mfn_x(new_vcpu_info_mfn), gfn_l);
+
+                ret = p2m->set_entry(p2m, gfn, new_vcpu_info_mfn,
+                                     PAGE_ORDER_4K, p2m_ram_rw,
+                                     p2m->default_access, -1);
+                if ( ret )
+                    return ret;
+
+                ret = map_vcpu_info(cd_vcpu, gfn_l,
+                                    PAGE_OFFSET(d_vcpu->vcpu_info));
+                if ( ret )
+                    return ret;
+            }
+
+            copy_domain_page(new_vcpu_info_mfn, vcpu_info_mfn);
+        }
+
+        /*
+         * TODO: to support VMs with PV interfaces copy additional
+         * settings here, such as PV timers.
+         */
+    }
+
+    return 0;
+}
+
+static int fork_hap_allocation(struct domain *cd, struct domain *d)
+{
+    int rc;
+    bool preempted;
+    unsigned long mb = hap_get_allocation(d);
+
+    if ( mb == hap_get_allocation(cd) )
+        return 0;
+
+    paging_lock(cd);
+    rc = hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempted);
+    paging_unlock(cd);
+
+    return preempted ? -ERESTART : rc;
+}
+
+static void copy_tsc(struct domain *cd, struct domain *d)
+{
+    uint32_t tsc_mode;
+    uint32_t gtsc_khz;
+    uint32_t incarnation;
+    uint64_t elapsed_nsec;
+
+    tsc_get_info(d, &tsc_mode, &elapsed_nsec, &gtsc_khz, &incarnation);
+    /* Don't bump incarnation on set */
+    tsc_set_info(cd, tsc_mode, elapsed_nsec, gtsc_khz, incarnation - 1);
+}
+
+static int copy_special_pages(struct domain *cd, struct domain *d)
+{
+    mfn_t new_mfn, old_mfn;
+    struct p2m_domain *p2m = p2m_get_hostp2m(cd);
+    static const unsigned int params[] =
+    {
+        HVM_PARAM_STORE_PFN,
+        HVM_PARAM_IOREQ_PFN,
+        HVM_PARAM_BUFIOREQ_PFN,
+        HVM_PARAM_CONSOLE_PFN
+    };
+    unsigned int i;
+    int rc;
+
+    for ( i = 0; i < ARRAY_SIZE(params); i++ )
+    {
+        p2m_type_t t;
+        uint64_t value = 0;
+        struct page_info *page;
+
+        if ( hvm_get_param(d, params[i], &value) || !value )
+            continue;
+
+        old_mfn = get_gfn_query_unlocked(d, value, &t);
+        new_mfn = get_gfn_query_unlocked(cd, value, &t);
+
+        /* Allocate the page and map it in if it's not present */
+        if ( mfn_eq(new_mfn, INVALID_MFN) )
+        {
+            if ( !(page = alloc_domheap_page(cd, 0)) )
+                return -ENOMEM;
+
+            new_mfn = page_to_mfn(page);
+            set_gpfn_from_mfn(mfn_x(new_mfn), value);
+
+            rc = p2m->set_entry(p2m, _gfn(value), new_mfn, PAGE_ORDER_4K,
+                                p2m_ram_rw, p2m->default_access, -1);
+            if ( rc )
+                return rc;
+        }
+
+        copy_domain_page(new_mfn, old_mfn);
+    }
+
+    old_mfn = _mfn(virt_to_mfn(d->shared_info));
+    new_mfn = _mfn(virt_to_mfn(cd->shared_info));
+    copy_domain_page(new_mfn, old_mfn);
+
+    return 0;
+}
+
+static int copy_settings(struct domain *cd, struct domain *d)
+{
+    int rc;
+
+    if ( (rc = copy_vcpu_settings(cd, d)) )
+        return rc;
+
+    if ( (rc = hvm_copy_context_and_params(cd, d)) )
+        return rc;
+
+    if ( (rc = copy_special_pages(cd, d)) )
+        return rc;
+
+    copy_tsc(cd, d);
+
+    return rc;
+}
+
+static int fork(struct domain *cd, struct domain *d)
+{
+    int rc = -EBUSY;
+
+    if ( !cd->controller_pause_count )
+        return rc;
+
+    if ( !cd->parent )
+    {
+        if ( !get_domain(d) )
+        {
+            ASSERT_UNREACHABLE();
+            return -EBUSY;
+        }
+
+        domain_pause(d);
+        cd->max_pages = d->max_pages;
+        cd->parent = d;
+    }
+
+    /* This is preemptible so it's the first to get done */
+    if ( (rc = fork_hap_allocation(cd, d)) )
+        goto done;
+
+    if ( (rc = bring_up_vcpus(cd, d)) )
+        goto done;
+
+    rc = copy_settings(cd, d);
+
+ done:
+    if ( rc && rc != -ERESTART )
+    {
+        domain_unpause(d);
+        put_domain(d);
+        cd->parent = NULL;
+    }
+
+    return rc;
+}
+
 int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
 {
     int rc;
@@ -1697,6 +2003,42 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         rc = debug_gref(d, mso.u.debug.u.gref);
         break;
 
+    case XENMEM_sharing_op_fork:
+    {
+        struct domain *pd;
+
+        rc = -EINVAL;
+        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] || mso.u.fork.pad[2] )
+            goto out;
+
+        rc = rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domain,
+                                               &pd);
+        if ( rc )
+            goto out;
+
+        rc = -EINVAL;
+        if ( pd->max_vcpus != d->max_vcpus )
+        {
+            rcu_unlock_domain(pd);
+            goto out;
+        }
+
+        if ( !mem_sharing_enabled(pd) && (rc = mem_sharing_control(pd, true)) )
+        {
+            rcu_unlock_domain(pd);
+            goto out;
+        }
+
+        rc = fork(d, pd);
+
+        if ( rc == -ERESTART )
+            rc = hypercall_create_continuation(__HYPERVISOR_memory_op,
+                                               "lh", XENMEM_sharing_op,
+                                               arg);
+        rcu_unlock_domain(pd);
+        break;
+    }
+
     default:
         rc = -ENOSYS;
         break;
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 3c052de606..b8727e267d 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -509,6 +509,12 @@ mfn_t __get_gfn_type_access(struct p2m_domain *p2m, unsigned long gfn_l,
 
     mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
 
+    /* Check if we need to fork the page */
+    if ( (q & P2M_ALLOC) && p2m_is_hole(*t) &&
+         !mem_sharing_fork_page(p2m->domain, gfn, q & P2M_UNSHARE) )
+        mfn = p2m->get_entry(p2m, gfn, t, a, q, page_order, NULL);
+
+    /* Check if we need to unshare the page */
     if ( (q & P2M_UNSHARE) && p2m_is_shared(*t) )
     {
         ASSERT(p2m_is_hostp2m(p2m));
@@ -588,7 +594,8 @@ struct page_info *p2m_get_page_from_gfn(
             return page;
 
         /* Error path: not a suitable GFN at all */
-        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) )
+        if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) &&
+             !mem_sharing_is_fork(p2m->domain) )
             return NULL;
     }
 
diff --git a/xen/include/asm-arm/page.h b/xen/include/asm-arm/page.h
index 37e1d9aadb..4ea8e97247 100644
--- a/xen/include/asm-arm/page.h
+++ b/xen/include/asm-arm/page.h
@@ -12,6 +12,7 @@
 #define PADDR_BITS              40
 #endif
 #define PADDR_MASK              ((1ULL << PADDR_BITS)-1)
+#define PAGE_OFFSET(ptr)        ((vaddr_t)(ptr) & ~PAGE_MASK)
 
 #define VADDR_BITS              32
 #define VADDR_MASK              (~0UL)
diff --git a/xen/include/asm-x86/hap.h b/xen/include/asm-x86/hap.h
index b94bfb4ed0..1bf07e49fe 100644
--- a/xen/include/asm-x86/hap.h
+++ b/xen/include/asm-x86/hap.h
@@ -45,6 +45,7 @@ int   hap_track_dirty_vram(struct domain *d,
 
 extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
+unsigned int hap_get_allocation(struct domain *d);
 
 #endif /* XEN_HAP_H */
 
diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
index b007b2e343..f283c7d187 100644
--- a/xen/include/asm-x86/hvm/hvm.h
+++ b/xen/include/asm-x86/hvm/hvm.h
@@ -336,6 +336,8 @@ unsigned long hvm_cr4_guest_valid_bits(const struct domain *d, bool restore);
 
 int hvm_copy_context_and_params(struct domain *src, struct domain *dst);
 
+int hvm_get_param(struct domain *d, uint32_t index, uint64_t *value);
+
 #ifdef CONFIG_HVM
 
 #define hvm_get_guest_tsc(v) hvm_get_guest_tsc_fixed(v, 0)
diff --git a/xen/include/asm-x86/mem_sharing.h b/xen/include/asm-x86/mem_sharing.h
index 53b7929d0e..cf7a12f4d2 100644
--- a/xen/include/asm-x86/mem_sharing.h
+++ b/xen/include/asm-x86/mem_sharing.h
@@ -77,6 +77,14 @@ static inline int mem_sharing_unshare_page(struct domain *d,
     return rc;
 }
 
+static inline bool mem_sharing_is_fork(const struct domain *d)
+{
+    return d->parent;
+}
+
+int mem_sharing_fork_page(struct domain *d, gfn_t gfn,
+                          bool unsharing);
+
 /*
  * If called by a foreign domain, possible errors are
  *   -EBUSY -> ring full
@@ -130,6 +138,16 @@ static inline int mem_sharing_notify_enomem(struct domain *d, unsigned long gfn,
     return -EOPNOTSUPP;
 }
 
+static inline bool mem_sharing_is_fork(const struct domain *d)
+{
+    return false;
+}
+
+static inline int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool lock)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif
 
 #endif /* __MEM_SHARING_H__ */
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index c98d8f5ede..eb73a0fc23 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -10,6 +10,7 @@
 #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
 #define PAGE_MASK           (~(PAGE_SIZE-1))
 #define PAGE_FLAG_MASK      (~0)
+#define PAGE_OFFSET(ptr)    ((unsigned long)(ptr) & ~PAGE_MASK)
 
 #define PAGE_ORDER_4K       0
 #define PAGE_ORDER_2M       9
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 126d0ff06e..5ee4e0da12 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -482,6 +482,7 @@ DEFINE_XEN_GUEST_HANDLE(xen_mem_access_op_t);
 #define XENMEM_sharing_op_add_physmap       6
 #define XENMEM_sharing_op_audit             7
 #define XENMEM_sharing_op_range_share       8
+#define XENMEM_sharing_op_fork              9
 
 #define XENMEM_SHARING_OP_S_HANDLE_INVALID  (-10)
 #define XENMEM_SHARING_OP_C_HANDLE_INVALID  (-9)
@@ -532,6 +533,10 @@ struct xen_mem_sharing_op {
                 uint32_t gref;     /* IN: gref to debug         */
             } u;
         } debug;
+        struct mem_sharing_op_fork {      /* OP_FORK */
+            domid_t parent_domain;        /* IN: parent's domain id */
+            uint16_t pad[3];              /* Must be set to 0 */
+        } fork;
     } u;
 };
 typedef struct xen_mem_sharing_op xen_mem_sharing_op_t;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 4b78291d51..195e7ee583 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -481,6 +481,7 @@ struct domain
     /* Memory sharing support */
 #ifdef CONFIG_MEM_SHARING
     struct vm_event_domain *vm_event_share;
+    struct domain *parent; /* VM fork parent */
 #endif
     /* Memory paging support */
 #ifdef CONFIG_HAS_MEM_PAGING
-- 
2.20.1


