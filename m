Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B48F710F90
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 17:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539709.840853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CtB-00070R-8J; Thu, 25 May 2023 15:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539709.840853; Thu, 25 May 2023 15:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2CtB-0006tL-4H; Thu, 25 May 2023 15:28:29 +0000
Received: by outflank-mailman (input) for mailman id 539709;
 Thu, 25 May 2023 15:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g/QV=BO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q2CtA-0006oN-4v
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 15:28:28 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb3e7992-fb10-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 17:28:26 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f00c33c3d6so2724974e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 May 2023 08:28:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d22-20020ac244d6000000b004f37c0dfcaasm246853lfm.118.2023.05.25.08.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 08:28:24 -0700 (PDT)
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
X-Inumbo-ID: cb3e7992-fb10-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685028506; x=1687620506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mm1x9FKPEwGMnotOEN0ZErT2+QXcBOPbrrKH58hZrN4=;
        b=D3CH1CX9YfjUZGnsUIEi7FEnsOrx6s5OYDBwZb7ShKNqlque/r/fWvCOhwXB7WsXxE
         pE6mfffKb3IdJYRSyVAPEGmPCliGcecKh6a+3yCenBLMefva9Z+FKbG53pUHSBEnq49Q
         F0SwOdRC1adfPx4IgUhr22lYIrMkGk8UmIhfefvmY8YQL469i5wGEnr0tLjDTa88thcz
         LFGDzh+0F29TmHRDjcilEWsw9hC57pik85xuesETEG8wQlHrMOtn8WA5Hd8/E0fBlygZ
         /fwGlClt4P4UcwJ0Zzw8YHBtKVy+NEQO8WrpJWvVvK1mPuzgQG5uRZNjH2GKbg0LxrdX
         /G8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685028506; x=1687620506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mm1x9FKPEwGMnotOEN0ZErT2+QXcBOPbrrKH58hZrN4=;
        b=l5tHVABrnCOX2hKjiulaC6SgUFDnipSX1/FKKnoJsGB2QhYMY8n8PS9+8umU6rU3NC
         +K9hsE5Ja5wur2SUIiAwx4MtzIsMeoaSxxNKCft5DmAMkbA7Wuop9b2hdxaiURUBb3e0
         u/7S696pkbZvMxP6dDQgTjydBIGh7Tj70R/xFLCun6okLdPLK+ZKglHlxbm+qc3Y5+QA
         WNfT+h+lsIrsdxSKrYvQ91qgLpnQl0beLvWlyjFlQ66Pjdkh22xe/1jZl2WzHNrlWkf1
         thGg2UySgJNks49QZBZpoWVw3cQntgj4W0Z14nDjGBRQvj06TQWe0MrZAMmbijKHuxBN
         emyg==
X-Gm-Message-State: AC+VfDzYFQWlV2565lgcwTu+Pv1xdSFMOONhprMJlGGFBdgNEv1cEJJN
	avsXoloyUVMDBgg9hG3M/mWzfZaLNDk=
X-Google-Smtp-Source: ACHHUZ5YmwnjCDBxXsrdxE4FYSVhGy9E8zB7sa3ZQT449fJ8dmMhSu+11AOT8E9ycG0jaCoD5Vsvyg==
X-Received: by 2002:ac2:5dfc:0:b0:4f3:aa09:e7e8 with SMTP id z28-20020ac25dfc000000b004f3aa09e7e8mr8090365lfq.44.1685028505609;
        Thu, 25 May 2023 08:28:25 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v9 1/5] xen/riscv: add VM space layout
Date: Thu, 25 May 2023 18:28:14 +0300
Message-Id: <1621fd09987d20b3233132d422e5c9dfe300e3f7.1685027257.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1685027257.git.oleksii.kurochko@gmail.com>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also it was added explanation about ignoring of top VA bits

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V9:
 - Update comment for VM layout description.
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
index 763a922a04..9900d29dab 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -4,6 +4,42 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
+/*
+ * RISC-V64 Layout:
+ *
+#if RV_STAGE1_MODE == SATP_MODE_SV39
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
+ * 0000003200000000 |  0000007F80000000 | 309 GB | L2 200-509 | Direct map
+ *                 ...                  |  1 GB  | L2 199     | Unused
+ * 0000003100000000 |  00000031C0000000 |  3 GB  | L2 196-198 | Frametable
+ *                 ...                  |  1 GB  | L2 195     | Unused
+ * 0000003080000000 |  00000030C0000000 |  1 GB  | L2 194     | VMAP
+ *                 ...                  | 194 GB | L2 0 - 193 | Unused
+ * ============================================================================
+ *
+#endif
+ */
+
 #if defined(CONFIG_RISCV_64)
 # define LONG_BYTEORDER 3
 # define ELFSIZE 64
-- 
2.40.1


