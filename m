Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF9635C10
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 12:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447527.703843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxoC0-0004co-AZ; Wed, 23 Nov 2022 11:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447527.703843; Wed, 23 Nov 2022 11:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxoC0-0004aq-7N; Wed, 23 Nov 2022 11:45:28 +0000
Received: by outflank-mailman (input) for mailman id 447527;
 Wed, 23 Nov 2022 11:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jVpM=3X=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oxoBz-0004ak-3W
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 11:45:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51fca572-6b24-11ed-91b6-6bf2151ebd3b;
 Wed, 23 Nov 2022 12:45:25 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 48CE221F33;
 Wed, 23 Nov 2022 11:45:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E31CB13A37;
 Wed, 23 Nov 2022 11:45:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6+UDNtQHfmPTUwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 23 Nov 2022 11:45:24 +0000
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
X-Inumbo-ID: 51fca572-6b24-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669203925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=AyhBQAsNxho2kk1GfKGx6zDLyWYyV1QLz+gDG7NJTZA=;
	b=Zkn7ZzDpoCCf/JgfLleT4uX7j1LVB22KCBz2YLwsoyCKxzEJYFLn6dS2KCoYG/ZDbmrWKd
	M6vUekyG/a2ld98xp97yxvtjLIwhLz4IRtOgVFz2nFKxZyiNNfQBdi3lyMXNpdB8zeg/Yc
	ejYMSHpqTF7xKsKSpz0Z4TJdktOrVNE=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3] x86/boot: skip realmode init code when running as Xen PV guest
Date: Wed, 23 Nov 2022 12:45:23 +0100
Message-Id: <20221123114523.3467-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running as a Xen PV guest there is no need for setting up the
realmode trampoline, as realmode isn't supported in this environment.

Trying to setup the trampoline has been proven to be problematic in
some cases, especially when trying to debug early boot problems with
Xen requiring to keep the EFI boot-services memory mapped (some
firmware variants seem to claim basically all memory below 1M for boot
services).

Introduce new x86_platform_ops operations for that purpose, which can
be set to a nop by the Xen PV specific kernel boot code.

Fixes: 084ee1c641a0 ("x86, realmode: Relocator for realmode code")
Suggested-by: H. Peter Anvin <hpa@zytor.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
V3:
- and yet another approach (H. Peter Anvin)
---
 arch/x86/include/asm/realmode.h | 1 +
 arch/x86/include/asm/x86_init.h | 4 ++++
 arch/x86/kernel/setup.c         | 2 +-
 arch/x86/kernel/x86_init.c      | 3 +++
 arch/x86/realmode/init.c        | 8 ++++++--
 arch/x86/xen/enlighten_pv.c     | 2 ++
 6 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/realmode.h b/arch/x86/include/asm/realmode.h
index fd6f6e5b755a..a336feef0af1 100644
--- a/arch/x86/include/asm/realmode.h
+++ b/arch/x86/include/asm/realmode.h
@@ -91,6 +91,7 @@ static inline void set_real_mode_mem(phys_addr_t mem)
 
 void reserve_real_mode(void);
 void load_trampoline_pgtable(void);
+void init_real_mode(void);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/x86/include/asm/x86_init.h b/arch/x86/include/asm/x86_init.h
index e9170457697e..c1c8c581759d 100644
--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -285,6 +285,8 @@ struct x86_hyper_runtime {
  * 				possible in x86_early_init_platform_quirks() by
  * 				only using the current x86_hardware_subarch
  * 				semantics.
+ * @realmode_reserve:		reserve memory for realmode trampoline
+ * @realmode_init:		initialize realmode trampoline
  * @hyper:			x86 hypervisor specific runtime callbacks
  */
 struct x86_platform_ops {
@@ -301,6 +303,8 @@ struct x86_platform_ops {
 	void (*apic_post_init)(void);
 	struct x86_legacy_features legacy;
 	void (*set_legacy_features)(void);
+	void (*realmode_reserve)(void);
+	void (*realmode_init)(void);
 	struct x86_hyper_runtime hyper;
 	struct x86_guest guest;
 };
diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 216fee7144ee..892609cde4a2 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1175,7 +1175,7 @@ void __init setup_arch(char **cmdline_p)
 	 * Moreover, on machines with SandyBridge graphics or in setups that use
 	 * crashkernel the entire 1M is reserved anyway.
 	 */
-	reserve_real_mode();
+	x86_platform.realmode_reserve();
 
 	init_mem_mapping();
 
diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index 57353519bc11..ef80d361b463 100644
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -25,6 +25,7 @@
 #include <asm/iommu.h>
 #include <asm/mach_traps.h>
 #include <asm/irqdomain.h>
+#include <asm/realmode.h>
 
 void x86_init_noop(void) { }
 void __init x86_init_uint_noop(unsigned int unused) { }
@@ -145,6 +146,8 @@ struct x86_platform_ops x86_platform __ro_after_init = {
 	.get_nmi_reason			= default_get_nmi_reason,
 	.save_sched_clock_state		= tsc_save_sched_clock_state,
 	.restore_sched_clock_state	= tsc_restore_sched_clock_state,
+	.realmode_reserve		= reserve_real_mode,
+	.realmode_init			= init_real_mode,
 	.hyper.pin_vcpu			= x86_op_int_noop,
 
 	.guest = {
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index 41d7669a97ad..247aca9f8ed1 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -200,14 +200,18 @@ static void __init set_real_mode_permissions(void)
 	set_memory_x((unsigned long) text_start, text_size >> PAGE_SHIFT);
 }
 
-static int __init init_real_mode(void)
+void __init init_real_mode(void)
 {
 	if (!real_mode_header)
 		panic("Real mode trampoline was not allocated");
 
 	setup_real_mode();
 	set_real_mode_permissions();
+}
 
+static int __init call_init_real_mode(void)
+{
+	x86_platform.realmode_init();
 	return 0;
 }
-early_initcall(init_real_mode);
+early_initcall(call_init_real_mode);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 038da45f057a..8944726255c9 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1266,6 +1266,8 @@ asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
 	xen_vcpu_info_reset(0);
 
 	x86_platform.get_nmi_reason = xen_get_nmi_reason;
+	x86_platform.realmode_reserve = x86_init_noop;
+	x86_platform.realmode_init = x86_init_noop;
 
 	x86_init.resources.memory_setup = xen_memory_setup;
 	x86_init.irqs.intr_mode_select	= x86_init_noop;
-- 
2.35.3


