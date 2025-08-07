Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1E4B1D674
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 13:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072831.1435781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycK-0002oT-Cq; Thu, 07 Aug 2025 11:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072831.1435781; Thu, 07 Aug 2025 11:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujycK-0002mS-9x; Thu, 07 Aug 2025 11:17:04 +0000
Received: by outflank-mailman (input) for mailman id 1072831;
 Thu, 07 Aug 2025 11:17:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnK=2T=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ujycJ-0002Ym-Fu
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 11:17:03 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b1b6fd2-7380-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 13:17:03 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-458bece40fcso5178045e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 04:17:03 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5c84b8csm45456435e9.4.2025.08.07.04.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 04:17:01 -0700 (PDT)
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
X-Inumbo-ID: 0b1b6fd2-7380-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754565422; x=1755170222; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQKYHz4fSaJ/OtAFeeWkxochLoIzcmc/dz0cmOGZA7c=;
        b=Yet7FYOilVJX0hLZFyWVHsZEWASYJL1oiG5OSVYtNPGhfa0WfokYNThyDFewA6S5dr
         opR8Dt+OSW//i+0TirTY2aXVxEEjPnaacQsx8bzQtk533bIGwjsCUZBSfbphO/2UtDVd
         eZ10KxeLf7hTXXPDu0TCdgXO9I9bG5grhGECQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565422; x=1755170222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQKYHz4fSaJ/OtAFeeWkxochLoIzcmc/dz0cmOGZA7c=;
        b=pl2Y/Rt2TGooF181GAItB8zshHRyYN0ixTildiQ9KMgryoTvQXSJfBv64AXFKo2POk
         nyJN/zAa/7Yg2UPfLK6nqpL6IqzclTGo2B8dtSX1bjKcnCrF/Ei7zY1OG5bn1GWw2nU1
         9SbaokxJcKtO0KU+NW71VDsuwMTQWsfDlepmmDy8iYewX/21v8PmGUnyVdB2eo9vdisj
         okwx22/Fi79wUH5hDNH4kbteONS0la2gt6fHYaox1fQ1k2hhuNDYUwqr8Wf3/gPSXtAQ
         MOGaNyyJ/TkF9vP2ITBHuMGx/aTvgd5Q6QVY0m6g4Khj9O3jtUXmDeYU6lp/+g30b9m3
         U+ww==
X-Gm-Message-State: AOJu0YwdbdCQVZ2SXiMnMw5BZ8No31K9xAKobJO8L4n/YWUfP4Nwep5z
	8bORHhdhB+I/wNmqfvHwfjHHLXVXlfDKEPaB0tL8ycetTm0yp5YdZrfq4Zu692X6qbaWRQJdTQR
	bi59waJ0=
X-Gm-Gg: ASbGnctiIRQqlVJWkQBpkVv6wSkGoZyjP08gTuQV4fW3C/XHf7Pe6expUt1dLoSJrhI
	nhwg/150ufoUC2gJvUFxGwusmrW2p4gzPTJHumzMePEkV518UgPDlsa4kZzzvc6s8qnQXhoePFT
	hbFtiA2R/qDRonTVOf843gDr3PHqUjKkd8jw+jKzrMzNPPTJP5bLYui+6/HtY3Y/cvDb/Cy7z9J
	8hGtNp28M9TPsmcMAwYSbfwGwtFSN/Vu8bT1VOUNg+juet1/2Y3vXsJjPsVyZFatDHEIMVuW9+d
	7R4xmEtaawdlltT/g9ynEYbpar/2277rhBFBZQvGi5rZmu/lHH+pAFkwX5VLtPvEWSN9S00AWSj
	nqXkrSIB1AXamA+yTdsCcZ2st4CDhyVqFlw1N4/ziwOrhb0gXd4ZF7n85kXh9k/cJ8F1LWdqe23
	Eh
X-Google-Smtp-Source: AGHT+IFCS7cWq/GjuAVaBl4wcf4yItIQ/KmNepCkDF3DNa0rK/h6fEXzW6daydMplkdrsw8VBTkb8w==
X-Received: by 2002:a05:600c:444c:b0:456:1560:7c5f with SMTP id 5b1f17b1804b1-459ee82237amr26787405e9.14.1754565422141;
        Thu, 07 Aug 2025 04:17:02 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH v2 3/4] x86/public: Split the struct cpu_user_regs type
Date: Thu,  7 Aug 2025 12:16:56 +0100
Message-Id: <20250807111657.201849-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250807111657.201849-1-andrew.cooper3@citrix.com>
References: <20250807111657.201849-1-andrew.cooper3@citrix.com>
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
structure.

Notably, this removes the need to include pubic/xen.h in ~every translation
unit in Xen (via current.h), and highlights one case where the emulator was
picking up cpu_user_regs transitively.

Include comments describing how hardware interacts with this structure under
IDT delivery, as it's quite magic to start with.  FRED is going make things
more complicated.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Remove the macros from cpu-user-regs.h and write the struct longhand
 * Exclude the guest handles in Xen context
---
 xen/arch/x86/include/asm/cpu-user-regs.h | 63 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/current.h       |  3 +-
 xen/arch/x86/x86_emulate/private.h       |  1 +
 xen/include/public/arch-x86/xen-x86_32.h |  9 ++++
 xen/include/public/arch-x86/xen-x86_64.h |  9 ++++
 xen/include/public/arch-x86/xen.h        | 11 +++++
 6 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/include/asm/cpu-user-regs.h

diff --git a/xen/arch/x86/include/asm/cpu-user-regs.h b/xen/arch/x86/include/asm/cpu-user-regs.h
new file mode 100644
index 000000000000..0e78e38ed00d
--- /dev/null
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef X86_CPU_USER_REGS_H
+#define X86_CPU_USER_REGS_H
+
+#include <xen/stdint.h>
+
+/*
+ * cpu_user_regs represents the interrupted GPR state at the point of an
+ * interrupt, exception or syscall.  The layout is dictated by the hardware
+ * format for the event frame, with software filling in the rest.
+ */
+struct cpu_user_regs
+{
+    union { uint64_t r15;    uint32_t r15d;   uint16_t r15w;  uint8_t r15b; };
+    union { uint64_t r14;    uint32_t r14d;   uint16_t r14w;  uint8_t r14b; };
+    union { uint64_t r13;    uint32_t r13d;   uint16_t r13w;  uint8_t r13b; };
+    union { uint64_t r12;    uint32_t r12d;   uint16_t r12w;  uint8_t r12b; };
+    union { uint64_t rbp;    uint32_t ebp;    uint16_t bp;    uint8_t bpl;  };
+    union { uint64_t rbx;    uint32_t ebx;    uint16_t bx;    struct { uint8_t bl, bh; }; };
+    union { uint64_t r11;    uint32_t r11d;   uint16_t r11w;  uint8_t r11b; };
+    union { uint64_t r10;    uint32_t r10d;   uint16_t r10w;  uint8_t r10b; };
+    union { uint64_t r9;     uint32_t r9d;    uint16_t r9w;   uint8_t r9b;  };
+    union { uint64_t r8;     uint32_t r8d;    uint16_t r8w;   uint8_t r8b;  };
+    union { uint64_t rax;    uint32_t eax;    uint16_t ax;    struct { uint8_t al, ah; }; };
+    union { uint64_t rcx;    uint32_t ecx;    uint16_t cx;    struct { uint8_t cl, ch; }; };
+    union { uint64_t rdx;    uint32_t edx;    uint16_t dx;    struct { uint8_t dl, dh; }; };
+    union { uint64_t rsi;    uint32_t esi;    uint16_t si;    uint8_t sil;  };
+    union { uint64_t rdi;    uint32_t edi;    uint16_t di;    uint8_t dil;  };
+
+    /*
+     * During IDT delivery for exceptions with an error code, hardware pushes
+     * to this point.  Entry_vector is filled in by software.
+     */
+
+    uint32_t error_code;
+    uint32_t entry_vector;
+
+    /*
+     * During IDT delivery for interrupts or exceptions without an error code,
+     * hardware pushes to this point.  Both error_code and entry_vector are
+     * filled in by software.
+     */
+
+    union { uint64_t rip;    uint32_t eip;    uint16_t ip; };
+    uint16_t cs, _pad0[1];
+    uint8_t  saved_upcall_mask; /* PV (v)rflags.IF == !saved_upcall_mask */
+    uint8_t  _pad1[3];
+    union { uint64_t rflags; uint32_t eflags; uint16_t flags; };
+    union { uint64_t rsp;    uint32_t esp;    uint16_t sp;    uint8_t spl; };
+    uint16_t ss, _pad2[3];
+
+    /*
+     * For IDT delivery, tss->rsp0 points to this boundary as embedded within
+     * struct cpu_info.  It must be 16-byte aligned.
+     */
+
+    uint16_t es, _pad3[3];
+    uint16_t ds, _pad4[3];
+    uint16_t fs, _pad5[3];
+    uint16_t gs, _pad6[3];
+};
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
index 940087987011..24c79c4e8fac 100644
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -14,6 +14,7 @@
 # include <xen/bug.h>
 # include <xen/kernel.h>
 
+# include <asm/cpu-user-regs.h>
 # include <asm/endbr.h>
 # include <asm/msr-index.h>
 # include <asm/stubs.h>
diff --git a/xen/include/public/arch-x86/xen-x86_32.h b/xen/include/public/arch-x86/xen-x86_32.h
index 9e3bf06b121e..25cc44728838 100644
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
@@ -136,8 +140,13 @@ struct cpu_user_regs {
     uint16_t fs, _pad4;
     uint16_t gs, _pad5;
 };
+
+#ifdef __XEN__
+#undef cpu_user_regs
+#else
 typedef struct cpu_user_regs cpu_user_regs_t;
 DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
+#endif
 
 #undef __DECL_REG_LO8
 #undef __DECL_REG_LO16
diff --git a/xen/include/public/arch-x86/xen-x86_64.h b/xen/include/public/arch-x86/xen-x86_64.h
index 43f6e3d22001..ea6b56aa3bd8 100644
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
@@ -189,8 +193,13 @@ struct cpu_user_regs {
     uint16_t fs, _pad5[3];
     uint16_t gs, _pad6[3];
 };
+
+#ifdef __XEN__
+#undef cpu_user_regs
+#else
 typedef struct cpu_user_regs cpu_user_regs_t;
 DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
+#endif
 
 #undef __DECL_REG
 #undef __DECL_REG_LOHI
diff --git a/xen/include/public/arch-x86/xen.h b/xen/include/public/arch-x86/xen.h
index fc2487986642..b99a691706f8 100644
--- a/xen/include/public/arch-x86/xen.h
+++ b/xen/include/public/arch-x86/xen.h
@@ -173,7 +173,18 @@ struct vcpu_guest_context {
 #define _VGCF_online                   5
 #define VGCF_online                    (1<<_VGCF_online)
     unsigned long flags;                    /* VGCF_* flags                 */
+
+    /*
+     * Outside of Xen, regs type stays named cpu_user_regs for backwards
+     * compatibility.  Inside Xen, the type called cpu_user_regs is different,
+     * and the public API type is renamed to guest_user_regs.
+     */
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


