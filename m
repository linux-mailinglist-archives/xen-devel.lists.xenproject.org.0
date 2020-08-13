Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1F243814
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 11:58:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k69zM-0007KI-7Y; Thu, 13 Aug 2020 09:57:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1tBP=BX=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k69zL-0007KD-8u
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 09:57:35 +0000
X-Inumbo-ID: 7cf794d3-aa32-432d-8efa-a0e703a662b2
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cf794d3-aa32-432d-8efa-a0e703a662b2;
 Thu, 13 Aug 2020 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=/npEJrZKG19Ocm4lBQ1kQaEJj5WG1MUZrSg8StO3EQ4=; b=NLjQ3JpRe+LWvL1/lahp8GqjFw
 OF76yGPz5yrE3h4OHyGkGWyVm2EreK7+lzgsYErLXD5y1AnZ+AA89ogLXa3dEoU/P/LhNNhrpPoH4
 CuCzZ05fcOaOZ+uKrjqz5gpbsNWe2+Rb9Zzxs129uFpTOP84IvrVg1Sy7iskgju2XeEM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k69zJ-0005fu-R2; Thu, 13 Aug 2020 09:57:33 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k69zJ-0005hJ-IX; Thu, 13 Aug 2020 09:57:33 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86 / viridian: remove the viridian_vcpu msg_pending bit mask
Date: Thu, 13 Aug 2020 10:57:23 +0100
Message-Id: <20200813095723.1429-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Paul Durrant <pdurrant@amazon.com>

The mask does not actually serve a useful purpose as we only use the SynIC
for timer messages. Dropping the mask means that the EOM MSR handler
essentially becomes a no-op. This means we can avoid setting 'message_pending'
for timer messages and hence avoid a VMEXIT for the EOM.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Wei Liu <wl@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

This should hopefully simplify Roger's "x86/vlapic: implement EOI callbacks"
series a little.
---
 xen/arch/x86/hvm/viridian/synic.c  | 24 +-----------------------
 xen/arch/x86/hvm/vlapic.c          |  2 --
 xen/include/asm-x86/hvm/viridian.h |  2 --
 3 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/xen/arch/x86/hvm/viridian/synic.c b/xen/arch/x86/hvm/viridian/synic.c
index 94a2b88733..22e2df27e5 100644
--- a/xen/arch/x86/hvm/viridian/synic.c
+++ b/xen/arch/x86/hvm/viridian/synic.c
@@ -137,7 +137,6 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
         if ( !(viridian_feature_mask(d) & HVMPV_synic) )
             return X86EMUL_EXCEPTION;
 
-        vv->msg_pending = 0;
         break;
 
     case HV_X64_MSR_SINT0 ... HV_X64_MSR_SINT15:
@@ -168,9 +167,6 @@ int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val)
         printk(XENLOG_G_INFO "%pv: VIRIDIAN SINT%u: vector: %x\n", v, sintx,
                vector);
 
-        if ( new.polling )
-            __clear_bit(sintx, &vv->msg_pending);
-
         *vs = new;
         break;
     }
@@ -334,9 +330,6 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
         .DeliveryTime = delivery,
     };
 
-    if ( test_bit(sintx, &vv->msg_pending) )
-        return false;
-
     /*
      * To avoid using an atomic test-and-set, and barrier before calling
      * vlapic_set_irq(), this function must be called in context of the
@@ -346,12 +339,9 @@ bool viridian_synic_deliver_timer_msg(struct vcpu *v, unsigned int sintx,
 
     msg += sintx;
 
+    /* There is no need to set message_pending as we do not require an EOM */
     if ( msg->header.message_type != HVMSG_NONE )
-    {
-        msg->header.message_flags.msg_pending = 1;
-        __set_bit(sintx, &vv->msg_pending);
         return false;
-    }
 
     msg->header.message_type = HVMSG_TIMER_EXPIRED;
     msg->header.message_flags.msg_pending = 0;
@@ -380,18 +370,6 @@ bool viridian_synic_is_auto_eoi_sint(const struct vcpu *v,
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
index 7b5c633033..1aff4cf989 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -466,8 +466,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
 
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
         vioapic_update_EOI(d, vector);
-    else if ( has_viridian_synic(d) )
-        viridian_synic_ack_sint(v, vector);
 
     hvm_dpci_msi_eoi(d, vector);
 }
diff --git a/xen/include/asm-x86/hvm/viridian.h b/xen/include/asm-x86/hvm/viridian.h
index 844e56b38f..cbf77d9c76 100644
--- a/xen/include/asm-x86/hvm/viridian.h
+++ b/xen/include/asm-x86/hvm/viridian.h
@@ -31,7 +31,6 @@ struct viridian_vcpu
     struct viridian_page vp_assist;
     bool apic_assist_pending;
     bool polled;
-    unsigned int msg_pending;
     uint64_t scontrol;
     uint64_t siefp;
     struct viridian_page simp;
@@ -89,7 +88,6 @@ void viridian_apic_assist_clear(const struct vcpu *v);
 void viridian_synic_poll(struct vcpu *v);
 bool viridian_synic_is_auto_eoi_sint(const struct vcpu *v,
                                      unsigned int vector);
-void viridian_synic_ack_sint(const struct vcpu *v, unsigned int vector);
 
 #endif /* __ASM_X86_HVM_VIRIDIAN_H__ */
 
-- 
2.20.1


