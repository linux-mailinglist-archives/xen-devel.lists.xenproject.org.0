Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BA35915EF
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385862.621691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHU-0001l1-Hg; Fri, 12 Aug 2022 19:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385862.621691; Fri, 12 Aug 2022 19:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHU-0001fu-4i; Fri, 12 Aug 2022 19:25:16 +0000
Received: by outflank-mailman (input) for mailman id 385862;
 Fri, 12 Aug 2022 19:25:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaHT-0001Zh-43
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:25:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHS-0000yh-2I; Fri, 12 Aug 2022 19:25:14 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHR-0006n6-Qr; Fri, 12 Aug 2022 19:25:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=eGtlPOnezZCPLrLes6dERbD5TA/IOWPTENXfEX+3CEs=; b=6Te1Jx2dnT6deYglAWnLaUUau3
	U/r15cOgOvWaXvMcF/a2mzL/7pyf8Rm4JGqCykyoOIXjqAcwWlGqtMDz0XdHLsceAKfT3bkQYD4v0
	uOATOoul/JA3wyyWq3riti4jsIA1JPT+uXkQirm1j/5103YUwlLmCN5N5xgc4mu1b0NM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 6/7] xen/arm: Tweak the dump page-table walk output
Date: Fri, 12 Aug 2022 20:24:45 +0100
Message-Id: <20220812192448.43016-7-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812192448.43016-1-julien@xen.org>
References: <20220812192448.43016-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently the output is looking like:

(XEN) 1ST[0x1] = 0x000000004015ff7f
(XEN) 2ND[0x1f] = 0x00500000bfe00f7d

The content of the entries are not aligned making a bit trickier to
read (I appreciate this is a matter of taste).

Align the values by forcing the index to be always printed using
3 characters (enough to cover 512 in hexadecimal).

New output:

(XEN) 1ST[0x001] = 0x000000004015ff7f
(XEN) 2ND[0x01f] = 0x00500000bfe00f7d

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b42cddb1b446..c81c706c8b23 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -234,7 +234,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 
         pte = mapping[offsets[level]];
 
-        printk("%s[0x%x] = 0x%"PRIpaddr"\n",
+        printk("%s[0x%03x] = 0x%"PRIpaddr"\n",
                level_strs[level], offsets[level], pte.bits);
 
         if ( level == 3 || !pte.walk.valid || !pte.walk.table )
-- 
2.37.1


