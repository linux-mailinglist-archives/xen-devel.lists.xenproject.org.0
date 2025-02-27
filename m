Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 363BCA47214
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897383.1306133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUk-0000du-Uh; Thu, 27 Feb 2025 02:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897383.1306133; Thu, 27 Feb 2025 02:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUk-0000bB-ED; Thu, 27 Feb 2025 02:19:26 +0000
Received: by outflank-mailman (input) for mailman id 897383;
 Thu, 27 Feb 2025 02:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2l1a=VS=flex--seanjc.bounces.google.com=3qsu_ZwYKCYU1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@srs-se1.protection.inumbo.net>)
 id 1tnTUi-0005qU-GS
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:24 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 422f8eb7-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:23 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fce2954a10so1535179a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:23 -0800 (PST)
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
X-Inumbo-ID: 422f8eb7-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622762; x=1741227562; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yPGNLLFa/vXB2a0UM8EIYJpWd3IhBx8wcQJSj3RCAHc=;
        b=B/dey7IAOjVMKUiMDXw/wfJVZDWrZfZQUbhf/yuGxaTxUrlK9I56kfgXiWXt47VMGV
         ZAvKpaAQZOcABMA91ame9QQ6OJJA/XuzZjsbCI1bB2ABAzFYQaPAi7sjGvQ5mr9tIHQ6
         5+5Y1LD3ayWjKF6nrpUMV3iPn75qh3bcDUGP4i0dSQtD6/IyTrZ8HGOaLVcU5oDMA8Z/
         naJhyQEbHi/7m2WyEW6Hxx5Mro0EavAlcE97zYmuus5M9NJkHC0kdgw0gy+spkW1+cPv
         FA1VeI/WGMtt4Lnx5hQEFMhiCtxv6wNhZpX2P+bxgv7Vs5hddFXfti5Pr081zp1114pZ
         Zm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622762; x=1741227562;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPGNLLFa/vXB2a0UM8EIYJpWd3IhBx8wcQJSj3RCAHc=;
        b=AM/+8yvv1KMX+81tY5t8KeroiRBCr67YnyyrPL/pkR09NY4T9EIZh1uZLXuyqvf9JJ
         kXjxEpcKC+XWODsAaaswI+3Zdm8Etuk2XIfgmSGXi5qlHMLWohM2MLaisdC8upvmuus9
         mIBTeUKnJ//nXjlfHYom2L5lXITIb8cFo/Py+lE2zQSlYKx01CHhRTyuPgouxsOcOkWX
         vTxQb3sEOHpB+RoUpGzgYtzGHyJY206V906rIXE6qCzOfgJnBlN5ziC/rkptkVyIsfUa
         7qONIBsYh2YaH6hrbJF+TsUpULzGiHJHwZ2DtZG1xbZewsIsmfdr0JKY9qwBqyWLpRRc
         BbWg==
X-Forwarded-Encrypted: i=1; AJvYcCXC+piLYOW4u2C6h9cPGnT998aSpfqIpBtUymA/ewptwtPJbu3t05GROrveDFLbwbzaQfhjhtX0l88=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdUOUq00pNyBGf2FHSsrSgpT6RmYebG9DHRa34T0OsdcRJeR7t
	bXRCQUnUyfYgv3KG1Y0B73v4QgpSyvMjGZ42FqZH+Dgb9dQiKPUbbFkRwVXnhKTSU4eIbHKmnoR
	3LQ==
X-Google-Smtp-Source: AGHT+IGTG4bhtwk6xF9NkwSwRr4MZ0JMu1OW/uXbFyNTNSUBj4feLwfxPugt+I59qi4711mZsSVJuOvx1D0=
X-Received: from pjbqn3.prod.google.com ([2002:a17:90b:3d43:b0:2ea:5469:76c2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fa14:b0:2fe:84d6:cdfc
 with SMTP id 98e67ed59e1d1-2fe84d6cf88mr6952534a91.35.1740622762299; Wed, 26
 Feb 2025 18:19:22 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:27 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-12-seanjc@google.com>
Subject: [PATCH v2 11/38] x86/kvmclock: Setup kvmclock for secondary CPUs iff CONFIG_SMP=y
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

Gate kvmclock's secondary CPU code on CONFIG_SMP, not CONFIG_X86_LOCAL_APIC.
Originally, kvmclock piggybacked PV APIC ops to setup secondary CPUs.
When that wart was fixed by commit df156f90a0f9 ("x86: Introduce
x86_cpuinit.early_percpu_clock_init hook"), the dependency on a local APIC
got carried forward unnecessarily.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index b898b95a7d50..80d1a06609c8 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -186,7 +186,7 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 static void kvm_setup_secondary_clock(void)
 {
 	kvm_register_clock("secondary cpu clock");
@@ -324,7 +324,7 @@ void __init kvmclock_init(void)
 
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
-#ifdef CONFIG_X86_LOCAL_APIC
+#ifdef CONFIG_SMP
 	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
 #endif
 	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
-- 
2.48.1.711.g2feabab25a-goog


