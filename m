Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA1D9DB063
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 01:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845108.1260591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGShC-0007Z6-5J; Thu, 28 Nov 2024 00:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845108.1260591; Thu, 28 Nov 2024 00:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGShB-0007XK-UY; Thu, 28 Nov 2024 00:47:49 +0000
Received: by outflank-mailman (input) for mailman id 845108;
 Thu, 28 Nov 2024 00:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53lb=SX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGSh9-0007X0-Kg
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 00:47:47 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fc9a9cc-ad22-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 01:47:42 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso30328066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 16:47:42 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6a1asm8705566b.98.2024.11.27.16.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 16:47:40 -0800 (PST)
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
X-Inumbo-ID: 5fc9a9cc-ad22-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MjkiLCJoZWxvIjoibWFpbC1lajEteDYyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVmYzlhOWNjLWFkMjItMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzU0ODYyLjE3NTgzOSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732754860; x=1733359660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgXdSuLeryn7gKdjlO3b+YNwyhuvuGb5oCNir+SwdrQ=;
        b=SQiWT5v40J2wECOWOnTRQq9UV2ix4c2/k/s37M5qFGhwTCbdd4zKNx8GJs6JYG12wN
         6NsglHXmfiU/sDwQCgw3n+fGKIitC3FYrlp8MxeUlEOVwSeclH/s+gNhgETvnGcMu2h5
         WXLq0rI+HKIrq/UTCb5iukPFbPc/i2DOn68X0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732754860; x=1733359660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XgXdSuLeryn7gKdjlO3b+YNwyhuvuGb5oCNir+SwdrQ=;
        b=XVIWgKWXUnTC7UnYCcz4CTrxG/h71j3bboiYPs40TGJK2TX1m/XdlvXOXEBYKNWkLU
         7p5sD7Y3pQ+pWPCBBY9T+HhDh6cKrYgYMJE7GINVIpBlNM54edcUsESLkNhOSBAM0B8y
         QbloFM9kCTnAXWc7yfhyk0HAr8Qwes9empeNxnSqhstGHRfvhm8Q1OeCjF40o9e+r9O9
         mX6HXKl7pKaqKHQy1s1fM46xfaowizU6zhrOGS+7JNWw6VB0xeB9MnTjA0soiytj05dR
         aTnPwX79jcsIOuwDN+54IFa3r4WpBFEzg2/6mx8D76Ec9aKB+ZDxxp74dcYs2J4FKO+g
         4kLg==
X-Gm-Message-State: AOJu0YzGWI5Ayw2NtCOLtu3DP6AsuZxRIRZqXfqWVvgJ4nJ9fLXHPcs8
	+tf+fqzPPPn+/bpJPICYoEDC0t3LlwScnmBDlvcMNPEN7MT46N94URZXaN6HZy06QpgSI6J8G1r
	B
X-Gm-Gg: ASbGncu3ooGiLn1KMBJlHxVOU15K86jsn4cVspI9B4It58s38EVxPnRZafKMYXUBwRm
	jpY+UL3jnd0F6ZAT6VLWTYj3anxMdytxQQmCskOUbcQmxpW/In8o4xoMGw+EZMzw+7fgmdnmSLB
	g6aqspyuo9yKs77StTvudTJEXVGvjtolsN60yEbykic2WA8Q/5zv+bGQZUtKdgiBOrcfjPEvGXG
	EYQf73/D/m//LV5UQpwvJdO4VX+K6oS1tC8XawjdswY2fvKqHp+P+Ay75JEjNnYQsRxOIsW2Kj4
X-Google-Smtp-Source: AGHT+IGQ2MLRzW2+Hl7iwK2dTy+HTMDBje2hZa97puqCLOsywB25j50LAGgqOpMeUFCooSk1Veea9w==
X-Received: by 2002:a17:907:2841:b0:aa5:2c61:e2dd with SMTP id a640c23a62f3a-aa580f5792emr347523066b.25.1732754860570;
        Wed, 27 Nov 2024 16:47:40 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
Date: Thu, 28 Nov 2024 00:47:36 +0000
Message-Id: <20241128004737.283521-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241128004737.283521-1-andrew.cooper3@citrix.com>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen currently presents APIC_ESR to guests as a simple read/write register.

This is incorrect.  The SDM states:

  The ESR is a write/read register. Before attempt to read from the ESR,
  software should first write to it. (The value written does not affect the
  values read subsequently; only zero may be written in x2APIC mode.) This
  write clears any previously logged errors and updates the ESR with any
  errors detected since the last write to the ESR. This write also rearms the
  APIC error interrupt triggering mechanism.

Introduce a new pending_esr field in hvm_hw_lapic.  Update vlapic_error() to
accumulate errors here, and extend vlapic_reg_write() to discard the written
value, and instead transfer pending_esr into APIC_ESR.  Reads are still as
before.

Importantly, this means that guests no longer destroys the ESR value it's
looking for in the LVTERR handler when following the SDM instructions.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Slightly RFC.  This collides with Alejandro's patch which adds the apic_id
field to hvm_hw_lapic too.  However, this is a far more obvious backport
candidate.

lapic_check_hidden() might in principle want to audit this field, but it's not
clear what to check.  While prior Xen will never have produced it in the
migration stream, Intel APIC-V will set APIC_ESR_ILLREGA above and beyond what
Xen will currently emulate.

I've checked that this does behave correctly under Intel APIC-V.  Writes to
APIC_ESR drop the written value into the backing page then take a trap-style
EXIT_REASON_APIC_WRITE which allows us to sample/latch properly.
---
 xen/arch/x86/hvm/vlapic.c              | 17 +++++++++++++++--
 xen/include/public/arch-x86/hvm/save.h |  1 +
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 3363926b487b..98394ed26a52 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -108,7 +108,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
     uint32_t esr;
 
     spin_lock_irqsave(&vlapic->esr_lock, flags);
-    esr = vlapic_get_reg(vlapic, APIC_ESR);
+    esr = vlapic->hw.pending_esr;
     if ( (esr & errmask) != errmask )
     {
         uint32_t lvterr = vlapic_get_reg(vlapic, APIC_LVTERR);
@@ -127,7 +127,7 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
                  errmask |= APIC_ESR_RECVILL;
         }
 
-        vlapic_set_reg(vlapic, APIC_ESR, esr | errmask);
+        vlapic->hw.pending_esr |= errmask;
 
         if ( inj )
             vlapic_set_irq(vlapic, lvterr & APIC_VECTOR_MASK, 0);
@@ -802,6 +802,19 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
         vlapic_set_reg(vlapic, APIC_ID, val);
         break;
 
+    case APIC_ESR:
+    {
+        unsigned long flags;
+
+        spin_lock_irqsave(&vlapic->esr_lock, flags);
+        val = vlapic->hw.pending_esr;
+        vlapic->hw.pending_esr = 0;
+        spin_unlock_irqrestore(&vlapic->esr_lock, flags);
+
+        vlapic_set_reg(vlapic, APIC_ESR, val);
+        break;
+    }
+
     case APIC_TASKPRI:
         vlapic_set_reg(vlapic, APIC_TASKPRI, val & 0xff);
         break;
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 7ecacadde165..9c4bfc7ebdac 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -394,6 +394,7 @@ struct hvm_hw_lapic {
     uint32_t             disabled; /* VLAPIC_xx_DISABLED */
     uint32_t             timer_divisor;
     uint64_t             tdt_msr;
+    uint32_t             pending_esr;
 };
 
 DECLARE_HVM_SAVE_TYPE(LAPIC, 5, struct hvm_hw_lapic);
-- 
2.39.5


