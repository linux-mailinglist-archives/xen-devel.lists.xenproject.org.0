Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 843EF48671F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 16:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254130.435693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5V6P-0006us-3d; Thu, 06 Jan 2022 15:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254130.435693; Thu, 06 Jan 2022 15:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5V6O-0006sp-Vx; Thu, 06 Jan 2022 15:54:56 +0000
Received: by outflank-mailman (input) for mailman id 254130;
 Thu, 06 Jan 2022 15:54:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZpKN=RW=gmail.com=d.vrabel.98@srs-se1.protection.inumbo.net>)
 id 1n5V6N-0006pY-N8
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 15:54:55 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd2b9a6a-6f08-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 16:54:54 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id s1so5647303wra.6
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jan 2022 07:54:54 -0800 (PST)
Received: from banana.davidvrabel.org.uk (banana.davidvrabel.org.uk.
 [82.70.146.42])
 by smtp.googlemail.com with ESMTPSA id v1sm2774524wru.45.2022.01.06.07.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 07:54:53 -0800 (PST)
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
X-Inumbo-ID: fd2b9a6a-6f08-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y1AW0BkZyzFhqk7ZQ0mbG8t/G0BRb4GlhbFQWQ0tl5w=;
        b=cqcKsDPBgXFnYf1kDMAsmJa7bD7RWidSMLCUCHO2+EvKOih+qt+XxLBXyBjfqYy34h
         5rMYwp6PLrZ3sT9vzBgRBM6RAukjJ+IsqRNm2Vu1d+EKkMzbdFhxzP7tr84zp4bRlsAu
         DvtwQW9TUPM7Ie2k+VOOiStR56kvZgOkNziBLQhhQHCY0plbKIuSg447dyXZhrvgIh9Y
         j67GTVGCagKp9rFWeJw1+utN2a9+RGWyiPgTzMZ9te7Rx3dj4Rlf9aCDYsgj+Yojl+Jo
         Ob6JHYawZdD2b2XLfOZIWg3FQqjzGu/YK5h27oEJwhDzcRU8qGIuCoAFoP5O6JJyxoXM
         oblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=y1AW0BkZyzFhqk7ZQ0mbG8t/G0BRb4GlhbFQWQ0tl5w=;
        b=lfzhxhaK28IGnd/N/Oqq13aQ6UQmcxMPKIDspXqC9vaTYqqSiZDiC7KNHizI8KmNej
         +BtLC5453S2fR4+mUit1TjME+vk4EylVa6f/u/yPDOwcViWFZelKqUZPKuBY2p8BJY0Q
         NORXX+YFexXf84sRhwMz5x7nR87gjIbJ7yCE3ZaXWyJg5YOa8+zKe25vwslW9qAZ4vhr
         N0fTLQ1NPQqcO2GJ400TS/f9dDIhSySdKNyAmUOfjis958VPm3rwsyfUzlno0MZEaoHb
         VRa2WRcqVdXk+YhQkS7jy1G89Ugz4Z/QlAD9IqWCYjv1VfvnSyPyyT/aYf2hixCI9Iwh
         EDrw==
X-Gm-Message-State: AOAM530tFQN2nSqtVkIixzRegBQQMHcZ1XWbE2tRFyewDhJHurQ58qWo
	iZUEfFy7OCGUI/etSG8v4+6meKeyKfGyCA==
X-Google-Smtp-Source: ABdhPJyUkplSOvtSJcQtPcVLuZMvW2US/LY03x54luf3G8JxzeScmUp2AVbO8pVnsQVHBy8tBs4VuA==
X-Received: by 2002:a5d:4690:: with SMTP id u16mr53266077wrq.321.1641484493683;
        Thu, 06 Jan 2022 07:54:53 -0800 (PST)
Sender: David Vrabel <d.vrabel.98@gmail.com>
From: David Vrabel <dvrabel@cantab.net>
X-Google-Original-From: David Vrabel <dvrabel@amazon.co.uk>
To: xen-devel@lists.xenproject.org
Cc: David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH] x86/hvm: save/restore per-VCPU event channel upcall vector
Date: Thu,  6 Jan 2022 15:54:42 +0000
Message-Id: <20220106155442.160258-1-dvrabel@amazon.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Windows XENBUS driver sets the per-VCPU LAPIC vector for event
channel interrupts using the HVMOP_set_evtchn_upcall_vector hypercall
(rather than using a vector-type callback in the CALLBACK_IRQ HVM
parameter since the vectors might be different for different VCPUs).

This state needs to be saved/restored or a restored guest may not be
able to get an event channel interrupts.

Note that the Windows XENBUS driver workarounds this by reissuing the
hypercall when resuming after a migration, but this workaround would
not be possible in an guest transparent live migration or a live
update.

Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
---
 xen/arch/x86/hvm/hvm.c                 | 50 ++++++++++++++++++++++++--
 xen/include/public/arch-x86/hvm/save.h | 12 ++++++-
 2 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 350dc396e3..be2e676c4a 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4071,6 +4071,52 @@ static int hvmop_flush_tlb_all(void)
     return paging_flush_tlb(NULL) ? 0 : -ERESTART;
 }
 
+static void hvm_set_evtchn_upcall_vector(struct vcpu *v, uint8_t vector)
+{
+    printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, vector);
+
+    v->arch.hvm.evtchn_upcall_vector = vector;
+    hvm_assert_evtchn_irq(v);
+}
+
+static int hvm_save_evtchn_upcall_vector(
+    struct vcpu *v, hvm_domain_context_t *h)
+{
+    struct hvm_evtchn_upcall_vector upcall;
+
+    /* Skip record if VCPU is down or the upcall vector is not used. */
+    if ( test_bit(_VPF_down, &v->pause_flags) )
+        return 0;
+    if ( v->arch.hvm.evtchn_upcall_vector == 0 )
+        return 0;
+
+    upcall.vector = v->arch.hvm.evtchn_upcall_vector;
+
+    return hvm_save_entry(EVTCHN_UPCALL_VECTOR, v->vcpu_id, h, &upcall);
+}
+
+static int hvm_load_evtchn_upcall_vector(
+    struct domain *d, hvm_domain_context_t *h)
+{
+    unsigned int vcpuid;
+    struct vcpu *v;
+    struct hvm_evtchn_upcall_vector upcall;
+
+    vcpuid = hvm_load_instance(h);
+    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
+        return -EINVAL;
+
+    if ( hvm_load_entry(EVTCHN_UPCALL_VECTOR, h, &upcall) != 0 )
+        return -EINVAL;
+
+    hvm_set_evtchn_upcall_vector(v, upcall.vector);
+
+    return 0;
+}
+
+HVM_REGISTER_SAVE_RESTORE(EVTCHN_UPCALL_VECTOR, hvm_save_evtchn_upcall_vector,
+                          hvm_load_evtchn_upcall_vector, 1, HVMSR_PER_VCPU);
+
 static int hvmop_set_evtchn_upcall_vector(
     XEN_GUEST_HANDLE_PARAM(xen_hvm_evtchn_upcall_vector_t) uop)
 {
@@ -4090,10 +4136,8 @@ static int hvmop_set_evtchn_upcall_vector(
     if ( (v = domain_vcpu(d, op.vcpu)) == NULL )
         return -ENOENT;
 
-    printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, op.vector);
+    hvm_set_evtchn_upcall_vector(v, op.vector);
 
-    v->arch.hvm.evtchn_upcall_vector = op.vector;
-    hvm_assert_evtchn_irq(v);
     return 0;
 }
 
diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
index 773a380bc2..177cb09150 100644
--- a/xen/include/public/arch-x86/hvm/save.h
+++ b/xen/include/public/arch-x86/hvm/save.h
@@ -641,12 +641,22 @@ struct hvm_msr {
 
 #define CPU_MSR_CODE  20
 
+/**
+ * Per-VCPU event channel upcall vector as set by
+ * HVMOP_set_evtchn_upcall_vector hypercall.
+ */
+struct hvm_evtchn_upcall_vector {
+    uint8_t vector;
+};
+
+DECLARE_HVM_SAVE_TYPE(EVTCHN_UPCALL_VECTOR, 21, struct hvm_evtchn_upcall_vector);
+
 /* Range 22 - 34 (inclusive) reserved for Amazon */
 
 /*
  * Largest type-code in use
  */
-#define HVM_SAVE_CODE_MAX 20
+#define HVM_SAVE_CODE_MAX 21
 
 #endif /* __XEN_PUBLIC_HVM_SAVE_X86_H__ */
 
-- 
2.30.2


