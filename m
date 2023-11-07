Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FDC7E39D7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 11:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628726.980495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JP8-0004mK-FD; Tue, 07 Nov 2023 10:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628726.980495; Tue, 07 Nov 2023 10:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JP8-0004je-CM; Tue, 07 Nov 2023 10:33:54 +0000
Received: by outflank-mailman (input) for mailman id 628726;
 Tue, 07 Nov 2023 10:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raD6=GU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0JP7-0004MO-0a
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 10:33:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 252173f1-7d59-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 11:33:52 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 7C6B54EE0C89;
 Tue,  7 Nov 2023 11:33:51 +0100 (CET)
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
X-Inumbo-ID: 252173f1-7d59-11ee-98da-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 2/4] x86/dom0: make goto jump forward
Date: Tue,  7 Nov 2023 11:33:43 +0100
Message-Id: <fcc14cb3859e4904f4a17e14fc41b5e05ae1f05f.1699295113.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699295113.git.nicola.vetrini@bugseng.com>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The jump to the label 'parse_error' becomes forward, rather
than backward; at the same time, the else branch can be eliminated.

This also fixes a violation of MISRA C:2012 Rule 15.2.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/dom0_build.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 09fb8b063ae7..f0191dc148a2 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -439,12 +439,7 @@ static void __init process_dom0_ioports_disable(struct domain *dom0)
     {
         io_from = simple_strtoul(t, &u, 16);
         if ( u == t )
-        {
-        parse_error:
-            printk("Invalid ioport range <%s> "
-                   "in dom0_ioports_disable, skipping\n", t);
-            continue;
-        }
+            goto parse_error;
 
         if ( *u == '\0' )
             io_to = io_from;
@@ -454,7 +449,12 @@ static void __init process_dom0_ioports_disable(struct domain *dom0)
             goto parse_error;
 
         if ( (*u != '\0') || (io_to < io_from) || (io_to >= 65536) )
-            goto parse_error;
+        {
+        parse_error:
+            printk("Invalid ioport range <%s> "
+                   "in dom0_ioports_disable, skipping\n", t);
+            continue;
+        }
 
         printk("Disabling dom0 access to ioport range %04lx-%04lx\n",
             io_from, io_to);
-- 
2.34.1


