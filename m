Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9215E55B9CC
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356604.584889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5obG-0006XO-25; Mon, 27 Jun 2022 13:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356604.584889; Mon, 27 Jun 2022 13:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5obF-0006UB-T2; Mon, 27 Jun 2022 13:16:21 +0000
Received: by outflank-mailman (input) for mailman id 356604;
 Mon, 27 Jun 2022 13:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5obE-0005HM-S1
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:16:20 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 52ddb4d1-f61b-11ec-b725-ed86ccbb4733;
 Mon, 27 Jun 2022 15:16:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B24A61758;
 Mon, 27 Jun 2022 06:16:19 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6830C3F5A1;
 Mon, 27 Jun 2022 06:16:16 -0700 (PDT)
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
X-Inumbo-ID: 52ddb4d1-f61b-11ec-b725-ed86ccbb4733
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4/7] include/xen: Use unsigned int instead of plain unsigned
Date: Mon, 27 Jun 2022 15:15:40 +0200
Message-Id: <20220627131543.410971-5-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627131543.410971-1-michal.orzel@arm.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is just for the style and consistency reasons as the former is
being used more often than the latter.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/include/xen/perfc.h | 2 +-
 xen/include/xen/sched.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
index 463d41ffb6..b9515eb497 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -519,7 +519,7 @@ struct domain
     /* hvm_print_line() and guest_console_write() logging. */
 #define DOMAIN_PBUF_SIZE 200
     char       *pbuf;
-    unsigned    pbuf_idx;
+    unsigned int pbuf_idx;
     spinlock_t  pbuf_lock;
 
     /* OProfile support. */
-- 
2.25.1


