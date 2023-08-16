Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8B177DEAC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584387.915097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnG-0007n7-LJ; Wed, 16 Aug 2023 10:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584387.915097; Wed, 16 Aug 2023 10:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnG-0007kU-HA; Wed, 16 Aug 2023 10:30:26 +0000
Received: by outflank-mailman (input) for mailman id 584387;
 Wed, 16 Aug 2023 10:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeG-0003RA-3c
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:08 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 958c9822-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:55 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-318015ade49so5634453f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:55 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:54 -0700 (PDT)
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
X-Inumbo-ID: 958c9822-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181254; x=1692786054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/ISEP/S/uE45uvIZORyRNlJpLmUUnoCtEck7vyhZ1Q=;
        b=T59b8SoqVBzvCdmrWMPWfAQMfmTZGR6cLKoy9YVgO4KXTrUNBPPxXdvsHTANCmMQCt
         nOCfEZd1R3VtSgMeK5C8CDg3vlibStjm+VA4yJbdDwOnQ90815GBGVelZLClwX4EI09y
         Wx21PxAoEKfGB/8jH2AiwgRFKeg8qT8opew2OygXdjqhzBtO+ZUE6hQPtX3XVsojztbj
         FMDqbYbcB/lr19xXCcueVLBlt1257Z2oPPpA4hO2k8eOlaSOa0OZkbx3xWu0nx+/htEP
         9zS3MKkzoQilUa5shf6FUm0P6SAB+CLc9/l0GjAhYXOMgOQSHt4KhyOZ1ishkYhECvrV
         3HGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181254; x=1692786054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/ISEP/S/uE45uvIZORyRNlJpLmUUnoCtEck7vyhZ1Q=;
        b=VwvadEZ6xzmKt9k7hirLWtq+O/JfOO6WLf91EvokevkslmTNXY5ql9W3xsIIFDJXxu
         /O81thI6uAYnJafq6MFjbV1J7QN8+Ih/wma/FrnB3Bj1udt9++lfL9hJkkE0wDBF5d1b
         sb/aPZO0JENkbSDnu5EQ+dZp6blmwLCXhet+9HvFiWU6i3wBkyVrUWdFCXnmZpMSPzet
         13gdBibBBhz3vhS7Qalqx9Ev9mJA+S++0kyFgmis/ZaBCvxiCjH1WJ/gKgfU/4lw+MFC
         ba6gzMxailIyS0PdaWWbecVvPUxrRaIMJv+J6W22tVvAoJ2F/dHCq35yI8JyR/uTAueQ
         PzoA==
X-Gm-Message-State: AOJu0YyEdR36AuVOfxZCyci3xsMop/VlS8lumtA6y80G3DdltoW345xt
	dY5luOle+Dxs6coZsONQ0VHN1lmsx3TpxV87
X-Google-Smtp-Source: AGHT+IGH4yc9AqjguvfFIqypBM95mfbk8HrcYp11a+yp95e0Lyx9YRubRBM7IEVa41C/UbLdgDN8lQ==
X-Received: by 2002:adf:ed8f:0:b0:317:60c9:e826 with SMTP id c15-20020adfed8f000000b0031760c9e826mr1216770wro.45.1692181254473;
        Wed, 16 Aug 2023 03:20:54 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 48/57] xen/riscv: add minimal stuff to asm/page.h to build full Xen
Date: Wed, 16 Aug 2023 13:20:01 +0300
Message-ID: <6337d25f0df323dc26c747ce8d07b77ccee07f2f.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
2.41.0


