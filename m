Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAD8B80463
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 16:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125283.1467285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uytXP-0006kO-H1; Wed, 17 Sep 2025 14:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125283.1467285; Wed, 17 Sep 2025 14:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uytXP-0006iE-EM; Wed, 17 Sep 2025 14:53:39 +0000
Received: by outflank-mailman (input) for mailman id 1125283;
 Wed, 17 Sep 2025 14:53:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fd1X=34=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uytXO-0004jI-AA
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 14:53:38 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1733c5c7-93d6-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 16:53:37 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B86E520725;
 Wed, 17 Sep 2025 14:53:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 065F21368D;
 Wed, 17 Sep 2025 14:53:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ykCaOm/LymhREwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 17 Sep 2025 14:53:35 +0000
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
X-Inumbo-ID: 1733c5c7-93d6-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758120816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gztxpq9DX+nPOLwjlXTO5zTcC6KXOoTlESO5Ptm2kQY=;
	b=DjHHRNFlyxPa5V7hkd/f7bmc7195g1GjRLuYDDswEVlLP5Nx1z73ZQygsSLzkDHTWbSgZN
	PgiZRfmQBbt5R6HSFhFXCmsudbl2C/uhCuhWpJiA/KitXqfOAS4RSLKiti3aiqhZoKgpZF
	2jhCs/l+46nohVfezAUN3NsLp8Pd2q8=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758120816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gztxpq9DX+nPOLwjlXTO5zTcC6KXOoTlESO5Ptm2kQY=;
	b=DjHHRNFlyxPa5V7hkd/f7bmc7195g1GjRLuYDDswEVlLP5Nx1z73ZQygsSLzkDHTWbSgZN
	PgiZRfmQBbt5R6HSFhFXCmsudbl2C/uhCuhWpJiA/KitXqfOAS4RSLKiti3aiqhZoKgpZF
	2jhCs/l+46nohVfezAUN3NsLp8Pd2q8=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	xen-devel@lists.xenproject.org,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v2 12/21] x86/paravirt: Move paravirt_sched_clock() related code into tsc.c
Date: Wed, 17 Sep 2025 16:52:11 +0200
Message-ID: <20250917145220.31064-13-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917145220.31064-1-jgross@suse.com>
References: <20250917145220.31064-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -6.80

The only user of paravirt_sched_clock() is in tsc.c, so move the code
from paravirt.c and paravirt.h to tsc.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/paravirt.h    | 12 ------------
 arch/x86/include/asm/timer.h       |  1 +
 arch/x86/kernel/kvmclock.c         |  1 +
 arch/x86/kernel/paravirt.c         |  7 -------
 arch/x86/kernel/tsc.c              | 10 +++++++++-
 arch/x86/xen/time.c                |  1 +
 drivers/clocksource/hyperv_timer.c |  2 ++
 7 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 766a7cee3d64..b69e75a5c872 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -14,20 +14,8 @@
 #ifndef __ASSEMBLER__
 #include <linux/types.h>
 #include <linux/cpumask.h>
-#include <linux/static_call_types.h>
 #include <asm/frame.h>
 
-u64 dummy_sched_clock(void);
-
-DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
-
-void paravirt_set_sched_clock(u64 (*func)(void));
-
-static __always_inline u64 paravirt_sched_clock(void)
-{
-	return static_call(pv_sched_clock)();
-}
-
 __visible void __native_queued_spin_unlock(struct qspinlock *lock);
 bool pv_is_native_spin_unlock(void);
 __visible bool __native_vcpu_is_preempted(long cpu);
diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index 23baf8c9b34c..fda18bcb19b4 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -12,6 +12,7 @@ extern void recalibrate_cpu_khz(void);
 extern int no_timer_check;
 
 extern bool using_native_sched_clock(void);
+void paravirt_set_sched_clock(u64 (*func)(void));
 
 /*
  * We use the full linear equation: f(x) = a + b*x, in order to allow
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index ca0a49eeac4a..b5991d53fc0e 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -19,6 +19,7 @@
 #include <linux/cc_platform.h>
 
 #include <asm/hypervisor.h>
+#include <asm/timer.h>
 #include <asm/x86_init.h>
 #include <asm/kvmclock.h>
 
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 42991d471bf3..4e37db8073f9 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -60,13 +60,6 @@ void __init native_pv_lock_init(void)
 		static_branch_enable(&virt_spin_lock_key);
 }
 
-DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
-
-void paravirt_set_sched_clock(u64 (*func)(void))
-{
-	static_call_update(pv_sched_clock, func);
-}
-
 static noinstr void pv_native_safe_halt(void)
 {
 	native_safe_halt();
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 87e749106dda..554b54783a04 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -266,19 +266,27 @@ u64 native_sched_clock_from_tsc(u64 tsc)
 /* We need to define a real function for sched_clock, to override the
    weak default version */
 #ifdef CONFIG_PARAVIRT
+DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
+
 noinstr u64 sched_clock_noinstr(void)
 {
-	return paravirt_sched_clock();
+	return static_call(pv_sched_clock)();
 }
 
 bool using_native_sched_clock(void)
 {
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
+
+void paravirt_set_sched_clock(u64 (*func)(void))
+{
+	static_call_update(pv_sched_clock, func);
+}
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
 
 bool using_native_sched_clock(void) { return true; }
+void paravirt_set_sched_clock(u64 (*func)(void)) { }
 #endif
 
 notrace u64 sched_clock(void)
diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index e4754b2fa900..6f9f665bb7ae 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -19,6 +19,7 @@
 #include <linux/sched/cputime.h>
 
 #include <asm/pvclock.h>
+#include <asm/timer.h>
 #include <asm/xen/hypervisor.h>
 #include <asm/xen/hypercall.h>
 #include <asm/xen/cpuid.h>
diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index 2edc13ca184e..6397a7ba4a98 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -535,6 +535,8 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 	sched_clock_register(sched_clock, 64, NSEC_PER_SEC);
 }
 #elif defined CONFIG_PARAVIRT
+#include <asm/timer.h>
+
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
 {
 	/* We're on x86/x64 *and* using PV ops */
-- 
2.51.0


