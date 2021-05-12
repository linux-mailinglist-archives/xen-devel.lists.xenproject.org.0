Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3300A37CFE4
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 19:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126329.237823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgsm2-0001KG-LV; Wed, 12 May 2021 17:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126329.237823; Wed, 12 May 2021 17:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgsm2-0001Hk-IA; Wed, 12 May 2021 17:35:54 +0000
Received: by outflank-mailman (input) for mailman id 126329;
 Wed, 12 May 2021 17:35:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lgsm1-0001He-Mo
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 17:35:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgsm1-00087v-5g; Wed, 12 May 2021 17:35:53 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgsm0-0000Tq-Se; Wed, 12 May 2021 17:35:53 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=OA06v4DNmwymHkROXKnzWmQ6sFacjCJ8GkVTi9Nj6H8=; b=aqbMCoMQnkevTLAg16qekpF+av
	6R6i2Fc4crbn/MYpl/RqhmM/8DaIzyrQLo9c4Vuz1MizPmZQ9r7Ch77AneJIDgncEW5p3giJEX2o6
	SAYA+w8A45Uav1g04ucSY3e4Ye7IJ2XblJzkro5ya3e8egvTz2s1RxJHlrPvMVjkVXCs=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: gic-v3: Add missing breaks gicv3_read_apr()
Date: Wed, 12 May 2021 18:35:48 +0100
Message-Id: <20210512173548.27244-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Commit 78e67c99eb3f "arm/gic: Get rid of READ/WRITE_SYSREG32"
mistakenly converted all the cases in gicv3_read_apr() to fall-through.

Rather than re-instating a return per case, add the missing break and
keep a single return at the end of the fucntion.

Fixes: 78e67c99eb3f ("arm/gic: Get rid of READ/WRITE_SYSREG32")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/gic-v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index b86f04058947..9a3a175ad7d2 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1167,12 +1167,15 @@ static unsigned int gicv3_read_apr(int apr_reg)
     case 0:
         ASSERT(gicv3.nr_priorities > 4 && gicv3.nr_priorities < 8);
         apr = READ_SYSREG(ICH_AP1R0_EL2);
+        break;
     case 1:
         ASSERT(gicv3.nr_priorities > 5 && gicv3.nr_priorities < 8);
         apr = READ_SYSREG(ICH_AP1R1_EL2);
+        break;
     case 2:
         ASSERT(gicv3.nr_priorities > 6 && gicv3.nr_priorities < 8);
         apr = READ_SYSREG(ICH_AP1R2_EL2);
+        break;
     default:
         BUG();
     }
-- 
2.17.1


