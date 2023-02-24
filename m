Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6B86A21C6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501417.773192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9G-0002wf-O3; Fri, 24 Feb 2023 18:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501417.773192; Fri, 24 Feb 2023 18:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9G-0002sg-Kj; Fri, 24 Feb 2023 18:50:26 +0000
Received: by outflank-mailman (input) for mailman id 501417;
 Fri, 24 Feb 2023 18:50:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9E-0001Wv-AN
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:24 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1842c71b-b474-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:50:23 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id cy6so1064825edb.5
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:23 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:22 -0800 (PST)
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
X-Inumbo-ID: 1842c71b-b474-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqq2LM2t+HmFiSRF7FgdQUDEL19Q+hSAOOihEvGk4Dc=;
        b=L8p9Wve2dDEeQN1XTdp7iNd4kJdRVxTiDa1Pcm+GXkxAFqtMI77EWbXqr3B8lVdmRG
         Hqy3mUfHS4HtIet0RwUgr4HTAOVHAeMsE6XdqfILHnFnYJRO0mx9I+/ZIdzDIxcITkEd
         mhtA1nmDY2oWun6zZ9prBz9G6eYeHokTD/f/T61XS7ZKIxSxwUeF1oBNX1/CXWMplWwc
         tT9MggRxWlZC4zm8XJP+r7HyWRS5WOTbk2e+Q0XP2oo9R97Am6gAS1mLGK31zJhvjZhD
         rcN4Rj40JQeBXhDLJHICznNf6BjKxiwr9IV4OU2Zj0wfcgZfts0cGiQzEfmRBRCyZHdi
         5gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqq2LM2t+HmFiSRF7FgdQUDEL19Q+hSAOOihEvGk4Dc=;
        b=aWWkl27kcjeY08+skMypthOvZPNfdfNbNfESoLqXHrrMBLgZ0WwzPfJWL5Ku6KEaar
         ZfFmxnH0xVDrUCKU80qziRUfE1mdIwY6IJ/+cpQut6NKrTLa1YijUmtitRFBC9CpUAgj
         m+jQhkXLry+BEQXejQtSnr6LYAaPNNERpfTTjADhskRRVVLoXi7iPzu4OlYwLorVplHN
         aRNDl6fLiCeIUb9RrPnFMr2tDzI4HLKYCf/uMzoQ+EBGepl05vSIbfvT0A5EKLLR/kZm
         9DLO0i5htrd3TNfuwW/lzlwnM0wo3Q6UNq4uQzRPqBLnrFDAI4z18fg6Up5bk7Ko+25T
         XINg==
X-Gm-Message-State: AO0yUKX0bbxSPs4O8RVGWAHexsMJZBVDohNTl7RgHzXozrEVJSa1+N8y
	MSlFVopc3RXoIFP3ldepeccPGBvFmeI=
X-Google-Smtp-Source: AK7set+kcFY7XsDKtLQs18c6Bb0OK0K3u0Stm/G02MIx8hyZlJr+N6G0D80/JfLmA3IwyCtPtv6aRw==
X-Received: by 2002:a17:907:5c6:b0:8af:3b78:315d with SMTP id wg6-20020a17090705c600b008af3b78315dmr33240581ejb.23.1677264623042;
        Fri, 24 Feb 2023 10:50:23 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 05/14] x86/svm: move nestedsvm declarations used only by svm code to private header
Date: Fri, 24 Feb 2023 20:50:01 +0200
Message-Id: <20230224185010.3692754-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new private header in arch/x86/hvm/svm called nestedsvm.h and move
there all definitions and declarations that are used only by svm code and
don't need to reside in an external header.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - new patch

 xen/arch/x86/hvm/svm/intr.c                  |  2 +
 xen/arch/x86/hvm/svm/nestedhvm.h             | 77 ++++++++++++++++++++
 xen/arch/x86/hvm/svm/nestedsvm.c             |  2 +-
 xen/arch/x86/hvm/svm/svm.c                   |  2 +-
 xen/arch/x86/hvm/svm/svm.h                   |  2 +-
 xen/arch/x86/include/asm/hvm/svm/nestedsvm.h | 53 +-------------
 6 files changed, 86 insertions(+), 52 deletions(-)
 create mode 100644 xen/arch/x86/hvm/svm/nestedhvm.h

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index d21e930af0..dbb0022190 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -37,6 +37,8 @@
 #include <xen/domain_page.h>
 #include <asm/hvm/trace.h>
 
+#include "nestedhvm.h"
+
 static void svm_inject_nmi(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
new file mode 100644
index 0000000000..43245e13de
--- /dev/null
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * nestedsvm.h: Nested Virtualization
+ *
+ * Copyright (c) 2011, Advanced Micro Devices, Inc
+ */
+
+#ifndef __X86_HVM_SVM_NESTEDHVM_PRIV_H__
+#define __X86_HVM_SVM_NESTEDHVM_PRIV_H__
+
+#include <xen/mm.h>
+#include <xen/types.h>
+
+#include <asm/hvm/vcpu.h>
+#include <asm/hvm/hvm.h>
+#include <asm/hvm/nestedhvm.h>
+#include <asm/msr-index.h>
+
+/* SVM specific intblk types, cannot be an enum because gcc 4.5 complains */
+/* GIF cleared */
+#define hvm_intblk_svm_gif      hvm_intblk_arch
+
+#define vcpu_nestedsvm(v) (vcpu_nestedhvm(v).u.nsvm)
+
+/* True when l1 guest enabled SVM in EFER */
+#define nsvm_efer_svm_enabled(v) \
+    (!!((v)->arch.hvm.guest_efer & EFER_SVME))
+
+int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
+void nestedsvm_vmexit_defer(struct vcpu *v,
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
+enum nestedhvm_vmexits
+nestedsvm_vmexit_n2n1(struct vcpu *v, struct cpu_user_regs *regs);
+enum nestedhvm_vmexits
+nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
+    uint64_t exitcode);
+void svm_nested_features_on_efer_update(struct vcpu *v);
+
+/* Interface methods */
+void cf_check nsvm_vcpu_destroy(struct vcpu *v);
+int cf_check nsvm_vcpu_initialise(struct vcpu *v);
+int cf_check nsvm_vcpu_reset(struct vcpu *v);
+int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
+int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v,
+                                    const struct x86_event *event);
+uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
+bool cf_check nsvm_vmcb_guest_intercepts_event(
+    struct vcpu *v, unsigned int vector, int errcode);
+bool cf_check nsvm_vmcb_hap_enabled(struct vcpu *v);
+enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v);
+
+/* Interrupts, vGIF */
+void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v);
+void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v);
+bool nestedsvm_gif_isset(struct vcpu *v);
+int cf_check nsvm_hap_walk_L1_p2m(
+    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
+    uint8_t *p2m_acc, struct npfec npfec);
+
+#define NSVM_INTR_NOTHANDLED     3
+#define NSVM_INTR_NOTINTERCEPTED 2
+#define NSVM_INTR_FORCEVMEXIT    1
+#define NSVM_INTR_MASKED         0
+
+int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
+
+#endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 5f5752ce21..80b72b5dee 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -20,13 +20,13 @@
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/paging.h> /* paging_mode_hap */
 #include <asm/event.h> /* for local_event_delivery_(en|dis)able */
 #include <asm/p2m.h> /* p2m_get_pagetable, p2m_get_nestedp2m */
 
 #include "emulate.h"
+#include "nestedhvm.h"
 #include "svm.h"
 
 #define NSVM_ERROR_VVMCB        1
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index c767a3eb76..4b74ee3d7c 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -37,7 +37,6 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
@@ -55,6 +54,7 @@
 
 #include "asid.h"
 #include "emulate.h"
+#include "nestedhvm.h"
 #include "svm.h"
 
 void noreturn svm_asm_do_resume(void);
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index 9e65919757..f700f26f90 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -36,7 +36,7 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
         ".byte 0x0f,0x01,0xdf"
         : /* output */
         : /* input */
-        "a" (linear), "c" (asid));
+        "a" (linear), "c" (asid) );
 }
 
 /* TSC rate */
diff --git a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
index 656d7d1a9a..94d45d2e8d 100644
--- a/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/nestedsvm.h
@@ -18,15 +18,12 @@
 #ifndef __ASM_X86_HVM_SVM_NESTEDSVM_H__
 #define __ASM_X86_HVM_SVM_NESTEDSVM_H__
 
-#include <asm/hvm/hvm.h>
-#include <asm/hvm/svm/vmcb.h>
+#include <xen/types.h>
 
-/* SVM specific intblk types, cannot be an enum because gcc 4.5 complains */
-/* GIF cleared */
-#define hvm_intblk_svm_gif      hvm_intblk_arch
+#include <asm/hvm/svm/vmcb.h>
 
 struct nestedsvm {
-    bool_t ns_gif;
+    bool ns_gif;
     uint64_t ns_msr_hsavepa; /* MSR HSAVE_PA value */
 
     /* l1 guest physical address of virtual vmcb used by prior VMRUN.
@@ -72,7 +69,7 @@ struct nestedsvm {
     uint64_t ns_vmcb_guestcr3, ns_vmcb_hostcr3;
     uint32_t ns_guest_asid;
 
-    bool_t ns_hap_enabled;
+    bool ns_hap_enabled;
 
     /* Only meaningful when vmexit_pending flag is set */
     struct {
@@ -90,48 +87,6 @@ struct nestedsvm {
     } ns_hostflags;
 };
 
-#define vcpu_nestedsvm(v) (vcpu_nestedhvm(v).u.nsvm)
-
-/* True when l1 guest enabled SVM in EFER */
-#define nsvm_efer_svm_enabled(v) \
-    (!!((v)->arch.hvm.guest_efer & EFER_SVME))
-
-int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
-void nestedsvm_vmexit_defer(struct vcpu *v,
-    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
-enum nestedhvm_vmexits
-nestedsvm_vmexit_n2n1(struct vcpu *v, struct cpu_user_regs *regs);
-enum nestedhvm_vmexits
-nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
-    uint64_t exitcode);
-void svm_nested_features_on_efer_update(struct vcpu *v);
-
-/* Interface methods */
-void cf_check nsvm_vcpu_destroy(struct vcpu *v);
-int cf_check nsvm_vcpu_initialise(struct vcpu *v);
-int cf_check nsvm_vcpu_reset(struct vcpu *v);
-int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
-int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v, const struct x86_event *event);
-uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
-bool cf_check nsvm_vmcb_guest_intercepts_event(
-    struct vcpu *v, unsigned int vector, int errcode);
-bool cf_check nsvm_vmcb_hap_enabled(struct vcpu *v);
-enum hvm_intblk cf_check nsvm_intr_blocked(struct vcpu *v);
-
-/* Interrupts, vGIF */
-void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v);
-void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v);
-bool_t nestedsvm_gif_isset(struct vcpu *v);
-int cf_check nsvm_hap_walk_L1_p2m(
-    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
-    uint8_t *p2m_acc, struct npfec npfec);
-
-#define NSVM_INTR_NOTHANDLED     3
-#define NSVM_INTR_NOTINTERCEPTED 2
-#define NSVM_INTR_FORCEVMEXIT    1
-#define NSVM_INTR_MASKED         0
-int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
-
 #endif /* ASM_X86_HVM_SVM_NESTEDSVM_H__ */
 
 /*
-- 
2.37.2


