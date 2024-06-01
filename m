Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 059358D6F53
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 12:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734111.1140311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnM-00066N-8n; Sat, 01 Jun 2024 10:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734111.1140311; Sat, 01 Jun 2024 10:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDLnM-00062R-54; Sat, 01 Jun 2024 10:17:04 +0000
Received: by outflank-mailman (input) for mailman id 734111;
 Sat, 01 Jun 2024 10:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUY=ND=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sDLnL-0005zz-5C
 for xen-devel@lists.xenproject.org; Sat, 01 Jun 2024 10:17:03 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1687f838-2000-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 12:17:02 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id DF2F84EE0749;
 Sat,  1 Jun 2024 12:17:00 +0200 (CEST)
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
X-Inumbo-ID: 1687f838-2000-11ef-90a1-e314d9c70b13
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
Subject: [XEN PATCH 1/5] xen/domain: deviate violation of MISRA C Rule 20.12
Date: Sat,  1 Jun 2024 12:16:52 +0200
Message-Id: <843540164f7e8f910226e1ded05e153cb04c519d.1717236930.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717236930.git.nicola.vetrini@bugseng.com>
References: <cover.1717236930.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.12 states: "A macro parameter used as an operand to
the # or ## operators, which is itself subject to further macro replacement,
shall only be used as an operand to these operators".

In this case, builds where CONFIG_DEBUG_LOCK_PROFILE=y the domain_lock
macro is used both as a regular macro argument and as an operand for
stringification in the expansion of macro spin_lock_init_prof.
A SAF-x-safe deviation is introduced to justify this.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 docs/misra/safe.json | 8 ++++++++
 xen/common/domain.c  | 1 +
 2 files changed, 9 insertions(+)

diff --git a/docs/misra/safe.json b/docs/misra/safe.json
index 9b13bcf71706..c213e0a0be3b 100644
--- a/docs/misra/safe.json
+++ b/docs/misra/safe.json
@@ -52,6 +52,14 @@
         },
         {
             "id": "SAF-6-safe",
+            "analyser": {
+                "eclair": "MC3R1.R20.12"
+            },
+            "name": "MC3R1.R20.12: use of a macro argument that deliberately violates the Rule",
+            "text": "A macro parameter that is itself a macro is intentionally used within the macro both as a regular parameter and for text replacement."
+        },
+        {
+            "id": "SAF-7-safe",
             "analyser": {},
             "name": "Sentinel",
             "text": "Next ID to be used"
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 67cadb7c3f4f..2c7168093734 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -632,6 +632,7 @@ struct domain *domain_create(domid_t domid,
 
     atomic_set(&d->refcnt, 1);
     RCU_READ_LOCK_INIT(&d->rcu_lock);
+    /* SAF-6-safe Rule 20.12 expansion of macro domain_lock in debug builds */
     rspin_lock_init_prof(d, domain_lock);
     rspin_lock_init_prof(d, page_alloc_lock);
     spin_lock_init(&d->hypercall_deadlock_mutex);
-- 
2.34.1


