Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B697684DAE8
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 08:56:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678014.1055024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzGG-0001ml-0e; Thu, 08 Feb 2024 07:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678014.1055024; Thu, 08 Feb 2024 07:55:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzGF-0001lF-TF; Thu, 08 Feb 2024 07:55:55 +0000
Received: by outflank-mailman (input) for mailman id 678014;
 Thu, 08 Feb 2024 07:55:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z5WF=JR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rXzGE-0001l9-Lo
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 07:55:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b8a708d-c657-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 08:55:53 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4C9114EE0739;
 Thu,  8 Feb 2024 08:55:51 +0100 (CET)
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
X-Inumbo-ID: 7b8a708d-c657-11ee-8a4a-1f161083a0e0
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
Subject: [XEN PATCH] docs/misra: add x86_64 and arm64 asm-offset.c to exclude-list
Date: Thu,  8 Feb 2024 08:55:47 +0100
Message-Id: <b0c855581eed247a32b745906f84d352bf812091.1707324479.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These two files contain several deliberate violations of MISRA C rules and
they are not linked in the final Xen binary, therefore they can be exempted
from MISRA compliance.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Since the exclude list only contains arm64 and x86 files I reasoned that
introducing an entry that would match all architectures would not be desirable
(e.g., arm32). I'm happy to change that, though.
---
 docs/misra/exclude-list.json | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index 7971d0e70f5b..bd05478e03e9 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -17,6 +17,10 @@
             "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+          "rel_path": "arch/arm/arm64/asm-offsets.c",
+          "comment": "The resulting code is not included in the final Xen binary, ignore for now"
+        },
         {
             "rel_path": "arch/x86/acpi/boot.c",
             "comment": "Imported from Linux, ignore for now"
@@ -97,6 +101,10 @@
             "rel_path": "arch/x86/x86_64/mmconf-fam10h.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+          "rel_path": "arch/x86/x86_64/asm-offsets.c",
+          "comment": "The resulting code is not included in the final Xen binary, ignore for now"
+        },
         {
             "rel_path": "arch/x86/efi/check.c",
             "comment": "The resulting code is not included in the final Xen binary, ignore for now"
-- 
2.34.1

