Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D165CE95
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470988.730723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOg-0001gm-Ey; Wed, 04 Jan 2023 08:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470988.730723; Wed, 04 Jan 2023 08:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOg-0001dC-7h; Wed, 04 Jan 2023 08:45:18 +0000
Received: by outflank-mailman (input) for mailman id 470988;
 Wed, 04 Jan 2023 08:45:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfqB=5B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pCzOd-0008Pe-LM
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:45:15 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b7c2fdb-8c0c-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 09:45:14 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id qk9so80720802ejc.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 00:45:14 -0800 (PST)
Received: from uni.router.wind (adsl-57.109.242.233.tellas.gr.
 [109.242.233.57]) by smtp.googlemail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15016382ejb.86.2023.01.04.00.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 00:45:13 -0800 (PST)
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
X-Inumbo-ID: 1b7c2fdb-8c0c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj9i4k4Po7JyYtPs55wgOJc0qUd+pVBAioCcKA5YDiY=;
        b=Zk+2/cbxitpP46T2xli3DDei5RXHSwU29gjuLZrqJIo5izrT20VbUgQPqJsoEFGTOc
         /W5fc3wv67hCfpm1t12Ko8J8tL1OoAck5uYCQR2rHRD+Y7bobdryX37MXLcS0wGOBinj
         sfmXg6ZATbhiMJUVaOAjzB9CpCFUWM4eatisjFSKochHLue/OZd2USvw144OzRzASLmc
         A2+LucMoBQ8V32eCE2nvpI01CKlieGkI7D71enXT+XQSZ/53iB11tE64UfHLtQlA7w9P
         Pv/+P/8KodQeSpU4MNasky3A6OTEwPnzfs1DPhQrLWke0TvD005GLTE4soIPyEHXtF97
         E+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tj9i4k4Po7JyYtPs55wgOJc0qUd+pVBAioCcKA5YDiY=;
        b=R0D6QB90BGTKCxztadvHO2ADWox0M1pWIPjXtjNWIchfPIt9FWvajgtw9xU0JQZ4Px
         OWktcbtMchdfpmvxslO4NNsY090AgXLbs2XF049xAdPNSr+xKU9f++3MvXKRPrL6c6gk
         wCg16qd11ztWbwmDdeothjsD09wEywfKqWpZlln8+gtCJN5elwsBc/nG5VfdXwefzQZH
         DzQGK9rOsFmgtswFT83LB6cOtiO0UIs2EzaBM6boOgCspDVfA642RF09eDhrEfbStIiu
         IXBfKZBwpEck/0+QNAn1fOvA7fsZug1T0EK4SIfbrsfZfwyIUiyqgDDj9G4vDjo7ybiN
         O3eQ==
X-Gm-Message-State: AFqh2koJAwLtcnLCK288w7AWUjct14CWVQp/mukFLpBCutfiP/GkcsHM
	C8j5CBlel7B9l7SDCZ0mhCb8HPda4SY=
X-Google-Smtp-Source: AMrXdXvYf/Q/hqROtjcI4p728EDt17GV1HrYpbRwl8Wf778r0ZHaKQAZ6Auylm8M+YkwBNQ7HdOJYg==
X-Received: by 2002:a17:906:a186:b0:82d:e2a6:4b0d with SMTP id s6-20020a170906a18600b0082de2a64b0dmr40816443ejy.18.1672821914148;
        Wed, 04 Jan 2023 00:45:14 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 6/8] x86/iommu: call pi_update_irte through an hvm_function callback
Date: Wed,  4 Jan 2023 10:45:00 +0200
Message-Id: <20230104084502.61734-7-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104084502.61734-1-burzalodowa@gmail.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
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

Changes in v2:
  - remove the definition of hvm_pi_update_irte() for !CONFIG_HVM
  - replace CONFIG_INTEL_VTD with CONFIG_INTEL_IOMMU

 xen/arch/x86/hvm/vmx/vmx.c             | 10 ++++++++++
 xen/arch/x86/include/asm/hvm/hvm.h     | 15 +++++++++++++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 11 +++++++++++
 xen/arch/x86/include/asm/iommu.h       |  3 ---
 xen/drivers/passthrough/x86/hvm.c      |  5 ++---
 5 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 43a4865d1c..cb6b325e41 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2143,6 +2143,14 @@ static bool cf_check vmx_test_pir(const struct vcpu *v, uint8_t vec)
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
@@ -2591,6 +2599,8 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .tsc_scaling = {
         .max_ratio = VMX_TSC_MULTIPLIER_MAX,
     },
+
+    .pi_update_irte = vmx_pi_update_irte,
 };
 
 /* Handle VT-d posted-interrupt when VCPU is blocked. */
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 93254651f2..b3fe0663f9 100644
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
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 96a9f07ca5..e827fece07 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -146,6 +146,17 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
     clear_bit(POSTED_INTR_SN, &pi_desc->control);
 }
 
+#ifdef CONFIG_INTEL_IOMMU
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
index fb5fe4e1bf..b432790d24 100644
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


