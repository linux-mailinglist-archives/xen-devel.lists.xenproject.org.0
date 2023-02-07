Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9968D31F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 10:44:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490966.759882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPKWD-0000l8-0y; Tue, 07 Feb 2023 09:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490966.759882; Tue, 07 Feb 2023 09:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPKWC-0000iM-TK; Tue, 07 Feb 2023 09:44:04 +0000
Received: by outflank-mailman (input) for mailman id 490966;
 Tue, 07 Feb 2023 09:44:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1AP=6D=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pPKWA-0000iE-N0
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 09:44:02 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f26e712e-a6cb-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 10:43:59 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id eq11so14636088edb.6
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 01:43:59 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.226.tellas.gr.
 [109.242.226.89]) by smtp.googlemail.com with ESMTPSA id
 es26-20020a056402381a00b00488117821ffsm6193880edb.31.2023.02.07.01.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 01:43:58 -0800 (PST)
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
X-Inumbo-ID: f26e712e-a6cb-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oDDsC41sLF+atuCMTLto1TqTReol5tcMlO6ePzFZbY=;
        b=iqtCiOzMXZD3dsv3XJYGyp1ngC/kiRrsR2sHW//eEEL7wCJElqngwxI4Xa18/1Y1Yt
         NLnQ9RHMvAXzd2okecxJWIfvAxUOFSH3ddHWpGJ/YAO2vbUH2yGLSvzY3xM1NJgTdvqQ
         ZCpjvKvypQtzD+pc7s0lJxVNDqB0s/cxLEDDvkugnCBxKEMM+SQ/ioBpqNox1D/CzgQO
         feiz3J1tLu2kIcarA9HpwC3ZRpUqYeNcd/5OPJCyo94XjCcP3MP4nbqBC4Bt2kSEz+ul
         7CET6WMEEuMdMvR2/FNimotTdpg/hgOOKANDLo8RglPzG1TLxZi/H2nz4mGbu2E4qt4g
         YfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oDDsC41sLF+atuCMTLto1TqTReol5tcMlO6ePzFZbY=;
        b=chSvpbMlSbdzfnjhnM2xLDg2XDf/MYUC6gjJhB+8fpni7eEr5A/a8mF1aBJ8c3/yG+
         m/OC0FQ6vt8DDNHKFNlNZKGE94AnBl0l0/3tu9vLKl0twnGKN89nnE8B0CJvefLQ7yw4
         llk38tFnTOXX/TwfW8qQDQnk24Nh8CjSjHky/xjg2kjCAfj3cTu2C3iBSJZskteJCXkm
         aYxttMD9J8Ve8anx5IcKDYlQOD1GETbrLdmCE5HjkTLCJ+Nqnny//bsQcbl5sawix8AT
         adQDcn8fhv1sWK0Sb7/JlPczyFTqK2z/lGqCSBumOrq7TLaT/fcV7NFFydbrX5x33bJI
         KoTw==
X-Gm-Message-State: AO0yUKUWVacPVuVQl3AB5Hjywc9M0YxL0mYV3yno0fjxXSj1AYNFrH/u
	1Du3rBzwjkXrjUtT4iovHP6w1qgwoOc=
X-Google-Smtp-Source: AK7set+99kLyLrbIod12hxN1P7gPbKejSBK/XshU+Jnqw2rWu/Hz0edkV49zsX/b8aqKJh/PCbNFqA==
X-Received: by 2002:a50:a415:0:b0:4aa:a53f:a041 with SMTP id u21-20020a50a415000000b004aaa53fa041mr2749916edb.34.1675763038399;
        Tue, 07 Feb 2023 01:43:58 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2] x86/vlapic: call vmx_vlapic_msr_changed through an hvm_function callback
Date: Tue,  7 Feb 2023 11:43:47 +0200
Message-Id: <20230207094347.1059376-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

APIC virtualization support is currently implemented only for Intel VT-x.
To aid future work on separating AMD-V from Intel VT-x code, instead of
calling directly vmx_vlapic_msr_changed() from common hvm code, add a stub
to the hvm_function_table, named update_vlapic_mode, and create a wrapper
function, called hvm_update_vlapic_mode(), to be used by common hvm code.

After the change above, do not include header asm/hvm/vmx/vmx.h as it is
not required anymore and resolve subsequent build errors for implicit
declaration of functions ‘TRACE_2_LONG_3D’ and ‘TRC_PAR_LONG’ by including
missing asm/hvm/trace.h header.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - rename set_virtual_apic_mode to update_vlapic_mode, suggested by Andrew
  - in hvm_update_vlapic_mode(), call the stub only if available, otherwise
    a BUG() will be triggered every time an svm guest writes the APIC_BASE MSR,
    bug reported by Andrew
  - initialize the stub for vmx unconditionally to maintain current behavior
    since no functional change is intended, bug reported by Andrew (here, I
    decided to place the initialization in start_vmx to be closer to the
    initializations of the other stubs that are relevant to apic virtualization)

 xen/arch/x86/hvm/vlapic.c          | 6 +++---
 xen/arch/x86/hvm/vmx/vmx.c         | 2 ++
 xen/arch/x86/include/asm/hvm/hvm.h | 7 +++++++
 3 files changed, 12 insertions(+), 3 deletions(-)

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
index 270bc98195..dd57aa7623 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3011,6 +3011,8 @@ const struct hvm_function_table * __init start_vmx(void)
         setup_ept_dump();
     }
 
+    vmx_function_table.update_vlapic_mode = vmx_vlapic_msr_changed;
+
     if ( cpu_has_vmx_virtual_intr_delivery )
     {
         vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
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
-- 
2.37.2


