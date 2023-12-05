Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E1D8053A0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:56:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647703.1011275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU25-0000sx-NE; Tue, 05 Dec 2023 11:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647703.1011275; Tue, 05 Dec 2023 11:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU25-0000my-GH; Tue, 05 Dec 2023 11:56:09 +0000
Received: by outflank-mailman (input) for mailman id 647703;
 Tue, 05 Dec 2023 11:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDPQ=HQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rAU24-0008Co-9i
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:56:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44aa20d2-9365-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:56:05 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-79-46-48-173.retail.telecomitalia.it [79.46.48.173])
 by support.bugseng.com (Postfix) with ESMTPSA id 70CF74EE0750;
 Tue,  5 Dec 2023 12:56:04 +0100 (CET)
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
X-Inumbo-ID: 44aa20d2-9365-11ee-98e5-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 5/6] x86/mce: address violations of MISRA C:2012 Rule 8.2
Date: Tue,  5 Dec 2023 12:55:54 +0100
Message-Id: <16a4587adaac7b116026c0df4addd254d4a33715.1701764980.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701764980.git.federico.serafini@bugseng.com>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/mce.h  | 2 +-
 xen/arch/x86/include/asm/mce.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index b6fc9c3617..34285296b4 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -158,7 +158,7 @@ extern void mce_need_clearbank_register(mce_need_clearbank_t cbfunc);
  * MCi_STATUS value for that bank.
  */
 typedef struct mcinfo_extended *(*x86_mce_callback_t)
-    (struct mc_info *, uint16_t, uint64_t);
+    (struct mc_info *mi, uint16_t bank, uint64_t status);
 extern void x86_mce_callback_register(x86_mce_callback_t cbfunc);
 
 void *x86_mcinfo_reserve(struct mc_info *mi,
diff --git a/xen/arch/x86/include/asm/mce.h b/xen/arch/x86/include/asm/mce.h
index 2c63318c08..6ce56b5b85 100644
--- a/xen/arch/x86/include/asm/mce.h
+++ b/xen/arch/x86/include/asm/mce.h
@@ -37,8 +37,8 @@ struct domain;
 struct vcpu;
 
 /* Guest vMCE MSRs virtualization */
-extern void vmce_init_vcpu(struct vcpu *);
-extern int vmce_restore_vcpu(struct vcpu *, const struct hvm_vmce_vcpu *);
+extern void vmce_init_vcpu(struct vcpu *v);
+extern int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt);
 extern int vmce_wrmsr(uint32_t msr, uint64_t val);
 extern int vmce_rdmsr(uint32_t msr, uint64_t *val);
 extern bool vmce_has_lmce(const struct vcpu *v);
-- 
2.34.1


