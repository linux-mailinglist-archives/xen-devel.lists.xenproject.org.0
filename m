Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E8E2FCF1F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 12:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71336.127646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Bdl-0002qG-08; Wed, 20 Jan 2021 11:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71336.127646; Wed, 20 Jan 2021 11:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Bdk-0002pu-TB; Wed, 20 Jan 2021 11:27:08 +0000
Received: by outflank-mailman (input) for mailman id 71336;
 Wed, 20 Jan 2021 11:27:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkA9=GX=arm.com=vladimir.murzin@srs-us1.protection.inumbo.net>)
 id 1l2Bdi-0002pp-KO
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 11:27:06 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 74181906-3f67-489b-8699-8c5538c15a25;
 Wed, 20 Jan 2021 11:27:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666E231B;
 Wed, 20 Jan 2021 03:27:04 -0800 (PST)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.27.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD6F53F719;
 Wed, 20 Jan 2021 03:27:03 -0800 (PST)
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
X-Inumbo-ID: 74181906-3f67-489b-8699-8c5538c15a25
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com
Subject: [XEN PATCH] xen/arm: Relax GIC version check
Date: Wed, 20 Jan 2021 11:26:44 +0000
Message-Id: <20210120112644.8882-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Supported values are

0b0000 GIC CPU interface system registers not implemented.

0b0001 System register interface to versions 3.0 and 4.0 of the GIC
       CPU interface is supported.

0b0011 System register interface to version 4.1 of the GIC CPU
       interface is supported.

4.1 is still backward compatible with 4.0/3.0, moreover ARM ARM
guarantees that future versions of the GIC CPU interface retain
backwards compatible.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 xen/include/asm-arm/cpufeature.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 13a2739a6..c6e5711b2 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -17,7 +17,7 @@
 #define cpu_has_el3_64    (boot_cpu_feature64(el3) >= 1)
 #define cpu_has_fp        (boot_cpu_feature64(fp) < 8)
 #define cpu_has_simd      (boot_cpu_feature64(simd) < 8)
-#define cpu_has_gicv3     (boot_cpu_feature64(gic) == 1)
+#define cpu_has_gicv3     (boot_cpu_feature64(gic) >= 1)
 #endif
 
 #define cpu_feature32(c, feat)         ((c)->pfr32.feat)
-- 
2.24.0


