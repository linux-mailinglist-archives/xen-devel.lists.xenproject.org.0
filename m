Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACB9638403
	for <lists+xen-devel@lfdr.de>; Fri, 25 Nov 2022 07:33:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.448073.704926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oySGn-0006ae-AP; Fri, 25 Nov 2022 06:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 448073.704926; Fri, 25 Nov 2022 06:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oySGn-0006YL-7D; Fri, 25 Nov 2022 06:33:05 +0000
Received: by outflank-mailman (input) for mailman id 448073;
 Fri, 25 Nov 2022 06:33:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lMay=3Z=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oySGl-0006Fz-C8
 for xen-devel@lists.xenproject.org; Fri, 25 Nov 2022 06:33:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02f2b2db-6c8b-11ed-8fd2-01056ac49cbb;
 Fri, 25 Nov 2022 07:33:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4FA8421ABF;
 Fri, 25 Nov 2022 06:33:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E857813A08;
 Fri, 25 Nov 2022 06:33:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pwBBN51hgGNAcgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 25 Nov 2022 06:33:01 +0000
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
X-Inumbo-ID: 02f2b2db-6c8b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669357982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sjhgFpq3nYstNjfYRzieZLbVirxwSh2gasV8m6EaAKQ=;
	b=WDct/+NCNMhDQE3uXaBL1eSMquJ+aAJ6SOdEfs5IVwH8j5P+SVyd/tSR+tBqNwQ3iidDPA
	qPLL8VKJZ6WUWyuleQ3KgkLtaxQHEHncfn9DIQ4xJeQ4EfmNCi9HqoUZ/c1BxcyVk5gkh2
	WQGx86OgKF1EFuwnDxgcDw86HtASnuk=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] x86/xen: mark xen_pv_play_dead() as __noreturn
Date: Fri, 25 Nov 2022 07:32:48 +0100
Message-Id: <20221125063248.30256-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221125063248.30256-1-jgross@suse.com>
References: <20221125063248.30256-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark xen_pv_play_dead() and related to that xen_cpu_bringup_again()
as "__noreturn".

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/smp.h    | 2 +-
 arch/x86/xen/smp_pv.c | 4 ++--
 tools/objtool/check.c | 1 +
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/xen/smp.h b/arch/x86/xen/smp.h
index 6e90a312067b..22fb982ff971 100644
--- a/arch/x86/xen/smp.h
+++ b/arch/x86/xen/smp.h
@@ -21,7 +21,7 @@ void xen_smp_send_reschedule(int cpu);
 void xen_smp_send_call_function_ipi(const struct cpumask *mask);
 void xen_smp_send_call_function_single_ipi(int cpu);
 
-void xen_cpu_bringup_again(unsigned long stack);
+void __noreturn xen_cpu_bringup_again(unsigned long stack);
 
 struct xen_common_irq {
 	int irq;
diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index b40b24382fe3..5801f93d567c 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -381,7 +381,7 @@ static void xen_pv_cpu_die(unsigned int cpu)
 	}
 }
 
-static void xen_pv_play_dead(void) /* used only with HOTPLUG_CPU */
+static void __noreturn xen_pv_play_dead(void) /* used only with HOTPLUG_CPU */
 {
 	play_dead_common();
 	HYPERVISOR_vcpu_op(VCPUOP_down, xen_vcpu_nr(smp_processor_id()), NULL);
@@ -400,7 +400,7 @@ static void xen_pv_cpu_die(unsigned int cpu)
 	BUG();
 }
 
-static void xen_pv_play_dead(void)
+static void __noreturn xen_pv_play_dead(void)
 {
 	BUG();
 }
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 43ec14c29a60..becdedc2de99 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -189,6 +189,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"snp_abort",
 		"stop_this_cpu",
 		"usercopy_abort",
+		"xen_cpu_bringup_again",
 		"xen_start_kernel",
 	};
 
-- 
2.35.3


