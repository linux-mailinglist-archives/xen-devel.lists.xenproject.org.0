Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA71559626
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355323.582941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fM3-00043W-17; Fri, 24 Jun 2022 09:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355323.582941; Fri, 24 Jun 2022 09:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fM2-0003zE-TT; Fri, 24 Jun 2022 09:11:54 +0000
Received: by outflank-mailman (input) for mailman id 355323;
 Fri, 24 Jun 2022 09:11:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4fM1-0003Vs-6F
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:11:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fM1-0001zW-07; Fri, 24 Jun 2022 09:11:53 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fM0-0005kh-N8; Fri, 24 Jun 2022 09:11:52 +0000
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
	bh=5cwlf6hvockFhfMMpDgaqjNm0NVrUCzxPEvGvIkErrk=; b=qD5hsIL3+3Q8RH29wjU5tztmx4
	nPtgf6Ftf7Z1SOZAeRXIKfGVVpFUp9DKfYibEjkYWf+79LMfjJtQ9Nf3UTHBzEbEh3J8yiw4P7cTc
	OopuQxZHb4XEAetLy7ctzX2XFZU5YNgIu7sN2bu181R6JCSmpeUHH57MJFdDi6RzpcCY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/7] xen/arm: head: Add missing isb after writing to SCTLR_EL2/HSCTLR
Date: Fri, 24 Jun 2022 10:11:42 +0100
Message-Id: <20220624091146.35716-4-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220624091146.35716-1-julien@xen.org>
References: <20220624091146.35716-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Write to SCTLR_EL2/HSCTLR may not be visible until the next context
synchronization. When initializing the CPU, we want the update to take
effect right now. So add an isb afterwards.

Spec references:
    - AArch64: D13.1.2 ARM DDI 0406C.d
    - AArch32 v8: G8.1.2 ARM DDI 0406C.d
    - AArch32 v7: B5.6.3 ARM DDI 0406C.d

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 1 +
 xen/arch/arm/arm64/head.S | 1 +
 2 files changed, 2 insertions(+)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 77f0a619ca51..98ccf18b51f1 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -353,6 +353,7 @@ cpu_init_done:
 
         ldr   r0, =HSCTLR_SET
         mcr   CP32(r0, HSCTLR)
+        isb
 
         mov   pc, r5                        /* Return address is in r5 */
 ENDPROC(cpu_init)
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 109ae7de0c2b..1babcc65d7c9 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -486,6 +486,7 @@ cpu_init:
 
         ldr   x0, =SCTLR_EL2_SET
         msr   SCTLR_EL2, x0
+        isb
 
         /*
          * Ensure that any exceptions encountered at EL2
-- 
2.32.0


