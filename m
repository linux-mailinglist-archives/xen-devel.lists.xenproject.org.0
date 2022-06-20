Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C965510E3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352423.579223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRR-0002rZ-Um; Mon, 20 Jun 2022 07:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352423.579223; Mon, 20 Jun 2022 07:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3BRR-0002n9-Qg; Mon, 20 Jun 2022 07:03:21 +0000
Received: by outflank-mailman (input) for mailman id 352423;
 Mon, 20 Jun 2022 07:03:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k7+S=W3=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o3BRP-0001Yx-JU
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:03:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1012962d-f067-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:03:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CFE41042;
 Mon, 20 Jun 2022 00:03:18 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.35.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A76693F5A1;
 Mon, 20 Jun 2022 00:03:15 -0700 (PDT)
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
X-Inumbo-ID: 1012962d-f067-11ec-b725-ed86ccbb4733
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/9] include/xen: Use explicitly specified types
Date: Mon, 20 Jun 2022 09:02:40 +0200
Message-Id: <20220620070245.77979-5-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620070245.77979-1-michal.orzel@arm.com>
References: <20220620070245.77979-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to MISRA C 2012 Rule 8.1, types shall be explicitly
specified. Fix all the findings reported by cppcheck with misra addon
by substituting implicit type 'unsigned' to explicit 'unsigned int'.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/include/xen/perfc.h | 2 +-
 xen/include/xen/sched.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/perfc.h b/xen/include/xen/perfc.h
index bb010b0aae..7c5ce537bd 100644
--- a/xen/include/xen/perfc.h
+++ b/xen/include/xen/perfc.h
@@ -49,7 +49,7 @@ enum perfcounter {
 #undef PERFSTATUS
 #undef PERFSTATUS_ARRAY
 
-typedef unsigned perfc_t;
+typedef unsigned int perfc_t;
 #define PRIperfc ""
 
 DECLARE_PER_CPU(perfc_t[NUM_PERFCOUNTERS], perfcounters);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 463d41ffb6..d957b6e11f 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -518,9 +518,9 @@ struct domain
 
     /* hvm_print_line() and guest_console_write() logging. */
 #define DOMAIN_PBUF_SIZE 200
-    char       *pbuf;
-    unsigned    pbuf_idx;
-    spinlock_t  pbuf_lock;
+    char         *pbuf;
+    unsigned int  pbuf_idx;
+    spinlock_t    pbuf_lock;
 
     /* OProfile support. */
     struct xenoprof *xenoprof;
-- 
2.25.1


