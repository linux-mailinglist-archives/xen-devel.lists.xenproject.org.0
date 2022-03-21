Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED44E210D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 08:16:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292757.497139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWCGN-0000xS-D8; Mon, 21 Mar 2022 07:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292757.497139; Mon, 21 Mar 2022 07:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWCGN-0000uS-8q; Mon, 21 Mar 2022 07:15:35 +0000
Received: by outflank-mailman (input) for mailman id 292757;
 Mon, 21 Mar 2022 07:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hCO=UA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nWCGL-0000eJ-BJ
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 07:15:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b124b63b-a8e6-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 08:15:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C355A210E4;
 Mon, 21 Mar 2022 07:15:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B229139FF;
 Mon, 21 Mar 2022 07:15:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sPTxGBImOGKEGgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Mar 2022 07:15:30 +0000
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
X-Inumbo-ID: b124b63b-a8e6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647846930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hyHM1LmjK8Su7htsQmIWVR4BMXmMMMJAFNTJDjEoFsI=;
	b=KNdhUSY9ZxZyjkooUcj9w4yjwwrr11zdnERCUwwmtPduRwcEYG/BX8XGtMBZdko7FqpS46
	jdcSebM6g+53g0kyJj01P0/EJm9XaD5x6HOXC+tM0r0Kmp1QowMehvOnvfre+RzHL1R9W7
	17U6zv2u7fXku5gZ+AXK60mJPiFmFVM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Christopher Clark <christopher.w.clark@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4.1 11/11] xen/x86: remove cf_check attribute from hypercall handlers
Date: Mon, 21 Mar 2022 08:15:27 +0100
Message-Id: <20220321071527.1946-2-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220321071527.1946-1-jgross@suse.com>
References: <20220310073420.15622-1-jgross@suse.com>
 <20220321071527.1946-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the hypercall handlers are all being called directly instead
through a function vector, the "cf_check" attribute can be removed.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com> # xsm parts
Acked-by: Jan Beulich <jbeulich@suse.com>
---
V4:
- new patch
---
 xen/arch/x86/compat.c               |  6 +++---
 xen/arch/x86/cpu/mcheck/mce.c       |  2 +-
 xen/arch/x86/cpu/vpmu.c             |  2 +-
 xen/arch/x86/domain.c               |  3 +--
 xen/arch/x86/hvm/dm.c               |  2 +-
 xen/arch/x86/hvm/hvm.c              |  2 +-
 xen/arch/x86/hvm/hypercall.c        |  6 +++---
 xen/arch/x86/mm.c                   | 12 ++++++------
 xen/arch/x86/mm/paging.c            |  2 +-
 xen/arch/x86/physdev.c              |  2 +-
 xen/arch/x86/platform_hypercall.c   |  2 +-
 xen/arch/x86/pv/callback.c          | 16 ++++++++--------
 xen/arch/x86/pv/descriptor-tables.c |  8 ++++----
 xen/arch/x86/pv/iret.c              |  4 ++--
 xen/arch/x86/pv/misc-hypercalls.c   | 10 +++++-----
 xen/arch/x86/pv/shim.c              |  4 ++--
 xen/arch/x86/x86_64/compat/mm.c     |  2 +-
 xen/arch/x86/x86_64/domain.c        |  2 +-
 xen/common/argo.c                   |  4 ++--
 xen/common/compat/grant_table.c     |  2 +-
 xen/common/compat/kernel.c          |  2 +-
 xen/common/compat/memory.c          |  3 +--
 xen/common/dm.c                     |  2 +-
 xen/common/domain.c                 |  2 +-
 xen/common/domctl.c                 |  2 +-
 xen/common/event_channel.c          |  2 +-
 xen/common/grant_table.c            |  3 +--
 xen/common/hypfs.c                  |  2 +-
 xen/common/kernel.c                 |  2 +-
 xen/common/kexec.c                  |  4 ++--
 xen/common/memory.c                 |  2 +-
 xen/common/multicall.c              |  3 +--
 xen/common/sched/compat.c           |  2 +-
 xen/common/sched/core.c             |  4 ++--
 xen/common/sysctl.c                 |  2 +-
 xen/common/xenoprof.c               |  2 +-
 xen/drivers/char/console.c          |  2 +-
 xen/scripts/gen_hypercall.awk       |  2 +-
 xen/xsm/xsm_core.c                  |  4 ++--
 39 files changed, 68 insertions(+), 72 deletions(-)

diff --git a/xen/arch/x86/compat.c b/xen/arch/x86/compat.c
index 28281a262a..a031062830 100644
--- a/xen/arch/x86/compat.c
+++ b/xen/arch/x86/compat.c
@@ -15,7 +15,7 @@ typedef long ret_t;
 #endif
 
 /* Legacy hypercall (as of 0x00030202). */
-ret_t cf_check do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
+ret_t do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
 {
     struct physdev_op op;
 
@@ -28,7 +28,7 @@ ret_t cf_check do_physdev_op_compat(XEN_GUEST_HANDLE_PARAM(physdev_op_t) uop)
 #ifndef COMPAT
 
 /* Legacy hypercall (as of 0x00030101). */
-long cf_check do_sched_op_compat(int cmd, unsigned long arg)
+long do_sched_op_compat(int cmd, unsigned long arg)
 {
     switch ( cmd )
     {
@@ -50,7 +50,7 @@ long cf_check do_sched_op_compat(int cmd, unsigned long arg)
 }
 
 /* Legacy hypercall (as of 0x00030202). */
-long cf_check do_event_channel_op_compat(
+long do_event_channel_op_compat(
     XEN_GUEST_HANDLE_PARAM(evtchn_op_t) uop)
 {
     struct evtchn_op op;
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 275c54be7c..f68e31b643 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1351,7 +1351,7 @@ CHECK_mcinfo_recovery;
 # endif /* CONFIG_COMPAT */
 
 /* Machine Check Architecture Hypercall */
-long cf_check do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
+long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
 {
     long ret = 0;
     struct xen_mc curop, *op = &curop;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index 51d171615f..d2c03a1104 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -672,7 +672,7 @@ void vpmu_dump(struct vcpu *v)
         alternative_vcall(vpmu_ops.arch_vpmu_dump, v);
 }
 
-long cf_check do_xenpmu_op(
+long do_xenpmu_op(
     unsigned int op, XEN_GUEST_HANDLE_PARAM(xen_pmu_params_t) arg)
 {
     int ret;
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d566fc82b4..ddf969f76e 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1489,8 +1489,7 @@ int arch_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
-long cf_check do_vcpu_op(int cmd, unsigned int vcpuid,
-                         XEN_GUEST_HANDLE_PARAM(void) arg)
+long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
     struct domain *d = current->domain;
diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
index d80975efcf..f8e6089870 100644
--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -654,7 +654,7 @@ CHECK_dm_op_relocate_memory;
 CHECK_dm_op_pin_memory_cacheattr;
 CHECK_dm_op_nr_vcpus;
 
-int cf_check compat_dm_op(
+int compat_dm_op(
     domid_t domid, unsigned int nr_bufs, XEN_GUEST_HANDLE_PARAM(void) bufs)
 {
     struct dmop_args args;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 709a4191ef..9b3973dad8 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5022,7 +5022,7 @@ static int hvmop_get_mem_type(
     return rc;
 }
 
-long cf_check do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
+long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc = 0;
 
diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index ae601185fc..29d1ca7a13 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -31,7 +31,7 @@
 #include <public/hvm/hvm_op.h>
 #include <public/hvm/params.h>
 
-long cf_check hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     long rc;
 
@@ -51,7 +51,7 @@ long cf_check hvm_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 }
 
 #ifdef CONFIG_GRANT_TABLE
-long cf_check hvm_grant_table_op(
+long hvm_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     switch ( cmd )
@@ -77,7 +77,7 @@ long cf_check hvm_grant_table_op(
 }
 #endif
 
-long cf_check hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     const struct vcpu *curr = current;
     const struct domain *currd = curr->domain;
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 6cc73187ac..a958142d17 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -3377,7 +3377,7 @@ static int vcpumask_to_pcpumask(
     }
 }
 
-long cf_check do_mmuext_op(
+long do_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(mmuext_op_t) uops,
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
@@ -3916,7 +3916,7 @@ long cf_check do_mmuext_op(
     return rc;
 }
 
-long cf_check do_mmu_update(
+long do_mmu_update(
     XEN_GUEST_HANDLE_PARAM(mmu_update_t) ureqs,
     unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone,
@@ -4501,7 +4501,7 @@ static int __do_update_va_mapping(
     return rc;
 }
 
-long cf_check do_update_va_mapping(
+long do_update_va_mapping(
     unsigned long va, u64 val64, unsigned long flags)
 {
     int rc = __do_update_va_mapping(va, val64, flags, current->domain);
@@ -4513,7 +4513,7 @@ long cf_check do_update_va_mapping(
     return rc;
 }
 
-long cf_check do_update_va_mapping_otherdomain(
+long do_update_va_mapping_otherdomain(
     unsigned long va, u64 val64, unsigned long flags, domid_t domid)
 {
     struct domain *pg_owner;
@@ -4536,7 +4536,7 @@ long cf_check do_update_va_mapping_otherdomain(
 #endif /* CONFIG_PV */
 
 #ifdef CONFIG_PV32
-int cf_check compat_update_va_mapping(
+int compat_update_va_mapping(
     unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags)
 {
     int rc = __do_update_va_mapping(va, ((uint64_t)hi << 32) | lo,
@@ -4549,7 +4549,7 @@ int cf_check compat_update_va_mapping(
     return rc;
 }
 
-int cf_check compat_update_va_mapping_otherdomain(
+int compat_update_va_mapping_otherdomain(
     unsigned int va, uint32_t lo, uint32_t hi, unsigned int flags,
     domid_t domid)
 {
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index a7e2707ecc..cb1bfcbde5 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -760,7 +760,7 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
         return shadow_domctl(d, sc, u_domctl);
 }
 
-long cf_check do_paging_domctl_cont(
+long do_paging_domctl_cont(
     XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     struct xen_domctl op;
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 2ddcf44f33..ea38be8b79 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -174,7 +174,7 @@ int physdev_unmap_pirq(domid_t domid, int pirq)
 }
 #endif /* COMPAT */
 
-ret_t cf_check do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int irq;
     ret_t ret;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index eeb4f7a20e..a7341dc3d7 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -214,7 +214,7 @@ void cf_check resource_access(void *info)
 }
 #endif
 
-ret_t cf_check do_platform_op(
+ret_t do_platform_op(
     XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
 {
     ret_t ret;
diff --git a/xen/arch/x86/pv/callback.c b/xen/arch/x86/pv/callback.c
index 1be9d3f731..067ee3b795 100644
--- a/xen/arch/x86/pv/callback.c
+++ b/xen/arch/x86/pv/callback.c
@@ -140,7 +140,7 @@ static long unregister_guest_callback(struct callback_unregister *unreg)
     return ret;
 }
 
-long cf_check do_callback_op(int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg)
+long do_callback_op(int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg)
 {
     long ret;
 
@@ -178,7 +178,7 @@ long cf_check do_callback_op(int cmd, XEN_GUEST_HANDLE_PARAM(const_void) arg)
     return ret;
 }
 
-long cf_check do_set_callbacks(
+long do_set_callbacks(
     unsigned long event_address, unsigned long failsafe_address,
     unsigned long syscall_address)
 {
@@ -283,7 +283,7 @@ static int compat_unregister_guest_callback(
     return ret;
 }
 
-int cf_check compat_callback_op(int cmd, XEN_GUEST_HANDLE(const_void) arg)
+int compat_callback_op(int cmd, XEN_GUEST_HANDLE(const_void) arg)
 {
     int ret;
 
@@ -321,7 +321,7 @@ int cf_check compat_callback_op(int cmd, XEN_GUEST_HANDLE(const_void) arg)
     return ret;
 }
 
-int cf_check compat_set_callbacks(
+int compat_set_callbacks(
     unsigned long event_selector, unsigned long event_address,
     unsigned long failsafe_selector, unsigned long failsafe_address)
 {
@@ -348,7 +348,7 @@ int cf_check compat_set_callbacks(
 
 #endif /* CONFIG_PV32 */
 
-long cf_check do_set_trap_table(XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps)
+long do_set_trap_table(XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps)
 {
     struct trap_info cur;
     struct vcpu *curr = current;
@@ -394,7 +394,7 @@ long cf_check do_set_trap_table(XEN_GUEST_HANDLE_PARAM(const_trap_info_t) traps)
 }
 
 #ifdef CONFIG_PV32
-int cf_check compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps)
+int compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps)
 {
     struct vcpu *curr = current;
     struct compat_trap_info cur;
@@ -437,7 +437,7 @@ int cf_check compat_set_trap_table(XEN_GUEST_HANDLE(trap_info_compat_t) traps)
 }
 #endif
 
-long cf_check do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct xennmi_callback cb;
     long rc = 0;
@@ -463,7 +463,7 @@ long cf_check do_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 }
 
 #ifdef CONFIG_PV32
-int cf_check compat_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+int compat_nmi_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct compat_nmi_callback cb;
     int rc = 0;
diff --git a/xen/arch/x86/pv/descriptor-tables.c b/xen/arch/x86/pv/descriptor-tables.c
index 653a61d0b5..b4135b450c 100644
--- a/xen/arch/x86/pv/descriptor-tables.c
+++ b/xen/arch/x86/pv/descriptor-tables.c
@@ -124,7 +124,7 @@ int pv_set_gdt(struct vcpu *v, const unsigned long frames[],
     return -EINVAL;
 }
 
-long cf_check do_set_gdt(
+long do_set_gdt(
     XEN_GUEST_HANDLE_PARAM(xen_ulong_t) frame_list, unsigned int entries)
 {
     unsigned int nr_frames = DIV_ROUND_UP(entries, 512);
@@ -151,7 +151,7 @@ long cf_check do_set_gdt(
 
 #ifdef CONFIG_PV32
 
-int cf_check compat_set_gdt(
+int compat_set_gdt(
     XEN_GUEST_HANDLE_PARAM(uint) frame_list, unsigned int entries)
 {
     struct vcpu *curr = current;
@@ -187,7 +187,7 @@ int cf_check compat_set_gdt(
     return ret;
 }
 
-int cf_check compat_update_descriptor(
+int compat_update_descriptor(
     uint32_t pa_lo, uint32_t pa_hi, uint32_t desc_lo, uint32_t desc_hi)
 {
     seg_desc_t d;
@@ -299,7 +299,7 @@ int validate_segdesc_page(struct page_info *page)
     return i == 512 ? 0 : -EINVAL;
 }
 
-long cf_check do_update_descriptor(uint64_t gaddr, seg_desc_t d)
+long do_update_descriptor(uint64_t gaddr, seg_desc_t d)
 {
     struct domain *currd = current->domain;
     gfn_t gfn = gaddr_to_gfn(gaddr);
diff --git a/xen/arch/x86/pv/iret.c b/xen/arch/x86/pv/iret.c
index 58de9f7922..316a23e77e 100644
--- a/xen/arch/x86/pv/iret.c
+++ b/xen/arch/x86/pv/iret.c
@@ -49,7 +49,7 @@ static void async_exception_cleanup(struct vcpu *curr)
         curr->arch.async_exception_state(trap).old_mask;
 }
 
-long cf_check do_iret(void)
+long do_iret(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct iret_context iret_saved;
@@ -106,7 +106,7 @@ long cf_check do_iret(void)
 }
 
 #ifdef CONFIG_PV32
-int cf_check compat_iret(void)
+int compat_iret(void)
 {
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     struct vcpu *v = current;
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 635f5a644a..aaaf70eb63 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -23,12 +23,12 @@
 
 #include <asm/debugreg.h>
 
-long cf_check do_set_debugreg(int reg, unsigned long value)
+long do_set_debugreg(int reg, unsigned long value)
 {
     return set_debugreg(current, reg, value);
 }
 
-long cf_check do_get_debugreg(int reg)
+long do_get_debugreg(int reg)
 {
     /* Avoid implementation defined behavior casting unsigned long to long. */
     union {
@@ -40,7 +40,7 @@ long cf_check do_get_debugreg(int reg)
     return res == X86EMUL_OKAY ? u.ret : -ENODEV;
 }
 
-long cf_check do_fpu_taskswitch(int set)
+long do_fpu_taskswitch(int set)
 {
     struct vcpu *v = current;
 
@@ -175,7 +175,7 @@ long set_debugreg(struct vcpu *v, unsigned int reg, unsigned long value)
     return 0;
 }
 
-long cf_check do_stack_switch(unsigned long ss, unsigned long esp)
+long do_stack_switch(unsigned long ss, unsigned long esp)
 {
     fixup_guest_stack_selector(current->domain, ss);
     current->arch.pv.kernel_ss = ss;
@@ -184,7 +184,7 @@ long cf_check do_stack_switch(unsigned long ss, unsigned long esp)
     return 0;
 }
 
-long cf_check do_set_segment_base(unsigned int which, unsigned long base)
+long do_set_segment_base(unsigned int which, unsigned long base)
 {
     struct vcpu *v = current;
     long ret = 0;
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 2ee290a392..2b74fea181 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -824,7 +824,7 @@ long pv_shim_grant_table_op(unsigned int cmd,
 
 #ifndef CONFIG_GRANT_TABLE
 /* Thin wrapper(s) needed. */
-long cf_check do_grant_table_op(
+long do_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     if ( !pv_shim )
@@ -834,7 +834,7 @@ long cf_check do_grant_table_op(
 }
 
 #ifdef CONFIG_PV32
-int cf_check compat_grant_table_op(
+int compat_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     if ( !pv_shim )
diff --git a/xen/arch/x86/x86_64/compat/mm.c b/xen/arch/x86/x86_64/compat/mm.c
index 70b08a832a..d54efaad21 100644
--- a/xen/arch/x86/x86_64/compat/mm.c
+++ b/xen/arch/x86/x86_64/compat/mm.c
@@ -177,7 +177,7 @@ int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #ifdef CONFIG_PV
 DEFINE_XEN_GUEST_HANDLE(mmuext_op_compat_t);
 
-int cf_check compat_mmuext_op(
+int compat_mmuext_op(
     XEN_GUEST_HANDLE_PARAM(void) arg, unsigned int count,
     XEN_GUEST_HANDLE_PARAM(uint) pdone, unsigned int foreigndom)
 {
diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
index 9c559aa3ea..62fe51ee74 100644
--- a/xen/arch/x86/x86_64/domain.c
+++ b/xen/arch/x86/x86_64/domain.c
@@ -12,7 +12,7 @@
 CHECK_vcpu_get_physid;
 #undef xen_vcpu_get_physid
 
-int cf_check
+int
 compat_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int rc;
diff --git a/xen/common/argo.c b/xen/common/argo.c
index 26a01c2188..748b8714d6 100644
--- a/xen/common/argo.c
+++ b/xen/common/argo.c
@@ -2069,7 +2069,7 @@ sendv(struct domain *src_d, xen_argo_addr_t *src_addr,
     return ( ret < 0 ) ? ret : len;
 }
 
-long cf_check
+long
 do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
            XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long raw_arg3,
            unsigned long raw_arg4)
@@ -2207,7 +2207,7 @@ do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
 }
 
 #ifdef CONFIG_COMPAT
-int cf_check
+int
 compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
                XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
                unsigned long arg4)
diff --git a/xen/common/compat/grant_table.c b/xen/common/compat/grant_table.c
index d5787e3719..4705ee5f76 100644
--- a/xen/common/compat/grant_table.c
+++ b/xen/common/compat/grant_table.c
@@ -56,7 +56,7 @@ CHECK_gnttab_swap_grant_ref;
 CHECK_gnttab_cache_flush;
 #undef xen_gnttab_cache_flush
 
-int cf_check compat_grant_table_op(
+int compat_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) cmp_uop, unsigned int count)
 {
     int rc = 0;
diff --git a/xen/common/compat/kernel.c b/xen/common/compat/kernel.c
index 8e8c413bf1..804b919bdc 100644
--- a/xen/common/compat/kernel.c
+++ b/xen/common/compat/kernel.c
@@ -37,7 +37,7 @@ CHECK_TYPE(capabilities_info);
 
 CHECK_TYPE(domain_handle);
 
-#define DO(fn) int cf_check compat_##fn
+#define DO(fn) int compat_##fn
 #define COMPAT
 
 #include "../kernel.c"
diff --git a/xen/common/compat/memory.c b/xen/common/compat/memory.c
index 077ded4a75..ce1de1b307 100644
--- a/xen/common/compat/memory.c
+++ b/xen/common/compat/memory.c
@@ -53,8 +53,7 @@ static int cf_check get_reserved_device_memory(
 }
 #endif
 
-int cf_check compat_memory_op(
-    unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
+int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
 {
     struct vcpu *curr = current;
     struct domain *currd = curr->domain;
diff --git a/xen/common/dm.c b/xen/common/dm.c
index fcb3a1aa05..201b652deb 100644
--- a/xen/common/dm.c
+++ b/xen/common/dm.c
@@ -19,7 +19,7 @@
 #include <xen/hypercall.h>
 #include <xen/nospec.h>
 
-long cf_check do_dm_op(
+long do_dm_op(
     domid_t domid, unsigned int nr_bufs,
     XEN_GUEST_HANDLE_PARAM(xen_dm_op_buf_t) bufs)
 {
diff --git a/xen/common/domain.c b/xen/common/domain.c
index f9de1be43c..48a22776a2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1754,7 +1754,7 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 }
 
 #ifdef arch_vm_assist_valid_mask
-long cf_check do_vm_assist(unsigned int cmd, unsigned int type)
+long do_vm_assist(unsigned int cmd, unsigned int type)
 {
     struct domain *currd = current->domain;
     const unsigned long valid = arch_vm_assist_valid_mask(currd);
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 9606fa4f1a..879a2adcbe 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -274,7 +274,7 @@ static struct vnuma_info *vnuma_init(const struct xen_domctl_vnuma *uinfo,
     return ERR_PTR(ret);
 }
 
-long cf_check do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 {
     long ret = 0;
     bool_t copyback = 0;
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 0a82eb3ac2..5e2420fa12 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1191,7 +1191,7 @@ static int evtchn_set_priority(const struct evtchn_set_priority *set_priority)
     return ret;
 }
 
-long cf_check do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int rc;
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index febbe12eab..c71d3ad24b 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3559,8 +3559,7 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) uop,
     return 0;
 }
 
-long cf_check
-do_grant_table_op(
+long do_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
     long rc;
diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
index 0d22396f5d..acd258edf2 100644
--- a/xen/common/hypfs.c
+++ b/xen/common/hypfs.c
@@ -670,7 +670,7 @@ static int hypfs_write(struct hypfs_entry *entry,
     return entry->funcs->write(l, uaddr, ulen);
 }
 
-long cf_check do_hypfs_op(
+long do_hypfs_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(const_char) arg1,
     unsigned long arg2, XEN_GUEST_HANDLE_PARAM(void) arg3, unsigned long arg4)
 {
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index adff2d2c77..08bdae082a 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -451,7 +451,7 @@ static int __init cf_check param_init(void)
 __initcall(param_init);
 #endif
 
-# define DO(fn) long cf_check do_##fn
+# define DO(fn) long do_##fn
 
 #endif
 
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 41669964d2..7095651605 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -1265,13 +1265,13 @@ static int do_kexec_op_internal(unsigned int op,
     return ret;
 }
 
-long cf_check do_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg)
+long do_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     return do_kexec_op_internal(op, uarg, 0);
 }
 
 #ifdef CONFIG_COMPAT
-int cf_check compat_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg)
+int compat_kexec_op(unsigned int op, XEN_GUEST_HANDLE_PARAM(void) uarg)
 {
     return do_kexec_op_internal(op, uarg, 1);
 }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 69b0cd1e50..963f4df1b6 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1367,7 +1367,7 @@ static int acquire_resource(
     return rc;
 }
 
-long cf_check do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     struct domain *d, *curr_d = current->domain;
     long rc;
diff --git a/xen/common/multicall.c b/xen/common/multicall.c
index 9db49092b4..1f0cc4cb26 100644
--- a/xen/common/multicall.c
+++ b/xen/common/multicall.c
@@ -33,8 +33,7 @@ static void trace_multicall_call(multicall_entry_t *call)
     __trace_multicall_call(call);
 }
 
-ret_t cf_check
-do_multicall(
+ret_t do_multicall(
     XEN_GUEST_HANDLE_PARAM(multicall_entry_t) call_list, uint32_t nr_calls)
 {
     struct vcpu *curr = current;
diff --git a/xen/common/sched/compat.c b/xen/common/sched/compat.c
index 66ba0fe88f..040b4caca2 100644
--- a/xen/common/sched/compat.c
+++ b/xen/common/sched/compat.c
@@ -39,7 +39,7 @@ static int compat_poll(struct compat_sched_poll *compat)
 
 #include "core.c"
 
-int cf_check compat_set_timer_op(u32 lo, s32 hi)
+int compat_set_timer_op(u32 lo, s32 hi)
 {
     return do_set_timer_op(((s64)hi << 32) | lo);
 }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 19ab678181..25885b5640 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1862,7 +1862,7 @@ typedef long ret_t;
 
 #endif /* !COMPAT */
 
-ret_t cf_check do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
+ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     ret_t ret = 0;
 
@@ -1999,7 +1999,7 @@ ret_t cf_check do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 #ifndef COMPAT
 
 /* Per-vcpu oneshot-timer hypercall. */
-long cf_check do_set_timer_op(s_time_t timeout)
+long do_set_timer_op(s_time_t timeout)
 {
     struct vcpu *v = current;
     s_time_t offset = timeout - NOW();
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index fc4a0b31d6..1ad3c29351 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -29,7 +29,7 @@
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
 
-long cf_check do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
+long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
     long ret = 0;
     int copyback = -1;
diff --git a/xen/common/xenoprof.c b/xen/common/xenoprof.c
index af617f1d0b..1926a92fe4 100644
--- a/xen/common/xenoprof.c
+++ b/xen/common/xenoprof.c
@@ -721,7 +721,7 @@ static int xenoprof_op_get_buffer(XEN_GUEST_HANDLE_PARAM(void) arg)
                       || (op == XENOPROF_disable_virq)  \
                       || (op == XENOPROF_get_buffer))
  
-ret_t cf_check do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
+ret_t do_xenoprof_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int ret = 0;
     
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index d9d6556c22..c53fe30313 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -675,7 +675,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
     return 0;
 }
 
-long cf_check do_console_io(
+long do_console_io(
     unsigned int cmd, unsigned int count, XEN_GUEST_HANDLE_PARAM(char) buffer)
 {
     long rc;
diff --git a/xen/scripts/gen_hypercall.awk b/xen/scripts/gen_hypercall.awk
index 403758be21..34840c514f 100644
--- a/xen/scripts/gen_hypercall.awk
+++ b/xen/scripts/gen_hypercall.awk
@@ -226,7 +226,7 @@ END {
     # Generate prototypes
     for (i = 1; i <= n; i++) {
         for (p = 1; p <= n_pre[i]; p++) {
-            printf("%s cf_check %s_%s(", rettype[pre[i, p]], pre[i, p], fn[i]);
+            printf("%s %s_%s(", rettype[pre[i, p]], pre[i, p], fn[i]);
             if (n_args[i] == 0)
                 printf("void");
             else
diff --git a/xen/xsm/xsm_core.c b/xen/xsm/xsm_core.c
index 2286a502e3..eaa028109b 100644
--- a/xen/xsm/xsm_core.c
+++ b/xen/xsm/xsm_core.c
@@ -219,13 +219,13 @@ bool __init has_xsm_magic(paddr_t start)
 
 #endif
 
-long cf_check do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
+long do_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_do_xsm_op(op);
 }
 
 #ifdef CONFIG_COMPAT
-int cf_check compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
+int compat_xsm_op(XEN_GUEST_HANDLE_PARAM(void) op)
 {
     return xsm_do_compat_op(op);
 }
-- 
2.34.1


