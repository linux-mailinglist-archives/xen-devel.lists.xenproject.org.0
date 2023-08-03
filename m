Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2016976E58F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576181.902068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUM-0005Zw-8W; Thu, 03 Aug 2023 10:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576181.902068; Thu, 03 Aug 2023 10:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUM-0005Wh-0K; Thu, 03 Aug 2023 10:23:26 +0000
Received: by outflank-mailman (input) for mailman id 576181;
 Thu, 03 Aug 2023 10:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVUJ-0005QX-Lm
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:23:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c587ec01-31e7-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 12:23:21 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 217904EE0741;
 Thu,  3 Aug 2023 12:23:21 +0200 (CEST)
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
X-Inumbo-ID: c587ec01-31e7-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:18 +0200
Message-Id: <c39836607097b09119a4f4480c77506295333a55.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/arm/include/asm/processor.h | 6 +++---
 xen/arch/arm/vtimer.c                | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 7e42ff8811..8e02410465 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -521,9 +521,9 @@ extern register_t __cpu_logical_map[];
 #define CNTKCTL_EL1_EL0PTEN  (1u<<9) /* Expose phys timer registers to EL0 */
 
 /* Timer control registers */
-#define CNTx_CTL_ENABLE   (1ul<<0)  /* Enable timer */
-#define CNTx_CTL_MASK     (1ul<<1)  /* Mask IRQ */
-#define CNTx_CTL_PENDING  (1ul<<2)  /* IRQ pending */
+#define CNTx_CTL_ENABLE   (1UL<<0)  /* Enable timer */
+#define CNTx_CTL_MASK     (1UL<<1)  /* Mask IRQ */
+#define CNTx_CTL_PENDING  (1UL<<2)  /* IRQ pending */
 
 /* Timer frequency mask */
 #define CNTFRQ_MASK       GENMASK(31, 0)
diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
index 48f2daa907..c54360e202 100644
--- a/xen/arch/arm/vtimer.c
+++ b/xen/arch/arm/vtimer.c
@@ -206,7 +206,7 @@ static bool vtimer_cntp_tval(struct cpu_user_regs *regs, register_t *r,
 
     if ( read )
     {
-        *r = (uint32_t)((v->arch.phys_timer.cval - cntpct) & 0xffffffffull);
+        *r = (uint32_t)((v->arch.phys_timer.cval - cntpct) & 0xffffffffULL);
     }
     else
     {
-- 
2.34.1


