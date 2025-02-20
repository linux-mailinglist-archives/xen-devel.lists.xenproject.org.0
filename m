Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEC6A3E2D0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894048.1302885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAat-0004Py-11; Thu, 20 Feb 2025 17:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894048.1302885; Thu, 20 Feb 2025 17:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAas-0004Mz-SA; Thu, 20 Feb 2025 17:44:14 +0000
Received: by outflank-mailman (input) for mailman id 894048;
 Thu, 20 Feb 2025 17:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlAar-000469-5K
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:44:13 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b1abe36-efb2-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 18:44:11 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-30762598511so11430811fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 09:44:11 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091e04742esm24070201fa.86.2025.02.20.09.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 09:44:10 -0800 (PST)
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
X-Inumbo-ID: 4b1abe36-efb2-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073451; x=1740678251; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybdXdHkZSonOwKVvoIRin+PeqdKjeJlJeqR9NB1lb84=;
        b=VhhWodohb98C0g+oMPkj1NDuwwF3xyE0IBLoRf3rJM5C5YY7BS7kLm8J822/w3TQZx
         eNM+rdbCXiO32u4YGpYpRqvvIa0DDqCuGz7DFz2IRpEXG+sO/mEEnBkUzDANpXN7TKa1
         7zjthbui7n13uxuiwI65Ph8fXg4fLMTYkBXAW0jeiO1RySeH70TkysydhR8DfIFFpVCb
         SUpVIkDRcMGwytNvR0QWow/czMRjwRiNDtI3h1w432voeYgG3HDUi/nKyfX1ZsCzO0jN
         0CSnQuyCE2Qx0edG+An2k4Zjp/NYpn2ddnmPVcnfHPbjSsb4FM5VcInwQK/+ZABq09Iz
         P8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073451; x=1740678251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybdXdHkZSonOwKVvoIRin+PeqdKjeJlJeqR9NB1lb84=;
        b=fiqW2HzNcwCQyecmrP0zOUESrOX50JF0C23yYKOm9brqOnK9qRMRpD5M6Gj0ViAP2T
         hrr7fxqm9GeckhzmxdrpqGFFMM95/JQIWleDDszqXe2nxtcCoNxj3a9fTjWQTxJ1hMuS
         5AFjK4BfofCiIrxuFysfn+wupjEprPpqdpHX7njd80Wu+MZLOd5wJ+X05qNrZDkrGOUv
         9PvDGpebV8c/+Yzbt9AlbiBNfn8jslchGZeYmXp2ST71t25lQQFaQkmgLaVcLUERAeEO
         rgqEYsCsO34Lv9zL43pHno9Ec/1nDgFQ5w7VNLVkA4TYIP5s/M1YRjfxXYzj5zYFfAr3
         wBzg==
X-Gm-Message-State: AOJu0YznRk4vDcjEnwYyV+1CxkFNDdNC6Zsm5vW+FGDbDOZz4ifb7jac
	YikzerjBVh0JZGUjG+nEFv/9oBbDdpPchO+90rSTVOM3T9VxRZmDhVjNvg==
X-Gm-Gg: ASbGnctOltTsrAxYI20ZZOU1oGgW7UWk+oFA3iYzX/g2oSS35NPIXvXUlfUBVsBXYQH
	O3tWgnEp8eOVqu0KAkxNsJZhcpXkfIX+pCOW5CYAy5Py06VDgur4Cl1MQvMp/pVdnoHa0kfFyWc
	TwDrjgJLPCsn86lqa5zic875rZhRZneRGO8xVWOjAc58F4zgRVqKJ6FyfnFedN+iUUzpIvvyywx
	8XpRtoj7POcd/dW9uxkHyAFGAfzgC/pxW2enHlecyyIfkVKIv/B3pQogZ0xtWQQi+KWnC4xekiT
	l+E7+gH/iqal2tVf
X-Google-Smtp-Source: AGHT+IFN+dJukUyKnbfJ1cjzy20FIUJmAad9sYHU1BkEVAwGOqE2+TlxUi41homD+qzm7FoDp5srbw==
X-Received: by 2002:a2e:920d:0:b0:309:2ed:7331 with SMTP id 38308e7fff4ca-30a5990b1bbmr38541fa.18.1740073450526;
        Thu, 20 Feb 2025 09:44:10 -0800 (PST)
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
Subject: [PATCH for 4.21 v5 2/3] xen/riscv: update defintion of vmap_to_mfn()
Date: Thu, 20 Feb 2025 18:44:03 +0100
Message-ID: <2a7119b5276ae5ea5f237a67a25378ec0212462b.1739985805.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739985805.git.oleksii.kurochko@gmail.com>
References: <cover.1739985805.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA from
either the direct map region or Xen's linkage region (XEN_VIRT_START).
An assertion will occur if it is used with other regions, in particular for
the VMAP region.

Since RISC-V lacks a hardware feature to request the MMU to translate a VA to
a PA (as Arm does, for example), software page table walking (pt_walk()) is
used for the VMAP region to obtain the mfn from pte_t.

To avoid introduce a circular dependency between asm/mm.h and asm/page.h by
including each other, the static inline function  _vmap_to_mfn() is introduced
in asm/page.h, as it uses struct pte_t and pte_is_mapping() from asm/page.h.
_vmap_to_mfn() is then reused in the definition of vmap_to_mfn() macro in
asm/mm.h.

Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
- Minor code style fixes.
- Add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
- Convert _vmap_to_mfn() macro to static inline function.
- Update the commit message: change macro to static inline function for
  _vmap_to_mfn().
---
Changes in v3:
- Move vmap_to_mfn_ to asm/page.h to deal with circular dependency.
- Convert vmap_to_mfn_() to macros.
- Rename vmap_to_mfn_ to _vmap_to_mfn.
- Update _vmap_to_mfn() to work with pte_t instead of pte_t*.
- Add parentheses around va argument for macros vmap_to_mfn().
- Updated the commit message.
---
Changes in v2:
 - Update defintion of vmap_to_mfn() as pt_walk() now returns pte_t
   instead of paddr_t.
 - Update the commit message.
---
 xen/arch/riscv/include/asm/mm.h   | 2 +-
 xen/arch/riscv/include/asm/page.h | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 292aa48fc1..4035cd400a 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -23,7 +23,7 @@ extern vaddr_t directmap_virt_start;
 #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
 #define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
-#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)(va)))
+#define vmap_to_mfn(va)     _vmap_to_mfn((vaddr_t)(va))
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 static inline void *maddr_to_virt(paddr_t ma)
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 0439a1a9ee..bf8988f657 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -210,6 +210,15 @@ static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
 
 pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
 
+static inline mfn_t _vmap_to_mfn(vaddr_t va)
+{
+    pte_t entry = pt_walk(va, NULL);
+
+    BUG_ON(!pte_is_mapping(entry));
+
+    return mfn_from_pte(entry);
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__RISCV__PAGE_H */
-- 
2.48.1


