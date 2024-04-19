Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA7E8AA8E1
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 09:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708797.1107940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxiJ7-00009s-33; Fri, 19 Apr 2024 07:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708797.1107940; Fri, 19 Apr 2024 07:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxiJ7-000072-0Y; Fri, 19 Apr 2024 07:05:13 +0000
Received: by outflank-mailman (input) for mailman id 708797;
 Fri, 19 Apr 2024 07:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pund=LY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rxiJ5-00006v-Jl
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 07:05:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28129a3a-fe1b-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 09:05:09 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id DAD444EE0742;
 Fri, 19 Apr 2024 09:05:06 +0200 (CEST)
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
X-Inumbo-ID: 28129a3a-fe1b-11ee-b909-491648fe20b8
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v4] xen/domain: deviate MISRA C Rule 16.2 violation
Date: Fri, 19 Apr 2024 09:05:03 +0200
Message-Id: <7b23c76ade7541342332811329e2b8d271e6d31b.1713510238.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 16.2 states:
"A switch label shall only be used when the most closely-enclosing
compound statement is the body of a switch statement".

The PROGRESS_VCPU local helper specifies a case that is directly
inside the compound statement of a for loop, hence violating the rule.
To avoid this, the construct is deviated with a text-based deviation.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 docs/misra/safe.json | 8 ++++++++
 xen/common/domain.c  | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index fe2bc185097d..9b13bcf71706 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -44,6 +44,14 @@
         },
         {
             "id": "SAF-5-safe",
+            "analyser": {
+                "eclair": "MC3R1.R16.2"
+            },
+            "name": "MC3R1.R16.2: using a case label when the most closely-enclosing compound statement is not a switch statement",
+            "text": "A switch label enclosed by some compound statement that is not the body of a switch is permitted within local helper macros that are unlikely to be misused or misunderstood."
+        },
+        {
+            "id": "SAF-6-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 282c3ab62308..1e555d658c97 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -457,6 +457,7 @@ static int domain_teardown(struct domain *d)
 
         for_each_vcpu ( d, v )
         {
+            /* SAF-5-safe MISRA C Rule 16.2: switch label enclosed by for loop*/
             PROGRESS_VCPU(teardown);
 
             rc = vcpu_teardown(v);
-- 
2.34.1


