Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4609145BE
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 11:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746326.1153396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfd8-0004Pg-Sm; Mon, 24 Jun 2024 09:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746326.1153396; Mon, 24 Jun 2024 09:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfd8-0004JH-GW; Mon, 24 Jun 2024 09:04:54 +0000
Received: by outflank-mailman (input) for mailman id 746326;
 Mon, 24 Jun 2024 09:04:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9EP=N2=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sLfd6-0002x1-E0
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 09:04:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d05832ef-3208-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 11:04:51 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [37.160.55.204])
 by support.bugseng.com (Postfix) with ESMTPSA id 310954EE0739;
 Mon, 24 Jun 2024 11:04:50 +0200 (CEST)
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
X-Inumbo-ID: d05832ef-3208-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 06/13] x86/mce: address violations of MISRA C Rule 16.3
Date: Mon, 24 Jun 2024 11:04:30 +0200
Message-Id: <c1015fb8f39d3a44732ccdebb8ba11392dbe4aa8.1719218291.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719218291.git.federico.serafini@bugseng.com>
References: <cover.1719218291.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statements to address violations of
MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/mce_amd.c   | 1 +
 xen/arch/x86/cpu/mcheck/mce_intel.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 3318b8204f..4f06a3153b 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -201,6 +201,7 @@ static void mcequirk_amd_apply(enum mcequirk_amd_flags flags)
 
     default:
         ASSERT(flags == MCEQUIRK_NONE);
+        break;
     }
 }
 
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index dd812f4b8a..9574dedbfd 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -896,6 +896,8 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
             ppin_msr = 0;
         else if ( c == &boot_cpu_data )
             ppin_msr = MSR_PPIN;
+
+        break;
     }
 }
 
-- 
2.34.1


