Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247576FF09
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 12:56:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577100.903982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRsTp-0006Te-Vs; Fri, 04 Aug 2023 10:56:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577100.903982; Fri, 04 Aug 2023 10:56:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRsTp-0006Ry-T2; Fri, 04 Aug 2023 10:56:25 +0000
Received: by outflank-mailman (input) for mailman id 577100;
 Fri, 04 Aug 2023 10:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HS9z=DV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qRsTp-0006Rs-2S
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 10:56:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c9d7087-32b5-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 12:56:22 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-35-203-138.retail.telecomitalia.it [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id BDD174EE0737;
 Fri,  4 Aug 2023 12:56:21 +0200 (CEST)
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
X-Inumbo-ID: 8c9d7087-32b5-11ee-8613-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] x86/processor: drop bool_t from mcheck_init() parameter
Date: Fri,  4 Aug 2023 12:56:15 +0200
Message-Id: <26b30382b1b3daffb829ceb34d39c14185e9e147.1691146541.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop bool_t to make the function declaration consistent with the
corresponding definition.
This addresses a violation of MISRA C:2012 Rule 8.3 ("All declarations
of an object or function shall use the same names and type qualifiers").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 0989748be6..ae43ba5dc9 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -415,7 +415,7 @@ void noreturn fatal_trap(const struct cpu_user_regs *regs, bool_t show_remote);
 extern void mtrr_ap_init(void);
 extern void mtrr_bp_init(void);
 
-void mcheck_init(struct cpuinfo_x86 *c, bool_t bsp);
+void mcheck_init(struct cpuinfo_x86 *c, bool bsp);
 
 void do_nmi(const struct cpu_user_regs *regs);
 void do_machine_check(const struct cpu_user_regs *regs);
-- 
2.34.1


