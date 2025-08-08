Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62262B1EF6C
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075031.1437573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcm-0000MA-0R; Fri, 08 Aug 2025 20:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075031.1437573; Fri, 08 Aug 2025 20:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcl-0000As-H0; Fri, 08 Aug 2025 20:23:35 +0000
Received: by outflank-mailman (input) for mailman id 1075031;
 Fri, 08 Aug 2025 20:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTch-0005tW-V1
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:31 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cff654d-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:31 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso16617975e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:31 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:30 -0700 (PDT)
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
X-Inumbo-ID: 8cff654d-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684611; x=1755289411; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTq1zY2I26ChNKndjNiVvn62M1r/PKSnKEK0vFDd4Xw=;
        b=kVvnBQfBbtrtxRxxaGQ17AIwAqM7oGoJ4A/1Yz44F7oP2m3LuZ5V7+QUHuyCQaYU7A
         ckY50RlcOPesuuP5VGRZiMZQoz0kAtppRTgvmaHgFfs1FuPTbK9ufTLr9Usc6ua+K+PD
         yf45tykm4zbiMcuroRjipZRERiOaQwWn4cNoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684611; x=1755289411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTq1zY2I26ChNKndjNiVvn62M1r/PKSnKEK0vFDd4Xw=;
        b=AdC1G685ZJg8B1jAh5E8iv+DS0YtMoLiT/Hw+XX4l90xWAGPUuRb93X7f3Snqmzw+U
         6Zbauve894wacCoJezqbkSc6KB3+HRsHtCJud/2h8jdwJibkrWNoQ5oKap3kVK3vsqIT
         56nW0SG/MZTje5FZlCaF5oKzoyzHrcxkHUGbWv5Z4avUvHMP6wNuLn1KP612AclVmDRs
         zQMDpZtUBorhj8VZoAtUFJSWE52vFd0sCjmo6zJlJYeTBxQXCZlJKoDx20//xxkKT/er
         p+tLl0YmKnonowuJJcBi+2TUGL4xOLFJoQs4/c1/nCu+T/74f1gEw/40dUQSaRSxT0Zc
         5HMw==
X-Gm-Message-State: AOJu0YzCAglu+kopE86ZPab3/e8FrEi35RtAAsOKWT29/nmTSOqFC+ai
	6g/Q1QcdrM9cfGcqxOo+aJz9jMeaiR295rj8Z5BUHBmYXVb/14iZHOCHs/NQj6oYbG4iifdbn7o
	wtHFHzNY=
X-Gm-Gg: ASbGncvl4MPyIbB1dI+6S1iiPTFOLl6U8zOdhZkrncOaj8PQVENM6DYWpMz3ZbrN6ac
	L1xkMoEV+jOWJY5EXzZT4tVXevZ82PxKvoPrxRtYHau0axQbsA83SgjCbB10dh5nugeAzQUJOWi
	uu5HXP3BousCTKTeyQrDm+y3DS0zFn7aS//Svyhsv0s6F/NxRIXLwSsyqvSXMDQcjLrfH5A097j
	KejuUqVbhkPj7Te2GyfTSLTlZXzHHPAzD3CPZcwhab7XoEMM7GrPU5M0Oc8ILm6yTYpj6h7hKTu
	G1uOpTQftAhvTOeiBUBsrgO+A4hnoxkbZwwaBMF7Nydy3xo2PHPTH49qE2FLQzHHuJbMS23aU7y
	DW7AEYtD+g3d0hgLoHkJ8N02fcxh/rMnmK1yTJd+ViHLRi5n+kZBupG7FXzDh7CL8wU3mUpCd9a
	xA
X-Google-Smtp-Source: AGHT+IGsLXCOpXJvGiSWbmlCj4KaXirNJ77sHY86pggs96EcE/yz32J/KyrLLWRQ6t+iEhKWqpgulA==
X-Received: by 2002:a05:600c:b86:b0:459:dde3:1a3d with SMTP id 5b1f17b1804b1-459f4fb0174mr32998035e9.26.1754684610501;
        Fri, 08 Aug 2025 13:23:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 14/22] x86/traps: Extend struct cpu_user_regs/cpu_info with FRED fields
Date: Fri,  8 Aug 2025 21:23:06 +0100
Message-Id: <20250808202314.1045968-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
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
---
 xen/arch/x86/include/asm/cpu-user-regs.h | 71 ++++++++++++++++++++++--
 xen/arch/x86/include/asm/current.h       |  2 +
 xen/arch/x86/traps-setup.c               |  5 ++
 3 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/cpu-user-regs.h b/xen/arch/x86/include/asm/cpu-user-regs.h
index d700a3ef3447..06d9cbfbe6ba 100644
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
@@ -42,17 +46,76 @@ struct cpu_user_regs
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
+             * Bits 0 thru 31 control ERET{U,S} behaviour, and is state of the
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
+             * Bits 0 thru 31 control ERET{U,S} behaviour, and is state about
+             * the event which occured.
+             */
+            uint16_t      ss;
+            bool          sti:1;     /* Was blocked-by-STI, and not cancelled */
+            bool          swint:1;   /* Was a SYSCALL/SYSENTER/INT $N */
+            bool          nmi:1;     /* Was an NMI. */
+            unsigned long :13;
+
+            /*
+             * Bits 32 thru 63 are ignored by ERET{U,S} and are informative
+             * only.
+             */
+            uint8_t       vector;
+            unsigned long :8;
+            unsigned int  type:4;    /* X86_ET_* */
+            unsigned long :4;
+            bool          enclave:1; /* Event taken in SGX mode */
+            bool          lm:1;      /* Was in Long Mode */
+            bool          nested:1;  /* Exception during event delivery, clear for #DF */
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
 
 #endif /* X86_CPU_USER_REGS_H */
diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
index a7c9473428b2..962eb76a82b3 100644
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
index fbae7072c292..37202c17fcea 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -360,7 +360,12 @@ static void __init __maybe_unused build_assertions(void)
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


