Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC18F7E9486
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 03:24:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631251.984387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Mci-0002ks-CB; Mon, 13 Nov 2023 02:24:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631251.984387; Mon, 13 Nov 2023 02:24:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Mci-0002iS-4k; Mon, 13 Nov 2023 02:24:24 +0000
Received: by outflank-mailman (input) for mailman id 631251;
 Mon, 13 Nov 2023 02:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCEZ=G2=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1r2Mcg-00011s-4w
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 02:24:22 +0000
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch
 [185.125.25.13]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0f9911c-81cb-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 03:24:21 +0100 (CET)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [10.4.36.108])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4STCtF0JdCzMpxDc;
 Mon, 13 Nov 2023 02:24:21 +0000 (UTC)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4STCtC4TrjzMpnPd; Mon, 13 Nov 2023 03:24:19 +0100 (CET)
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
X-Inumbo-ID: c0f9911c-81cb-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1699842260;
	bh=3ZLY/nS0lwLKi/L6VqWKqVBloAFCSA+eB24SBhCzIXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=y2lDmzRkLKrzf6YPi3D4QKjQPJhPLdTzsvCbaLH8n86bmNl5EAyUw5Vphk2fc4rJw
	 TLfnFGEyP2jqJAbn8DJnwo1XABN8RimqjRgV1bCMpAPRjX8PzxhdSJt9kDm6zHLvGd
	 /ggMXvnRZc6CA01WJiWQxAi6rqcHrhmU955Fp2TY=
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Alexander Graf <graf@amazon.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	Forrest Yuan Yu <yuanyu@google.com>,
	James Gowans <jgowans@amazon.com>,
	James Morris <jamorris@linux.microsoft.com>,
	John Andersen <john.s.andersen@intel.com>,
	"Madhavan T . Venkataraman" <madvenka@linux.microsoft.com>,
	Marian Rotariu <marian.c.rotariu@gmail.com>,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
	=?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
	Thara Gopinath <tgopinath@microsoft.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Wei Liu <wei.liu@kernel.org>,
	Will Deacon <will@kernel.org>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Zahra Tarkhani <ztarkhani@microsoft.com>,
	=?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
	dev@lists.cloudhypervisor.org,
	kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [RFC PATCH v2 07/19] KVM: x86: Make memory attribute helpers more generic
Date: Sun, 12 Nov 2023 21:23:14 -0500
Message-ID: <20231113022326.24388-8-mic@digikod.net>
In-Reply-To: <20231113022326.24388-1-mic@digikod.net>
References: <20231113022326.24388-1-mic@digikod.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

To make it useful for other use cases such as Heki, remove the private
memory optimizations.

I guess we could try to infer the applied attributes to get back these
optimizations when it makes sense, but let's keep this simple for now.

Main changes:

- Replace slots_lock with slots_arch_lock to make it callable from a KVM
  hypercall.

- Move this mutex lock into kvm_vm_ioctl_set_mem_attributes() to make it
  easier to use with other locks.

- Export kvm_vm_set_mem_attributes().

- Remove the kvm_arch_pre_set_memory_attributes() and
  kvm_arch_post_set_memory_attributes() KVM_MEMORY_ATTRIBUTE_PRIVATE
  optimizations.

Cc: Chao Peng <chao.p.peng@linux.intel.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Yu Zhang <yu.c.zhang@linux.intel.com>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---

Changes since v1:
* New patch
---
 arch/x86/kvm/mmu/mmu.c   | 23 -----------------------
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 19 ++++++++++---------
 3 files changed, 12 insertions(+), 32 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 7e053973125c..4d378d308762 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -7251,20 +7251,6 @@ void kvm_mmu_pre_destroy_vm(struct kvm *kvm)
 bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
 					struct kvm_gfn_range *range)
 {
-	/*
-	 * Zap SPTEs even if the slot can't be mapped PRIVATE.  KVM x86 only
-	 * supports KVM_MEMORY_ATTRIBUTE_PRIVATE, and so it *seems* like KVM
-	 * can simply ignore such slots.  But if userspace is making memory
-	 * PRIVATE, then KVM must prevent the guest from accessing the memory
-	 * as shared.  And if userspace is making memory SHARED and this point
-	 * is reached, then at least one page within the range was previously
-	 * PRIVATE, i.e. the slot's possible hugepage ranges are changing.
-	 * Zapping SPTEs in this case ensures KVM will reassess whether or not
-	 * a hugepage can be used for affected ranges.
-	 */
-	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
-		return false;
-
 	return kvm_unmap_gfn_range(kvm, range);
 }
 
@@ -7313,15 +7299,6 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
 	lockdep_assert_held_write(&kvm->mmu_lock);
 	lockdep_assert_held(&kvm->slots_lock);
 
-	/*
-	 * Calculate which ranges can be mapped with hugepages even if the slot
-	 * can't map memory PRIVATE.  KVM mustn't create a SHARED hugepage over
-	 * a range that has PRIVATE GFNs, and conversely converting a range to
-	 * SHARED may now allow hugepages.
-	 */
-	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
-		return false;
-
 	/*
 	 * The sequence matters here: upper levels consume the result of lower
 	 * level's scanning.
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ec32af17add8..85b8648fd892 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2396,6 +2396,8 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
 					struct kvm_gfn_range *range);
 bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
 					 struct kvm_gfn_range *range);
+int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
+			      unsigned long attributes);
 
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 23633984142f..0096ccfbb609 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2552,7 +2552,7 @@ static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
 }
 
 /* Set @attributes for the gfn range [@start, @end). */
-static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
+int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 				     unsigned long attributes)
 {
 	struct kvm_mmu_notifier_range pre_set_range = {
@@ -2577,11 +2577,11 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 
 	entry = attributes ? xa_mk_value(attributes) : NULL;
 
-	mutex_lock(&kvm->slots_lock);
+	lockdep_assert_held(&kvm->slots_arch_lock);
 
 	/* Nothing to do if the entire range as the desired attributes. */
 	if (kvm_range_has_memory_attributes(kvm, start, end, attributes))
-		goto out_unlock;
+		return r;
 
 	/*
 	 * Reserve memory ahead of time to avoid having to deal with failures
@@ -2590,7 +2590,7 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 	for (i = start; i < end; i++) {
 		r = xa_reserve(&kvm->mem_attr_array, i, GFP_KERNEL_ACCOUNT);
 		if (r)
-			goto out_unlock;
+			return r;
 	}
 
 	kvm_handle_gfn_range(kvm, &pre_set_range);
@@ -2602,15 +2602,13 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 	}
 
 	kvm_handle_gfn_range(kvm, &post_set_range);
-
-out_unlock:
-	mutex_unlock(&kvm->slots_lock);
-
 	return r;
 }
+
 static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
 					   struct kvm_memory_attributes *attrs)
 {
+	int r;
 	gfn_t start, end;
 
 	/* flags is currently not used. */
@@ -2633,7 +2631,10 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
 	 */
 	BUILD_BUG_ON(sizeof(attrs->attributes) != sizeof(unsigned long));
 
-	return kvm_vm_set_mem_attributes(kvm, start, end, attrs->attributes);
+	mutex_lock(&kvm->slots_arch_lock);
+	r = kvm_vm_set_mem_attributes(kvm, start, end, attrs->attributes);
+	mutex_unlock(&kvm->slots_arch_lock);
+	return r;
 }
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
-- 
2.42.1


