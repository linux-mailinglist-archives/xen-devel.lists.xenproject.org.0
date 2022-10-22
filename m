Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A45608DD8
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:04:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428299.678314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG35-0005ic-Pn; Sat, 22 Oct 2022 15:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428299.678314; Sat, 22 Oct 2022 15:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG35-0005gc-Mz; Sat, 22 Oct 2022 15:04:31 +0000
Received: by outflank-mailman (input) for mailman id 428299;
 Sat, 22 Oct 2022 15:04:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omG33-0005bG-Qk
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:04:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG33-0005EU-8k; Sat, 22 Oct 2022 15:04:29 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG33-00023n-0E; Sat, 22 Oct 2022 15:04:29 +0000
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
	bh=8yMgJ3Zo7YUfciDmg8O8H51lri8h2DniSD/vMf2ZgB0=; b=fA5FYHWKEQe3gYp/s4qosX/hwu
	pblmvc47+ckOeyAmI3mxJ1GPfHOcazR4Qtxw1Wvnhn1UuQ0sjjwD6jZHc/atbD6T+Q3Ua+RDi5oZl
	lBtcmIWSZ+LJBPnPXLZvq6q6tbTGP47Uxp809dtDetYsZdrRfmQCeyDwWGppF/PJAy3M=;
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
Subject: [RFC v2 01/12] xen/arm: Clean-up the memory layout
Date: Sat, 22 Oct 2022 16:04:11 +0100
Message-Id: <20221022150422.17707-2-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221022150422.17707-1-julien@xen.org>
References: <20221022150422.17707-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In a follow-up patch, the base address for the common mappings will
vary between arm32 and arm64. To avoid any duplication, define
every mapping in the common region from the previous one.

Take the opportunity to add missing *_SIZE for FIXMAP_VIRT_* and
XEN_VIRT_*.

Take the opportunity to add missing *_SIZE for some mappings.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----
    Changes in v2:
        - Use _AT(vaddr_t, ...) to build on 32-bit.
        - Drop COMMON_VIRT_START
---
 xen/arch/arm/include/asm/config.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0fefed1b8aa9..80d81f127f7e 100644
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
 
-- 
2.37.1


