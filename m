Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF868511C4A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 18:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315263.533730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkJK-0006d9-LM; Wed, 27 Apr 2022 16:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315263.533730; Wed, 27 Apr 2022 16:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njkJK-0006ad-IP; Wed, 27 Apr 2022 16:14:38 +0000
Received: by outflank-mailman (input) for mailman id 315263;
 Wed, 27 Apr 2022 16:14:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sRcl=VF=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1njkJJ-0006aX-Fi
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 16:14:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 20da3222-c645-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 18:14:35 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C28E6ED1;
 Wed, 27 Apr 2022 09:14:34 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC8B63F5A1;
 Wed, 27 Apr 2022 09:14:33 -0700 (PDT)
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
X-Inumbo-ID: 20da3222-c645-11ec-8fc2-03012f2f19d4
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/its: enable LPIs before mapping the collection table
Date: Wed, 27 Apr 2022 17:14:25 +0100
Message-Id: <7762e8e35be1f99f2a7ca81aa8cf8fc502030e7b.1651075773.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MAPC_LPI_OFF ITS command error can be reported to software if LPIs are
not enabled before mapping the collection table using MAPC command.

Enable the LPIs using GICR_CTLR.EnableLPIs before mapping the collection
table.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/gic-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 3c472ed768..8fb0014b16 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -812,11 +812,11 @@ static int gicv3_cpu_init(void)
     /* If the host has any ITSes, enable LPIs now. */
     if ( gicv3_its_host_has_its() )
     {
+        if ( !gicv3_enable_lpis() )
+            return -EBUSY;
         ret = gicv3_its_setup_collection(smp_processor_id());
         if ( ret )
             return ret;
-        if ( !gicv3_enable_lpis() )
-            return -EBUSY;
     }
 
     /* Set priority on PPI and SGI interrupts */
-- 
2.25.1


