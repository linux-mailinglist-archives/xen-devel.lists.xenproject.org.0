Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FBC8D6F54
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 12:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734115.1140351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnT-00077i-BR; Sat, 01 Jun 2024 10:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734115.1140351; Sat, 01 Jun 2024 10:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnT-000724-8K; Sat, 01 Jun 2024 10:17:11 +0000
Received: by outflank-mailman (input) for mailman id 734115;
 Sat, 01 Jun 2024 10:17:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUY=ND=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sDLnS-0006UI-Cd
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 10:17:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a50d486-2000-11ef-b4bb-af5377834399;
 Sat, 01 Jun 2024 12:17:08 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 85C6F4EE074C;
 Sat,  1 Jun 2024 12:17:06 +0200 (CEST)
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
X-Inumbo-ID: 1a50d486-2000-11ef-b4bb-af5377834399
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH 5/5] xen: fix MISRA regressions on rule 20.9 and 20.12
Date: Sat,  1 Jun 2024 12:16:56 +0200
Message-Id: <7d454066eb24e0515ff5b37864ed7a7ef5215dc5.1717236930.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717236930.git.nicola.vetrini@bugseng.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ea59e7d780d9 ("xen/bitops: Cleanup and new infrastructure ahead of rearrangements")
introduced new violations on previously clean rules 20.9 and 20.12.

The first is introduced because CONFIG_CC_IS_CLANG in xen/self-tests.h is not
defined in the configuration under analysis. Using "defined()" instead avoids
relying on the preprocessor's behaviour upon encountering an undedfined identifier
and addresses the violation.

The violation of Rule 20.12 is due to "val" being used both as an ordinary argument
in macro RUNTIME_CHECK, and as a stringification operator.

No functional change.

Fixes: ea59e7d780d9 ("xen/bitops: Cleanup and new infrastructure ahead of rearrangements")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 xen/include/xen/self-tests.h                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index f29db9e08248..e2653f77eb2c 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -473,7 +473,7 @@ deliberate."
 -doc_begin="Uses of a macro parameter for ordinary expansion and as an operand
 to the # or ## operators within the following macros are deliberate, to provide
 useful diagnostic messages to the user."
--config=MC3R1.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO)"}
+-config=MC3R1.R20.12,macros+={deliberate, "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||RUNTIME_CHECK)"}
 -doc_end
 
 -doc_begin="The helper macro GENERATE_CASE may use a macro parameter for ordinary
diff --git a/xen/include/xen/self-tests.h b/xen/include/xen/self-tests.h
index 8410db7aaaae..42a4cc4d17fe 100644
--- a/xen/include/xen/self-tests.h
+++ b/xen/include/xen/self-tests.h
@@ -16,7 +16,7 @@
  * Clang < 8 can't fold constants through static inlines, causing this to
  * fail.  Simply skip it for incredibly old compilers.
  */
-#if !CONFIG_CC_IS_CLANG || CONFIG_CLANG_VERSION >= 80000
+#if !defined(CONFIG_CC_IS_CLANG) || CONFIG_CLANG_VERSION >= 80000
 #define COMPILE_CHECK(fn, val, res)                                     \
     do {                                                                \
         typeof(fn(val)) real = fn(val);                                 \
-- 
2.34.1


