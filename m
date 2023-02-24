Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9206A21C5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501420.773218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9L-0003c3-29; Fri, 24 Feb 2023 18:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501420.773218; Fri, 24 Feb 2023 18:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9K-0003Xm-Oo; Fri, 24 Feb 2023 18:50:30 +0000
Received: by outflank-mailman (input) for mailman id 501420;
 Fri, 24 Feb 2023 18:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9I-0002YL-Rp
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:29 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 198ecfb8-b474-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 19:50:25 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id f13so1041114edz.6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:25 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:24 -0800 (PST)
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
X-Inumbo-ID: 198ecfb8-b474-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EViI3mZmnE5vT4lmNn/pIOedAgt2T4pJJfLbz7KKHMo=;
        b=kTHblB7ucI2CyZWjb1GzA0Tc9ytEQv8Vo3dyf1sCwS1Dh/e0Xy8hNRSHh/HufOx5hs
         TaZ/e18Z3xAyPQjMVOpfUU1KiiZ88wAETCwO17W0w9lZcWiNxKKHojV2tj9ZzKn8cqUe
         Oz2IyMml+KPWd5/s3xF5uHkO6F3bNTT/uatpYgI98oyl1xAgXTYZnPsSasQXCKS7jwJm
         bt5mru8porhWHKLU/8UTlxFilonM4LXDRQdzvCxT2A5SCTorCpAiBcZgUs03bi+3yryW
         x1h3dSb1woeP2NYlixVvfaKrJmrNGpXRHMG5ZYBQU+2CqUeMOICAk4ywwjgn8CfSfqyR
         RAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EViI3mZmnE5vT4lmNn/pIOedAgt2T4pJJfLbz7KKHMo=;
        b=2rGXFb0Xi2MBwPBI7LGNUneW07GW07LdAJip4L6ua+0jrK30sbGwBvPuG40tTMdIIG
         JxSvz47Rgnw+qiMoYdzVFH2Ky5A7HEE+OQapp+sHW+XTF3GxgcRalb9+P8zMQFpoRAXQ
         T1dKpo6tiOXVF8G2MWq8rityowJPNn5/cdyXC60Nw8jvbnTDZwwulwDV/bTtc65EJsu5
         tvExTUdc04ChYIfmRgSS1pQ2k8IRpFJfB1vLpQiLFvaNU5ueJt8HyyrJ+cJvAxbm6CnO
         S5o450IpjyBuQ8yN3je68I90WN1Wl8OLbafKZZ9uPT6Q6sw4BAp6cCu71/C2l+FbSpAB
         ackQ==
X-Gm-Message-State: AO0yUKWUXJAZM8HUy4MTo/Q9sIcZB9UhInon64W3qWqIA/WXnfXIli5O
	Oly5R6/eEsn1XKpJxLo5oToAlBV1iC0=
X-Google-Smtp-Source: AK7set+So/D8uX1KCY0RLyTCuRSm0p/kvV1tJdqRARDace7QLP5u/Xhz3dD0SEuyui+50P0s/GCEyA==
X-Received: by 2002:a17:906:16c5:b0:870:94e:13f9 with SMTP id t5-20020a17090616c500b00870094e13f9mr23075921ejd.0.1677264624886;
        Fri, 24 Feb 2023 10:50:24 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 06/14] x86/svm: move vmcb declarations used only by svm code to private header
Date: Fri, 24 Feb 2023 20:50:02 +0200
Message-Id: <20230224185010.3692754-7-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create a new private header in arch/x86/hvm/svm called vmcb.h and move
there all definitions and declarations that are used only by svm code and
don't need to reside in an external header.

Take the opportunity to replace u* with uint*_t and remove redundant blank
lines.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - new patch

 xen/arch/x86/hvm/svm/asid.c             |   1 +
 xen/arch/x86/hvm/svm/emulate.c          |   1 +
 xen/arch/x86/hvm/svm/intr.c             |   1 +
 xen/arch/x86/hvm/svm/nestedsvm.c        |   1 +
 xen/arch/x86/hvm/svm/svm.c              |   1 +
 xen/arch/x86/hvm/svm/svmdebug.c         |   2 +
 xen/arch/x86/hvm/svm/vmcb.c             |   2 +
 xen/arch/x86/hvm/svm/vmcb.h             | 591 ++++++++++++++++++++++++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 575 +----------------------
 9 files changed, 604 insertions(+), 571 deletions(-)
 create mode 100644 xen/arch/x86/hvm/svm/vmcb.h

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index 1128434878..05ba2df9d5 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -20,6 +20,7 @@
 #include <asm/hvm/svm/svm.h>
 
 #include "asid.h"
+#include "vmcb.h"
 
 void svm_asid_init(const struct cpuinfo_x86 *c)
 {
diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 4a84b4e761..573d005127 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/svm/vmcb.h>
 
 #include "emulate.h"
+#include "vmcb.h"
 
 static unsigned long svm_nextrip_insn_length(struct vcpu *v)
 {
diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index dbb0022190..2655c5b4c8 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -38,6 +38,7 @@
 #include <asm/hvm/trace.h>
 
 #include "nestedhvm.h"
+#include "vmcb.h"
 
 static void svm_inject_nmi(struct vcpu *v)
 {
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 80b72b5dee..efbd9bbb77 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -28,6 +28,7 @@
 #include "emulate.h"
 #include "nestedhvm.h"
 #include "svm.h"
+#include "vmcb.h"
 
 #define NSVM_ERROR_VVMCB        1
 #define NSVM_ERROR_VMENTRY      2
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 4b74ee3d7c..86b1bf3242 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -56,6 +56,7 @@
 #include "emulate.h"
 #include "nestedhvm.h"
 #include "svm.h"
+#include "vmcb.h"
 
 void noreturn svm_asm_do_resume(void);
 
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index bce86f0ef7..ade74dfd8f 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -21,6 +21,8 @@
 #include <asm/msr-index.h>
 #include <asm/hvm/svm/svmdebug.h>
 
+#include "vmcb.h"
+
 static void svm_dump_sel(const char *name, const struct segment_register *s)
 {
     printk("%s: %04x %04x %08x %016"PRIx64"\n",
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index ba93375e87..1d512fedb0 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -30,6 +30,8 @@
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/spec_ctrl.h>
 
+#include "vmcb.h"
+
 struct vmcb_struct *alloc_vmcb(void)
 {
     struct vmcb_struct *vmcb;
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
new file mode 100644
index 0000000000..c58625fd80
--- /dev/null
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -0,0 +1,591 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * vmcb.h: VMCB related definitions
+ *
+ * Copyright (c) 2005-2007, Advanced Micro Devices, Inc
+ * Copyright (c) 2004, Intel Corporation.
+ */
+
+#ifndef __X86_HVM_SVM_VMCB_PRIV_H__
+#define __X86_HVM_SVM_VMCB_PRIV_H__
+
+#include <xen/types.h>
+
+#include <asm/x86_emulate.h>
+
+/* general 1 intercepts */
+enum GenericIntercept1bits
+{
+    GENERAL1_INTERCEPT_INTR          = 1 << 0,
+    GENERAL1_INTERCEPT_NMI           = 1 << 1,
+    GENERAL1_INTERCEPT_SMI           = 1 << 2,
+    GENERAL1_INTERCEPT_INIT          = 1 << 3,
+    GENERAL1_INTERCEPT_VINTR         = 1 << 4,
+    GENERAL1_INTERCEPT_CR0_SEL_WRITE = 1 << 5,
+    GENERAL1_INTERCEPT_IDTR_READ     = 1 << 6,
+    GENERAL1_INTERCEPT_GDTR_READ     = 1 << 7,
+    GENERAL1_INTERCEPT_LDTR_READ     = 1 << 8,
+    GENERAL1_INTERCEPT_TR_READ       = 1 << 9,
+    GENERAL1_INTERCEPT_IDTR_WRITE    = 1 << 10,
+    GENERAL1_INTERCEPT_GDTR_WRITE    = 1 << 11,
+    GENERAL1_INTERCEPT_LDTR_WRITE    = 1 << 12,
+    GENERAL1_INTERCEPT_TR_WRITE      = 1 << 13,
+    GENERAL1_INTERCEPT_RDTSC         = 1 << 14,
+    GENERAL1_INTERCEPT_RDPMC         = 1 << 15,
+    GENERAL1_INTERCEPT_PUSHF         = 1 << 16,
+    GENERAL1_INTERCEPT_POPF          = 1 << 17,
+    GENERAL1_INTERCEPT_CPUID         = 1 << 18,
+    GENERAL1_INTERCEPT_RSM           = 1 << 19,
+    GENERAL1_INTERCEPT_IRET          = 1 << 20,
+    GENERAL1_INTERCEPT_SWINT         = 1 << 21,
+    GENERAL1_INTERCEPT_INVD          = 1 << 22,
+    GENERAL1_INTERCEPT_PAUSE         = 1 << 23,
+    GENERAL1_INTERCEPT_HLT           = 1 << 24,
+    GENERAL1_INTERCEPT_INVLPG        = 1 << 25,
+    GENERAL1_INTERCEPT_INVLPGA       = 1 << 26,
+    GENERAL1_INTERCEPT_IOIO_PROT     = 1 << 27,
+    GENERAL1_INTERCEPT_MSR_PROT      = 1 << 28,
+    GENERAL1_INTERCEPT_TASK_SWITCH   = 1 << 29,
+    GENERAL1_INTERCEPT_FERR_FREEZE   = 1 << 30,
+    GENERAL1_INTERCEPT_SHUTDOWN_EVT  = 1u << 31
+};
+
+/* general 2 intercepts */
+enum GenericIntercept2bits
+{
+    GENERAL2_INTERCEPT_VMRUN   = 1 << 0,
+    GENERAL2_INTERCEPT_VMMCALL = 1 << 1,
+    GENERAL2_INTERCEPT_VMLOAD  = 1 << 2,
+    GENERAL2_INTERCEPT_VMSAVE  = 1 << 3,
+    GENERAL2_INTERCEPT_STGI    = 1 << 4,
+    GENERAL2_INTERCEPT_CLGI    = 1 << 5,
+    GENERAL2_INTERCEPT_SKINIT  = 1 << 6,
+    GENERAL2_INTERCEPT_RDTSCP  = 1 << 7,
+    GENERAL2_INTERCEPT_ICEBP   = 1 << 8,
+    GENERAL2_INTERCEPT_WBINVD  = 1 << 9,
+    GENERAL2_INTERCEPT_MONITOR = 1 << 10,
+    GENERAL2_INTERCEPT_MWAIT   = 1 << 11,
+    GENERAL2_INTERCEPT_MWAIT_CONDITIONAL = 1 << 12,
+    GENERAL2_INTERCEPT_XSETBV  = 1 << 13,
+    GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
+};
+
+/* control register intercepts */
+enum CRInterceptBits
+{
+    CR_INTERCEPT_CR0_READ   = 1 << 0,
+    CR_INTERCEPT_CR1_READ   = 1 << 1,
+    CR_INTERCEPT_CR2_READ   = 1 << 2,
+    CR_INTERCEPT_CR3_READ   = 1 << 3,
+    CR_INTERCEPT_CR4_READ   = 1 << 4,
+    CR_INTERCEPT_CR5_READ   = 1 << 5,
+    CR_INTERCEPT_CR6_READ   = 1 << 6,
+    CR_INTERCEPT_CR7_READ   = 1 << 7,
+    CR_INTERCEPT_CR8_READ   = 1 << 8,
+    CR_INTERCEPT_CR9_READ   = 1 << 9,
+    CR_INTERCEPT_CR10_READ  = 1 << 10,
+    CR_INTERCEPT_CR11_READ  = 1 << 11,
+    CR_INTERCEPT_CR12_READ  = 1 << 12,
+    CR_INTERCEPT_CR13_READ  = 1 << 13,
+    CR_INTERCEPT_CR14_READ  = 1 << 14,
+    CR_INTERCEPT_CR15_READ  = 1 << 15,
+    CR_INTERCEPT_CR0_WRITE  = 1 << 16,
+    CR_INTERCEPT_CR1_WRITE  = 1 << 17,
+    CR_INTERCEPT_CR2_WRITE  = 1 << 18,
+    CR_INTERCEPT_CR3_WRITE  = 1 << 19,
+    CR_INTERCEPT_CR4_WRITE  = 1 << 20,
+    CR_INTERCEPT_CR5_WRITE  = 1 << 21,
+    CR_INTERCEPT_CR6_WRITE  = 1 << 22,
+    CR_INTERCEPT_CR7_WRITE  = 1 << 23,
+    CR_INTERCEPT_CR8_WRITE  = 1 << 24,
+    CR_INTERCEPT_CR9_WRITE  = 1 << 25,
+    CR_INTERCEPT_CR10_WRITE = 1 << 26,
+    CR_INTERCEPT_CR11_WRITE = 1 << 27,
+    CR_INTERCEPT_CR12_WRITE = 1 << 28,
+    CR_INTERCEPT_CR13_WRITE = 1 << 29,
+    CR_INTERCEPT_CR14_WRITE = 1 << 30,
+    CR_INTERCEPT_CR15_WRITE = 1u << 31,
+};
+
+/* debug register intercepts */
+enum DRInterceptBits
+{
+    DR_INTERCEPT_DR0_READ   = 1 << 0,
+    DR_INTERCEPT_DR1_READ   = 1 << 1,
+    DR_INTERCEPT_DR2_READ   = 1 << 2,
+    DR_INTERCEPT_DR3_READ   = 1 << 3,
+    DR_INTERCEPT_DR4_READ   = 1 << 4,
+    DR_INTERCEPT_DR5_READ   = 1 << 5,
+    DR_INTERCEPT_DR6_READ   = 1 << 6,
+    DR_INTERCEPT_DR7_READ   = 1 << 7,
+    DR_INTERCEPT_DR8_READ   = 1 << 8,
+    DR_INTERCEPT_DR9_READ   = 1 << 9,
+    DR_INTERCEPT_DR10_READ  = 1 << 10,
+    DR_INTERCEPT_DR11_READ  = 1 << 11,
+    DR_INTERCEPT_DR12_READ  = 1 << 12,
+    DR_INTERCEPT_DR13_READ  = 1 << 13,
+    DR_INTERCEPT_DR14_READ  = 1 << 14,
+    DR_INTERCEPT_DR15_READ  = 1 << 15,
+    DR_INTERCEPT_DR0_WRITE  = 1 << 16,
+    DR_INTERCEPT_DR1_WRITE  = 1 << 17,
+    DR_INTERCEPT_DR2_WRITE  = 1 << 18,
+    DR_INTERCEPT_DR3_WRITE  = 1 << 19,
+    DR_INTERCEPT_DR4_WRITE  = 1 << 20,
+    DR_INTERCEPT_DR5_WRITE  = 1 << 21,
+    DR_INTERCEPT_DR6_WRITE  = 1 << 22,
+    DR_INTERCEPT_DR7_WRITE  = 1 << 23,
+    DR_INTERCEPT_DR8_WRITE  = 1 << 24,
+    DR_INTERCEPT_DR9_WRITE  = 1 << 25,
+    DR_INTERCEPT_DR10_WRITE = 1 << 26,
+    DR_INTERCEPT_DR11_WRITE = 1 << 27,
+    DR_INTERCEPT_DR12_WRITE = 1 << 28,
+    DR_INTERCEPT_DR13_WRITE = 1 << 29,
+    DR_INTERCEPT_DR14_WRITE = 1 << 30,
+    DR_INTERCEPT_DR15_WRITE = 1u << 31,
+};
+
+enum VMEXIT_EXITCODE
+{
+    /* control register read exitcodes */
+    VMEXIT_CR0_READ    =   0, /* 0x0 */
+    VMEXIT_CR1_READ    =   1, /* 0x1 */
+    VMEXIT_CR2_READ    =   2, /* 0x2 */
+    VMEXIT_CR3_READ    =   3, /* 0x3 */
+    VMEXIT_CR4_READ    =   4, /* 0x4 */
+    VMEXIT_CR5_READ    =   5, /* 0x5 */
+    VMEXIT_CR6_READ    =   6, /* 0x6 */
+    VMEXIT_CR7_READ    =   7, /* 0x7 */
+    VMEXIT_CR8_READ    =   8, /* 0x8 */
+    VMEXIT_CR9_READ    =   9, /* 0x9 */
+    VMEXIT_CR10_READ   =  10, /* 0xa */
+    VMEXIT_CR11_READ   =  11, /* 0xb */
+    VMEXIT_CR12_READ   =  12, /* 0xc */
+    VMEXIT_CR13_READ   =  13, /* 0xd */
+    VMEXIT_CR14_READ   =  14, /* 0xe */
+    VMEXIT_CR15_READ   =  15, /* 0xf */
+
+    /* control register write exitcodes */
+    VMEXIT_CR0_WRITE   =  16, /* 0x10 */
+    VMEXIT_CR1_WRITE   =  17, /* 0x11 */
+    VMEXIT_CR2_WRITE   =  18, /* 0x12 */
+    VMEXIT_CR3_WRITE   =  19, /* 0x13 */
+    VMEXIT_CR4_WRITE   =  20, /* 0x14 */
+    VMEXIT_CR5_WRITE   =  21, /* 0x15 */
+    VMEXIT_CR6_WRITE   =  22, /* 0x16 */
+    VMEXIT_CR7_WRITE   =  23, /* 0x17 */
+    VMEXIT_CR8_WRITE   =  24, /* 0x18 */
+    VMEXIT_CR9_WRITE   =  25, /* 0x19 */
+    VMEXIT_CR10_WRITE  =  26, /* 0x1a */
+    VMEXIT_CR11_WRITE  =  27, /* 0x1b */
+    VMEXIT_CR12_WRITE  =  28, /* 0x1c */
+    VMEXIT_CR13_WRITE  =  29, /* 0x1d */
+    VMEXIT_CR14_WRITE  =  30, /* 0x1e */
+    VMEXIT_CR15_WRITE  =  31, /* 0x1f */
+
+    /* debug register read exitcodes */
+    VMEXIT_DR0_READ    =  32, /* 0x20 */
+    VMEXIT_DR1_READ    =  33, /* 0x21 */
+    VMEXIT_DR2_READ    =  34, /* 0x22 */
+    VMEXIT_DR3_READ    =  35, /* 0x23 */
+    VMEXIT_DR4_READ    =  36, /* 0x24 */
+    VMEXIT_DR5_READ    =  37, /* 0x25 */
+    VMEXIT_DR6_READ    =  38, /* 0x26 */
+    VMEXIT_DR7_READ    =  39, /* 0x27 */
+    VMEXIT_DR8_READ    =  40, /* 0x28 */
+    VMEXIT_DR9_READ    =  41, /* 0x29 */
+    VMEXIT_DR10_READ   =  42, /* 0x2a */
+    VMEXIT_DR11_READ   =  43, /* 0x2b */
+    VMEXIT_DR12_READ   =  44, /* 0x2c */
+    VMEXIT_DR13_READ   =  45, /* 0x2d */
+    VMEXIT_DR14_READ   =  46, /* 0x2e */
+    VMEXIT_DR15_READ   =  47, /* 0x2f */
+
+    /* debug register write exitcodes */
+    VMEXIT_DR0_WRITE   =  48, /* 0x30 */
+    VMEXIT_DR1_WRITE   =  49, /* 0x31 */
+    VMEXIT_DR2_WRITE   =  50, /* 0x32 */
+    VMEXIT_DR3_WRITE   =  51, /* 0x33 */
+    VMEXIT_DR4_WRITE   =  52, /* 0x34 */
+    VMEXIT_DR5_WRITE   =  53, /* 0x35 */
+    VMEXIT_DR6_WRITE   =  54, /* 0x36 */
+    VMEXIT_DR7_WRITE   =  55, /* 0x37 */
+    VMEXIT_DR8_WRITE   =  56, /* 0x38 */
+    VMEXIT_DR9_WRITE   =  57, /* 0x39 */
+    VMEXIT_DR10_WRITE  =  58, /* 0x3a */
+    VMEXIT_DR11_WRITE  =  59, /* 0x3b */
+    VMEXIT_DR12_WRITE  =  60, /* 0x3c */
+    VMEXIT_DR13_WRITE  =  61, /* 0x3d */
+    VMEXIT_DR14_WRITE  =  62, /* 0x3e */
+    VMEXIT_DR15_WRITE  =  63, /* 0x3f */
+
+    /* processor exception exitcodes (VMEXIT_EXCP[0-31]) */
+    VMEXIT_EXCEPTION_DE  =  64, /* 0x40, divide-by-zero-error */
+    VMEXIT_EXCEPTION_DB  =  65, /* 0x41, debug */
+    VMEXIT_EXCEPTION_NMI =  66, /* 0x42, non-maskable-interrupt */
+    VMEXIT_EXCEPTION_BP  =  67, /* 0x43, breakpoint */
+    VMEXIT_EXCEPTION_OF  =  68, /* 0x44, overflow */
+    VMEXIT_EXCEPTION_BR  =  69, /* 0x45, bound-range */
+    VMEXIT_EXCEPTION_UD  =  70, /* 0x46, invalid-opcode*/
+    VMEXIT_EXCEPTION_NM  =  71, /* 0x47, device-not-available */
+    VMEXIT_EXCEPTION_DF  =  72, /* 0x48, double-fault */
+    VMEXIT_EXCEPTION_09  =  73, /* 0x49, unsupported (reserved) */
+    VMEXIT_EXCEPTION_TS  =  74, /* 0x4a, invalid-tss */
+    VMEXIT_EXCEPTION_NP  =  75, /* 0x4b, segment-not-present */
+    VMEXIT_EXCEPTION_SS  =  76, /* 0x4c, stack */
+    VMEXIT_EXCEPTION_GP  =  77, /* 0x4d, general-protection */
+    VMEXIT_EXCEPTION_PF  =  78, /* 0x4e, page-fault */
+    VMEXIT_EXCEPTION_15  =  79, /* 0x4f, reserved */
+    VMEXIT_EXCEPTION_MF  =  80, /* 0x50, x87 floating-point exception-pending */
+    VMEXIT_EXCEPTION_AC  =  81, /* 0x51, alignment-check */
+    VMEXIT_EXCEPTION_MC  =  82, /* 0x52, machine-check */
+    VMEXIT_EXCEPTION_XF  =  83, /* 0x53, simd floating-point */
+/*  VMEXIT_EXCEPTION_20  =  84,    0x54, #VE (Intel specific) */
+    VMEXIT_EXCEPTION_CP  =  85, /* 0x55, controlflow protection */
+
+    /* exceptions 20-31 (exitcodes 84-95) are reserved */
+
+    /* ...and the rest of the #VMEXITs */
+    VMEXIT_INTR             =  96, /* 0x60 */
+    VMEXIT_NMI              =  97, /* 0x61 */
+    VMEXIT_SMI              =  98, /* 0x62 */
+    VMEXIT_INIT             =  99, /* 0x63 */
+    VMEXIT_VINTR            = 100, /* 0x64 */
+    VMEXIT_CR0_SEL_WRITE    = 101, /* 0x65 */
+    VMEXIT_IDTR_READ        = 102, /* 0x66 */
+    VMEXIT_GDTR_READ        = 103, /* 0x67 */
+    VMEXIT_LDTR_READ        = 104, /* 0x68 */
+    VMEXIT_TR_READ          = 105, /* 0x69 */
+    VMEXIT_IDTR_WRITE       = 106, /* 0x6a */
+    VMEXIT_GDTR_WRITE       = 107, /* 0x6b */
+    VMEXIT_LDTR_WRITE       = 108, /* 0x6c */
+    VMEXIT_TR_WRITE         = 109, /* 0x6d */
+    VMEXIT_RDTSC            = 110, /* 0x6e */
+    VMEXIT_RDPMC            = 111, /* 0x6f */
+    VMEXIT_PUSHF            = 112, /* 0x70 */
+    VMEXIT_POPF             = 113, /* 0x71 */
+    VMEXIT_CPUID            = 114, /* 0x72 */
+    VMEXIT_RSM              = 115, /* 0x73 */
+    VMEXIT_IRET             = 116, /* 0x74 */
+    VMEXIT_SWINT            = 117, /* 0x75 */
+    VMEXIT_INVD             = 118, /* 0x76 */
+    VMEXIT_PAUSE            = 119, /* 0x77 */
+    VMEXIT_HLT              = 120, /* 0x78 */
+    VMEXIT_INVLPG           = 121, /* 0x79 */
+    VMEXIT_INVLPGA          = 122, /* 0x7a */
+    VMEXIT_IOIO             = 123, /* 0x7b */
+    VMEXIT_MSR              = 124, /* 0x7c */
+    VMEXIT_TASK_SWITCH      = 125, /* 0x7d */
+    VMEXIT_FERR_FREEZE      = 126, /* 0x7e */
+    VMEXIT_SHUTDOWN         = 127, /* 0x7f */
+    VMEXIT_VMRUN            = 128, /* 0x80 */
+    VMEXIT_VMMCALL          = 129, /* 0x81 */
+    VMEXIT_VMLOAD           = 130, /* 0x82 */
+    VMEXIT_VMSAVE           = 131, /* 0x83 */
+    VMEXIT_STGI             = 132, /* 0x84 */
+    VMEXIT_CLGI             = 133, /* 0x85 */
+    VMEXIT_SKINIT           = 134, /* 0x86 */
+    VMEXIT_RDTSCP           = 135, /* 0x87 */
+    VMEXIT_ICEBP            = 136, /* 0x88 */
+    VMEXIT_WBINVD           = 137, /* 0x89 */
+    VMEXIT_MONITOR          = 138, /* 0x8a */
+    VMEXIT_MWAIT            = 139, /* 0x8b */
+    VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
+    VMEXIT_XSETBV           = 141, /* 0x8d */
+    VMEXIT_RDPRU            = 142, /* 0x8e */
+    /* Remember to also update VMEXIT_NPF_PERFC! */
+    VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
+    /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
+    VMEXIT_INVALID          =  -1
+};
+
+enum
+{
+    /* Available on all SVM-capable hardware. */
+    TLB_CTRL_NO_FLUSH             = 0,
+    TLB_CTRL_FLUSH_ALL            = 1,
+
+    /* Available with the FlushByASID feature. */
+    TLB_CTRL_FLUSH_ASID           = 3,
+    TLB_CTRL_FLUSH_ASID_NONGLOBAL = 7,
+};
+
+typedef union
+{
+    struct
+    {
+        uint8_t  vector;
+        uint8_t  type:3;
+        bool     ev:1;
+        uint32_t resvd1:19;
+        bool     v:1;
+        uint32_t ec;
+    };
+    uint64_t raw;
+} intinfo_t;
+
+typedef union {
+    struct {
+        bool intr_shadow:    1;
+        bool guest_intr_mask:1;
+    };
+    uint64_t raw;
+} intstat_t;
+
+typedef union
+{
+    uint64_t bytes;
+    struct
+    {
+        uint64_t tpr:          8;
+        uint64_t irq:          1;
+        uint64_t vgif:         1;
+        uint64_t rsvd0:        6;
+        uint64_t prio:         4;
+        uint64_t ign_tpr:      1;
+        uint64_t rsvd1:        3;
+        uint64_t intr_masking: 1;
+        uint64_t vgif_enable:  1;
+        uint64_t rsvd2:        6;
+        uint64_t vector:       8;
+        uint64_t rsvd3:       24;
+    } fields;
+} vintr_t;
+
+typedef union
+{
+    uint64_t bytes;
+    struct
+    {
+        uint64_t type: 1;
+        uint64_t rsv0: 1;
+        uint64_t str:  1;
+        uint64_t rep:  1;
+        uint64_t sz8:  1;
+        uint64_t sz16: 1;
+        uint64_t sz32: 1;
+        uint64_t rsv1: 9;
+        uint64_t port: 16;
+    } fields;
+} ioio_info_t;
+
+typedef union
+{
+    struct {
+        bool intercepts:1; /* 0:  cr/dr/exception/general intercepts,
+                            *     pause_filter_count, tsc_offset */
+        bool iopm:1;       /* 1:  iopm_base_pa, msrpm_base_pa */
+        bool asid:1;       /* 2:  guest_asid */
+        bool tpr:1;        /* 3:  vintr */
+        bool np:1;         /* 4:  np_enable, h_cr3, g_pat */
+        bool cr:1;         /* 5:  cr0, cr3, cr4, efer */
+        bool dr:1;         /* 6:  dr6, dr7 */
+        bool dt:1;         /* 7:  gdtr, idtr */
+        bool seg:1;        /* 8:  cs, ds, es, ss, cpl */
+        bool cr2:1;        /* 9:  cr2 */
+        bool lbr:1;        /* 10: debugctlmsr, last{branch,int}{to,from}ip */
+        bool :1;
+        bool cet:1;        /* 12: msr_s_set, ssp, msr_isst */
+    };
+    uint32_t raw;
+} vmcbcleanbits_t;
+
+#define IOPM_SIZE   (12 * 1024)
+#define MSRPM_SIZE  (8  * 1024)
+
+struct vmcb_struct {
+    uint32_t _cr_intercepts;         /* offset 0x00 - cleanbit 0 */
+    uint32_t _dr_intercepts;         /* offset 0x04 - cleanbit 0 */
+    uint32_t _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
+    uint32_t _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
+    uint32_t _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
+    uint32_t res01[10];
+    uint16_t _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
+    uint16_t _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
+    uint64_t _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
+    uint64_t _msrpm_base_pa;         /* offset 0x48 - cleanbit 1 */
+    uint64_t _tsc_offset;            /* offset 0x50 - cleanbit 0 */
+    uint32_t _guest_asid;            /* offset 0x58 - cleanbit 2 */
+    uint8_t  tlb_control;            /* offset 0x5C - TLB_CTRL_* */
+    uint8_t  res07[3];
+    vintr_t _vintr;                  /* offset 0x60 - cleanbit 3 */
+    intstat_t int_stat;              /* offset 0x68 */
+    uint64_t exitcode;               /* offset 0x70 */
+    union {
+        struct {
+            uint64_t exitinfo1; /* offset 0x78 */
+            uint64_t exitinfo2; /* offset 0x80 */
+        };
+        union {
+            struct {
+                uint16_t sel;
+                uint64_t :48;
+
+                uint32_t ec;
+                uint32_t :4;
+                bool     iret:1;
+                uint32_t :1;
+                bool     jmp:1;
+                uint32_t :5;
+                bool     ev:1;
+                uint32_t :3;
+                bool     rf:1;
+            } task_switch;
+        } ei;
+    };
+    intinfo_t exit_int_info;    /* offset 0x88 */
+    union {                     /* offset 0x90 - cleanbit 4 */
+        struct {
+            bool _np_enable     :1;
+            bool _sev_enable    :1;
+            bool _sev_es_enable :1;
+            bool _gmet          :1;
+            bool _np_sss        :1;
+            bool _vte           :1;
+        };
+        uint64_t _np_ctrl;
+    };
+    uint64_t res08[2];
+    intinfo_t event_inj;        /* offset 0xA8 */
+    uint64_t _h_cr3;            /* offset 0xB0 - cleanbit 4 */
+    virt_ext_t virt_ext;        /* offset 0xB8 */
+    vmcbcleanbits_t cleanbits;  /* offset 0xC0 */
+    uint32_t res09;             /* offset 0xC4 */
+    uint64_t nextrip;           /* offset 0xC8 */
+    uint8_t  guest_ins_len;     /* offset 0xD0 */
+    uint8_t  guest_ins[15];     /* offset 0xD1 */
+    uint64_t res10a[100];       /* offset 0xE0 pad to save area */
+
+    union {
+        struct segment_register sreg[6];
+        struct {
+            struct segment_register es;  /* offset 0x400 - cleanbit 8 */
+            struct segment_register cs;  /* cleanbit 8 */
+            struct segment_register ss;  /* cleanbit 8 */
+            struct segment_register ds;  /* cleanbit 8 */
+            struct segment_register fs;
+            struct segment_register gs;
+        };
+    };
+    struct segment_register gdtr; /* cleanbit 7 */
+    struct segment_register ldtr;
+    struct segment_register idtr; /* cleanbit 7 */
+    struct segment_register tr;
+    uint64_t res10[5];
+    uint8_t res11[3];
+    uint8_t _cpl;               /* cleanbit 8 */
+    uint32_t res12;
+    uint64_t _efer;             /* offset 0x400 + 0xD0 - cleanbit 5 */
+    uint64_t res13[14];
+    uint64_t _cr4;              /* offset 0x400 + 0x148 - cleanbit 5 */
+    uint64_t _cr3;              /* cleanbit 5 */
+    uint64_t _cr0;              /* cleanbit 5 */
+    uint64_t _dr7;              /* cleanbit 6 */
+    uint64_t _dr6;              /* cleanbit 6 */
+    uint64_t rflags;
+    uint64_t rip;
+    uint64_t res14[11];
+    uint64_t rsp;
+    uint64_t _msr_s_cet;        /* offset 0x400 + 0x1E0 - cleanbit 12 */
+    uint64_t _ssp;              /* offset 0x400 + 0x1E8   | */
+    uint64_t _msr_isst;         /* offset 0x400 + 0x1F0   v */
+    uint64_t rax;
+    uint64_t star;
+    uint64_t lstar;
+    uint64_t cstar;
+    uint64_t sfmask;
+    uint64_t kerngsbase;
+    uint64_t sysenter_cs;
+    uint64_t sysenter_esp;
+    uint64_t sysenter_eip;
+    uint64_t _cr2;              /* cleanbit 9 */
+    uint64_t res16[4];
+    uint64_t _g_pat;            /* cleanbit 4 */
+    uint64_t _debugctlmsr;      /* cleanbit 10 */
+    uint64_t _lastbranchfromip; /* cleanbit 10 */
+    uint64_t _lastbranchtoip;   /* cleanbit 10 */
+    uint64_t _lastintfromip;    /* cleanbit 10 */
+    uint64_t _lastinttoip;      /* cleanbit 10 */
+    uint64_t res17[9];
+    uint64_t spec_ctrl;
+    uint64_t res18[291];
+};
+
+struct vmcb_struct *alloc_vmcb(void);
+void free_vmcb(struct vmcb_struct *vmcb);
+
+int  svm_create_vmcb(struct vcpu *v);
+void svm_destroy_vmcb(struct vcpu *v);
+
+void setup_vmcb_dump(void);
+
+/*
+ * VMCB accessor functions.
+ */
+
+#define VMCB_ACCESSORS_(name, type, cleanbit)     \
+static inline void                                \
+vmcb_set_ ## name(struct vmcb_struct *vmcb,       \
+                  type value)                     \
+{                                                 \
+    vmcb->_ ## name = value;                      \
+    vmcb->cleanbits.cleanbit = false;             \
+}                                                 \
+static inline type                                \
+vmcb_get_ ## name(const struct vmcb_struct *vmcb) \
+{                                                 \
+    return vmcb->_ ## name;                       \
+}
+
+#define VMCB_ACCESSORS(name, cleanbit) \
+        VMCB_ACCESSORS_(name, typeof(alloc_vmcb()->_ ## name), cleanbit)
+
+VMCB_ACCESSORS(cr_intercepts, intercepts)
+VMCB_ACCESSORS(dr_intercepts, intercepts)
+VMCB_ACCESSORS(exception_intercepts, intercepts)
+VMCB_ACCESSORS(general1_intercepts, intercepts)
+VMCB_ACCESSORS(general2_intercepts, intercepts)
+VMCB_ACCESSORS(pause_filter_count, intercepts)
+VMCB_ACCESSORS(pause_filter_thresh, intercepts)
+VMCB_ACCESSORS(tsc_offset, intercepts)
+VMCB_ACCESSORS(iopm_base_pa, iopm)
+VMCB_ACCESSORS(msrpm_base_pa, iopm)
+VMCB_ACCESSORS(guest_asid, asid)
+VMCB_ACCESSORS(vintr, tpr)
+VMCB_ACCESSORS(np_ctrl, np)
+VMCB_ACCESSORS_(np_enable, bool, np)
+VMCB_ACCESSORS_(sev_enable, bool, np)
+VMCB_ACCESSORS_(sev_es_enable, bool, np)
+VMCB_ACCESSORS_(gmet, bool, np)
+VMCB_ACCESSORS_(vte, bool, np)
+VMCB_ACCESSORS(h_cr3, np)
+VMCB_ACCESSORS(g_pat, np)
+VMCB_ACCESSORS(cr0, cr)
+VMCB_ACCESSORS(cr3, cr)
+VMCB_ACCESSORS(cr4, cr)
+VMCB_ACCESSORS(efer, cr)
+VMCB_ACCESSORS(dr6, dr)
+VMCB_ACCESSORS(dr7, dr)
+VMCB_ACCESSORS(cpl, seg)
+VMCB_ACCESSORS(cr2, cr2)
+VMCB_ACCESSORS(debugctlmsr, lbr)
+VMCB_ACCESSORS(lastbranchfromip, lbr)
+VMCB_ACCESSORS(lastbranchtoip, lbr)
+VMCB_ACCESSORS(lastintfromip, lbr)
+VMCB_ACCESSORS(lastinttoip, lbr)
+VMCB_ACCESSORS(msr_s_cet, cet)
+VMCB_ACCESSORS(ssp, cet)
+VMCB_ACCESSORS(msr_isst, cet)
+
+#undef VMCB_ACCESSORS
+
+#endif /* __X86_HVM_SVM_VMCB_PRIV_H__ */
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
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index e87728fa81..593badc651 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -21,515 +21,16 @@
 
 #include <xen/types.h>
 
-/* general 1 intercepts */
-enum GenericIntercept1bits
-{
-    GENERAL1_INTERCEPT_INTR          = 1 << 0,
-    GENERAL1_INTERCEPT_NMI           = 1 << 1,
-    GENERAL1_INTERCEPT_SMI           = 1 << 2,
-    GENERAL1_INTERCEPT_INIT          = 1 << 3,
-    GENERAL1_INTERCEPT_VINTR         = 1 << 4,
-    GENERAL1_INTERCEPT_CR0_SEL_WRITE = 1 << 5,
-    GENERAL1_INTERCEPT_IDTR_READ     = 1 << 6,
-    GENERAL1_INTERCEPT_GDTR_READ     = 1 << 7,
-    GENERAL1_INTERCEPT_LDTR_READ     = 1 << 8,
-    GENERAL1_INTERCEPT_TR_READ       = 1 << 9,
-    GENERAL1_INTERCEPT_IDTR_WRITE    = 1 << 10,
-    GENERAL1_INTERCEPT_GDTR_WRITE    = 1 << 11,
-    GENERAL1_INTERCEPT_LDTR_WRITE    = 1 << 12,
-    GENERAL1_INTERCEPT_TR_WRITE      = 1 << 13,
-    GENERAL1_INTERCEPT_RDTSC         = 1 << 14,
-    GENERAL1_INTERCEPT_RDPMC         = 1 << 15,
-    GENERAL1_INTERCEPT_PUSHF         = 1 << 16,
-    GENERAL1_INTERCEPT_POPF          = 1 << 17,
-    GENERAL1_INTERCEPT_CPUID         = 1 << 18,
-    GENERAL1_INTERCEPT_RSM           = 1 << 19,
-    GENERAL1_INTERCEPT_IRET          = 1 << 20,
-    GENERAL1_INTERCEPT_SWINT         = 1 << 21,
-    GENERAL1_INTERCEPT_INVD          = 1 << 22,
-    GENERAL1_INTERCEPT_PAUSE         = 1 << 23,
-    GENERAL1_INTERCEPT_HLT           = 1 << 24,
-    GENERAL1_INTERCEPT_INVLPG        = 1 << 25,
-    GENERAL1_INTERCEPT_INVLPGA       = 1 << 26,
-    GENERAL1_INTERCEPT_IOIO_PROT     = 1 << 27,
-    GENERAL1_INTERCEPT_MSR_PROT      = 1 << 28,
-    GENERAL1_INTERCEPT_TASK_SWITCH   = 1 << 29,
-    GENERAL1_INTERCEPT_FERR_FREEZE   = 1 << 30,
-    GENERAL1_INTERCEPT_SHUTDOWN_EVT  = 1u << 31
-};
-
-/* general 2 intercepts */
-enum GenericIntercept2bits
-{
-    GENERAL2_INTERCEPT_VMRUN   = 1 << 0,
-    GENERAL2_INTERCEPT_VMMCALL = 1 << 1,
-    GENERAL2_INTERCEPT_VMLOAD  = 1 << 2,
-    GENERAL2_INTERCEPT_VMSAVE  = 1 << 3,
-    GENERAL2_INTERCEPT_STGI    = 1 << 4,
-    GENERAL2_INTERCEPT_CLGI    = 1 << 5,
-    GENERAL2_INTERCEPT_SKINIT  = 1 << 6,
-    GENERAL2_INTERCEPT_RDTSCP  = 1 << 7,
-    GENERAL2_INTERCEPT_ICEBP   = 1 << 8,
-    GENERAL2_INTERCEPT_WBINVD  = 1 << 9,
-    GENERAL2_INTERCEPT_MONITOR = 1 << 10,
-    GENERAL2_INTERCEPT_MWAIT   = 1 << 11,
-    GENERAL2_INTERCEPT_MWAIT_CONDITIONAL = 1 << 12,
-    GENERAL2_INTERCEPT_XSETBV  = 1 << 13,
-    GENERAL2_INTERCEPT_RDPRU   = 1 << 14,
-};
-
-
-/* control register intercepts */
-enum CRInterceptBits
-{
-    CR_INTERCEPT_CR0_READ   = 1 << 0,
-    CR_INTERCEPT_CR1_READ   = 1 << 1,
-    CR_INTERCEPT_CR2_READ   = 1 << 2,
-    CR_INTERCEPT_CR3_READ   = 1 << 3,
-    CR_INTERCEPT_CR4_READ   = 1 << 4,
-    CR_INTERCEPT_CR5_READ   = 1 << 5,
-    CR_INTERCEPT_CR6_READ   = 1 << 6,
-    CR_INTERCEPT_CR7_READ   = 1 << 7,
-    CR_INTERCEPT_CR8_READ   = 1 << 8,
-    CR_INTERCEPT_CR9_READ   = 1 << 9,
-    CR_INTERCEPT_CR10_READ  = 1 << 10,
-    CR_INTERCEPT_CR11_READ  = 1 << 11,
-    CR_INTERCEPT_CR12_READ  = 1 << 12,
-    CR_INTERCEPT_CR13_READ  = 1 << 13,
-    CR_INTERCEPT_CR14_READ  = 1 << 14,
-    CR_INTERCEPT_CR15_READ  = 1 << 15,
-    CR_INTERCEPT_CR0_WRITE  = 1 << 16,
-    CR_INTERCEPT_CR1_WRITE  = 1 << 17,
-    CR_INTERCEPT_CR2_WRITE  = 1 << 18,
-    CR_INTERCEPT_CR3_WRITE  = 1 << 19,
-    CR_INTERCEPT_CR4_WRITE  = 1 << 20,
-    CR_INTERCEPT_CR5_WRITE  = 1 << 21,
-    CR_INTERCEPT_CR6_WRITE  = 1 << 22,
-    CR_INTERCEPT_CR7_WRITE  = 1 << 23,
-    CR_INTERCEPT_CR8_WRITE  = 1 << 24,
-    CR_INTERCEPT_CR9_WRITE  = 1 << 25,
-    CR_INTERCEPT_CR10_WRITE = 1 << 26,
-    CR_INTERCEPT_CR11_WRITE = 1 << 27,
-    CR_INTERCEPT_CR12_WRITE = 1 << 28,
-    CR_INTERCEPT_CR13_WRITE = 1 << 29,
-    CR_INTERCEPT_CR14_WRITE = 1 << 30,
-    CR_INTERCEPT_CR15_WRITE = 1u << 31,
-};
-
-
-/* debug register intercepts */
-enum DRInterceptBits
-{
-    DR_INTERCEPT_DR0_READ   = 1 << 0,
-    DR_INTERCEPT_DR1_READ   = 1 << 1,
-    DR_INTERCEPT_DR2_READ   = 1 << 2,
-    DR_INTERCEPT_DR3_READ   = 1 << 3,
-    DR_INTERCEPT_DR4_READ   = 1 << 4,
-    DR_INTERCEPT_DR5_READ   = 1 << 5,
-    DR_INTERCEPT_DR6_READ   = 1 << 6,
-    DR_INTERCEPT_DR7_READ   = 1 << 7,
-    DR_INTERCEPT_DR8_READ   = 1 << 8,
-    DR_INTERCEPT_DR9_READ   = 1 << 9,
-    DR_INTERCEPT_DR10_READ  = 1 << 10,
-    DR_INTERCEPT_DR11_READ  = 1 << 11,
-    DR_INTERCEPT_DR12_READ  = 1 << 12,
-    DR_INTERCEPT_DR13_READ  = 1 << 13,
-    DR_INTERCEPT_DR14_READ  = 1 << 14,
-    DR_INTERCEPT_DR15_READ  = 1 << 15,
-    DR_INTERCEPT_DR0_WRITE  = 1 << 16,
-    DR_INTERCEPT_DR1_WRITE  = 1 << 17,
-    DR_INTERCEPT_DR2_WRITE  = 1 << 18,
-    DR_INTERCEPT_DR3_WRITE  = 1 << 19,
-    DR_INTERCEPT_DR4_WRITE  = 1 << 20,
-    DR_INTERCEPT_DR5_WRITE  = 1 << 21,
-    DR_INTERCEPT_DR6_WRITE  = 1 << 22,
-    DR_INTERCEPT_DR7_WRITE  = 1 << 23,
-    DR_INTERCEPT_DR8_WRITE  = 1 << 24,
-    DR_INTERCEPT_DR9_WRITE  = 1 << 25,
-    DR_INTERCEPT_DR10_WRITE = 1 << 26,
-    DR_INTERCEPT_DR11_WRITE = 1 << 27,
-    DR_INTERCEPT_DR12_WRITE = 1 << 28,
-    DR_INTERCEPT_DR13_WRITE = 1 << 29,
-    DR_INTERCEPT_DR14_WRITE = 1 << 30,
-    DR_INTERCEPT_DR15_WRITE = 1u << 31,
-};
-
-enum VMEXIT_EXITCODE
-{
-    /* control register read exitcodes */
-    VMEXIT_CR0_READ    =   0, /* 0x0 */
-    VMEXIT_CR1_READ    =   1, /* 0x1 */
-    VMEXIT_CR2_READ    =   2, /* 0x2 */
-    VMEXIT_CR3_READ    =   3, /* 0x3 */
-    VMEXIT_CR4_READ    =   4, /* 0x4 */
-    VMEXIT_CR5_READ    =   5, /* 0x5 */
-    VMEXIT_CR6_READ    =   6, /* 0x6 */
-    VMEXIT_CR7_READ    =   7, /* 0x7 */
-    VMEXIT_CR8_READ    =   8, /* 0x8 */
-    VMEXIT_CR9_READ    =   9, /* 0x9 */
-    VMEXIT_CR10_READ   =  10, /* 0xa */
-    VMEXIT_CR11_READ   =  11, /* 0xb */
-    VMEXIT_CR12_READ   =  12, /* 0xc */
-    VMEXIT_CR13_READ   =  13, /* 0xd */
-    VMEXIT_CR14_READ   =  14, /* 0xe */
-    VMEXIT_CR15_READ   =  15, /* 0xf */
-
-    /* control register write exitcodes */
-    VMEXIT_CR0_WRITE   =  16, /* 0x10 */
-    VMEXIT_CR1_WRITE   =  17, /* 0x11 */
-    VMEXIT_CR2_WRITE   =  18, /* 0x12 */
-    VMEXIT_CR3_WRITE   =  19, /* 0x13 */
-    VMEXIT_CR4_WRITE   =  20, /* 0x14 */
-    VMEXIT_CR5_WRITE   =  21, /* 0x15 */
-    VMEXIT_CR6_WRITE   =  22, /* 0x16 */
-    VMEXIT_CR7_WRITE   =  23, /* 0x17 */
-    VMEXIT_CR8_WRITE   =  24, /* 0x18 */
-    VMEXIT_CR9_WRITE   =  25, /* 0x19 */
-    VMEXIT_CR10_WRITE  =  26, /* 0x1a */
-    VMEXIT_CR11_WRITE  =  27, /* 0x1b */
-    VMEXIT_CR12_WRITE  =  28, /* 0x1c */
-    VMEXIT_CR13_WRITE  =  29, /* 0x1d */
-    VMEXIT_CR14_WRITE  =  30, /* 0x1e */
-    VMEXIT_CR15_WRITE  =  31, /* 0x1f */
-
-    /* debug register read exitcodes */
-    VMEXIT_DR0_READ    =  32, /* 0x20 */
-    VMEXIT_DR1_READ    =  33, /* 0x21 */
-    VMEXIT_DR2_READ    =  34, /* 0x22 */
-    VMEXIT_DR3_READ    =  35, /* 0x23 */
-    VMEXIT_DR4_READ    =  36, /* 0x24 */
-    VMEXIT_DR5_READ    =  37, /* 0x25 */
-    VMEXIT_DR6_READ    =  38, /* 0x26 */
-    VMEXIT_DR7_READ    =  39, /* 0x27 */
-    VMEXIT_DR8_READ    =  40, /* 0x28 */
-    VMEXIT_DR9_READ    =  41, /* 0x29 */
-    VMEXIT_DR10_READ   =  42, /* 0x2a */
-    VMEXIT_DR11_READ   =  43, /* 0x2b */
-    VMEXIT_DR12_READ   =  44, /* 0x2c */
-    VMEXIT_DR13_READ   =  45, /* 0x2d */
-    VMEXIT_DR14_READ   =  46, /* 0x2e */
-    VMEXIT_DR15_READ   =  47, /* 0x2f */
-
-    /* debug register write exitcodes */
-    VMEXIT_DR0_WRITE   =  48, /* 0x30 */
-    VMEXIT_DR1_WRITE   =  49, /* 0x31 */
-    VMEXIT_DR2_WRITE   =  50, /* 0x32 */
-    VMEXIT_DR3_WRITE   =  51, /* 0x33 */
-    VMEXIT_DR4_WRITE   =  52, /* 0x34 */
-    VMEXIT_DR5_WRITE   =  53, /* 0x35 */
-    VMEXIT_DR6_WRITE   =  54, /* 0x36 */
-    VMEXIT_DR7_WRITE   =  55, /* 0x37 */
-    VMEXIT_DR8_WRITE   =  56, /* 0x38 */
-    VMEXIT_DR9_WRITE   =  57, /* 0x39 */
-    VMEXIT_DR10_WRITE  =  58, /* 0x3a */
-    VMEXIT_DR11_WRITE  =  59, /* 0x3b */
-    VMEXIT_DR12_WRITE  =  60, /* 0x3c */
-    VMEXIT_DR13_WRITE  =  61, /* 0x3d */
-    VMEXIT_DR14_WRITE  =  62, /* 0x3e */
-    VMEXIT_DR15_WRITE  =  63, /* 0x3f */
-
-    /* processor exception exitcodes (VMEXIT_EXCP[0-31]) */
-    VMEXIT_EXCEPTION_DE  =  64, /* 0x40, divide-by-zero-error */
-    VMEXIT_EXCEPTION_DB  =  65, /* 0x41, debug */
-    VMEXIT_EXCEPTION_NMI =  66, /* 0x42, non-maskable-interrupt */
-    VMEXIT_EXCEPTION_BP  =  67, /* 0x43, breakpoint */
-    VMEXIT_EXCEPTION_OF  =  68, /* 0x44, overflow */
-    VMEXIT_EXCEPTION_BR  =  69, /* 0x45, bound-range */
-    VMEXIT_EXCEPTION_UD  =  70, /* 0x46, invalid-opcode*/
-    VMEXIT_EXCEPTION_NM  =  71, /* 0x47, device-not-available */
-    VMEXIT_EXCEPTION_DF  =  72, /* 0x48, double-fault */
-    VMEXIT_EXCEPTION_09  =  73, /* 0x49, unsupported (reserved) */
-    VMEXIT_EXCEPTION_TS  =  74, /* 0x4a, invalid-tss */
-    VMEXIT_EXCEPTION_NP  =  75, /* 0x4b, segment-not-present */
-    VMEXIT_EXCEPTION_SS  =  76, /* 0x4c, stack */
-    VMEXIT_EXCEPTION_GP  =  77, /* 0x4d, general-protection */
-    VMEXIT_EXCEPTION_PF  =  78, /* 0x4e, page-fault */
-    VMEXIT_EXCEPTION_15  =  79, /* 0x4f, reserved */
-    VMEXIT_EXCEPTION_MF  =  80, /* 0x50, x87 floating-point exception-pending */
-    VMEXIT_EXCEPTION_AC  =  81, /* 0x51, alignment-check */
-    VMEXIT_EXCEPTION_MC  =  82, /* 0x52, machine-check */
-    VMEXIT_EXCEPTION_XF  =  83, /* 0x53, simd floating-point */
-/*  VMEXIT_EXCEPTION_20  =  84,    0x54, #VE (Intel specific) */
-    VMEXIT_EXCEPTION_CP  =  85, /* 0x55, controlflow protection */
-
-    /* exceptions 20-31 (exitcodes 84-95) are reserved */
-
-    /* ...and the rest of the #VMEXITs */
-    VMEXIT_INTR             =  96, /* 0x60 */
-    VMEXIT_NMI              =  97, /* 0x61 */
-    VMEXIT_SMI              =  98, /* 0x62 */
-    VMEXIT_INIT             =  99, /* 0x63 */
-    VMEXIT_VINTR            = 100, /* 0x64 */
-    VMEXIT_CR0_SEL_WRITE    = 101, /* 0x65 */
-    VMEXIT_IDTR_READ        = 102, /* 0x66 */
-    VMEXIT_GDTR_READ        = 103, /* 0x67 */
-    VMEXIT_LDTR_READ        = 104, /* 0x68 */
-    VMEXIT_TR_READ          = 105, /* 0x69 */
-    VMEXIT_IDTR_WRITE       = 106, /* 0x6a */
-    VMEXIT_GDTR_WRITE       = 107, /* 0x6b */
-    VMEXIT_LDTR_WRITE       = 108, /* 0x6c */
-    VMEXIT_TR_WRITE         = 109, /* 0x6d */
-    VMEXIT_RDTSC            = 110, /* 0x6e */
-    VMEXIT_RDPMC            = 111, /* 0x6f */
-    VMEXIT_PUSHF            = 112, /* 0x70 */
-    VMEXIT_POPF             = 113, /* 0x71 */
-    VMEXIT_CPUID            = 114, /* 0x72 */
-    VMEXIT_RSM              = 115, /* 0x73 */
-    VMEXIT_IRET             = 116, /* 0x74 */
-    VMEXIT_SWINT            = 117, /* 0x75 */
-    VMEXIT_INVD             = 118, /* 0x76 */
-    VMEXIT_PAUSE            = 119, /* 0x77 */
-    VMEXIT_HLT              = 120, /* 0x78 */
-    VMEXIT_INVLPG           = 121, /* 0x79 */
-    VMEXIT_INVLPGA          = 122, /* 0x7a */
-    VMEXIT_IOIO             = 123, /* 0x7b */
-    VMEXIT_MSR              = 124, /* 0x7c */
-    VMEXIT_TASK_SWITCH      = 125, /* 0x7d */
-    VMEXIT_FERR_FREEZE      = 126, /* 0x7e */
-    VMEXIT_SHUTDOWN         = 127, /* 0x7f */
-    VMEXIT_VMRUN            = 128, /* 0x80 */
-    VMEXIT_VMMCALL          = 129, /* 0x81 */
-    VMEXIT_VMLOAD           = 130, /* 0x82 */
-    VMEXIT_VMSAVE           = 131, /* 0x83 */
-    VMEXIT_STGI             = 132, /* 0x84 */
-    VMEXIT_CLGI             = 133, /* 0x85 */
-    VMEXIT_SKINIT           = 134, /* 0x86 */
-    VMEXIT_RDTSCP           = 135, /* 0x87 */
-    VMEXIT_ICEBP            = 136, /* 0x88 */
-    VMEXIT_WBINVD           = 137, /* 0x89 */
-    VMEXIT_MONITOR          = 138, /* 0x8a */
-    VMEXIT_MWAIT            = 139, /* 0x8b */
-    VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
-    VMEXIT_XSETBV           = 141, /* 0x8d */
-    VMEXIT_RDPRU            = 142, /* 0x8e */
-    /* Remember to also update VMEXIT_NPF_PERFC! */
-    VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
-    /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
-    VMEXIT_INVALID          =  -1
-};
-
-enum
-{
-    /* Available on all SVM-capable hardware. */
-    TLB_CTRL_NO_FLUSH             = 0,
-    TLB_CTRL_FLUSH_ALL            = 1,
-
-    /* Available with the FlushByASID feature. */
-    TLB_CTRL_FLUSH_ASID           = 3,
-    TLB_CTRL_FLUSH_ASID_NONGLOBAL = 7,
-};
-
 typedef union
 {
+    uint64_t bytes;
     struct
     {
-        uint8_t  vector;
-        uint8_t  type:3;
-        bool     ev:1;
-        uint32_t resvd1:19;
-        bool     v:1;
-        uint32_t ec;
-    };
-    uint64_t raw;
-} intinfo_t;
-
-typedef union {
-    struct {
-        bool intr_shadow:    1;
-        bool guest_intr_mask:1;
-    };
-    uint64_t raw;
-} intstat_t;
-
-typedef union
-{
-    u64 bytes;
-    struct
-    {
-        u64 tpr:          8;
-        u64 irq:          1;
-        u64 vgif:         1;
-        u64 rsvd0:        6;
-        u64 prio:         4;
-        u64 ign_tpr:      1;
-        u64 rsvd1:        3;
-        u64 intr_masking: 1;
-        u64 vgif_enable:  1;
-        u64 rsvd2:        6;
-        u64 vector:       8;
-        u64 rsvd3:       24;
-    } fields;
-} vintr_t;
-
-typedef union
-{
-    u64 bytes;
-    struct
-    {
-        u64 type: 1;
-        u64 rsv0: 1;
-        u64 str:  1;
-        u64 rep:  1;
-        u64 sz8:  1;
-        u64 sz16: 1;
-        u64 sz32: 1;
-        u64 rsv1: 9;
-        u64 port: 16;
-    } fields;
-} ioio_info_t;
-
-typedef union
-{
-    u64 bytes;
-    struct
-    {
-        u64 lbr_enable:1;
-        u64 vloadsave_enable:1;
+        uint64_t lbr_enable:1;
+        uint64_t vloadsave_enable:1;
     } fields;
 } virt_ext_t;
 
-typedef union
-{
-    struct {
-        bool intercepts:1; /* 0:  cr/dr/exception/general intercepts,
-                            *     pause_filter_count, tsc_offset */
-        bool iopm:1;       /* 1:  iopm_base_pa, msrpm_base_pa */
-        bool asid:1;       /* 2:  guest_asid */
-        bool tpr:1;        /* 3:  vintr */
-        bool np:1;         /* 4:  np_enable, h_cr3, g_pat */
-        bool cr:1;         /* 5:  cr0, cr3, cr4, efer */
-        bool dr:1;         /* 6:  dr6, dr7 */
-        bool dt:1;         /* 7:  gdtr, idtr */
-        bool seg:1;        /* 8:  cs, ds, es, ss, cpl */
-        bool cr2:1;        /* 9:  cr2 */
-        bool lbr:1;        /* 10: debugctlmsr, last{branch,int}{to,from}ip */
-        bool :1;
-        bool cet:1;        /* 12: msr_s_set, ssp, msr_isst */
-    };
-    uint32_t raw;
-} vmcbcleanbits_t;
-
-#define IOPM_SIZE   (12 * 1024)
-#define MSRPM_SIZE  (8  * 1024)
-
-struct vmcb_struct {
-    u32 _cr_intercepts;         /* offset 0x00 - cleanbit 0 */
-    u32 _dr_intercepts;         /* offset 0x04 - cleanbit 0 */
-    u32 _exception_intercepts;  /* offset 0x08 - cleanbit 0 */
-    u32 _general1_intercepts;   /* offset 0x0C - cleanbit 0 */
-    u32 _general2_intercepts;   /* offset 0x10 - cleanbit 0 */
-    u32 res01[10];
-    u16 _pause_filter_thresh;   /* offset 0x3C - cleanbit 0 */
-    u16 _pause_filter_count;    /* offset 0x3E - cleanbit 0 */
-    u64 _iopm_base_pa;          /* offset 0x40 - cleanbit 1 */
-    u64 _msrpm_base_pa;         /* offset 0x48 - cleanbit 1 */
-    u64 _tsc_offset;            /* offset 0x50 - cleanbit 0 */
-    u32 _guest_asid;            /* offset 0x58 - cleanbit 2 */
-    u8  tlb_control;            /* offset 0x5C - TLB_CTRL_* */
-    u8  res07[3];
-    vintr_t _vintr;             /* offset 0x60 - cleanbit 3 */
-    intstat_t int_stat;         /* offset 0x68 */
-    u64 exitcode;               /* offset 0x70 */
-    union {
-        struct {
-            uint64_t exitinfo1; /* offset 0x78 */
-            uint64_t exitinfo2; /* offset 0x80 */
-        };
-        union {
-            struct {
-                uint16_t sel;
-                uint64_t :48;
-
-                uint32_t ec;
-                uint32_t :4;
-                bool     iret:1;
-                uint32_t :1;
-                bool     jmp:1;
-                uint32_t :5;
-                bool     ev:1;
-                uint32_t :3;
-                bool     rf:1;
-            } task_switch;
-        } ei;
-    };
-    intinfo_t exit_int_info;    /* offset 0x88 */
-    union {                     /* offset 0x90 - cleanbit 4 */
-        struct {
-            bool _np_enable     :1;
-            bool _sev_enable    :1;
-            bool _sev_es_enable :1;
-            bool _gmet          :1;
-            bool _np_sss        :1;
-            bool _vte           :1;
-        };
-        uint64_t _np_ctrl;
-    };
-    u64 res08[2];
-    intinfo_t event_inj;        /* offset 0xA8 */
-    u64 _h_cr3;                 /* offset 0xB0 - cleanbit 4 */
-    virt_ext_t virt_ext;        /* offset 0xB8 */
-    vmcbcleanbits_t cleanbits;  /* offset 0xC0 */
-    u32 res09;                  /* offset 0xC4 */
-    u64 nextrip;                /* offset 0xC8 */
-    u8  guest_ins_len;          /* offset 0xD0 */
-    u8  guest_ins[15];          /* offset 0xD1 */
-    u64 res10a[100];            /* offset 0xE0 pad to save area */
-
-    union {
-        struct segment_register sreg[6];
-        struct {
-            struct segment_register es;  /* offset 0x400 - cleanbit 8 */
-            struct segment_register cs;  /* cleanbit 8 */
-            struct segment_register ss;  /* cleanbit 8 */
-            struct segment_register ds;  /* cleanbit 8 */
-            struct segment_register fs;
-            struct segment_register gs;
-        };
-    };
-    struct segment_register gdtr; /* cleanbit 7 */
-    struct segment_register ldtr;
-    struct segment_register idtr; /* cleanbit 7 */
-    struct segment_register tr;
-    u64 res10[5];
-    u8 res11[3];
-    u8 _cpl;                    /* cleanbit 8 */
-    u32 res12;
-    u64 _efer;                  /* offset 0x400 + 0xD0 - cleanbit 5 */
-    u64 res13[14];
-    u64 _cr4;                   /* offset 0x400 + 0x148 - cleanbit 5 */
-    u64 _cr3;                   /* cleanbit 5 */
-    u64 _cr0;                   /* cleanbit 5 */
-    u64 _dr7;                   /* cleanbit 6 */
-    u64 _dr6;                   /* cleanbit 6 */
-    u64 rflags;
-    u64 rip;
-    u64 res14[11];
-    u64 rsp;
-    u64 _msr_s_cet;             /* offset 0x400 + 0x1E0 - cleanbit 12 */
-    u64 _ssp;                   /* offset 0x400 + 0x1E8   | */
-    u64 _msr_isst;              /* offset 0x400 + 0x1F0   v */
-    u64 rax;
-    u64 star;
-    u64 lstar;
-    u64 cstar;
-    u64 sfmask;
-    u64 kerngsbase;
-    u64 sysenter_cs;
-    u64 sysenter_esp;
-    u64 sysenter_eip;
-    u64 _cr2;                   /* cleanbit 9 */
-    u64 res16[4];
-    u64 _g_pat;                 /* cleanbit 4 */
-    u64 _debugctlmsr;           /* cleanbit 10 */
-    u64 _lastbranchfromip;      /* cleanbit 10 */
-    u64 _lastbranchtoip;        /* cleanbit 10 */
-    u64 _lastintfromip;         /* cleanbit 10 */
-    u64 _lastinttoip;           /* cleanbit 10 */
-    u64 res17[9];
-    u64 spec_ctrl;
-    u64 res18[291];
-};
-
 struct svm_domain {
     /* OSVW MSRs */
     union {
@@ -558,7 +59,7 @@ enum vmcb_sync_state {
 
 struct svm_vcpu {
     struct vmcb_struct *vmcb;
-    u64    vmcb_pa;
+    uint64_t vmcb_pa;
     unsigned long *msrpm;
     int    launch_core;
 
@@ -577,14 +78,6 @@ struct svm_vcpu {
     uint64_t guest_sysenter_eip;
 };
 
-struct vmcb_struct *alloc_vmcb(void);
-void free_vmcb(struct vmcb_struct *vmcb);
-
-int  svm_create_vmcb(struct vcpu *v);
-void svm_destroy_vmcb(struct vcpu *v);
-
-void setup_vmcb_dump(void);
-
 #define MSR_INTERCEPT_NONE    0
 #define MSR_INTERCEPT_READ    1
 #define MSR_INTERCEPT_WRITE   2
@@ -593,66 +86,6 @@ void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
 #define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
 #define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
 
-/*
- * VMCB accessor functions.
- */
-
-#define VMCB_ACCESSORS_(name, type, cleanbit)     \
-static inline void                                \
-vmcb_set_ ## name(struct vmcb_struct *vmcb,       \
-                  type value)                     \
-{                                                 \
-    vmcb->_ ## name = value;                      \
-    vmcb->cleanbits.cleanbit = false;             \
-}                                                 \
-static inline type                                \
-vmcb_get_ ## name(const struct vmcb_struct *vmcb) \
-{                                                 \
-    return vmcb->_ ## name;                       \
-}
-
-#define VMCB_ACCESSORS(name, cleanbit) \
-        VMCB_ACCESSORS_(name, typeof(alloc_vmcb()->_ ## name), cleanbit)
-
-VMCB_ACCESSORS(cr_intercepts, intercepts)
-VMCB_ACCESSORS(dr_intercepts, intercepts)
-VMCB_ACCESSORS(exception_intercepts, intercepts)
-VMCB_ACCESSORS(general1_intercepts, intercepts)
-VMCB_ACCESSORS(general2_intercepts, intercepts)
-VMCB_ACCESSORS(pause_filter_count, intercepts)
-VMCB_ACCESSORS(pause_filter_thresh, intercepts)
-VMCB_ACCESSORS(tsc_offset, intercepts)
-VMCB_ACCESSORS(iopm_base_pa, iopm)
-VMCB_ACCESSORS(msrpm_base_pa, iopm)
-VMCB_ACCESSORS(guest_asid, asid)
-VMCB_ACCESSORS(vintr, tpr)
-VMCB_ACCESSORS(np_ctrl, np)
-VMCB_ACCESSORS_(np_enable, bool, np)
-VMCB_ACCESSORS_(sev_enable, bool, np)
-VMCB_ACCESSORS_(sev_es_enable, bool, np)
-VMCB_ACCESSORS_(gmet, bool, np)
-VMCB_ACCESSORS_(vte, bool, np)
-VMCB_ACCESSORS(h_cr3, np)
-VMCB_ACCESSORS(g_pat, np)
-VMCB_ACCESSORS(cr0, cr)
-VMCB_ACCESSORS(cr3, cr)
-VMCB_ACCESSORS(cr4, cr)
-VMCB_ACCESSORS(efer, cr)
-VMCB_ACCESSORS(dr6, dr)
-VMCB_ACCESSORS(dr7, dr)
-VMCB_ACCESSORS(cpl, seg)
-VMCB_ACCESSORS(cr2, cr2)
-VMCB_ACCESSORS(debugctlmsr, lbr)
-VMCB_ACCESSORS(lastbranchfromip, lbr)
-VMCB_ACCESSORS(lastbranchtoip, lbr)
-VMCB_ACCESSORS(lastintfromip, lbr)
-VMCB_ACCESSORS(lastinttoip, lbr)
-VMCB_ACCESSORS(msr_s_cet, cet)
-VMCB_ACCESSORS(ssp, cet)
-VMCB_ACCESSORS(msr_isst, cet)
-
-#undef VMCB_ACCESSORS
-
 #endif /* ASM_X86_HVM_SVM_VMCS_H__ */
 
 /*
-- 
2.37.2


