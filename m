Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EF17791EF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582505.912322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTCJ-0005OR-47; Fri, 11 Aug 2023 14:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582505.912322; Fri, 11 Aug 2023 14:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUTCI-0005IA-UX; Fri, 11 Aug 2023 14:33:02 +0000
Received: by outflank-mailman (input) for mailman id 582505;
 Fri, 11 Aug 2023 14:33:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNma=D4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qUTCG-00049h-VG
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:33:00 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f884fb49-3853-11ee-b284-6b7b168915f2;
 Fri, 11 Aug 2023 16:32:59 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fe11652b64so3245174e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Aug 2023 07:32:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q2-20020ac25a02000000b004fe07f06337sm753453lfn.53.2023.08.11.07.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 07:32:58 -0700 (PDT)
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
X-Inumbo-ID: f884fb49-3853-11ee-b284-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691764379; x=1692369179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/OtmtgHs6hiIE3b0R04W2tm1wiLCCAEvdGukHjFIgw=;
        b=qlkroSIbIq8LkBTjrCWeTTE5BVIoP3g6BRTkQnk9Td3MXWG4pZGJTohu074BaP2cRT
         ybYxGeoiTBMQpnSGWZvoUS15M3TvKOoE47GQQbhu0QKrpsyGMie3c/lVZJNltAXrxRN/
         xUfpm3RKgEEy5ggyTRu1FsEO6V+8ulen6DS0bWh11GOoKz0h7um9t9bJVSakxDybJhvH
         ws/rcXdTZb3wgro0mBX8h/jCIj9tFBLSoC4SJaqkCD8MXRQQ/jkwWnVeMuRim/enL2/y
         yXcxUeC5MVblYy+D8xEs8SXugGss18wdnBq9yIT5iE33BUi0onS7AAgbD+6Ei80hiC0O
         LseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691764379; x=1692369179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/OtmtgHs6hiIE3b0R04W2tm1wiLCCAEvdGukHjFIgw=;
        b=TBoLXpnEIsPLpGWzG/kPJAh1EIpITErqA/cuksWMM8VknDKD6PYtDNJ3IvDNPtVuVM
         Dz+nBiIa1+GRLkBsu5V2QneKx6OV6Lkk6QyYsXlAQGO1U/s96hzuQdckgtHOzavb7sW+
         nHdT/fkvom879vcMQXuFjtc2eXnyKpR9bXHejN7pGziTeAi8yp3nNBeQaZ49N/Sj5jkN
         sfdCGMtWENfLyeV2JlR+WNamn+nGqvy0GB6l1PIpoyUp82NkmEJ58n1anHNRjfa8Wagg
         RyByGoHy87o6fSaVq7nCBqmpDk5TiYUwm38JrJIeVSJPLiwxgberFthIYioP0xi9nrjU
         651w==
X-Gm-Message-State: AOJu0Yz2Po+wKeLh3FiYFOwSYmRNo1wwiJHxKUyHrsoGRa1a98MNzb2f
	4aXnDXxViN9GhSBMR7jxDvQeeNCka3A=
X-Google-Smtp-Source: AGHT+IHduLYw9QGKUkNhITZuwy+eFdqGXS19EtKxUmx23upKJLTfpHuFHdlLRkXfdeY3zs5nMz5wCA==
X-Received: by 2002:a05:6512:695:b0:4fe:711:2931 with SMTP id t21-20020a056512069500b004fe07112931mr2288829lfe.22.1691764378985;
        Fri, 11 Aug 2023 07:32:58 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v8 2/6] xen/riscv: introduce <asm/bug.h>
Date: Fri, 11 Aug 2023 17:32:51 +0300
Message-ID: <ae77b6ad3542d2c2ff2700f82212ec35662d7d15.1691763757.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691763757.git.oleksii.kurochko@gmail.com>
References: <cover.1691763757.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - new patch. It was introduced instead of dummy asm/bug.h introduction.
---
 xen/arch/riscv/include/asm/bug.h | 37 ++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bug.h

diff --git a/xen/arch/riscv/include/asm/bug.h b/xen/arch/riscv/include/asm/bug.h
new file mode 100644
index 0000000000..f5ff96140f
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bug.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2021-2023 Vates
+ *
+ */
+#ifndef _ASM_RISCV_BUG_H
+#define _ASM_RISCV_BUG_H
+
+#ifndef __ASSEMBLY__
+
+#define BUG_INSTR "ebreak"
+
+/*
+ * The base instruction set has a fixed length of 32-bit naturally aligned
+ * instructions.
+ *
+ * There are extensions of variable length ( where each instruction can be
+ * any number of 16-bit parcels in length ).
+ *
+ * Compressed ISA is used now where the instruction length is 16 bit  and
+ * 'ebreak' instruction, in this case, can be either 16 or 32 bit (
+ * depending on if compressed ISA is used or not )
+ */
+#define INSN_LENGTH_MASK        _UL(0x3)
+#define INSN_LENGTH_32          _UL(0x3)
+
+#define BUG_INSN_32             _UL(0x00100073) /* ebreak */
+#define BUG_INSN_16             _UL(0x9002)     /* c.ebreak */
+#define COMPRESSED_INSN_MASK    _UL(0xffff)
+
+#define GET_INSN_LENGTH(insn)                               \
+    (((insn) & INSN_LENGTH_MASK) == INSN_LENGTH_32 ? 4 : 2) \
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _ASM_RISCV_BUG_H */
-- 
2.41.0


