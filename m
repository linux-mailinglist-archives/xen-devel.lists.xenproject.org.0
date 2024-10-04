Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CDC990874
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 18:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810516.1223208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swknO-0005hQ-22; Fri, 04 Oct 2024 16:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810516.1223208; Fri, 04 Oct 2024 16:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swknN-0005cZ-Sd; Fri, 04 Oct 2024 16:04:45 +0000
Received: by outflank-mailman (input) for mailman id 810516;
 Fri, 04 Oct 2024 16:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgwL=RA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1swknM-0005bD-V2
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 16:04:44 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e7a90fc-826a-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 18:04:43 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d6d0fe021so375249366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 09:04:43 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5c3c8fsm10040166b.3.2024.10.04.09.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 09:04:42 -0700 (PDT)
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
X-Inumbo-ID: 5e7a90fc-826a-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728057883; x=1728662683; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdM3rVoapplxeHku40PfEDhlvEAoP8or8VBCiItUFOc=;
        b=CkyNdKzM/VnFOel8c/5b6ET+cs1sOeb4SFdTj6a1zDZkSbSZzZrcSqFzzdTtd8H7uL
         1d/JIhwDZKN82LogP0kXuwZR8Q4jijkKtbDrB7+hOVLm8AsTBwce5pWCcGNRI5osW5zl
         FTNOvk3aLAdgZNUcqze/tti8O4df7C3Nk112Cni3EUBQwpHenkblB546zGZjIWv/7mLE
         +ZCjco1ZJ5loDaHx+Zrgp04AfNpfzQYyR/5s+RiwjHb68Tw8C2Z4/ZeO2bPgwR0Fxuf/
         tZ4EFLJ7XZ/Ci0vrZYoFo9K6mvQcfEcdjtybM1EdvQ77FivRWH73KC62MZJ1a41EA6kF
         C8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728057883; x=1728662683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdM3rVoapplxeHku40PfEDhlvEAoP8or8VBCiItUFOc=;
        b=OmUNwvkaP9ysCua4oDWDU+Uj24ViCsPvU0MCzu9tTLiY3SnM2egHGOh3T9zQ3I+NsX
         BxpFM2kdYsUuLk7y4slBM+CNmGAu4laU2evyn/OcNJr8e3HymOnIannwd9BIGo+dOuVm
         MSGppURtm0fG4LoCnUNhXu4vjSm7Hxa9CJ1ePCKzdX10hYSpjUNouh3hC8mcyjzAZnio
         SvihTkYYA3PWSIedi7B6Z7+8KJs+ojObvShwCfSPL1YSJmjlQu49gq7imWlTl288dBi1
         31aBGBarVVQ6uU2scPQKYfW5H9jv7FzDozkhLOnUqxDVsUnBmnC4jzKqiaJ2u9cnlqjR
         k1Yw==
X-Gm-Message-State: AOJu0YwrZUt9jtm7HMoiVW04c9REiJWdA/Vfzcx2g4rBEWaiNKg5oBbO
	bR9O01tISMQ8vrywqPzpc+fzEhtUNRvl3o1uVemh8eD0ylDe7MyuEDy9HA==
X-Google-Smtp-Source: AGHT+IE++eGydoiKYdy+iIjJIslZ+fal52kCcQO0wvQi82zmiSnq0kh3OJ0mvrKPWReqFBzFK7D02A==
X-Received: by 2002:a17:906:6a20:b0:a8d:51a7:d5e8 with SMTP id a640c23a62f3a-a991bd09b15mr370159466b.15.1728057882579;
        Fri, 04 Oct 2024 09:04:42 -0700 (PDT)
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
Subject: [PATCH v2 1/3] xen/riscv: implement virt_to_maddr()
Date: Fri,  4 Oct 2024 18:04:35 +0200
Message-ID: <25a0fa030db90c929379a799aa5e03bed0197665.1728057657.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <cover.1728057657.git.oleksii.kurochko@gmail.com>
References: <cover.1728057657.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the virt_to_maddr() function to convert virtual addresses
to machine addresses, including checks for address ranges such as
the direct mapping area (DIRECTMAP_VIRT_START) and the Xen virtual
address space. To implement this, the phys_offset variable is made
accessible outside of riscv/mm.c.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/mm.h     | 17 ++++++++++++++++-
 xen/arch/riscv/mm.c                 |  2 +-
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 7dbb235685..8884aeab16 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -155,6 +155,10 @@
 
 #define IDENT_AREA_SIZE 64
 
+#ifndef __ASSEMBLY__
+extern unsigned long phys_offset;
+#endif
+
 #endif /* __RISCV_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 4b7b00b850..0f7879d685 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -5,6 +5,7 @@
 
 #include <public/xen.h>
 #include <xen/bug.h>
+#include <xen/const.h>
 #include <xen/mm-frame.h>
 #include <xen/pdx.h>
 #include <xen/types.h>
@@ -28,7 +29,21 @@ static inline void *maddr_to_virt(paddr_t ma)
     return NULL;
 }
 
-#define virt_to_maddr(va) ({ BUG_ON("unimplemented"); 0; })
+static inline unsigned long virt_to_maddr(unsigned long va)
+{
+    ASSERT(va >= (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE));
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
index 4a628aef83..7a1919e07e 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -26,7 +26,7 @@ struct mmu_desc {
     pte_t *pgtbl_base;
 };
 
-static unsigned long __ro_after_init phys_offset;
+unsigned long __ro_after_init phys_offset;
 
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
 #define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
-- 
2.46.2


