Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C0473D432
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 22:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554882.866377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfp-00059L-DT; Sun, 25 Jun 2023 20:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554882.866377; Sun, 25 Jun 2023 20:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfp-000571-8N; Sun, 25 Jun 2023 20:49:29 +0000
Received: by outflank-mailman (input) for mailman id 554882;
 Sun, 25 Jun 2023 20:49:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDWfn-0004qK-B4
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 20:49:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfn-0003OM-5t; Sun, 25 Jun 2023 20:49:27 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfm-00021M-Tw; Sun, 25 Jun 2023 20:49:27 +0000
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
	bh=s5wm0nqS6ULfC32q998/nCfZN762L79rLlqFVp1Zzow=; b=3rFaz7ovZPFJqdziFudpeKwltt
	yK1oQknZmDQSWUTCxfUks5nR5563d3DSYGRBd9QuHvGZ9SvWBbVSkPQ3vYyH3pnSSIE8RwOb/P/9u
	90k/rQfumuIroJo1j60n5fmEPB5SCNN0A/7Yg0lnGjAjjT7XZBlQmdRWwFDUNIzwRO2A=;
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
Subject: [PATCH 9/9] xen/arm32: vfp: Add missing U for shifted constant
Date: Sun, 25 Jun 2023 21:49:07 +0100
Message-Id: <20230625204907.57291-10-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
References: <20230625204907.57291-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

When enabling UBSAN on arm32, the following splat will be printed:

(XEN) ================================================================================
(XEN) UBSAN: Undefined behaviour in arch/arm/arm32/vfp.c:75:22
(XEN) left shift of 255 by 24 places cannot be represented in type 'int'

This is referring to the shift in FPSID_IMPLEMENTER_MASK. While we could
only add the U to the value shift there, it would be better to be
consistent and also add it for every value shifted.

This should also addressing MISRA Rule 7.2:

    A "u" or "U" suffix shall be applied to all integer constants that
    are represented in an unsigned type

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/include/asm/arm32/vfp.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/vfp.h b/xen/arch/arm/include/asm/arm32/vfp.h
index bade3bc66e1f..2f2e4b24bb40 100644
--- a/xen/arch/arm/include/asm/arm32/vfp.h
+++ b/xen/arch/arm/include/asm/arm32/vfp.h
@@ -1,23 +1,23 @@
 #ifndef _ARM_ARM32_VFP_H
 #define _ARM_ARM32_VFP_H
 
-#define FPEXC_EX                (1u << 31)
-#define FPEXC_EN                (1u << 30)
-#define FPEXC_FP2V              (1u << 28)
+#define FPEXC_EX                (1U << 31)
+#define FPEXC_EN                (1U << 30)
+#define FPEXC_FP2V              (1U << 28)
 
-#define MVFR0_A_SIMD_MASK       (0xf << 0)
+#define MVFR0_A_SIMD_MASK       (0xfU << 0)
 
 
 #define FPSID_IMPLEMENTER_BIT   (24)
-#define FPSID_IMPLEMENTER_MASK  (0xff << FPSID_IMPLEMENTER_BIT)
+#define FPSID_IMPLEMENTER_MASK  (0xffU << FPSID_IMPLEMENTER_BIT)
 #define FPSID_ARCH_BIT          (16)
-#define FPSID_ARCH_MASK         (0xf << FPSID_ARCH_BIT)
+#define FPSID_ARCH_MASK         (0xfU << FPSID_ARCH_BIT)
 #define FPSID_PART_BIT          (8)
-#define FPSID_PART_MASK         (0xff << FPSID_PART_BIT)
+#define FPSID_PART_MASK         (0xffU << FPSID_PART_BIT)
 #define FPSID_VARIANT_BIT       (4)
-#define FPSID_VARIANT_MASK      (0xf << FPSID_VARIANT_BIT)
+#define FPSID_VARIANT_MASK      (0xfU << FPSID_VARIANT_BIT)
 #define FPSID_REV_BIT           (0)
-#define FPSID_REV_MASK          (0xf << FPSID_REV_BIT)
+#define FPSID_REV_MASK          (0xfU << FPSID_REV_BIT)
 
 struct vfp_state
 {
-- 
2.40.1


