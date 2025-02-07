Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BEDA2C352
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 14:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883669.1293615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgOAj-0008Ua-F2; Fri, 07 Feb 2025 13:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883669.1293615; Fri, 07 Feb 2025 13:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgOAj-0008Rl-Ae; Fri, 07 Feb 2025 13:13:29 +0000
Received: by outflank-mailman (input) for mailman id 883669;
 Fri, 07 Feb 2025 13:13:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgOAh-0007zQ-Ql
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 13:13:27 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c246e6-e555-11ef-b3ef-695165c68f79;
 Fri, 07 Feb 2025 14:13:26 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ab7863f9be4so147456366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 05:13:26 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab794d96481sm19759666b.154.2025.02.07.05.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 05:13:24 -0800 (PST)
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
X-Inumbo-ID: 50c246e6-e555-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738934005; x=1739538805; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6S7rv1+g9kWmePQjMAU+cpTs40VSzh9W30YDrUGNa4g=;
        b=MHsWwvnPNrWxBdfFeCtk+4Zd8SndSqu1HmzdRr81zGOanQ6rr+O2xvN0UqzFtFLC17
         T6hk5FqYtmaJ5jA/4q1xA5CYV2RrBKfZZVg5BlWppfKUnl7UWBwDHo2crMpW7LCrjjVq
         o2PkOzydbZsXRvRlr4TlzF/t3y06ok6u3qEVEFbQNOT+n7AvCplM5DSfjxs6W3Ubd8Oi
         4ieOfDkGMSsYQMI0mwTOUn6e/JOscs5VFQJMfnY6lWEnH4vvGyIeu7XWzfCpOWSsbd43
         HHNOYqQ94D7OgKxbD9vUtkj8/PVtP3QfRt/w1heOiWMm1bvHEDkjyc5I271kXSIbo4rA
         NH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738934005; x=1739538805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6S7rv1+g9kWmePQjMAU+cpTs40VSzh9W30YDrUGNa4g=;
        b=AIJ1oxF4ICKLEI+e0TZHyqlr4kDIXwYKMBLPapwMVuOguwZB8y0540Ez8ZRHf7Gplv
         T1/Uu91oo4EowD19ErqgCS9AstGrDcB+LHGOfJqkFthVtDMu9ZQTtUNs74OPP0sqSAq+
         d/0C0090owKNnl5nMjk7N2xe2F/H+V8wxlQ8cZrRynX82hZy2RMVcAtaVGEOY2JxJbg4
         1h+43li3pZVuhblnNcqI92t0i9FYSG/1ye/8RfQnJqDf2+v8q7fnxZV6pgiuLiSpsTEy
         nK3J6XRXC1h+NGA5toxPw4+QemxCSpyWV44xUusku42WOY5poorblyf+XOMLbu4WPAEa
         7EbA==
X-Gm-Message-State: AOJu0Yy0Of5G38GLsA4J/jJnTmqacb8T5S7Ihcf+lvB5reU3cgD/jG9P
	mCwBrLt5xzMF+7wwTqlsedO1XgicKDXFB54NzTNu39tAhH46Gq7X27Uffg==
X-Gm-Gg: ASbGnctBOYl71j9fyKrMvYBbt5wtfXWou5YWQugEGZB1njqAzMkKZWZZLVH++I/usWv
	2J1SHUgRUVK3dYXMRWgRefHvbI8DRNTTrpRlzaf+dVaIJIsOZWFP1GMqddQIMwpsF9+swJVoWxe
	GhKeVH8OQFCyFqlswcVANwpPjJ/ZvuyyJOVXGP1ixygCEsQFoW7lMZZJ3/5g9gJRKY2Js7Z9Wmr
	+DkgSCScWtqgeR0TVKMtAI7JRCOVrxm0ZAgCyTNqDOo6XRTJrzeTVQhnbPVsJY9NH/U/LwQ5Qi4
	P71PvbsjwuHfp1IR
X-Google-Smtp-Source: AGHT+IFj8+HgH9ZAREu7qORlg77JOwZIHKr/y7Jkbi7+Mh90LJ63cr1DZgJ2s9y4AftbZaCaleqliw==
X-Received: by 2002:a17:907:9803:b0:ab7:6bb3:b14b with SMTP id a640c23a62f3a-ab789aed81emr314279666b.30.1738934005255;
        Fri, 07 Feb 2025 05:13:25 -0800 (PST)
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
Subject: [PATCH for 4.20? v3 2/3] xen/riscv: update defintion of vmap_to_mfn()
Date: Fri,  7 Feb 2025 14:13:19 +0100
Message-ID: <bbea545c2ca25f5e827e4d3b4cb2466478791480.1738933678.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738933678.git.oleksii.kurochko@gmail.com>
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
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
including each other, the macro _vmap_to_mfn() is introduced in asm/page.h,
as it uses struct pte_t and pte_is_mapping() from asm/page.h. _vmap_to_mfn()
macro is then reused in the definition of vmap_to_mfn() macro in asm/mm.h.

Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/page.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

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
index 0439a1a9ee..18ba0dd9df 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -210,6 +210,13 @@ static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
 
 pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
 
+#define _vmap_to_mfn(va)                \
+({                                      \
+    pte_t entry = pt_walk((va), NULL);  \
+    BUG_ON(!pte_is_mapping(entry));     \
+    mfn_from_pte(entry);                \
+})
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__RISCV__PAGE_H */
-- 
2.48.1


