Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B18A8053
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707312.1105188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AN-0002GR-Vx; Wed, 17 Apr 2024 10:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707312.1105188; Wed, 17 Apr 2024 10:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AN-00027n-Ik; Wed, 17 Apr 2024 10:05:23 +0000
Received: by outflank-mailman (input) for mailman id 707312;
 Wed, 17 Apr 2024 10:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2AL-0007lI-SW
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:21 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 003428eb-fca2-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 12:05:21 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-516d2b9cd69so6631302e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:21 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:20 -0700 (PDT)
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
X-Inumbo-ID: 003428eb-fca2-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348321; x=1713953121; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWUhP94yvcA6vU5jYmkYKwbyjJ+QxvIbXmFZAa4CYbo=;
        b=CJzJ0eBSiYQhxQuW8wlVD9GLDMOWfGdJI0gjX7+il9tppL2nbCxBXRu2uRo9kpwBXV
         L04l8cAir2u8t7aGtsUf3839YKM+RGp5lmkP/AYWOB67O0VbmuK5DllJ66u8oqSvHM3w
         +66p9ZyNegDKY5yrF4IO73+TIlwHwGOOfDFWuSBLs1ztta13Faq8hxnmpjLDwnSfNEAb
         hE32jHb1mEElXMFXmF+oPq1u7VqxV04lvV5bXZLA7MmP+UlteLgx1JL1yOdrhqQlYAfm
         JK+/7qi7Po2cxauKSF0GcEmEF1Fi/S597idja+4kgsi6MZdtc+tL8BY3oTK5F5h2TorL
         LkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348321; x=1713953121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWUhP94yvcA6vU5jYmkYKwbyjJ+QxvIbXmFZAa4CYbo=;
        b=lsaj6RkQbob+iU5SolpCf42hx4kQjl+K8sBzT7R2JjbaOncwojjGCPBgfcJN2d97qg
         nK8MyIqe3d5VDnJYoDMHeayiZB5IbVdAEKkpIM7R+ud58IIdTqxXRB/IaxHPrc1GQhFu
         pNrFOpKIB0e1kexQlAErwwt9WAn9+cr7z58r8fv6D4oURnsQJMxjOIv8M1/jsueO/asg
         oJk2CyB403RaFwdDQzponPA13dhipnVBgSq7maD9/FPQdSDZygMtlxzG+6mBaPnAM4CE
         VxWiLUeTY1PMPWIVdWewrZZvkb4dGCRqCGlepBidJx/Se6ON82x2BoUj9XUP3bVI4RAd
         1klw==
X-Gm-Message-State: AOJu0YyoU1aGC+FASvXUfjBjccDEEN3C+kI/8MDSfKkKms8cGKi0r8LE
	U10spTwO5lneSF5mTnf2BLk/E+UaidZyJSfs7bJZ49vH59qB0a96CPVsbA==
X-Google-Smtp-Source: AGHT+IGItd1Co/dnsTLPLrblG3pxMnQ+rY3gmxCzMZpWSytXlOcqxgjmCKgBDhK9mFtoXmAsfxoTGQ==
X-Received: by 2002:a19:6b03:0:b0:518:f8a6:9f42 with SMTP id d3-20020a196b03000000b00518f8a69f42mr4877242lfa.17.1713348320754;
        Wed, 17 Apr 2024 03:05:20 -0700 (PDT)
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
Subject: [PATCH v8 12/17] xen/riscv: add minimal stuff to page.h to build full Xen
Date: Wed, 17 Apr 2024 12:04:55 +0200
Message-ID: <ff889391c4fb968ae142aeb0fc8cacd25b910fc5.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V8:
 - Nothing changed. Only rebase.
---
Changes in V4:
---
 - Change message -> subject in "Changes in V3"
 - s/BUG/BUG_ON("...")
 - Do proper rebase ( pfn_to_paddr() and paddr_to_pfn() aren't removed ).
---
Changes in V3:
 - update the commit subject
 - add implemetation of PAGE_HYPERVISOR macros
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - drop definition of pfn_to_addr, and paddr_to_pfn in <asm/mm.h>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/page.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 95074e29b3..c831e16417 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -6,6 +6,7 @@
 #ifndef __ASSEMBLY__
 
 #include <xen/const.h>
+#include <xen/bug.h>
 #include <xen/types.h>
 
 #include <asm/mm.h>
@@ -32,6 +33,10 @@
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
+#define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
+
+#define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
+
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
 
@@ -62,6 +67,20 @@ static inline bool pte_is_valid(pte_t p)
     return p.pte & PTE_VALID;
 }
 
+static inline void invalidate_icache(void)
+{
+    BUG_ON("unimplemented");
+}
+
+#define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
+#define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
+
+/* TODO: Flush the dcache for an entire page. */
+static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
+{
+    BUG_ON("unimplemented");
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
-- 
2.44.0


