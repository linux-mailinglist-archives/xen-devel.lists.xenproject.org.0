Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C6F4D2DDB
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 12:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287730.487878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNo-0007GF-0v; Wed, 09 Mar 2022 11:21:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287730.487878; Wed, 09 Mar 2022 11:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRuNn-0007CS-Sj; Wed, 09 Mar 2022 11:21:31 +0000
Received: by outflank-mailman (input) for mailman id 287730;
 Wed, 09 Mar 2022 11:21:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nRuNm-0007AU-VH
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 11:21:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNm-0002kI-Eh; Wed, 09 Mar 2022 11:21:30 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nRuNm-0004wn-6U; Wed, 09 Mar 2022 11:21:30 +0000
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
	bh=8Ia0Jnbi/QUOonrg8XOxt2CtfmBWEI2enlPU5FZKhQo=; b=gCBf5W05J34Vo7gLWv0PbgzeQK
	35rH3yeNxuOHfEYgvJbciWMHAF2nflPFQcLZZ0LJEn7XQ2+tJjqMfTuKaD4WvQ0NPxoGO6maIxq5H
	C3wUowuue0jN9Iou6WPDyJA5UJ5+lHfuCTnhUpjvSfLSbLaB8iRs0GsQV2L3rj5t36SA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH early-RFC 1/5] xen/arm: Clean-up the memory layout
Date: Wed,  9 Mar 2022 11:20:44 +0000
Message-Id: <20220309112048.17377-2-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220309112048.17377-1-julien@xen.org>
References: <20220309112048.17377-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In a follow-up patch, the base address for the common mappings will
vary between arm32 and arm64. To avoid any duplication, define
every mapping in the common region from the previous one.

Take the opportunity to add mising *_SIZE for some mappings.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

After the next patch, the term "common" will sound strange because
the base address is different. Any better suggestion?
---
 xen/arch/arm/include/asm/config.h | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index aedb586c8d27..5db28a8dbd56 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -107,16 +107,26 @@
  *  Unused
  */
 
-#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
-#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
+#define COMMON_VIRT_START       _AT(vaddr_t, 0)
 
-#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
-#define BOOT_FDT_SLOT_SIZE     MB(4)
-#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
+#define XEN_VIRT_START          (COMMON_VIRT_START + MB(2))
+#define XEN_SLOT_SIZE           MB(2)
+#define XEN_VIRT_END            (XEN_VIRT_START + XEN_SLOT_SIZE)
+
+#define FIXMAP_VIRT_START       XEN_VIRT_END
+#define FIXMAP_SLOT_SIZE        MB(2)
+#define FIXMAP_VIRT_END         (FIXMAP_VIRT_START + FIXMAP_SLOT_SIZE)
+
+#define FIXMAP_ADDR(n)          (FIXMAP_VIRT_START + (n) * PAGE_SIZE)
+
+#define BOOT_FDT_VIRT_START     FIXMAP_VIRT_END
+#define BOOT_FDT_SLOT_SIZE      MB(4)
+#define BOOT_FDT_VIRT_END       (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE)
 
 #ifdef CONFIG_LIVEPATCH
-#define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
-#define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + MB(2))
+#define LIVEPATCH_VMAP_START   BOOT_FDT_VIRT_END
+#define LIVEPATCH_SLOT_SIZE    MB(2)
+#define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + LIVEPATCH_SLOT_SIZE)
 #endif
 
 #define HYPERVISOR_VIRT_START  XEN_VIRT_START
-- 
2.32.0


