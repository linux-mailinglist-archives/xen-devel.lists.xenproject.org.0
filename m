Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB33569B281
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 19:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497256.768182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5mc-0005cx-Ng; Fri, 17 Feb 2023 18:48:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497256.768182; Fri, 17 Feb 2023 18:48:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5mc-0005al-KX; Fri, 17 Feb 2023 18:48:34 +0000
Received: by outflank-mailman (input) for mailman id 497256;
 Fri, 17 Feb 2023 18:48:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzBr=6N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pT5ma-0005Js-Re
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 18:48:32 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac6a99ed-aef3-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 19:48:31 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id h14so8050672edz.10
 for <xen-devel@lists.xenproject.org>; Fri, 17 Feb 2023 10:48:31 -0800 (PST)
Received: from uni.router.wind (adsl-65.109.242.225.tellas.gr.
 [109.242.225.65]) by smtp.googlemail.com with ESMTPSA id
 z61-20020a509e43000000b004ad03b18ae3sm2641585ede.62.2023.02.17.10.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 10:48:30 -0800 (PST)
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
X-Inumbo-ID: ac6a99ed-aef3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Djk/78DDpP+8CW5w/ow3EWkMxANCkYy8Nj+VhfuGuV0=;
        b=JnuEVHWyjYlmG1Cad2vXXTaRQLYYmbLcqzodb5jQRczSQpX9QwwLUBZZHsL927LQ68
         fXLn7l0IvOThqO2r8UAJbnXQRlU3qRuzc4bFvFbJG1svZe09wcSNnbkdNE2NMNgDEtEq
         ZLxiIjhKpcHo3ebWLEUDKAro4ych0UJqpiU6JW64OLv2rqkgUvrAIcUTZzef+K7qZce0
         KxQNLqQyQauCEjlbRMRjHgsLKnlxpQDWcXM7PuxaVIJFYhWEgAljbIaRVoAiol5/sB/2
         9DYxmjnpkcTLGnTJLravCMPeaGbbCJTXK2PoLHZBV1v+/ZH7/1tvbVn7Se3dSH4NF7ku
         Lu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Djk/78DDpP+8CW5w/ow3EWkMxANCkYy8Nj+VhfuGuV0=;
        b=i3rd0xSm6aE8jvKQc0w2QyBlrkCHl0xvZOw7+RllEOoF/D29EUTfUc3+KsjXSpxdZ4
         0xCH/zQz7ban1FXuC44RVQ8GG9j7kiJhjepH94Muy4Ku48qs28Le+z83s+Zpvw8WMUJX
         pFFEBVs+v2RheYXgQkgDNoWGglKkIDISuw05/CnvrGPsg7ykjef1nameURZ8gwyjpck+
         bPALWbyzi/ixekzHbM5A6ZOMWhvv63ZXcZENIuBQCvN6bHDPu5H2c4lQc0PTPWcnxC+7
         KY5mzdUxkuzXlM0eQmOKvbOMzRVCfowsWJfi2xGZV1E0SJxdtxt640PaSgMToPC2LJ58
         yMpA==
X-Gm-Message-State: AO0yUKUwA/BSDaj4t+rIuG0cQLtVVNt9Qa2mFqeaoL93WSZNPegJOYuZ
	6dBt9/N/ojiCcf2OEbZTIzP0U77kCkk=
X-Google-Smtp-Source: AK7set/U013G0DNq0T8SasvqUD6wh9RUcm5fU9EqzvrKn/pheoI8MCst3mPDFpfExMuaj07v1qtIKw==
X-Received: by 2002:a05:6402:492:b0:4a2:4ed3:c151 with SMTP id k18-20020a056402049200b004a24ed3c151mr1743182edv.39.1676659710632;
        Fri, 17 Feb 2023 10:48:30 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/4] x86/svm: cleanup svm.h
Date: Fri, 17 Feb 2023 20:48:12 +0200
Message-Id: <20230217184814.1243046-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230217184814.1243046-1-burzalodowa@gmail.com>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the forward declaration of struct vcpu because it is not used.

Move the forward declaration of struct cpu_user_regs just above the
function that needs it (to remind that it will need to be removed
along with the function).

Move the definitions of NPT_PFEC_with_gla and NPT_PFEC_in_gpt in svm.c
because they are used only in this file.

Move the definitions of SVM_PAUSE{FILTER,THRESH}_INIT in vmcb.c because
they are used only in this file.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/hvm/svm/svm.c             |  6 ++++++
 xen/arch/x86/hvm/svm/vmcb.c            |  3 +++
 xen/arch/x86/include/asm/hvm/svm/svm.h | 13 +------------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index f0bc72c313..620c0d2e67 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1634,6 +1634,12 @@ static int cf_check svm_cpu_up(void)
     return _svm_cpu_up(false);
 }
 
+/* EXITINFO1 fields on NPT faults */
+#define _NPT_PFEC_with_gla     32
+#define NPT_PFEC_with_gla      (1UL<<_NPT_PFEC_with_gla)
+#define _NPT_PFEC_in_gpt       33
+#define NPT_PFEC_in_gpt        (1UL<<_NPT_PFEC_in_gpt)
+
 static void svm_do_nested_pgfault(struct vcpu *v,
     struct cpu_user_regs *regs, uint64_t pfec, paddr_t gpa)
 {
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 305d4767e3..151a04b60d 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -30,6 +30,9 @@
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/spec_ctrl.h>
 
+#define SVM_PAUSEFILTER_INIT    4000
+#define SVM_PAUSETHRESH_INIT    1000
+
 struct vmcb_struct *alloc_vmcb(void)
 {
     struct vmcb_struct *vmcb;
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 65e35a4f59..2cd9cea4a0 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -45,10 +45,8 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
         "a" (linear), "c" (asid));
 }
 
-struct cpu_user_regs;
-struct vcpu;
-
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
+struct cpu_user_regs;
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
 
 /*
@@ -96,17 +94,8 @@ extern u32 svm_feature_flags;
 #define cpu_has_svm_sss       cpu_has_svm_feature(SVM_FEATURE_SSS)
 #define cpu_has_svm_spec_ctrl cpu_has_svm_feature(SVM_FEATURE_SPEC_CTRL)
 
-#define SVM_PAUSEFILTER_INIT    4000
-#define SVM_PAUSETHRESH_INIT    1000
-
 /* TSC rate */
 #define DEFAULT_TSC_RATIO       0x0000000100000000ULL
 #define TSC_RATIO_RSVD_BITS     0xffffff0000000000ULL
 
-/* EXITINFO1 fields on NPT faults */
-#define _NPT_PFEC_with_gla     32
-#define NPT_PFEC_with_gla      (1UL<<_NPT_PFEC_with_gla)
-#define _NPT_PFEC_in_gpt       33
-#define NPT_PFEC_in_gpt        (1UL<<_NPT_PFEC_in_gpt)
-
 #endif /* __ASM_X86_HVM_SVM_H__ */
-- 
2.37.2


