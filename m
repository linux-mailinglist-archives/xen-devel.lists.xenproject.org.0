Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1835B916973
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747741.1155292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6ai-0000eb-4l; Tue, 25 Jun 2024 13:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747741.1155292; Tue, 25 Jun 2024 13:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6ah-0000Vk-T0; Tue, 25 Jun 2024 13:52:11 +0000
Received: by outflank-mailman (input) for mailman id 747741;
 Tue, 25 Jun 2024 13:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM6af-00086j-Ev
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:52:09 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ccb7121-32fa-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 15:52:07 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57d0f929f79so5223472a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:52:07 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560627sm521042666b.148.2024.06.25.06.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 06:52:06 -0700 (PDT)
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
X-Inumbo-ID: 1ccb7121-32fa-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719323527; x=1719928327; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQmPQb13oFtw7Zjr+EpKt2RGh54SRf+k/JDvX9Bcyjo=;
        b=UFFTERedeBYHrZDHVCPP4+vRhWe4eCxPT0g4ClxMtuJ5caO4wIxwfeIMY50Jzes3yv
         hOjAP9O7t5Ntn324cLIbZjiovav1WH3I1LHCe0+YHCBrzRaop0uULwc1z4bL2jQL+5/0
         KcPAUyd72zhw3iUKp8lcFQ5Dooil8K8Ece1V8UbfrkSkiwZj+9k9PrWC6GyMPqDADx6J
         vyGDCDhCpknx1LriojhUAM/iJ+YqNkMZszzCVsfAeefvkiswAW25wrNpruUKs+8hRD0G
         0rRE0/2UHWCxPWzmfAfGWTz8ZK+unzQw+YFBHmMT4cgIXt6HBmq968pqcBq4dggh36t+
         NjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323527; x=1719928327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQmPQb13oFtw7Zjr+EpKt2RGh54SRf+k/JDvX9Bcyjo=;
        b=N4yvJFcTzdanGXDCmr2kOI6K0W7XEiN0zI8Jv76TXXvDbrzAaDxSfx6wUjnrGRaHs2
         8bEMNOkdG7dAoi1aZ1ZiRpIMTrYKJ796763sHTnOpVM7UzckrLlmgtf7+assh5G39l0s
         3ne6/fTryfhPeG8Bmn2VAE3xuV7gnv/YtFHneOgQFJXEs9tXxMCt4Yw3DTg1gc7bRB5o
         PdWj5ZzpBOCrVeJP1ogfIgs3svCJdzOokGa2rr1E8DOAmNcg0MgjrwjUIQc5pkclgdgU
         aQOVL8zBljBXK9SkrMJ1Ifs2J99iNlu8wR71N8wbyuKcuAHybU26QA089ZrRRAoi7wOk
         D5Sg==
X-Gm-Message-State: AOJu0YxliD81Oc3OlCsIaED3uqggZXgd+pty/I12CUlTlNe3+3ARBSmL
	g8DFMGL9k+7akkxiVDSBG4i/A1xGjItH4i3b94Dflj3lq9KT5VnCdbNYRWSc
X-Google-Smtp-Source: AGHT+IGw0bOwz082172cYDo31ZXm2xuhKvCxKA7NYCAsPV1WdsPwTwRMblw0I8dTE94cDj50GwpkMw==
X-Received: by 2002:a17:907:c245:b0:a6e:fccb:7146 with SMTP id a640c23a62f3a-a7245b565eamr498009666b.23.1719323527039;
        Tue, 25 Jun 2024 06:52:07 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v13 09/10] xen/riscv: introduce ANDN_INSN
Date: Tue, 25 Jun 2024 15:51:51 +0200
Message-ID: <b0d2ff2cecf6cb324e43b9c14c87f47f3f199613.1719319093.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719319093.git.oleksii.kurochko@gmail.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V does a conditional toolchain for the Zbb extension
(xen/arch/riscv/rules.mk), but unconditionally uses the
ANDN instruction in emulate_xchg_1_2().

Fixes: 51dabd6312c ("xen/riscv: introduce cmpxchg.h")

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Changes in V13:
  - new patch
---
 xen/arch/riscv/include/asm/cmpxchg.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
index d5e678c036..12278be577 100644
--- a/xen/arch/riscv/include/asm/cmpxchg.h
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -18,6 +18,20 @@
         : "r" (new) \
         : "memory" );
 
+/*
+ * Binutils < 2.37 doesn't understand ANDN.  If the toolchain is too
+ld, form
+ * it of a NOT+AND pair
+ */
+#ifdef __riscv_zbb
+#define ANDN_INSN(rd, rs1, rs2)                 \
+    "andn " rd ", " rs1 ", " rs2 "\n"
+#else
+#define ANDN_INSN(rd, rs1, rs2)                 \
+    "not " rd ", " rs2 "\n"                     \
+    "and " rd ", " rs1 ", " rd "\n"
+#endif
+
 /*
  * For LR and SC, the A extension requires that the address held in rs1 be
  * naturally aligned to the size of the operand (i.e., eight-byte aligned
@@ -48,7 +62,7 @@
     \
     asm volatile ( \
         "0: lr.w" lr_sfx " %[old], %[ptr_]\n" \
-        "   andn  %[scratch], %[old], %[mask]\n" \
+        ANDN_INSN("%[scratch]", "%[old]", "%[mask]") \
         "   or   %[scratch], %[scratch], %z[new_]\n" \
         "   sc.w" sc_sfx " %[scratch], %[scratch], %[ptr_]\n" \
         "   bnez %[scratch], 0b\n" \
-- 
2.45.2


