Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607FE93A817
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 22:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763530.1173792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWMG0-0000YC-I6; Tue, 23 Jul 2024 20:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763530.1173792; Tue, 23 Jul 2024 20:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWMG0-0000Vf-FU; Tue, 23 Jul 2024 20:37:12 +0000
Received: by outflank-mailman (input) for mailman id 763530;
 Tue, 23 Jul 2024 20:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=402b=OX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWMFy-0000VZ-SM
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 20:37:10 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53145aee-4933-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 22:37:05 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so88255571fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 13:37:05 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a51433f904sm5323226a12.40.2024.07.23.13.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 13:37:04 -0700 (PDT)
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
X-Inumbo-ID: 53145aee-4933-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721767025; x=1722371825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xTnCvWYXUz59Smh4B9IrK+4N18OgjPbN1MkpsUI/QxU=;
        b=jBUl1wQ4EreWy4bxwJosJiaZ1eaWiHesebx2gTHmCB5dL0zZUmt26v79skcYrfsxJA
         RLm3YqHpTypwf9HidP2BhytJxI4NZ25zsVyiC3ffiAM9+vLRXjhVPrd1PpS06wDWzWC2
         WL//i5woaT4QmhyGosfs0ASRQ8nZZsCdjFK+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721767025; x=1722371825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTnCvWYXUz59Smh4B9IrK+4N18OgjPbN1MkpsUI/QxU=;
        b=E2hj7r772Uhs+fnTFTZegyscXPpYp0dJi7IIyjLI91rEwYZCebc5S+H3lU0KJdiGQJ
         Vvjy+wH0Uc53e8Ufeph3b0yKZtr62pvEfIbN1wel3RCg4kY9s/URZnoWN+YPADsxkNTR
         TCh1iKOqL6TuhNjYti4m53SJDEWWUVGwok6pfa9R51ioFsxMZR40Z5W7lohID/Puc8aB
         upBuxRS3mJ5dx10lPHvMGzyXL374CPB2tEwvRuRAn0nWYgb1VDGZBb30pnnkWeBjav4U
         joQ4VGPUGqgCQvrPtlAhcsEBJSE//ZWqXN7dA2nu7jrR8mS3deTy9q2hSs77hUp8amKz
         5dOw==
X-Gm-Message-State: AOJu0YwfDJ2vzT2ZfJEISST0cwH+vMFb90nuTcURgDJ4X8KnSKBhoX85
	5BkZbT/cFpD1ktcykEq9hY2gfJY5Vbf2jhBiPHcozR5VGGSBnZFxfGa0HOr7yGLJ4ZvU0rFJLQt
	x
X-Google-Smtp-Source: AGHT+IE7mJtodrFB2K6FOaV6OwQoLV67I8WGphKexCnwcXBVVUe8SIwC+gtuqir6BGhsMcBqCuOwXQ==
X-Received: by 2002:a2e:bc0f:0:b0:2ef:296d:1dda with SMTP id 38308e7fff4ca-2ef296d21bbmr68146581fa.1.1721767024727;
        Tue, 23 Jul 2024 13:37:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/IO-APIC: Improve APIC_TMR accesses
Date: Tue, 23 Jul 2024 21:37:01 +0100
Message-Id: <20240723203701.208018-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

XenServer's instance of coverity complains of OVERFLOW_BEFORE_WIDEN in
mask_and_ack_level_ioapic_irq(), which is ultimately because of v being
unsigned long, and (1U << ...) being 32 bits.

Introduce a apic_tmr_read() helper like we already have for ISR and IRR, and
use it to remove the opencoded access logic.  Introduce an is_level boolean to
improve the legibility of the surrounding logic.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/apic.h |  5 +++++
 xen/arch/x86/io_apic.c          | 15 +++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index 7bd66dc6e151..a254e49dd13b 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -132,6 +132,11 @@ static inline bool apic_isr_read(uint8_t vector)
             (vector & 0x1f)) & 1;
 }
 
+static inline bool apic_tmr_read(unsigned int vector)
+{
+    return apic_read(APIC_TMR + (vector / 32 * 0x10)) & (1U << (vector % 32));
+}
+
 static inline bool apic_irr_read(unsigned int vector)
 {
     return apic_read(APIC_IRR + (vector / 32 * 0x10)) & (1U << (vector % 32));
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index ef076bfaf3f5..0fc1aa05fe3e 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1652,8 +1652,7 @@ static bool io_apic_level_ack_pending(unsigned int irq)
 
 static void cf_check mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
 {
-    unsigned long v;
-    int i;
+    bool is_level;
 
     irq_complete_move(desc);
 
@@ -1679,9 +1678,8 @@ static void cf_check mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
  * operation to prevent an edge-triggered interrupt escaping meanwhile.
  * The idea is from Manfred Spraul.  --macro
  */
-    i = desc->arch.vector;
 
-    v = apic_read(APIC_TMR + ((i & ~0x1f) >> 1));
+    is_level = apic_tmr_read(desc->arch.vector);
 
     ack_APIC_irq();
     
@@ -1692,7 +1690,7 @@ static void cf_check mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
        !io_apic_level_ack_pending(desc->irq))
         move_masked_irq(desc);
 
-    if ( !(v & (1U << (i & 0x1f))) )
+    if ( !is_level )
     {
         spin_lock(&ioapic_lock);
         __edge_IO_APIC_irq(desc->irq);
@@ -1743,13 +1741,14 @@ static void cf_check end_level_ioapic_irq_new(struct irq_desc *desc, u8 vector)
  * operation to prevent an edge-triggered interrupt escaping meanwhile.
  * The idea is from Manfred Spraul.  --macro
  */
-    unsigned int v, i = desc->arch.vector;
+    unsigned int i = desc->arch.vector;
+    bool is_level;
 
     /* Manually EOI the old vector if we are moving to the new */
     if ( vector && i != vector )
         eoi_IO_APIC_irq(desc);
 
-    v = apic_read(APIC_TMR + ((i & ~0x1f) >> 1));
+    is_level = apic_tmr_read(i);
 
     end_nonmaskable_irq(desc, vector);
 
@@ -1757,7 +1756,7 @@ static void cf_check end_level_ioapic_irq_new(struct irq_desc *desc, u8 vector)
          !io_apic_level_ack_pending(desc->irq) )
         move_native_irq(desc);
 
-    if ( !(v & (1U << (i & 0x1f))) )
+    if ( !is_level )
     {
         spin_lock(&ioapic_lock);
         __mask_IO_APIC_irq(desc->irq);
-- 
2.39.2


