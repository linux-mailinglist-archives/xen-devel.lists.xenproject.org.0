Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41EA7787D6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 09:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582268.911925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMEe-0001dA-Ar; Fri, 11 Aug 2023 07:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582268.911925; Fri, 11 Aug 2023 07:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUMEe-0001bA-7s; Fri, 11 Aug 2023 07:07:00 +0000
Received: by outflank-mailman (input) for mailman id 582268;
 Fri, 11 Aug 2023 07:06:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ntus=D4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qUMEc-0001b4-W5
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 07:06:58 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8200aee-3815-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 09:06:56 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-55-201-67.retail.telecomitalia.it [79.55.201.67])
 by support.bugseng.com (Postfix) with ESMTPSA id 6A98A4EE073F;
 Fri, 11 Aug 2023 09:06:55 +0200 (CEST)
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
X-Inumbo-ID: a8200aee-3815-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/hypercalls: address violations of MISRA C:2012 Rule 8.3
Date: Fri, 11 Aug 2023 09:06:48 +0200
Message-Id: <5500643d99b315aa4344e5e3a833e6efa9a0413f.1691737296.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Uniform the auto-generated hypercall-decls with the corresponding
definitions to address violations of MISRA C:2012 Rule 8.3:
"All declarations of an object or function shall use the same names and
type qualifiers".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/hypercall-defs.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/include/hypercall-defs.c b/xen/include/hypercall-defs.c
index 6d361ddfce..4feddce571 100644
--- a/xen/include/hypercall-defs.c
+++ b/xen/include/hypercall-defs.c
@@ -107,11 +107,16 @@ defhandle: physdev_op_compat_t
 prefix: do PREFIX_hvm PREFIX_compat PREFIX_do_arm
 physdev_op(int cmd, void *arg)
 
-prefix: do PREFIX_hvm PREFIX_compat
+prefix: do PREFIX_hvm
 #if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
 grant_table_op(unsigned int cmd, void *uop, unsigned int count)
 #endif
 
+prefix: PREFIX_compat
+#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
+grant_table_op(unsigned int cmd, void *cmp_uop, unsigned int count)
+#endif
+
 prefix: do PREFIX_hvm
 memory_op(unsigned long cmd, void *arg)
 
@@ -136,7 +141,7 @@ xenoprof_op(int op, void *arg)
 prefix: compat
 set_timer_op(uint32_t lo, int32_t hi)
 multicall(multicall_entry_compat_t *call_list, uint32_t nr_calls)
-memory_op(unsigned int cmd, void *arg)
+memory_op(unsigned int cmd, void *compat)
 #ifdef CONFIG_IOREQ_SERVER
 dm_op(domid_t domid, unsigned int nr_bufs, void *bufs)
 #endif
@@ -172,7 +177,7 @@ console_io(unsigned int cmd, unsigned int count, char *buffer)
 vm_assist(unsigned int cmd, unsigned int type)
 event_channel_op(int cmd, void *arg)
 mmuext_op(mmuext_op_t *uops, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
-multicall(multicall_entry_t *call_list, unsigned int nr_calls)
+multicall(multicall_entry_t *call_list, uint32_t nr_calls)
 #ifdef CONFIG_PV
 mmu_update(mmu_update_t *ureqs, unsigned int count, unsigned int *pdone, unsigned int foreigndom)
 stack_switch(unsigned long ss, unsigned long esp)
-- 
2.34.1


