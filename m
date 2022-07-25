Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65D5800EC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 16:46:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374634.606746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFzKX-0001Ol-E4; Mon, 25 Jul 2022 14:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374634.606746; Mon, 25 Jul 2022 14:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFzKX-0001LN-B6; Mon, 25 Jul 2022 14:45:09 +0000
Received: by outflank-mailman (input) for mailman id 374634;
 Mon, 25 Jul 2022 14:45:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CFkY=X6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1oFzKW-0001LH-5l
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 14:45:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5f2daa38-0c28-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 16:45:06 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74B8E2B;
 Mon, 25 Jul 2022 07:45:05 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A89783F73D;
 Mon, 25 Jul 2022 07:45:03 -0700 (PDT)
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
X-Inumbo-ID: 5f2daa38-0c28-11ed-924f-1f966e50362f
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] common/memory: Fix ifdefs for ptdom_max_order
Date: Mon, 25 Jul 2022 15:44:55 +0100
Message-Id: <20220725144455.7666-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

In common/memory.c the ifdef code surrounding ptdom_max_order is
using HAS_PASSTHROUGH instead of CONFIG_HAS_PASSTHROUGH, fix the
problem using the correct macro.

Fixes: e0d44c1f9461 ("build: convert HAS_PASSTHROUGH use to Kconfig")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/common/memory.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index f6f794914dfd..bc89442ba53f 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -58,7 +58,7 @@ struct memop_args {
 static unsigned int __read_mostly domu_max_order = CONFIG_DOMU_MAX_ORDER;
 static unsigned int __read_mostly ctldom_max_order = CONFIG_CTLDOM_MAX_ORDER;
 static unsigned int __read_mostly hwdom_max_order = CONFIG_HWDOM_MAX_ORDER;
-#ifdef HAS_PASSTHROUGH
+#ifdef CONFIG_HAS_PASSTHROUGH
 static unsigned int __read_mostly ptdom_max_order = CONFIG_PTDOM_MAX_ORDER;
 #endif
 
@@ -70,7 +70,7 @@ static int __init cf_check parse_max_order(const char *s)
         ctldom_max_order = simple_strtoul(s, &s, 0);
     if ( *s == ',' && *++s != ',' )
         hwdom_max_order = simple_strtoul(s, &s, 0);
-#ifdef HAS_PASSTHROUGH
+#ifdef CONFIG_HAS_PASSTHROUGH
     if ( *s == ',' && *++s != ',' )
         ptdom_max_order = simple_strtoul(s, &s, 0);
 #endif
@@ -83,7 +83,7 @@ static unsigned int max_order(const struct domain *d)
 {
     unsigned int order = domu_max_order;
 
-#ifdef HAS_PASSTHROUGH
+#ifdef CONFIG_HAS_PASSTHROUGH
     if ( cache_flush_permitted(d) && order < ptdom_max_order )
         order = ptdom_max_order;
 #endif
-- 
2.17.1


