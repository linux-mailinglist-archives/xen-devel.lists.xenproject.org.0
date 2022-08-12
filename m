Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD0B5915E9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385855.621642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHP-0000X8-8K; Fri, 12 Aug 2022 19:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385855.621642; Fri, 12 Aug 2022 19:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHP-0000VX-30; Fri, 12 Aug 2022 19:25:11 +0000
Received: by outflank-mailman (input) for mailman id 385855;
 Fri, 12 Aug 2022 19:25:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaHN-0000FX-4o
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:25:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHM-0000xY-SH; Fri, 12 Aug 2022 19:25:08 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHM-0006n6-Js; Fri, 12 Aug 2022 19:25:08 +0000
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
	bh=1G2Qt2AMX5j11jO0S4LFhw33Cq6gRJqjfValRIvJxXM=; b=wG7b+kJxPPFG3besl9gWU5of8e
	C7nM6s3pbhEZDBdgS9KDNWWChZVzaYR74kPR/yg6YpR8XR+7tSIszLd7l5cG+YPywhg3qLBj4HuC3
	GF+2LuvmVa29mkcrbf53zQ5V/vVzdsqoR3Cee/qRnf6TJX4z0oPfDuQBugPX+Gd1hzuM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/7] xen/arm64: head: Don't set x22 and update the documentation
Date: Fri, 12 Aug 2022 20:24:40 +0100
Message-Id: <20220812192448.43016-2-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812192448.43016-1-julien@xen.org>
References: <20220812192448.43016-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Since commit 7e14a47e7c73 ("xen/arm64: head Rework and document
launch()"), the boot code is setting x22 but not read it.

So remove the two instructions setting x22 and update the documentation
to show x22 has no specific purpose.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm64/head.S | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 1babcc65d7c9..26cc7705f556 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -71,7 +71,7 @@
  *  x19 - paddr(start)
  *  x20 - phys offset
  *  x21 - DTB address (boot cpu only)
- *  x22 - is_secondary_cpu
+ *  x22 -
  *  x23 - UART address
  *  x24 -
  *  x25 -
@@ -305,8 +305,6 @@ real_start_efi:
 #endif
         PRINT("- Boot CPU booting -\r\n")
 
-        mov   x22, #0                /* x22 := is_secondary_cpu */
-
         bl    check_cpu_mode
         bl    cpu_init
         bl    create_page_tables
@@ -345,8 +343,6 @@ GLOBAL(init_secondary)
         adr   x19, start             /* x19 := paddr (start) */
         sub   x20, x19, x0           /* x20 := phys-offset */
 
-        mov   x22, #1                /* x22 := is_secondary_cpu */
-
         mrs   x0, mpidr_el1
         ldr   x13, =(~MPIDR_HWID_MASK)
         bic   x24, x0, x13           /* Mask out flags to get CPU ID */
-- 
2.37.1


