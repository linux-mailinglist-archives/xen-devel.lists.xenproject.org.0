Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB657819D8C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 12:03:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657633.1026631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuME-0005Hw-98; Wed, 20 Dec 2023 11:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657633.1026631; Wed, 20 Dec 2023 11:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFuME-0005Ba-3s; Wed, 20 Dec 2023 11:03:22 +0000
Received: by outflank-mailman (input) for mailman id 657633;
 Wed, 20 Dec 2023 11:03:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xS+a=H7=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rFuMC-00054g-JY
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:03:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61969488-9f27-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 12:03:18 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.218.228])
 by support.bugseng.com (Postfix) with ESMTPSA id 6169E4EE0C99;
 Wed, 20 Dec 2023 12:03:17 +0100 (CET)
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
X-Inumbo-ID: 61969488-9f27-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH 1/7] xen/arm: gic-v3: address violations of MISRA C:2012 Rule 16.3
Date: Wed, 20 Dec 2023 12:03:01 +0100
Message-Id: <fe578951c716f7745c14b1fc2851ce9de4da90cb.1703066935.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703066935.git.federico.serafini@bugseng.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pseudo-keyword fallthrough to meet the requirements to
deviate Rule 16.3 ("An unconditional `break' statement shall terminate
every switch-clause").
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/arm/gic-v3.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 18289cd645..bf0e5c1b75 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -65,34 +65,49 @@ static inline void gicv3_save_lrs(struct vcpu *v)
     {
     case 16:
         v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
+        fallthrough;
     case 15:
         v->arch.gic.v3.lr[14] = READ_SYSREG_LR(14);
+        fallthrough;
     case 14:
         v->arch.gic.v3.lr[13] = READ_SYSREG_LR(13);
+        fallthrough;
     case 13:
         v->arch.gic.v3.lr[12] = READ_SYSREG_LR(12);
+        fallthrough;
     case 12:
         v->arch.gic.v3.lr[11] = READ_SYSREG_LR(11);
+        fallthrough;
     case 11:
         v->arch.gic.v3.lr[10] = READ_SYSREG_LR(10);
+        fallthrough;
     case 10:
         v->arch.gic.v3.lr[9] = READ_SYSREG_LR(9);
+        fallthrough;
     case 9:
         v->arch.gic.v3.lr[8] = READ_SYSREG_LR(8);
+        fallthrough;
     case 8:
         v->arch.gic.v3.lr[7] = READ_SYSREG_LR(7);
+        fallthrough;
     case 7:
         v->arch.gic.v3.lr[6] = READ_SYSREG_LR(6);
+        fallthrough;
     case 6:
         v->arch.gic.v3.lr[5] = READ_SYSREG_LR(5);
+        fallthrough;
     case 5:
         v->arch.gic.v3.lr[4] = READ_SYSREG_LR(4);
+        fallthrough;
     case 4:
         v->arch.gic.v3.lr[3] = READ_SYSREG_LR(3);
+        fallthrough;
     case 3:
         v->arch.gic.v3.lr[2] = READ_SYSREG_LR(2);
+        fallthrough;
     case 2:
         v->arch.gic.v3.lr[1] = READ_SYSREG_LR(1);
+        fallthrough;
     case 1:
          v->arch.gic.v3.lr[0] = READ_SYSREG_LR(0);
          break;
@@ -112,34 +127,49 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
     {
     case 16:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
+        fallthrough;
     case 15:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[14], 14);
+        fallthrough;
     case 14:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[13], 13);
+        fallthrough;
     case 13:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[12], 12);
+        fallthrough;
     case 12:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[11], 11);
+        fallthrough;
     case 11:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[10], 10);
+        fallthrough;
     case 10:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[9], 9);
+        fallthrough;
     case 9:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[8], 8);
+        fallthrough;
     case 8:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[7], 7);
+        fallthrough;
     case 7:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[6], 6);
+        fallthrough;
     case 6:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[5], 5);
+        fallthrough;
     case 5:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[4], 4);
+        fallthrough;
     case 4:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[3], 3);
+        fallthrough;
     case 3:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[2], 2);
+        fallthrough;
     case 2:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[1], 1);
+        fallthrough;
     case 1:
         WRITE_SYSREG_LR(v->arch.gic.v3.lr[0], 0);
         break;
-- 
2.34.1


