Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B181A415
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 17:15:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658167.1027238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFzEJ-0007Uy-Lo; Wed, 20 Dec 2023 16:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658167.1027238; Wed, 20 Dec 2023 16:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFzEJ-0007SL-IH; Wed, 20 Dec 2023 16:15:31 +0000
Received: by outflank-mailman (input) for mailman id 658167;
 Wed, 20 Dec 2023 16:15:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TKvH=H7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFzEH-0007SF-EM
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 16:15:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc94fa4c-9f52-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 17:15:27 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 136FB4EE073A;
 Wed, 20 Dec 2023 17:15:24 +0100 (CET)
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
X-Inumbo-ID: fc94fa4c-9f52-11ee-9b0f-b553b5be7939
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
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] docs/misra: exclude files inherited from ACPI CA from MISRA compliance
Date: Wed, 20 Dec 2023 17:15:21 +0100
Message-Id: <2a6df4ecd1cbcd14e3eb462eed0e1a73670ed762.1703067901.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The files under 'include/acpi/ac*.h' and 'include/acpi/plaform/ac*.h'
are inherited from Linux and ACPI CA, therefore they are not subject to
MISRA compliance at the moment.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Generalize the exclusion to ac*.h
- Add exclusion for acpi/platform/ac*.h

I added acpi/platform to the exclusion list since they indeed seem in the same
lot as the other ac*.h headers, as pointed out in v1 by Jan Beulich.
---
 docs/misra/exclude-list.json | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 48f671c548b6..72b75215607f 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -194,19 +194,11 @@
             "comment": "Imported from Linux, ignore for now"
         },
         {
-            "rel_path": "include/acpi/acpiosxf.h",
+            "rel_path": "include/acpi/ac*.h",
             "comment": "Imported from Linux, ignore for now"
         },
         {
-            "rel_path": "include/acpi/acpixf.h",
-            "comment": "Imported from Linux, ignore for now"
-        },
-        {
-          "rel_path": "include/acpi/acexcep.h",
-          "comment": "Imported from Linux, ignore for now"
-        },
-        {
-          "rel_path": "include/acpi/acglobal.h",
+          "rel_path": "include/acpi/platform/ac*.h",
           "comment": "Imported from Linux, ignore for now"
         },
         {
-- 
2.34.1

