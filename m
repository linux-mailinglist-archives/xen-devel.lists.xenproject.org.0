Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1DB4C66D8
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280285.478170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcvT-0001bC-NX; Mon, 28 Feb 2022 10:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280285.478170; Mon, 28 Feb 2022 10:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcvT-0001Z7-Jt; Mon, 28 Feb 2022 10:06:43 +0000
Received: by outflank-mailman (input) for mailman id 280285;
 Mon, 28 Feb 2022 10:06:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOcvS-0001Z1-Q9
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:06:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcvS-0002LP-Dg; Mon, 28 Feb 2022 10:06:42 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcvS-0004TQ-5G; Mon, 28 Feb 2022 10:06:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=ExgHnlTeJ0I/J1Q7pQ+FQvgN5arq/5SIe441Bm1jT0E=; b=C/dGZp
	IlC30IWEKTp00K7OI3y+Oy2uSQcmhvMHfZicrIBwhzGEIcs2ZkHmGpuSTZWZ8lrBJg8/BDpVHva2h
	paM9lNTH5IPMCbo/bmuFrbBXxJYyiUxCOTn9gRh6MtTPyx9GZlWS01FtYGx2JoWc7/cUpn76jTrxa
	kTA7L3u3mSI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH] xen/arm: Remove unused BOOT_RELOC_VIRT_START
Date: Mon, 28 Feb 2022 10:06:33 +0000
Message-Id: <20220228100633.57593-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <julien.grall@arm.com>

We stopped relocating Xen since commit f60658c6ae "xen/arm: Stop
relocating Xen".

At the same time, update the memory layout description.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/include/asm/config.h | 4 +---
 xen/arch/arm/mm.c                 | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 2aced0bc3b8b..b25c9d39bb32 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -77,8 +77,7 @@
  *   2M -   4M   Xen text, data, bss
  *   4M -   6M   Fixmap: special-purpose 4K mapping slots
  *   6M -  10M   Early boot mapping of FDT
- *   10M - 12M   Early relocation address (used when relocating Xen)
- *               and later for livepatch vmap (if compiled in)
+ *   10M - 12M   Livepatch vmap (if compiled in)
  *
  * ARM32 layout:
  *   0  -  12M   <COMMON>
@@ -115,7 +114,6 @@
 #define BOOT_FDT_SLOT_SIZE     MB(4)
 #define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
 
-#define BOOT_RELOC_VIRT_START  _AT(vaddr_t,0x00a00000)
 #ifdef CONFIG_LIVEPATCH
 #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
 #define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + MB(2))
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 515d0906f85b..8a17222109c6 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -196,7 +196,6 @@ static void __init __maybe_unused build_assertions(void)
     /* 2MB aligned regions */
     BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
     BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
-    BUILD_BUG_ON(BOOT_RELOC_VIRT_START & ~SECOND_MASK);
     /* 1GB aligned regions */
 #ifdef CONFIG_ARM_32
     BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
-- 
2.32.0


