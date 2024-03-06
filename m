Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7781873CB8
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 17:57:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689398.1074315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuZF-00029N-4X; Wed, 06 Mar 2024 16:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689398.1074315; Wed, 06 Mar 2024 16:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhuZF-000270-1J; Wed, 06 Mar 2024 16:56:33 +0000
Received: by outflank-mailman (input) for mailman id 689398;
 Wed, 06 Mar 2024 16:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+FG1=KM=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rhuZD-00026u-T4
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 16:56:31 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79c8b058-dbda-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 17:56:29 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33e383546c1so685092f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Mar 2024 08:56:28 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d5052000000b0033cf4e47496sm17950600wrt.51.2024.03.06.08.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 08:56:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 6A5BE5F88A;
 Wed,  6 Mar 2024 16:56:27 +0000 (GMT)
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
X-Inumbo-ID: 79c8b058-dbda-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709744188; x=1710348988; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QmO7ZZgYnvYeyC1/GW84LLWQW1EeC1P4rBQfQjcRcV0=;
        b=X/P4l1CRXDlRIZ1UamXH21t+KIBwZwWrR+2qGRR7D/0QXKUAZb/eHy5M3WIZrVE4Xg
         8F3L3ko5drtk5EqMG03VMaVK5um9gmP/t0bU5TmX40qmMkgdJ/OlZ/U7xmKTw0ImO5rL
         4XFJVKSijvz1Gnw8+oRz7FB+vJQh9YO3R9jWFI2AhPQdgfTyFwok/JRpz75BIZYWfk0w
         g1qOaK0H7Fl9/BFjwpnd0QIwrQNjpTQ0tf6BQXh3aGVBDZYrwqepV/zjt7FCBR7PqPtN
         kVzn0q4VZWvsGvokz9jEV11tj46lodmT5pA9l11zgb6mo4OWt/AVokYWMfkx/MWubFh7
         MAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709744188; x=1710348988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmO7ZZgYnvYeyC1/GW84LLWQW1EeC1P4rBQfQjcRcV0=;
        b=gsv3xL+T+ldPOIaQeOH5JAFhOfzhPloDw/CON2pEjxTjRsaxzkCZAzgbfcvNu05Or3
         +SVrSgpCVBwjV95y2diXXbAhUmP0zgK91aI1S1wm4LlVJpMkpiUIOMK65+xrAqo2gwBT
         PRH2kkYRM0aq7fNEoQYqVv28s3pu5AOCZvtRFgrC7ehW1Px7MkQ4tBoOQkpDd8awtiz7
         y8RS2krnV+yxZrWYtANRpElR4PoOH/SCkP9HhOWHWx4vz5sPxyHH4rsL4Rq2qKg6XqE3
         RmGj2MZpXBODRf4zaOhu7uFH2YQfuuO2MNbpriqiNqmNc2RWpuWdkoF6sUD8lF1FZlRo
         JeCQ==
X-Gm-Message-State: AOJu0Yz0YElLlMWEuL3A1pS5UkRKFZL3uUJC8z0+/6qKY2u74FEMBZDB
	hXVreyxrZalRXlBgol4RUb+VYhLo7HSNBjIMMwQ0HD8dbUP2x8eQVqxuWNxuNVA=
X-Google-Smtp-Source: AGHT+IE8V3aK2Sri5oE6eSGzqleS4sJmSeBCMsX3sQheIq1KhZ9SfzCrK3ZFaVL4AkWoYQlt49LhOw==
X-Received: by 2002:a05:6000:1970:b0:33d:5548:435e with SMTP id da16-20020a056000197000b0033d5548435emr12514452wrb.53.1709744188167;
        Wed, 06 Mar 2024 08:56:28 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [RFC PATCH v2] xen/arm: improve handling of load/store instruction decoding
Date: Wed,  6 Mar 2024 16:56:21 +0000
Message-Id: <20240306165621.3819343-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While debugging VirtIO on Arm we ran into a warning due to memory
being memcpy'd across MMIO space. While the bug was in the mappings
the warning was a little confusing:

  (XEN) d47v2 Rn should not be equal to Rt except for r31
  (XEN) d47v2 unhandled Arm instruction 0x3d800000
  (XEN) d47v2 Unable to decode instruction

The Rn == Rt warning is only applicable to single register load/stores
so add some verification steps before to weed out unexpected accesses.

While at it update the Arm ARM references to the latest version of the
documentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

---
v2
  - use single line comments where applicable
  - update Arm ARM references
  - use #defines for magic numbers
---
 xen/arch/arm/decode.c | 35 ++++++++++++++++++++------
 xen/arch/arm/decode.h | 57 ++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 79 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 2537dbebc1..73a88e4701 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -87,15 +87,36 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
         return 1;
     }
 
+    /* Check this is a load/store of some sort */
+    if ( (opcode.top_level.op1 & TL_LDST_OP1_MASK) != TL_LDST_OP1_VALUE )
+    {
+        gprintk(XENLOG_ERR, "Not a load/store instruction op1=%u\n",
+                opcode.top_level.op1);
+        goto bad_loadstore;
+    }
+
+    /* We are only expecting single register load/stores */
+    if ( (opcode.ld_st.op0 & LS_SREG_OP0_MASK) != LS_SREG_OP0_VALUE )
+    {
+        gprintk(XENLOG_ERR, "Not single register load/store op0=%u\n",
+                opcode.ld_st.op0);
+        goto bad_loadstore;
+    }
+
     /*
-     * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
-     * "Shared decode for all encodings" (under ldr immediate)
-     * If n == t && n != 31, then the return value is implementation defined
-     * (can be WBSUPPRESS, UNKNOWN, UNDEFINED or NOP). Thus, we do not support
-     * this. This holds true for ldrb/ldrh immediate as well.
+     * Refer Arm v8 ARM DDI 0487J.a, Page - K1-12586
+     *
+     * STR (immediate) CONSTRAINED UNPREDICTABLE behaviour
+     *
+     * "If the instruction encoding specifies pre-indexed addressing or
+     * post-indexed addressing, and n == t && n != 31, then one of the
+     * following behaviors must occur:" UNDEFINED, NOP or UNKNOWN
+     *
+     * Execution @ EL0/EL1 when HCR_EL2.TIDCP is 1 traps to EL2 with
+     * EC = 0.
      *
-     * Also refer, Page - C6-1384, the above described behaviour is same for
-     * str immediate. This holds true for strb/strh immediate as well
+     * This also hold true for LDR (immediate), Page K1-12581 and
+     * the RB/RH variants of both.
      */
     if ( (opcode.ldr_str.rn == opcode.ldr_str.rt) && (opcode.ldr_str.rn != 31) )
     {
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 13db8ac968..188114a71e 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -24,17 +24,54 @@
 #include <asm/processor.h>
 
 /*
- * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
- * Page 318 specifies the following bit pattern for
- * "load/store register (immediate post-indexed)".
+ * Refer to the ARMv8 ARM (DDI 0487J.a)
  *
- * 31 30 29  27 26 25  23   21 20              11   9         4       0
+ * Section C A64 Instruct Set Encoding
+ *
+ * C4.1 A64 instruction set encoding:
+ *
+ *   31  30  29 28  25 24                                             0
  * ___________________________________________________________________
- * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
- * |____|______|__|____|____|__|_______________|____|_________|_______|
+ * |op0 | x  x |  op1 |                                               |
+ * |____|______|______|_______________________________________________|
+ *
+ * op0 = 0 is reserved
+ * op1 = x1x0 for Loads and Stores
+ *
+ * Section C4.1.88 Loads and Stores
+ *
+ *  31    28 27   26   25  24 23 22 21      16 15  12 11 10 9        0
+ * ___________________________________________________________________
+ * |  op0   | 1 | op1 | 0 | op2 |  |    op3   |      | op4 |          |
+ * |________|___|_____|___|_____|__|__________|______|_____|__________|
+ *
+ * Page C4-653 Load/store register (immediate post-indexed)
+ *
+ * 31 30 29  27 26 25 24 23 22 21 20           12 11 10 9    5 4     0
+ * ___________________________________________________________________
+ * |size|1 1 1 |V | 0 0 | opc |0 |      imm9     | 0 1 |  Rn  |  Rt   |
+ * |____|______|__|_____|_____|__|_______________|_____|______|_______|
  */
 union instr {
     uint32_t value;
+    struct {
+        unsigned int ign2:25;
+        unsigned int op1:4;     /* instruction class */
+        unsigned int ign1:2;
+        unsigned int op0:1;     /* value = 1b */
+    } top_level;
+    struct {
+        unsigned int ign1:10;
+        unsigned int op4:2;
+        unsigned int ign2:4;
+        unsigned int op3:6;
+        unsigned int ign3:1;
+        unsigned int op2:2;
+        unsigned int fixed1:1; /* value = 0b */
+        unsigned int op1:1;
+        unsigned int fixed2:1; /* value = 1b */
+        unsigned int op0:4;
+    } ld_st;
     struct {
         unsigned int rt:5;     /* Rt register */
         unsigned int rn:5;     /* Rn register */
@@ -49,6 +86,14 @@ union instr {
     } ldr_str;
 };
 
+/* Top level load/store encoding */
+#define TL_LDST_OP1_MASK        0b0101
+#define TL_LDST_OP1_VALUE       0b0100
+
+/* Load/store single reg encoding */
+#define LS_SREG_OP0_MASK        0b0011
+#define LS_SREG_OP0_VALUE       0b0011
+
 #define POST_INDEX_FIXED_MASK   0x3B200C00
 #define POST_INDEX_FIXED_VALUE  0x38000400
 
-- 
2.39.2


