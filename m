Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E791E121
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:48:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751680.1159714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHNx-0001Qz-3S; Mon, 01 Jul 2024 13:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751680.1159714; Mon, 01 Jul 2024 13:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHNw-0001ON-Vl; Mon, 01 Jul 2024 13:48:00 +0000
Received: by outflank-mailman (input) for mailman id 751680;
 Mon, 01 Jul 2024 13:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHMi-0007ig-ES
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:46:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a14d170-37b0-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 15:46:43 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 19E4F4EE0746;
 Mon,  1 Jul 2024 15:46:41 +0200 (CEST)
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
X-Inumbo-ID: 5a14d170-37b0-11ef-90a5-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards naming conventions
Date: Mon,  1 Jul 2024 15:46:35 +0200
Message-Id: <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This section explains which format should be followed by header
inclusion guards via a drop-down list of rules.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 CODING_STYLE | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 7f6e9ad065..87836c97d4 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -167,3 +167,22 @@ the end of files.  It should be:
  * indent-tabs-mode: nil
  * End:
  */
+
+Header inclusion guards
+-----------------------
+
+Unless differently specified all header files should have proper inclusion
+guards in order to avoid being included multiple times.
+The following naming conventions have been devised:
+- private headers -> <dir>_<filename>_H
+- asm-generic headers -> ASM_GENERIC_<filename>_H
+    - #ifndef ASM_GENERIC_X86_PERCPU_H
+      #define ASM_GENERIC_X86_PERCPU_H
+      //...
+      #endif /* ASM_GENERIC_X86_PERCPU_H */
+- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM_<architecture>_<subdir>_<filename>_H
+    - #ifndef ASM_X86_DOMAIN_H
+      #define ASM_X86_DOMAIN_H
+      //...
+      #endif /* ASM_X86_DOMAIN_H */
+
-- 
2.34.1


