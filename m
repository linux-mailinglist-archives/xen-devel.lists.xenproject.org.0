Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE08A5F9FF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 16:32:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912514.1318805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY4-00017b-Kb; Thu, 13 Mar 2025 15:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912514.1318805; Thu, 13 Mar 2025 15:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tskY4-00014T-DW; Thu, 13 Mar 2025 15:32:40 +0000
Received: by outflank-mailman (input) for mailman id 912514;
 Thu, 13 Mar 2025 15:32:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3gq=WA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tskY2-0008Nv-EJ
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 15:32:38 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61e69c4f-0020-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 16:32:33 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ac2af2f15d1so159697266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 08:32:35 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac314aa5a7csm92778366b.179.2025.03.13.08.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 08:32:34 -0700 (PDT)
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
X-Inumbo-ID: 61e69c4f-0020-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741879954; x=1742484754; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxQEz2L+rAS29uG6w8hhOjnkgr3zrKSQWBxEvgdwtNw=;
        b=ppWqSMNGIsjVRGBehVaOaop8OcWDI18ZwG8Lzss+3p6KovtsRgCyMWBMy15aGZEWn1
         D/JE3N+gD3gj7h+dpDF+s1g10r8KjREA1uKHPWkccdCEG4KDCxc0nSt+F2+8479z+inn
         s9Kk/uZIdhT8L/3MRP/5Nv5BTjv6t/jwkCzd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741879954; x=1742484754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxQEz2L+rAS29uG6w8hhOjnkgr3zrKSQWBxEvgdwtNw=;
        b=fOLW3oIEwzdc35Z5vGHCWiyZS14wCXXeMfUo/n4/VM+T8Imk5sMcBiyFwYguBV5JXa
         h/UZw8XRqn7i/OCYudb8hCxrs/n5NEfkadVHOrtRNQJ0N/zGGGInqPnOFFEfCoUIrzbD
         219Q+tDFE8D+wQCwhkoZ0Fsy6LSKX+/JiIjfU7Ln2srr9KA2DQhU1T6Oy8e2Fvf3rtgY
         eAi8UBlLuBSu2AZbymp/n0Sh60HFxqsP5uo9+rB5uSPPzXgtBDcnfmcK4NqcU/VhRqh0
         i7Fh4gh8OkMtKpOVB+FAQ7vMGghKao3ojljU0ugnFIrHoSMlOOPYCz/w5aO+xJ2DCcbq
         2DDQ==
X-Gm-Message-State: AOJu0YxYjgT88O1rq9MmlCAffPNkYRExCbyPi4lmoabUJUflRda9EXJm
	DE/C6rxFS0dBIjaoU7phzXpEJdwH0Ur3RcnmhIYxkwWF5ECrn5FzQCsf/vd0OCIriqVdOL46Hly
	7
X-Gm-Gg: ASbGncsisSOzYgkEmq2D4245aWeiENTosCaQXqJ4nbloMdbCZEJYC4PsWqoSd9LFciM
	8smbOpEX2m9IJRYiNz0XA/ri56NuSx2hEIFTruQKnvz6rfQfq/XTFrGYaO45HJBDX2zLTyKVCpl
	+BPthzyZ1tmqWJkk5WvUPx7Tr9TRrsixHXNDA90NLMiCtOFRhocZRq7/DuJKsXdd68iaNaQ5kEi
	jrx0EGf68/kXs8fmT2A4kTWETzTR5AAtbtT7AD3592U3rK5mOn7MI6eaVT53DtsbtcsGz2WAwLn
	F+kSgDWBeJwURxpephrhzDyKy9tdGgW0FSky0LPrG04V6qDSUdJoqrEJAUP/
X-Google-Smtp-Source: AGHT+IFoBSbAfiuagyoHTygFOrP0LLqxreqoAAxy4q3gk+9V4N6Hs2DE4wTwgInSfSSLle6JNAc2WA==
X-Received: by 2002:a17:907:c10:b0:ac2:7cf9:71a1 with SMTP id a640c23a62f3a-ac2b9ea16d2mr1782623166b.41.1741879954302;
        Thu, 13 Mar 2025 08:32:34 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 6/7] x86/vga: fix mapping of the VGA text buffer
Date: Thu, 13 Mar 2025 16:30:28 +0100
Message-ID: <20250313153029.93347-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313153029.93347-1-roger.pau@citrix.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The call to ioremap_wc() in video_init() will always fail, because
video_init() is called ahead of vm_init_type(), and so the underlying
__vmap() call will fail to allocate the linear address space.

Fix by reverting to the previous behavior and using the directmap entries
in the low 1MB.  Note the VGA text buffer directmap entries are also
adjusted to map the VGA text buffer as WC instead of UC-.

Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/x86_64.S        | 10 +++++++---
 xen/arch/x86/include/asm/config.h |  5 +++++
 xen/drivers/video/vga.c           | 11 ++++++++---
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index 26b9d1c2df9a..07f4bdf46e31 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -84,15 +84,19 @@ ENTRY(__high_start)
 /*
  * Mapping of first 2 megabytes of memory. This is mapped with 4kB mappings
  * to avoid type conflicts with fixed-range MTRRs covering the lowest megabyte
- * of physical memory. In any case the VGA hole should be mapped with type UC.
+ * of physical memory. VGA hole should be mapped with type UC, with the
+ * exception of the text buffer that uses WC.
  * Uses 1x 4k page.
  */
 l1_directmap:
         pfn = 0
         .rept L1_PAGETABLE_ENTRIES
-        /* VGA hole (0xa0000-0xc0000) should be mapped UC-. */
-        .if pfn >= 0xa0 && pfn < 0xc0
+        /* VGA hole (0xa0000-0xb8000) should be mapped UC-. */
+        .if pfn >= 0xa0 && pfn < 0xb8
         .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_UCMINUS | _PAGE_GLOBAL | MAP_SMALL_PAGES
+        /* VGA text buffer (0xb80000-0xc0000) should be mapped WC. */
+        .elseif pfn >= 0xb8 && pfn < 0xc0
+        .quad (pfn << PAGE_SHIFT) | __PAGE_HYPERVISOR_WC | _PAGE_GLOBAL | MAP_SMALL_PAGES
         .else
         .quad (pfn << PAGE_SHIFT) | PAGE_HYPERVISOR_RWX | MAP_SMALL_PAGES
         .endif
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index 19746f956ec3..a455bfb0df65 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -208,6 +208,11 @@
 #endif
 #define DIRECTMAP_VIRT_END      (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)
 
+#define IS_DIRECTMAP_ADDR(x) ({                                         \
+    unsigned long addr = (unsigned long)(x);                            \
+    addr >= DIRECTMAP_VIRT_START && addr < DIRECTMAP_VIRT_END;          \
+})
+
 #ifndef __ASSEMBLY__
 
 #ifdef CONFIG_PV32
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index b4d018326128..704d00034658 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -70,9 +70,13 @@ void __init video_init(void)
     switch ( vga_console_info.video_type )
     {
     case XEN_VGATYPE_TEXT_MODE_3:
-        if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
-             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
+        if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) )
             return;
+        /*
+         * The first MB is always mapped, and the VGA text buffer uses the WC
+         * cache attribute.
+         */
+        video = __va(0xB8000);
         outw(0x200a, 0x3d4); /* disable cursor */
         columns = vga_console_info.u.text_mode_3.columns;
         lines   = vga_console_info.u.text_mode_3.rows;
@@ -158,7 +162,8 @@ void __init video_endboot(void)
         if ( !vgacon_keep )
         {
             memset(video, 0, columns * lines * 2);
-            iounmap(video);
+            /* VGA text buffer uses a directmap mapping, don't try to unmap. */
+            ASSERT(IS_DIRECTMAP_ADDR(video));
             video = ZERO_BLOCK_PTR;
         }
         break;
-- 
2.48.1


