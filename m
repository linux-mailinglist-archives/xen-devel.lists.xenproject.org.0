Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760987EEE60
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634946.990588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3v31-00028H-NN; Fri, 17 Nov 2023 09:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634946.990588; Fri, 17 Nov 2023 09:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3v31-00026G-Jo; Fri, 17 Nov 2023 09:21:59 +0000
Received: by outflank-mailman (input) for mailman id 634946;
 Fri, 17 Nov 2023 09:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2+Qn=G6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3v30-000267-Ew
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:21:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c150af02-852a-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 10:21:57 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 8373B4EE0744;
 Fri, 17 Nov 2023 10:21:55 +0100 (CET)
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
X-Inumbo-ID: c150af02-852a-11ee-98dc-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] domain: add ASSERT to help static analysis tools
Date: Fri, 17 Nov 2023 10:21:52 +0100
Message-Id: <921dee5b4ebb052ef66e06001f4b84dce7f5ecfc.1700212866.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static analysis tools may detect a possible null pointer
dereference of 'config'. This ASSERT helps them in detecting
that such a condition is not possible given that only
real domains can enter this branch, which are guaranteeed to have
a non-NULL config at this point, but this information is not
inferred by the tool.

Checking that the condition given in the assertion holds via
testing is the means to protect release builds, where the assertion
expands to effectively nothing.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Clarified the context in which the assertion is useful.

The check may be later improved by proper error checking
instead of relying on the semantics explained here:
https://lore.kernel.org/xen-devel/61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com/
---
 xen/common/domain.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8f9ab01c0cb7..924099db1098 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -700,6 +700,13 @@ struct domain *domain_create(domid_t domid,
 
     if ( !is_idle_domain(d) )
     {
+        /*
+         * The assertion helps static analysis tools infer that config cannot
+         * be NULL in this branch, which in turn means that it can be safely
+         * dereferenced. Therefore, this assertion is not redundant.
+         */
+        ASSERT(config);
+
         watchdog_domain_init(d);
         init_status |= INIT_watchdog;
 
-- 
2.34.1


