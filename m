Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E55819D90
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:03:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657636.1026666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMI-0006Fa-Gu; Wed, 20 Dec 2023 11:03:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657636.1026666; Wed, 20 Dec 2023 11:03:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuMI-0006D3-9q; Wed, 20 Dec 2023 11:03:26 +0000
Received: by outflank-mailman (input) for mailman id 657636;
 Wed, 20 Dec 2023 11:03:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xS+a=H7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rFuMG-0004rG-2S
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:03:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 647b579b-9f27-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 12:03:23 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.218.228])
 by support.bugseng.com (Postfix) with ESMTPSA id 75AB84EE0C92;
 Wed, 20 Dec 2023 12:03:22 +0100 (CET)
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
X-Inumbo-ID: 647b579b-9f27-11ee-98eb-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of MISRA C:2012 Rule 16.3
Date: Wed, 20 Dec 2023 12:03:05 +0100
Message-Id: <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703066935.git.federico.serafini@bugseng.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor of the switch-clauses to have a return statement at the end.
This satisfies the requirements to deviate Rule 16.3 ("An unconditional
`break' statement shall terminate every switch-clause).
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/arm64/vsysreg.c | 4 ++--
 xen/arch/arm/vcpreg.c        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index b5d54c569b..247f08ad8d 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
         /* RO at EL0. RAZ/WI at EL1 */
         if ( regs_mode_is_user(regs) )
             return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
-        else
-            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
+
+        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
     case HSR_SYSREG_PMCR_EL0:
     case HSR_SYSREG_PMCNTENSET_EL0:
     case HSR_SYSREG_PMCNTENCLR_EL0:
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index a2d0500704..685609f825 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -289,8 +289,8 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
         /* RO at EL0. RAZ/WI at EL1 */
         if ( regs_mode_is_user(regs) )
             return handle_ro_raz(regs, regidx, cp32.read, hsr, 0);
-        else
-            return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
+
+        return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
     case HSR_CPREG32(PMINTENSET):
     case HSR_CPREG32(PMINTENCLR):
         /* EL1 only, however MDCR_EL2.TPM==1 means EL0 may trap here also. */
-- 
2.34.1


