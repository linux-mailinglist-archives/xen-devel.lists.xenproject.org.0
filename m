Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E169DB064
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 01:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845109.1260594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGShC-0007da-AQ; Thu, 28 Nov 2024 00:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845109.1260594; Thu, 28 Nov 2024 00:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGShC-0007Ym-4f; Thu, 28 Nov 2024 00:47:50 +0000
Received: by outflank-mailman (input) for mailman id 845109;
 Thu, 28 Nov 2024 00:47:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53lb=SX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGSh9-0007X0-SB
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 00:47:47 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 608317d5-ad22-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 01:47:43 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa51bf95ce1so46739766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 16:47:43 -0800 (PST)
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
X-Inumbo-ID: 608317d5-ad22-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjYwODMxN2Q1LWFkMjItMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzU0ODYzLjQzOTk4MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732754862; x=1733359662; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hO+c4zSHv6GooiaL4lgtBPaHRWWE0cSt1ip5R5YyClg=;
        b=Cr/xtbAAgUhnF2Dq6gUsCOE4oK4PlzNg/PNW2HbA+RGWXWRuhxw1OFKwdB8Zkl7amH
         2l6Uk8Af7DiB568MV43azyvINAARdeVCIDV9TWGtCCW6dXF/hTWPcq1T2NGpYcAPIjRH
         6MCnsNX5ZC3eFoJ8TKrH9XxeUB3HKcgCfkH/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732754862; x=1733359662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hO+c4zSHv6GooiaL4lgtBPaHRWWE0cSt1ip5R5YyClg=;
        b=o4Dxu6ziH/+dyo4nFbR8M01iWjM7jeo/C5DRPD7xZqq2EuoEML9E4ggPgZICmaalEA
         LknsyxbtzOg296BQN+n68rzMprluEUwnDwXucoHB+rJ9ULUAOf1mNH3ggrpugjtYOhFA
         qJKAS0WqACnRLJB5Uzd+dJFkXH3tm1zL7x0bW5EC7gxK9oPa65a0v9rFq6SOxNAqnGn8
         qVpb6Jxf5gmkkwjlYqQZW7G1IyFm8HA+WQCLZ5PaGFNpGgchZ+Njqo+7/IIaBIO8c+H7
         nRqwtGJwA8x4VYNPN/WOcBHVyFwaGDv4brjGGtmXPOHO2MFJdatWT1uMjR1cPadUbIq4
         hx2Q==
X-Gm-Message-State: AOJu0YzqwoyG4/+EYLRNVwco4Cv1/Ja077RKnxDmj6hwgbEFywHCFSJ8
	j+MrZ6cUNUmJ8yGv7+lABrEnhI9qxpPj1SyH4oVgM3cGFhkkvwl0tD9mTbMgh17xT3s9BjtxNcp
	I
X-Gm-Gg: ASbGncveGCXfVu8WbC7GWxgGGWwk35CKyWwk05EbeKIo1oC0W3LykjsmXXEDHlRgIV4
	VXEjhKwYHAdyK5uSSGCxk8pYYD9J5gXDY76Nn75CqT3pef47dsVe86lsR7kekb29BMlQ22TSB+Q
	EDaXhJM4Lua/+w7Nt8gnhkHvXXAGTQ2bovL8zueVZ6B638TrylY/AGyIFfPmSSe006206A5EeU6
	RLdw1gOGJtGfNBpv0i/QPQWZJRV2ZT4VQ9IeU/ShH+JIdCPkW2QlI8NYwsDF+DJ04Il3H0/zJ2J
X-Google-Smtp-Source: AGHT+IFIFs+YwOEKB4EZlLhXjxstlabFl06TT5YoexC0l10sDiBlOU+Ef3QDwFvr9r3mfNNjL6/UMw==
X-Received: by 2002:a17:906:9d2:b0:a99:f605:7f1b with SMTP id a640c23a62f3a-aa581078a5fmr436758666b.60.1732754862364;
        Wed, 27 Nov 2024 16:47:42 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86/vlapic: Drop vlapic->esr_lock
Date: Thu, 28 Nov 2024 00:47:37 +0000
Message-Id: <20241128004737.283521-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241128004737.283521-1-andrew.cooper3@citrix.com>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With vlapic->hw.pending_esr held outside of the main regs page, it's much
easier to use atomic operations.

Use xchg() in vlapic_reg_write(), and *set_bit() in vlapic_error().

The only interesting change is that vlapic_error() now needs to take an
err_bit rather than an errmask, but thats fine for all current callers and
forseable changes.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

It turns out that XSA-462 had an indentation bug in it.

Our spinlock infrastructure is obscenely large.  Bloat-o-meter reports:

  add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-111 (-111)
  Function                                     old     new   delta
  vlapic_init                                  208     190     -18
  vlapic_error                                 112      67     -45
  vlapic_reg_write                            1145    1097     -48

In principle we could revert the XSA-462 patch now, and remove the LVTERR
vector handling special case.  MISRA is going to complain either way, because
it will see the cycle through vlapic_set_irq() without considering the
surrounding logic.
---
 xen/arch/x86/hvm/vlapic.c             | 32 ++++++---------------------
 xen/arch/x86/include/asm/hvm/vlapic.h |  1 -
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 98394ed26a52..f41a5d4619bb 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -102,14 +102,9 @@ static int vlapic_find_highest_irr(struct vlapic *vlapic)
     return vlapic_find_highest_vector(&vlapic->regs->data[APIC_IRR]);
 }
 
-static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
+static void vlapic_error(struct vlapic *vlapic, unsigned int err_bit)
 {
-    unsigned long flags;
-    uint32_t esr;
-
-    spin_lock_irqsave(&vlapic->esr_lock, flags);
-    esr = vlapic->hw.pending_esr;
-    if ( (esr & errmask) != errmask )
+    if ( !test_and_set_bit(err_bit, &vlapic->hw.pending_esr) )
     {
         uint32_t lvterr = vlapic_get_reg(vlapic, APIC_LVTERR);
         bool inj = false;
@@ -124,15 +119,12 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
             if ( (lvterr & APIC_VECTOR_MASK) >= 16 )
                  inj = true;
             else
-                 errmask |= APIC_ESR_RECVILL;
+                set_bit(ilog2(APIC_ESR_RECVILL), &vlapic->hw.pending_esr);
         }
 
-        vlapic->hw.pending_esr |= errmask;
-
         if ( inj )
             vlapic_set_irq(vlapic, lvterr & APIC_VECTOR_MASK, 0);
     }
-    spin_unlock_irqrestore(&vlapic->esr_lock, flags);
 }
 
 bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
@@ -153,7 +145,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
 
     if ( unlikely(vec < 16) )
     {
-        vlapic_error(vlapic, APIC_ESR_RECVILL);
+        vlapic_error(vlapic, ilog2(APIC_ESR_RECVILL));
         return;
     }
 
@@ -525,7 +517,7 @@ void vlapic_ipi(
             vlapic_domain(vlapic), vlapic, short_hand, dest, dest_mode);
 
         if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
-            vlapic_error(vlapic, APIC_ESR_SENDILL);
+            vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
         else if ( target )
             vlapic_accept_irq(vlapic_vcpu(target), icr_low);
         break;
@@ -534,7 +526,7 @@ void vlapic_ipi(
     case APIC_DM_FIXED:
         if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
         {
-            vlapic_error(vlapic, APIC_ESR_SENDILL);
+            vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
             break;
         }
         /* fall through */
@@ -803,17 +795,9 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
         break;
 
     case APIC_ESR:
-    {
-        unsigned long flags;
-
-        spin_lock_irqsave(&vlapic->esr_lock, flags);
-        val = vlapic->hw.pending_esr;
-        vlapic->hw.pending_esr = 0;
-        spin_unlock_irqrestore(&vlapic->esr_lock, flags);
-
+        val = xchg(&vlapic->hw.pending_esr, 0);
         vlapic_set_reg(vlapic, APIC_ESR, val);
         break;
-    }
 
     case APIC_TASKPRI:
         vlapic_set_reg(vlapic, APIC_TASKPRI, val & 0xff);
@@ -1716,8 +1700,6 @@ int vlapic_init(struct vcpu *v)
 
     vlapic_reset(vlapic);
 
-    spin_lock_init(&vlapic->esr_lock);
-
     tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
 
     if ( v->vcpu_id == 0 )
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index 2c4ff94ae7a8..c38855119836 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -69,7 +69,6 @@ struct vlapic {
         bool                 hw, regs;
         uint32_t             id, ldr;
     }                        loaded;
-    spinlock_t               esr_lock;
     struct periodic_time     pt;
     s_time_t                 timer_last_update;
     struct page_info         *regs_page;
-- 
2.39.5


