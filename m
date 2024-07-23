Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBCC939C67
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762743.1173043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAhg-0007Zd-5i; Tue, 23 Jul 2024 08:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762743.1173043; Tue, 23 Jul 2024 08:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWAhg-0007Xh-14; Tue, 23 Jul 2024 08:17:00 +0000
Received: by outflank-mailman (input) for mailman id 762743;
 Tue, 23 Jul 2024 08:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0IL=OX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sWAgr-0007w0-BE
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:16:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce190a55-48cb-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 10:16:04 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-35-51-193.retail.telecomitalia.it [79.35.51.193])
 by support.bugseng.com (Postfix) with ESMTPSA id 200CB4EE0743;
 Tue, 23 Jul 2024 10:16:04 +0200 (CEST)
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
X-Inumbo-ID: ce190a55-48cb-11ef-8776-851b0ebba9a2
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v5 16/17] CODING_STYLE: Add a section on header guards naming conventions
Date: Tue, 23 Jul 2024 10:15:08 +0200
Message-Id: <14a663eaab02a78e688e1d260e1a4eb1799b13c5.1721720583.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
References: <cover.1721720583.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This section explains which format should be followed by header
inclusion guards via a drop-down list of rules.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v5:
- edit inclusion guards naming conventions, according to feedback
  received
---
 CODING_STYLE | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/CODING_STYLE b/CODING_STYLE
index 7f6e9ad065..f4f26a3cd8 100644
--- a/CODING_STYLE
+++ b/CODING_STYLE
@@ -159,6 +159,27 @@ Emacs local variables
 A comment block containing local variables for emacs is permitted at
 the end of files.  It should be:
 
+Header inclusion guards
+-----------------------
+
+Unless differently specified all header files should have proper inclusion
+guards in order to avoid being included multiple times.
+The following naming conventions have been devised:
+
+- private headers -> <dir>__<filename>_H
+    - arch/arm/arm64/lib/something.h -> ARM__ARM64__LIB__SOMETHING_H
+    - arch/arm/arm32/lib/something.h -> ARM__ARM32__LIB__SOMETHING_H
+    - arch/x86/lib/something.h -> X86__LIB__SOMETHING_H
+
+- asm-generic headers -> ASM_GENERIC__<filename>_H
+    - include/asm-generic/something.h -> ASM_GENERIC__SOMETHING_H
+
+- arch/<architecture>/include/asm/<subdir>/<filename>.h -> ASM__<architecture>__<subdir>__<filename>_H
+    - arch/x86/include/asm/something.h -> ASM__X86__SOMETHING_H
+
+- include/xen -> XEN__<filename>_H
+    - include/xen/something.h -> XEN__SOMETHING_H
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


