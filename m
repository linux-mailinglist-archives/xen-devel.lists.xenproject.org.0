Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D057CDF9F
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618621.962524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VD-0002cc-78; Wed, 18 Oct 2023 14:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618621.962524; Wed, 18 Oct 2023 14:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VD-0002ZG-2x; Wed, 18 Oct 2023 14:26:27 +0000
Received: by outflank-mailman (input) for mailman id 618621;
 Wed, 18 Oct 2023 14:26:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt7VB-0001YJ-1u
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:26:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50eefe53-6dc2-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 16:26:24 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id 35FA94EE0741;
 Wed, 18 Oct 2023 16:26:23 +0200 (CEST)
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
X-Inumbo-ID: 50eefe53-6dc2-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 4/7] x86/cpuidle: address violations of MISRA C:2012 Rule 8.2
Date: Wed, 18 Oct 2023 16:25:57 +0200
Message-Id: <2ce963d3d7c8d14f2ddc80600454ea990599e0e6.1697638486.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697638486.git.federico.serafini@bugseng.com>
References: <cover.1697638486.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/cpuidle.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpuidle.h b/xen/arch/x86/include/asm/cpuidle.h
index 3edd7a75d2..707b3e948d 100644
--- a/xen/arch/x86/include/asm/cpuidle.h
+++ b/xen/arch/x86/include/asm/cpuidle.h
@@ -15,16 +15,17 @@ extern void (*lapic_timer_on)(void);
 
 extern uint64_t (*cpuidle_get_tick)(void);
 
-int mwait_idle_init(struct notifier_block *);
+int mwait_idle_init(struct notifier_block *nfb);
 int cpuidle_init_cpu(unsigned int cpu);
 void cf_check default_dead_idle(void);
 void cf_check acpi_dead_idle(void);
 void play_dead(void);
 void trace_exit_reason(u32 *irq_traced);
-void update_idle_stats(struct acpi_processor_power *,
-                       struct acpi_processor_cx *, uint64_t, uint64_t);
-void update_last_cx_stat(struct acpi_processor_power *,
-                         struct acpi_processor_cx *, uint64_t);
+void update_idle_stats(struct acpi_processor_power *power,
+                       struct acpi_processor_cx *cx,
+                       uint64_t before, uint64_t after);
+void update_last_cx_stat(struct acpi_processor_power *power,
+                         struct acpi_processor_cx *cx, uint64_t ticks);
 
 bool errata_c6_workaround(void);
 
-- 
2.34.1


