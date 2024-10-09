Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3829996C89
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814531.1228114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syX0i-0005UW-Ic; Wed, 09 Oct 2024 13:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814531.1228114; Wed, 09 Oct 2024 13:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syX0i-0005P4-Eh; Wed, 09 Oct 2024 13:45:52 +0000
Received: by outflank-mailman (input) for mailman id 814531;
 Wed, 09 Oct 2024 13:45:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wKy=RF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syX0h-0005Gw-Lj
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:45:51 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb0bbab1-8644-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 15:45:49 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3e8a74so9244150a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 06:45:49 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e0598947sm5435334a12.11.2024.10.09.06.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 06:45:47 -0700 (PDT)
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
X-Inumbo-ID: cb0bbab1-8644-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728481549; x=1729086349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eKN+iZaDpNy8yOn7LaIk1Lnug9+dT93sjGvELvafAMY=;
        b=XSiyFcyRw7MPZ0zG4eDOTCV3nEzyALTa+OQO5xfybV/Wd9k8LFqPsDHNohbHsrRGJl
         KS8PAQZv+NfK71TGti6yXF2bv3hGZalTLhiFFz74DkQCKwQOrgksrMZCzVo6DiAE1ZSh
         8CmajU1XFJ1DkDQU6Mqc6LuJcRHbtX5n3xX2RgaL5XjW75xlxhjKrdXMihoTMWox/p0I
         RVWdiP1rC65vSdOURoKnT4d1KOt6s2l6gWkzDsqEmzP/9+9wofMD1dgU/2uWH0OqtAQ2
         OMkG7XAnEQr4ke97jb/1HdOtjKtURrziaZJcvoqOPo+kdHcFVavMBycAXhzH8QuUo/NT
         nGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728481549; x=1729086349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKN+iZaDpNy8yOn7LaIk1Lnug9+dT93sjGvELvafAMY=;
        b=mmHOcDHNsQhtxjxfW6M0gL50KxXevEIZ8oREE8gPIB+oDYvZVdQw/4M4kuriq/UuA9
         CcQOedRf8+EdpiwpZT8iQT3GpaP3DB3d/Trs6nWkkQXhOOL4AzPKk9Nh0hqKThKojtnq
         Id8rOToy38fFiFmz0NFvcCannd2ZQIDv+rnHLn6btp8VxzJc63ZeCOFosZw/IeuzW97O
         3U+CY2QH2LTV7RliLA2YWJvNdjFprolaFVSK6HL9GnxuOVRQdnCGtatPi0JLEo4v1SC2
         L0BGRC3o4vT/C3DvkQ0DO3gv+Vjw1TjFEIBi1BDqUvnwLIvhxtLS3dn0uDqVp4AQvl5y
         inPQ==
X-Gm-Message-State: AOJu0YyUPNkYsbERGZ2eAnGYadWdePJPyc+TVV1TM9WsahOACWvOHsWc
	sC+CoBvzquWBDO+4wsgrEkigH5WjkW3UWNuvoP4ODFyEjLJn0XAKONIjPQ==
X-Google-Smtp-Source: AGHT+IFFr1X0wG6rMgUWf8llcjPefsJc4bQAC4Pnrsp7GHMqAJvAqYBIqUr91an8k5hG50KpyBmKwA==
X-Received: by 2002:a05:6402:3582:b0:5c8:bb09:b417 with SMTP id 4fb4d7f45d1cf-5c91d4062bbmr1982190a12.0.1728481548326;
        Wed, 09 Oct 2024 06:45:48 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/3] xen/riscv: implement virt_to_maddr()
Date: Wed,  9 Oct 2024 15:45:39 +0200
Message-ID: <9f7d9ebde6fc7224490d1fd565676e051c57a80d.1728472163.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <cover.1728472163.git.oleksii.kurochko@gmail.com>
References: <cover.1728472163.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the virt_to_maddr() function to convert virtual addresses
to machine addresses. The function includes checks for valid address
ranges, specifically the direct mapping region (DIRECTMAP_VIRT_START)
and the Xen's Linkage (XEN_VIRT_START) region. If the virtual address
falls outside of these regions, an assertion will trigger.
To implement this, the phys_offset variable is made accessible
outside of riscv/mm.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Drop ASSERT(va >= (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)) as it is enough
   to have 'if (...)' for directmap region and ASSERT() for checking that
   virtual address is from Xen's linkage virtual space.
 - Add the comment above virt_to_maddr().
 - Update the commit message.
 - Add the comment for declaration and defoition of
   phys_offset: /* = load_start - XEN_VIRT_START */.
---
Changes in V2:
  - Drop casts in virt_to_maddr() for ASSERT which checks that VA is
    in the range of where Xen is located.
  - Add UL suffix for or XEN_VIRT_START by using _AC(..., UL) and add inclusion
    of <xen/const.h>
  - Add the comment above return which explains why there is no need
    to do " - XEN_VIRT_START.
---
 xen/arch/riscv/include/asm/config.h |  4 ++++
 xen/arch/riscv/include/asm/mm.h     | 22 +++++++++++++++++++++-
 xen/arch/riscv/mm.c                 |  2 +-
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index ef68281653..ad75871283 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -155,6 +155,10 @@
 
 #define IDENT_AREA_SIZE 64
 
+#ifndef __ASSEMBLY__
+extern unsigned long phys_offset; /* = load_start - XEN_VIRT_START */
+#endif
+
 #endif /* ASM__RISCV__CONFIG_H */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 5c79f3def3..ebb142502e 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -5,6 +5,7 @@
 
 #include <public/xen.h>
 #include <xen/bug.h>
+#include <xen/const.h>
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
 #include <xen/types.h>
@@ -28,7 +29,26 @@ static inline void *maddr_to_virt(paddr_t ma)
     return NULL;
 }
 
-#define virt_to_maddr(va) ({ BUG_ON("unimplemented"); 0; })
+/*
+ * virt_to_maddr() is expected to work with virtual addresses from either
+ * the directmap region or Xen's linkage (XEN_VIRT_START) region.
+ * Therefore, it is sufficient to check only these regions and assert if `va`
+ * is not within the directmap or Xen's linkage region.
+ */
+static inline unsigned long virt_to_maddr(unsigned long va)
+{
+    if ((va >= DIRECTMAP_VIRT_START) &&
+        (va < (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE)))
+        return directmapoff_to_maddr(va - DIRECTMAP_VIRT_START);
+
+    BUILD_BUG_ON(XEN_VIRT_SIZE != MB(2));
+    ASSERT((va >> (PAGETABLE_ORDER + PAGE_SHIFT)) ==
+           (_AC(XEN_VIRT_START, UL) >> (PAGETABLE_ORDER + PAGE_SHIFT)));
+
+    /* phys_offset = load_start - XEN_VIRT_START */
+    return phys_offset + va;
+}
+#define virt_to_maddr(va) virt_to_maddr((unsigned long)(va))
 
 /* Convert between Xen-heap virtual addresses and machine frame numbers. */
 #define __virt_to_mfn(va)  mfn_x(maddr_to_mfn(virt_to_maddr(va)))
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 4a628aef83..daa02b2c60 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -26,7 +26,7 @@ struct mmu_desc {
     pte_t *pgtbl_base;
 };
 
-static unsigned long __ro_after_init phys_offset;
+unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
 
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 #define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
-- 
2.46.2


