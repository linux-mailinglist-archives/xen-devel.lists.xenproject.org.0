Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E12BA47284
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897459.1306172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaq-0005xZ-5h; Thu, 27 Feb 2025 02:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897459.1306172; Thu, 27 Feb 2025 02:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaq-0005uf-0z; Thu, 27 Feb 2025 02:25:44 +0000
Received: by outflank-mailman (input) for mailman id 897459;
 Thu, 27 Feb 2025 02:25:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1h6=VS=flex--seanjc.bounces.google.com=318u_ZwYKCbIkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@srs-se1.protection.inumbo.net>)
 id 1tnTVS-00063X-GW
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:20:10 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d2b23a0-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:20:09 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc1cb0c2cbso1527740a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:20:09 -0800 (PST)
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
X-Inumbo-ID: 5d2b23a0-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622807; x=1741227607; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KI0queLIxZnghHgRHs7xWlDt+M3CNsR2JqWjVaFF+mE=;
        b=uVuGAREo7eudcx3WRAiYRQAv2yvnGG+/676mWDEB8T3RRIQQ697WvO8vSXRdhYPPNX
         mwkwv00lv9So2O/vvxgNSxQU4RBmW4GQBplf3dUK8EAFqj6trThaTP1tsfQ+uDiHEUDB
         x/U8F/zJIBvXGPMu18yVA4eDKjt5KbrINKJL2o3VObPsi8hQb1MB34V1Q7WplbP7rYYJ
         9Xc7+1TDH8V7eVWUVVu2vxuw1ILSxG6tXIs7BhGw7fu+I8ybmP1pWv84vRTUZGGNgV6w
         Mup2sLVY/Dmk6FoAr/sOWGYKkyG/Se0Q8XpmAtmiFF1vcfdurUQhOOPpUoZdS9XQQ2yR
         krtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622807; x=1741227607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KI0queLIxZnghHgRHs7xWlDt+M3CNsR2JqWjVaFF+mE=;
        b=jpG/IGhqg+nU9lvOEOKn/HFNTg4KQPgi2/VkllZ2QSUWp3cVhvZlaMzmsZTdbjyINT
         zvwPiGcfgapkBsneAXtfCmBmISRF4MXx0MrqZaFFngwXgwr/lorcD/4UArjggOkgBRVu
         Nva92i95Wtmg0b2tsneEmMl/WQf2x48DWKL8XmS9JY1VQc0M5x+kSwvqoGy4Ekp716tH
         EUx54ohTB3psqFQR+0SWgdV84Q/7vIGIIUe+yH7H0TdkZCxx5fdZVwKOZT1l+n6zqwGH
         Mf5PYe6LoMkWd+cYakRGxtBTt+G/M9Serfb0CTbCDjcnKgitlb9fKpdwNiPpAf6Om/Mv
         5aYw==
X-Forwarded-Encrypted: i=1; AJvYcCUWCBm31Vem7+U+W5RCCpkifoyVh/iuzSDKxtHlHUF2PkHjumNYiY92avc22LFG00Ls+FJbru+1NNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWVo0JLGOoMqqKrIlVpivsJsern6fhAPFukeF93JRVo63r7Yn2
	8meH5O7Fg5qCjSOYHoLf6xhLOwx8Bil5NZPMqp+rGyIH1FZkWAWzv6vqy5SlXYFa6EN3eytkyv1
	jCA==
X-Google-Smtp-Source: AGHT+IFuRPRb2/rR+n2YIE9T1JgT09dE9pwcHYDYXuVdPUREy4VCpJNwziBTuQzC841m2IS5b8M/SH3vvo0=
X-Received: from pjbsf13.prod.google.com ([2002:a17:90b:51cd:b0:2fc:e37d:85dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d50:b0:2ee:9b2c:3253
 with SMTP id 98e67ed59e1d1-2fe692c6c47mr14798005a91.30.1740622807422; Wed, 26
 Feb 2025 18:20:07 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:53 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-38-seanjc@google.com>
Subject: [PATCH v2 37/38] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
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

Prefer the TSC over kvmclock for sched_clock if the TSC is constant,
nonstop, and not marked unstable via command line.  I.e. use the same
criteria as tweaking the clocksource rating so that TSC is preferred over
kvmclock.  Per the below comment from native_sched_clock(), sched_clock
is more tolerant of slop than clocksource; using TSC for clocksource but
not sched_clock makes little to no sense, especially now that KVM CoCo
guests with a trusted TSC use TSC, not kvmclock.

        /*
         * Fall back to jiffies if there's no TSC available:
         * ( But note that we still use it if the TSC is marked
         *   unstable. We do this because unlike Time Of Day,
         *   the scheduler clock tolerates small errors and it's
         *   very important for it to be as fast as the platform
         *   can achieve it. )
         */

The only advantage of using kvmclock is that doing so allows for early
and common detection of PVCLOCK_GUEST_STOPPED, but that code has been
broken for nearly two years with nary a complaint, i.e. it can't be
_that_ valuable.  And as above, certain types of KVM guests are losing
the functionality regardless, i.e. acknowledging PVCLOCK_GUEST_STOPPED
needs to be decoupled from sched_clock() no matter what.

Link: https://lore.kernel.org/all/Z4hDK27OV7wK572A@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 80d9c86e0671..280bb964f30a 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -431,22 +431,22 @@ void __init kvmclock_init(void)
 	}
 
 	/*
-	 * X86_FEATURE_NONSTOP_TSC is TSC runs at constant rate
-	 * with P/T states and does not stop in deep C-states.
-	 *
-	 * Invariant TSC exposed by host means kvmclock is not necessary:
-	 * can use TSC as clocksource.
-	 *
+	 * If the TSC counts at a constant frequency across P/T states, counts
+	 * in deep C-states, and the TSC hasn't been marked unstable, prefer
+	 * the TSC over kvmclock for sched_clock and drop kvmclock's rating so
+	 * that TSC is chosen as the clocksource.  Note, the TSC unstable check
+	 * exists purely to honor the TSC being marked unstable via command
+	 * line, any runtime detection of an unstable will happen after this.
 	 */
 	if (boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
 	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
 	    !check_tsc_unstable()) {
 		kvm_clock.rating = 299;
 		tsc_properties = TSC_FREQ_KNOWN_AND_RELIABLE;
+	} else {
+		kvm_sched_clock_init(stable);
 	}
 
-	kvm_sched_clock_init(stable);
-
 	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
 					  tsc_properties);
 
-- 
2.48.1.711.g2feabab25a-goog


