Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D53CAA6774
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 01:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974361.1362246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAdMf-0003FL-2p; Thu, 01 May 2025 23:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974361.1362246; Thu, 01 May 2025 23:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAdMe-0003Do-V6; Thu, 01 May 2025 23:30:48 +0000
Received: by outflank-mailman (input) for mailman id 974361;
 Thu, 01 May 2025 23:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tswP=XR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uAdMd-00038L-7W
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 23:30:47 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e36fd24-26e4-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 01:30:45 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so599614f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 May 2025 16:30:45 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae3ccdsm505413f8f.38.2025.05.01.16.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 16:30:43 -0700 (PDT)
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
X-Inumbo-ID: 4e36fd24-26e4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746142245; x=1746747045; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c5OfGc/3T6HMOKWy88hLd0X6Kk9xY2Jd/gy57FPy4eI=;
        b=uwEbrnUy5DTNz8wOOdH0VTzKRG3F47GDH1/7aqeJpQ0Qd+oBlwEHhAXhUhuJfHvE8D
         Z0Vm5bIrQZDYhSb9yzDOUiKoAdlSLPoFrvjM+LJbYXvjGgUl2j0jidhw9xrV/6MC8mfx
         /iz2gxH1h6u4EiVXvHOB+Etu0qCyOHB8HsTpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142245; x=1746747045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5OfGc/3T6HMOKWy88hLd0X6Kk9xY2Jd/gy57FPy4eI=;
        b=ij23kG9vlxyUlnV0wTcbVtSvmF3KUHxdL1EOaGztIoAe8mPOKl11j6vI9R7q148t4U
         Rfdb6VsxqnKxcJgz1be2rXDgsncBX3FIhFOA6apL3A44mksKxUzyBSw7E+MRgzaTtD1O
         JHcDtsH3Gvc9E/AyIv+OtQdfyTIm20x7nIk9Ao8j/nOWxs08cfdcqvccniXekAnVuz9Z
         Nc2FdVVMt8lCzTDMO6pLzLGcoHHQ6XGA2XeunYj2qBJ2ONx2NxWDLL0ID+/Ce2Lu6hiF
         QuLIfNOldDktx4gnA+OojPRf7mtEVzlqQ1HPP/bxknlZYBz0Nup7Iw1vupk3FS6l3AID
         leVA==
X-Gm-Message-State: AOJu0Yysyc4CyvFTGjGdLTMFPQm6GlhAEdb/M7qtvM2Ody7RAK3Drogl
	KgUoxQMa3MGUewo8TsW/ulYFIupwrOvR+mKra80VwRQmvmdFOLCdtYzsIQcBk7tjst+QQdwMrbr
	E
X-Gm-Gg: ASbGncvXEEJT40G65NVYZo1G/8xyhMcY+gWCsxFdv6tCv+2O4O4F43WqrOMV/flZKWx
	F3sYM4Ng4G3V6BfpNn7mEJ090ifw3NDU+E1VW2yETtMU2FwpQhzaU8wyIozyEyXcLmMaWAM3CwG
	wNYPKdk2TSw4bbNS+QivPlzVl+Sk99fqY+/7Dnp7C5M1rMMODo+3NPKOd+/QRl8GazNS36OZIYL
	ZlJovOU1FuExxiYrC0UyJp9Vx2JChZ8JIqIxBuYrs/zeVktksw8EFJe7oAbBK6jEHXrJ3Kbn/H6
	Ap2nW/sPi7iKT3HS8snsv1tU+YHMPpBWL+O+F5S59n/g4mqZlG7nF0kcUmy4rxrXb8R6lURJceL
	H7Tjv9ThS3TJHgg==
X-Google-Smtp-Source: AGHT+IHytsle15Rak7SjV3gyww/yzXX/7gR5jta2uqa0zVgSkuiFPrWarcr3D0HTqX5yyJdxJ6jMGg==
X-Received: by 2002:a5d:64e6:0:b0:3a0:8c68:19b7 with SMTP id ffacd0b85a97d-3a099ad26a3mr424094f8f.3.1746142244697;
        Thu, 01 May 2025 16:30:44 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/vpic: Improve bitops usage
Date: Fri,  2 May 2025 00:30:42 +0100
Message-Id: <20250501233042.762295-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 * For vpic_get_priority(), introduce a common ror8() helper in plain C.  One
   thing that I can't persuade the compiler to realise is that a non-zero
   value rotated is still non-zero, so use __builtin_clz() to help the
   optimiser out.

 * vpic_ioport_write() can be simplified to just for_each_set_bit(), which
   avoids spilling pending to the stack each loop iteration.  Changing pending
   from unsigned int to uint8_t isn't even strictly necessary given the
   underlying types of vpic->isr and vpic->irr, but done so clarity.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

More detailed analysis:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-53 (-53)
  Function                                     old     new   delta
  vpic_get_highest_priority_irq                134     124     -10
  vpic_intercept_pic_io                       1525    1482     -43

One thing I can't seem to avoid is GCC zero extending the result of ror8()
before passing it to BSF/TZCNT.  Then again, that's very specific to uint8_t,
and x86's preserving behaviour on byte writes.

The space saving in vpic_get_highest_priority_irq(), which has
vpic_get_priority() inlined twice, seems to come from better return-value
handling.  GCC is happy instruction scheduling over __builtin_ctz(), and I
presume it also benefits from range analysis of the result.
---
 xen/arch/x86/hvm/vpic.c  | 21 +++++++--------------
 xen/include/xen/bitops.h |  6 ++++++
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 22020322fbba..30ce367c082d 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -47,17 +47,16 @@
 #define VPIC_PRIO_NONE 8
 static int vpic_get_priority(struct hvm_hw_vpic *vpic, uint8_t mask)
 {
-    int prio;
-
     ASSERT(vpic_is_locked(vpic));
 
     if ( mask == 0 )
         return VPIC_PRIO_NONE;
 
-    /* prio = ffs(mask ROR vpic->priority_add); */
-    asm ( "ror %%cl,%b1 ; rep; bsf %1,%0"
-          : "=r" (prio) : "q" ((uint32_t)mask), "c" (vpic->priority_add) );
-    return prio;
+    /*
+     * We use __builtin_ctz() rather than ffs() because the compiler can't
+     * reason that a nonzero mask rotated is still nonzero.
+     */
+    return __builtin_ctz(ror8(mask, vpic->priority_add));
 }
 
 /* Return the PIC's highest priority pending interrupt. Return -1 if none. */
@@ -196,7 +195,7 @@ static void vpic_ioport_write(
     {
         if ( val & 0x10 )
         {
-            unsigned int pending = vpic->isr | (vpic->irr & ~vpic->elcr);
+            uint8_t pending = vpic->isr | (vpic->irr & ~vpic->elcr);
 
             /* ICW1 */
             /* Clear edge-sensing logic. */
@@ -229,15 +228,9 @@ static void vpic_ioport_write(
              * been cleared from IRR or ISR, or else the dpci logic will get
              * out of sync with the state of the interrupt controller.
              */
-            while ( pending )
-            {
-                unsigned int pin = __scanbit(pending, 8);
-
-                ASSERT(pin < 8);
+            for_each_set_bit ( pin, pending )
                 hvm_dpci_eoi(current->domain,
                              hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
-                __clear_bit(pin, &pending);
-            }
             return;
         }
         else if ( val & 0x08 )
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 448b2d3e0937..a4d31ec02a7c 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -418,6 +418,12 @@ static inline uint32_t rol32(uint32_t word, unsigned int shift)
     return (word << shift) | (word >> (32 - shift));
 }
 
+/* ror8 - rotate an 8-bit value right */
+static inline uint8_t ror8(uint8_t value, unsigned int shift)
+{
+    return (value >> shift) | (value << (8 - shift));
+}
+
 /*
  * ror32 - rotate a 32-bit value right
  *
-- 
2.39.5


