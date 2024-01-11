Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6A182B7FC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 00:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666575.1037306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Pm-0001r4-Qi; Thu, 11 Jan 2024 23:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666575.1037306; Thu, 11 Jan 2024 23:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rO4Pm-0001pT-NV; Thu, 11 Jan 2024 23:24:46 +0000
Received: by outflank-mailman (input) for mailman id 666575;
 Thu, 11 Jan 2024 23:24:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ifVr=IV=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rO4Pl-0001pN-8K
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 23:24:45 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 992a2a26-b0d8-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 00:24:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id ED5DE82853FF;
 Thu, 11 Jan 2024 17:24:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PwSK3NfgIfZ6; Thu, 11 Jan 2024 17:24:41 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5868E8285585;
 Thu, 11 Jan 2024 17:24:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dmVeHTwLH0M1; Thu, 11 Jan 2024 17:24:41 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C59C982853FF;
 Thu, 11 Jan 2024 17:24:40 -0600 (CST)
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
X-Inumbo-ID: 992a2a26-b0d8-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5868E8285585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1705015481; bh=H90w1xQrYjxfrgBat3wPt+rF605mPXis1SY2TqBYf/k=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=doJwMMy0hYmf9Z2H/lqxkhrupR8KbJral+2ulD03XPxTdJY+3Gs/Mqd47sq4bjPhf
	 AMrVbRJ0SqpJ8DqUnReDWZOjiTogtdxyQ3zfSBZAMBThjSCtO56i99oVqHPDaHTy75
	 qiBMqNFrhG8wuZGtD4lOOSeqCOfFeJY04QzxSB4g=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: bootfdt: Harden handling of malformed mem reserve map
Date: Thu, 11 Jan 2024 17:24:22 -0600
Message-Id: <20240111232422.2610495-1-sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The early_print_info routine in bootfdt.c incorrectly stores the result
of a call to fdt_num_mem_rsv() in an unsigned int, which results in the
negative error code being interpreted incorrectly in a subsequent loop
in the case where the device tree is malformed. Fix this by properly
checking the return code for an error and calling panic().

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v2:
  - panic() if the fdt_num_mem_rsv() call fails
  - Reword commit message to clarify that the error condition can only
  be triggered by a malformed device tree
  - Rebase to standalone patch instead of a part of my patch series
  '[PATCH v2 0/7] Early Boot Allocation on Power'

---
 xen/arch/arm/bootfdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 1cbac3cb2a..35dbdf3384 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -463,7 +463,8 @@ static void __init early_print_info(void)
     struct meminfo *mem_resv = &bootinfo.reserved_mem;
     struct bootmodules *mods = &bootinfo.modules;
     struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    unsigned int i, j, nr_rsvd;
+    unsigned int i, j;
+    int nr_rsvd;

     for ( i = 0; i < mi->nr_banks; i++ )
         printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
@@ -478,6 +479,9 @@ static void __init early_print_info(void)
                 boot_module_kind_as_string(mods->module[i].kind));

     nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);
+    if ( nr_rsvd < 0 )
+        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
+
     for ( i = 0; i < nr_rsvd; i++ )
     {
         paddr_t s, e;
--
2.30.2


