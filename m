Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1994A78B371
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 16:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591538.924074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUO-0001rM-7d; Mon, 28 Aug 2023 14:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591538.924074; Mon, 28 Aug 2023 14:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qadUO-0001f8-0z; Mon, 28 Aug 2023 14:45:12 +0000
Received: by outflank-mailman (input) for mailman id 591538;
 Mon, 28 Aug 2023 13:36:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJ5s=EN=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qacPz-0004gK-Kw
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 13:36:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa04e8e8-45a5-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 15:20:32 +0200 (CEST)
Received: from beta.station (net-93-66-137-131.cust.vodafonedsl.it
 [93.66.137.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 64F7E4EE0C88;
 Mon, 28 Aug 2023 15:20:31 +0200 (CEST)
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
X-Inumbo-ID: aa04e8e8-45a5-11ee-9b0c-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 08/13] x86/mm: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 28 Aug 2023 15:20:05 +0200
Message-Id: <b994059118b867960b619d40d74c8f579c0a4d87.1693228255.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693228255.git.simone.ballarin@bugseng.com>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add inclusion guards to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
to prevent the contents of a header file being included more than
once").

C files, if included somewhere, need to comply with the guideline.

Mechanical change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/mm/guest_walk.c     | 5 +++++
 xen/arch/x86/mm/hap/guest_walk.c | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/xen/arch/x86/mm/guest_walk.c b/xen/arch/x86/mm/guest_walk.c
index fe7393334f..66c127156d 100644
--- a/xen/arch/x86/mm/guest_walk.c
+++ b/xen/arch/x86/mm/guest_walk.c
@@ -9,6 +9,9 @@
  * Parts based on earlier work by Michael A Fetterman, Ian Pratt et al.
  */
 
+#ifndef __X86_MM_GUEST_WALK_C__
+#define __X86_MM_GUEST_WALK_C__
+
 #include <xen/types.h>
 #include <xen/mm.h>
 #include <xen/paging.h>
@@ -576,6 +579,8 @@ void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
 }
 #endif
 
+#endif /* __X86_MM_GUEST_WALK_C__ */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/mm/hap/guest_walk.c b/xen/arch/x86/mm/hap/guest_walk.c
index d1b7c5762c..d4ffa8141f 100644
--- a/xen/arch/x86/mm/hap/guest_walk.c
+++ b/xen/arch/x86/mm/hap/guest_walk.c
@@ -7,6 +7,9 @@
  * Copyright (c) 2007, XenSource Inc.
  */
 
+#ifndef __X86_MM_HAP_GUEST_WALK_C__
+#define __X86_MM_HAP_GUEST_WALK_C__
+
 #include <xen/domain_page.h>
 #include <xen/paging.h>
 #include <xen/sched.h>
@@ -124,6 +127,7 @@ unsigned long cf_check hap_p2m_ga_to_gfn(GUEST_PAGING_LEVELS)(
     return gfn_x(INVALID_GFN);
 }
 
+#endif /* __X86_MM_HAP_GUEST_WALK_C__ */
 
 /*
  * Local variables:
-- 
2.34.1


