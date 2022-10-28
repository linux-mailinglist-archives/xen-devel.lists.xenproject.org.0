Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9E9610FE4
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 13:41:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431971.684626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNjh-0007F2-Dr; Fri, 28 Oct 2022 11:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431971.684626; Fri, 28 Oct 2022 11:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooNjh-0007DG-B7; Fri, 28 Oct 2022 11:41:17 +0000
Received: by outflank-mailman (input) for mailman id 431971;
 Fri, 28 Oct 2022 11:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ooNjf-0007DA-41
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 11:41:15 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cb6a2bf-56b5-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 13:41:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D01281F8CD;
 Fri, 28 Oct 2022 11:41:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7710B1377D;
 Fri, 28 Oct 2022 11:41:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sCCpG9i/W2P3XQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Oct 2022 11:41:12 +0000
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
X-Inumbo-ID: 6cb6a2bf-56b5-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1666957272; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/p9z9up3uocKCE+GJ+TkX5e8OOBP85R6Err2/w4IGiY=;
	b=rUQsEyr3FBY1FodHD/PM1Fc+rX5GHfDXbv25D86XXGu6mqeuVsl5rluv3Pr8lnCoGGqZzn
	7PpX4YyEV88Txt0XuCJcsa+w4sZzuLmvOHY/GQ6nle/L9Kwx8E5qJUYoIwMJKPPGPG7upu
	7Mbu01R7ewExtW6LL8ED5fMTSuxEjj8=
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
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH] xen/notifier: simplify using notifier_[to|from]_errno()
Date: Fri, 28 Oct 2022 13:41:11 +0200
Message-Id: <20221028114111.8150-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today all users of notifier_from_errno() and notifier_to_errno() are
Handling the success case the same way, by using

  !rc ? NOTIFY_DONE : notifier_from_errno(rc)

or

  (notifier_rc == NOTIFY_DONE) ? 0 : notifier_to_errno(notifier_rc);

Simplify the use cases by moving the handling of the success case into
the functions.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/arm/cpuerrata.c            | 2 +-
 xen/arch/arm/gic-v3-lpi.c           | 2 +-
 xen/arch/arm/irq.c                  | 2 +-
 xen/arch/arm/percpu.c               | 2 +-
 xen/arch/arm/smpboot.c              | 2 +-
 xen/arch/x86/acpi/cpu_idle.c        | 2 +-
 xen/arch/x86/cpu/mcheck/mce.c       | 2 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c | 2 +-
 xen/arch/x86/cpu/mwait-idle.c       | 2 +-
 xen/arch/x86/genapic/x2apic.c       | 2 +-
 xen/arch/x86/hvm/hvm.c              | 2 +-
 xen/arch/x86/percpu.c               | 2 +-
 xen/arch/x86/psr.c                  | 2 +-
 xen/arch/x86/smpboot.c              | 2 +-
 xen/common/cpu.c                    | 2 +-
 xen/common/sched/core.c             | 2 +-
 xen/common/sched/cpupool.c          | 2 +-
 xen/include/xen/notifier.h          | 4 ++--
 18 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index ae649d16ef..5952111b72 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -724,7 +724,7 @@ static int cpu_errata_callback(struct notifier_block *nfb,
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_errata_nfb = {
diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
index 61d90eb386..f0b7ef17da 100644
--- a/xen/arch/arm/gic-v3-lpi.c
+++ b/xen/arch/arm/gic-v3-lpi.c
@@ -402,7 +402,7 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_nfb = {
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index fd0c15fffd..00fadbc354 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -148,7 +148,7 @@ static int cpu_callback(struct notifier_block *nfb, unsigned long action,
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_nfb = {
diff --git a/xen/arch/arm/percpu.c b/xen/arch/arm/percpu.c
index 25442c48fe..67eb821ff6 100644
--- a/xen/arch/arm/percpu.c
+++ b/xen/arch/arm/percpu.c
@@ -68,7 +68,7 @@ static int cpu_percpu_callback(
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_percpu_nfb = {
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index f7bda3a18b..bfa988c162 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -562,7 +562,7 @@ static int cpu_smpboot_callback(struct notifier_block *nfb,
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_smpboot_nfb = {
diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 557bc6ef86..427c8c89c5 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1663,7 +1663,7 @@ static int cf_check cpu_callback(
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_nfb = {
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index f68e31b643..3e93bdd8da 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -757,7 +757,7 @@ static int cf_check cpu_callback(
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_nfb = {
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 28a605a5cb..301533722d 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -951,7 +951,7 @@ static int cf_check cpu_callback(
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_nfb = {
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index ffdc6fb2fc..9e981e7e26 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -1537,7 +1537,7 @@ static int cf_check mwait_idle_cpu_init(
 		dev = processor_powers[cpu];
 		if (!rc && cpuidle_current_governor->enable)
 			rc = cpuidle_current_governor->enable(dev);
-		return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+		return notifier_from_errno(rc);
 
 	case CPU_ONLINE:
 		if (!dev)
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 7dfc793514..f73390cdb0 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -221,7 +221,7 @@ static int cf_check update_clusterinfo(
         break;
     }
 
-    return !err ? NOTIFY_DONE : notifier_from_errno(err);
+    return notifier_from_errno(err);
 }
 
 static struct notifier_block x2apic_cpu_nfb = {
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 44b432ec5a..75ce37394d 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -142,7 +142,7 @@ static int cf_check cpu_callback(
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_nfb = {
diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
index 46460689b7..288050cdba 100644
--- a/xen/arch/x86/percpu.c
+++ b/xen/arch/x86/percpu.c
@@ -86,7 +86,7 @@ static int cf_check cpu_percpu_callback(
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_percpu_nfb = {
diff --git a/xen/arch/x86/psr.c b/xen/arch/x86/psr.c
index ccb761998f..a1e0af27c5 100644
--- a/xen/arch/x86/psr.c
+++ b/xen/arch/x86/psr.c
@@ -1663,7 +1663,7 @@ static int cf_check cpu_callback(
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_nfb = {
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b46fd9ab18..a238aa1f14 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -1144,7 +1144,7 @@ static int cf_check cpu_smpboot_callback(
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_smpboot_nfb = {
diff --git a/xen/common/cpu.c b/xen/common/cpu.c
index 778b6820b7..8709db4d29 100644
--- a/xen/common/cpu.c
+++ b/xen/common/cpu.c
@@ -82,7 +82,7 @@ static int cpu_notifier_call_chain(unsigned int cpu, unsigned long action,
 {
     void *hcpu = (void *)(long)cpu;
     int notifier_rc = notifier_call_chain(&cpu_chain, action, hcpu, nb);
-    int ret = (notifier_rc == NOTIFY_DONE) ? 0 : notifier_to_errno(notifier_rc);
+    int ret =  notifier_to_errno(notifier_rc);
 
     BUG_ON(ret && nofail);
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 23fa6845a8..44d60ac561 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2874,7 +2874,7 @@ static int cf_check cpu_schedule_callback(
 
     rcu_read_unlock(&sched_res_rculock);
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_schedule_nfb = {
diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index b2c6f520c3..ccb86ef283 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -1072,7 +1072,7 @@ static int cf_check cpu_callback(
         break;
     }
 
-    return !rc ? NOTIFY_DONE : notifier_from_errno(rc);
+    return notifier_from_errno(rc);
 }
 
 static struct notifier_block cpu_nfb = {
diff --git a/xen/include/xen/notifier.h b/xen/include/xen/notifier.h
index 0921213298..3d6017d4f7 100644
--- a/xen/include/xen/notifier.h
+++ b/xen/include/xen/notifier.h
@@ -58,13 +58,13 @@ int notifier_call_chain(
 /* Encapsulate (negative) errno value. */
 static inline int notifier_from_errno(int err)
 {
-    return NOTIFY_STOP_MASK | -err;
+    return err ? (NOTIFY_STOP_MASK | -err) : NOTIFY_DONE;
 }
 
 /* Restore (negative) errno value from notify return value. */
 static inline int notifier_to_errno(int ret)
 {
-    return -(ret & ~NOTIFY_STOP_MASK);
+    return (ret == NOTIFY_DONE) ? 0 : -(ret & ~NOTIFY_STOP_MASK);
 }
 
 #endif /* __XEN_NOTIFIER_H__ */
-- 
2.35.3


