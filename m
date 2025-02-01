Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1FA24684
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880064.1290299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34t-0005ED-PU; Sat, 01 Feb 2025 02:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880064.1290299; Sat, 01 Feb 2025 02:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34t-0005AA-IF; Sat, 01 Feb 2025 02:17:47 +0000
Received: by outflank-mailman (input) for mailman id 880064;
 Sat, 01 Feb 2025 02:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9Oe=UY=flex--seanjc.bounces.google.com=3R4SdZwYKCQo2okxtmqyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@srs-se1.protection.inumbo.net>)
 id 1te34s-0002if-0Y
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:46 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b846fcd3-e042-11ef-99a4-01e77a169b0f;
 Sat, 01 Feb 2025 03:17:44 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ef79403c5eso7332543a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:44 -0800 (PST)
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
X-Inumbo-ID: b846fcd3-e042-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376263; x=1738981063; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=T4DEhCWG0SuSvz0a+mPR7euxpU0fSN+tQ/CkCS9MqCY=;
        b=TBikqo4t1PDUKXRaeOn2PDwZkvuQ8UCNgRvbckKvXi1E0s6Vk4Cv3eeJ64WE22yPzS
         nb3gOQ+a9FqGelFhiteMS6mZBI6pO9lUsnuYgFdYwXxo7xvshPOLV6ls1jFKG0vZYKBl
         ADo+BnhgtHj71WZfsO4F9tu+ssMkSe1od/+cujeButP48l/xjSDVmt0FbnQGznmJPWVE
         UObux/HuRcm+w4a36EwreoNMzSHYYg/+YU3w+FMZMcE6iR+oAd8Pf7gN9dD8K15QKBhV
         /kLoI0G2qV3m5KfEykbhBwng0ADnZcAjfQmxf6nMAMvrlXg+O6pJ5sHTBRbMb0V2YTFa
         bGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376263; x=1738981063;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4DEhCWG0SuSvz0a+mPR7euxpU0fSN+tQ/CkCS9MqCY=;
        b=n5DZlF15iDEseujMiyQz2tAPrAZ1ZyAT8j71baSHAFXqBrR+w98KG3+yx9JXq/6zEk
         ghFyotY0vLkH3NCmYSyihWEPZ09sAZWgjN3c6FbArFnONYneSmqMd9BNjjRao6vDGbg/
         poxdve0fg7EEH9lLUMdrVGSwdN67oU7jK24NuMmt/1ZBTfZr3T+27Ei9krLRbt0AF5lG
         kIbWt/s7+a0PDxz6amdE3nC4Cc1Cu8KLEmydmxQN5HsHIP3QIVI9lydtn1hQJyNaCWyt
         ekcDnA+bITGfVRuHgIHFJmrPDRpKNq6L939+CjrGZnZGLdKarQbW3oMvssyUGzDd/k+N
         awPA==
X-Forwarded-Encrypted: i=1; AJvYcCXpinDL7FN2lab9r2lmWYP+W7B/CFPEcABpSXa6AsJ031VsFQ4JmobkTOJFul2Eop6Xi2MzBu2JgGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvtUVBCBlRidM5XMQgGqb97bpdyWkHlEMlIezVmxRGei1KOptJ
	iXwfcZKPmAcudGGdCn3ixWnuWGSbOVvuztU7bjJHAizmmMjKdYrl8riMtLU4wamgN6bt8PoRHwq
	9MQ==
X-Google-Smtp-Source: AGHT+IHof1w34LjQ30XVM2gwsfD2n69eJy7Rgvm5USApfq7itvhXgigdwO4D30qo87G/8bS8xHYNlWrIUTM=
X-Received: from pjd6.prod.google.com ([2002:a17:90b:54c6:b0:2e2:9f67:1ca3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51c1:b0:2ea:7cd5:4ad6
 with SMTP id 98e67ed59e1d1-2f83ac86a44mr17727640a91.32.1738376263046; Fri, 31
 Jan 2025 18:17:43 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:11 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-10-seanjc@google.com>
Subject: [PATCH 09/16] x86/tsc: Rejects attempts to override TSC calibration
 with lesser routine
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

When registering a TSC frequency calibration routine, sanity check that
the incoming routine is as robust as the outgoing routine, and reject the
incoming routine if the sanity check fails.

Because native calibration routines only mark the TSC frequency as known
and reliable when they actually run, the effective progression of
capabilities is: None (native) => Known and maybe Reliable (PV) =>
Known and Reliable (CoCo).  Violating that progression for a PV override
is relatively benign, but messing up the progression when CoCo is
involved is more problematic, as it likely means a trusted source of
information (hardware/firmware) is being discarded in favor of a less
trusted source (hypervisor).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 47776f450720..d7096323c2c4 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1260,8 +1260,13 @@ void tsc_register_calibration_routines(unsigned long (*calibrate_tsc)(void),
 
 	if (properties & TSC_FREQUENCY_KNOWN)
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ)))
+		return;
+
 	if (properties & TSC_RELIABLE)
 		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_RELIABLE)))
+		return;
 
 	x86_platform.calibrate_tsc = calibrate_tsc;
 	if (calibrate_cpu)
-- 
2.48.1.362.g079036d154-goog


