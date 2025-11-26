Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 941FCC8AEDE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173065.1498161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIFp-0003o9-N6; Wed, 26 Nov 2025 16:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173065.1498161; Wed, 26 Nov 2025 16:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOIFp-0003mg-K0; Wed, 26 Nov 2025 16:20:29 +0000
Received: by outflank-mailman (input) for mailman id 1173065;
 Wed, 26 Nov 2025 16:20:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ehTD=6C=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vOIFn-0003Yk-Ok
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:20:27 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1688b9e-cae3-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 17:20:27 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AE63E5BE51;
 Wed, 26 Nov 2025 16:20:26 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3AB3C3EA63;
 Wed, 26 Nov 2025 16:20:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4F7vDMooJ2lnLQAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 26 Nov 2025 16:20:26 +0000
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
X-Inumbo-ID: d1688b9e-cae3-11f0-9d18-b5c5bf9af7f9
Authentication-Results: smtp-out2.suse.de;
	none
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/5] x86/paravirt: Replace io_delay() hook with a bool
Date: Wed, 26 Nov 2025 17:20:14 +0100
Message-ID: <20251126162018.5676-2-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126162018.5676-1-jgross@suse.com>
References: <20251126162018.5676-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: AE63E5BE51
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

The io_delay() paravirt hook is in no way performance critical and all
users setting it to a different function than native_io_delay() are
using an empty function as replacement.

This enables to replace the hook with a bool indicating whether
native_io_delay() should be called.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/include/asm/io.h             |  7 +++++--
 arch/x86/include/asm/paravirt.h       | 11 +----------
 arch/x86/include/asm/paravirt_types.h |  3 +--
 arch/x86/kernel/cpu/vmware.c          |  2 +-
 arch/x86/kernel/kvm.c                 |  8 +-------
 arch/x86/kernel/paravirt.c            |  3 +--
 arch/x86/xen/enlighten_pv.c           |  6 +-----
 7 files changed, 11 insertions(+), 29 deletions(-)

diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index ca309a3227c7..0448575569b9 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -245,9 +245,14 @@ extern void io_delay_init(void);
 #if defined(CONFIG_PARAVIRT)
 #include <asm/paravirt.h>
 #else
+#define call_io_delay() true
+#endif
 
 static inline void slow_down_io(void)
 {
+	if (!call_io_delay())
+		return;
+
 	native_io_delay();
 #ifdef REALLY_SLOW_IO
 	native_io_delay();
@@ -256,8 +261,6 @@ static inline void slow_down_io(void)
 #endif
 }
 
-#endif
-
 #define BUILDIO(bwl, type)						\
 static inline void out##bwl##_p(type value, u16 port)			\
 {									\
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index b5e59a7ba0d0..0ab798d234cc 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -53,16 +53,7 @@ static inline u64 paravirt_steal_clock(int cpu)
 void __init paravirt_set_cap(void);
 #endif
 
-/* The paravirtualized I/O functions */
-static inline void slow_down_io(void)
-{
-	PVOP_VCALL0(cpu.io_delay);
-#ifdef REALLY_SLOW_IO
-	PVOP_VCALL0(cpu.io_delay);
-	PVOP_VCALL0(cpu.io_delay);
-	PVOP_VCALL0(cpu.io_delay);
-#endif
-}
+#define call_io_delay() pv_info.io_delay
 
 void native_flush_tlb_local(void);
 void native_flush_tlb_global(void);
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 37a8627d8277..ee399f467796 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -36,6 +36,7 @@ struct pv_info {
 #ifdef CONFIG_PARAVIRT_XXL
 	u16 extra_user_64bit_cs;  /* __USER_CS if none */
 #endif
+	bool io_delay;
 
 	const char *name;
 };
@@ -51,8 +52,6 @@ struct pv_lazy_ops {
 
 struct pv_cpu_ops {
 	/* hooks for various privileged instructions */
-	void (*io_delay)(void);
-
 #ifdef CONFIG_PARAVIRT_XXL
 	unsigned long (*get_debugreg)(int regno);
 	void (*set_debugreg)(int regno, unsigned long value);
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index cb3f900c46fc..47db25d63c8d 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -338,7 +338,7 @@ arch_initcall(activate_jump_labels);
 static void __init vmware_paravirt_ops_setup(void)
 {
 	pv_info.name = "VMware hypervisor";
-	pv_ops.cpu.io_delay = paravirt_nop;
+	pv_info.io_delay = false;
 
 	if (vmware_tsc_khz == 0)
 		return;
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index b67d7c59dca0..b02d441efa3b 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -73,12 +73,6 @@ DEFINE_PER_CPU_DECRYPTED(struct kvm_steal_time, steal_time) __aligned(64) __visi
 static int has_steal_clock = 0;
 
 static int has_guest_poll = 0;
-/*
- * No need for any "IO delay" on KVM
- */
-static void kvm_io_delay(void)
-{
-}
 
 #define KVM_TASK_SLEEP_HASHBITS 8
 #define KVM_TASK_SLEEP_HASHSIZE (1<<KVM_TASK_SLEEP_HASHBITS)
@@ -312,7 +306,7 @@ static void __init paravirt_ops_setup(void)
 	pv_info.name = "KVM";
 
 	if (kvm_para_has_feature(KVM_FEATURE_NOP_IO_DELAY))
-		pv_ops.cpu.io_delay = kvm_io_delay;
+		pv_info.io_delay = false;
 
 #ifdef CONFIG_X86_IO_APIC
 	no_timer_check = 1;
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ab3e172dcc69..8ee952e7e7d4 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -113,6 +113,7 @@ struct pv_info pv_info = {
 #ifdef CONFIG_PARAVIRT_XXL
 	.extra_user_64bit_cs = __USER_CS,
 #endif
+	.io_delay = true,
 };
 
 /* 64-bit pagetable entries */
@@ -120,8 +121,6 @@ struct pv_info pv_info = {
 
 struct paravirt_patch_template pv_ops = {
 	/* Cpu ops. */
-	.cpu.io_delay		= native_io_delay,
-
 #ifdef CONFIG_PARAVIRT_XXL
 	.cpu.cpuid		= native_cpuid,
 	.cpu.get_debugreg	= pv_native_get_debugreg,
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4806cc28d7ca..a43b525f25cd 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1046,10 +1046,6 @@ static void xen_update_io_bitmap(void)
 }
 #endif
 
-static void xen_io_delay(void)
-{
-}
-
 static DEFINE_PER_CPU(unsigned long, xen_cr0_value);
 
 static unsigned long xen_read_cr0(void)
@@ -1209,6 +1205,7 @@ void __init xen_setup_vcpu_info_placement(void)
 
 static const struct pv_info xen_info __initconst = {
 	.extra_user_64bit_cs = FLAT_USER_CS64,
+	.io_delay = false,
 	.name = "Xen",
 };
 
@@ -1253,7 +1250,6 @@ static const typeof(pv_ops) xen_cpu_ops __initconst = {
 		.invalidate_io_bitmap = xen_invalidate_io_bitmap,
 		.update_io_bitmap = xen_update_io_bitmap,
 #endif
-		.io_delay = xen_io_delay,
 
 		.start_context_switch = xen_start_context_switch,
 		.end_context_switch = xen_end_context_switch,
-- 
2.51.0


