Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893A778802
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 09:20:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582282.911974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRB-0004PT-Lr; Fri, 11 Aug 2023 07:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582282.911974; Fri, 11 Aug 2023 07:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMRB-0004Gy-Gs; Fri, 11 Aug 2023 07:19:57 +0000
Received: by outflank-mailman (input) for mailman id 582282;
 Fri, 11 Aug 2023 07:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r9U=D4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qUMRA-00039t-08
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 07:19:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 77ea5903-3817-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 09:19:54 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id B9CCF4EE0744;
 Fri, 11 Aug 2023 09:19:53 +0200 (CEST)
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
X-Inumbo-ID: 77ea5903-3817-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [XEN PATCH 3/6] x86/vm_event: add missing include
Date: Fri, 11 Aug 2023 09:19:28 +0200
Message-Id: <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691676251.git.nicola.vetrini@bugseng.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The missing header included by this patch provides declarations for
the functions 'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
that are defined in the source file. This also resolves violations
of MISRA C:2012 Rule 8.4.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Fixes: adc75eba8b15 ("x86/vm_event: consolidate hvm_event_fill_regs and p2m_vm_event_fill_regs")
Fixes: 975efd3baa8d ("introduce VM_EVENT_FLAG_SET_REGISTERS")
Fixes: 9864841914c2 ("x86/vm_event: add support for VM_EVENT_REASON_INTERRUPT")
---
 xen/arch/x86/vm_event.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
index 7027c08a926b..499b6b349d79 100644
--- a/xen/arch/x86/vm_event.c
+++ b/xen/arch/x86/vm_event.c
@@ -20,6 +20,7 @@
 
 #include <xen/sched.h>
 #include <xen/mem_access.h>
+#include <xen/vm_event.h>
 #include <asm/vm_event.h>
 
 /* Implicitly serialized by the domctl lock. */
-- 
2.34.1


