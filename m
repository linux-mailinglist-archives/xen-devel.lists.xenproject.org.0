Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E9A7CDFA2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618624.962554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VI-0003Wt-5u; Wed, 18 Oct 2023 14:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618624.962554; Wed, 18 Oct 2023 14:26:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VI-0003TB-1e; Wed, 18 Oct 2023 14:26:32 +0000
Received: by outflank-mailman (input) for mailman id 618624;
 Wed, 18 Oct 2023 14:26:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt7VF-0001YJ-Qy
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:26:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53c8e717-6dc2-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 16:26:29 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id 49E054EE0740;
 Wed, 18 Oct 2023 16:26:28 +0200 (CEST)
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
X-Inumbo-ID: 53c8e717-6dc2-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 7/7] x86/hpet: address violations of MISRA C:2012 Rule 8.2
Date: Wed, 18 Oct 2023 16:26:00 +0200
Message-Id: <4d3f6608e5c76152e4ad0bbb57e38ac80cf316f3.1697638486.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697638486.git.federico.serafini@bugseng.com>
References: <cover.1697638486.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hpet.c             | 2 +-
 xen/arch/x86/include/asm/hpet.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 79c07f6a9e..63d4158f0f 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -37,7 +37,7 @@ struct hpet_event_channel
     s_time_t      next_event;
     cpumask_var_t cpumask;
     spinlock_t    lock;
-    void          (*event_handler)(struct hpet_event_channel *);
+    void          (*event_handler)(struct hpet_event_channel *ch);
 
     unsigned int idx;   /* physical channel idx */
     unsigned int cpu;   /* msi target */
diff --git a/xen/arch/x86/include/asm/hpet.h b/xen/arch/x86/include/asm/hpet.h
index 9919f74730..b342a154e6 100644
--- a/xen/arch/x86/include/asm/hpet.h
+++ b/xen/arch/x86/include/asm/hpet.h
@@ -60,7 +60,7 @@ extern int8_t opt_hpet_legacy_replacement;
  * Return value is zero if HPET is unavailable.
  */
 u64 hpet_setup(void);
-void hpet_resume(u32 *);
+void hpet_resume(u32 *boot_cfg);
 
 /*
  * Disable HPET hardware: restore it to boot time state.
-- 
2.34.1


