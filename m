Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6BF70BD67
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 14:19:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537881.837505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V5-0001J2-TN; Mon, 22 May 2023 12:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537881.837505; Mon, 22 May 2023 12:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q14V5-0001Gi-Pt; Mon, 22 May 2023 12:18:55 +0000
Received: by outflank-mailman (input) for mailman id 537881;
 Mon, 22 May 2023 12:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ae2Q=BL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q14V4-0000XV-4z
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 12:18:54 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf720081-f89a-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 14:18:50 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f4b0a0b557so1050542e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 May 2023 05:18:50 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 8-20020ac24828000000b004f26aabbd6asm961120lft.130.2023.05.22.05.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 05:18:49 -0700 (PDT)
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
X-Inumbo-ID: cf720081-f89a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684757930; x=1687349930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OekhSlEnpCrynmwo/goaylbLa38lEjHZjQwhuoGYxy0=;
        b=fuhB9mHpKQT3/o2+ATewdSqseNxbmdOuoY4MVh6gOF/5seFHfh/VvPvwIdbgVgGWl2
         YgLPBlOr/XrbD8jsuJFJPxJFxqvHuJSxwGlGS9GSjOW+QvxZkv9dpO8xlRW2GSMBigkP
         F7K3oELRFyf+4Ficlqf0RGpDUt2poi34tvRpPKIgfbY0BcXHEJE3R710BZuSjq8vt9cK
         ndYd20QblTXf+iFBj+eobd5VjTMGjWkEnm0vaZjR34lMd9Sugplux0VGuswLgN54Z/xz
         yrH0TtMIltCr2p1/yCyLCkPeh6ijJ8HNMHnku+g7VYl1S4Vxxgwh+meE5gdpu/AmjpuB
         FLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684757930; x=1687349930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OekhSlEnpCrynmwo/goaylbLa38lEjHZjQwhuoGYxy0=;
        b=SYbX4U/F32JPs1O7IF4yqCvPwyyaGZRtG7gxyjouRsgBS56fN7F26YGChUNl48zGvF
         AbmukOzwTT52E7Vpj71XRgJZH3cFlQiHwkAWaJwBoKBuXLEZX1IiiCDsjS6Urb7JZ862
         w7KLaZoqtI+2W3yvpLNNaKNV95ZnL7M1ydWr7k9Na6f6B1Kq+EUuMVgHkXvHw4CKdPG6
         uOF9dkrmn+vD4b+iOiZRqg71HZqavBw3yW3/Xy4BZsYoo0mnzpS1Ht6Bb5lEf5JR4lUG
         /JXIZeUaVnguxH/bdtuMgGorokbazVQJ9HiksSjAYMv6X6QtrT7pRcWDamaGu6bTMnkA
         yaxA==
X-Gm-Message-State: AC+VfDxgmi5twGCKceX/TFD0CkcTlELD9t4vGIY4U8xHy9zz61X2iEpD
	c5xzqz9wZCTPZLqCDn8r32y+T4Hdp0I=
X-Google-Smtp-Source: ACHHUZ4OAbUB3t2ZbtNxLXTsfQJ29AZfges+Oaz2iMgvLHGAYH7u83xZpFq5hqtIWR28cQnZ/4IAYw==
X-Received: by 2002:ac2:5298:0:b0:4f2:5aae:937 with SMTP id q24-20020ac25298000000b004f25aae0937mr3118884lfm.64.1684757929933;
        Mon, 22 May 2023 05:18:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 1/5] xen/riscv: add VM space layout
Date: Mon, 22 May 2023 15:18:42 +0300
Message-Id: <bbdfbf59db6d329d65956839c79e6e42bbf13bb7.1684757267.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1684757267.git.oleksii.kurochko@gmail.com>
References: <cover.1684757267.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also it was added explanation about ignoring of top VA bits

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - Add "#ifdef RV_STAGE1_MODE == SATP_MODE_SV39" instead of "#ifdef SV39"
   in the comment to VM layout description.
 - Update the upper bound of direct map area in VM layout description.
---
Changes in V7:
 - Fix range of frametable range in RV64 layout.
 - Add ifdef SV39 to the RV64 layout comment to make it explicit that
   description if for SV39 mode.
 - Add missed row in the RV64 layout table.
---
Changes in V6:
 - update comment above the RISCV-64 layout table
 - add Slot column to the table with RISCV-64 Layout
 - update RV-64 layout table.
---
Changes in V5:
* the patch was introduced in the current patch series.
---
 xen/arch/riscv/include/asm/config.h | 36 +++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 763a922a04..57c1b33ee5 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -4,6 +4,42 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
+/*
+ * RISC-V64 Layout:
+ *
+ * #ifdef RV_STAGE1_MODE == SATP_MODE_SV39
+ *
+ * From the riscv-privileged doc:
+ *   When mapping between narrower and wider addresses,
+ *   RISC-V zero-extends a narrower physical address to a wider size.
+ *   The mapping between 64-bit virtual addresses and the 39-bit usable
+ *   address space of Sv39 is not based on zero-extension but instead
+ *   follows an entrenched convention that allows an OS to use one or
+ *   a few of the most-significant bits of a full-size (64-bit) virtual
+ *   address to quickly distinguish user and supervisor address regions.
+ *
+ * It means that:
+ *   top VA bits are simply ignored for the purpose of translating to PA.
+ *
+ * ============================================================================
+ *    Start addr    |   End addr        |  Size  | Slot       |area description
+ * ============================================================================
+ * FFFFFFFFC0800000 |  FFFFFFFFFFFFFFFF |1016 MB | L2 511     | Unused
+ * FFFFFFFFC0600000 |  FFFFFFFFC0800000 |  2 MB  | L2 511     | Fixmap
+ * FFFFFFFFC0200000 |  FFFFFFFFC0600000 |  4 MB  | L2 511     | FDT
+ * FFFFFFFFC0000000 |  FFFFFFFFC0200000 |  2 MB  | L2 511     | Xen
+ *                 ...                  |  1 GB  | L2 510     | Unused
+ * 0000003200000000 |  0000007f80000000 | 309 GB | L2 200-509 | Direct map
+ *                 ...                  |  1 GB  | L2 199     | Unused
+ * 0000003100000000 |  00000031C0000000 |  3 GB  | L2 196-198 | Frametable
+ *                 ...                  |  1 GB  | L2 195     | Unused
+ * 0000003080000000 |  00000030C0000000 |  1 GB  | L2 194     | VMAP
+ *                 ...                  | 194 GB | L2 0 - 193 | Unused
+ * ============================================================================
+ *
+ * #endif
+ */
+
 #if defined(CONFIG_RISCV_64)
 # define LONG_BYTEORDER 3
 # define ELFSIZE 64
-- 
2.40.1


