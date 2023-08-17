Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4682780013
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 23:44:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585637.916815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWkmp-0008FA-At; Thu, 17 Aug 2023 21:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585637.916815; Thu, 17 Aug 2023 21:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWkmp-00087S-67; Thu, 17 Aug 2023 21:44:11 +0000
Received: by outflank-mailman (input) for mailman id 585637;
 Thu, 17 Aug 2023 21:44:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWkmo-0007wy-8n
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 21:44:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWkmo-0001Kn-0d; Thu, 17 Aug 2023 21:44:10 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWkmn-0002Ab-PI; Thu, 17 Aug 2023 21:44:09 +0000
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
	bh=+HktoAPJl+g/kSxPYwPyXQAcUUkLIppr+tW9RDnrz7w=; b=Lz29J5VJzuf2FD1iFxADa2ecDH
	pK5D9eZwpml1cfAhoAl0tK16++5rwyeVWmZcfWht/G3db2mPfTGyh3Bksoe+6WOl2BtdaZjLsbHuN
	qA5b+OG9OI3xm4nMfICZllZ6167TF7QaUl7tspNr/LuI6ra5AGGwtzIb+Od/cSRZ0ymo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be unsigned
Date: Thu, 17 Aug 2023 22:43:56 +0100
Message-Id: <20230817214356.47174-4-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230817214356.47174-1-julien@xen.org>
References: <20230817214356.47174-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The defines PSR_* are field in registers and always unsigned. So
add 'U' to clarify.

This should help with MISRA Rule 7.2.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/include/public/arch-arm.h | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index c6449893e493..492819ad22c9 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -339,36 +339,36 @@ typedef uint64_t xen_callback_t;
 
 /* PSR bits (CPSR, SPSR) */
 
-#define PSR_THUMB       (1<<5)        /* Thumb Mode enable */
-#define PSR_FIQ_MASK    (1<<6)        /* Fast Interrupt mask */
-#define PSR_IRQ_MASK    (1<<7)        /* Interrupt mask */
-#define PSR_ABT_MASK    (1<<8)        /* Asynchronous Abort mask */
-#define PSR_BIG_ENDIAN  (1<<9)        /* arm32: Big Endian Mode */
-#define PSR_DBG_MASK    (1<<9)        /* arm64: Debug Exception mask */
-#define PSR_IT_MASK     (0x0600fc00)  /* Thumb If-Then Mask */
-#define PSR_JAZELLE     (1<<24)       /* Jazelle Mode */
-#define PSR_Z           (1<<30)       /* Zero condition flag */
+#define PSR_THUMB       (1U <<5)      /* Thumb Mode enable */
+#define PSR_FIQ_MASK    (1U <<6)      /* Fast Interrupt mask */
+#define PSR_IRQ_MASK    (1U <<7)      /* Interrupt mask */
+#define PSR_ABT_MASK    (1U <<8)      /* Asynchronous Abort mask */
+#define PSR_BIG_ENDIAN  (1U << 9)     /* arm32: Big Endian Mode */
+#define PSR_DBG_MASK    (1U << 9)     /* arm64: Debug Exception mask */
+#define PSR_IT_MASK     (0x0600fc00U) /* Thumb If-Then Mask */
+#define PSR_JAZELLE     (1U << 24)    /* Jazelle Mode */
+#define PSR_Z           (1U << 30)    /* Zero condition flag */
 
 /* 32 bit modes */
-#define PSR_MODE_USR 0x10
-#define PSR_MODE_FIQ 0x11
-#define PSR_MODE_IRQ 0x12
-#define PSR_MODE_SVC 0x13
-#define PSR_MODE_MON 0x16
-#define PSR_MODE_ABT 0x17
-#define PSR_MODE_HYP 0x1a
-#define PSR_MODE_UND 0x1b
-#define PSR_MODE_SYS 0x1f
+#define PSR_MODE_USR 0x10U
+#define PSR_MODE_FIQ 0x11U
+#define PSR_MODE_IRQ 0x12U
+#define PSR_MODE_SVC 0x13U
+#define PSR_MODE_MON 0x16U
+#define PSR_MODE_ABT 0x17U
+#define PSR_MODE_HYP 0x1aU
+#define PSR_MODE_UND 0x1bU
+#define PSR_MODE_SYS 0x1fU
 
 /* 64 bit modes */
-#define PSR_MODE_BIT  0x10 /* Set iff AArch32 */
-#define PSR_MODE_EL3h 0x0d
-#define PSR_MODE_EL3t 0x0c
-#define PSR_MODE_EL2h 0x09
-#define PSR_MODE_EL2t 0x08
-#define PSR_MODE_EL1h 0x05
-#define PSR_MODE_EL1t 0x04
-#define PSR_MODE_EL0t 0x00
+#define PSR_MODE_BIT  0x10U /* Set iff AArch32 */
+#define PSR_MODE_EL3h 0x0dU
+#define PSR_MODE_EL3t 0x0cU
+#define PSR_MODE_EL2h 0x09U
+#define PSR_MODE_EL2t 0x08U
+#define PSR_MODE_EL1h 0x05U
+#define PSR_MODE_EL1t 0x04U
+#define PSR_MODE_EL0t 0x00U
 
 /*
  * We set PSR_Z to be able to boot Linux kernel versions with an invalid
-- 
2.40.1


