Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DC58A8C38
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 21:37:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707737.1105962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxB5t-0004fZ-5O; Wed, 17 Apr 2024 19:37:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707737.1105962; Wed, 17 Apr 2024 19:37:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxB5t-0004aa-1J; Wed, 17 Apr 2024 19:37:21 +0000
Received: by outflank-mailman (input) for mailman id 707737;
 Wed, 17 Apr 2024 19:37:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TCN8=LW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rxB5s-0004XH-9A
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 19:37:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e77ba27b-fcf1-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 21:37:19 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.202])
 by support.bugseng.com (Postfix) with ESMTPSA id F405A4EE074D;
 Wed, 17 Apr 2024 21:37:17 +0200 (CEST)
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
X-Inumbo-ID: e77ba27b-fcf1-11ee-b909-491648fe20b8
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
Subject: [XEN PATCH v3 1/2] xen/domctl: address violations of MISRA C Rule 16.2
Date: Wed, 17 Apr 2024 21:37:11 +0200
Message-Id: <6ebb49a8ae92dc036d7bed0c708a8830bb93c788.1713382466.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713382466.git.nicola.vetrini@bugseng.com>
References: <cover.1713382466.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the first clauses so that a violation of
MISRA C Rule 16.2 is resolved (a switch label should be immediately
enclosed in the compound statement of the switch).
Note that the switch clause ending with the pseudo
keyword "fallthrough" is an allowed exception to Rule 16.3.

Convert fallthrough comments in other clauses to the pseudo-keyword
while at it.

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


