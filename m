Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0EE72F674
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 09:35:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548506.856490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L2J-0007vK-9E; Wed, 14 Jun 2023 07:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548506.856490; Wed, 14 Jun 2023 07:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L2J-0007sb-64; Wed, 14 Jun 2023 07:35:23 +0000
Received: by outflank-mailman (input) for mailman id 548506;
 Wed, 14 Jun 2023 07:35:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8JF=CC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q9L2I-0007aV-AA
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 07:35:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03f7a4a0-0a86-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 09:35:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C98C1FD6A;
 Wed, 14 Jun 2023 07:35:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA9731391E;
 Wed, 14 Jun 2023 07:35:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EWQDNLdtiWRVHwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Jun 2023 07:35:19 +0000
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
X-Inumbo-ID: 03f7a4a0-0a86-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686728120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKTmIuG44BdSii87EddLytcEKZcOQpLokCYRhdq7cjM=;
	b=oIvCas+cd9SDP91Ts9iEvkChPfeGhwMxFt/iaiZ5ygGF17F6cJ/XiH08XzsYKrHT8MXhtk
	6itKTL5e3Mx72I9S8uNCXhCl8VGkXe5kOsPCRfg2k1Uwuc9pmmZN713yyAOvhkzO+oqPPr
	l4PHceSRrfbdCugCtHRe4hhYqyrrFUc=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 2/2] x86: xen: add missing prototypes
Date: Wed, 14 Jun 2023 09:35:01 +0200
Message-Id: <20230614073501.10101-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230614073501.10101-1-jgross@suse.com>
References: <20230614073501.10101-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

These function are all called from assembler files, or from inline
assembler, so there is no immediate need for a prototype in a header,
but if -Wmissing-prototypes is enabled, the compiler warns about them:

arch/x86/xen/efi.c:130:13: error: no previous prototype for 'xen_efi_init' [-Werror=missing-prototypes]
arch/x86/platform/pvh/enlighten.c:120:13: error: no previous prototype for 'xen_prepare_pvh' [-Werror=missing-prototypes]
arch/x86/xen/enlighten_pv.c:1233:34: error: no previous prototype for 'xen_start_kernel' [-Werror=missing-prototypes]
arch/x86/xen/irq.c:22:14: error: no previous prototype for 'xen_force_evtchn_callback' [-Werror=missing-prototypes]
arch/x86/entry/common.c:302:24: error: no previous prototype for 'xen_pv_evtchn_do_upcall' [-Werror=missing-prototypes]

Declare all of them in an appropriate header file to avoid the warnings.
For consistency, also move the asm_cpu_bringup_and_idle() declaration
out of smp_pv.c.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
v4: [jgross]: remove some stubs, carve out mmu_pv.c prototypes into
    other patch
v3: move declations of conditional function in an #ifdef with a stub
v2: fix up changelog
---
 arch/x86/xen/efi.c     | 2 ++
 arch/x86/xen/smp.h     | 4 ++++
 arch/x86/xen/smp_pv.c  | 1 -
 arch/x86/xen/xen-ops.h | 3 +++
 include/xen/xen.h      | 3 +++
 5 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/efi.c b/arch/x86/xen/efi.c
index 7d7ffb9c826a..863d0d6b3edc 100644
--- a/arch/x86/xen/efi.c
+++ b/arch/x86/xen/efi.c
@@ -16,6 +16,8 @@
 #include <asm/setup.h>
 #include <asm/xen/hypercall.h>
 
+#include "xen-ops.h"
+
 static efi_char16_t vendor[100] __initdata;
 
 static efi_system_table_t efi_systab_xen __initdata = {
diff --git a/arch/x86/xen/smp.h b/arch/x86/xen/smp.h
index 22fb982ff971..c20cbb14c82b 100644
--- a/arch/x86/xen/smp.h
+++ b/arch/x86/xen/smp.h
@@ -2,6 +2,10 @@
 #ifndef _XEN_SMP_H
 
 #ifdef CONFIG_SMP
+
+void asm_cpu_bringup_and_idle(void);
+asmlinkage void cpu_bringup_and_idle(void);
+
 extern void xen_send_IPI_mask(const struct cpumask *mask,
 			      int vector);
 extern void xen_send_IPI_mask_allbutself(const struct cpumask *mask,
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index a9cf8c8fa074..9ccf9759870d 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -55,7 +55,6 @@ static DEFINE_PER_CPU(struct xen_common_irq, xen_irq_work) = { .irq = -1 };
 static DEFINE_PER_CPU(struct xen_common_irq, xen_pmu_irq) = { .irq = -1 };
 
 static irqreturn_t xen_irq_work_interrupt(int irq, void *dev_id);
-void asm_cpu_bringup_and_idle(void);
 
 static void cpu_bringup(void)
 {
diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index a10903785a33..1bbbe216e6e1 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -148,9 +148,12 @@ int xen_cpuhp_setup(int (*cpu_up_prepare_cb)(unsigned int),
 void xen_pin_vcpu(int cpu);
 
 void xen_emergency_restart(void);
+void xen_force_evtchn_callback(void);
+
 #ifdef CONFIG_XEN_PV
 void xen_pv_pre_suspend(void);
 void xen_pv_post_suspend(int suspend_cancelled);
+void xen_start_kernel(struct start_info *si);
 #else
 static inline void xen_pv_pre_suspend(void) {}
 static inline void xen_pv_post_suspend(int suspend_cancelled) {}
diff --git a/include/xen/xen.h b/include/xen/xen.h
index 0efeb652f9b8..f989162983c3 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -31,6 +31,9 @@ extern uint32_t xen_start_flags;
 
 #include <xen/interface/hvm/start_info.h>
 extern struct hvm_start_info pvh_start_info;
+void xen_prepare_pvh(void);
+struct pt_regs;
+void xen_pv_evtchn_do_upcall(struct pt_regs *regs);
 
 #ifdef CONFIG_XEN_DOM0
 #include <xen/interface/xen.h>
-- 
2.35.3


