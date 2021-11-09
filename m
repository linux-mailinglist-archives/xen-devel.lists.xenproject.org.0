Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C80844B738
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 23:30:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224119.387216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZck-0007ct-Su; Tue, 09 Nov 2021 22:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224119.387216; Tue, 09 Nov 2021 22:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkZck-0007aX-Ps; Tue, 09 Nov 2021 22:29:50 +0000
Received: by outflank-mailman (input) for mailman id 224119;
 Tue, 09 Nov 2021 22:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkZck-0007aR-1N
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 22:29:50 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c05ef76-41ac-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 23:29:49 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56F8E61350;
 Tue,  9 Nov 2021 22:29:47 +0000 (UTC)
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
X-Inumbo-ID: 8c05ef76-41ac-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636496987;
	bh=jTrFMT32oeuFuyU/oz37Gb9wFdhHqLJJ0eQezkEDzgc=;
	h=From:To:Cc:Subject:Date:From;
	b=NYEMN6dKPwRUFEGRddqhBH0h6q4QzGZ5puL5/TPTYvRQmSPx6JfdhCBgc73hAPA1B
	 2D+De3Aia2rKl5+JzPJoUXr9Puxnz4Iae46wYuYz3wSrxbR/aSwyMFH2U8X5iogI9y
	 SBXKV0iceys8bKkgjM+8zAnOZRLWV0BWMFa9x3dIipWwMmVEKxB5f6uFMw8ufSiVLF
	 mtCJliGOT1+xYxzwbXV3+VxCg8d9IiddmVud9oMzvY3HoxsP9MdzZBhGvoWe+Mcukx
	 /19T4/aLdq4A00339jzeg6PKyWMetiz9HTtOBaIBDfvtOMkIYTdD3Gm8QjKanAr+2N
	 Mz6Mx1oN/CNog==
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	oleksandr_tyshchenko@epam.com,
	iwj@xenproject.org,
	Bertrand.Marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH for-4.16] xen/arm: allocate_bank_memory: don't create memory banks of size zero
Date: Tue,  9 Nov 2021 14:29:44 -0800
Message-Id: <20211109222944.531368-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

allocate_bank_memory can be called with a tot_size of zero. In that
case, don't create an empty memory bank, just return immediately without
error. Otherwise a zero-sized memory bank will be added to the domain
device tree.

Fixes: f2931b4233ec "xen/arm: introduce allocate_memory"
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/domain_build.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9e92b640cd..578ea80e40 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -395,6 +395,9 @@ static bool __init allocate_bank_memory(struct domain *d,
     struct membank *bank;
     unsigned int max_order = ~0;
 
+    if ( tot_size == 0 )
+        return true;
+
     bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
     bank->start = gfn_to_gaddr(sgfn);
     bank->size = tot_size;
-- 
2.25.1


