Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 358EC91E10D
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751655.1159684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHLt-0008Dw-Df; Mon, 01 Jul 2024 13:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751655.1159684; Mon, 01 Jul 2024 13:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHLt-0008BY-9D; Mon, 01 Jul 2024 13:45:53 +0000
Received: by outflank-mailman (input) for mailman id 751655;
 Mon, 01 Jul 2024 13:45:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHLs-0007ig-IC
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:45:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b36b6b0-37b0-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 15:45:52 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 641124EE0738;
 Mon,  1 Jul 2024 15:45:48 +0200 (CEST)
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
X-Inumbo-ID: 3b36b6b0-37b0-11ef-90a5-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH 14/17] xen: add SAF deviation for MISRA C Dir 4.10
Date: Mon,  1 Jul 2024 15:45:30 +0200
Message-Id: <b64a6b53de8bcf14c91a1534bb57b001efc12cce.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
 docs/misra/safe.json              | 10 +++++++++-
 xen/include/public/arch-x86/xen.h |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 0739eac806..a1cd821aea 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -99,7 +99,15 @@
             "text": "Files intended for multiple inclusion are not supposed to comply with D4.10."
         },
         {
-            "id": "SAF-11-safe",
+            "id": "SAF-12-safe",
+            "analyser": {
+                "eclair": "MC3R1.D4.10"
+            },
+            "name": "Dir 4.10: arch-x86/xen.h include before guard",
+            "text": "This file needs to start with #include ../xen.h to generate preprocessed code in the correct order."
+        },
+        {
+            "id": "SAF-13-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index a9a87d9b50..d8ad935af3 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -7,6 +7,7 @@
  * Copyright (c) 2004-2006, K A Fraser
  */
 
+/* SAF-12-safe include before guard needed for correct code generation */
 #include "../xen.h"
 
 #ifndef __XEN_PUBLIC_ARCH_X86_XEN_H__
-- 
2.34.1


