Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA854E6016
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 09:13:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294192.500112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXIaz-00005R-4F; Thu, 24 Mar 2022 08:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294192.500112; Thu, 24 Mar 2022 08:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXIay-0008Lc-N8; Thu, 24 Mar 2022 08:13:24 +0000
Received: by outflank-mailman (input) for mailman id 294192;
 Thu, 24 Mar 2022 08:13:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+IHq=UD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nXIav-0006uw-BO
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 08:13:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42bec927-ab4a-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 09:13:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A4DFB210F6;
 Thu, 24 Mar 2022 08:13:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53C8213C4F;
 Thu, 24 Mar 2022 08:13:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SIxFEx0oPGIpEwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 24 Mar 2022 08:13:17 +0000
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
X-Inumbo-ID: 42bec927-ab4a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648109597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrpgpTGkFEv/IeXFwA2PDbf2FH7rXe4534vSynZIag4=;
	b=TPa5UHTty/DRSlBVlfbf30W24/2bUPLDbiByRhkqCJVX8loCH1sph6tN2bVfh9S31M8j8y
	BTR6Jal0Dge3nZQqcm6zCz5V/82rxSxbunqjOJltBgFjNZwQcHB6k/RMZnox0WLuWdeYy1
	ZeyBYJv0C4uNCAe6aCuGAgS2A4XvyvA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 07/10] xen: use generated prototypes for hypercall handlers
Date: Thu, 24 Mar 2022 09:13:09 +0100
Message-Id: <20220324081312.18222-8-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220324081312.18222-1-jgross@suse.com>
References: <20220324081312.18222-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the hypercall handler's prototypes in the related header files
and use the generated ones instead.

Some handlers having been static before need to be made globally
visible.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/include/asm/hypercall.h |   1 -
 xen/arch/x86/hvm/hypercall.c         |   7 +-
 xen/arch/x86/include/asm/hypercall.h | 141 ---------------------
 xen/include/xen/hypercall.h          | 177 +--------------------------
 4 files changed, 5 insertions(+), 321 deletions(-)

diff --git a/xen/arch/arm/include/asm/hypercall.h b/xen/arch/arm/include/asm/hypercall.h
index 8182895358..ccd26c5184 100644
--- a/xen/arch/arm/include/asm/hypercall.h
+++ b/xen/arch/arm/include/asm/hypercall.h
@@ -6,7 +6,6 @@
 #define __ASM_ARM_HYPERCALL_H__
 
 #include <public/domctl.h> /* for arch_do_domctl */
-int do_arm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
 long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 3a35543997..a9c9ad721f 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -31,8 +31,7 @@
 #include <public/hvm/hvm_op.h>
 #include <public/hvm/params.h>
 
-static long cf_check hvm_memory_op(
-    unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long cf_check hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc;
 
@@ -52,7 +51,7 @@ static long cf_check hvm_memory_op(
 }
 
 #ifdef CONFIG_GRANT_TABLE
-static long cf_check hvm_grant_table_op(
+long cf_check hvm_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     switch ( cmd )
@@ -78,7 +77,7 @@ static long cf_check hvm_grant_table_op(
 }
 #endif
 
-static long cf_check hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long cf_check hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     const struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
diff --git a/xen/arch/x86/include/asm/hypercall.h b/xen/arch/x86/include/asm/hypercall.h
index 81ca25f7b3..2d243b48bc 100644
--- a/xen/arch/x86/include/asm/hypercall.h
+++ b/xen/arch/x86/include/asm/hypercall.h
@@ -44,109 +44,6 @@ void pv_ring3_init_hypercall_page(void *ptr);
  */
 #define MMU_UPDATE_PREEMPTED          (~(~0U>>1))
 
-extern long cf_check
-do_event_channel_op_compat(
-    XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop);
-
-/* Legacy hypercall (as of 0x00030202). */
-extern long cf_check do_physdev_op_compat(
-    XEN_GUEST_HANDLE(physdev_op_t) uop);
-
-/* Legacy hypercall (as of 0x00030101). */
-extern long cf_check do_sched_op_compat(
-    int cmd, unsigned long arg);
-
-extern long cf_check
-do_set_trap_table(
-    XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps);
-
-extern long cf_check
-do_mmu_update(
-    XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
-    unsigned int count,
-    XEN_GUEST_HANDLE_PARAM(uint) pdone,
-    unsigned int foreigndom);
-
-extern long cf_check
-do_set_gdt(
-    XEN_GUEST_HANDLE_PARAM(xen_ulong_t) frame_list,
-    unsigned int entries);
-
-extern long cf_check
-do_stack_switch(
-    unsigned long ss,
-    unsigned long esp);
-
-extern long cf_check
-do_fpu_taskswitch(
-    int set);
-
-extern long cf_check
-do_set_debugreg(
-    int reg,
-    unsigned long value);
-
-extern long cf_check
-do_get_debugreg(
-    int reg);
-
-extern long cf_check
-do_update_descriptor(
-    uint64_t gaddr, seg_desc_t desc);
-
-extern long cf_check
-do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc);
-
-extern long cf_check
-do_update_va_mapping(
-    unsigned long va,
-    uint64_t val64,
-    unsigned long flags);
-
-extern long cf_check
-do_physdev_op(
-    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long cf_check
-do_update_va_mapping_otherdomain(
-    unsigned long va,
-    uint64_t val64,
-    unsigned long flags,
-    domid_t domid);
-
-extern long cf_check
-do_mmuext_op(
-    XEN_GUEST_HANDLE_PARAM(mmuext_op_t) uops,
-    unsigned int count,
-    XEN_GUEST_HANDLE_PARAM(uint) pdone,
-    unsigned int foreigndom);
-
-extern long cf_check do_callback_op(
-    int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg);
-
-extern long cf_check
-do_iret(
-    void);
-
-extern long cf_check
-do_set_callbacks(
-    unsigned long event_address,
-    unsigned long failsafe_address,
-    unsigned long syscall_address);
-
-extern long cf_check
-do_set_segment_base(
-    unsigned int which,
-    unsigned long base);
-
-long cf_check do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-long cf_check do_xenpmu_op(unsigned int op,
-                           XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg);
-
-long cf_check do_paging_domctl_cont(
-    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
-
 #ifdef CONFIG_COMPAT
 
 #include <compat/arch-x86/xen.h>
@@ -157,44 +54,6 @@ extern int
 compat_common_vcpu_op(
     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern int cf_check compat_mmuext_op(
-    XEN_GUEST_HANDLE_PARAM(void) arg,
-    unsigned int count,
-    XEN_GUEST_HANDLE_PARAM(uint) pdone,
-    unsigned int foreigndom);
-
-extern int cf_check compat_callback_op(
-    int cmd, XEN_GUEST_HANDLE(const_void) arg);
-
-extern int cf_check compat_update_va_mapping(
-    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags);
-
-extern int cf_check compat_update_va_mapping_otherdomain(
-    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags, domid_t domid);
-
-DEFINE_XEN_GUEST_HANDLE(trap_info_compat_t);
-extern int cf_check compat_set_trap_table(
-    XEN_GUEST_HANDLE(trap_info_compat_t) traps);
-
-extern int cf_check compat_set_gdt(
-    XEN_GUEST_HANDLE_PARAM(uint) frame_list, unsigned int entries);
-
-extern int cf_check compat_update_descriptor(
-    uint32_t pa_lo, uint32_t pa_hi, uint32_t desc_lo, uint32_t desc_hi);
-
-extern int cf_check compat_iret(void);
-
-extern int cf_check compat_nmi_op(
-    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int cf_check compat_set_callbacks(
-    unsigned long event_selector, unsigned long event_address,
-    unsigned long failsafe_selector, unsigned long failsafe_address);
-
-DEFINE_XEN_GUEST_HANDLE(physdev_op_compat_t);
-extern int cf_check compat_physdev_op_compat(
-    XEN_GUEST_HANDLE(physdev_op_compat_t) uop);
-
 #endif /* CONFIG_COMPAT */
 
 #endif /* __ASM_X86_HYPERCALL_H__ */
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index ca8ee22717..f307dfb597 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -21,33 +21,19 @@
 #include <asm/hypercall.h>
 #include <xsm/xsm.h>
 
-extern long cf_check
-do_sched_op(
-    int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long cf_check
-do_domctl(
-    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
+/* Needs to be after asm/hypercall.h. */
+#include <xen/hypercall-defs.h>
 
 extern long
 arch_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
-extern long cf_check
-do_sysctl(
-    XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl);
-
 extern long
 arch_do_sysctl(
     struct xen_sysctl *sysctl,
     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl);
 
-extern long cf_check
-do_platform_op(
-    XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op);
-
 extern long
 pci_physdev_op(
     int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
@@ -65,170 +51,11 @@ pci_physdev_op(
 #define MEMOP_EXTENT_SHIFT 6 /* cmd[:6] == start_extent */
 #define MEMOP_CMD_MASK     ((1 << MEMOP_EXTENT_SHIFT) - 1)
 
-extern long cf_check
-do_memory_op(
-    unsigned long cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long cf_check
-do_multicall(
-    XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list,
-    unsigned int nr_calls);
-
-extern long cf_check
-do_set_timer_op(
-    s_time_t timeout);
-
-extern long cf_check
-do_event_channel_op(
-    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long cf_check
-do_xen_version(
-    int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long cf_check
-do_console_io(
-    unsigned int cmd,
-    unsigned int count,
-    XEN_GUEST_HANDLE_PARAM(char) buffer);
-
-extern long cf_check
-do_grant_table_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) uop,
-    unsigned int count);
-
-extern long cf_check
-do_vm_assist(
-    unsigned int cmd,
-    unsigned int type);
-
-extern long cf_check
-do_vcpu_op(
-    int cmd,
-    unsigned int vcpuid,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-struct vcpu;
 extern long
 common_vcpu_op(int cmd,
     struct vcpu *v,
     XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern long cf_check
-do_hvm_op(
-    unsigned long op,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long cf_check
-do_kexec_op(
-    unsigned int op,
-    XEN_GUEST_HANDLE_PARAM(void) uarg);
-
-extern long cf_check
-do_xsm_op(
-    XEN_GUEST_HANDLE_PARAM(void) u_xsm_op);
-
-#ifdef CONFIG_ARGO
-extern long cf_check do_argo_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg1,
-    XEN_GUEST_HANDLE_PARAM(void) arg2,
-    unsigned long arg3,
-    unsigned long arg4);
-#endif
-
-extern long cf_check
-do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long cf_check
-do_dm_op(
-    domid_t domid,
-    unsigned int nr_bufs,
-    XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs);
-
-#ifdef CONFIG_HYPFS
-extern long cf_check
-do_hypfs_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(const_char) arg1,
-    unsigned long arg2,
-    XEN_GUEST_HANDLE_PARAM(void) arg3,
-    unsigned long arg4);
-#endif
-
-#ifdef CONFIG_COMPAT
-
-extern int cf_check
-compat_memory_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int cf_check
-compat_grant_table_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) uop,
-    unsigned int count);
-
-extern int cf_check
-compat_vcpu_op(
-    int cmd,
-    unsigned int vcpuid,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int cf_check
-compat_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int cf_check
-compat_xen_version(
-    int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int cf_check
-compat_sched_op(
-    int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int cf_check
-compat_set_timer_op(
-    uint32_t lo,
-    int32_t hi);
-
-extern int cf_check compat_xsm_op(
-    XEN_GUEST_HANDLE_PARAM(void) op);
-
-extern int cf_check compat_kexec_op(
-    unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg);
-
-DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
-extern int cf_check compat_multicall(
-    XEN_GUEST_HANDLE_PARAM(multicall_entry_compat_t) call_list,
-    uint32_t nr_calls);
-
-int compat_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
-int compat_platform_op(XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
-
-#ifdef CONFIG_ARGO
-extern int cf_check compat_argo_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg1,
-    XEN_GUEST_HANDLE_PARAM(void) arg2,
-    unsigned long arg3,
-    unsigned long arg4);
-#endif
-
-extern int cf_check
-compat_dm_op(
-    domid_t domid,
-    unsigned int nr_bufs,
-    XEN_GUEST_HANDLE_PARAM(void) bufs);
-
-#endif
-
 void arch_get_xen_caps(xen_capabilities_info_t *info);
 
 #endif /* __XEN_HYPERCALL_H__ */
-- 
2.34.1


