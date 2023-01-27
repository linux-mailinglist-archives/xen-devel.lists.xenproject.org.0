Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD3967E797
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 14:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485590.752933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGf-0001KN-2a; Fri, 27 Jan 2023 13:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485590.752933; Fri, 27 Jan 2023 13:59:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLPGe-0001IO-Ud; Fri, 27 Jan 2023 13:59:48 +0000
Received: by outflank-mailman (input) for mailman id 485590;
 Fri, 27 Jan 2023 13:59:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLPGd-0000nM-5b
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:59:47 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db1c1821-9e4a-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 14:59:46 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id b7so5070069wrt.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 05:59:46 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adfe2c3000000b002bc7fcf08ddsm3971131wrj.103.2023.01.27.05.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 05:59:45 -0800 (PST)
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
X-Inumbo-ID: db1c1821-9e4a-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6CXWGrRmetWnTON0psYBk3rMNfFAijYRefln9RvY+M=;
        b=qIiooRD3Jx9D80j/dfTVYrMWYhVzIrmVBrhRw2guFhbEOTunfZgr9SMOXUejUh/vba
         AYagNIgLuYAkeiwq+zaydtQeZMdGJDMONquCLgGeSEMd/dTjQsbzXkqxgDy+cnq3YwYs
         OybGtUSQsLltQP0J+UnVFz3erk19XgoHXHV8293/DS5ZKUqkzrG/PgGR7OYnLIAEKmTl
         S2s7zLIW1Yk+B1PCVytvbgi6CWDXu7VRf0jvuHf5vqaCxazjFOISMFGFnwfGhUY+Xzhy
         Ev/j4n9bZWtUBvzts7U0CiwpZEKFmOTr64a+tTmum6k2jJdGENUdwItdR9gkWYfYJ4T6
         pIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M6CXWGrRmetWnTON0psYBk3rMNfFAijYRefln9RvY+M=;
        b=UhYyNvOLFlvNZ9mKDTuoHkmfrcTmibycUQN/8uhE8RNJRkxPqiH7AE4933n7H3XLhP
         dgL1CkEZalrdDnJW8e3YqSdWJhlgkAR6SELen0taKCzcdToJPBMouRsC+xudXrxe6Iod
         KP6VhoFGeo6F8f/VejDe1TH8L1sEQrUE0h8VRF7rCORZlNXl+9mi4LzPu67QZ2RHCuWt
         phRiP0CNcF54bP1HtfGJ91vI4d6JU7R1s2gkxWR703kuxA2hvU9TReB6Bk8fV/Rok+cr
         TBphZ/Hx26PLvg7/CHZui9I3XEoHL5KKn8II7JdX1jeNcnBvgoyl182qjzjxVEX8fcH/
         ph0w==
X-Gm-Message-State: AFqh2kpx5pz4mNikjs4Ga0FCkfa+FokcgtN2We+jyoWgt6wMWksdCZP0
	QoiFezSd8jkTj7VtZePqJEpdOFzmxjU=
X-Google-Smtp-Source: AMrXdXsGr8dR80xKZBB9zzklpx4B8zZKx38QJzLfxWlGgu+EzMuTpXN+Ar0T4t70kVLT1b6kouxzjQ==
X-Received: by 2002:adf:f2cb:0:b0:2be:4fbe:42e1 with SMTP id d11-20020adff2cb000000b002be4fbe42e1mr27629599wrp.5.1674827985409;
        Fri, 27 Jan 2023 05:59:45 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 02/14] xen/riscv: add <asm/asm.h> header
Date: Fri, 27 Jan 2023 15:59:07 +0200
Message-Id: <9a098db8e3fef97df987b2a7330333b51a21cb8c.1674818705.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674818705.git.oleksii.kurochko@gmail.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
  - Nothing changed
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


