Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08757649BE3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:17:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459399.717173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsU-0007SD-2P; Mon, 12 Dec 2022 10:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459399.717173; Mon, 12 Dec 2022 10:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsT-0007IY-IY; Mon, 12 Dec 2022 10:17:41 +0000
Received: by outflank-mailman (input) for mailman id 459399;
 Mon, 12 Dec 2022 10:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fsP-0006gK-UC
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 10:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fsP-0002CV-KU; Mon, 12 Dec 2022 10:17:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fXB-0001lz-MG; Mon, 12 Dec 2022 09:55:41 +0000
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
	bh=iH0hivAOAHYKAAK+viCKrsGKgjbCA1MMf5n4IXDupUY=; b=iuJyNgimqXnNLncs9wZGnNFTrB
	iXD8RUcjTvxR/neHJ3KFjbpgQFVQ3Hc227MMrLAJd89S/8qc0iMwEOapQWbnsZcn6Oy50skK5Q3Zd
	eCdiOUH4KB585H5YLHzbIEJmJ6uPsIowoYqKIxB7nCxTC9gQthJED+YOhFgaobPMNDxw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 13/18] xen/arm: mm: Allow xen_pt_update() to work with the current root table
Date: Mon, 12 Dec 2022 09:55:18 +0000
Message-Id: <20221212095523.52683-14-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, xen_pt_update() will only work on the runtime page tables.
In follow-up patches, we will also want to use the helper to update
the boot page tables.

All the existing callers of xen_pt_update() expects to modify the
current page-tables. Therefore, we can read the root physical address
directly from TTBR0_EL2.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---

    Changes in v2:
        - Patch added
---
 xen/arch/arm/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index cc11f5c639e6..26d6b70410c5 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1114,7 +1114,7 @@ static int xen_pt_update(unsigned long virt,
      *
      * XXX: Add a check.
      */
-    const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
+    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
 
     /*
      * The hardware was configured to forbid mapping both writeable and
-- 
2.38.1


