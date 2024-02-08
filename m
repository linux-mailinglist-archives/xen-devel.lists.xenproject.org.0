Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2634584E459
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 16:50:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678296.1055412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6fe-0005QU-BD; Thu, 08 Feb 2024 15:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678296.1055412; Thu, 08 Feb 2024 15:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY6fe-0005Og-8g; Thu, 08 Feb 2024 15:50:38 +0000
Received: by outflank-mailman (input) for mailman id 678296;
 Thu, 08 Feb 2024 15:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z5WF=JR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rY6fc-0005GL-L1
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 15:50:36 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc67806a-c699-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 16:50:35 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id D54794EE0739;
 Thu,  8 Feb 2024 16:50:33 +0100 (CET)
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
X-Inumbo-ID: cc67806a-c699-11ee-8a4a-1f161083a0e0
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
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
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] docs/misra: add asm-offset.c to exclude-list
Date: Thu,  8 Feb 2024 16:50:09 +0100
Message-Id: <09b659e19bf2cc6b3ee4320e019bdfa7def5f3b8.1707406598.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These files contain several deliberate violations of MISRA C rules and
they are not linked in the final Xen binary, therefore they can be exempted
from MISRA compliance.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- use a glob to exclude this file for all architectures.
---
 docs/misra/exclude-list.json | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 7971d0e70f5b..89df966eeac9 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -101,6 +101,10 @@
             "rel_path": "arch/x86/efi/check.c",
             "comment": "The resulting code is not included in the final Xen binary, ignore for now"
         },
+        {
+          "rel_path": "arch/*/*/asm-offsets.c",
+          "comment": "The resulting code is not included in the final Xen binary, ignore for now"
+        },
         {
             "rel_path": "common/coverage/*",
             "comment": "Files to support gcov, ignore for now"
-- 
2.34.1


