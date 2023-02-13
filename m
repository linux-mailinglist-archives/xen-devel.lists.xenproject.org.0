Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8776944DE
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 12:51:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494385.764424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRXLs-0007ax-Kr; Mon, 13 Feb 2023 11:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494385.764424; Mon, 13 Feb 2023 11:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRXLs-0007ZG-Hv; Mon, 13 Feb 2023 11:50:32 +0000
Received: by outflank-mailman (input) for mailman id 494385;
 Mon, 13 Feb 2023 11:50:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRXLq-0007ZA-WF
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 11:50:31 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c093b08-ab94-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 12:50:28 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id s11so4749757edd.10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 03:50:28 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 m2-20020a50d7c2000000b004acc123cd94sm2203615edj.30.2023.02.13.03.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 03:50:27 -0800 (PST)
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
X-Inumbo-ID: 9c093b08-ab94-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2mxQM8AfXBAOtKyCgkY32aLZkpJUAewws57G3RsRmI=;
        b=VUfQNEnHCnTri3t2mZcoK1h55MXBOHpAeHnNzZRWkWUcEJfqHN3q5Ipau0SsjZnvnO
         zWnv3D+IGz1DOR6HGphp4Y2O/mVpnR+hGrRLAStPjHGQyce+b728TgrqRsxZck5FtfcY
         10f1HDmRIuvbJVAkWL8ACa3Kg6zLRAljqISF2gLWs2a6NNyBJ0aOtV5mJaN4WnPE5GEx
         s+HLwdsESmAgZlrZjRGO1k6zT+bOW0SJDVy7Y5HlkMAf/iHzyY4YSOs/0VP5p3sRS3ml
         63ygFqkpHwqm5qDZWGw+Pbqwo/3IBWMSANa8LhujjsGvC999L+NKJgsM2JjHVPvbED24
         rc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2mxQM8AfXBAOtKyCgkY32aLZkpJUAewws57G3RsRmI=;
        b=kEeQesqZasfZNXD0QN4LRtVjX1fPpKlCdMe3KRhFONEUhkEtiqP1Xs8Imbc44GMaF+
         Zt86Rs2Ul8FdZ9F4/yUMYb7kK3F81i1+10zKQppKGOfFfXbBMx34JhXSrtn9LnDKZi/d
         CmSwM3AIh5p1XXogbMp6K8SL8Hje5L+IfSl4YUFchiAuLB/9geoMbdmqUvhpQg1o2H57
         1dUsNq3PnEbhsQ1Q0qsicjfpRyb18/R3R4dCvpQ5z/sAzi9ozk5nlpkUdv3YVXJQmXzD
         quyxSOF3qlYP3sxUYmlCOqngVf3MIw9QD0OKY4n4U7YOsuQqvQX3Ywybq0eM6cs5wxao
         LxOw==
X-Gm-Message-State: AO0yUKWU59441UXKyqo83WWnxyIlO6ur9NMLsBWeYhmQoftg6uCt3eyr
	YWpo/CaC4KaO773lJ9ltNOf7e9gQgfI=
X-Google-Smtp-Source: AK7set+asvVOWytEm+NHo+OiJOZLfjd2ZzwBMTdzhJoPVfQaBEecQGxI+8XpSspMuBt+sgkXITMgsA==
X-Received: by 2002:a50:d681:0:b0:4ac:bcf9:6d7e with SMTP id r1-20020a50d681000000b004acbcf96d7emr6865901edi.11.1676289027496;
        Mon, 13 Feb 2023 03:50:27 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3] x86/vlapic: call vmx_vlapic_msr_changed through an hvm_function callback
Date: Mon, 13 Feb 2023 13:50:17 +0200
Message-Id: <20230213115017.902037-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

APIC virtualization support is currently implemented only for Intel VT-x.
To aid future work on separating AMD-V from Intel VT-x code, instead of
calling directly vmx_vlapic_msr_changed() from common hvm code, add a stub
to the hvm_function_table, named update_vlapic_mode, and create a wrapper
function, called hvm_vlapic_mode(), to be used by common hvm code.

After the change above, do not include header asm/hvm/vmx/vmx.h as it is
not required anymore and resolve subsequent build errors for implicit
declaration of functions ‘TRACE_2_LONG_3D’ and ‘TRC_PAR_LONG’ by including
missing asm/hvm/trace.h header.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - add cf_check attribute in both the function declaration and definition of
    vmx_vlapic_msr_changed since it is used as callback, bug reported by Jan
  - initialize update_vlapic_mode in the vmx_function_table initializer to
    keep unconditionally initialized cbs in a single place, reported by Jan

 xen/arch/x86/hvm/vlapic.c              | 6 +++---
 xen/arch/x86/hvm/vmx/vmx.c             | 3 ++-
 xen/arch/x86/include/asm/hvm/hvm.h     | 7 +++++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 2 +-
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index eb32f12e2d..dc93b5e930 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -37,8 +37,8 @@
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/trace.h>
 #include <asm/hvm/viridian.h>
 #include <public/hvm/ioreq.h>
 #include <public/hvm/params.h>
@@ -1165,7 +1165,7 @@ int guest_wrmsr_apic_base(struct vcpu *v, uint64_t value)
     if ( vlapic_x2apic_mode(vlapic) )
         set_x2apic_id(vlapic);
 
-    vmx_vlapic_msr_changed(vlapic_vcpu(vlapic));
+    hvm_update_vlapic_mode(vlapic_vcpu(vlapic));
 
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC,
                 "apic base msr is 0x%016"PRIx64, vlapic->hw.apic_base_msr);
@@ -1561,7 +1561,7 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
          unlikely(vlapic_x2apic_mode(s)) )
         return -EINVAL;
 
-    vmx_vlapic_msr_changed(v);
+    hvm_update_vlapic_mode(v);
 
     return 0;
 }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 270bc98195..0ec33bcc18 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2763,6 +2763,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
     .nhvm_intr_blocked    = nvmx_intr_blocked,
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
+    .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
     .enable_msr_interception = vmx_enable_msr_interception,
     .altp2m_vcpu_update_p2m = vmx_vcpu_update_eptp,
@@ -3472,7 +3473,7 @@ static void vmx_install_vlapic_mapping(struct vcpu *v)
     vmx_vmcs_exit(v);
 }
 
-void vmx_vlapic_msr_changed(struct vcpu *v)
+void cf_check vmx_vlapic_msr_changed(struct vcpu *v)
 {
     int virtualize_x2apic_mode;
     struct vlapic *vlapic = vcpu_vlapic(v);
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 80e4565bd2..43d3fc2498 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -217,6 +217,7 @@ struct hvm_function_table {
     void (*handle_eoi)(uint8_t vector, int isr);
     int (*pi_update_irte)(const struct vcpu *v, const struct pirq *pirq,
                           uint8_t gvec);
+    void (*update_vlapic_mode)(struct vcpu *v);
 
     /*Walk nested p2m  */
     int (*nhvm_hap_walk_L1_p2m)(struct vcpu *v, paddr_t L2_gpa,
@@ -786,6 +787,12 @@ static inline int hvm_pi_update_irte(const struct vcpu *v,
     return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
 }
 
+static inline void hvm_update_vlapic_mode(struct vcpu *v)
+{
+    if ( hvm_funcs.update_vlapic_mode )
+        alternative_vcall(hvm_funcs.update_vlapic_mode, v);
+}
+
 #else  /* CONFIG_HVM */
 
 #define hvm_enabled false
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 234da4a7f4..97d6b810ec 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -85,7 +85,7 @@ typedef enum {
 void vmx_asm_vmexit_handler(struct cpu_user_regs);
 void vmx_intr_assist(void);
 void noreturn cf_check vmx_do_resume(void);
-void vmx_vlapic_msr_changed(struct vcpu *v);
+void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
 struct hvm_emulate_ctxt;
 void vmx_realmode_emulate_one(struct hvm_emulate_ctxt *hvmemul_ctxt);
 void vmx_realmode(struct cpu_user_regs *regs);
-- 
2.37.2


