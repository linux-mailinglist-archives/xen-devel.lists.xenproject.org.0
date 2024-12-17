Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827C99F511D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859440.1271613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVN-0002Zv-6Z; Tue, 17 Dec 2024 16:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859440.1271613; Tue, 17 Dec 2024 16:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaVN-0002Oh-1I; Tue, 17 Dec 2024 16:33:05 +0000
Received: by outflank-mailman (input) for mailman id 859440;
 Tue, 17 Dec 2024 16:33:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BizT=TK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tNaVL-0001JJ-SL
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:33:03 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95d0d1b0-bc94-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 17:33:02 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3003e203acaso52209231fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:33:02 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344175b51sm13179021fa.69.2024.12.17.08.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 08:33:01 -0800 (PST)
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
X-Inumbo-ID: 95d0d1b0-bc94-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734453182; x=1735057982; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zJCydD52IvfuBY2R8KEd3EZvy2mjVloYZmx2VGVw6o=;
        b=fYCxt9PuTSXdm2ieCmnG7j8tTmCF+vL5P5UQYnz/TuejqawGQe4QKLE9/pSHAXkPdq
         dhOGFAGA9wTE2lYyxGXYrygA+qKgAT5orE5erkRJHosyLXPUs9DHx9IfQHrbRp0pLaLm
         rluM+SrD6LiLtB0Y8yaqqxG7U/P4dUCy6E04/HrECk0J3f3nF1dn5mPQACHZpvQACMQ2
         aWROD8hTsS9elOJe+iiG3mTauUPLrxfeW1+QKTDFBLsgGxPJEyomEejpD0uiYqcLAOq3
         OLBj+x1tG59alVcq9RpNpdem2guXi9VMqs8ghKYOmrFjMWQZLagxYGmA8ty0pHL4dUql
         GF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734453182; x=1735057982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zJCydD52IvfuBY2R8KEd3EZvy2mjVloYZmx2VGVw6o=;
        b=KAuVcuhJPPz3+v+DnZVeKJHU/AmtPRwbs2/BVHm60StR5HhAbInZgBOAihkyHos0F9
         TxAmZhUVaczvgX8DoIE0lZXfS0E0Jv9JxbLzV2bEyp1o6iCpepOrWbr2BhLtKW2QJ9GB
         Y//by6ozDmqLqEiArF9yRK9IN2orFs/k57Hk3nk2NT/oh1guv85LF+Zysh0FF4InGLOj
         Mru2KALbr88ZfQupZc6RWqeLxFC9/orQfjZ7ZRYH2dEfeFiL8QkoMQu0osU7RGrEzp27
         mkZUXmVsJLh5COrxYNoDWbTKmx973aG9UMx0t0SW4A2OTtZnOXC54RK89m2/+sLhXtfO
         VpzA==
X-Gm-Message-State: AOJu0Yw6K3U/Z1Q1Llkj0mKYls30FKECtP4XOPzrrU4DIqnA4zJMtokm
	t9iUT2cpqOb3sx6cUYRy7/44wAflNTx6jDkUzqAhLJqq8a+Afrt77ZjDFlLj
X-Gm-Gg: ASbGncvNZPUKPV0+gZt1YESqnAPHgQXjDDQNaIvVEAAafASannXXNzlSgKVhVfHiAUD
	6J9Hm3f9EbUIA6gQuX9HY1hzwDo+kIk4z4fIkE5FWV2ZtuCh1CYm0IINxduvq5yzBoveImLadI5
	4ymTtRsrJI5g8NEfQbJaBqjipTmnprhZhjrjESKPgWG0Uw6tKITeOtmL1vZHYLC/txE/QkNKQ+o
	5YRW1DL5X55dIbQCRsnTQuHP7iPjjQfrZfg5NfPwPr7WzMoZOURpGCqJQ==
X-Google-Smtp-Source: AGHT+IF/ywl5xmKCF/65QK9oCKKp8PnV+GsZVobG5aeoL61ppmef5h+bMXlo/IeRwhN0Kd+YKjaK8A==
X-Received: by 2002:a2e:a541:0:b0:300:15f1:cd5c with SMTP id 38308e7fff4ca-3044d063c32mr479601fa.17.1734453181771;
        Tue, 17 Dec 2024 08:33:01 -0800 (PST)
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
Subject: [PATCH v3 6/7] xen/riscv: implement prereq for DTB relocation
Date: Tue, 17 Dec 2024 17:32:50 +0100
Message-ID: <79b7e0a4938e4be1f37d209ce01c859e5c208429.1734452721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1734452721.git.oleksii.kurochko@gmail.com>
References: <cover.1734452721.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Rewrite part of flush_page_to_ram() to use BUG() instead of BUG_ON().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
 xen/arch/riscv/include/asm/page.h  | 12 ++++++++++--
 xen/arch/riscv/include/asm/setup.h |  4 ++++
 xen/arch/riscv/setup.c             | 26 ++++++++++++++++++++++++++
 4 files changed, 46 insertions(+), 4 deletions(-)

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
index c82432dc67..a1d54c7fb1 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -7,6 +7,7 @@
 
 #include <xen/bug.h>
 #include <xen/const.h>
+#include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/types.h>
 
@@ -176,10 +177,17 @@ static inline void invalidate_icache(void)
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
-/* TODO: Flush the dcache for an entire page. */
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
-    BUG_ON("unimplemented");
+    const void *v = map_domain_page(_mfn(mfn));
+
+    if ( clean_and_invalidate_dcache_va_range(v, PAGE_SIZE) )
+        BUG();
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


