Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED01A47211
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:19:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897370.1306074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUa-00076v-1N; Thu, 27 Feb 2025 02:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897370.1306074; Thu, 27 Feb 2025 02:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUZ-000738-RF; Thu, 27 Feb 2025 02:19:15 +0000
Received: by outflank-mailman (input) for mailman id 897370;
 Thu, 27 Feb 2025 02:19:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WFyt=VS=flex--seanjc.bounces.google.com=3n8u_ZwYKCXoqcYlhaemmejc.amkvcl-bctcjjgqrq.vclnpmhcar.mpe@srs-se1.protection.inumbo.net>)
 id 1tnTUY-00063X-Lx
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:14 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bdf564a-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:13 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fe86c01f4aso1065320a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:13 -0800 (PST)
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
X-Inumbo-ID: 3bdf564a-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622752; x=1741227552; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=JV0vL5ay0SjXSCwSvRRqMw5uYQ06F8yr+AS2fSIuB98=;
        b=pWLcT2rKPGHuSwHWKRkTx2avZ+yfI2qcUh53fODALnArzXGoBp2/gmbd1urtjXQd7i
         TeHStqrHY4xxn0RC+AZUrXI+dGErIt+pIym/XjWy+XT9TVn+3kV38bjeFykHwd2lt0ff
         fCuiILxwOtlVbSfzhD+/G2TQsP25fiAAUTVE14+8vDsD4bxIhyXIWSwWL/QfH/zEaM3j
         mobB1K+4B3N3ggameCADMSbRKPGaNYnufliuSvjX3fQ5PUiThE3996Wak+MUdqh9kO4j
         +LQ6xnEiWwmi9FjR0HB0JwDM0t66xUkHBHHM+i7q6S1AG4+EfXHk1FUg4d/6SAJURn8/
         RXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622752; x=1741227552;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JV0vL5ay0SjXSCwSvRRqMw5uYQ06F8yr+AS2fSIuB98=;
        b=nZQ/MS2/hy04fPYk3ONX0Msty4s3+f5DZN+S/jo+2wA99tTJzGze7yyHSAbhF1ak/i
         0njdgxscZkOqKxkpbOyVG/UGJJsqOrFak+/6EVsAoWavehXRfJ539nEjuFIu+XNJWVq3
         LF7a9LpUV/y9jPnAZ8RUKOA+S09cEz3zmW79UL6E0mbswla9T75nAJgvCd7iApVs4jiu
         kmDpycyYnzoqJugZ/07R2s8r7+0TjZz34eEnjDR3vRD72MDIWDNEu5inTcYaW70Pq6JA
         XspSAeJv/QqgW5YTLcF6iVLlH0d7tN0D1l3nTuiyxai26JAVRXOBNNTk8pY4bCP+Alr9
         gF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDnanQS/k7nhziVQ460TpZrTEn6qfY1BxJI4zroFyllPN6jkO7NbnpfW9y+1MNH4wgsPUITd0Exhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybD9IFfG+F/1q8bFPBPX/Z7Z4pPXBbIRHskvRnHgqPnZbQI5I+
	Y+PDWlXBqeugGYdPPoHdJV93CvtPsQFKTt4TgHiDdeiAmoGHpNaDUU30DOrfVXeoOZ+XE78f6YB
	o3Q==
X-Google-Smtp-Source: AGHT+IEvNph7CiMpObG1u+jVz8JxqMtO0a8+Wef5S19XtPgcpuEdHq4SZt8ZBvsmjyd64opTzInKcYcJX7E=
X-Received: from pjbsw14.prod.google.com ([2002:a17:90b:2c8e:b0:2fc:11a0:c546])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b48:b0:2fc:9967:acd8
 with SMTP id 98e67ed59e1d1-2fe7e3b327fmr9422757a91.33.1740622751672; Wed, 26
 Feb 2025 18:19:11 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:21 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-6-seanjc@google.com>
Subject: [PATCH v2 05/38] x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

Move the check on having a Secure TSC to the common tsc_early_init() so
that it's obvious that having a Secure TSC is conditional, and to prepare
for adding TDX to the mix (blindly initializing *both* SNP and TDX TSC
logic looks especially weird).

No functional change intended.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
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
index d65e85929d3e..6a011cd1ff94 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1563,7 +1563,8 @@ void __init tsc_early_init(void)
 	if (is_early_uv_system())
 		return;
 
-	snp_secure_tsc_init();
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
+		snp_secure_tsc_init();
 
 	if (!determine_cpu_tsc_frequencies(true))
 		return;
-- 
2.48.1.711.g2feabab25a-goog


