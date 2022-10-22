Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DA7608DD2
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:04:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428306.678392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG3G-0007oh-2X; Sat, 22 Oct 2022 15:04:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428306.678392; Sat, 22 Oct 2022 15:04:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG3F-0007kr-RC; Sat, 22 Oct 2022 15:04:41 +0000
Received: by outflank-mailman (input) for mailman id 428306;
 Sat, 22 Oct 2022 15:04:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omG3D-0007LY-2Q
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:04:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG3C-0005Gl-SC; Sat, 22 Oct 2022 15:04:38 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG3C-00023n-JX; Sat, 22 Oct 2022 15:04:38 +0000
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
	bh=FEIsx7P9nZwfhR6xy4wYJJIBI7buDF20ZIDRCCQ1MYk=; b=EatH+9nm1S1uIelLBdQIeXVRJ4
	f7zaA7/xk+M+MQOR98qi1v9Byaqm9xw9K6k9LO6I9xEo6tKATcjm72OvAattDy2JmT5O8L2hBxhuO
	03Ik17exSeiPixty5vcnvXHtjceMVANEz/C8/XUsokoQJpR2K+ylKzUyTq/3ROnoaXzQ=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	carlo.nonato@minervasys.tech,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC v2 08/12] xen/arm: mm: Allow xen_pt_update() to work with the current root table
Date: Sat, 22 Oct 2022 16:04:18 +0100
Message-Id: <20221022150422.17707-9-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221022150422.17707-1-julien@xen.org>
References: <20221022150422.17707-1-julien@xen.org>
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
----

    Changes in v2:
        - Patch added
---
 xen/arch/arm/mm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 2c6648a0dfe5..a3f604e0e2d1 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1123,7 +1123,7 @@ static int xen_pt_update(unsigned long virt,
      *
      * XXX: Add a check.
      */
-    const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
+    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
 
     /*
      * The hardware was configured to forbid mapping both writeable and
-- 
2.37.1


