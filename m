Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B581A3908
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 19:41:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMbAy-0005o3-DR; Thu, 09 Apr 2020 17:41:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Iid=5Z=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jMbAw-0005nd-UW
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 17:41:14 +0000
X-Inumbo-ID: 4c808572-7a89-11ea-b4f4-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c808572-7a89-11ea-b4f4-bc764e2007e4;
 Thu, 09 Apr 2020 17:41:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c15so12812157wro.11
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2020 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wCPmXjDpRWok5TonwMVFK8+g7QHuptr6hywfXNboPyw=;
 b=O9cCtAz7/p3AvJ8doG7y5GZ7RPff25wtbtUKNKxFMr6wPZgOV+QZqAVcK4k64Ic9Yy
 dHwp9hQIeix9yRQRaNRYTyUJLPyk2Eyjp2ZxSini8N/6I57BWcTsUO4zFsoIbbfHNg/b
 JB9bUoVsJxBIu1uDIw7DLYafemuaps9NySImtrOdlGXRopSZ+TVPRBitNUl0+1OUHVN9
 BazVY8eiV12Eyfd+8cEOrlsPx+5XZwQhwCM7Ifo481NZWo3PNuk/EuURM00P2/kYybZe
 ICdjGkH7TuygQCew3hcPwS546ripXyb+9+oxoqx0kh/x/qnjJy8wXle+vm5w6bk4XwWo
 0zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wCPmXjDpRWok5TonwMVFK8+g7QHuptr6hywfXNboPyw=;
 b=bXR2hCqOfnkgZ/gqoxsBTYsj/BNQFPvnAj1LEuyieD11vveYJxcNZD1ld0v9liKgr8
 snUCJIVSPBTC/KFYAdtXbdT7iPG00+VGexsTT4+3eSfvj0I9JEUevH1/AxvHWyYvZuG3
 QRQh3eaEZ5KuzbXqwMIJx4Hf7mnVnNu54amZEoiZJ4uhqdpfnXk6fDVXh0m5pRTTHCxi
 G1PzmnFE1+9YVbm2+2Ng9kpZJxF4uC21JsJqHAFkaVbZ+Q5uKFlr/oHJhH2CHl5kuynK
 Y3gJjWfLGXbNIpoINO5pVZAlpnc0grQAPRYBFxzJ1i4qjqny2+eHB782ThKyRj+l6LUt
 ITsg==
X-Gm-Message-State: AGi0PubLFAsYc2aRnMZaheeK646pZ4kS/LOWD4qwEfDvQBtC8LYLZwYV
 woLk8x0ZTRyx20cCJsDqHvF38lSR
X-Google-Smtp-Source: APiQypJa3J31R9nVK7hXUvQcecFUXQdIH/hJQqh6LVJXbR1H+7hRKIOgSQlN6BbmpXJO+y+Rz6nW8w==
X-Received: by 2002:a5d:5273:: with SMTP id l19mr307445wrc.42.1586454069405;
 Thu, 09 Apr 2020 10:41:09 -0700 (PDT)
Received: from localhost.localdomain (44.142.6.51.dyn.plus.net. [51.6.142.44])
 by smtp.gmail.com with ESMTPSA id
 c18sm40086006wrx.5.2020.04.09.10.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 10:41:08 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: [PATCH v5 1/3] x86/hypervisor: pass flags to hypervisor_flush_tlb
Date: Thu,  9 Apr 2020 18:41:02 +0100
Message-Id: <20200409174104.23946-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409174104.23946-1-liuwe@microsoft.com>
References: <20200409174104.23946-1-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hyper-V's L0 assisted flush has fine-grained control over what gets
flushed. We need all the flags available to make the best decisions
possible.

No functional change because Xen's implementation doesn't care about
what is passed to it.

Signed-off-by: Wei Liu <liuwe@microsoft.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Paul Durrant <pdurrant@amazon.com>
---
v5:
1. Drop FLUSH_TLB_FLAGS_MASK

v2:
1. Introduce FLUSH_TLB_FLAGS_MASK
---
 xen/arch/x86/guest/hypervisor.c        |  4 ++--
 xen/arch/x86/guest/xen/xen.c           |  2 +-
 xen/arch/x86/smp.c                     |  2 +-
 xen/include/asm-x86/guest/hypervisor.h | 10 +++++-----
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/guest/hypervisor.c b/xen/arch/x86/guest/hypervisor.c
index e46de42ded..366af1d650 100644
--- a/xen/arch/x86/guest/hypervisor.c
+++ b/xen/arch/x86/guest/hypervisor.c
@@ -79,10 +79,10 @@ void __init hypervisor_e820_fixup(struct e820map *e820)
 }
 
 int hypervisor_flush_tlb(const cpumask_t *mask, const void *va,
-                         unsigned int order)
+                         unsigned int flags)
 {
     if ( ops.flush_tlb )
-        return alternative_call(ops.flush_tlb, mask, va, order);
+        return alternative_call(ops.flush_tlb, mask, va, flags);
 
     return -EOPNOTSUPP;
 }
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index 3bc01c8723..2ff63d370a 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -324,7 +324,7 @@ static void __init e820_fixup(struct e820map *e820)
         pv_shim_fixup_e820(e820);
 }
 
-static int flush_tlb(const cpumask_t *mask, const void *va, unsigned int order)
+static int flush_tlb(const cpumask_t *mask, const void *va, unsigned int flags)
 {
     return xen_hypercall_hvm_op(HVMOP_flush_tlbs, NULL);
 }
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 1d9fec65de..6f1aaa2106 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -272,7 +272,7 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
         if ( cpu_has_hypervisor &&
              !(flags & ~(FLUSH_TLB | FLUSH_TLB_GLOBAL | FLUSH_VA_VALID |
                          FLUSH_ORDER_MASK)) &&
-             !hypervisor_flush_tlb(mask, va, (flags - 1) & FLUSH_ORDER_MASK) )
+             !hypervisor_flush_tlb(mask, va, flags) )
             return;
 
         spin_lock(&flush_lock);
diff --git a/xen/include/asm-x86/guest/hypervisor.h b/xen/include/asm-x86/guest/hypervisor.h
index 77a1d21824..0a6c3b47ab 100644
--- a/xen/include/asm-x86/guest/hypervisor.h
+++ b/xen/include/asm-x86/guest/hypervisor.h
@@ -35,7 +35,7 @@ struct hypervisor_ops {
     /* Fix up e820 map */
     void (*e820_fixup)(struct e820map *e820);
     /* L0 assisted TLB flush */
-    int (*flush_tlb)(const cpumask_t *mask, const void *va, unsigned int order);
+    int (*flush_tlb)(const cpumask_t *mask, const void *va, unsigned int flags);
 };
 
 #ifdef CONFIG_GUEST
@@ -48,11 +48,11 @@ void hypervisor_e820_fixup(struct e820map *e820);
 /*
  * L0 assisted TLB flush.
  * mask: cpumask of the dirty vCPUs that should be flushed.
- * va: linear address to flush, or NULL for global flushes.
- * order: order of the linear address pointed by va.
+ * va: linear address to flush, or NULL for entire address space.
+ * flags: flags for flushing, including the order of va.
  */
 int hypervisor_flush_tlb(const cpumask_t *mask, const void *va,
-                         unsigned int order);
+                         unsigned int flags);
 
 #else
 
@@ -65,7 +65,7 @@ static inline int hypervisor_ap_setup(void) { return 0; }
 static inline void hypervisor_resume(void) { ASSERT_UNREACHABLE(); }
 static inline void hypervisor_e820_fixup(struct e820map *e820) {}
 static inline int hypervisor_flush_tlb(const cpumask_t *mask, const void *va,
-                                       unsigned int order)
+                                       unsigned int flags)
 {
     return -EOPNOTSUPP;
 }
-- 
2.20.1


