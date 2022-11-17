Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A6162D064
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 02:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444451.699694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovTOD-0002m7-7t; Thu, 17 Nov 2022 01:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444451.699694; Thu, 17 Nov 2022 01:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovTOD-0002ii-2h; Thu, 17 Nov 2022 01:08:25 +0000
Received: by outflank-mailman (input) for mailman id 444451;
 Thu, 17 Nov 2022 01:08:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BOBv=3R=citrix.com=prvs=31353e2df=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ovTOB-0002f1-Cd
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 01:08:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51beb88b-6614-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 02:08:19 +0100 (CET)
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
X-Inumbo-ID: 51beb88b-6614-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668647299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5f7lo/vfS1azSCVrGCLN6cgm1Xi1cZ6LYp1mvu+q1ws=;
  b=CaNKTYg0hgx2kyfMfcaooQDgzoLlssrL3LLBc75kiFksISnCUSvsVLC1
   Eh88vOSYgR2WmvMKq35Aqso2ElvxteQXaa3WoUkSf6P7hwQSQ45Nxc0Rs
   OkwQeUl794r6sRY4ZPP/a+jsjAKzCjNOZ02Bp4F5TO/2l7MBJiBVRdx0k
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 84572755
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UDwTsKxHphyhu4Ikavx6t+fDxirEfRIJ4+MujC+fZmUNrF6WrkUAy
 GodD2HSOfmIYGvxL9B+bI3g9EwH6sOBnYJjTAVq/CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVnPK4T5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KVtz9
 KQ/IwxQVQug2ryKmZidQ/Qyg/12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFZkIwRzH+
 z+uE2LRCVIoLOa80xq5/H+yufaTuAXaV74rG+jtnhJtqALKnTFCYPEMbnOFpv2+hl+7SshoA
 UUe8SozroA/7EWuCNL6WnWQomOAvxMac8pdFas98g7l4qDZ+RqDD24ICDtIcsU7tdQeTCYvk
 FSOmrvBJTFpqqzTdnub+Z+dtzb0Mi8QRUcZfjMNRwYB59jloakwgwjJQ9IlF7S65vXlFDe1z
 z2UoSwWg7QIkdVNx6i95UrAgT+nut7OVAFdzif9U3+h7wh5TJW4fIHu4l/ehd5fKK6JQ1/Hu
 2IL8/Vy98hXU8vLznbUBrxQQvf5vJ5pLQEwn3ZVIph50D+RpkW4Xt0O3GhUAk50bMM9LGqBj
 FDohStd45paPX2PZKBxYp6sB8lC8ZUMBegJRdiPMIMQP8EZmBuvuXg3OBXOhzyFfF0Ey/lXB
 HuNTSq74Z/244xDxSH+eeoS2KRDKssWlTKKHsCTI/hKPNOjiJ+ppVUtagXmggMRtvnsTODpH
 zF3aaO3J+13CrGWX8Uu2dd7wJBjBSFT6WrKg8JWbPWfBQFtBXssDfTcqZt4JdI1wf4OyriSo
 C7nMqO99LYZrSaeQeltQik9AI4DoL4l9S5rVcDSFQvAN4cfjXaHs/5EKspfkUgP/+1/1/9kJ
 8TpiO3Zasmii13vpVwgUHUKhNw4JU711FzVbkJIolEXJvZdeuAAwfe8FiOHycXEJnPfWRcWy
 1F46j7mfA==
IronPort-HdrOrdr: A9a23:/oB0iqp3Mhf7wlVGfsVBRUcaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsyMc6QxhP03I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkGNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.96,169,1665460800"; 
   d="scan'208";a="84572755"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/4] xen: Introduce non-broken hypercalls for the paging mempool size
Date: Thu, 17 Nov 2022 01:08:01 +0000
Message-ID: <20221117010804.9384-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221117010804.9384-1-andrew.cooper3@citrix.com>
References: <20221117010804.9384-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The existing XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION have problems:

 * All set_allocation() flavours have an overflow-before-widen bug when
   calculating "sc->mb << (20 - PAGE_SHIFT)".
 * All flavours have a granularity of 1M.  This was tolerable when the size of
   the pool could only be set at the same granularity, but is broken now that
   ARM has a 16-page stopgap allocation in use.
 * All get_allocation() flavours round up, and in particular turn 0 into 1,
   meaning the get op returns junk before a successful set op.
 * The x86 flavours reject the hypercalls before the VM has vCPUs allocated,
   despite the pool size being a domain property.
 * Even the hypercall names are long-obsolete.

Implement a better interface, which can be first used to unit test the
behaviour, and subsequently correct a broken implementation.  The old
interface will be retired in due course.

The unit of bytes (as opposed pages) is a deliberate API/ABI improvement to
more easily support multiple page granularities.

This is part of XSA-409 / CVE-2022-33747.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-acked-by: Henry Wang <Henry.Wang@arm.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
CC: Anthony PERARD <anthony.perard@citrix.com>

v2:
 * s/p2m/paging/
 * Fix overflow-before-widen in ARM's arch_get_p2m_mempool_size()
 * Fix overflow-before-widen in both {hap,shadow}_get_allocation_bytes()
 * Leave a TODO about x86/PV, drop assertion.
 * Check for long->int truncation in x86's arch_set_paging_mempool_size()

Future TODOs:
 * x86 shadow still rounds up.  This is buggy as it's a simultaneous equation
   with tot_pages which varies over time with ballooning.
 * x86 PV is weird.  There are no toolstack interact with the shadow pool
   size, but the "shadow" pool it does come into existence when logdirty (or
   pv-l1tf) when first enabled.
 * The shadow+hap logic is in desperate need of deduping.
---
 tools/include/xenctrl.h           |  3 +++
 tools/libs/ctrl/xc_domain.c       | 29 ++++++++++++++++++++++++++
 xen/arch/arm/p2m.c                | 26 +++++++++++++++++++++++
 xen/arch/x86/include/asm/hap.h    |  1 +
 xen/arch/x86/include/asm/shadow.h |  4 ++++
 xen/arch/x86/mm/hap/hap.c         | 11 ++++++++++
 xen/arch/x86/mm/paging.c          | 43 +++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/mm/shadow/common.c   | 11 ++++++++++
 xen/common/domctl.c               | 14 +++++++++++++
 xen/include/public/domctl.h       | 24 +++++++++++++++++++++-
 xen/include/xen/domain.h          |  3 +++
 11 files changed, 168 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 0c8b4c3aa7a5..23037874d3d5 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -893,6 +893,9 @@ long long xc_logdirty_control(xc_interface *xch,
                               unsigned int mode,
                               xc_shadow_op_stats_t *stats);
 
+int xc_get_paging_mempool_size(xc_interface *xch, uint32_t domid, uint64_t *size);
+int xc_set_paging_mempool_size(xc_interface *xch, uint32_t domid, uint64_t size);
+
 int xc_sched_credit_domain_set(xc_interface *xch,
                                uint32_t domid,
                                struct xen_domctl_sched_credit *sdom);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 14c0420c35be..e939d0715739 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -706,6 +706,35 @@ long long xc_logdirty_control(xc_interface *xch,
     return (rc == 0) ? domctl.u.shadow_op.pages : rc;
 }
 
+int xc_get_paging_mempool_size(xc_interface *xch, uint32_t domid, uint64_t *size)
+{
+    int rc;
+    struct xen_domctl domctl = {
+        .cmd         = XEN_DOMCTL_get_paging_mempool_size,
+        .domain      = domid,
+    };
+
+    rc = do_domctl(xch, &domctl);
+    if ( rc )
+        return rc;
+
+    *size = domctl.u.paging_mempool.size;
+    return 0;
+}
+
+int xc_set_paging_mempool_size(xc_interface *xch, uint32_t domid, uint64_t size)
+{
+    struct xen_domctl domctl = {
+        .cmd         = XEN_DOMCTL_set_paging_mempool_size,
+        .domain      = domid,
+        .u.paging_mempool = {
+            .size = size,
+        },
+    };
+
+    return do_domctl(xch, &domctl);
+}
+
 int xc_domain_setmaxmem(xc_interface *xch,
                         uint32_t domid,
                         uint64_t max_memkb)
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 94d3b60b1387..8c1972e58227 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -100,6 +100,13 @@ unsigned int p2m_get_allocation(struct domain *d)
     return ROUNDUP(nr_pages, 1 << (20 - PAGE_SHIFT)) >> (20 - PAGE_SHIFT);
 }
 
+/* Return the size of the pool, in bytes. */
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    *size = (uint64_t)ACCESS_ONCE(d->arch.paging.p2m_total_pages) << PAGE_SHIFT;
+    return 0;
+}
+
 /*
  * Set the pool of pages to the required number of pages.
  * Returns 0 for success, non-zero for failure.
@@ -157,6 +164,25 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return 0;
 }
 
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    unsigned long pages = size >> PAGE_SHIFT;
+    bool preempted = false;
+    int rc;
+
+    if ( (size & ~PAGE_MASK) ||          /* Non page-sized request? */
+         pages != (size >> PAGE_SHIFT) ) /* 32-bit overflow? */
+        return -EINVAL;
+
+    spin_lock(&d->arch.paging.lock);
+    rc = p2m_set_allocation(d, pages, &preempted);
+    spin_unlock(&d->arch.paging.lock);
+
+    ASSERT(preempted == (rc == -ERESTART));
+
+    return rc;
+}
+
 int p2m_teardown_allocation(struct domain *d)
 {
     int ret = 0;
diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index 90dece29deca..14d2f212dab9 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -47,6 +47,7 @@ int   hap_track_dirty_vram(struct domain *d,
 extern const struct paging_mode *hap_paging_get_mode(struct vcpu *);
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
 unsigned int hap_get_allocation(struct domain *d);
+int hap_get_allocation_bytes(struct domain *d, uint64_t *size);
 
 #endif /* XEN_HAP_H */
 
diff --git a/xen/arch/x86/include/asm/shadow.h b/xen/arch/x86/include/asm/shadow.h
index 1365fe480518..dad876d29499 100644
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -97,6 +97,8 @@ void shadow_blow_tables_per_domain(struct domain *d);
 int shadow_set_allocation(struct domain *d, unsigned int pages,
                           bool *preempted);
 
+int shadow_get_allocation_bytes(struct domain *d, uint64_t *size);
+
 #else /* !CONFIG_SHADOW_PAGING */
 
 #define shadow_vcpu_teardown(v) ASSERT(is_pv_vcpu(v))
@@ -108,6 +110,8 @@ int shadow_set_allocation(struct domain *d, unsigned int pages,
     ({ ASSERT_UNREACHABLE(); -EOPNOTSUPP; })
 #define shadow_set_allocation(d, pages, preempted) \
     ({ ASSERT_UNREACHABLE(); -EOPNOTSUPP; })
+#define shadow_get_allocation_bytes(d, size) \
+    ({ ASSERT_UNREACHABLE(); -EOPNOTSUPP; })
 
 static inline void sh_remove_shadows(struct domain *d, mfn_t gmfn,
                                      int fast, int all) {}
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index f809ea9aa6ae..0fc1b1d9aced 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -345,6 +345,17 @@ unsigned int hap_get_allocation(struct domain *d)
             + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
 }
 
+int hap_get_allocation_bytes(struct domain *d, uint64_t *size)
+{
+    unsigned long pages = d->arch.paging.hap.total_pages;
+
+    pages += d->arch.paging.hap.p2m_pages;
+
+    *size = pages << PAGE_SHIFT;
+
+    return 0;
+}
+
 /* Set the pool of pages to the required number of pages.
  * Returns 0 for success, non-zero for failure. */
 int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 3a355eee9ca3..8d579fa9a3e8 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -977,6 +977,49 @@ int __init paging_set_allocation(struct domain *d, unsigned int pages,
 }
 #endif
 
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    int rc;
+
+    if ( is_pv_domain(d) )                 /* TODO: Relax in due course */
+        return -EOPNOTSUPP;
+
+    if ( hap_enabled(d) )
+        rc = hap_get_allocation_bytes(d, size);
+    else
+        rc = shadow_get_allocation_bytes(d, size);
+
+    return rc;
+}
+
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    unsigned long pages = size >> PAGE_SHIFT;
+    bool preempted = false;
+    int rc;
+
+    if ( is_pv_domain(d) )                 /* TODO: Relax in due course */
+        return -EOPNOTSUPP;
+
+    if ( size & ~PAGE_MASK ||              /* Non page-sized request? */
+         pages != (unsigned int)pages )    /* Overflow $X_set_allocation()? */
+        return -EINVAL;
+
+    paging_lock(d);
+    if ( hap_enabled(d) )
+        rc = hap_set_allocation(d, pages, &preempted);
+    else
+        rc = shadow_set_allocation(d, pages, &preempted);
+    paging_unlock(d);
+
+    /*
+     * TODO: Adjust $X_set_allocation() so this is true.
+    ASSERT(preempted == (rc == -ERESTART));
+     */
+
+    return preempted ? -ERESTART : rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index badfd53c6b23..a8404f97f668 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1427,6 +1427,17 @@ static unsigned int shadow_get_allocation(struct domain *d)
             + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
 }
 
+int shadow_get_allocation_bytes(struct domain *d, uint64_t *size)
+{
+    unsigned long pages = d->arch.paging.shadow.total_pages;
+
+    pages += d->arch.paging.shadow.p2m_pages;
+
+    *size = pages << PAGE_SHIFT;
+
+    return 0;
+}
+
 /**************************************************************************/
 /* Hash table for storing the guest->shadow mappings.
  * The table itself is an array of pointers to shadows; the shadows are then
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 69fb9abd346f..ad71ad8a4cc5 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -874,6 +874,20 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         ret = iommu_do_domctl(op, d, u_domctl);
         break;
 
+    case XEN_DOMCTL_get_paging_mempool_size:
+        ret = arch_get_paging_mempool_size(d, &op->u.paging_mempool.size);
+        if ( !ret )
+            copyback = 1;
+        break;
+
+    case XEN_DOMCTL_set_paging_mempool_size:
+        ret = arch_set_paging_mempool_size(d, op->u.paging_mempool.size);
+
+        if ( ret == -ERESTART )
+            ret = hypercall_create_continuation(
+                __HYPERVISOR_domctl, "h", u_domctl);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index b2ae839c3632..d4072761791a 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -214,7 +214,10 @@ struct xen_domctl_getpageframeinfo3 {
  /* Return the bitmap but do not modify internal copy. */
 #define XEN_DOMCTL_SHADOW_OP_PEEK        12
 
-/* Memory allocation accessors. */
+/*
+ * Memory allocation accessors.  These APIs are broken and will be removed.
+ * Use XEN_DOMCTL_{get,set}_paging_mempool_size instead.
+ */
 #define XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION   30
 #define XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION   31
 
@@ -946,6 +949,22 @@ struct xen_domctl_cacheflush {
     xen_pfn_t start_pfn, nr_pfns;
 };
 
+/*
+ * XEN_DOMCTL_get_paging_mempool_size / XEN_DOMCTL_set_paging_mempool_size.
+ *
+ * Get or set the paging memory pool size.  The size is in bytes.
+ *
+ * This is a dedicated pool of memory for Xen to use while managing the guest,
+ * typically containing pagetables.  As such, there is an implementation
+ * specific minimum granularity.
+ *
+ * The set operation can fail mid-way through the request (e.g. Xen running
+ * out of memory, no free memory to reclaim from the pool, etc.).
+ */
+struct xen_domctl_paging_mempool {
+    uint64_aligned_t size; /* IN/OUT.  Size in bytes. */
+};
+
 #if defined(__i386__) || defined(__x86_64__)
 struct xen_domctl_vcpu_msr {
     uint32_t         index;
@@ -1274,6 +1293,8 @@ struct xen_domctl {
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
 #define XEN_DOMCTL_vmtrace_op                    84
+#define XEN_DOMCTL_get_paging_mempool_size       85
+#define XEN_DOMCTL_set_paging_mempool_size       86
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1335,6 +1356,7 @@ struct xen_domctl {
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
+        struct xen_domctl_paging_mempool    paging_mempool;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 2c8116afba27..0de9cbc1696d 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -98,6 +98,9 @@ void arch_get_info_guest(struct vcpu *, vcpu_guest_context_u);
 int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size /* bytes */);
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size /* bytes */);
+
 int domain_relinquish_resources(struct domain *d);
 
 void dump_pageframe_info(struct domain *d);
-- 
2.11.0


