Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FF7650799
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 07:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465761.724606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kJ-0004ma-TS; Mon, 19 Dec 2022 06:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465761.724606; Mon, 19 Dec 2022 06:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kJ-0004i0-NI; Mon, 19 Dec 2022 06:35:31 +0000
Received: by outflank-mailman (input) for mailman id 465761;
 Mon, 19 Dec 2022 06:35:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4Hg=4R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p79kH-000383-WF
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 06:35:30 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 542d0c26-7f67-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 07:35:29 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id fc4so19039032ejc.12
 for <xen-devel@lists.xenproject.org>; Sun, 18 Dec 2022 22:35:29 -0800 (PST)
Received: from uni.router.wind (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.googlemail.com with ESMTPSA id
 q14-20020a17090676ce00b008302732f569sm77062ejn.78.2022.12.18.22.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 22:35:28 -0800 (PST)
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
X-Inumbo-ID: 542d0c26-7f67-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDHt9Muga8jj18B99Ku3Es7TSomj917F0qX6vAjIB5g=;
        b=BRMFmUfPzlOVRvLBZelGfWoA4csOXoqK7RcIuPHysgTsZdx6bLeS9Ug3Uhiuh09sQF
         mu8nWcfqNUN9+vKfrWazttPpWT2bJXW5RrUVTFabCUQQw0DeME/MgnzQVjDYToAA+KKl
         FhWQMd1b21iGCHGHJH+Hs7SdVh/eAO7YdWGKRXbzszcD2rqdFzW+CfzzWLOh+SZJPtb/
         yUz9Mk5jflw7KIhgqp/Y6qM5TVzbxKu/o4KYuEW5QDK4QmGeMmazWuPu5bD5RxlUQ2mM
         Z4brmiYF7bR/QswtWFITnVlnU1HiDQTpJnzZrc+FIkNniJHrhPDvD00h2kjP294xVKHL
         mq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDHt9Muga8jj18B99Ku3Es7TSomj917F0qX6vAjIB5g=;
        b=oH04Oj/jpQSDGUfRCHSvHK1T5TIMssNfOYzxMJHMCarbxMlYTU5Y1eXFBbX1cU4prT
         CmicEMk9sLPHe1LR32gHo2QuFKHlDWOdB3k6XTMXxoIkBMy3Sr8tWjNR7OTLSw31mmTZ
         RLmAJTAvwIsL0J+XQWuHx1Pb/Kmh9T1sER/8diy65YTB3kFWdwiv04lHZ0TptGdGQQCr
         Ku48yx6Pbku2jnSFl9ETwFn84QvdUiK1Phha66AGY1QRoE5Pe2+yLCOC6dKw+MHwO6En
         w9xZrKeJqVYjbS0S2lUA+izBB3SZscP1QsPJlDJTuNOYcy9KeqPtvrDDETfoYeqw1qz/
         Nldg==
X-Gm-Message-State: ANoB5pn05+Kmix0Iykx2UbjFblI8D67hDod5lCK5LOskivSlVUUH/oBt
	qRh219+KFemu/KusZKzbABhKm9ts4yU=
X-Google-Smtp-Source: AA0mqf4rjpoUPOhdC/CaBehe4Uk70e90bXRw6GgEKYKuRFfJA3CO+fVb56q4mdcvu+JPIiGII6c6uQ==
X-Received: by 2002:a17:907:20ce:b0:7c1:6344:845 with SMTP id qq14-20020a17090720ce00b007c163440845mr27269843ejb.34.1671431728334;
        Sun, 18 Dec 2022 22:35:28 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [RFC 6/7] x86/iommu: call pi_update_irte through an hvm_function callback
Date: Mon, 19 Dec 2022 08:34:55 +0200
Message-Id: <20221219063456.2017996-7-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221219063456.2017996-1-burzalodowa@gmail.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
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

Move the declaration of pi_update_irte() from asm/iommu.h to asm/hvm/vmx/vmx.h
since it is hvm and Intel specific.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/hvm/vmx/vmx.c             | 10 ++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h     | 22 ++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 11 +++++++++++
 xen/arch/x86/include/asm/iommu.h       |  3 ---
 xen/drivers/passthrough/x86/hvm.c      |  5 ++---
 5 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 7c81b80710..3080f1ef41 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2134,6 +2134,14 @@ static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
     return pi_test_pir(vec, &v->arch.hvm.vmx.pi_desc);
 }
 
+static int cf_check vmx_pi_update_irte(const struct vcpu *v,
+                                       const struct pirq *pirq, uint8_t gvec)
+{
+    const struct pi_desc *pi_desc = v ? &v->arch.hvm.vmx.pi_desc : NULL;
+
+    return pi_update_irte(pi_desc, pirq, gvec);
+}
+
 static void cf_check vmx_handle_eoi(uint8_t vector, int isr)
 {
     uint8_t old_svi = set_svi(isr);
@@ -2582,6 +2590,8 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .tsc_scaling = {
         .max_ratio = VMX_TSC_MULTIPLIER_MAX,
     },
+
+    .pi_update_irte = vmx_pi_update_irte,
 };
 
 /* Handle VT-d posted-interrupt when VCPU is blocked. */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 93254651f2..f16b9edeaf 100644
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
@@ -250,6 +252,9 @@ struct hvm_function_table {
         /* Architecture function to setup TSC scaling ratio */
         void (*setup)(struct vcpu *v);
     } tsc_scaling;
+
+    int (*pi_update_irte)(const struct vcpu *v,
+                          const struct pirq *pirq, uint8_t gvec);
 };
 
 extern struct hvm_function_table hvm_funcs;
@@ -774,6 +779,16 @@ static inline void hvm_set_nonreg_state(struct vcpu *v,
         alternative_vcall(hvm_funcs.set_nonreg_state, v, nrs);
 }
 
+static inline int hvm_pi_update_irte(const struct vcpu *v,
+                                     const struct pirq *pirq, uint8_t gvec)
+{
+    if ( hvm_funcs.pi_update_irte )
+        return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
+
+    return -EOPNOTSUPP;
+}
+
+
 #else  /* CONFIG_HVM */
 
 #define hvm_enabled false
@@ -893,6 +908,13 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
     ASSERT_UNREACHABLE();
 }
 
+static inline int hvm_pi_update_irte(const struct vcpu *v,
+                                     const struct pirq *pirq, uint8_t gvec)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
+
 #define is_viridian_domain(d) ((void)(d), false)
 #define is_viridian_vcpu(v) ((void)(v), false)
 #define has_viridian_time_ref_count(d) ((void)(d), false)
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 8eedf59155..17f13e79a0 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -155,6 +155,17 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
     clear_bit(POSTED_INTR_SN, &pi_desc->control);
 }
 
+#ifdef CONFIG_INTEL_VTD
+int pi_update_irte(const struct pi_desc *pi_desc,
+                   const struct pirq *pirq, const uint8_t gvec);
+#else
+static inline int pi_update_irte(const struct pi_desc *pi_desc,
+                                 const struct pirq *pirq, const uint8_t gvec)
+{
+    return -EOPNOTSUPP;
+}
+#endif
+
 /*
  * Exit Reasons
  */
diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 41bd1b9e05..c433c75b76 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -131,9 +131,6 @@ void iommu_identity_map_teardown(struct domain *d);
 extern bool untrusted_msi;
 #endif
 
-int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
-                   const uint8_t gvec);
-
 extern bool iommu_non_coherent, iommu_superpages;
 
 static inline void iommu_sync_cache(const void *addr, unsigned int size)
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


