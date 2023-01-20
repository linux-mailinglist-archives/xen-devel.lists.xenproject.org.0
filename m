Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1E66757F9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481854.747043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssE-00071J-Rj; Fri, 20 Jan 2023 15:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481854.747043; Fri, 20 Jan 2023 15:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssE-0006zQ-OD; Fri, 20 Jan 2023 15:00:10 +0000
Received: by outflank-mailman (input) for mailman id 481854;
 Fri, 20 Jan 2023 15:00:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssC-0006SQ-ST
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:08 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f98dc38-98d3-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 16:00:05 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id d2so5080044wrp.8
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:05 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:04 -0800 (PST)
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
X-Inumbo-ID: 1f98dc38-98d3-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK6mrWrK6nj6EcTqrtHlS0lQnNqAK7Gdih4oSkDJSNU=;
        b=PGGCvQ/UGzX+z4r4reiswrOo0xSrrAeKU36OfQ1XPhFFwQsKXAUnCRhRhhCwZpODgX
         pP+qUjIh/V8SLoVPnaB7kYkql1UGEuzStJ7cNb1c+hGunckig8eH5zJHkFrkVPYnfBeZ
         31QmeVU6/ojyoNnZTHfFiobLNYrv5XA1V9wiibjUONni+t5u+FMgFvEyhbMykJ8NQKlk
         4ZPCpBc+9pqi+rEtAOS/3vPlPlD07pIXqggiHCKR4dmeXr72J32PO39EQWORbP+UtTQn
         MM34Pl4kTaRXTye3xUNPpDfQJjWSiHDmNFy8uhliwTAgeSj/KVhXDPKHwnAthDkR5Dfm
         mQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jK6mrWrK6nj6EcTqrtHlS0lQnNqAK7Gdih4oSkDJSNU=;
        b=XFn+nXprntoBZ0caoS5Rom2x8yp7lNEqnrJwi0l8GlVqoMX/jChVCecJ5uXgRSD0la
         Zqxmm+Y/6TLoLlaHXyR4cWg8RcJ+WeMd0bc1tY/TkL39bcrTnWZt7GrFSTUf4y/Ghxso
         yupyRbLn4czYXBukySLJ64oNChRd1oYSIpvRyJLAXdxW5VRRM0cFbzMT5Wfc3djznW5z
         FS/ISIjABPatj+sALH89wA59NWHmRZ9ONiIbP0QMWyBAtRKSPnRXKx0lABr0eZsMYIDl
         2RM+kWSpsxoxvcP1OQ3J5K2PLwyHoYJpjga50MjR4oVkZtyCJBE5Mxjj/IaEe5F5YvQg
         DstA==
X-Gm-Message-State: AFqh2krXAwLFhsKElfWGvmbX6p/cNDgKUD9DUKjW9SvuRqPvA+a4vo1c
	p/ugYfKghb/FBBA+E4BbImBzrCWaVyzfXA==
X-Google-Smtp-Source: AMrXdXto0DaaA4bhlG4PeNRSIYd5z9hie3V+VCoiAEl+va4mBZPBSKs96ZCBOtiMYKHJi+ncwgZUZA==
X-Received: by 2002:a5d:6f0a:0:b0:2be:15f8:af1d with SMTP id ay10-20020a5d6f0a000000b002be15f8af1dmr15035330wrb.66.1674226804856;
        Fri, 20 Jan 2023 07:00:04 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 02/14] xen/riscv: add <asm/asm.h> header
Date: Fri, 20 Jan 2023 16:59:42 +0200
Message-Id: <621e8ef8c6a721927ecade5bb41cdc85df386bbf.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/asm.h | 54 ++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/asm.h

diff --git a/xen/arch/riscv/include/asm/asm.h b/xen/arch/riscv/include/asm/asm.h
new file mode 100644
index 0000000000..6d426ecea7
--- /dev/null
+++ b/xen/arch/riscv/include/asm/asm.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: (GPL-2.0-only) */
+/*
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_ASM_H
+#define _ASM_RISCV_ASM_H
+
+#ifdef __ASSEMBLY__
+#define __ASM_STR(x)	x
+#else
+#define __ASM_STR(x)	#x
+#endif
+
+#if __riscv_xlen == 64
+#define __REG_SEL(a, b)	__ASM_STR(a)
+#elif __riscv_xlen == 32
+#define __REG_SEL(a, b)	__ASM_STR(b)
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#define REG_L		__REG_SEL(ld, lw)
+#define REG_S		__REG_SEL(sd, sw)
+
+#if __SIZEOF_POINTER__ == 8
+#ifdef __ASSEMBLY__
+#define RISCV_PTR		.dword
+#else
+#define RISCV_PTR		".dword"
+#endif
+#elif __SIZEOF_POINTER__ == 4
+#ifdef __ASSEMBLY__
+#define RISCV_PTR		.word
+#else
+#define RISCV_PTR		".word"
+#endif
+#else
+#error "Unexpected __SIZEOF_POINTER__"
+#endif
+
+#if (__SIZEOF_INT__ == 4)
+#define RISCV_INT		__ASM_STR(.word)
+#else
+#error "Unexpected __SIZEOF_INT__"
+#endif
+
+#if (__SIZEOF_SHORT__ == 2)
+#define RISCV_SHORT		__ASM_STR(.half)
+#else
+#error "Unexpected __SIZEOF_SHORT__"
+#endif
+
+#endif /* _ASM_RISCV_ASM_H */
-- 
2.39.0


