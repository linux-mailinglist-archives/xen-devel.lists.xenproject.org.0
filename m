Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B91E89992D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701166.1095408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfeu-0000c4-5p; Fri, 05 Apr 2024 09:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701166.1095408; Fri, 05 Apr 2024 09:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfet-0000SK-Sj; Fri, 05 Apr 2024 09:14:51 +0000
Received: by outflank-mailman (input) for mailman id 701166;
 Fri, 05 Apr 2024 09:14:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsfer-0007cm-T5
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 09:14:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3dbb950-f32c-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 11:14:49 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 5D1974EE074B;
 Fri,  5 Apr 2024 11:14:48 +0200 (CEST)
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
X-Inumbo-ID: f3dbb950-f32c-11ee-afe6-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [XEN PATCH v2 8/9] xen/domain: deviate MISRA C Rule 16.2 violation
Date: Fri,  5 Apr 2024 11:14:36 +0200
Message-Id: <2328b1a43f8bc4c9a9303c46f8eba2847c67a713.1712305581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712305581.git.nicola.vetrini@bugseng.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
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
---
I chose a text-based deviation, rather than exempting PROGRESS_VCPU,
because it's more refined and it's unlikely that more violations
are introduced, since the rule has only very few violations left on
both ARM and x86.
---
 docs/misra/safe.json | 8 ++++++++
 xen/common/domain.c  | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index d361d0e65ceb..64178ba2ef7d 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -36,6 +36,14 @@
         },
         {
             "id": "SAF-4-safe",
+            "analyser": {
+              "eclair": "MC3R1.R16.2"
+            },
+            "name": "MC3R1.R16.2: using a case label when the most closely-enclosing compound statement is not a switch statement",
+            "text": "A switch label enclosed by some compound statement that is not the body of a switch is permitted within local helper macros that are unlikely to be misused or misunderstood."
+        },
+        {
+            "id": "SAF-5-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/common/domain.c b/xen/common/domain.c
index ceb44c826685..1388b9e7cefa 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -457,6 +457,7 @@ static int domain_teardown(struct domain *d)
 
         for_each_vcpu ( d, v )
         {
+            /* SAF-4-safe MISRA C Rule 16.2: switch label enclosed by for loop*/
             PROGRESS_VCPU(teardown);
 
             rc = vcpu_teardown(v);
-- 
2.34.1


