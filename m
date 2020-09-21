Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45656273163
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 20:02:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKQ8z-0003Lc-QH; Mon, 21 Sep 2020 18:02:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKQ8y-0003KW-9g
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 18:02:28 +0000
X-Inumbo-ID: 502a46da-a94b-4bcc-90da-959752d1fc97
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 502a46da-a94b-4bcc-90da-959752d1fc97;
 Mon, 21 Sep 2020 18:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=ycj+udjjN9eYdtjLRlg0VaaJ8Nr+SqZXsYEt5ubsCzA=; b=OnfZ8YFHFJu2UJ9p30k4xa9xO
 KyVM4mCYzP7KdYUbVmvFT3Psyd8kdXivEO9feKb5UNx5VdjgvUoXPAZVV1ZMsGdeMdp7NGzcPheUo
 Z4hulH1e5MCtYIxCSzTLxy1/gXiaIMy/Izs1nqfLDyeSq7T2AlOohMj3a3afey1OunrxY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8u-00087C-94; Mon, 21 Sep 2020 18:02:24 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8t-0003uk-Vf; Mon, 21 Sep 2020 18:02:24 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/4] xen: Introduce HAS_M2P config and use to protect
 mfn_to_gmfn call
Date: Mon, 21 Sep 2020 19:02:12 +0100
Message-Id: <20200921180214.4842-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921180214.4842-1-julien@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <julien.grall@arm.com>

While Arm never had a M2P, the implementation of mfn_to_gmfn is pretty
bogus as we directly return the MFN passed in parameter.

Thankfully, the use of mfn_to_gmfn is pretty limited on Arm today. There
are only 2 callers in the common code:
    - memory_exchange: Arm cannot not use it because steal_page is not
    implemented. Note this is already protected by !CONFIG_PV.
    - getdomaininfo: Toolstack may map the shared page. It looks like
    this is mostly used for mapping the P2M of PV guest. Therefore the
    issue might be minor.

Implementing the M2P on Arm is not planned. The M2P would require significant
amount of VA address (very tough on 32-bit) that can hardly be justified with
the current use of mfn_to_gmfn.
    - memory_exchange: This does not work and I haven't seen any
    request for it so far.
    - getdomaininfo: The structure on Arm does not seem to contain a lot
    of useful information on Arm. It is unclear whether we want to
    allow the toolstack mapping it on Arm.

This patch introduces a config option HAS_M2P to tell whether an
architecture implements the M2P.
    - memory_exchange: This is PV only (not supported on Arm) but take
    the opportunity to gate with HAS_M2P as well in case someone decide
    to implement PV without M2P.
    - getdomaininfo: A new helper is introduced to wrap the call to
    mfn_to_gfn/mfn_to_gmfn. For Arm, a fixed value will be provided that will
    fail on mapping if used.

Signed-off-by Julien Grall <julien.grall@arm.com>

---
    Changes in v4:
        - The IOMMU code doesn't use the M2P anymore, so this can be
        dropped.
        - Reword the commit message
        - Fix rebase conflict

    Changes in v3:
        - Move the BUG_ON() in domain_shared_info_gfn()
        - Use a fixed value when the field shared_info_frame is not
        supported.
        - Add an ASSERT_UNREACHABLE in iommu_hwdom_init + move printk
        within the #ifdef.

    Changes in v2:
        - Add a warning in public headers
        - Constify local variable in domain_shared_info_gfn
        - Invert the naming (_d / d) in domain_shared_info_gfn
        - Use -EOPNOTSUPP rather than -ENOSYS
        - Rework how the memory_exchange hypercall is removed from Arm
---
 xen/arch/x86/Kconfig         |  1 +
 xen/common/Kconfig           |  3 +++
 xen/common/domctl.c          |  9 +++++++--
 xen/common/memory.c          |  4 ++--
 xen/include/asm-arm/domain.h |  5 +++++
 xen/include/public/domctl.h  |  6 ++++++
 xen/include/xen/domain.h     | 12 ++++++++++++
 7 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index a636a4bb1e69..ad92e756cccc 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -16,6 +16,7 @@ config X86
 	select HAS_IOPORTS
 	select HAS_KEXEC
 	select MEM_ACCESS_ALWAYS_ON
+	select HAS_M2P
 	select HAS_MEM_PAGING
 	select HAS_NS16550
 	select HAS_PASSTHROUGH
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 15e3b79ff57f..b6b4db92d700 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -63,6 +63,9 @@ config HAS_IOPORTS
 config HAS_SCHED_GRANULARITY
 	bool
 
+config HAS_M2P
+	bool
+
 config NEEDS_LIBELF
 	bool
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 5ac6e9c5cafa..2bf3e6659018 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -68,6 +68,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
     u64 cpu_time = 0;
     int flags = XEN_DOMINF_blocked;
     struct vcpu_runstate_info runstate;
+    gfn_t shared_info_frame;
 
     info->domain = d->domain_id;
     info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
@@ -111,8 +112,12 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
     info->outstanding_pages = d->outstanding_pages;
     info->shr_pages         = atomic_read(&d->shr_pages);
     info->paged_pages       = atomic_read(&d->paged_pages);
-    info->shared_info_frame = mfn_to_gmfn(d, virt_to_mfn(d->shared_info));
-    BUG_ON(SHARED_M2P(info->shared_info_frame));
+
+    shared_info_frame = domain_shared_info_gfn(d);
+    if ( gfn_eq(shared_info_frame, INVALID_GFN) )
+        info->shared_info_frame = XEN_INVALID_SHARED_INFO_FRAME;
+    else
+        info->shared_info_frame = gfn_x(shared_info_frame);
 
     info->cpupool = cpupool_get_id(d);
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 9300104943b0..c698e6872596 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -504,7 +504,7 @@ static bool propagate_node(unsigned int xmf, unsigned int *memflags)
 
 static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
 {
-#ifdef CONFIG_PV
+#if defined(CONFIG_PV) && defined(CONFIG_M2P)
     struct xen_memory_exchange exch;
     PAGE_LIST_HEAD(in_chunk_list);
     PAGE_LIST_HEAD(out_chunk_list);
@@ -801,7 +801,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
     if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
         rc = -EFAULT;
     return rc;
-#else /* !CONFIG_PV */
+#else /* !(CONFIG_PV && CONFIG_M2P) */
     return -EOPNOTSUPP;
 #endif
 }
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 6819a3bf382f..90161dd079a1 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -262,6 +262,11 @@ static inline void arch_vcpu_block(struct vcpu *v) {}
 
 #define arch_vm_assist_valid_mask(d) (1UL << VMASST_TYPE_runstate_update_flag)
 
+static inline gfn_t domain_shared_info_gfn(struct domain *d)
+{
+    return INVALID_GFN;
+}
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 5c5e55ebcb76..7564df5e8374 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -136,6 +136,12 @@ struct xen_domctl_getdomaininfo {
     uint64_aligned_t outstanding_pages;
     uint64_aligned_t shr_pages;
     uint64_aligned_t paged_pages;
+#define XEN_INVALID_SHARED_INFO_FRAME (~(uint64_t)0)
+    /*
+     * GFN of shared_info struct. Some architectures (e.g Arm) may not
+     * provide a mappable address in the field. In that case, the field
+     * will be set to XEN_INVALID_SHARED_INFO_FRAME.
+     */
     uint64_aligned_t shared_info_frame; /* GMFN of shared_info struct */
     uint64_aligned_t cpu_time;
     uint32_t nr_online_vcpus;    /* Number of VCPUs currently online. */
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index cde0d9c7fe63..7281eb7b36c7 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -131,4 +131,16 @@ void vnuma_destroy(struct vnuma_info *vnuma);
 static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
 #endif
 
+#ifdef CONFIG_HAS_M2P
+#define domain_shared_info_gfn(d) ({                            \
+    const struct domain *d_ = (d);                              \
+    gfn_t gfn_;                                                 \
+                                                                \
+    gfn_ = mfn_to_gfn(d_, _mfn(__virt_to_mfn(d_->shared_info)));\
+    BUG_ON(SHARED_M2P(gfn_x(gfn_)));                            \
+                                                                \
+    gfn_;                                                       \
+})
+#endif
+
 #endif /* __XEN_DOMAIN_H__ */
-- 
2.17.1


