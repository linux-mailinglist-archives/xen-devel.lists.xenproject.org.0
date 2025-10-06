Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66BEBBD3E7
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 09:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137863.1473693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5fvI-0000L0-Tm; Mon, 06 Oct 2025 07:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137863.1473693; Mon, 06 Oct 2025 07:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5fvI-0000JB-QH; Mon, 06 Oct 2025 07:46:20 +0000
Received: by outflank-mailman (input) for mailman id 1137863;
 Mon, 06 Oct 2025 07:46:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kU4J=4P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v5fvH-0000J4-Lh
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 07:46:19 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a82e2db-a288-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 09:46:17 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A8FD1336CB;
 Mon,  6 Oct 2025 07:46:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C407413A7E;
 Mon,  6 Oct 2025 07:46:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id C5vmLcdz42g3HgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 06 Oct 2025 07:46:15 +0000
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
X-Inumbo-ID: 8a82e2db-a288-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759736776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNUSuF2NTfkBBhb8MInYhXDO2IAfm9m9AusVw13OjYU=;
	b=JtGsB7Sq1yJftJo0QsHIt0yiiDnoTi9gHfJjRJjtCQdHzxD+8zFWkTgk6wZO2DWFgpAjPd
	YP/5xr9B7Vzztu5qK83qbugmYDONl/2943+Kqd5cOOwe0ujalZRP1Sv14ayaXuqgK9p7Ly
	RrBD76ICE0RMFL6NscpthHesaX6Mxac=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759736776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FNUSuF2NTfkBBhb8MInYhXDO2IAfm9m9AusVw13OjYU=;
	b=JtGsB7Sq1yJftJo0QsHIt0yiiDnoTi9gHfJjRJjtCQdHzxD+8zFWkTgk6wZO2DWFgpAjPd
	YP/5xr9B7Vzztu5qK83qbugmYDONl/2943+Kqd5cOOwe0ujalZRP1Sv14ayaXuqgK9p7Ly
	RrBD76ICE0RMFL6NscpthHesaX6Mxac=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-hyperv@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>,
	Jiri Kosina <jikos@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 01/21] x86/paravirt: Remove not needed includes of paravirt.h
Date: Mon,  6 Oct 2025 09:45:46 +0200
Message-ID: <20251006074606.1266-2-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006074606.1266-1-jgross@suse.com>
References: <20251006074606.1266-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,microsoft.com,infradead.org,gmail.com,oracle.com,lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[infradead.org:email,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30

In some places asm/paravirt.h is included without really being needed.

Remove the related #include statements.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
V3:
- reinstate the include in mmu_context.h (kernel test robot)
---
 arch/x86/entry/entry_64.S             | 1 -
 arch/x86/entry/vsyscall/vsyscall_64.c | 1 -
 arch/x86/hyperv/hv_spinlock.c         | 1 -
 arch/x86/include/asm/apic.h           | 4 ----
 arch/x86/include/asm/highmem.h        | 1 -
 arch/x86/include/asm/mshyperv.h       | 1 -
 arch/x86/include/asm/pgtable_32.h     | 1 -
 arch/x86/include/asm/spinlock.h       | 1 -
 arch/x86/include/asm/tlbflush.h       | 4 ----
 arch/x86/kernel/apm_32.c              | 1 -
 arch/x86/kernel/callthunks.c          | 1 -
 arch/x86/kernel/cpu/bugs.c            | 1 -
 arch/x86/kernel/vsmp_64.c             | 1 -
 arch/x86/kernel/x86_init.c            | 1 -
 arch/x86/lib/cache-smp.c              | 1 -
 arch/x86/mm/init.c                    | 1 -
 arch/x86/xen/spinlock.c               | 1 -
 17 files changed, 23 deletions(-)

diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
index ed04a968cc7d..7a82305405af 100644
--- a/arch/x86/entry/entry_64.S
+++ b/arch/x86/entry/entry_64.S
@@ -30,7 +30,6 @@
 #include <asm/hw_irq.h>
 #include <asm/page_types.h>
 #include <asm/irqflags.h>
-#include <asm/paravirt.h>
 #include <asm/percpu.h>
 #include <asm/asm.h>
 #include <asm/smap.h>
diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
index 6e6c0a740837..4bd1e271bb22 100644
--- a/arch/x86/entry/vsyscall/vsyscall_64.c
+++ b/arch/x86/entry/vsyscall/vsyscall_64.c
@@ -37,7 +37,6 @@
 #include <asm/unistd.h>
 #include <asm/fixmap.h>
 #include <asm/traps.h>
-#include <asm/paravirt.h>
 
 #define CREATE_TRACE_POINTS
 #include "vsyscall_trace.h"
diff --git a/arch/x86/hyperv/hv_spinlock.c b/arch/x86/hyperv/hv_spinlock.c
index 81b006601370..2a3c2afb0154 100644
--- a/arch/x86/hyperv/hv_spinlock.c
+++ b/arch/x86/hyperv/hv_spinlock.c
@@ -13,7 +13,6 @@
 #include <linux/spinlock.h>
 
 #include <asm/mshyperv.h>
-#include <asm/paravirt.h>
 #include <asm/apic.h>
 #include <asm/msr.h>
 
diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index a26e66d66444..9cd493d467d4 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -90,10 +90,6 @@ static inline bool apic_from_smp_config(void)
 /*
  * Basic functions accessing APICs.
  */
-#ifdef CONFIG_PARAVIRT
-#include <asm/paravirt.h>
-#endif
-
 static inline void native_apic_mem_write(u32 reg, u32 v)
 {
 	volatile u32 *addr = (volatile u32 *)(APIC_BASE + reg);
diff --git a/arch/x86/include/asm/highmem.h b/arch/x86/include/asm/highmem.h
index 585bdadba47d..decfaaf52326 100644
--- a/arch/x86/include/asm/highmem.h
+++ b/arch/x86/include/asm/highmem.h
@@ -24,7 +24,6 @@
 #include <linux/interrupt.h>
 #include <linux/threads.h>
 #include <asm/tlbflush.h>
-#include <asm/paravirt.h>
 #include <asm/fixmap.h>
 #include <asm/pgtable_areas.h>
 
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index abc4659f5809..a9ab46fcb6a1 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -7,7 +7,6 @@
 #include <linux/msi.h>
 #include <linux/io.h>
 #include <asm/nospec-branch.h>
-#include <asm/paravirt.h>
 #include <asm/msr.h>
 #include <hyperv/hvhdk.h>
 
diff --git a/arch/x86/include/asm/pgtable_32.h b/arch/x86/include/asm/pgtable_32.h
index b612cc57a4d3..acea0cfa2460 100644
--- a/arch/x86/include/asm/pgtable_32.h
+++ b/arch/x86/include/asm/pgtable_32.h
@@ -16,7 +16,6 @@
 #ifndef __ASSEMBLER__
 #include <asm/processor.h>
 #include <linux/threads.h>
-#include <asm/paravirt.h>
 
 #include <linux/bitops.h>
 #include <linux/list.h>
diff --git a/arch/x86/include/asm/spinlock.h b/arch/x86/include/asm/spinlock.h
index 5b6bc7016c22..934632b78d09 100644
--- a/arch/x86/include/asm/spinlock.h
+++ b/arch/x86/include/asm/spinlock.h
@@ -7,7 +7,6 @@
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <linux/compiler.h>
-#include <asm/paravirt.h>
 #include <asm/bitops.h>
 
 /*
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 00daedfefc1b..238a6b807da5 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -300,10 +300,6 @@ static inline void mm_clear_asid_transition(struct mm_struct *mm) { }
 static inline bool mm_in_asid_transition(struct mm_struct *mm) { return false; }
 #endif /* CONFIG_BROADCAST_TLB_FLUSH */
 
-#ifdef CONFIG_PARAVIRT
-#include <asm/paravirt.h>
-#endif
-
 #define flush_tlb_mm(mm)						\
 		flush_tlb_mm_range(mm, 0UL, TLB_FLUSH_ALL, 0UL, true)
 
diff --git a/arch/x86/kernel/apm_32.c b/arch/x86/kernel/apm_32.c
index b37ab1095707..3175d7c134e9 100644
--- a/arch/x86/kernel/apm_32.c
+++ b/arch/x86/kernel/apm_32.c
@@ -229,7 +229,6 @@
 #include <linux/uaccess.h>
 #include <asm/desc.h>
 #include <asm/olpc.h>
-#include <asm/paravirt.h>
 #include <asm/reboot.h>
 #include <asm/nospec-branch.h>
 #include <asm/ibt.h>
diff --git a/arch/x86/kernel/callthunks.c b/arch/x86/kernel/callthunks.c
index a951333c5995..e37728f70322 100644
--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -15,7 +15,6 @@
 #include <asm/insn.h>
 #include <asm/kexec.h>
 #include <asm/nospec-branch.h>
-#include <asm/paravirt.h>
 #include <asm/sections.h>
 #include <asm/switch_to.h>
 #include <asm/sync_core.h>
diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 6a526ae1fe99..1f0d67f97788 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -25,7 +25,6 @@
 #include <asm/fpu/api.h>
 #include <asm/msr.h>
 #include <asm/vmx.h>
-#include <asm/paravirt.h>
 #include <asm/cpu_device_id.h>
 #include <asm/e820/api.h>
 #include <asm/hypervisor.h>
diff --git a/arch/x86/kernel/vsmp_64.c b/arch/x86/kernel/vsmp_64.c
index 73511332bb67..25625e3fc183 100644
--- a/arch/x86/kernel/vsmp_64.c
+++ b/arch/x86/kernel/vsmp_64.c
@@ -18,7 +18,6 @@
 #include <asm/apic.h>
 #include <asm/pci-direct.h>
 #include <asm/io.h>
-#include <asm/paravirt.h>
 #include <asm/setup.h>
 
 #define TOPOLOGY_REGISTER_OFFSET 0x10
diff --git a/arch/x86/kernel/x86_init.c b/arch/x86/kernel/x86_init.c
index 0a2bbd674a6d..02ca90378bf9 100644
--- a/arch/x86/kernel/x86_init.c
+++ b/arch/x86/kernel/x86_init.c
@@ -12,7 +12,6 @@
 
 #include <asm/acpi.h>
 #include <asm/bios_ebda.h>
-#include <asm/paravirt.h>
 #include <asm/pci_x86.h>
 #include <asm/mpspec.h>
 #include <asm/setup.h>
diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
index c5c60d07308c..ae5a5dfd33c7 100644
--- a/arch/x86/lib/cache-smp.c
+++ b/arch/x86/lib/cache-smp.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <asm/paravirt.h>
 #include <linux/smp.h>
 #include <linux/export.h>
 
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 8bf6ad4b9400..76537d40493c 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -27,7 +27,6 @@
 #include <asm/pti.h>
 #include <asm/text-patching.h>
 #include <asm/memtype.h>
-#include <asm/paravirt.h>
 #include <asm/mmu_context.h>
 
 /*
diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 8e4efe0fb6f9..fe56646d6919 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -8,7 +8,6 @@
 #include <linux/slab.h>
 #include <linux/atomic.h>
 
-#include <asm/paravirt.h>
 #include <asm/qspinlock.h>
 
 #include <xen/events.h>
-- 
2.51.0


