Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F43B3A370
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:05:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099113.1453036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureBT-0003xz-Pj; Thu, 28 Aug 2025 15:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099113.1453036; Thu, 28 Aug 2025 15:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureBT-0003vg-Me; Thu, 28 Aug 2025 15:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1099113;
 Thu, 28 Aug 2025 15:05:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureBS-0003MD-PK
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:05:02 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f61a8a2-8420-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 17:05:02 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ceb9c3d98cso214393f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:05:02 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:04:42 -0700 (PDT)
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
X-Inumbo-ID: 5f61a8a2-8420-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393501; x=1756998301; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rSETqeO7pVr8yy1cJ/ZWYHDSUYISCFYWWC8z2uEGqY=;
        b=s1y4p8s8gpwaraOGPhh6cfXANRwXp0lCvnM8lN2IeU6naGWhP/M9xN7yMpwkZ5L/ee
         4cyGs5KDLDs3nUltJuQnu4KMwW/6xrJ3OKLNdsPt4OILFsN5qWq/28y23GO2pftfCDtQ
         oznHy0owz9r+jLqG/nwDjdx7RZgFEwDQpSNHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393501; x=1756998301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rSETqeO7pVr8yy1cJ/ZWYHDSUYISCFYWWC8z2uEGqY=;
        b=COekTV6Ruvt2jsAmu/eIfF7dK/lmIxDF3ojS2uPV+jALQgKwoFZOpkrU70OuSGvO/7
         4Y1I2OdYj4+e8VBLtThTRvuNLOE7WbqGLTHH4xJFKWfE9GVXRqgfegUmgHDfo0F0TrqS
         IgTla8yMwGlrj05a/+mOSkIsGvB8T4ER3IYfxsEewVS+w+Z5KA02nD1aBJaoRTHtIwHX
         2I3Fd6g5yCN30anPEVF83JW9X7v1wh5Pb4eYgZNT0T3pO56I5bYBcr7UDNJ+YVMD9Eef
         dXAYN147TjswOSKxratg+3CKVskOUcfiNve7cVQ5sb7mDNvegANnii07SxXRWPh7JcIl
         8Xzg==
X-Gm-Message-State: AOJu0YzzAUnsOh0nral3tQgvxfiFkDj00ya+2cxpB5ln98cEoAxrtn9R
	BaTfP+pW2xGt3y8PaCmVIFxSOs2pTVux18r/O2i3h2sDkeOmqjqnLZJnP1xDsRvmtktCXYhxxRh
	2actg
X-Gm-Gg: ASbGncuY5gM1KVLSA7y3nc0ciKOnVGlekz+D3krEBKK8wOZYw5k5FLdPk31S9iWLA1m
	rCX7yR2L7e6X0cZ1D6QGgzc3GsTK45Wco9mdeQF4tZ7j7/ObdsfZueW3pSJLms0pRO1jDP2BKzL
	abAS25JAGR4jXHg3I1xDs7H8mDcEh08sdWdjwaNMD1IlOIOHDtqdQmCXSWulHmm+16NZia6Rfhq
	25viA8BUnRaYuGN5UObf/r6Rs0gh5AIs+kDn80pt7fJgasDfpgj/Gbg26zg6n+1GQqyce+5jGso
	EG5ir/PCTneCG/fnWVPkihz10LOPhdpYz/1kS/xTl1eJLjZWZNcIReuiQtz1xls03WqOQkGqejy
	hoNwBcQK1cmH13EVMr7Gxhd8w/s+mABDD58Fvy6YzRXTWQseeXhXmdTe1rSpgXg/QQUCaicGTzF
	uK
X-Google-Smtp-Source: AGHT+IH/I0EVRtsS4rmnlkXBd0cW4yUXcVS7/meIAdWpnRmRiOw5O46mXL/RvZVuCXPD8xHKQbG5bg==
X-Received: by 2002:a5d:5847:0:b0:3cb:3490:6b82 with SMTP id ffacd0b85a97d-3cb34906dc2mr8471495f8f.55.1756393501354;
        Thu, 28 Aug 2025 08:05:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 02/23] x86/traps: Extend struct cpu_user_regs/cpu_info with FRED fields
Date: Thu, 28 Aug 2025 16:03:48 +0100
Message-Id: <20250828150409.901315-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The FRED on-stack format is larger than the IDT format, but is by and large
compatible.  FRED reuses space above cs and ss for extra metadata, some of
which is purely informational, and some of which causes additional effects in
ERET{U,S}.

Follow Linux's choice of naming for fred_{c,s}s structures, to make it very
clear at the point of use that it's dependent on FRED.

There is also the event data field and reserved fields, but we cannot include
these in struct cpu_user_regs without reintroducing OoB structure accesses in
the non-FRED case.  See commit 6065a05adf15 ("x86/traps: 'Fix' safety of
read_registers() in #DF path"). for more details.

Instead, use a new struct fred_info and position it suitably in struct
cpu_info.  This boundary will be loaded into MSR_FRED_RSP_SL0, and must be
64-byte aligned.

This does add 16 bytes back into struct cpu_info, undoing the saving we made
by dropping the vm86 data segment selectors.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * .lm -> .l
 * Tweak comments
---
 xen/arch/x86/include/asm/cpu-user-regs.h | 71 ++++++++++++++++++++++--
 xen/arch/x86/include/asm/current.h       |  2 +
 xen/arch/x86/traps-setup.c               |  5 ++
 3 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpu-user-regs.h b/xen/arch/x86/include/asm/cpu-user-regs.h
index 5b283a2f6d02..92aeca0aaa88 100644
--- a/xen/arch/x86/include/asm/cpu-user-regs.h
+++ b/xen/arch/x86/include/asm/cpu-user-regs.h
@@ -30,6 +30,10 @@ struct cpu_user_regs
     /*
      * During IDT delivery for exceptions with an error code, hardware pushes
      * to this point.  Entry_vector is filled in by software.
+     *
+     * During FRED delivery, hardware always pushes to this point.  Software
+     * copies fred_ss.vector into entry_vector so most interrupt/exception
+     * handling can be FRED-agnostic.
      */
 
     uint32_t error_code;
@@ -42,18 +46,77 @@ struct cpu_user_regs
      */
 
     union { uint64_t rip;    uint32_t eip;    uint16_t ip; };
-    uint16_t cs, _pad0[1];
-    uint8_t  saved_upcall_mask; /* PV (v)rflags.IF == !saved_upcall_mask */
-    uint8_t  _pad1[3];
+    union {
+        struct {
+            uint16_t      cs;
+            unsigned long :16;
+            uint8_t       saved_upcall_mask; /* PV (v)rflags.IF == !saved_upcall_mask */
+        };
+        unsigned long     csx;
+        struct {
+            /*
+             * Bits 0 to 31 control ERET{U,S} behaviour, and are state of the
+             * interrupted context.
+             */
+            uint16_t      cs;
+            unsigned int  sl:2;      /* Stack Level */
+            bool          wfe:1;     /* Wait-for-ENDBRANCH state */
+        } fred_cs;
+    };
     union { uint64_t rflags; uint32_t eflags; uint16_t flags; };
     union { uint64_t rsp;    uint32_t esp;    uint16_t sp;    uint8_t spl; };
-    uint16_t ss, _pad2[3];
+    union {
+        uint16_t          ss;
+        unsigned long     ssx;
+        struct {
+            /*
+             * Bits 0 to 31 control ERET{U,S} behaviour, and are state about
+             * the event which occured.
+             */
+            uint16_t      ss;
+            bool          sti:1;     /* Was blocked-by-STI, and not cancelled */
+            bool          swint:1;   /* Was a SYSCALL/SYSENTER/INT $N.  On ERETx, pend_DB iff TF */
+            bool          nmi:1;     /* Was an NMI. */
+            unsigned long :13;
+
+            /*
+             * Bits 32 to 63 are ignored by ERET{U,S} and are informative
+             * only.
+             */
+            uint8_t       vector;
+            unsigned long :8;
+            unsigned int  type:4;    /* X86_ET_* */
+            unsigned long :4;
+            bool          enclave:1; /* Event taken in SGX mode */
+            bool          l:1;       /* Event taken in 64bit mode (old %cs.l) */
+            bool          nested:1;  /* Exception during event delivery (clear for #DF) */
+            unsigned long :1;
+            unsigned int  insnlen:4; /* .type >= SW_INT */
+        } fred_ss;
+    };
 
     /*
      * For IDT delivery, tss->rsp0 points to this boundary as embedded within
      * struct cpu_info.  It must be 16-byte aligned.
      */
 };
+struct fred_info
+{
+    /*
+     * Event Data.  For:
+     *   #DB: PENDING_DBG (%dr6 with positive polarity)
+     *   NMI: NMI-Source Bitmap (on capable hardware)
+     *   #PF: %cr2
+     *   #NM: MSR_XFD_ERR (only XFD-induced #NMs)
+     */
+    uint64_t edata;
+    uint64_t _rsvd;
+
+    /*
+     * For FRED delivery, MSR_FRED_RSP_SL0 points to this boundary as embedded
+     * within struct cpu_info.  It must be 64-byte aligned.
+     */
+};
 
 static inline uint64_t msr_fold(const struct cpu_user_regs *regs)
 {
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index fd30422707d9..c1eb27b1c4c2 100644
--- a/xen/arch/x86/include/asm/current.h
+++ b/xen/arch/x86/include/asm/current.h
@@ -38,6 +38,8 @@ struct vcpu;
 
 struct cpu_info {
     struct cpu_user_regs guest_cpu_user_regs;
+    struct fred_info _fred; /* Only used when FRED is active. */
+
     unsigned int processor_id;
     unsigned int verw_sel;
     struct vcpu *current_vcpu;
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 25581acf1158..c89280270fbb 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -354,7 +354,12 @@ static void __init __maybe_unused build_assertions(void)
      *
      * tss->rsp0, pointing at the end of cpu_info.guest_cpu_user_regs, must be
      * 16-byte aligned.
+     *
+     * MSR_FRED_RSP_SL0, pointing to the end of cpu_info._fred must be 64-byte
+     * aligned.
      */
     BUILD_BUG_ON((sizeof(struct cpu_info) -
                   endof_field(struct cpu_info, guest_cpu_user_regs)) & 15);
+    BUILD_BUG_ON((sizeof(struct cpu_info) -
+                  endof_field(struct cpu_info, _fred)) & 63);
 }
-- 
2.39.5


