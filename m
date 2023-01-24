Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E688679836
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483550.749785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIcg-0000iq-Fc; Tue, 24 Jan 2023 12:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483550.749785; Tue, 24 Jan 2023 12:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKIcg-0000fJ-BD; Tue, 24 Jan 2023 12:41:58 +0000
Received: by outflank-mailman (input) for mailman id 483550;
 Tue, 24 Jan 2023 12:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jOcK=5V=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pKIcf-0008Um-2J
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:41:57 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ba15fb2-9be4-11ed-b8d1-410ff93cb8f0;
 Tue, 24 Jan 2023 13:41:54 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id s3so18152422edd.4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jan 2023 04:41:54 -0800 (PST)
Received: from uni.router.wind (adsl-208.109.242.227.tellas.gr.
 [109.242.227.208]) by smtp.googlemail.com with ESMTPSA id
 bj10-20020a170906b04a00b0086b0d53cde2sm825419ejb.201.2023.01.24.04.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:41:53 -0800 (PST)
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
X-Inumbo-ID: 7ba15fb2-9be4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Nu8ZqoSCJrh9/McWp3IN7UXZ38cJPK4OKj3F45cAog=;
        b=d+F72xaSZt1toJYte3aEmpa32g8w7JNzjAHaGcBfFH6Q34IFtABHt4x777I2nbNQLu
         Vis7YVf7NKeBF4uHVZe1b452nHzcSTGlnZccNOjs9VuNOFW+W8gpmT3Vq6U6n7qjSZiq
         AYqAUsoHeMZ4k10oJwb3qpKMZfK2kaIsnFzHlgbMI9iRbUuoKak4FCPYXlDG9J2gKJQ6
         LlqU9yS9tiHNdNsNzgsD41Q3z3dMPpkTKwfHmA5jyP3XaHnU8lEmiSqy48RUSqQK0a4i
         iiv2urgsulfwi4XNAxRF8jY3JLGnVBrRmSCYRxslS6EhyrH8H4WbaqIziO1yOjx6zW0D
         JICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Nu8ZqoSCJrh9/McWp3IN7UXZ38cJPK4OKj3F45cAog=;
        b=qmJPtxwgG9Y0YxpQZrGZqrkfOrM7V4Ff45QafnEJX82TBttWi6ipG+AHPGAr5TtsC4
         OZQGvpFkW+ePwknMPIGOJw9SLO7tRJvAo4R1o8j1kJ5wOS6DsHxVNiqk6He1E/lo5E79
         B1Ee41AWKbV8tGz3Lb67GE+t15Q7l3QLlHoY4D5LWwWdrdT7d1LQT8VCMOwOfofxPFc4
         Xc22cTzt6uhbJuJUxXnVVmL7y0WaTfDmuX4jbWEo5ytkluXAJ4vKa7sKmqEaf7xmjLdI
         +r3MKhncQrRj16Ij58ouydCCcdOyllmIoz1IFSPSkAM46/UfggMIoeNglfX6fbxrL7Rm
         PIcA==
X-Gm-Message-State: AO0yUKXd0O8OVnTDOsDbIUcuhAHs3roihlOkhuC0Sg2d5TyobPDHdbnr
	InMh+Dh1pg0/3u5rQQaHitVXCb+Qt34=
X-Google-Smtp-Source: AK7set87mxamyZnHvL9xdTE6v82DviNp4u2S57Bdrz81bYdzYbo2x/+A4hn1xUxMTlXitNRFZVtueQ==
X-Received: by 2002:a05:6402:1745:b0:4a0:8bb5:78cc with SMTP id v5-20020a056402174500b004a08bb578ccmr1697674edx.20.1674564114084;
        Tue, 24 Jan 2023 04:41:54 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v4 3/5] x86/iommu: call pi_update_irte through an hvm_function callback
Date: Tue, 24 Jan 2023 14:41:40 +0200
Message-Id: <20230124124142.38500-4-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230124124142.38500-1-burzalodowa@gmail.com>
References: <20230124124142.38500-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Posted interrupt support in Xen is currently implemented only for the
Intel platforms. Instead of calling directly pi_update_irte() from the
common hvm code, add a pi_update_irte callback to the hvm_function_table.
Then, create a wrapper function hvm_pi_update_irte() to be used by the
common hvm code.

In the pi_update_irte callback prototype, pass the vcpu as first parameter
instead of the posted-interrupt descriptor that is platform specific, and
remove the const qualifier from the parameter gvec since it is not needed
and because it does not compile with the alternative code patching in use.

Since the posted interrupt descriptor is Intel VT-x specific while
msi_msg_write_remap_rte is iommu specific, open code pi_update_irte() inside
vmx_pi_update_irte() but replace msi_msg_write_remap_rte() with generic
iommu_update_ire_from_msi(). That way vmx_pi_update_irte() is not bound to
Intel VT-d anymore.

Remove the now unused pi_update_irte() implementation.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v4:
  - remove the now unused asm/hvm/vmx/vmcs.h

 xen/arch/x86/hvm/vmx/vmx.c             | 41 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h     | 10 +++++++
 xen/arch/x86/include/asm/iommu.h       |  4 ---
 xen/drivers/passthrough/vtd/intremap.c | 36 ----------------------
 xen/drivers/passthrough/x86/hvm.c      |  5 ++--
 5 files changed, 53 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index ade2a25ce7..270bc98195 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -397,6 +397,43 @@ void vmx_pi_hooks_deassign(struct domain *d)
     domain_unpause(d);
 }
 
+/*
+ * This function is used to update the IRTE for posted-interrupt
+ * when guest changes MSI/MSI-X information.
+ */
+static int cf_check vmx_pi_update_irte(const struct vcpu *v,
+                                       const struct pirq *pirq, uint8_t gvec)
+{
+    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
+    struct irq_desc *desc;
+    struct msi_desc *msi_desc;
+    int rc;
+
+    desc = pirq_spin_lock_irq_desc(pirq, NULL);
+    if ( !desc )
+        return -EINVAL;
+
+    msi_desc = desc->msi_desc;
+    if ( !msi_desc )
+    {
+        rc = -ENODEV;
+        goto unlock_out;
+    }
+    msi_desc->pi_desc = pi_desc;
+    msi_desc->gvec = gvec;
+
+    spin_unlock_irq(&desc->lock);
+
+    ASSERT(pcidevs_locked());
+
+    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
+
+ unlock_out:
+    spin_unlock_irq(&desc->lock);
+
+    return rc;
+}
+
 static const struct lbr_info {
     u32 base, count;
 } p4_lbr[] = {
@@ -2986,8 +3023,12 @@ const struct hvm_function_table * __init start_vmx(void)
     {
         alloc_direct_apic_vector(&posted_intr_vector, pi_notification_interrupt);
         if ( iommu_intpost )
+        {
             alloc_direct_apic_vector(&pi_wakeup_vector, pi_wakeup_interrupt);
 
+            vmx_function_table.pi_update_irte = vmx_pi_update_irte;
+        }
+
         vmx_function_table.deliver_posted_intr = vmx_deliver_posted_intr;
         vmx_function_table.sync_pir_to_irr     = vmx_sync_pir_to_irr;
         vmx_function_table.test_pir            = vmx_test_pir;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 65768c797e..80e4565bd2 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -28,6 +28,8 @@
 #include <asm/x86_emulate.h>
 #include <asm/hvm/asid.h>
 
+struct pirq; /* needed by pi_update_irte */
+
 #ifdef CONFIG_HVM_FEP
 /* Permit use of the Forced Emulation Prefix in HVM guests */
 extern bool_t opt_hvm_fep;
@@ -213,6 +215,8 @@ struct hvm_function_table {
     void (*sync_pir_to_irr)(struct vcpu *v);
     bool (*test_pir)(const struct vcpu *v, uint8_t vector);
     void (*handle_eoi)(uint8_t vector, int isr);
+    int (*pi_update_irte)(const struct vcpu *v, const struct pirq *pirq,
+                          uint8_t gvec);
 
     /*Walk nested p2m  */
     int (*nhvm_hap_walk_L1_p2m)(struct vcpu *v, paddr_t L2_gpa,
@@ -776,6 +780,12 @@ static inline void hvm_set_nonreg_state(struct vcpu *v,
         alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
 }
 
+static inline int hvm_pi_update_irte(const struct vcpu *v,
+                                     const struct pirq *pirq, uint8_t gvec)
+{
+    return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
+}
+
 #else  /* CONFIG_HVM */
 
 #define hvm_enabled false
diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index fc0afe35bf..586c7434f2 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -21,7 +21,6 @@
 #include <asm/apicdef.h>
 #include <asm/cache.h>
 #include <asm/processor.h>
-#include <asm/hvm/vmx/vmcs.h>
 
 #define DEFAULT_DOMAIN_ADDRESS_WIDTH 48
 
@@ -129,9 +128,6 @@ void iommu_identity_map_teardown(struct domain *d);
 
 extern bool untrusted_msi;
 
-int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
-                   const uint8_t gvec);
-
 extern bool iommu_non_coherent, iommu_superpages;
 
 static inline void iommu_sync_cache(const void *addr, unsigned int size)
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 1512e4866b..b39bc83282 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -866,39 +866,3 @@ void cf_check intel_iommu_disable_eim(void)
     for_each_drhd_unit ( drhd )
         disable_qinval(drhd->iommu);
 }
-
-/*
- * This function is used to update the IRTE for posted-interrupt
- * when guest changes MSI/MSI-X information.
- */
-int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
-    const uint8_t gvec)
-{
-    struct irq_desc *desc;
-    struct msi_desc *msi_desc;
-    int rc;
-
-    desc = pirq_spin_lock_irq_desc(pirq, NULL);
-    if ( !desc )
-        return -EINVAL;
-
-    msi_desc = desc->msi_desc;
-    if ( !msi_desc )
-    {
-        rc = -ENODEV;
-        goto unlock_out;
-    }
-    msi_desc->pi_desc = pi_desc;
-    msi_desc->gvec = gvec;
-
-    spin_unlock_irq(&desc->lock);
-
-    ASSERT(pcidevs_locked());
-
-    return msi_msg_write_remap_rte(msi_desc, &msi_desc->msg);
-
- unlock_out:
-    spin_unlock_irq(&desc->lock);
-
-    return rc;
-}
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index a16e0e5344..e720461a14 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -381,8 +381,7 @@ int pt_irq_create_bind(
 
         /* Use interrupt posting if it is supported. */
         if ( iommu_intpost )
-            pi_update_irte(vcpu ? &vcpu->arch.hvm.vmx.pi_desc : NULL,
-                           info, pirq_dpci->gmsi.gvec);
+            hvm_pi_update_irte(vcpu, info, pirq_dpci->gmsi.gvec);
 
         if ( pt_irq_bind->u.msi.gflags & XEN_DOMCTL_VMSI_X86_UNMASKED )
         {
@@ -672,7 +671,7 @@ int pt_irq_destroy_bind(
             what = "bogus";
     }
     else if ( pirq_dpci && pirq_dpci->gmsi.posted )
-        pi_update_irte(NULL, pirq, 0);
+        hvm_pi_update_irte(NULL, pirq, 0);
 
     if ( pirq_dpci && (pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) &&
          list_empty(&pirq_dpci->digl_list) )
-- 
2.37.2


