Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77405545F3B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 10:34:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345961.571710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza67-0002HR-Eo; Fri, 10 Jun 2022 08:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345961.571710; Fri, 10 Jun 2022 08:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nza67-0002EU-9w; Fri, 10 Jun 2022 08:34:27 +0000
Received: by outflank-mailman (input) for mailman id 345961;
 Fri, 10 Jun 2022 08:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7j0Q=WR=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nza65-0000uL-7j
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 08:34:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 131201b3-e898-11ec-8179-c7c2a468b362;
 Fri, 10 Jun 2022 10:33:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4743212FC;
 Fri, 10 Jun 2022 01:34:21 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.4.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 251CD3F73B;
 Fri, 10 Jun 2022 01:34:18 -0700 (PDT)
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
X-Inumbo-ID: 131201b3-e898-11ec-8179-c7c2a468b362
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] xen/console: Fix incorrect format tags for struct tm members
Date: Fri, 10 Jun 2022 10:33:58 +0200
Message-Id: <20220610083358.101412-4-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610083358.101412-1-michal.orzel@arm.com>
References: <20220610083358.101412-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All the members of struct tm are defined as integers but the format tags
used in console driver for snprintf wrongly expect unsigned values. Fix
the tags to expect integers.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/drivers/char/console.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index f9937c5134..beb44fe06f 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -844,7 +844,7 @@ static void printk_start_of_line(const char *prefix)
             /* nothing */;
         else if ( mode == TSM_DATE )
         {
-            snprintf(tstr, sizeof(tstr), "[%04u-%02u-%02u %02u:%02u:%02u] ",
+            snprintf(tstr, sizeof(tstr), "[%04d-%02d-%02d %02d:%02d:%02d] ",
                      1900 + tm.tm_year, tm.tm_mon + 1, tm.tm_mday,
                      tm.tm_hour, tm.tm_min, tm.tm_sec);
             break;
@@ -852,7 +852,7 @@ static void printk_start_of_line(const char *prefix)
         else
         {
             snprintf(tstr, sizeof(tstr),
-                     "[%04u-%02u-%02u %02u:%02u:%02u.%03"PRIu64"] ",
+                     "[%04d-%02d-%02d %02d:%02d:%02d.%03"PRIu64"] ",
                      1900 + tm.tm_year, tm.tm_mon + 1, tm.tm_mday,
                      tm.tm_hour, tm.tm_min, tm.tm_sec, nsec / 1000000);
             break;
-- 
2.25.1


