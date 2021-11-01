Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E028441D4A
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 16:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219243.379982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6v-000120-FB; Mon, 01 Nov 2021 15:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219243.379982; Mon, 01 Nov 2021 15:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhZ6v-0000zC-9P; Mon, 01 Nov 2021 15:20:33 +0000
Received: by outflank-mailman (input) for mailman id 219243;
 Mon, 01 Nov 2021 15:20:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rWtG=PU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhZ6t-0008DA-LV
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 15:20:31 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a64fad89-62ab-4361-a7c4-f83d0abe5eca;
 Mon, 01 Nov 2021 15:20:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 943E91FD76;
 Mon,  1 Nov 2021 15:20:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F6BB13A4A;
 Mon,  1 Nov 2021 15:20:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sIdCErUFgGFzNwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 01 Nov 2021 15:20:21 +0000
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
X-Inumbo-ID: a64fad89-62ab-4361-a7c4-f83d0abe5eca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635780021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vy8JcJWVw65yCZbccWa3q9rZy/5hhpoMxVQDYJ3G428=;
	b=NI8jJ9z3RiomK/knhPsY32C2QuWrSYWpP9CVShq1qOgvIRDW5uZRAZXswNiIAExh6vmPi8
	O0j6aR1NzzXUwTQi8nKDLMA/bEwXPN1i7tK3PJjnD24o3KWyVvRw0K6gk7R7fmHOGPch51
	i9FOoRWp66pTkuRpFyysN+iy/i8d8XA=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 08/15] xen: use generated prototypes for hypercall handlers
Date: Mon,  1 Nov 2021 16:20:08 +0100
Message-Id: <20211101152015.28488-9-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211101152015.28488-1-jgross@suse.com>
References: <20211101152015.28488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the hypercall handler's prototypes in the related header files
and use the generated ones instead.

Some handlers having been static before need to be made globally
visible.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/hvm/hypercall.c    |   6 +-
 xen/include/asm-x86/hypercall.h | 133 ------------------------
 xen/include/xen/hypercall.h     | 179 +-------------------------------
 3 files changed, 5 insertions(+), 313 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 9d3b193bad..85b7a33523 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -31,7 +31,7 @@
 #include <public/hvm/hvm_op.h>
 #include <public/hvm/params.h>
 
-static long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc;
 
@@ -51,7 +51,7 @@ static long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 }
 
 #ifdef CONFIG_GRANT_TABLE
-static long hvm_grant_table_op(
+long hvm_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     switch ( cmd )
@@ -77,7 +77,7 @@ static long hvm_grant_table_op(
 }
 #endif
 
-static long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     const struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
diff --git a/xen/include/asm-x86/hypercall.h b/xen/include/asm-x86/hypercall.h
index efe5963ee5..2547572ccd 100644
--- a/xen/include/asm-x86/hypercall.h
+++ b/xen/include/asm-x86/hypercall.h
@@ -52,104 +52,6 @@ void pv_ring3_init_hypercall_page(void *ptr);
  */
 #define MMU_UPDATE_PREEMPTED          (~(~0U>>1))
 
-extern long
-do_event_channel_op_compat(
-    XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop);
-
-/* Legacy hypercall (as of 0x00030202). */
-extern long do_physdev_op_compat(
-    XEN_GUEST_HANDLE(physdev_op_t) uop);
-
-/* Legacy hypercall (as of 0x00030101). */
-extern long do_sched_op_compat(
-    int cmd, unsigned long arg);
-
-extern long
-do_set_trap_table(
-    XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps);
-
-extern long
-do_mmu_update(
-    XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
-    unsigned int count,
-    XEN_GUEST_HANDLE_PARAM(uint) pdone,
-    unsigned int foreigndom);
-
-extern long
-do_set_gdt(
-    XEN_GUEST_HANDLE_PARAM(xen_ulong_t) frame_list,
-    unsigned int entries);
-
-extern long
-do_stack_switch(
-    unsigned long ss,
-    unsigned long esp);
-
-extern long
-do_fpu_taskswitch(
-    int set);
-
-extern long
-do_set_debugreg(
-    int reg,
-    unsigned long value);
-
-extern long
-do_get_debugreg(
-    int reg);
-
-extern long
-do_update_descriptor(
-    uint64_t gaddr, seg_desc_t desc);
-
-extern long
-do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc);
-
-extern long
-do_update_va_mapping(
-    unsigned long va,
-    uint64_t val64,
-    unsigned long flags);
-
-extern long
-do_update_va_mapping_otherdomain(
-    unsigned long va,
-    uint64_t val64,
-    unsigned long flags,
-    domid_t domid);
-
-extern long
-do_mmuext_op(
-    XEN_GUEST_HANDLE_PARAM(mmuext_op_t) uops,
-    unsigned int count,
-    XEN_GUEST_HANDLE_PARAM(uint) pdone,
-    unsigned int foreigndom);
-
-extern long do_callback_op(
-    int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg);
-
-extern long
-do_iret(
-    void);
-
-extern long
-do_set_callbacks(
-    unsigned long event_address,
-    unsigned long failsafe_address,
-    unsigned long syscall_address);
-
-extern long
-do_set_segment_base(
-    unsigned int which,
-    unsigned long base);
-
-long do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-long do_xenpmu_op(unsigned int op,
-                  XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg);
-
-long do_paging_domctl_cont(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
-
 #ifdef CONFIG_COMPAT
 
 #include <compat/arch-x86/xen.h>
@@ -159,41 +61,6 @@ extern int
 compat_common_vcpu_op(
     int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg);
 
-extern int compat_mmuext_op(
-    XEN_GUEST_HANDLE_PARAM(void) arg,
-    unsigned int count,
-    XEN_GUEST_HANDLE_PARAM(uint) pdone,
-    unsigned int foreigndom);
-
-extern int compat_callback_op(
-    int cmd, XEN_GUEST_HANDLE(const_void) arg);
-
-extern int compat_update_va_mapping(
-    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags);
-
-extern int compat_update_va_mapping_otherdomain(
-    unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags, domid_t domid);
-
-DEFINE_XEN_GUEST_HANDLE(trap_info_compat_t);
-extern int compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps);
-
-extern int compat_set_gdt(
-    XEN_GUEST_HANDLE_PARAM(uint) frame_list, unsigned int entries);
-
-extern int compat_update_descriptor(
-    uint32_t pa_lo, uint32_t pa_hi, uint32_t desc_lo, uint32_t desc_hi);
-
-extern int compat_iret(void);
-
-extern int compat_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int compat_set_callbacks(
-    unsigned long event_selector, unsigned long event_address,
-    unsigned long failsafe_selector, unsigned long failsafe_address);
-
-DEFINE_XEN_GUEST_HANDLE(physdev_op_compat_t);
-extern int compat_physdev_op_compat(XEN_GUEST_HANDLE(physdev_op_compat_t) uop);
-
 #endif /* CONFIG_COMPAT */
 
 #endif /* __ASM_X86_HYPERCALL_H__ */
diff --git a/xen/include/xen/hypercall.h b/xen/include/xen/hypercall.h
index 9266bc86e9..cf6a3c463d 100644
--- a/xen/include/xen/hypercall.h
+++ b/xen/include/xen/hypercall.h
@@ -18,33 +18,19 @@
 #include <asm/hypercall.h>
 #include <xsm/xsm.h>
 
-extern long
-do_sched_op(
-    int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long
-do_domctl(
-    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
+/* Needs to be after asm/hypercall.h. */
+#include <xen/hypercall-defs.h>
 
 extern long
 arch_do_domctl(
     struct xen_domctl *domctl, struct domain *d,
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
 
-extern long
-do_sysctl(
-    XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl);
-
 extern long
 arch_do_sysctl(
     struct xen_sysctl *sysctl,
     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl);
 
-extern long
-do_platform_op(
-    XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op);
-
 extern long
 pci_physdev_op(
     int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
@@ -62,172 +48,11 @@ pci_physdev_op(
 #define MEMOP_EXTENT_SHIFT 6 /* cmd[:6] == start_extent */
 #define MEMOP_CMD_MASK     ((1 << MEMOP_EXTENT_SHIFT) - 1)
 
-extern long
-do_memory_op(
-    unsigned long cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long
-do_multicall(
-    XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list,
-    unsigned int nr_calls);
-
-extern long
-do_set_timer_op(
-    s_time_t timeout);
-
-extern long
-do_event_channel_op(
-    int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long
-do_xen_version(
-    int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long
-do_console_io(
-    unsigned int cmd,
-    unsigned int count,
-    XEN_GUEST_HANDLE_PARAM(char) buffer);
-
-extern long
-do_grant_table_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) uop,
-    unsigned int count);
-
-extern long
-do_vm_assist(
-    unsigned int cmd,
-    unsigned int type);
-
-extern long
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
 
-extern long
-do_hvm_op(
-    unsigned long op,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long
-do_kexec_op(
-    unsigned int op,
-    XEN_GUEST_HANDLE_PARAM(void) uarg);
-
-extern long
-do_xsm_op(
-    XEN_GUEST_HANDLE_PARAM(void) u_xsm_op);
-
-long do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-#ifdef CONFIG_ARGO
-extern long do_argo_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg1,
-    XEN_GUEST_HANDLE_PARAM(void) arg2,
-    unsigned long arg3,
-    unsigned long arg4);
-#endif
-
-extern long
-do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern long
-do_dm_op(
-    domid_t domid,
-    unsigned int nr_bufs,
-    XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs);
-
-#ifdef CONFIG_HYPFS
-extern long
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
-extern int
-compat_memory_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int
-compat_grant_table_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) uop,
-    unsigned int count);
-
-extern int
-compat_vcpu_op(
-    int cmd,
-    unsigned int vcpuid,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int
-compat_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int
-compat_xen_version(
-    int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int
-compat_sched_op(
-    int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg);
-
-extern int
-compat_set_timer_op(
-    uint32_t lo,
-    int32_t hi);
-
-extern int compat_xsm_op(
-    XEN_GUEST_HANDLE_PARAM(void) op);
-
-extern int compat_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg);
-
-DEFINE_XEN_GUEST_HANDLE(multicall_entry_compat_t);
-extern int compat_multicall(
-    XEN_GUEST_HANDLE_PARAM(multicall_entry_compat_t) call_list,
-    uint32_t nr_calls);
-
-int compat_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-
-typedef struct compat_platform_op compat_platform_op_t;
-DEFINE_XEN_GUEST_HANDLE(compat_platform_op_t);
-int compat_platform_op(XEN_GUEST_HANDLE_PARAM(compat_platform_op_t) u_xenpf_op);
-
-#ifdef CONFIG_ARGO
-extern int compat_argo_op(
-    unsigned int cmd,
-    XEN_GUEST_HANDLE_PARAM(void) arg1,
-    XEN_GUEST_HANDLE_PARAM(void) arg2,
-    unsigned long arg3,
-    unsigned long arg4);
-#endif
-
-extern int
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
2.26.2


