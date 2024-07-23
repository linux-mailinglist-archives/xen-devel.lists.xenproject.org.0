Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27AE93A876
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 23:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763548.1173813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWMh1-0004pQ-Si; Tue, 23 Jul 2024 21:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763548.1173813; Tue, 23 Jul 2024 21:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWMh1-0004nb-Q2; Tue, 23 Jul 2024 21:05:07 +0000
Received: by outflank-mailman (input) for mailman id 763548;
 Tue, 23 Jul 2024 21:05:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=402b=OX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWMh0-0004nV-7w
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 21:05:06 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b5fe768-4937-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 23:05:04 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5a10bb7bcd0so5965285a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 14:05:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7be2a9sm577643466b.77.2024.07.23.14.05.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 14:05:02 -0700 (PDT)
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
X-Inumbo-ID: 3b5fe768-4937-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721768703; x=1722373503; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vF6tQm3If961zeVGk4jEnf2rkN///PyI2zU27o8XbNM=;
        b=W8Uyxa+8ff4WuK+38Fxy8CHOiDztqxy8flLbx9aCFvsOcJQv3ngkZh7ZQzpMH6Z1LM
         DVnHIT4T6Ma3rtVsohj3xO/loFFww8e/QwW4ya3Tzj8Jjw0zPGGCriEv6NZAaM4wIJxp
         JZM3hr2FDeWI5MCtIlrwkRjuaLLO+3APnhKco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721768703; x=1722373503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF6tQm3If961zeVGk4jEnf2rkN///PyI2zU27o8XbNM=;
        b=KXTsrj1ca8uZH3/D2GPBpLyIANiZZN51eTSj/fS+ROeC81LH+4JJaMgxG5bDYRgr09
         7QSWLXdO23GvvpLPHAq0WN9ILzvcQPrMo1xiIczePxI1AMrdlXBK/ORVhhkXVT1rZeyc
         dOJoPH8F+LT4ciB41lrNAJ0FMa1R9/bgye/7lTo4ZNANF5xWytI/A/XH1pdjSb2iTWp/
         N+2YpVemz3oZh/4XV4guRUSm7WaQknKROI0EF7oZKohc1md1DTtVZTs/2QrSpbTbZj1p
         X0nOV05Cx+fJE0Ibz78T8n04LWEVGWdBjDv8660275UhV30FjC5RiBbZM+0j0X4imQ6z
         ylsQ==
X-Gm-Message-State: AOJu0Yzb/vDXOyMJrRbKbNKGsd0UslgiKUikx4tlyYuRBvH4cgDvR4rM
	eTndb7JFvD/QE9s91VYNt23EbdSHkn6ThFIy+Hm4nDYA89jJfW3ZaZ7OYWA0WNqLTNAnLVkFcqX
	s
X-Google-Smtp-Source: AGHT+IFSEwZ31A8oL9QsW4SD48QSgIddWvSO83OtCEBgYWj03j+M9d0iDn4Cx9Mq+6WBXvIee1GfsQ==
X-Received: by 2002:a17:907:1c90:b0:a6f:6126:18aa with SMTP id a640c23a62f3a-a7ab115261fmr6296066b.67.1721768703104;
        Tue, 23 Jul 2024 14:05:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/APIC: Change APIC reg types to unsigned int
Date: Tue, 23 Jul 2024 22:05:00 +0100
Message-Id: <20240723210500.248261-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They're all within a 12 bit range of their respective bases, and this prevents
all the MSR coordinates being calculated in %rcx.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

There's one unpleasant surprise hidden:

  add/remove: 0/0 grow/shrink: 2/6 up/down: 18/-99 (-81)
  Function                                     old     new   delta
  trace_exit_reason.part                       229     245     +16
  check_for_unexpected_msi                      73      75      +2
  fixup_irqs                                  1239    1237      -2
  lapic_resume                                 860     844     -16
  irq_move_cleanup_interrupt                   683     667     -16
  intel_mcheck_init                           1840    1824     -16
  setup_local_APIC                             985     968     -17
  clear_local_APIC                            1141    1109     -32

This causes check_for_unexpected_msi() to gain a CLTQ sign extending reg
before adding it to APIC_BASE.  Furthermore it retains it's SAR from the start
of apic_isr_read().

If the vector parameter changes from uint8_t to unsigned int, both the CLTQ
and SAR go away and and are replaced with regular unsigned logic.

(uint8_t) & ~0x1f undergoes promotion to int, but can't be negative due to
it's range, and I'm quite surprised that GCC-12 can't figure this out.
---
 xen/arch/x86/include/asm/apic.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index a254e49dd13b..1133954e5540 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -49,12 +49,12 @@ const struct genapic *apic_x2apic_probe(void);
  * Basic functions accessing APICs.
  */
 
-static inline void apic_mem_write(unsigned long reg, u32 v)
+static inline void apic_mem_write(unsigned int reg, u32 v)
 {
 	*((volatile u32 *)(APIC_BASE+reg)) = v;
 }
 
-static inline u32 apic_mem_read(unsigned long reg)
+static inline u32 apic_mem_read(unsigned int reg)
 {
 	return *((volatile u32 *)(APIC_BASE+reg));
 }
@@ -63,7 +63,7 @@ static inline u32 apic_mem_read(unsigned long reg)
  * access the 64-bit ICR register.
  */
 
-static inline void apic_wrmsr(unsigned long reg, uint64_t msr_content)
+static inline void apic_wrmsr(unsigned int reg, uint64_t msr_content)
 {
     if (reg == APIC_DFR || reg == APIC_ID || reg == APIC_LDR ||
         reg == APIC_LVR)
@@ -72,7 +72,7 @@ static inline void apic_wrmsr(unsigned long reg, uint64_t msr_content)
     wrmsrl(MSR_X2APIC_FIRST + (reg >> 4), msr_content);
 }
 
-static inline uint64_t apic_rdmsr(unsigned long reg)
+static inline uint64_t apic_rdmsr(unsigned int reg)
 {
     uint64_t msr_content;
 
@@ -83,7 +83,7 @@ static inline uint64_t apic_rdmsr(unsigned long reg)
     return msr_content;
 }
 
-static inline void apic_write(unsigned long reg, u32 v)
+static inline void apic_write(unsigned int reg, u32 v)
 {
 
     if ( x2apic_enabled )
@@ -92,7 +92,7 @@ static inline void apic_write(unsigned long reg, u32 v)
         apic_mem_write(reg, v);
 }
 
-static inline u32 apic_read(unsigned long reg)
+static inline u32 apic_read(unsigned int reg)
 {
     if ( x2apic_enabled )
         return apic_rdmsr(reg);
-- 
2.39.2


