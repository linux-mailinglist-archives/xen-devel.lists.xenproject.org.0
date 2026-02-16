Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJDvLsjLkmlfyAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 08:48:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A21415EC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 08:48:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233713.1537074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrtKC-0001U9-92; Mon, 16 Feb 2026 07:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233713.1537074; Mon, 16 Feb 2026 07:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrtKC-0001SS-67; Mon, 16 Feb 2026 07:47:20 +0000
Received: by outflank-mailman (input) for mailman id 1233713;
 Mon, 16 Feb 2026 07:47:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2lT=AU=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vrtKB-0001SM-AZ
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 07:47:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b6824cde-0b0b-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 08:47:16 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32D9F150C;
 Sun, 15 Feb 2026 23:47:09 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.56.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2849A3F632;
 Sun, 15 Feb 2026 23:47:14 -0800 (PST)
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
X-Inumbo-ID: b6824cde-0b0b-11f1-b163-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smccc: Preserve argument types in v1.1 SMC
Date: Mon, 16 Feb 2026 08:47:08 +0100
Message-ID: <0e2ba0af683fa5e53a3d2b4b625703751cf7ce54.1771228001.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 478A21415EC
X-Rspamd-Action: no action

The SMCCC v1.1 inline helper currently forces a1-a4 into
unsigned long and uses in/out constraints for r0-r3. In
contrast, a5-a7 are passed with their original types via
read-only constraints. On arm64 this means a 32-bit signed
value in a1-a4 is converted to a 64-bit unsigned value, while
the same value in a5-a7 keeps its signed 32-bit form. For
example, a negative int in a2 is widened to unsigned long, but
a negative int in a5 is passed as a 32-bit signed value, so the
SMC sees different encodings depending on argument position.

Switch the helper to use typed input registers arg0-arg7
derived from the call arguments (keeping a0 cast to u32) and
separate output registers r0-r3. This preserves argument types
consistently across all positions. Argument evaluation order
is unchanged, so we do not reintroduce the issue fixed in
"e00dc325bd9e" ("xen/arm: smccc-1.1: Handle function result as
parameters").

This also aligns Xen's SMCCC parameter handling with Linux's type-
preserving behavior (same externally visible argument handling,
independent implementation) to avoid surprising differences
between a1-a4 and a5-a7.

Current callers (PSCI, SCMI, platform SMC pass-through, OP-TEE,
and exynos5) pass unsigned values; exynos5 passes an int CPU id
which should always be > 0.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/include/asm/smccc.h | 69 +++++++++++++-------------------
 1 file changed, 27 insertions(+), 42 deletions(-)

diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index 441b3ab65dee..5b30dd57b69d 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -99,87 +99,68 @@ struct arm_smccc_res {
 #define __count_args(...)                               \
     ___count_args(__VA_ARGS__, 7, 6, 5, 4, 3, 2, 1, 0)
 
-#define __constraint_write_0                        \
-    "+r" (r0), "=&r" (r1), "=&r" (r2), "=&r" (r3)
-#define __constraint_write_1                        \
-    "+r" (r0), "+r" (r1), "=&r" (r2), "=&r" (r3)
-#define __constraint_write_2                        \
-    "+r" (r0), "+r" (r1), "+r" (r2), "=&r" (r3)
-#define __constraint_write_3                        \
-    "+r" (r0), "+r" (r1), "+r" (r2), "+r" (r3)
-#define __constraint_write_4    __constraint_write_3
-#define __constraint_write_5    __constraint_write_4
-#define __constraint_write_6    __constraint_write_5
-#define __constraint_write_7    __constraint_write_6
-
-#define __constraint_read_0
-#define __constraint_read_1
-#define __constraint_read_2
-#define __constraint_read_3
-#define __constraint_read_4 "r" (r4)
-#define __constraint_read_5 __constraint_read_4, "r" (r5)
-#define __constraint_read_6 __constraint_read_5, "r" (r6)
-#define __constraint_read_7 __constraint_read_6, "r" (r7)
+#define __constraint_read_0 "r" (arg0)
+#define __constraint_read_1 __constraint_read_0, "r" (arg1)
+#define __constraint_read_2 __constraint_read_1, "r" (arg2)
+#define __constraint_read_3 __constraint_read_2, "r" (arg3)
+#define __constraint_read_4 __constraint_read_3, "r" (arg4)
+#define __constraint_read_5 __constraint_read_4, "r" (arg5)
+#define __constraint_read_6 __constraint_read_5, "r" (arg6)
+#define __constraint_read_7 __constraint_read_6, "r" (arg7)
 
 #define __declare_arg_0(a0, res)                            \
     struct arm_smccc_res    *___res = (res);                \
-    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
-    register unsigned long  r1 ASM_REG(1);                  \
-    register unsigned long  r2 ASM_REG(2);                  \
-    register unsigned long  r3 ASM_REG(3)
+    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0)
 
 #define __declare_arg_1(a0, a1, res)                        \
     typeof(a1) __a1 = (a1);                                 \
     struct arm_smccc_res    *___res = (res);                \
-    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
-    register unsigned long  r1 ASM_REG(1) = __a1;           \
-    register unsigned long  r2 ASM_REG(2);                  \
-    register unsigned long  r3 ASM_REG(3)
+    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
+    register typeof(a1)     arg1 ASM_REG(1) = __a1
 
 #define __declare_arg_2(a0, a1, a2, res)                    \
     typeof(a1) __a1 = (a1);                                 \
     typeof(a2) __a2 = (a2);                                 \
     struct arm_smccc_res    *___res = (res);                \
-    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
-    register unsigned long  r1 ASM_REG(1) = __a1;           \
-    register unsigned long  r2 ASM_REG(2) = __a2;           \
-    register unsigned long  r3 ASM_REG(3)
+    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
+    register typeof(a1)     arg1 ASM_REG(1) = __a1;         \
+    register typeof(a2)     arg2 ASM_REG(2) = __a2
 
 #define __declare_arg_3(a0, a1, a2, a3, res)                \
     typeof(a1) __a1 = (a1);                                 \
     typeof(a2) __a2 = (a2);                                 \
     typeof(a3) __a3 = (a3);                                 \
     struct arm_smccc_res    *___res = (res);                \
-    register unsigned long  r0 ASM_REG(0) = (uint32_t)(a0); \
-    register unsigned long  r1 ASM_REG(1) = __a1;           \
-    register unsigned long  r2 ASM_REG(2) = __a2;           \
-    register unsigned long  r3 ASM_REG(3) = __a3
+    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
+    register typeof(a1)     arg1 ASM_REG(1) = __a1;         \
+    register typeof(a2)     arg2 ASM_REG(2) = __a2;         \
+    register typeof(a3)     arg3 ASM_REG(3) = __a3
 
 #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \
     typeof(a4) __a4 = (a4);                             \
     __declare_arg_3(a0, a1, a2, a3, res);               \
-    register unsigned long r4 ASM_REG(4) = __a4
+    register typeof(a4)     arg4 ASM_REG(4) = __a4
 
 #define __declare_arg_5(a0, a1, a2, a3, a4, a5, res)    \
     typeof(a5) __a5 = (a5);                             \
     __declare_arg_4(a0, a1, a2, a3, a4, res);           \
-    register typeof(a5) r5 ASM_REG(5) = __a5
+    register typeof(a5)     arg5 ASM_REG(5) = __a5
 
 #define __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res)    \
     typeof(a6) __a6 = (a6);                                 \
     __declare_arg_5(a0, a1, a2, a3, a4, a5, res);           \
-    register typeof(a6) r6 ASM_REG(6) = __a6
+    register typeof(a6)     arg6 ASM_REG(6) = __a6
 
 #define __declare_arg_7(a0, a1, a2, a3, a4, a5, a6, a7, res)    \
     typeof(a7) __a7 = (a7);                                     \
     __declare_arg_6(a0, a1, a2, a3, a4, a5, a6, res);           \
-    register typeof(a7) r7 ASM_REG(7) = __a7
+    register typeof(a7)     arg7 ASM_REG(7) = __a7
 
 #define ___declare_args(count, ...) __declare_arg_ ## count(__VA_ARGS__)
 #define __declare_args(count, ...)  ___declare_args(count, __VA_ARGS__)
 
 #define ___constraints(count)                       \
-    : __constraint_write_ ## count                  \
+    : "=r" (r0), "=r" (r1), "=r" (r2), "=r" (r3)     \
     : __constraint_read_ ## count                   \
     : "memory"
 #define __constraints(count)    ___constraints(count)
@@ -204,6 +185,10 @@ struct arm_smccc_res {
  */
 #define arm_smccc_1_1_smc(...)                                  \
     do {                                                        \
+        register unsigned long r0 ASM_REG(0);                   \
+        register unsigned long r1 ASM_REG(1);                   \
+        register unsigned long r2 ASM_REG(2);                   \
+        register unsigned long r3 ASM_REG(3);                   \
         __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
         asm volatile("smc #0\n"                                 \
                      __constraints(__count_args(__VA_ARGS__))); \
-- 
2.52.0


