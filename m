Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2E9A4721D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:19:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897369.1306063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUX-0006pi-My; Thu, 27 Feb 2025 02:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897369.1306063; Thu, 27 Feb 2025 02:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUX-0006l2-Hg; Thu, 27 Feb 2025 02:19:13 +0000
Received: by outflank-mailman (input) for mailman id 897369;
 Thu, 27 Feb 2025 02:19:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jlms=VS=flex--seanjc.bounces.google.com=3ncu_ZwYKCXgoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@srs-se1.protection.inumbo.net>)
 id 1tnTUV-0005qU-Ph
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:11 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ac0d216-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:11 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fe8c5dbdb0so1061021a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:11 -0800 (PST)
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
X-Inumbo-ID: 3ac0d216-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622750; x=1741227550; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HbJ/1jLoPDWkVBe7cDWaMugTDenciqtu5nrTgQ9Zvm0=;
        b=I7QL8ZPwWO1oqFZxwYCoc80EI0hRHQqQbAlsZ79RHZP5h7pHY2rgFVbPQbgWEr5n2r
         VBHeP2JmEdCC1wP2RlLyeUNUmG2ZWz0kIEQF0Jrozm3YRPMN6ugck3l1JAbT5Nrk65j5
         lbMkvC+eBphKxw4kW74TJZVinvGV12zcXK1ZlmCaXZ2sNP5EKPkmVHY0irhQaZ6+O1Pi
         bdxYUekTWNQYZuS6H+em1PmOYf3+G99dxPinYNYerXNRCBsCsZA8glWKkA/wF4hI5Q5M
         EH9cutti+f40rGyoABf9BbIeB8uZdOExG6JmI6C+09ubVTb2MobHlPKVf1N+4I9ka87w
         FeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622750; x=1741227550;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HbJ/1jLoPDWkVBe7cDWaMugTDenciqtu5nrTgQ9Zvm0=;
        b=shn+Fk10sgtbEI6KnY45MQOD3np4lq7E6vwlHRqEonToNQpZiaWzBn39U08aMLbZ+P
         QkbCa6QvAE0Mfld7TPqmv9mvfUsiH3B0fHlSY0tIVqarZ0L7QLqWj+USsHOXHkrHqXng
         H2AIyMM1oJFfRkbRLCPOVEjHUmQRtTj+IUxK8+sE1GVm/hltjHjKsI1AyBDCtZzfwT4e
         /g91B/H9wMR8ck33bpJ+z1+3q2gwTIwfnSSHQerzggKVFMhRRapMYQW4soEmh+8TyC3p
         uT5wL/02FtUmB7fOmf+YUOQD5Cu3JxPPSgdWm6nsuz0E5TYaYEkxTcgttSu7MHgZUTCd
         5tAw==
X-Forwarded-Encrypted: i=1; AJvYcCWEQ5lMELySa5Ls5j4RSozENyYOmOpiOKZNk9OLrgq0RjgRgArkEQv0xxpKJeGWu5hfgaiALDzWP+M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztioBU/Tw3TsPVdvvVBwT9AVEMPdNobpkn6gKou74gh9whY0SU
	XGQKDpr3/R+U/oRCnnvGDlrk2wGwMnb0MRxSJhVUhduekj3zftVpXSqXui9sgpv2eKHVECE+1lp
	G2w==
X-Google-Smtp-Source: AGHT+IFmgEsUJJ1z3bRk5Nf8mtm9mdRWiQdO+4qbvCwBd/hyjI3jP5eNnlt+3d6bfd4x/QDsZrTqSfxiFQY=
X-Received: from pjbsw3.prod.google.com ([2002:a17:90b:2c83:b0:2fa:15aa:4d2b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:56cc:b0:2f1:2fa5:1924
 with SMTP id 98e67ed59e1d1-2fe7e39f2afmr7133368a91.26.1740622749803; Wed, 26
 Feb 2025 18:19:09 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:20 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-5-seanjc@google.com>
Subject: [PATCH v2 04/38] x86/sev: Mark TSC as reliable when configuring
 Secure TSC
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

Move the code to mark the TSC as reliable from sme_early_init() to
snp_secure_tsc_init().  The only reader of TSC_RELIABLE is the aptly
named check_system_tsc_reliable(), which runs in tsc_init(), i.e.
after snp_secure_tsc_init().

This will allow consolidating the handling of TSC_KNOWN_FREQ and
TSC_RELIABLE when overriding the TSC calibration routine.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c      | 2 ++
 arch/x86/mm/mem_encrypt_amd.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 684cef70edc1..e6ce4ca72465 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -3288,6 +3288,8 @@ void __init snp_secure_tsc_init(void)
 		return;
 
 	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+
 	rdmsrl(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz);
 	snp_tsc_freq_khz = (unsigned long)(tsc_freq_mhz * 1000);
 
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index b56c5c073003..774f9677458f 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -541,9 +541,6 @@ void __init sme_early_init(void)
 	 * kernel mapped.
 	 */
 	snp_update_svsm_ca();
-
-	if (sev_status & MSR_AMD64_SNP_SECURE_TSC)
-		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
 }
 
 void __init mem_encrypt_free_decrypted_mem(void)
-- 
2.48.1.711.g2feabab25a-goog


