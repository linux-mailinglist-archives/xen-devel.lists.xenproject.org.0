Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA0DA4CB66
	for <lists+xen-devel@lfdr.de>; Mon,  3 Mar 2025 19:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900538.1308427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpAvV-0006Be-73; Mon, 03 Mar 2025 18:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900538.1308427; Mon, 03 Mar 2025 18:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpAvV-00069I-4F; Mon, 03 Mar 2025 18:54:05 +0000
Received: by outflank-mailman (input) for mailman id 900538;
 Mon, 03 Mar 2025 18:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpAvT-00067h-CZ
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 18:54:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc48b8c9-f860-11ef-9898-31a8f345e629;
 Mon, 03 Mar 2025 19:53:57 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43996e95114so33002795e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 10:53:56 -0800 (PST)
Received: from andrew-laptop.. ([46.149.103.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47965f3sm15140904f8f.9.2025.03.03.10.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 10:53:55 -0800 (PST)
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
X-Inumbo-ID: dc48b8c9-f860-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741028036; x=1741632836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FezzsOImO4onsg7bakHI1l7rdGenIViqsoTWiG9gE8U=;
        b=Rfhx4BI9Rkhk49xzoovTYlv5iBcSWFy+tfuov2M3G7b80fOmpiJJhLWi58nRhPZjcG
         75nTH7yljc2oYiyqTzOMOBjWK+MVuis9aajUGMhxaVXj+p/p+7HuqQotucDVW1G7mq2b
         /hr6xw4d1CQWNsG5QuSKlL4QJ+jpKXEshGgXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741028036; x=1741632836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FezzsOImO4onsg7bakHI1l7rdGenIViqsoTWiG9gE8U=;
        b=Cq7dsPzNaLfoTLW/d+2bTdir9RWrgs+w4sPK0URQHRaqmuKYWtxiIUMVSA3VT4GMJY
         FN2wlE9Y3TZOIwhxPZGGpUeEMbAJqpvlHxWv0xj3blzuo8ARPFdcGrOe5p2J/GjSIqXo
         1soznXy+82aYKtULbr/f9WbtZ5rXGheDZsn5FjLs18QjwOhxdqoA67q+n8Oo2dxzMhqL
         Fh+Cedkp4YfSaKldePfM20w5s1t+/lckt+iS4a1Q1EVagZ34zABW/GLmWsKmgBaJliEu
         jtVx+mmu+MCD+ONZKhnbHoJYZCOUHhVI5XROjbjAaw2MUZvh7mYa8Oujt2LibFpRy9Gd
         U0rg==
X-Gm-Message-State: AOJu0YxhOC0/4jtLZMhJeQjT4sR2a8OBWOlpQk6CsMwcdf1MOYj6yGg4
	xpkaiu4vBuJmWBU02vuyl52r35hVJNI3uMqkrKthS+1yRWhA/CLfcm6QSBboNwruQQTcQ08FHwt
	O
X-Gm-Gg: ASbGncsWaBpFyXPZ5JiAG7C/7As4GvyFTU/FaQfdE/dr+nqPTXdeVKxH+f6PS6iO1vx
	6x6NtDNPZzDxpOrY0DVAL8SAZOEH31wqR5M7QPQOIvSKkTXpP5DGzmAzubUaQifVFfzSb+XoGnj
	rSgeVeuzq80hIlA0mGkqU5G8GE0NMdHgY3agdrB62yP9Aa0V88dRaFrPNGFjYHOCBRYzv1QL42/
	3qjtSnzwtzkAb6GXis6HddRZfiSQ7CERoQkp8r16mVhfvxFmvXMohDcqDApTEThCqLlJdrlJ4eX
	57bR14WzGEcp6FzQaSEGMw0q0RedFtUJnV0YQ+RTytGS95ry/Zpmkag=
X-Google-Smtp-Source: AGHT+IH+eg7uJilgJ1jp88/bBwLgR10gQO/8K70Dfq8f9ofyOjYeXyNBJQDCNcnigq7hFD1ZFHYsZg==
X-Received: by 2002:a05:600c:3150:b0:43b:c826:8801 with SMTP id 5b1f17b1804b1-43bc82688c4mr26395725e9.12.1741028036162;
        Mon, 03 Mar 2025 10:53:56 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/2] x86/vlapic: Drop vlapic->esr_lock
Date: Mon,  3 Mar 2025 18:53:52 +0000
Message-Id: <20250303185352.86499-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303185352.86499-1-andrew.cooper3@citrix.com>
References: <20250303185352.86499-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The exact behaviour of LVTERR interrupt generation is implementation
specific.

 * Newer Intel CPUs generate an interrupt when pending_esr becomes
   nonzero.

 * Older Intel and all AMD CPUs generate an interrupt when any
   individual bit in pending_esr becomes nonzero.

Neither vendor documents their behaviour very well.  Xen implements
the per-bit behaviour and has done since support was added.

Importantly, the per-bit behaviour can be expressed using the atomic
operations available in the x86 architecture, whereas the
former (interrupt only on pending_esr becoming nonzero) cannot.

With vlapic->hw.pending_esr held outside of the main regs page, it's
much easier to use atomic operations.

Use xchg() in vlapic_reg_write(), and *set_bit() in vlapic_error().

The only interesting change is that vlapic_error() now needs to take a
single bit only, rather than a mask, but this fine for all current
callers and forseable changes.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Confirmed by Intel, AMD, and 3rd party sources.

https://sandpile.org/x86/apic.htm has been updated to note this
behaviour.  None of the vendors have indicated an enthusiasm to
clarify the behaviour in their docs.

v2:
 * Rewrite the commit message from scratch.
---
 xen/arch/x86/hvm/vlapic.c             | 39 ++++++++++-----------------
 xen/arch/x86/include/asm/hvm/vlapic.h |  1 -
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 98394ed26a52..82b6d12e99d4 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -102,14 +102,16 @@ static int vlapic_find_highest_irr(struct vlapic *vlapic)
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
+    /*
+     * Whether LVTERR is delivered on a per-bit basis, or only on
+     * pending_esr becoming nonzero is implementation specific.
+     *
+     * Xen implements the per-bit behaviour as it can be expressed
+     * locklessly.
+     */
+    if ( !test_and_set_bit(err_bit, &vlapic->hw.pending_esr) )
     {
         uint32_t lvterr = vlapic_get_reg(vlapic, APIC_LVTERR);
         bool inj = false;
@@ -124,15 +126,12 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
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
@@ -153,7 +152,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
 
     if ( unlikely(vec < 16) )
     {
-        vlapic_error(vlapic, APIC_ESR_RECVILL);
+        vlapic_error(vlapic, ilog2(APIC_ESR_RECVILL));
         return;
     }
 
@@ -525,7 +524,7 @@ void vlapic_ipi(
             vlapic_domain(vlapic), vlapic, short_hand, dest, dest_mode);
 
         if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
-            vlapic_error(vlapic, APIC_ESR_SENDILL);
+            vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
         else if ( target )
             vlapic_accept_irq(vlapic_vcpu(target), icr_low);
         break;
@@ -534,7 +533,7 @@ void vlapic_ipi(
     case APIC_DM_FIXED:
         if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
         {
-            vlapic_error(vlapic, APIC_ESR_SENDILL);
+            vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
             break;
         }
         /* fall through */
@@ -803,17 +802,9 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val)
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
@@ -1716,8 +1707,6 @@ int vlapic_init(struct vcpu *v)
 
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
2.34.1


