Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3763A2B9B1D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 20:08:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31362.61695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHh-0005Xa-Vs; Thu, 19 Nov 2020 19:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31362.61695; Thu, 19 Nov 2020 19:07:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHh-0005XB-SG; Thu, 19 Nov 2020 19:07:57 +0000
Received: by outflank-mailman (input) for mailman id 31362;
 Thu, 19 Nov 2020 19:07:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfpHg-0005X0-36
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHf-0003Sd-Hx; Thu, 19 Nov 2020 19:07:55 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHf-0000TE-7B; Thu, 19 Nov 2020 19:07:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHg-0005X0-36
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=n+a9yOVUI+xS4AJamh0RTQNrcJQmW3VHc9oZb3bl7Og=; b=obXqYpSTe3KR4qspumZnA7LdO
	XskxTBDOrMLk8fcuIB3bI/01mQ7lrNeckM5L35jFgoBYHQyNC4w+kXXPFR7Qg/oLuXAxdsFNGIYMN
	L5Eafa5pMWhEBkU7tP2bA73RmECaelgz8BthzRWpcc52VXS769fL+gz1+eRKXeIqRm05A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHf-0003Sd-Hx; Thu, 19 Nov 2020 19:07:55 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHf-0000TE-7B; Thu, 19 Nov 2020 19:07:55 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH RFC 1/6] xen/arm: mm: Remove special case for CPU0 in dump_hyp_walk()
Date: Thu, 19 Nov 2020 19:07:46 +0000
Message-Id: <20201119190751.22345-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119190751.22345-1-julien@xen.org>
References: <20201119190751.22345-1-julien@xen.org>

From: Stefano Stabellini <sstabellini@kernel.org>

There is no need to have a special case for CPU0 when converting the
page-table virtual address into a physical address. The helper
virt_to_maddr() is able to translate any address as long as the root
page-tables is mapped in the virtual address. This is the case for all
the CPUs at the moment.

So use the same BUG_ON() regardless the CPU.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
[julien: Rework the commit message]
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

I went back through the conversation in [1] regarding the issue when
loading Xen below 2MB on Arm32. The example provided is wrong because to
find the physical address, we need to add 'phys_offset', not substract.

So I removed the comment regarding the code was buggy.

[1] https://marc.info/?l=xen-devel&m=157081398022401
---
 xen/arch/arm/mm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 9c4b26bf079b..4dd886f7c80d 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -284,10 +284,7 @@ void dump_hyp_walk(vaddr_t addr)
            "on CPU%d via TTBR 0x%016"PRIx64"\n",
            addr, smp_processor_id(), ttbr);
 
-    if ( smp_processor_id() == 0 )
-        BUG_ON( (lpae_t *)(unsigned long)(ttbr - phys_offset) != pgtable );
-    else
-        BUG_ON( virt_to_maddr(pgtable) != ttbr );
+    BUG_ON( virt_to_maddr(pgtable) != ttbr );
     dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
 }
 
-- 
2.17.1


