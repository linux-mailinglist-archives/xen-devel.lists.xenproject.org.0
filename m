Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B220651C9B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466601.725594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLP-0004Hi-9i; Tue, 20 Dec 2022 08:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466601.725594; Tue, 20 Dec 2022 08:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLO-0004D0-Sh; Tue, 20 Dec 2022 08:51:26 +0000
Received: by outflank-mailman (input) for mailman id 466601;
 Tue, 20 Dec 2022 08:51:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLM-0001kP-U7
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7b6174c3-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:24 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73D4F13D5;
 Tue, 20 Dec 2022 00:52:04 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 687123F71A;
 Tue, 20 Dec 2022 00:51:22 -0800 (PST)
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
X-Inumbo-ID: 7b6174c3-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 09/18] xen: cppcheck: misra rule 20.7 deviation on kconfig.h
Date: Tue, 20 Dec 2022 08:50:51 +0000
Message-Id: <20221220085100.22848-10-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221220085100.22848-1-luca.fancellu@arm.com>
References: <20221220085100.22848-1-luca.fancellu@arm.com>

Cppcheck has found a violation of rule 20.7 for the macro
__config_enabled but the preprocessor branch where this macro is
defined should not be analysed by cppcheck when CPPCHECK macro is
defined, hence this is a false positive of the tool and we can
safely suppress the finding.

Eclair and coverity does not report this finding.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misra/false-positive-cppcheck.json | 7 +++++++
 xen/include/xen/kconfig.h               | 1 +
 2 files changed, 8 insertions(+)

diff --git a/docs/misra/false-positive-cppcheck.json b/docs/misra/false-positive-cppcheck.json
index 5e7d9377f60b..c8ee3c0c6317 100644
--- a/docs/misra/false-positive-cppcheck.json
+++ b/docs/misra/false-positive-cppcheck.json
@@ -17,6 +17,13 @@
         },
         {
             "id": "SAF-2-false-positive-cppcheck",
+            "violation-id": "misra-c2012-20.7",
+            "tool-version": "2.7",
+            "name": "R20.7 on preprocessor branch that should be disabled",
+            "text": "This preprocessor branch should be disabled when CPPCHECK macro is active, so there should not be violation."
+        },
+        {
+            "id": "SAF-3-false-positive-cppcheck",
             "violation-id": "",
             "tool-version": "",
             "name": "Sentinel",
diff --git a/xen/include/xen/kconfig.h b/xen/include/xen/kconfig.h
index a717b0819c2e..92373c018950 100644
--- a/xen/include/xen/kconfig.h
+++ b/xen/include/xen/kconfig.h
@@ -23,6 +23,7 @@
 #define __ARG_PLACEHOLDER_1 0,
 #define config_enabled(cfg) _config_enabled(cfg)
 #define _config_enabled(value) __config_enabled(__ARG_PLACEHOLDER_##value)
+/* SAF-2-false-positive-cppcheck R20.7 but cppcheck should not check here */
 #define __config_enabled(arg1_or_junk) ___config_enabled(arg1_or_junk 1, 0)
 #define ___config_enabled(__ignored, val, ...) val
 
-- 
2.17.1


