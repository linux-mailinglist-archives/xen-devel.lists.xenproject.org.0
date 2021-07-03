Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E613BA9B1
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 19:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149550.276630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBW-0001Gq-Ur; Sat, 03 Jul 2021 17:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149550.276630; Sat, 03 Jul 2021 17:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzjBW-0001Ae-PV; Sat, 03 Jul 2021 17:12:06 +0000
Received: by outflank-mailman (input) for mailman id 149550;
 Sat, 03 Jul 2021 17:12:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzjBV-0000rQ-2j
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 17:12:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBT-0007c2-FM; Sat, 03 Jul 2021 17:12:03 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzjBT-0005vs-6h; Sat, 03 Jul 2021 17:12:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=2pkpvyGryxTS4uBplOORxJnDBZlpgWoUp7jdUVlTkUk=; b=PsTwUivc5yu22Oe9pxT9BLzvy
	k0g6AirkHbuRzdlKfdYTloWhxO6D+Mx9hrsSY0OdqAOQJByi7WjKJAvRVmFYtflr3dt1GM1NNhBWQ
	g0DUfCflztgPKFN9OGedj1wtuzDkfaS9zl78dzASKACE17rKh08kOZXcKjG6CG6CbSM3k=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 2/4] xen: arm: Stop returning a bogus GFN for the shared info
Date: Sat,  3 Jul 2021 18:11:50 +0100
Message-Id: <20210703171152.15874-3-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210703171152.15874-1-julien@xen.org>
References: <20210703171152.15874-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

While Arm never had a M2P, the implementation of mfn_to_gfn() is pretty
bogus as we directly return the MFN passed in parameter.

The last use of mfn_to_gfn() on Arm is in getdomaininfo(). It looks
like this is mostly used for mapping the P2M Of PV guest. Furthermore,
the structure on Arm doesn't seem to contain a lot of useful
information. Therefore it is unclear whether we want to allow the
toolstack to map it.

As there is a high change that RISC-V will not implement an M2P,
provide a new wrapper that will by default return an invalid GFN and
move the code to find the GFN in an x86 specific helper.

If in the future we want to map the shared info, then we should
consider to do it using the acquire hypercall.

Note that as INVALID_GFN is unsigned long, we can't return directly
because the value would differ between 64-bit and 32-bit. Instead,
a fixed value needs to be introduced.

While the fixed value could be shared with other field storing a
GFN, we unfortunately use a mix of type (unsigned long, uint64_t)
for exposing it externally. So to avoid any misuse, it is better to
define a fixed value for just the shared_info_gfn field.

Signed-off-by Julien Grall <julien.grall@arm.com>

---
    I am not comfortable with introduce a generic invalid GFN fixed
    value because we don't use a common type. I also didn't get any
    feedback on whether it would be acceptable to focus on one type.

    So the fixed value has not been changed. I think this is acceptable
    because this a DOMCTL and therefore not stable. If someone still
    disagree, then please provide concrete steps how to solve
    the mixing of type.

    Changes in v5:
        - This was originally "xen: Introduce HAS_M2P config and use to
        protect mfn_to_gmfn call".
        - Rebase to the latest Xen.
        - Rename the helper to arch_shared_info_gfn()
        - The default stub now return INVALID_GFN rather than using the
        M2P

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
 xen/arch/x86/domain.c        |  9 +++++++++
 xen/common/Kconfig           |  3 +++
 xen/common/domctl.c          | 10 +++++++---
 xen/include/asm-x86/domain.h |  3 +++
 xen/include/public/domctl.h  |  6 ++++++
 xen/include/xen/domain.h     |  7 +++++++
 6 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index ef1812dc1402..b3f216cd6f51 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2553,6 +2553,15 @@ void domain_pause_for_debugger(void)
 #endif
 }
 
+gfn_t arch_shared_info_gfn(const struct domain *d)
+{
+    gfn_t gfn = mfn_to_gfn(d, _mfn(__virt_to_mfn(d->shared_info)));
+
+    BUG_ON(SHARED_M2P(gfn_x(gfn)));
+
+    return gfn;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11af3..cd5b89f2f02e 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -64,6 +64,9 @@ config MEM_ACCESS
 	  Framework to configure memory access types for guests and receive
 	  related events in userspace.
 
+config HAS_M2P
+	bool
+
 config NEEDS_LIBELF
 	bool
 
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 12d6144d2896..834a2183fda1 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -68,6 +68,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
     u64 cpu_time = 0;
     int flags = XEN_DOMINF_blocked;
     struct vcpu_runstate_info runstate;
+    gfn_t shared_info_frame;
 
     info->domain = d->domain_id;
     info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
@@ -111,9 +112,12 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
     info->outstanding_pages = d->outstanding_pages;
     info->shr_pages         = atomic_read(&d->shr_pages);
     info->paged_pages       = atomic_read(&d->paged_pages);
-    info->shared_info_frame =
-        gfn_x(mfn_to_gfn(d, _mfn(virt_to_mfn(d->shared_info))));
-    BUG_ON(SHARED_M2P(info->shared_info_frame));
+
+    shared_info_frame = arch_shared_info_gfn(d);
+    if ( gfn_eq(shared_info_frame, INVALID_GFN) )
+        info->shared_info_frame = XEN_INVALID_SHARED_INFO_FRAME;
+    else
+        info->shared_info_frame = gfn_x(shared_info_frame);
 
     info->cpupool = cpupool_get_id(d);
 
diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
index 92d54de0b9a1..912a545c93f6 100644
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -756,6 +756,9 @@ static inline void pv_inject_sw_interrupt(unsigned int vector)
                       : is_pv_32bit_domain(d) ? PV32_VM_ASSIST_MASK \
                                               : PV64_VM_ASSIST_MASK)
 
+gfn_t arch_shared_info_gfn(const struct domain *d);
+#define arch_shared_info_gfn arch_shared_info_gfn
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 4dbf107785c3..02a2bfa969ec 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -141,6 +141,12 @@ struct xen_domctl_getdomaininfo {
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
index 1708c369642e..d8044b7936ae 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -133,4 +133,11 @@ static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vnuma); }
 
 extern bool vmtrace_available;
 
+#ifndef arch_shared_info_gfn
+static inline gfn_t arch_shared_info_gfn(const struct domain *d)
+{
+    return INVALID_GFN;
+}
+#endif
+
 #endif /* __XEN_DOMAIN_H__ */
-- 
2.17.1


