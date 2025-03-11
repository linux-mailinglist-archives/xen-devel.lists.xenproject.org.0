Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD55A5D176
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:13:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909301.1316327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uH-0001Zm-2X; Tue, 11 Mar 2025 21:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909301.1316327; Tue, 11 Mar 2025 21:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6uG-0001XB-Rz; Tue, 11 Mar 2025 21:12:56 +0000
Received: by outflank-mailman (input) for mailman id 909301;
 Tue, 11 Mar 2025 21:12:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=isYZ=V6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ts6uF-0008Uq-Eb
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:12:55 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 995413d1-febd-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 22:12:54 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so1463345e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 14:12:54 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfba9sm19480872f8f.39.2025.03.11.14.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 14:12:53 -0700 (PDT)
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
X-Inumbo-ID: 995413d1-febd-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741727574; x=1742332374; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAtTpo8KH5ZdCgDPrWpHEeo3BLVM30dQttgId7v1Tq0=;
        b=p8OjYOowWQgfPjVC0rfrPG4rSUM1ul8Qwv8SixxBguaUSx9ifZaSvyTQLQ6Jf3jDo0
         35mVXhP1oqJVqQQ/lf/jKT6p5IutAs+Crg4uSsChPbRCndlxsLECakcNUZ8c9/IkFmrU
         8oZ1QDOnnqhy/1XG9m5D7j8+Yr1Qpc2KSyzOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741727574; x=1742332374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAtTpo8KH5ZdCgDPrWpHEeo3BLVM30dQttgId7v1Tq0=;
        b=e3TFIiS0l6vYdCNSjrXrzUnE1w48jvOMqGbVThYpWPReNQRQbns6VTP0EqMoyTmS+7
         IEu72sG7PD4mtpsfDQL2P636lR4WDSQFx+pd6HmuiUjggnAqusKkoj0Bc/QOd8v6CkN5
         y/8XTe70ILc4LdntDX4FH/ILj15S/NDs02Nq8yAWtguNPYvFvym8+ApW/oJOAslytgKO
         1AhvMdq6rASWvkE8LMVYs+uySJw8rnRSbhucJXreVHj4Tk5yFFPvgsQJrL7LuXBBqOnb
         pPASFVPIjfdZ2QhN0S2yXQGWx3eWKt44T3o2ya+rlMn+D0TgmhXTDqGgx1bbLhHX86Rw
         mmTA==
X-Gm-Message-State: AOJu0YyvUr8y2cuYgdO3gvAF6pdwq/y9DbaUXZHu20hUUju+NJB3KXvd
	Tvqmy7FoKzTSkA3xFggZAK3rGy2hvBwCsxB8BnRQr49iHq3Uhu6mzVw8kvpAKMxxZk5Pm1b8Ob4
	n
X-Gm-Gg: ASbGncsFXvYs9cPCu6kfYa/EvfRqSWROBiT5U+leF7sYqmWyem58e3rWnhHv/twMZra
	X7HqXGpJnVWrdYtqINEoB25rZDPBjuGnq29hZyU4QjlpgtyDXnodpW1j56FVPRgjy7XaZEm19Rf
	WAhiryLtQBJbFe57tcO1ECZ1rYtaIijxZJaoCqPkRBKR0mkGuXfPROzFWrYnfT8t0ufMEDfavjL
	MBmsRVl2tNv+6WPfDbByeMyw2EFVP692a/8PldMnsBxKcDU09VQPKYBBU+rby+7l8c8mI8s7CDc
	ZOUsDLn1El2plHwgaR2DdtG4pMJEMvkXx3WL+ImFGoQUhIZvV9g0pe5YmrwXndewMZvnqvWNFAK
	VTTkSt8xFx4NhOsdCWaPNUgyc
X-Google-Smtp-Source: AGHT+IHsWfSRfuAMivDIwLvlJJIaz7ykB32KoN0VA83oPOE7JV3fL2q8AIh/7qFxYjs79LGwjeHuaA==
X-Received: by 2002:a5d:5f82:0:b0:38d:b12f:60d1 with SMTP id ffacd0b85a97d-3926d5ef561mr5495427f8f.26.1741727574005;
        Tue, 11 Mar 2025 14:12:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 7/8] x86/public: Split the struct cpu_user_regs type
Date: Tue, 11 Mar 2025 21:10:42 +0000
Message-Id: <20250311211043.3629696-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to support FRED, we're going to have to remove the {ds..gs} fields
from struct cpu_user_regs, meaning that it is going to have to become a
different type to the structure embedded in vcpu_guest_context_u.

struct cpu_user_regs is a name used in common Xen code (i.e. needs to stay
using this name), so renaming the public struct to be guest_user_regs in Xen's
view only.

Introduce a brand hew cpu-user-regs.h, currently containing a duplicate
structure.  This removes the need for current.h to include public/xen.h, and
highlights a case where the emulator was picking up cpu_user_regs
transitively.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Jan: Is this what you intended?

cpu_user_regs_t and the guest handle don't seem to be used anywhere.  I'm
tempted to exclude them from Xen builds.
---
 xen/arch/x86/include/asm/cpu-user-regs.h | 69 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/current.h       |  3 +-
 xen/arch/x86/x86_emulate/private.h       |  2 +
 xen/include/public/arch-x86/xen-x86_32.h |  8 +++
 xen/include/public/arch-x86/xen-x86_64.h |  8 +++
 xen/include/public/arch-x86/xen.h        |  6 +++
 6 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/include/asm/cpu-user-regs.h

diff --git a/xen/arch/x86/include/asm/cpu-user-regs.h b/xen/arch/x86/include/asm/cpu-user-regs.h
new file mode 100644
index 000000000000..845b41a22ef2
--- /dev/null
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef X86_CPU_USER_REGS_H
+#define X86_CPU_USER_REGS_H
+
+#define DECL_REG_LOHI(which) union { \
+    uint64_t r ## which ## x; \
+    uint32_t e ## which ## x; \
+    uint16_t which ## x; \
+    struct { \
+        uint8_t which ## l; \
+        uint8_t which ## h; \
+    }; \
+}
+#define DECL_REG_LO8(name) union { \
+    uint64_t r ## name; \
+    uint32_t e ## name; \
+    uint16_t name; \
+    uint8_t name ## l; \
+}
+#define DECL_REG_LO16(name) union { \
+    uint64_t r ## name; \
+    uint32_t e ## name; \
+    uint16_t name; \
+}
+#define DECL_REG_HI(num) union { \
+    uint64_t r ## num; \
+    uint32_t r ## num ## d; \
+    uint16_t r ## num ## w; \
+    uint8_t r ## num ## b; \
+}
+
+struct cpu_user_regs
+{
+    DECL_REG_HI(15);
+    DECL_REG_HI(14);
+    DECL_REG_HI(13);
+    DECL_REG_HI(12);
+    DECL_REG_LO8(bp);
+    DECL_REG_LOHI(b);
+    DECL_REG_HI(11);
+    DECL_REG_HI(10);
+    DECL_REG_HI(9);
+    DECL_REG_HI(8);
+    DECL_REG_LOHI(a);
+    DECL_REG_LOHI(c);
+    DECL_REG_LOHI(d);
+    DECL_REG_LO8(si);
+    DECL_REG_LO8(di);
+    uint32_t error_code;
+    uint32_t entry_vector;
+    DECL_REG_LO16(ip);
+    uint16_t cs, _pad0[1];
+    uint8_t  saved_upcall_mask;
+    uint8_t  _pad1[3];
+    DECL_REG_LO16(flags); /* rflags.IF == !saved_upcall_mask */
+    DECL_REG_LO8(sp);
+    uint16_t ss, _pad2[3];
+    uint16_t es, _pad3[3];
+    uint16_t ds, _pad4[3];
+    uint16_t fs, _pad5[3];
+    uint16_t gs, _pad6[3];
+};
+
+#undef DECL_REG_HI
+#undef DECL_REG_LO16
+#undef DECL_REG_LO8
+#undef DECL_REG_LOHI
+
+#endif /* X86_CPU_USER_REGS_H */
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index bcec328c9875..243d17ef79fd 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -9,7 +9,8 @@
 
 #include <xen/percpu.h>
 #include <xen/page-size.h>
-#include <public/xen.h>
+
+#include <asm/cpu-user-regs.h>
 
 /*
  * Xen's cpu stacks are 8 pages (8-page aligned), arranged as:
diff --git a/xen/arch/x86/x86_emulate/private.h b/xen/arch/x86/x86_emulate/private.h
index ef4745f56e27..dde4d3e3ccef 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -10,6 +10,8 @@
 
 # include <xen/bug.h>
 # include <xen/kernel.h>
+
+# include <asm/cpu-user-regs.h>
 # include <asm/endbr.h>
 # include <asm/msr-index.h>
 # include <asm/x86-vendors.h>
diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/public/arch-x86/xen-x86_32.h
index 9e3bf06b121e..cd21438ab12b 100644
--- a/xen/include/public/arch-x86/xen-x86_32.h
+++ b/xen/include/public/arch-x86/xen-x86_32.h
@@ -114,6 +114,10 @@
 #define __DECL_REG_LO16(name) uint32_t e ## name
 #endif
 
+#ifdef __XEN__
+#define cpu_user_regs guest_user_regs
+#endif
+
 struct cpu_user_regs {
     __DECL_REG_LO8(b);
     __DECL_REG_LO8(c);
@@ -139,6 +143,10 @@ struct cpu_user_regs {
 typedef struct cpu_user_regs cpu_user_regs_t;
 DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
 
+#ifdef __XEN__
+#undef cpu_user_regs
+#endif
+
 #undef __DECL_REG_LO8
 #undef __DECL_REG_LO16
 
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 43f6e3d22001..4388e20eaf49 100644
--- a/xen/include/public/arch-x86/xen-x86_64.h
+++ b/xen/include/public/arch-x86/xen-x86_64.h
@@ -159,6 +159,10 @@ struct iret_context {
 #define __DECL_REG_HI(num)    uint64_t r ## num
 #endif
 
+#ifdef __XEN__
+#define cpu_user_regs guest_user_regs
+#endif
+
 struct cpu_user_regs {
     __DECL_REG_HI(15);
     __DECL_REG_HI(14);
@@ -192,6 +196,10 @@ struct cpu_user_regs {
 typedef struct cpu_user_regs cpu_user_regs_t;
 DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
 
+#ifdef __XEN__
+#undef cpu_user_regs
+#endif
+
 #undef __DECL_REG
 #undef __DECL_REG_LOHI
 #undef __DECL_REG_LO8
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index fc2487986642..3b0fd05432f4 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -173,7 +173,13 @@ struct vcpu_guest_context {
 #define _VGCF_online                   5
 #define VGCF_online                    (1<<_VGCF_online)
     unsigned long flags;                    /* VGCF_* flags                 */
+
+#ifdef __XEN__
+    struct guest_user_regs user_regs;       /* User-level CPU registers     */
+#else
     struct cpu_user_regs user_regs;         /* User-level CPU registers     */
+#endif
+
     struct trap_info trap_ctxt[256];        /* Virtual IDT                  */
     unsigned long ldt_base, ldt_ents;       /* LDT (linear address, # ents) */
     unsigned long gdt_frames[16], gdt_ents; /* GDT (machine frames, # ents) */
-- 
2.39.5


