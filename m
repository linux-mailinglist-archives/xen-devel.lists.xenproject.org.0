Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FB5A32C63
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 17:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886619.1296301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwM-0000jU-OA; Wed, 12 Feb 2025 16:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886619.1296301; Wed, 12 Feb 2025 16:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiFwM-0000cF-Jt; Wed, 12 Feb 2025 16:50:22 +0000
Received: by outflank-mailman (input) for mailman id 886619;
 Wed, 12 Feb 2025 16:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeD=VD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tiFwL-0007h7-JA
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 16:50:21 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71b25ebd-e961-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 17:50:20 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5450cf0cb07so2977493e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2025 08:50:20 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54504fc26b3sm1409118e87.44.2025.02.12.08.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 08:50:18 -0800 (PST)
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
X-Inumbo-ID: 71b25ebd-e961-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739379019; x=1739983819; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+n6oADRrQ8i7LaTPgH/X75bMuImDuCw7dC3gadSd7I=;
        b=CBJOxyWofPS1A6jr1CyfmlREaOPPY2AalyaFdEFPDPn3jrTtQYKeUsdXpa0WcrKMYP
         y8V0AX73HndYzsn8SJMh04Mae9QKR1gcw7PnIdUooV/4ktQhzsUHiQP54Y3on54smoxH
         AJmxRJEUOzDI8e40jzdA1erf5Jyxc8KLmDroIpQUjFTxjH3/M84C3Wgkaiu6zRt1JyOh
         M5t3ErVtz4CKVkXK/a23gd9qu66C4nnOQg6KcHCXF3+sebSgHfj8M8sPYAff+cGK9SR5
         aBWEyQprJXm+seu5wxNkQ11Ct/hcBXYDZfXoP676V+LA/788vwrV2GG9Q1VAtswM47Jn
         xVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379019; x=1739983819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+n6oADRrQ8i7LaTPgH/X75bMuImDuCw7dC3gadSd7I=;
        b=cgOPK+ba7Cyi1aMaVZD0RVDW/3xOyQnxurf/Sqle2Z5BAcZ5qQa1bdVoLRzKDjmIOK
         QXTN4xKEwuAw6hBVA7AuzIzkBdaI1yatx8E99GiWl8FVbjhQG9X69CwZTjcsek7MfhSJ
         cxhZrQ57Nx/ucne7NkXxHJZ9hldzgNEBejT022+9IbTsCM7FiRycNdkLlDIGRJV8OMJm
         ZHmRoc3SVpVKFwQ+azBvwEqJ7U816xsM9sF5six+X8QN3bh+qMJolCHe9ACK5Q0X8CxL
         S5sojnqO1n5ersa1jHJaamPsxxzaAVqAcGDa0X3go1xx8OsOHqXB86Y5ZLbzHoIurldm
         V35g==
X-Gm-Message-State: AOJu0YwTxrdZ0jx9uUczCk2UyxdZVvYa5HdR2cb4l67zZ6u/F5yknaQq
	g0Dvjqhv3vOpnvkUazkFrXD9Ov9CXr15tselDwHlLJ8yRti6un7EHcEfMg==
X-Gm-Gg: ASbGncvKQtheqW/cik5Yc/+pm93nGETCJALFWcYcDssr1JRAC/EquKX3TVBPDsgqCB5
	5pBsKG/xJrP84z8PDzBpynPtawt1MY5tPslwujR/U6lodhUVIFPcT8UoWEpiMKyVKj3++RrhomJ
	gmQmBwir2v1u2PSoWwDle1wHL3XK5qzdEYOQv11kt0rlijD/FZ5nShGHP7mpe429YzrLiD/f7z2
	gYLVWdPgjoikLLJZaNgaK3QMTn21mELNWD+rwe+oXTHJhJRvWsVanFPFVvA7WZi7hxq0sZVuJR5
	l2dzYfYeMoO0vHgu
X-Google-Smtp-Source: AGHT+IEWO5cM5QRrUrpjHA5E/Edd6WQtBeoKODdO/q2MX6j1JVPB///ibyED7OqqoxrImtU0BsfEpQ==
X-Received: by 2002:a05:6512:2394:b0:545:e2e:843f with SMTP id 2adb3069b0e04-5451810bd21mr1224552e87.13.1739379018619;
        Wed, 12 Feb 2025 08:50:18 -0800 (PST)
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
Subject: [PATCH for 4.20? v4 2/3] xen/riscv: update defintion of vmap_to_mfn()
Date: Wed, 12 Feb 2025 17:50:12 +0100
Message-ID: <aba5cd4c47cc7d9be55fd255b5b60664b6a0ddf6.1739363240.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739363240.git.oleksii.kurochko@gmail.com>
References: <cover.1739363240.git.oleksii.kurochko@gmail.com>
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
index 0439a1a9ee..6ed570b478 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -210,6 +210,13 @@ static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
 
 pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
 
+static inline mfn_t _vmap_to_mfn(vaddr_t va)
+{
+    pte_t entry = pt_walk(va, NULL);
+    BUG_ON(!pte_is_mapping(entry));
+    return mfn_from_pte(entry);
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__RISCV__PAGE_H */
-- 
2.48.1


