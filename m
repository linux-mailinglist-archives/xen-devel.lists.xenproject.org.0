Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3404649B7C
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:55:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459258.716996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fX4-0004IZ-Nz; Mon, 12 Dec 2022 09:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459258.716996; Mon, 12 Dec 2022 09:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fX4-0004Em-Et; Mon, 12 Dec 2022 09:55:34 +0000
Received: by outflank-mailman (input) for mailman id 459258;
 Mon, 12 Dec 2022 09:55:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fX2-0003pM-IE
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:55:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fX2-0001SX-CK; Mon, 12 Dec 2022 09:55:32 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fX2-0001lz-4x; Mon, 12 Dec 2022 09:55:32 +0000
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
	bh=4gf7OGmCVTPIad+5gHH9EbUJ/Y2Mpf2evxa74D/Bu6g=; b=vKmbKzPt6HLBrhHXL56pzDRdO7
	02rW7Wm0ZQxyS+V8WoSvH8sylIwt/iUR2xk3jH731iLkNrjEORwfLQbKKGb52Fp0CmA1oLQd+fuo2
	lyrIXPq8h7pTuB25cDL9UZJqcKZFYmCxr3N4a3K34tr1Q800MK85iP6v1EE2PnkRHfyI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 05/18] xen/arm: Clean-up the memory layout
Date: Mon, 12 Dec 2022 09:55:10 +0000
Message-Id: <20221212095523.52683-6-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In a follow-up patch, the base address for the common mappings will
vary between arm32 and arm64. To avoid any duplication, define
every mapping in the common region from the previous one.

Take the opportunity to:
    * add missing *_SIZE for FIXMAP_VIRT_* and XEN_VIRT_*
    * switch to MB()/GB() to be avoid hexadecimal (easier to read)

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - Switch more macros to use MB()/GB()
        - Remove duplicated sentence in the commit message

    Changes in v2:
        - Use _AT(vaddr_t, ...) to build on 32-bit.
        - Drop COMMON_VIRT_START
---
 xen/arch/arm/include/asm/config.h | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0fefed1b8aa9..87851e677701 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -107,14 +107,19 @@
  *  Unused
  */
 
-#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
-#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
+#define XEN_VIRT_START          _AT(vaddr_t, MB(2))
+#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
 
-#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
-#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
+#define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
+#define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
+
+#define FIXMAP_ADDR(n)          (FIXMAP_VIRT_START + (n) * PAGE_SIZE)
+
+#define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
+#define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
 
 #ifdef CONFIG_LIVEPATCH
-#define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
+#define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
 #define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
 #endif
 
@@ -124,18 +129,18 @@
 
 #define CONFIG_SEPARATE_XENHEAP 1
 
-#define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
+#define FRAMETABLE_VIRT_START  _AT(vaddr_t, MB(32))
 #define FRAMETABLE_SIZE        MB(128-32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 #define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
 
-#define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
+#define VMAP_VIRT_START        _AT(vaddr_t, MB(256))
 #define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
 
-#define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
+#define XENHEAP_VIRT_START     _AT(vaddr_t, GB(1))
 #define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
 
-#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
+#define DOMHEAP_VIRT_START     _AT(vaddr_t, GB(2))
 #define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
 
 #define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
-- 
2.38.1


