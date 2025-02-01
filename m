Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AFCA2468E
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880055.1290259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34m-0003xN-59; Sat, 01 Feb 2025 02:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880055.1290259; Sat, 01 Feb 2025 02:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34l-0003wT-VE; Sat, 01 Feb 2025 02:17:39 +0000
Received: by outflank-mailman (input) for mailman id 880055;
 Sat, 01 Feb 2025 02:17:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Nfi=UY=flex--seanjc.bounces.google.com=3P4SdZwYKCQIugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@srs-se1.protection.inumbo.net>)
 id 1te34l-0002if-1q
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:39 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b41a20a0-e042-11ef-99a4-01e77a169b0f;
 Sat, 01 Feb 2025 03:17:37 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2ef9864e006so7282823a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:37 -0800 (PST)
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
X-Inumbo-ID: b41a20a0-e042-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376256; x=1738981056; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Jjc0FDt1SDUJCzq8fzQuxH7Yk0FUL+T40LhhOPtkSdY=;
        b=1qanetJ9zybFd1uTmDFLOpIpPfzda17S+me8782sHogATYYXa0m5QGWTJZDuSEJGLf
         Q+dOVltiCXLxD+PBEgpmqNNskwy3W2EMvIEVeC7Cub/bPWXOY7Vr6xodPbwvL7Dcm1PX
         dDgR0nzEMSmk4FVoaNc9ibkIdjC2E7rNQ4vySY3A28eAhIk5qjVTDOUHbz0hm+XL02h9
         Fr2pwEp7Ty/K46HaDMyifUPjeNgy7G1ZkBJU/j4HFLAl/mP+FvyfjtEvg5kghxGQ0YMx
         xL9dpYe966ub/d0EixvZG8FTROGYK3Tz3BvVixzgqzJy2zZR1C58PDT1pkExtX2pWMjI
         mW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376256; x=1738981056;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jjc0FDt1SDUJCzq8fzQuxH7Yk0FUL+T40LhhOPtkSdY=;
        b=eyu5FnOMCg0+ib91LE/V5q5cGvuULf+TDFCLL/gpCZCQ/rFb1rXs2Zuy2aAydhmP7Y
         5UgLlo28sqdOfeRYuCLcPr23sQ+65jvFVXfYaZpTiNctAL2l0eR6MPIkpM+v1GerefVc
         IL3ZlZF45EubCT9hGN3Y49jNChKr5MiweEKDIQJyMnJTH9MLObV47hAaPD3M5eh17PyI
         lP1zabdvQjXsL91HAqKwGBR91Hxx9+I4PQ5FINQ0KOfPVwe3A5XwuWc1LKJ9XxVpECEO
         76djy8nM67wLA0easRGPjGbyMEq4GyFVHVXTkKTrWoamFJ1BaZ0UAqwqcxGWc8wxeuhm
         HvAw==
X-Forwarded-Encrypted: i=1; AJvYcCX/A1fpDvOIFOjcL6lgS1+k2xEVRgyWEz7N6+RnUAvWnZa8/4dmqulJKYit0LkdsuUwxYPfRLWiDzA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjTRhYOsm0uuI4kev/IHExwEQurHAQp+nEmwnLsG84BbCDcmfi
	QzMrNnEpnU8BEG8QFVLqZRovgnAFAoDX8sFne39lYV2VWtLk01HK3Awa5EDXZv5Les34EwjA4P6
	eAA==
X-Google-Smtp-Source: AGHT+IHNY7VvQQRT0KSmjAH4FP26r3GzVfaLj1GKx7+F1yhKWmFMaX6hkP/CltwMml7T2BlNCnyUm1qLLO4=
X-Received: from pjbsv5.prod.google.com ([2002:a17:90b:5385:b0:2f4:3ea1:9033])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c03:b0:2ee:d18c:7d84
 with SMTP id 98e67ed59e1d1-2f83ac17ebemr18755620a91.20.1738376255998; Fri, 31
 Jan 2025 18:17:35 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:07 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-6-seanjc@google.com>
Subject: [PATCH 05/16] x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
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

Move the check on having a Secure TSC to the common tsc_early_init() so
that it's obvious that having a Secure TSC is conditional, and to prepare
for adding TDX to the mix (blindly initializing *both* SNP and TDX TSC
logic looks especially weird).

No functional change intended.

Cc: Nikunj A Dadhania <nikunj@amd.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c | 3 ---
 arch/x86/kernel/tsc.c    | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index e6ce4ca72465..dab386f782ce 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -3284,9 +3284,6 @@ void __init snp_secure_tsc_init(void)
 {
 	unsigned long long tsc_freq_mhz;
 
-	if (!cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
-		return;
-
 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 5a16271b7a5c..09ca0cbd4f31 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1514,7 +1514,8 @@ void __init tsc_early_init(void)
 	if (is_early_uv_system())
 		return;
 
-	snp_secure_tsc_init();
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
+		snp_secure_tsc_init();
 
 	if (!determine_cpu_tsc_frequencies(true))
 		return;
-- 
2.48.1.362.g079036d154-goog


