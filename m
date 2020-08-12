Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC82429A5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 14:48:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5qAR-0006a9-3B; Wed, 12 Aug 2020 12:47:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOR4=BW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5qAQ-0006ZO-0h
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 12:47:42 +0000
X-Inumbo-ID: 880b2dae-fce3-4085-9756-7bb5ee8b7757
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 880b2dae-fce3-4085-9756-7bb5ee8b7757;
 Wed, 12 Aug 2020 12:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597236460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q3MiLHAhAHNiPwuVE11OtW79xlxcO35A8P9+Xd2bmlQ=;
 b=MTNrXx73lNaLMwa2SdaNMU5tqZW+/9EUtrgZUtAx4sPkV28/ast94eZU
 FKcwf1MDocVPjuHlWGMGY6fPKBQ/wt5ZvYhBPdiGkw4zSHe/ju2A/8v+/
 1m+aEjKCKAUFJkPfYLNy4uzyR9nOyt45iAdydbqaAc3rK7FGZbfeWdkLX Q=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dtcbon7iAF4f7uIC/Vdr/f6tq7McFktUGHksYldFf1xu8RHOatLyn2AByPEg6wgTReynZ6abef
 W84EL90Fzi6ueeVFkGs3XILIaohQBhXuSDb3GOolIsftCrXwSnhIwIxv47L9TWkqpD+vUhnNly
 iOXQGUqOPcgop31QsJo5CcL5kI+jTJHz/Aj653LBFWr5aqEenEuium+Gww1Fgy8K82X3w7tb7E
 R8YQMX6ZkGCJdlNI+NkEWepkIO0KTr3ojeHHZmXum5zlG5LhOEzOxX2kACaEMbfTrH3nxoYGY7
 DLo=
X-SBRS: 2.7
X-MesageID: 24344723
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,304,1592884800"; d="scan'208";a="24344723"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>, "Wei
 Liu" <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: [PATCH 4/5] x86/viridian: switch synic to use the new EOI callback
Date: Wed, 12 Aug 2020 14:47:08 +0200
Message-ID: <20200812124709.4165-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812124709.4165-1-roger.pau@citrix.com>
References: <20200812124709.4165-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Switch synic interrupts to use an EOI callback in order to execute the
logic tied to the end of interrupt. This allows to remove the synic
call in vlapic_handle_EOI.

Move and rename viridian_synic_ack_sint now that it can be made
static.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm unsure about the logic in viridian_synic_deliver_timer_msg, as it
seems to only set the vector in msg_pending when the message is
already pending?
---
 xen/arch/x86/hvm/viridian/synic.c  | 28 +++++++++++++++-------------
 xen/arch/x86/hvm/vlapic.c          |  4 ----
 xen/include/asm-x86/hvm/viridian.h |  1 -
 3 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index 94a2b88733..250f0353cf 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -315,6 +315,19 @@ void viridian_synic_poll(struct vcpu *v)
     viridian_time_poll_timers(v);
 }
 
+static void synic_ack_sint(struct vcpu *v, unsigned int vector, void *data)
+{
+    struct viridian_vcpu *vv = v->arch.hvm.viridian;
+    unsigned int sintx = vv->vector_to_sintx[vector];
+
+    ASSERT(v == current);
+
+    if ( sintx < ARRAY_SIZE(vv->sint) )
+        __clear_bit(array_index_nospec(sintx, ARRAY_SIZE(vv->sint)),
+                    &vv->msg_pending);
+}
+
+
 bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
                                       unsigned int index,
                                       uint64_t expiration,
@@ -361,7 +374,8 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
     memcpy(msg->u.payload, &payload, sizeof(payload));
 
     if ( !vs->masked )
-        vlapic_set_irq(vcpu_vlapic(v), vs->vector, 0);
+        vlapic_set_irq_callback(vcpu_vlapic(v), vs->vector, 0,
+                                synic_ack_sint, NULL);
 
     return true;
 }
@@ -380,18 +394,6 @@ bool viridian_synic_is_auto_eoi_sint(const struct vcpu *v,
     return vs->auto_eoi;
 }
 
-void viridian_synic_ack_sint(const struct vcpu *v, unsigned int vector)
-{
-    struct viridian_vcpu *vv = v->arch.hvm.viridian;
-    unsigned int sintx = vv->vector_to_sintx[vector];
-
-    ASSERT(v == current);
-
-    if ( sintx < ARRAY_SIZE(vv->sint) )
-        __clear_bit(array_index_nospec(sintx, ARRAY_SIZE(vv->sint)),
-                    &vv->msg_pending);
-}
-
 void viridian_synic_save_vcpu_ctxt(const struct vcpu *v,
                                    struct hvm_viridian_vcpu_context *ctxt)
 {
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 3b3b3d7621..701ff942e6 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -489,12 +489,8 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
     void *data;
     unsigned long flags;
 
-    /* All synic SINTx vectors are edge triggered */
-
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
         vioapic_update_EOI(d, vector);
-    else if ( has_viridian_synic(d) )
-        viridian_synic_ack_sint(v, vector);
 
     spin_lock_irqsave(&vlapic->callback_lock, flags);
     callback = vlapic->callbacks[vector].callback;
diff --git a/xen/include/asm-x86/hvm/viridian.h b/xen/include/asm-x86/hvm/viridian.h
index 844e56b38f..d387d11ce0 100644
--- a/xen/include/asm-x86/hvm/viridian.h
+++ b/xen/include/asm-x86/hvm/viridian.h
@@ -89,7 +89,6 @@ void viridian_apic_assist_clear(const struct vcpu *v);
 void viridian_synic_poll(struct vcpu *v);
 bool viridian_synic_is_auto_eoi_sint(const struct vcpu *v,
                                      unsigned int vector);
-void viridian_synic_ack_sint(const struct vcpu *v, unsigned int vector);
 
 #endif /* __ASM_X86_HVM_VIRIDIAN_H__ */
 
-- 
2.28.0


