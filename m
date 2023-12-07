Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457D0808388
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 09:48:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649608.1014320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3G-0004zq-Ke; Thu, 07 Dec 2023 08:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649608.1014320; Thu, 07 Dec 2023 08:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3G-0004wR-Fm; Thu, 07 Dec 2023 08:48:10 +0000
Received: by outflank-mailman (input) for mailman id 649608;
 Thu, 07 Dec 2023 08:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZB3o=HS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rBA3E-0004rG-V5
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 08:48:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57c55fe4-94dd-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 09:48:07 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.210.131.21])
 by support.bugseng.com (Postfix) with ESMTPSA id 537594EE0740;
 Thu,  7 Dec 2023 09:48:06 +0100 (CET)
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
X-Inumbo-ID: 57c55fe4-94dd-11ee-98e7-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 3/5] x86/mm: remove compat_subarch_memory_op()
Date: Thu,  7 Dec 2023 09:47:52 +0100
Message-Id: <285de0decf8ffe4277ce7e14a2561a693103f72b.1701936906.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701936906.git.federico.serafini@bugseng.com>
References: <cover.1701936906.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove remove compat_subarch_memory_op() declaration: there is no
definition and there are no calls to such function in the XEN project.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/mm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 05dfe35502..639163948e 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -573,7 +573,6 @@ int __sync_local_execstate(void);
 long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void));
-int compat_subarch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void));
 
 #define NIL(type) ((type *)-sizeof(type))
 #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
-- 
2.34.1


