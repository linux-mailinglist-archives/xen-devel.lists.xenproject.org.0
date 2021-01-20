Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C832FCF20
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 12:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71338.127660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Be8-0002v7-96; Wed, 20 Jan 2021 11:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71338.127660; Wed, 20 Jan 2021 11:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Be8-0002ua-5o; Wed, 20 Jan 2021 11:27:32 +0000
Received: by outflank-mailman (input) for mailman id 71338;
 Wed, 20 Jan 2021 11:27:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkA9=GX=arm.com=vladimir.murzin@srs-us1.protection.inumbo.net>)
 id 1l2Be6-0002uR-WC
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 11:27:31 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0bb9dc44-f386-4ef3-be8d-e2e78f001f5e;
 Wed, 20 Jan 2021 11:27:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9322F31B;
 Wed, 20 Jan 2021 03:27:29 -0800 (PST)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.27.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAEB83F719;
 Wed, 20 Jan 2021 03:27:28 -0800 (PST)
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
X-Inumbo-ID: 0bb9dc44-f386-4ef3-be8d-e2e78f001f5e
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com
Subject: [XEN PATCH] xen/arm: Hide Pointer Authentication (PAC)
Date: Wed, 20 Jan 2021 11:27:12 +0000
Message-Id: <20210120112712.9534-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ARMv8.3 Pointer Authentication extension is not supported by Xen
at the moment, so do not expose that via ID register.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/cpufeature.c        |  6 +++++
 xen/include/asm-arm/cpufeature.h | 38 +++++++++++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 99fe4db28..1d8878380 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -187,6 +187,12 @@ static int __init create_guest_cpuinfo(void)
 
     /* Hide MTE support as Xen does not support it */
     guest_cpuinfo.pfr64.mte = 0;
+
+    /* Hide PAC support as Xen does not support it */
+    guest_cpuinfo.isa64.apa = 0;
+    guest_cpuinfo.isa64.api = 0;
+    guest_cpuinfo.isa64.gpa = 0;
+    guest_cpuinfo.isa64.gpi = 0;
 #endif
 
     /* Hide AMU support */
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index c6e5711b2..43135abef 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -212,8 +212,44 @@ struct cpuinfo_arm {
         };
     } mm64;
 
-    struct {
+    union {
         uint64_t bits[2];
+        struct {
+            /* ISAR0 */
+            unsigned long __res0:4;
+            unsigned long aes:4;
+            unsigned long sha1:4;
+            unsigned long sha2:4;
+            unsigned long crc32:4;
+            unsigned long atomic:4;
+            unsigned long __res1:4;
+            unsigned long rdm:4;
+            unsigned long sha3:4;
+            unsigned long sm3:4;
+            unsigned long sm4:4;
+            unsigned long dp:4;
+            unsigned long fhm:4;
+            unsigned long ts:4;
+            unsigned long tlb:4;
+            unsigned long rndr:4;
+
+            /* ISAR1 */
+            unsigned long dpb:4;
+            unsigned long apa:4;
+            unsigned long api:4;
+            unsigned long jscvt:4;
+            unsigned long fcma:4;
+            unsigned long lrcpc:4;
+            unsigned long gpa:4;
+            unsigned long gpi:4;
+            unsigned long frintts:4;
+            unsigned long sb:4;
+            unsigned long specres:4;
+            unsigned long bf16:4;
+            unsigned long dgh:4;
+            unsigned long i8mm:4;
+            unsigned long __res0:8;
+        };
     } isa64;
 
     struct {
-- 
2.24.0


