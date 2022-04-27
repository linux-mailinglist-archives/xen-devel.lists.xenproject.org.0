Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E11E51146B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:50:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314686.532926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJC-0001vX-QK; Wed, 27 Apr 2022 09:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314686.532926; Wed, 27 Apr 2022 09:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJC-0001pU-Lg; Wed, 27 Apr 2022 09:50:06 +0000
Received: by outflank-mailman (input) for mailman id 314686;
 Wed, 27 Apr 2022 09:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTRx=VF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njeJA-0008Li-MV
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:50:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 695eb213-c60f-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 11:50:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54D7014BF;
 Wed, 27 Apr 2022 02:50:03 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.13.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C278B3F774;
 Wed, 27 Apr 2022 02:50:01 -0700 (PDT)
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
X-Inumbo-ID: 695eb213-c60f-11ec-8fc2-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 6/8] platforms/xgene: Make use of dt_device_get_address return value
Date: Wed, 27 Apr 2022 11:49:39 +0200
Message-Id: <20220427094941.291554-7-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427094941.291554-1-michal.orzel@arm.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently function xgene_check_pirq_eoi assignes a return value of
dt_device_get_address to a variable res but does not make use of it.
Fix it by making use of res in a condition checking the result of a
call to dt_device_get_address instead of checking the address
stored in dbase.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/platforms/xgene-storm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/platforms/xgene-storm.c b/xen/arch/arm/platforms/xgene-storm.c
index fced4d7c2c..befd0c3c2d 100644
--- a/xen/arch/arm/platforms/xgene-storm.c
+++ b/xen/arch/arm/platforms/xgene-storm.c
@@ -51,7 +51,7 @@ static void __init xgene_check_pirq_eoi(void)
         panic("%s: Can not find interrupt controller node\n", __func__);
 
     res = dt_device_get_address(node, 0, &dbase, NULL);
-    if ( !dbase )
+    if ( res )
         panic("%s: Cannot find a valid address for the distributor\n", __func__);
 
     /*
-- 
2.25.1


