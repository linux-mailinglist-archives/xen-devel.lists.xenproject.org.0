Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB217A24685
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880058.1290278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34p-0004Yq-Rs; Sat, 01 Feb 2025 02:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880058.1290278; Sat, 01 Feb 2025 02:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34p-0004X3-NJ; Sat, 01 Feb 2025 02:17:43 +0000
Received: by outflank-mailman (input) for mailman id 880058;
 Sat, 01 Feb 2025 02:17:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nbP4=UY=flex--seanjc.bounces.google.com=3Q4SdZwYKCQYykgtpimuumrk.ius3kt-jk1krroyzy.3ktvxupkiz.uxm@srs-se1.protection.inumbo.net>)
 id 1te34n-0002sH-Ke
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:41 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6426eef-e042-11ef-a0e6-8be0dac302b0;
 Sat, 01 Feb 2025 03:17:41 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ef91d5c863so5214158a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:41 -0800 (PST)
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
X-Inumbo-ID: b6426eef-e042-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376259; x=1738981059; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IW8kJcAcrKvt4c0vMOL7jWV1OXPEd6lfnHsLFZy4QXA=;
        b=u5r2yP8nY0proWRdrPWqgiNwULrxZLR+nu0opv0+uPTPhT3R1UasvRlWBMtyIf4DiY
         nQ7Ybvb5p2/1PAV+y3GB8ZujOhl+MXJXD83jBLnMp7GAtHJQYFQiqlafhBcAyGK+gBEQ
         jD078MrFczhqg6ybEVAbL6mZr99YvZ0jvSEETumAK1qm4oC4x9LX0jQGVFsvk/Kk79Bh
         PbZ2XLSsDUvwggpPOdrFoYYMFaVpSuCC3Rb0n8sCZf+O+otdEMCdeqy7qAQpsUHqGSoF
         CDHqOv92FLNqFS5H6+0nnhKedYDqNAZihWRgwDZHV23A4vXevdBDaFU0I4HWftygVGNP
         eE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376259; x=1738981059;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW8kJcAcrKvt4c0vMOL7jWV1OXPEd6lfnHsLFZy4QXA=;
        b=wUQrVx6S0JuagK1XGmyVvhgqftgbbw4Mhc1zxO4jVrab3RwEsns/NQrhofCmFrCxMP
         E28R+gXvZaoG/j+nhz2u6ErJExCVPmj0im4JylOqJnwU21GZryQqGZmwdzRo9wCFharJ
         hRpiEnF0D0YnlN2LaMJrjsqxuopvvXFoW2wWWDO6K3LFIwkMDH86g2f284CGZjK5j51x
         7Nsfo6nAB19TD8SYuafdFMgo0lo7DCqLd+VnIca9eLWnx+QUL/fyhGel0zS9VrspgH5Z
         qwRw3aDi81fH+WD49nvzTI+lUXDmDJNqtUhFdZD1KnDm0tk7NrSc4NFb42EZ40C0B5KS
         TEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWB6ms1o3Q0v28N5xOCbHjfaed9Ui3nv3jnXtNkwKBfS3QQ2x7K+PoUFOCGhC954XH7REXfVu3Mxo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2arjyrS3pXjogH7uVQXM/hx4fVq7SrJYArrcTx+48aL0byZYh
	UcS6+KnLBBZvbk0vUdC0HrTsDMBwaubVXMbfK38QyvZ3X1RTYzw03RGyZ2BPpWi8TIKygCEG0I9
	Qyw==
X-Google-Smtp-Source: AGHT+IF5rIJ4SRqkvzrTVMPpN2jn4obzhnrXzWmKwhKWojp8QTZ0kuVpAxPsfycQKPuD0sAxN2zkeFmWkds=
X-Received: from pjbsb15.prod.google.com ([2002:a17:90b:50cf:b0:2ef:701e:21c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a08:b0:2ea:37b4:5373
 with SMTP id 98e67ed59e1d1-2f83abe2135mr21011714a91.10.1738376259599; Fri, 31
 Jan 2025 18:17:39 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:09 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-8-seanjc@google.com>
Subject: [PATCH 07/16] x86/acrn: Mark TSC frequency as known when using ACRN
 for calibration
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index c1506cb87d8c..2da3de4d470e 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -29,6 +29,7 @@ static void __init acrn_init_platform(void)
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
 
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	tsc_register_calibration_routines(acrn_get_tsc_khz,
 					  acrn_get_tsc_khz);
 }
-- 
2.48.1.362.g079036d154-goog


