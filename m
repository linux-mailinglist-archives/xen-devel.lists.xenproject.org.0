Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF2F54854C
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jun 2022 14:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348246.574565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0jZR-000289-7u; Mon, 13 Jun 2022 12:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348246.574565; Mon, 13 Jun 2022 12:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o0jZR-00021k-2z; Mon, 13 Jun 2022 12:53:29 +0000
Received: by outflank-mailman (input) for mailman id 348246;
 Mon, 13 Jun 2022 12:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E7/M=WU=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1o0jZO-0001JY-QZ
 for xen-devel@lists.xenproject.org; Mon, 13 Jun 2022 12:53:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d08b5895-eb17-11ec-8901-93a377f238d6;
 Mon, 13 Jun 2022 14:53:26 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74B1BD6E;
 Mon, 13 Jun 2022 05:53:25 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF3F83F792;
 Mon, 13 Jun 2022 05:53:24 -0700 (PDT)
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
X-Inumbo-ID: d08b5895-eb17-11ec-8901-93a377f238d6
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/4] arm: add ISAR2, MMFR0 and MMFR1 fields in cpufeature
Date: Mon, 13 Jun 2022 13:53:13 +0100
Message-Id: <0d1bce834cc1d9949c9d77acfeb650f2f4c02601.1655124548.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655124548.git.bertrand.marquis@arm.com>
References: <cover.1655124548.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete AA64ISAR2 and AA64MMFR[0-1] with more fields.
While there add a comment for MMFR bitfields as for other registers in
the cpuinfo structure definition.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- fix tgranule_4k_2
- add Stefano r-b
Changes in v2:
- patch introduced to isolate changes in cpufeature.h
- complete MMFR0 and ISAR2 to sync with sysregs.h status
---
 xen/arch/arm/include/asm/cpufeature.h | 28 ++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 24c01d2b9d..c86a2e7f29 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -234,6 +234,7 @@ struct cpuinfo_arm {
     union {
         register_t bits[3];
         struct {
+            /* MMFR0 */
             unsigned long pa_range:4;
             unsigned long asid_bits:4;
             unsigned long bigend:4;
@@ -242,18 +243,31 @@ struct cpuinfo_arm {
             unsigned long tgranule_16K:4;
             unsigned long tgranule_64K:4;
             unsigned long tgranule_4K:4;
-            unsigned long __res0:32;
-
+            unsigned long tgranule_16k_2:4;
+            unsigned long tgranule_64k_2:4;
+            unsigned long tgranule_4k_2:4;
+            unsigned long exs:4;
+            unsigned long __res0:8;
+            unsigned long fgt:4;
+            unsigned long ecv:4;
+
+            /* MMFR1 */
             unsigned long hafdbs:4;
             unsigned long vmid_bits:4;
             unsigned long vh:4;
             unsigned long hpds:4;
             unsigned long lo:4;
             unsigned long pan:4;
-            unsigned long __res1:8;
-            unsigned long __res2:28;
+            unsigned long specsei:4;
+            unsigned long xnx:4;
+            unsigned long twed:4;
+            unsigned long ets:4;
+            unsigned long __res1:4;
+            unsigned long afp:4;
+            unsigned long __res2:12;
             unsigned long ecbhb:4;
 
+            /* MMFR2 */
             unsigned long __res3:64;
         };
     } mm64;
@@ -297,7 +311,11 @@ struct cpuinfo_arm {
             unsigned long __res2:8;
 
             /* ISAR2 */
-            unsigned long __res3:28;
+            unsigned long wfxt:4;
+            unsigned long rpres:4;
+            unsigned long gpa3:4;
+            unsigned long apa3:4;
+            unsigned long __res3:12;
             unsigned long clearbhb:4;
 
             unsigned long __res4:32;
-- 
2.25.1


