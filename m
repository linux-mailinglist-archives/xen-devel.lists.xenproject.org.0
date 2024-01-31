Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 969DB844680
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 18:51:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674144.1048899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEji-0007Q3-GH; Wed, 31 Jan 2024 17:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674144.1048899; Wed, 31 Jan 2024 17:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVEji-0007NQ-D9; Wed, 31 Jan 2024 17:50:58 +0000
Received: by outflank-mailman (input) for mailman id 674144;
 Wed, 31 Jan 2024 17:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L0zX=JJ=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1rVEjg-0007NK-Uo
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 17:50:57 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4890c095-c061-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 18:50:55 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51121c08535so2098831e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 09:50:55 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 x3-20020a05600c2d0300b0040fb0c84c64sm2144891wmf.14.2024.01.31.09.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 09:50:55 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 5B5AA5F7A8;
 Wed, 31 Jan 2024 17:50:54 +0000 (GMT)
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
X-Inumbo-ID: 4890c095-c061-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706723455; x=1707328255; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYhl5BgNrSittXccLvyhY2byvB1ghpoW9pMQL6HzhQ0=;
        b=inf+7aznLI4jkJLh+z/XTRFqkCI5i54no4579ajAkmEw7l27nnUxgPSaYBs5vNIZ5K
         kAIo0voGr+v4j1Jd6DwqsnMgL9Z06fVdxiYYBXDZJUoAcZSplu187BuyqJStdaT4Bi2e
         ocvqY/DF8DLivzvBaqE3VM6Q8JH0WZtnWSRDI0RrGf5L0KPfQ7g0E11/iR54UhYBK0IO
         ExtQ84nsYfnx+SYlR4OZU/QwW7a0Y357psjNsVcCmESH7o7rFSpwZETNbNZkwvrmxdYM
         xqPJlq6fnY26KrXoVy74eJaiO0N7NQafdOCulvZSBBz41NeibcvVN8VyZR4ZRylGQ4eN
         gB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706723455; x=1707328255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYhl5BgNrSittXccLvyhY2byvB1ghpoW9pMQL6HzhQ0=;
        b=LAMUmQKoRuooVoBkiHe0Knqtg5Kmpii2ebpl/6hdpHR1R7e8w43Whe3kDE0bTcvivQ
         VpEHdBF9/IZs5Ih+/DnFMXCcChcbvN+libqfJNLaXhD2fvr12eZMB7WkBjcW3B/iDTff
         QiY2hTyEbuc2jZKtLTn2z4xMj7g8O7yt0XgOrL6OBEhomnRav/K1h5Se+OmURoQgAcQT
         /liFz5pvAjUWSiyA+aOGquy/AD6we7r4sXFbqKPcOfQKb2MOWjO+ZIalWH6CcKBDwwWu
         ddXeNUj56rwt03j6+PhJoSWMA99daHGjHHaLqL+6lqspsGJ8slytyO9f/in5I8vwNIPo
         AsZQ==
X-Gm-Message-State: AOJu0Yw0j/4F5BbCjGV1zv8tQCvtADnYXyFB4r+rNa/9rEfFxMUb0fN3
	bmseldaNLAaWzIFiIJS9z/m7xembURXx7jgGsOB57CLMCNKXhTnxS5z9hvmHFxI=
X-Google-Smtp-Source: AGHT+IG/NAnFraKtzJg1gKLYNXRIOrWU6Lhrh7OVd7ORbWUPl43521LoS88c8Bw7+IhLvI/8uHnnRg==
X-Received: by 2002:ac2:4187:0:b0:511:2bd4:d987 with SMTP id z7-20020ac24187000000b005112bd4d987mr68378lfh.58.1706723455248;
        Wed, 31 Jan 2024 09:50:55 -0800 (PST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [RFC PATCH] xen/arm: improve handling of load/store instruction decoding
Date: Wed, 31 Jan 2024 17:50:43 +0000
Message-Id: <20240131175043.1488886-1-alex.bennee@linaro.org>
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

I updated the Arm ARM reference to the online instruction decoding
table which will hopefully be more stable than the Arm ARM section
numbers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 xen/arch/arm/decode.c | 20 ++++++++++++++++++++
 xen/arch/arm/decode.h | 38 +++++++++++++++++++++++++++++++++++---
 2 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 2537dbebc1..824025c24c 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -87,6 +87,26 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
         return 1;
     }
 
+    /*
+     * Check this is a load/store of some sort
+     */
+    if ( (opcode.top_level.op1 & 0b0101) != 0b0100 )
+    {
+        gprintk(XENLOG_ERR, "Not a load/store instruction op1=%d",
+                opcode.top_level.op1);
+        goto bad_loadstore;
+    }
+
+    /*
+     * We are only expecting single register load/stores
+     */
+    if ( (opcode.ld_st.op0 & 0b0011) != 0b0011 )
+    {
+        gprintk(XENLOG_ERR, "Not single register load/store op0=%d",
+                opcode.ld_st.op0);
+        goto bad_loadstore;
+    }
+
     /*
      * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
      * "Shared decode for all encodings" (under ldr immediate)
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 13db8ac968..b1580178eb 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -24,9 +24,27 @@
 #include <asm/processor.h>
 
 /*
- * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
- * Page 318 specifies the following bit pattern for
- * "load/store register (immediate post-indexed)".
+ * From:
+ * https://developer.arm.com/documentation/ddi0602/2023-12/Index-by-Encoding
+ *
+ * Top level encoding:
+ *
+ *   31  30  29 28  25 24                                             0
+ * ___________________________________________________________________
+ * |op0 | x  x |  op1 |                                               |
+ * |____|______|______|_______________________________________________|
+ *
+ * op0 = 0 is reserved
+ * op1 = x1x0 for Loads and Stores
+ *
+ * Loads and Stores
+ *
+ *  31    28 27   26   25  24             9 8                        0
+ * ___________________________________________________________________
+ * |  op0   | 1 | op1 | 0 |       op2      |                          |
+ * |________|___|_____|___|________________|__________________________|
+ *
+ * Load/store register (immediate post-indexed)
  *
  * 31 30 29  27 26 25  23   21 20              11   9         4       0
  * ___________________________________________________________________
@@ -35,6 +53,20 @@
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
+        unsigned int ign1:9;
+        unsigned int op2:15;
+        unsigned int fixed1:1; /* value = 0b */
+        unsigned int op1:1;
+        unsigned int fixed2:1; /* value = 1b */
+        unsigned int op0:4;
+    } ld_st;
     struct {
         unsigned int rt:5;     /* Rt register */
         unsigned int rn:5;     /* Rn register */
-- 
2.39.2


