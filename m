Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8219BBD495
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 09:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1137932.1473773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5g59-00056N-MM; Mon, 06 Oct 2025 07:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1137932.1473773; Mon, 06 Oct 2025 07:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5g59-00054o-He; Mon, 06 Oct 2025 07:56:31 +0000
Received: by outflank-mailman (input) for mailman id 1137932;
 Mon, 06 Oct 2025 07:56:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kU4J=4P=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1v5fwE-0000J4-8T
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 07:47:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae82e8c0-a288-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 09:47:17 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 65F5622501;
 Mon,  6 Oct 2025 07:47:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB7A513A7E;
 Mon,  6 Oct 2025 07:47:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +NmgKwR042h/HgAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 06 Oct 2025 07:47:16 +0000
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
X-Inumbo-ID: ae82e8c0-a288-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759736837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHoWMHxjEYxWzXFzwEz4w5llPIGc7b3TxNii6+61XYg=;
	b=uFnCMbWOTg9okFEV34oW2f3xlMbUYlpZ/oJTX8/Pj7JL8ruBbm28iuXcTv+cSOU6TCGmg6
	C2mzX+Ee0TOqknmCf/f7BpqR4ekxMdakngZfA2C36xhspiCDhjc9do4baNyik3Y4Lnm//z
	RCYjTzuNvd9QK6v//pwysQ2rAH9/M/k=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1759736837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHoWMHxjEYxWzXFzwEz4w5llPIGc7b3TxNii6+61XYg=;
	b=uFnCMbWOTg9okFEV34oW2f3xlMbUYlpZ/oJTX8/Pj7JL8ruBbm28iuXcTv+cSOU6TCGmg6
	C2mzX+Ee0TOqknmCf/f7BpqR4ekxMdakngZfA2C36xhspiCDhjc9do4baNyik3Y4Lnm//z
	RCYjTzuNvd9QK6v//pwysQ2rAH9/M/k=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 11/21] x86/paravirt: Use common code for paravirt_steal_clock()
Date: Mon,  6 Oct 2025 09:45:56 +0200
Message-ID: <20251006074606.1266-12-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006074606.1266-1-jgross@suse.com>
References: <20251006074606.1266-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,suse.com:mid,suse.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Remove the arch specific variant of paravirt_steal_clock() and use
the common one instead.

With all archs supporting Xen now having been switched to the common
variant, including paravirt.h can be dropped from drivers/xen/time.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/Kconfig                | 1 +
 arch/x86/include/asm/paravirt.h | 7 -------
 arch/x86/kernel/paravirt.c      | 6 ------
 arch/x86/xen/time.c             | 1 +
 drivers/xen/time.c              | 3 ---
 5 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 451c3adffacb..f134cfff090b 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -799,6 +799,7 @@ if HYPERVISOR_GUEST
 config PARAVIRT
 	bool "Enable paravirtualization code"
 	depends on HAVE_STATIC_CALL
+	select HAVE_PV_STEAL_CLOCK_GEN
 	help
 	  This changes the kernel so it can modify itself when it is run
 	  under a hypervisor, potentially improving performance significantly
diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 0ef797ea8440..766a7cee3d64 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -17,10 +17,8 @@
 #include <linux/static_call_types.h>
 #include <asm/frame.h>
 
-u64 dummy_steal_clock(int cpu);
 u64 dummy_sched_clock(void);
 
-DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
 
 void paravirt_set_sched_clock(u64 (*func)(void));
@@ -35,11 +33,6 @@ bool pv_is_native_spin_unlock(void);
 __visible bool __native_vcpu_is_preempted(long cpu);
 bool pv_is_native_vcpu_is_preempted(void);
 
-static inline u64 paravirt_steal_clock(int cpu)
-{
-	return static_call(pv_steal_clock)(cpu);
-}
-
 #ifdef CONFIG_PARAVIRT_SPINLOCKS
 void __init paravirt_set_cap(void);
 #endif
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index a3ba4747be1c..42991d471bf3 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -60,12 +60,6 @@ void __init native_pv_lock_init(void)
 		static_branch_enable(&virt_spin_lock_key);
 }
 
-static u64 native_steal_clock(int cpu)
-{
-	return 0;
-}
-
-DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 
 void paravirt_set_sched_clock(u64 (*func)(void))
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 96521b1874ac..e4754b2fa900 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -16,6 +16,7 @@
 #include <linux/slab.h>
 #include <linux/pvclock_gtod.h>
 #include <linux/timekeeper_internal.h>
+#include <linux/sched/cputime.h>
 
 #include <asm/pvclock.h>
 #include <asm/xen/hypervisor.h>
diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index 53b12f5ac465..0b18d8a5a2dd 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -10,9 +10,6 @@
 #include <linux/static_call.h>
 #include <linux/sched/cputime.h>
 
-#ifndef CONFIG_HAVE_PV_STEAL_CLOCK_GEN
-#include <asm/paravirt.h>
-#endif
 #include <asm/xen/hypervisor.h>
 #include <asm/xen/hypercall.h>
 
-- 
2.51.0


