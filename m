Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0A39ED367
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 18:28:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855082.1268171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVK-0000Np-LY; Wed, 11 Dec 2024 17:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855082.1268171; Wed, 11 Dec 2024 17:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLQVK-0000Hk-Fo; Wed, 11 Dec 2024 17:28:06 +0000
Received: by outflank-mailman (input) for mailman id 855082;
 Wed, 11 Dec 2024 17:28:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntru=TE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tLQVI-0007JC-IC
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 17:28:04 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ee7ddc-b7e5-11ef-a0d5-8be0dac302b0;
 Wed, 11 Dec 2024 18:28:03 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5d414b8af7bso5464559a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Dec 2024 09:28:03 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6656f306csm687297466b.61.2024.12.11.09.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 09:28:01 -0800 (PST)
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
X-Inumbo-ID: 46ee7ddc-b7e5-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733938082; x=1734542882; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWSH1TKGIXYk6lQDxdJzHqmgxJre5HbeAcdBxlqmawo=;
        b=bIn+98zm0J/yFYjrIpqMMy46v6pFV9B4cHanHLY3VvosZYeIixM4PBYU1auRLjj2Tb
         2YomqT644EdOiyXGDoBOJFa4NlX5vm4NZBw+1lsoWHV61sc7SqydKTb3oR0STm++1JVd
         4R4UuDR7XlmkNQIFTsEjy+qc8c24lpgGCD9P0faPdyYdbtds8wJr1Wx012dVRGkTPKTi
         mTGmw0HFhPrWj8ARfLiPtZpwNGooR/7bxNAs20kw3NrBipmVRK8NWSQ2+eOhzPiSEo4y
         8DPj5EOh4enRc3eCLaWPDXSvV3Qxsv212Oaf3KQwlhVMsWZkzgMfXYCtIMVjKvLn70oI
         Opxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733938082; x=1734542882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWSH1TKGIXYk6lQDxdJzHqmgxJre5HbeAcdBxlqmawo=;
        b=BUcL4Ru6uWFdd8s8UGNi+074uqChOD4Ag6+b/sqU4frpOjzPtH0dkd9yyXKOGyxs2j
         W35Q0LW7/Dd6WON37S9Q1j5AwJMkC7737B42WFbmV/OewYesIBGczO+Q4J7vLhZQVeVT
         7Nu5bQFHzSx4J3HVlGH0JTyfYA9RBITnUC83hIDvnyfqUaHXukThxfnBItkjFi/PjyuJ
         oeqQXgbrZq363m42e/hZJEAThyybM5hLUBRVaDo05D4exAaJaIYklMDpUQB11hHNKqF6
         MnrELNoSrQ/9H2feUpRNUiZKIpWkxksg0WylCYEdvRG2Bh5oOPeOrhDySVqC7hw47M+Z
         V1FA==
X-Gm-Message-State: AOJu0YySMl6+ZwY4l6vur2D3+rKUFX9T8fveKZsOPLfhB8D7rF+8tp29
	0dtY/Da9OyXLJ/IKLxRIZ+NnIV5FRfc8sLy+b1Ez/dreh8JaagcKhwY0LLSN
X-Gm-Gg: ASbGncsh3fjWREjcexLpcPzSLAMHLQY8UclW2CHGiuv/HBQMZPM3o1O9xEhd67j42Wz
	n8byqHrLoT2ptGU5m7Z1TW0Q/V51GDLq2qimWkPe5AnavegYlJ9/ndznba03P5uUZaruwLvwCBb
	lYAkN93mamThxSJXYzyorQDai25iJQWmplaCNjocuB/VXR+TS50kJiVn0OOyvp12Azo0PQHi9CB
	nGXIcFioJSxGidwDKiL4KO5xA/5AObAtwJYiLIgMAnGZfgVh2X3Dq4=
X-Google-Smtp-Source: AGHT+IHbe07tD/GOgdxTxM0a2FBOELv2ZPSnPlzQYVX0S7GWmyenULQ+sfEkyhmENBGKMEnz6YDsVg==
X-Received: by 2002:a17:906:3182:b0:aa6:ac9b:6824 with SMTP id a640c23a62f3a-aa6c1ae4bbemr65539266b.5.1733938081636;
        Wed, 11 Dec 2024 09:28:01 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 6/7] xen/riscv: implement prereq for DTB relocation
Date: Wed, 11 Dec 2024 18:27:50 +0100
Message-ID: <2d2d6ca32aa7db490d47154530f01216651ba335.1733937787.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733937787.git.oleksii.kurochko@gmail.com>
References: <cover.1733937787.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTB relocatin in Xen heap requires the following functions which are
introduced in current patch:
- xvmalloc_array()
- copy_from_paddr()

For internal use of xvmalloc, the functions flush_page_to_ram() and
virt_to_page() are introduced. virt_to_page() is also required for
free_xenheap_pages().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Drop variable directmap_virt_end.
 - Update ASSERT in virt_to_page() to use DIRECTMAP_VIRT_END instead of
   variable directmap_virt_end.
 - Declare local varibale v as const inside flush_page_to_ram().
 - Declare copy_from_paddr() in riscv/setup.h as in the future it will be
   used for copying kernel in guest memory.
 - Code style updates for copy_from_paddr().
 - Make l and s variable in copy_from_paddr() as the virables' initializers.
 - Drop call of clean_dcache_va_range(dst, l) in copy_from_paddr() as the
   necessiry of it is Arm-specific:
     After memcpy'ing the kernel in guest memory Arm need to flush the dcache
     to make sure that the data actually reaches the memory before we start
     executing guest code with caches disabled.
   RISC-V has caches always enabled thereby there is no such issue for RISC-V.
 - Make local variable src in copy_from_paddr() as const.
 - Update the commit message and subject: drop information of relocate_fdt()
   introduction and rename it to "prereq for DTB relocation".
 - Add BUG_ON() inside flush_page_to_ram() to check the return value of
   clean_and_invalidate_dcache_va_range().
 - Move relocate_fdt() introduction to the next patch to make this patch
   compilable.
---
 xen/arch/riscv/include/asm/mm.h    |  8 ++++++--
 xen/arch/riscv/include/asm/page.h  | 11 +++++++++--
 xen/arch/riscv/include/asm/setup.h |  4 ++++
 xen/arch/riscv/setup.c             | 26 ++++++++++++++++++++++++++
 4 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 699ed23f0d..292aa48fc1 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -8,6 +8,7 @@
 #include <xen/const.h>
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
+#include <xen/pfn.h>
 #include <xen/types.h>
 
 #include <asm/page-bits.h>
@@ -148,8 +149,11 @@ static inline void *page_to_virt(const struct page_info *pg)
 /* Convert between Xen-heap virtual addresses and page-info structures. */
 static inline struct page_info *virt_to_page(const void *v)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    unsigned long va = (unsigned long)v;
+
+    ASSERT((va >= DIRECTMAP_VIRT_START) && (va <= DIRECTMAP_VIRT_END));
+
+    return frametable_virt_start + PFN_DOWN(va - directmap_virt_start);
 }
 
 /*
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 54c6fe6515..fbb35a6673 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -7,6 +7,7 @@
 
 #include <xen/bug.h>
 #include <xen/const.h>
+#include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/types.h>
 
@@ -175,10 +176,16 @@ static inline void invalidate_icache(void)
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
-/* TODO: Flush the dcache for an entire page. */
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
-    BUG_ON("unimplemented");
+    const void *v = map_domain_page(_mfn(mfn));
+
+    BUG_ON(clean_and_invalidate_dcache_va_range(v, PAGE_SIZE));
+
+    unmap_domain_page(v);
+
+    if ( sync_icache )
+        invalidate_icache();
 }
 
 /* Write a pagetable entry. */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 844a2f0ef1..c9d69cdf51 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -3,10 +3,14 @@
 #ifndef ASM__RISCV__SETUP_H
 #define ASM__RISCV__SETUP_H
 
+#include <xen/types.h>
+
 #define max_init_domid (0)
 
 void setup_mm(void);
 
+void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
+
 #endif /* ASM__RISCV__SETUP_H */
 
 /*
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 9680332fee..bea3f27c4d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -12,6 +12,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/fixmap.h>
 #include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
@@ -26,6 +27,31 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+/**
+ * copy_from_paddr - copy data from a physical address
+ * @dst: destination virtual address
+ * @paddr: source physical address
+ * @len: length to copy
+ */
+void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
+{
+    const void *src = (void *)FIXMAP_ADDR(FIX_MISC);
+
+    while ( len )
+    {
+        unsigned long s = paddr & (PAGE_SIZE - 1);
+        unsigned long l = min(PAGE_SIZE - s, len);
+
+        set_fixmap(FIX_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_RW);
+        memcpy(dst, src + s, l);
+        clear_fixmap(FIX_MISC);
+
+        paddr += l;
+        dst += l;
+        len -= l;
+    }
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
-- 
2.47.1


