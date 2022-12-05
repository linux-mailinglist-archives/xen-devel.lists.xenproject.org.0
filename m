Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD20642C16
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 16:41:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453954.711637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Dal-0004gH-T3; Mon, 05 Dec 2022 15:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453954.711637; Mon, 05 Dec 2022 15:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Dal-0004bL-NO; Mon, 05 Dec 2022 15:41:15 +0000
Received: by outflank-mailman (input) for mailman id 453954;
 Mon, 05 Dec 2022 15:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIMq=4D=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p2Daj-0003Gt-9q
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 15:41:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3e23b94c-74b3-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 16:41:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5231B1515;
 Mon,  5 Dec 2022 07:41:17 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67C233F73D;
 Mon,  5 Dec 2022 07:41:09 -0800 (PST)
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
X-Inumbo-ID: 3e23b94c-74b3-11ed-8fd2-01056ac49cbb
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
Subject: [PATCH v2 5/5] xen: Justify linker script defined symbols in include/xen/kernel.h
Date: Mon,  5 Dec 2022 15:40:52 +0000
Message-Id: <20221205154052.14191-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205154052.14191-1-luca.fancellu@arm.com>
References: <20221205154052.14191-1-luca.fancellu@arm.com>

Eclair and Coverity found violation of the MISRA rule 8.6 for the
symbols _start, _end, start, _stext, _etext, _srodata, _erodata,
_sinittext, _einittext which are declared in
xen/include/xen/kernel.h.
All those symbols are defined by the liker script so we can deviate
from the rule 8.6 for these cases.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2 changes:
 - add R-by and Ack-by (Stefano, Jan)
---
---
 docs/misra/safe.json     | 9 +++++++++
 xen/include/xen/kernel.h | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index e079d3038120..e3c8a1d8eb36 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -3,6 +3,15 @@
     "content": [
         {
             "id": "SAF-0-safe",
+            "analyser": {
+                "eclair": "MC3R1.R8.6",
+                "coverity": "misra_c_2012_rule_8_6_violation"
+            },
+            "name": "Rule 8.6: linker script defined symbols",
+            "text": "It is safe to declare this symbol because it is defined in the linker script."
+        },
+        {
+            "id": "SAF-1-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index 8cd142032d3b..f1a7713784fc 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -65,24 +65,28 @@
 	1;                                      \
 })
 
+/* SAF-0-safe */
 extern char _start[], _end[], start[];
 #define is_kernel(p) ({                         \
     char *__p = (char *)(unsigned long)(p);     \
     (__p >= _start) && (__p < _end);            \
 })
 
+/* SAF-0-safe */
 extern char _stext[], _etext[];
 #define is_kernel_text(p) ({                    \
     char *__p = (char *)(unsigned long)(p);     \
     (__p >= _stext) && (__p < _etext);          \
 })
 
+/* SAF-0-safe */
 extern const char _srodata[], _erodata[];
 #define is_kernel_rodata(p) ({                  \
     const char *__p = (const char *)(unsigned long)(p);     \
     (__p >= _srodata) && (__p < _erodata);      \
 })
 
+/* SAF-0-safe */
 extern char _sinittext[], _einittext[];
 #define is_kernel_inittext(p) ({                \
     char *__p = (char *)(unsigned long)(p);     \
-- 
2.17.1


