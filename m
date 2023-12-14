Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD33812F10
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 12:44:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654491.1021436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8Z-0001pF-OB; Thu, 14 Dec 2023 11:44:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654491.1021436; Thu, 14 Dec 2023 11:44:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDk8Z-0001gZ-GE; Thu, 14 Dec 2023 11:44:19 +0000
Received: by outflank-mailman (input) for mailman id 654491;
 Thu, 14 Dec 2023 11:44:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=57RS=HZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rDk8X-00016v-Tc
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 11:44:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c0e4ffd-9a76-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 12:44:16 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A1EF04EE0746;
 Thu, 14 Dec 2023 12:44:15 +0100 (CET)
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
X-Inumbo-ID: 1c0e4ffd-9a76-11ee-9b0f-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 5/5] xen/wait: address violations of MISRA C Rule 11.9
Date: Thu, 14 Dec 2023 12:44:10 +0100
Message-Id: <a4e13ba24ab54895454d8df1c956865f7cf7f0b5.1702553835.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702553835.git.nicola.vetrini@bugseng.com>
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/wait.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/wait.c b/xen/common/wait.c
index 86d3b15419db..cb6f5ff3c20a 100644
--- a/xen/common/wait.c
+++ b/xen/common/wait.c
@@ -125,7 +125,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
     struct vcpu *curr = current;
     unsigned long dummy;
 
-    ASSERT(wqv->esp == 0);
+    ASSERT(wqv->esp == NULL);
 
     /* Save current VCPU affinity; force wakeup on *this* CPU only. */
     if ( vcpu_temporary_affinity(curr, smp_processor_id(), VCPU_AFFINITY_WAIT) )
@@ -171,7 +171,7 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
           [sz] "i" (PAGE_SIZE)
         : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
 
-    if ( unlikely(wqv->esp == 0) )
+    if ( unlikely(wqv->esp == NULL) )
     {
         gdprintk(XENLOG_ERR, "Stack too large in %s\n", __func__);
         domain_crash(curr->domain);
-- 
2.34.1


