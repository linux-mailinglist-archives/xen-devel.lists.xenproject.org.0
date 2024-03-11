Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0164B877C1D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691272.1077138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbWB-0000ov-P7; Mon, 11 Mar 2024 09:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691272.1077138; Mon, 11 Mar 2024 09:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbWB-0000aS-4E; Mon, 11 Mar 2024 09:00:23 +0000
Received: by outflank-mailman (input) for mailman id 691272;
 Mon, 11 Mar 2024 09:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW6-0006iu-Pw
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c85b0784-df85-11ee-afdc-a90da7624cb6;
 Mon, 11 Mar 2024 10:00:18 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 65B984EE0C9E;
 Mon, 11 Mar 2024 10:00:17 +0100 (CET)
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
X-Inumbo-ID: c85b0784-df85-11ee-afdc-a90da7624cb6
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 13/16] xen: add deviations for MISRA C.2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:22 +0100
Message-Id: <787aa5a65135796c825d366b43e00ba018c0065b.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Add safe deviation for *.c files, as estabilished in past discussion.
Add SAF deviation for files that need an #include directive before guard.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
Commit introduced in v3

Link to the discussion thread:
https://lists.xenproject.org/archives/html/xen-devel/2023-09/msg00239.html
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
 docs/misra/deviations.rst                        | 7 +++++++
 docs/misra/safe.json                             | 8 ++++++++
 xen/include/public/arch-x86/xen.h                | 1 +
 4 files changed, 21 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 039ffaf52a..8082239ccc 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -69,6 +69,11 @@ conform to the directive."
 -config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
 -doc_end
 
+-doc_begin="Including multiple times a .c file is safe because every function or data item
+it defines would (in the common case) be already defined. Peer reviewed by the community."
+-config=MC3R1.D4.10,reports+={safe, "all_area(all_loc(^.*\\.c$))"}
+-doc_end
+
 #
 # Series 5.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index ce855ddae6..7b32dbd23f 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -30,6 +30,13 @@ Deviations related to MISRA C:2012 Directives:
        not to add an additional encapsulation layer.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - D4.10
+     - Including multiple times a .c file is safe because every function or data item
+       it defines would in (the common case) be already defined.
+       Peer reviewed by the community.
+     - Tagged as `safe` for ECLAIR.
+
+
 Deviations related to MISRA C:2012 Rules:
 -----------------------------------------
 
diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 13208d18ec..dd61b47194 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -60,6 +60,14 @@
         },
         {
             "id": "SAF-7-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: include needed before guard",
+            "text": "These files need to start with an include directive to generate preprocessed code in the correct order."
+        },
+        {
+            "id": "SAF-8-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index c0f4551247..0b2e9271f8 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -7,6 +7,7 @@
  * Copyright (c) 2004-2006, K A Fraser
  */
 
+/* SAF-7-safe include before guard needed for correct code generation */
 #include "../xen.h"
 
 #ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__
-- 
2.34.1


