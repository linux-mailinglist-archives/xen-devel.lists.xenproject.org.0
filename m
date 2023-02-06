Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F411E68BD60
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 13:58:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490392.759058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP14e-0000eB-MY; Mon, 06 Feb 2023 12:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490392.759058; Mon, 06 Feb 2023 12:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP14e-0000cB-Hg; Mon, 06 Feb 2023 12:58:20 +0000
Received: by outflank-mailman (input) for mailman id 490392;
 Mon, 06 Feb 2023 12:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvBD=6C=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pP14c-0000ai-Nr
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 12:58:18 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ece3a134-a61d-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 13:58:17 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id m8so11529257edd.10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 04:58:17 -0800 (PST)
Received: from uni.router.wind (adsl-41.109.242.226.tellas.gr.
 [109.242.226.41]) by smtp.googlemail.com with ESMTPSA id
 f28-20020a50a6dc000000b004aaa6a948fcsm2366863edc.37.2023.02.06.04.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 04:58:16 -0800 (PST)
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
X-Inumbo-ID: ece3a134-a61d-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1T2CcOk2cumlPijgcYdo5ZGfLn2kJ62SCoGf7/BdPyY=;
        b=fM2As6W25qg7X4CAszC6SnCcNzwX9qUo7GO7rX9H5tz+jwZZj2MIxkApmLB9cO/pSq
         JfoC/7qxCoFJMWpCsA8RvSU0vsbVLdjZrPhAyK0rCwzz/xqBr+OlCvaahakZQzXBhn5R
         17ZYWefKlAUvmeS7tgW4BqvkCtmxob9tVwsYxsJbdfBeJC/QPbtUOLxFmFb00N05798+
         YcrJsA/o652wClmtATTockxhGPnoEtkFaxL/iB09TAQ+JDvPo7UGZDwWhUNl5i60FPlL
         ZracdJ/lI5N5Bh/nMMng4MO5WTstULtJthTqwo6GHLjQcdnpbKb/lsdmn4BFOho4WwDs
         irSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1T2CcOk2cumlPijgcYdo5ZGfLn2kJ62SCoGf7/BdPyY=;
        b=4RJX9RZ5lJ7epCYCbuUxXbDSN2e1nPpeUbLlMA+G5xRwRizEOVJpAsQDxVlthYVekf
         c7JUDJh08KJEs2OHZqLReEk0gfJFbpjUBgOuJI0ma8ps2nYlXCUUqw25tv7jMR1LESZi
         QBHRp9vm0VJJmOHhNJg16Of25VKrArV7GuUKxIuJ1E54e/t50Y1zlIVLyOhEqWZVHdu6
         jzuVy4h/6G8I7Bd25D6Xa2qyyG7JRJoXgKeA28jFd0HdQT/X6S4zcNwyQ/Es1vuK304i
         QdU76yjFE9AeCs/mr+OXKEBfhMAnJV9rf7zyovgYmeY6uaXsTW535GLAjOWgWWoOOzzC
         UPvQ==
X-Gm-Message-State: AO0yUKXIfaB4zi6D5cT3dp7X8XN+XOZ8MdDh4WXt4VHjHp+v+sH0JfRs
	4zMHRnC4n9SuOneT8EEd/kniseNsKqA=
X-Google-Smtp-Source: AK7set+hHizhlj6+S6dtoqoA1xCwlZZLznwm+66G//pcIbPGN2P3bhN6a0ucbrsYJ8s4IBqPX/jvcQ==
X-Received: by 2002:a05:6402:1643:b0:492:8c77:7dad with SMTP id s3-20020a056402164300b004928c777dadmr19361094edx.8.1675688297196;
        Mon, 06 Feb 2023 04:58:17 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH] x86/vlapic: call vmx_vlapic_msr_changed through an hvm_function callback
Date: Mon,  6 Feb 2023 14:58:04 +0200
Message-Id: <20230206125804.950528-1-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

APIC virtualization support is currently implemented only for Intel VT-x.
To aid future work on separating AMD-V from Intel VT-x code, instead of
calling directly vmx_vlapic_msr_changed() from common hvm code, add a stub
to the hvm_function_table, named set_virtual_apic_mode (to match the name
of the corresponding function in Linux for cross reference).
Then, create a wrapper function, called hvm_set_virtual_apic_mode(), to be
used by common hvm code.
For Intel VT-x, initialize the stub only when either virtual xAPIC mode or
virtual x2APIC mode is supported.

After the change above, do not include header asm/hvm/vmx/vmx.h as it is
not required anymore and resolve subsequent build errors for implicit
declaration of functions ‘TRACE_2_LONG_3D’ and ‘TRC_PAR_LONG’ by including
missing asm/hvm/trace.h header.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/hvm/vlapic.c          | 6 +++---
 xen/arch/x86/hvm/vmx/vmx.c         | 4 ++++
 xen/arch/x86/include/asm/hvm/hvm.h | 6 ++++++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index eb32f12e2d..34a7eea3a1 100644
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
+    hvm_set_virtual_apic_mode(vlapic_vcpu(vlapic));
 
     HVM_DBG_LOG(DBG_LEVEL_VLAPIC,
                 "apic base msr is 0x%016"PRIx64, vlapic->hw.apic_base_msr);
@@ -1561,7 +1561,7 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
          unlikely(vlapic_x2apic_mode(s)) )
         return -EINVAL;
 
-    vmx_vlapic_msr_changed(v);
+    hvm_set_virtual_apic_mode(v);
 
     return 0;
 }
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 270bc98195..6138dc0885 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3011,6 +3011,10 @@ const struct hvm_function_table * __init start_vmx(void)
         setup_ept_dump();
     }
 
+    if ( cpu_has_vmx_virtualize_apic_accesses ||
+         cpu_has_vmx_virtualize_x2apic_mode )
+        vmx_function_table.set_virtual_apic_mode = vmx_vlapic_msr_changed;
+
     if ( cpu_has_vmx_virtual_intr_delivery )
     {
         vmx_function_table.update_eoi_exit_bitmap = vmx_update_eoi_exit_bitmap;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 80e4565bd2..b690e2924c 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -217,6 +217,7 @@ struct hvm_function_table {
     void (*handle_eoi)(uint8_t vector, int isr);
     int (*pi_update_irte)(const struct vcpu *v, const struct pirq *pirq,
                           uint8_t gvec);
+    void (*set_virtual_apic_mode)(struct vcpu *v);
 
     /*Walk nested p2m  */
     int (*nhvm_hap_walk_L1_p2m)(struct vcpu *v, paddr_t L2_gpa,
@@ -786,6 +787,11 @@ static inline int hvm_pi_update_irte(const struct vcpu *v,
     return alternative_call(hvm_funcs.pi_update_irte, v, pirq, gvec);
 }
 
+static inline void hvm_set_virtual_apic_mode(struct vcpu *v)
+{
+    alternative_vcall(hvm_funcs.set_virtual_apic_mode, v);
+}
+
 #else  /* CONFIG_HVM */
 
 #define hvm_enabled false
-- 
2.37.2


