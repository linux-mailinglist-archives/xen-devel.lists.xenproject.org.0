Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095F586CCEF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 16:28:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687200.1070308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKY-0001in-Vc; Thu, 29 Feb 2024 15:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687200.1070308; Thu, 29 Feb 2024 15:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfiKY-0001cQ-Hl; Thu, 29 Feb 2024 15:28:18 +0000
Received: by outflank-mailman (input) for mailman id 687200;
 Thu, 29 Feb 2024 15:28:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfiKX-0008Ql-4w
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 15:28:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28499bfa-d717-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 16:28:15 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.196])
 by support.bugseng.com (Postfix) with ESMTPSA id D53774EE0752;
 Thu, 29 Feb 2024 16:28:14 +0100 (CET)
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
X-Inumbo-ID: 28499bfa-d717-11ee-a1ee-f123f15fe8a2
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
Subject: [XEN PATCH 10/10] xen/keyhandler: address violations of MISRA C Rule 20.7
Date: Thu, 29 Feb 2024 16:28:02 +0100
Message-Id: <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709219010.git.nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/keyhandler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 127ca506965c..4c1ce007870f 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -42,10 +42,10 @@ static struct keyhandler {
 } key_table[128] __read_mostly =
 {
 #define KEYHANDLER(k, f, desc, diag)            \
-    [k] = { { .fn = (f) }, desc, 0, diag }
+    [k] = { { .fn = (f) }, (desc), 0, (diag) }
 
 #define IRQ_KEYHANDLER(k, f, desc, diag)        \
-    [k] = { { .irq_fn = (f) }, desc, 1, diag }
+    [k] = { { .irq_fn = (f) }, (desc), 1, (diag) }
 
     IRQ_KEYHANDLER('A', do_toggle_alt_key, "toggle alternative key handling", 0),
     IRQ_KEYHANDLER('d', dump_registers, "dump registers", 1),
-- 
2.34.1


