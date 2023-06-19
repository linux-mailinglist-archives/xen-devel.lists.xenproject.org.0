Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB2735C9B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 19:01:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551243.860693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIFn-0003h8-TT; Mon, 19 Jun 2023 17:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551243.860693; Mon, 19 Jun 2023 17:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIFn-0003fD-Pf; Mon, 19 Jun 2023 17:01:23 +0000
Received: by outflank-mailman (input) for mailman id 551243;
 Mon, 19 Jun 2023 17:01:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBIFl-0003PJ-SG
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 17:01:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBIFl-0002e8-I0; Mon, 19 Jun 2023 17:01:21 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBIFl-00079R-AP; Mon, 19 Jun 2023 17:01:21 +0000
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
	bh=XCDJIqgFhmZ0JxJIz/CX3QdAY7V9+R7dcjMnAbPAVAE=; b=b7G86f2/m0YHDlxFFdfMktxZJS
	FuYmVBB/wK3s2CWthe5OwcpPFpnf6QsPtkDVNK5eW7hAjBWdSCsMq6Tpt/6tLCKvbGYW8eKB2rB1D
	2ivqbwODXI6tEjaLVcaRFhYXb//cySMhPkad7kRm3RFV8TX2sUd+U0GrOHqYw8bJKg/o=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/7] xen/arm32: head: Add mising isb in switch_to_runtime_mapping()
Date: Mon, 19 Jun 2023 18:01:10 +0100
Message-Id: <20230619170115.81398-3-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619170115.81398-1-julien@xen.org>
References: <20230619170115.81398-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Per the Arm Arm (ARM DDI 0406C.d A3.8.3):

"The DMB and DSB memory barriers affect reads and writes to the memory
system generated by load/store instructions and data or unified cache
maintenance operations being executed by the processor. Instruction
fetches or accesses caused by a hardware translation table access are
not explicit accesses."

The function switch_to_runtime_mapping() is responsible to map the
Xen at its runtime address if we were using the temporary area before
jumping returning using a runtime address. So we need to ensure the
'dsb' has completed before continuing. Therefore add an 'isb'.

Fixes: fbd9b5fb4c26 ("xen/arm32: head: Remove restriction where to load Xen")
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 6ca3329138e3..b942e7e54d08 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -656,6 +656,11 @@ switch_to_runtime_mapping:
 
         /* Ensure any page table updates are visible before continuing */
         dsb   nsh
+        /*
+         * The function will return on the runtime mapping. So we want
+         * to prevent instruction fetch before the dsb completes.
+         */
+        isb
 
 ready_to_switch:
         mov   pc, lr
-- 
2.40.1


