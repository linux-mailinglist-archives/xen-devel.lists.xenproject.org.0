Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA760DECB
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 12:21:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430420.682103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWR-0004uh-UP; Wed, 26 Oct 2022 10:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430420.682103; Wed, 26 Oct 2022 10:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWR-0004rO-Qh; Wed, 26 Oct 2022 10:20:31 +0000
Received: by outflank-mailman (input) for mailman id 430420;
 Wed, 26 Oct 2022 10:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JODj=23=citrix.com=prvs=291bfe38a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ondWP-0004c6-JA
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 10:20:29 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfd4c801-5517-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 12:20:28 +0200 (CEST)
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
X-Inumbo-ID: cfd4c801-5517-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666779627;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UKcW3nevq717wcPG1BpUjMEd9z82OdectilgGlr6jBY=;
  b=EFJbnd+HnLQn6QNs0GvCqGaBVh2+A/ZBgdMBVYE2NYUHJdAllUk6S1cS
   biWv/h0oiaRBdQVTvwWcZOFOkCdn0CmVFOekQjZx3NrlDpZxO7bljXv2p
   XEsn6BgFtVJzA14/lGol/g5boszjYFkk+nLhVtNIRZspeOVnq/llRB2xm
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 86061067
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2Kfluaq6JlESVd4Y40UExfz5xx9eBmKIZRIvgKrLsJaIsI4StFCzt
 garIBmHPK2DM2HwL9p+bY+zoBlXv5HQzoIwHAVrrCE1Q3hH8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 8UBEQwyc0q6isHv3Y2ZcqpFjOstM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0FwB7G/
 zqYoAwVBDkEKdKx7RCoyUu+2NLSjHvnSZpIO/qno6sCbFq7mTVIVUx+uUGAice+jkmyStdOM
 Xs+8yAlrbUx3EGzR9y7VBq9yFaGoxodVtx4A+A8rgaXxcL8wwufHHlCcTdHZ/QvrspwTjsvv
 neDksn1HzVpvPuQQGiE67aPhTqoPG4eKmpqTTQfUQIP7t3noYcyphHCVNBuFOiylNKdMSr9y
 C2QrTQvr6Uei4gMzarT1UDKhXegq4bESiYx5x7LRSS14wVhfomnaoe0r1/B4p5oM4KxXlSH+
 n8elKC2zsoDEJWMnyylW/gWEfei4PPtDdHHqQcxRd97rW3roiP9O9ALiN1jGKt3GtQ9YAbVX
 1KJgA5yvYJsHkPpRKVYbZ3kXqzG0pPcPdjiU/nVaP9HbZ5waBKL8UlSWKKA44z+uBNyyP9iY
 P93Ze7pVC9HUvo/kFJaUs9HidcWKjYCKXQ/rHwR5zCuyvKgaXGcUt/p23PeP7livMtoTOg4m
 uuz1vdmKT0FDoUSgQGNq+b/yGzmylBiXPjLRzR/LLLrH+afMDhJ5wXt6b0gYZd5uK9ei/3F+
 HqwMmcBlgSh2iedeFzTMCg+AF8KYXqYhStlVRHAwH7ygyRzCWpRxPt3m2QLkUkPq7U4kK8co
 wgtcMScGPVfIgkrCBxEBaQRWLdKLUzx7SrXZnLNSGFmL/Zdq/nhp4aMkv3Hr3JVUEJadKIW/
 tWd6+8sacBYHlU/UpuLOZpCDTqZ5BAgpQ67ZGOQSvE7Rakm2NICx/DZ5hPvH/wxFA==
IronPort-HdrOrdr: A9a23:vDmGwq4BXed/QzFLugPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HJoB17726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpN
 5dmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="86061067"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen Security Team
	<security@xen.org>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>,
	"Anthony PERARD" <anthony.perard@citrix.com>
Subject: [PATCH 1/4] xen: Introduce non-broken hypercalls for the p2m pool size
Date: Wed, 26 Oct 2022 11:20:15 +0100
Message-ID: <20221026102018.4144-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221026102018.4144-1-andrew.cooper3@citrix.com>
References: <20221026102018.4144-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The existing XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION have problems:

 * All set_allocation() flavours have an overflow-before-widen bug when
   calculating "sc->mb << (20 - PAGE_SHIFT)".
 * All flavours have a granularity of of 1M.  This was tolerable when the size
   of the pool could only be set at the same granularity, but is broken now
   that ARM has a 16-page stopgap allocation in use.
 * All get_allocation() flavours round up, and in particular turn 0 into 1,
   meaning the get op returns junk before a successful set op.
 * The x86 flavours reject the hypercalls before the VM has vCPUs allocated,
   despite the pool size being a domain property.
 * Even the hypercall names are long-obsolete.

Implement an interface that doesn't suck, which can be first used to unit test
the behaviour, and subsequently correct a broken implementation.  The old
interface will be retired in due course.

This is part of XSA-409 / CVE-2022-33747.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Xen Security Team <security@xen.org>
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
CC: Anthony PERARD <anthony.perard@citrix.com>

Name subject to improvement.  ABI not.  This is the first of many tools ABI
changes required to cleanly separate the logical operation from Xen's choice
of pagetable size.

Future TODOs:
 * x86 shadow still rounds up.  This is buggy as it's a simultaneous equation
   with tot_pages which varies over time with ballooning.
 * x86 PV is weird.  There are no toolstack interact with the shadow pool
   size, but the "shadow" pool it does come into existence when logdirty (or
   pv-l1tf) when first enabled.
 * The shadow+hap logic is in desperate need of deduping.
---
 tools/include/xenctrl.h           |  3 +++
 tools/libs/ctrl/xc_domain.c       | 29 +++++++++++++++++++++++++++++
 xen/arch/arm/p2m.c                | 27 +++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hap.h    |  1 +
 xen/arch/x86/include/asm/shadow.h |  4 ++++
 xen/arch/x86/mm/hap/hap.c         | 10 ++++++++++
 xen/arch/x86/mm/paging.c          | 39 +++++++++++++++++++++++++++++++++++++++
 xen/arch/x86/mm/shadow/common.c   | 10 ++++++++++
 xen/common/domctl.c               | 14 ++++++++++++++
 xen/include/public/domctl.h       | 26 +++++++++++++++++++++++++-
 xen/include/xen/domain.h          |  3 +++
 11 files changed, 165 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 0c8b4c3aa7a5..f503f03a3927 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -893,6 +893,9 @@ long long xc_logdirty_control(xc_interface *xch,
                               unsigned int mode,
                               xc_shadow_op_stats_t *stats);
 
+int xc_get_p2m_mempool_size(xc_interface *xch, uint32_t domid, uint64_t *size);
+int xc_set_p2m_mempool_size(xc_interface *xch, uint32_t domid, uint64_t size);
+
 int xc_sched_credit_domain_set(xc_interface *xch,
                                uint32_t domid,
                                struct xen_domctl_sched_credit *sdom);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 14c0420c35be..9ac09cfab036 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -706,6 +706,35 @@ long long xc_logdirty_control(xc_interface *xch,
     return (rc == 0) ? domctl.u.shadow_op.pages : rc;
 }
 
+int xc_get_p2m_mempool_size(xc_interface *xch, uint32_t domid, uint64_t *size)
+{
+    int rc;
+    struct xen_domctl domctl = {
+        .cmd         = XEN_DOMCTL_get_p2m_mempool_size,
+        .domain      = domid,
+    };
+
+    rc = do_domctl(xch, &domctl);
+    if ( rc )
+        return rc;
+
+    *size = domctl.u.p2m_mempool.size;
+    return 0;
+}
+
+int xc_set_p2m_mempool_size(xc_interface *xch, uint32_t domid, uint64_t size)
+{
+    struct xen_domctl domctl = {
+        .cmd         = XEN_DOMCTL_set_p2m_mempool_size,
+        .domain      = domid,
+        .u.p2m_mempool = {
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
index 94d3b60b1387..4607cde6f0b8 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -100,6 +100,14 @@ unsigned int p2m_get_allocation(struct domain *d)
     return ROUNDUP(nr_pages, 1 << (20 - PAGE_SHIFT)) >> (20 - PAGE_SHIFT);
 }
 
+/* Return the size of the pool, in bytes. */
+int arch_get_p2m_mempool_size(struct domain *d, uint64_t *size)
+{
+    *size = ACCESS_ONCE(d->arch.paging.p2m_total_pages) << PAGE_SHIFT;
+
+    return 0;
+}
+
 /*
  * Set the pool of pages to the required number of pages.
  * Returns 0 for success, non-zero for failure.
@@ -157,6 +165,25 @@ int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
     return 0;
 }
 
+int arch_set_p2m_mempool_size(struct domain *d, uint64_t size)
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
index f809ea9aa6ae..50c3d6e63fa5 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -345,6 +345,16 @@ unsigned int hap_get_allocation(struct domain *d)
             + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
 }
 
+int hap_get_allocation_bytes(struct domain *d, uint64_t *size)
+{
+    unsigned long pages = (d->arch.paging.hap.total_pages +
+                           d->arch.paging.hap.p2m_pages);
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
index 3a355eee9ca3..b3f7c46e1dfd 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -977,6 +977,45 @@ int __init paging_set_allocation(struct domain *d, unsigned int pages,
 }
 #endif
 
+int arch_get_p2m_mempool_size(struct domain *d, uint64_t *size)
+{
+    int rc;
+
+    if ( is_pv_domain(d) )
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
+int arch_set_p2m_mempool_size(struct domain *d, uint64_t size)
+{
+    unsigned long pages = size >> PAGE_SHIFT;
+    bool preempted = false;
+    int rc;
+
+    if ( is_pv_domain(d) )
+        return -EOPNOTSUPP;
+
+    if ( size & ~PAGE_MASK )             /* Non page-sized request? */
+        return -EINVAL;
+
+    ASSERT(paging_mode_enabled(d));
+
+    paging_lock(d);
+    if ( hap_enabled(d) )
+        rc = hap_set_allocation(d, pages, &preempted);
+    else
+        rc = shadow_set_allocation(d, pages, &preempted);
+    paging_unlock(d);
+
+    return preempted ? -ERESTART : rc;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index badfd53c6b23..d190601c4424 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -1427,6 +1427,16 @@ static unsigned int shadow_get_allocation(struct domain *d)
             + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
 }
 
+int shadow_get_allocation_bytes(struct domain *d, uint64_t *size)
+{
+    unsigned long pages = (d->arch.paging.shadow.total_pages +
+                           d->arch.paging.shadow.p2m_pages);
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
index 69fb9abd346f..8f318b830185 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -874,6 +874,20 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         ret = iommu_do_domctl(op, d, u_domctl);
         break;
 
+    case XEN_DOMCTL_get_p2m_mempool_size:
+        ret = arch_get_p2m_mempool_size(d, &op->u.p2m_mempool.size);
+        if ( !ret )
+            copyback = 1;
+        break;
+
+    case XEN_DOMCTL_set_p2m_mempool_size:
+        ret = arch_set_p2m_mempool_size(d, op->u.p2m_mempool.size);
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
index b2ae839c3632..7da09d5925c8 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -214,7 +214,10 @@ struct xen_domctl_getpageframeinfo3 {
  /* Return the bitmap but do not modify internal copy. */
 #define XEN_DOMCTL_SHADOW_OP_PEEK        12
 
-/* Memory allocation accessors. */
+/*
+ * Memory allocation accessors.  These APIs are broken and will be removed.
+ * Use XEN_DOMCTL_{get,set}_p2m_mempool_size instead.
+ */
 #define XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION   30
 #define XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION   31
 
@@ -946,6 +949,24 @@ struct xen_domctl_cacheflush {
     xen_pfn_t start_pfn, nr_pfns;
 };
 
+/*
+ * XEN_DOMCTL_get_p2m_mempool_size / XEN_DOMCTL_set_p2m_mempool_size.
+ *
+ * Get or set the P2M memory pool size.  The size is in bytes.
+ *
+ * The P2M memory pool is a dedicated pool of memory for managing the guest
+ * physical -> host physical mappings, usually containing pagetables.
+ * Implementation details cause there to be a minimum granularity, usually the
+ * size of pagetables used by Xen.  Users of this interface are required to
+ * identify the granularity by other means.
+ *
+ * The set operation can fail midway through the request (e.g. Xen running out
+ * of memory, no free memory to reclaim from the pool, etc.).
+ */
+struct xen_domctl_p2m_mempool {
+    uint64_aligned_t size; /* IN/OUT.  Size in bytes. */
+};
+
 #if defined(__i386__) || defined(__x86_64__)
 struct xen_domctl_vcpu_msr {
     uint32_t         index;
@@ -1274,6 +1295,8 @@ struct xen_domctl {
 #define XEN_DOMCTL_get_cpu_policy                82
 #define XEN_DOMCTL_set_cpu_policy                83
 #define XEN_DOMCTL_vmtrace_op                    84
+#define XEN_DOMCTL_get_p2m_mempool_size          85
+#define XEN_DOMCTL_set_p2m_mempool_size          86
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1335,6 +1358,7 @@ struct xen_domctl {
         struct xen_domctl_psr_alloc         psr_alloc;
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
+        struct xen_domctl_p2m_mempool       p2m_mempool;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 2c8116afba27..01aaf4dedbe8 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -98,6 +98,9 @@ void arch_get_info_guest(struct vcpu *, vcpu_guest_context_u);
 int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 int default_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
+int arch_get_p2m_mempool_size(struct domain *d, uint64_t *size /* bytes */);
+int arch_set_p2m_mempool_size(struct domain *d, uint64_t size /* bytes */);
+
 int domain_relinquish_resources(struct domain *d);
 
 void dump_pageframe_info(struct domain *d);
-- 
2.11.0


