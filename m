Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7767F71F8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640503.998825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tj4-0002yq-M8; Fri, 24 Nov 2023 10:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640503.998825; Fri, 24 Nov 2023 10:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tj4-0002wJ-JN; Fri, 24 Nov 2023 10:47:58 +0000
Received: by outflank-mailman (input) for mailman id 640503;
 Fri, 24 Nov 2023 10:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTW-0006hx-Cy
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:54 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a95c321a-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:43 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a00b056ca38so243310666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:43 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:42 -0800 (PST)
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
X-Inumbo-ID: a95c321a-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821903; x=1701426703; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZYBaKtqO03IaPhGnfIlixMtQetp2xv8QqhEqqcwd+k=;
        b=UlhwHxmRKQbKJ2Inz952T3MgMb0VNYMJdlAyhczHMPDuto30FTWJvx3IPj2Ss/ergy
         Kq+O+XL84u7JQgD463sI3yV/u3ubWHIMlTDPjxBmHmU+2+TGDPiele4S6HsysGfv8p17
         P1lp28u4iJTqUPW18FUmYeRm6eIALjyIHKzSdKhICO7EEDxCHwiTLxEn9BTyb7WembWS
         EFVnbmY+Nr66CvHTGsrkwFEEchBNvkDTz7R89291WRtKwQNsx0DMdoUPbZWZFb+HSxky
         LNbVjDIV7j73COlL2UOQi6QlYXlsmTw8l1cpamly60HjR1+lFchU01//uOtTK8G1Hz2D
         qELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821903; x=1701426703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZYBaKtqO03IaPhGnfIlixMtQetp2xv8QqhEqqcwd+k=;
        b=ghdpoCmjN4acDN36eBbbRPIioNJZ0dUB8Vqw03Zv2/MXQ85OZsX5MMNxCtsBYWkFoq
         lxQE9vEZbf8x9T5r9c5YtnaO9jBPPrUAjwgFTF5/wKL+Ew7pLsdmu4ib0g/n+i/08Plq
         tYueGFZEUrzcvYqSh81hV1lQvEWrZFcadPxlNwE/SM2H/qs6uQkJ2ikiZPY2N+Mvw0lj
         Up+nUWGoe7nr9WCC5GCdwrPN1HVK+Cy+z1AU2tPPGj61yc7xFOp6mGT+HDZy6YLjy/4C
         oMTKyqsAu1dhq4DI0ZzoF8sz8l1DTo2sh/s0ujVPZfRO1cJYQQxYkRQFoUxPq3yQpirV
         tLaw==
X-Gm-Message-State: AOJu0YzquoPiPCeSUumtL8nrChyylve3zOjIgssucmHrof/dO70E6Yrz
	2kbxCNe5QwasCztB2BxRgTE0nxQlC3ZFqw==
X-Google-Smtp-Source: AGHT+IFoisvlUc6sGtkQ0PuK7EpcEjxDt7LEADKp7XJ8gqN7fWPxILq2oTpfBFaXOr0WNEMVNtW1tg==
X-Received: by 2002:a17:906:35c7:b0:9e4:e405:27b4 with SMTP id p7-20020a17090635c700b009e4e40527b4mr1518113ejb.53.1700821902971;
        Fri, 24 Nov 2023 02:31:42 -0800 (PST)
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 32/39] xen/riscv: add minimal stuff to asm/page.h to build full Xen
Date: Fri, 24 Nov 2023 12:30:52 +0200
Message-ID: <34a4bc023eb50e1d1cf70fa149825c51f2f4555f.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/page.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 95074e29b3..abbae75aaf 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -6,6 +6,7 @@
 #ifndef __ASSEMBLY__
 
 #include <xen/const.h>
+#include <xen/bug.h>
 #include <xen/types.h>
 
 #include <asm/mm.h>
@@ -32,6 +33,9 @@
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
+/* TODO */
+#define PAGE_HYPERVISOR 0
+
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
 
@@ -46,6 +50,9 @@ typedef struct {
 #endif
 } pte_t;
 
+#define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
+#define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
+
 static inline pte_t paddr_to_pte(paddr_t paddr,
                                  unsigned int permissions)
 {
@@ -62,6 +69,20 @@ static inline bool pte_is_valid(pte_t p)
     return p.pte & PTE_VALID;
 }
 
+static inline void invalidate_icache(void)
+{
+    BUG();
+}
+
+#define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
+#define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
+
+/* TODO: Flush the dcache for an entire page. */
+static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+    BUG();
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
-- 
2.42.0


