Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BA8BFD57
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:40:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718776.1121270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4ga9-0002hB-OS; Wed, 08 May 2024 12:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718776.1121270; Wed, 08 May 2024 12:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4ga9-0002eR-K5; Wed, 08 May 2024 12:39:37 +0000
Received: by outflank-mailman (input) for mailman id 718776;
 Wed, 08 May 2024 12:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nIi=ML=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s4ga8-0002bO-Ax
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:39:36 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05fbb670-0d38-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 14:39:34 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59a64db066so1105824266b.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 05:39:34 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 uj4-20020a170907c98400b00a599f876c28sm5984439ejc.38.2024.05.08.05.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 05:39:33 -0700 (PDT)
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
X-Inumbo-ID: 05fbb670-0d38-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715171973; x=1715776773; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQGCph8OwoOZ7Au91nMnyWXL6z4q2/NNY3PC0JWpYgc=;
        b=fnJa2taKYoWqge5+mJ0+kKfqsnYWuCRIx2K5a5Fiu9Z55EhIDsATBNfrYtXDa0ZEvO
         8jnzQm6cmyoFq3g/9ghgdnPd0HI42TTf06ndqj3sVoLSFnqhfYB8I82KdLC26e2z6GUy
         SpEK/rGSGn+EAxsayzn4GddDPLxvYWbl8xRwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171973; x=1715776773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQGCph8OwoOZ7Au91nMnyWXL6z4q2/NNY3PC0JWpYgc=;
        b=ltYPRltG1GT63mHy4d19XHZaSla/9mq+cLrfwatwkRoG6v0CGj9TilqGtzAeXN6zLg
         XAUiRgPGzypopeJquWdKPodvrPG7HS8TIIN2TSqAjGCfnVVwkXBSr7WhDUSgMSV7MtZ/
         4mzWOGSH7r1lSeH2YZmZ0noxBClizd6mP40ZDxrRDZ0PRuAJX4H3Lkrc9Vpc/JLD5gYf
         9sVUYpgPTDAuo9d8PuC0Xr7ruMpOW6gNVV2XqEOcEa1Ar5to1hPLeIDvror5L2dNwS5S
         Hjh/7A6AS86/439mO0CC40PeYFRLgmAuvxD9wbuLo3tlm2pi3o3y4JK07BYen7HnQdfX
         G+4g==
X-Gm-Message-State: AOJu0YzWUxT0f9B603KaonHbLQHxsxRo0P0G/ND64BsNNzddF5H0unxq
	9yeonqHaoh9MnglnYqLvQ3mp2Y0tON4vNqMS9Jh7VGY6vqHT9nMLbzh9Sm0uW8AKCXc1eK/lJ4s
	v
X-Google-Smtp-Source: AGHT+IFy+1YrPs2ygTxchgGmLZ0UyoDFvdObqrbFi+6msM/QkJlrfa66CMKbsLLSE2VB1GiduBNJ5A==
X-Received: by 2002:a17:906:dfc1:b0:a59:bcfd:d950 with SMTP id a640c23a62f3a-a59fb95e30bmr160219566b.46.1715171973587;
        Wed, 08 May 2024 05:39:33 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/8] xen/x86: Simplify header dependencies in x86/hvm
Date: Wed,  8 May 2024 13:39:21 +0100
Message-Id: <00ce7005d1d6db5c1ffc2d5023d34d4bd34ff841.1715102098.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715102098.git.alejandro.vallejo@cloud.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise it's not possible to call functions described in hvm/vlapic.h from the
inline functions of hvm/hvm.h.

This is because a static inline in vlapic.h depends on hvm.h, and pulls it
transitively through vpt.h. The ultimate cause is having hvm.h included in any
of the "v*.h" headers, so break the cycle moving the guilty inline into hvm.h.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * New patch. Prereq to moving vlapic_cpu_policy_changed() onto hvm.h
---
 xen/arch/x86/hvm/irq.c                | 6 +++---
 xen/arch/x86/hvm/vlapic.c             | 4 ++--
 xen/arch/x86/include/asm/hvm/hvm.h    | 6 ++++++
 xen/arch/x86/include/asm/hvm/vlapic.h | 6 ------
 xen/arch/x86/include/asm/hvm/vpt.h    | 1 -
 5 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 4a9fe82cbd8d..4f5479b12c98 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -512,13 +512,13 @@ struct hvm_intack hvm_vcpu_has_pending_irq(struct vcpu *v)
     int vector;
 
     /*
-     * Always call vlapic_sync_pir_to_irr so that PIR is synced into IRR when
-     * using posted interrupts. Note this is also done by
+     * Always call hvm_vlapic_sync_pir_to_irr so that PIR is synced into IRR
+     * when using posted interrupts. Note this is also done by
      * vlapic_has_pending_irq but depending on which interrupts are pending
      * hvm_vcpu_has_pending_irq will return early without calling
      * vlapic_has_pending_irq.
      */
-    vlapic_sync_pir_to_irr(v);
+    hvm_vlapic_sync_pir_to_irr(v);
 
     if ( unlikely(v->arch.nmi_pending) )
         return hvm_intack_nmi;
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 61a96474006b..8a244100009c 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -98,7 +98,7 @@ static void vlapic_clear_irr(int vector, struct vlapic *vlapic)
 
 static int vlapic_find_highest_irr(struct vlapic *vlapic)
 {
-    vlapic_sync_pir_to_irr(vlapic_vcpu(vlapic));
+    hvm_vlapic_sync_pir_to_irr(vlapic_vcpu(vlapic));
 
     return vlapic_find_highest_vector(&vlapic->regs->data[APIC_IRR]);
 }
@@ -1516,7 +1516,7 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
     if ( !has_vlapic(v->domain) )
         return 0;
 
-    vlapic_sync_pir_to_irr(v);
+    hvm_vlapic_sync_pir_to_irr(v);
 
     return hvm_save_entry(LAPIC_REGS, v->vcpu_id, h, vcpu_vlapic(v)->regs);
 }
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index e1f0585d75a9..84911f3ebcb4 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -798,6 +798,12 @@ static inline void hvm_update_vlapic_mode(struct vcpu *v)
         alternative_vcall(hvm_funcs.update_vlapic_mode, v);
 }
 
+static inline void hvm_vlapic_sync_pir_to_irr(struct vcpu *v)
+{
+    if ( hvm_funcs.sync_pir_to_irr )
+        alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
+}
+
 #else  /* CONFIG_HVM */
 
 #define hvm_enabled false
diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
index e8d41313abd3..34f23cd38a20 100644
--- a/xen/arch/x86/include/asm/hvm/vlapic.h
+++ b/xen/arch/x86/include/asm/hvm/vlapic.h
@@ -139,10 +139,4 @@ bool vlapic_match_dest(
     const struct vlapic *target, const struct vlapic *source,
     int short_hand, uint32_t dest, bool dest_mode);
 
-static inline void vlapic_sync_pir_to_irr(struct vcpu *v)
-{
-    if ( hvm_funcs.sync_pir_to_irr )
-        alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
-}
-
 #endif /* __ASM_X86_HVM_VLAPIC_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/vpt.h b/xen/arch/x86/include/asm/hvm/vpt.h
index feb0bf43f14b..0b92b286252d 100644
--- a/xen/arch/x86/include/asm/hvm/vpt.h
+++ b/xen/arch/x86/include/asm/hvm/vpt.h
@@ -11,7 +11,6 @@
 #include <xen/timer.h>
 #include <xen/list.h>
 #include <xen/rwlock.h>
-#include <asm/hvm/hvm.h>
 
 /*
  * Abstract layer of periodic time, one short time.
-- 
2.34.1


