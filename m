Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA4CA4728E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897509.1306273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTb8-0001ZO-TG; Thu, 27 Feb 2025 02:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897509.1306273; Thu, 27 Feb 2025 02:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTb8-0001Uo-Jx; Thu, 27 Feb 2025 02:26:02 +0000
Received: by outflank-mailman (input) for mailman id 897509;
 Thu, 27 Feb 2025 02:26:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zEUk=VS=flex--seanjc.bounces.google.com=3xMu_ZwYKCZ8RD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@srs-se1.protection.inumbo.net>)
 id 1tnTV9-00063X-Rv
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:51 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 519e24e8-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:49 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fe8de1297eso1024013a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:49 -0800 (PST)
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
X-Inumbo-ID: 519e24e8-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622788; x=1741227588; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8l5U+hO6xQEeVCf+kI9O/UrrnIVeF1W04fkwqmR0RAk=;
        b=hBRjHQwroWuQe0D6w5S5WeOvvhd4qUq+NIo/KC+TXKSjwnbJOKEW36HuHBziksEpBN
         NAeNYXcFcg1gtbOrI3J6RsHDlKdLjjZVIAG6Etn42AKUtI7WGngGrqgK2oL7+zPx08oz
         xxidpZBHamUqNM37vQxPfLUTeBCWdofYf/roGa/yu6B+4JYMfQYipF3ZHsTa09izwIHf
         HWJM2ToQKC31sGOCyegpg9ZuAuGNAAle5AlFYW1tFb6mbEDg7j47Cu2WTwP/jHjS+OJu
         XfYKOZ5wdh2TCMpwGP5dpsX99KZ5fN3DQ1b1zENZytuer3XJY3cXtmEJ5887jkjg9Ruo
         HTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622788; x=1741227588;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8l5U+hO6xQEeVCf+kI9O/UrrnIVeF1W04fkwqmR0RAk=;
        b=q5h9h6rwVZc90wj5okuqf5nj7PtTiptKNIZkHIhLCxWjbCrieEgSVRuLteAZaHiYJO
         kA7e1x5yIgnfXtXXiVyVpoSvAtpicZPAPh+L20sL2rn5FX8+ekNeFfF5w6BcBlhWL9gI
         lqAIeLRTs8cixrT1KRm2DwtoLfLrzzqXrQv0NYTDgdcI1iljp1Dt3iWCaBdNZ5mtycza
         hokLC3HpiA/V9OHOLW1ZeyY2NOILQH8e+8CQhbkZHaa4yI8bid/0N3kei8m4cI0Gej9i
         v6VMmvBrq1tZBP0Nw3vy74KujJiVn0SX2Wk+YkqFktwyMf2PxiQKpZAzcIQSIpX8bNs4
         rm+A==
X-Forwarded-Encrypted: i=1; AJvYcCW7csTlozPxSO/6empjNhgha0bsSccOQ+InpZAUFM2TSHJzCEZyfsHgYq0TkvtURZI9rCP1m4gxUb8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFoKMmFOV3oBnDYMnHOG3psvAPB/lqEr17rIn+6leG/Fu7t/Pt
	D86j2tYQ0MfzdK2W8SM1Qe8YQdDiu3yf5JQrzV+UpaianoSqCKuYt3EemmQ4Bw4RapYSZoRmRTb
	6aQ==
X-Google-Smtp-Source: AGHT+IGsGVabM6lqtL4epZ9oGORwajTYA23ku4RspaNu+4NGjN39FOibtOjpJfF6SNul6q4RPaHxkAISArM=
X-Received: from pjbph15.prod.google.com ([2002:a17:90b:3bcf:b0:2ef:d136:17fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3901:b0:2fa:2268:1af4
 with SMTP id 98e67ed59e1d1-2fea1299b06mr2509653a91.7.1740622788182; Wed, 26
 Feb 2025 18:19:48 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:42 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-27-seanjc@google.com>
Subject: [PATCH v2 26/38] x86/kvmclock: WARN if wall clock is read while
 kvmclock is suspended
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

WARN if kvmclock is still suspended when its wallclock is read, i.e. when
the kernel reads its persistent clock.  The wallclock subtly depends on
the BSP's kvmclock being enabled, and returns garbage if kvmclock is
disabled.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 319f8b2d0702..0ce23f862cbd 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -52,6 +52,8 @@ static struct pvclock_vsyscall_time_info *hvclock_mem;
 DEFINE_PER_CPU(struct pvclock_vsyscall_time_info *, hv_clock_per_cpu);
 EXPORT_PER_CPU_SYMBOL_GPL(hv_clock_per_cpu);
 
+static bool kvmclock_suspended;
+
 /*
  * The wallclock is the time of day when we booted. Since then, some time may
  * have elapsed since the hypervisor wrote the data. So we try to account for
@@ -59,6 +61,7 @@ EXPORT_PER_CPU_SYMBOL_GPL(hv_clock_per_cpu);
  */
 static void kvm_get_wallclock(struct timespec64 *now)
 {
+	WARN_ON_ONCE(kvmclock_suspended);
 	wrmsrl(msr_kvm_wall_clock, slow_virt_to_phys(&wall_clock));
 	preempt_disable();
 	pvclock_read_wallclock(&wall_clock, this_cpu_pvti(), now);
@@ -118,6 +121,7 @@ static void kvm_save_sched_clock_state(void)
 	 * to the old address prior to reconfiguring kvmclock would clobber
 	 * random memory.
 	 */
+	kvmclock_suspended = true;
 	kvmclock_disable();
 }
 
@@ -130,16 +134,19 @@ static void kvm_setup_secondary_clock(void)
 
 static void kvm_restore_sched_clock_state(void)
 {
+	kvmclock_suspended = false;
 	kvm_register_clock("primary cpu, sched_clock resume");
 }
 
 static void kvmclock_suspend(struct clocksource *cs)
 {
+	kvmclock_suspended = true;
 	kvmclock_disable();
 }
 
 static void kvmclock_resume(struct clocksource *cs)
 {
+	kvmclock_suspended = false;
 	kvm_register_clock("primary cpu, clocksource resume");
 }
 
-- 
2.48.1.711.g2feabab25a-goog


