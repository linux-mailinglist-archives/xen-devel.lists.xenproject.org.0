Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592A3A4728F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897516.1306291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbC-0002PB-Vo; Thu, 27 Feb 2025 02:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897516.1306291; Thu, 27 Feb 2025 02:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbC-0002Gt-Q3; Thu, 27 Feb 2025 02:26:06 +0000
Received: by outflank-mailman (input) for mailman id 897516;
 Thu, 27 Feb 2025 02:26:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EBCh=VS=flex--seanjc.bounces.google.com=30su_ZwYKCa0fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@srs-se1.protection.inumbo.net>)
 id 1tnTVN-00063X-6C
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:20:05 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59fa727e-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:20:03 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc45101191so1080596a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:20:03 -0800 (PST)
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
X-Inumbo-ID: 59fa727e-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622802; x=1741227602; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=evC/AJYAKH4bntjSNStZX5d0W0KQw/JlJZazMUftcQU=;
        b=uBuIornD6TSt8bcrWwRHfRoXTQplgjGgDYnnfh/DBHr0KMLKThKoE+UrGe9l4GC4eI
         gvYCQ8oezfU5TE/PTmk9d9th8oWTFDPQFeIDdldcJVCJovXK+hoa729mQwR5Q5M+ALW1
         Jqw/yVzSRMkkJbPg/LJZPXwKJsdZoELc/YD38s16JTBzQuEAhDXEE1vaZ0e2Q3fTUDys
         EevG7oDVCB//+/RfLtRR914M7u4CkW9F6eEGeHUP/HkVyZxSGWgnZpyPx4HCNjZFwuXt
         dKM5MdD76LfE1EkuojbUx2YncnJcqYi1NufZxGBfiPFjxAQ9IxS1+XArMQfiYV0j8sd/
         AEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622802; x=1741227602;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=evC/AJYAKH4bntjSNStZX5d0W0KQw/JlJZazMUftcQU=;
        b=lbuuvmpfuQWNadWzgz2L5NFolNnwB6YefvAmyy2nU8qm8J3CTDCbE/mtfzNziCVyWl
         gBnVJRKqQybaQYWaYmxj+obPNqYICrkH7kh4tGIPZ3MDknz9JpFNhr4VwDfQXCLa5Rg4
         iFn4yQLEYD4cpk6oPpLhXE6gwlAq6iIUblfPw3jDPL0eSrBYBozTYu3A8EO1Ek6+qEwg
         ftpXe6p4MvCwqK2c0z0B0viPP6BjvB+g7XusBugFSoEQ2HmG3M2Szi9nbxfjN05eakue
         ATI6ULSoIP9kDq8Oot2SikV09V1lf5PsoRrnAaRWC6okh1iKMeDvAZD8wEkk3Pt4Pkcb
         emhw==
X-Forwarded-Encrypted: i=1; AJvYcCVSKLxdsJjbGn/dwAJDa8qrAO8O1HbgFX+EBa/DM9mTF+OKUbL131qwR5/VDwalgbQ2wr7cg+BCrvc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpbTOLLxe5OrnYYvyPkALP2tTv9xkiy8zJNbLrRsf9EwGi7lWV
	JfqQW4T4Og3e6GtOh8+Y/ke44/PphXNK5OtPbCkAoPFXD8IO6/o7p8jT41yrMZwyRd0c1+3+gTb
	D2A==
X-Google-Smtp-Source: AGHT+IGv/zpuplWrcklhWH3aZ9H+bWJRwaJtozM+byhaXyymURPHFd4oTcq5U1mZsa54ViZesa4/C8fD/pk=
X-Received: from pjvb12.prod.google.com ([2002:a17:90a:d88c:b0:2ea:aa56:49c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5101:b0:2fe:955d:cdb1
 with SMTP id 98e67ed59e1d1-2fe955dd224mr3596029a91.23.1740622802051; Wed, 26
 Feb 2025 18:20:02 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:50 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-35-seanjc@google.com>
Subject: [PATCH v2 34/38] x86/kvmclock: Get CPU base frequency from CPUID when
 it's available
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

If CPUID.0x16 is present and valid, use the CPU frequency provided by
CPUID instead of assuming that the virtual CPU runs at the same
frequency as TSC and/or kvmclock.  Back before constant TSCs were a
thing, treating the TSC and CPU frequencies as one and the same was
somewhat reasonable, but now it's nonsensical, especially if the
hypervisor explicitly enumerates the CPU frequency.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index b924b19e8f0f..c45b321533e5 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -188,6 +188,20 @@ void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
 	}
 }
 
+static unsigned long kvm_get_cpu_khz(void)
+{
+	unsigned int cpu_khz;
+
+	/*
+	 * Prefer CPUID over kvmclock when possible, as the base CPU frequency
+	 * isn't necessarily the same as the kvmlock "TSC" frequency.
+	 */
+	if (!cpuid_get_cpu_freq(&cpu_khz))
+		return cpu_khz;
+
+	return pvclock_tsc_khz(this_cpu_pvti());
+}
+
 /*
  * If we don't do that, there is the possibility that the guest
  * will calibrate under heavy load - thus, getting a lower lpj -
@@ -418,7 +432,7 @@ void __init kvmclock_init(void)
 
 	kvm_sched_clock_init(stable);
 
-	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz,
+	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
 					  tsc_properties);
 
 	x86_platform.get_wallclock = kvm_get_wallclock;
-- 
2.48.1.711.g2feabab25a-goog


