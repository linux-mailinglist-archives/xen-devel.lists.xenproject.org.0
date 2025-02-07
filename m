Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECF1A2CA17
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 18:23:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883877.1293722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgS4f-0004GB-Pn; Fri, 07 Feb 2025 17:23:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883877.1293722; Fri, 07 Feb 2025 17:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgS4f-0004EF-NJ; Fri, 07 Feb 2025 17:23:29 +0000
Received: by outflank-mailman (input) for mailman id 883877;
 Fri, 07 Feb 2025 17:23:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=opty=U6=flex--seanjc.bounces.google.com=3jUGmZwYKCewgSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@srs-se1.protection.inumbo.net>)
 id 1tgS4e-0004E7-I3
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 17:23:28 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d972ffb-e578-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 18:23:27 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fa1a3c0f1bso2926479a91.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 09:23:27 -0800 (PST)
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
X-Inumbo-ID: 3d972ffb-e578-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738949006; x=1739553806; darn=lists.xenproject.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOcxbBJpr4MsHRRcCFUSvs0+uPDtrFbSKcqYFX6+hYs=;
        b=SzNSmHTty0na3p0xpwfaq9JFJXXX2jBQN1tu4yjiXZAV81fLv7GTkQXmTMWC7YaX47
         kKKkDUAkIyN8AwsAB5jmp8U+Zdq6dqwk1AF5LU/0AJOI5aFOAOL2oMggm2odifRDwKjZ
         vrSl9QPG9nnSsh+7a/5XFph5sGPAMnqU4KUJnTun5RYgSSPpFMobqt8gMoxgYKuQs0Ml
         heCcFBevClztMLjv2aD0nBFu2+pzq4WLIQRIOYd0udm0gH9FbT5cAPtP+jHjPfcFhbXO
         uz3TD55dqAEduksIQI+vsqe4YME7EutTfvKZhII5TDm6QilLGW/Ryb8xnU5fKvN1rgyg
         DYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949006; x=1739553806;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOcxbBJpr4MsHRRcCFUSvs0+uPDtrFbSKcqYFX6+hYs=;
        b=TvUiOUB0aHdqX68bzpjD0YjABqgWx+68+BweY+VgZipa9Jfhg+kkDk19RTxPQX3ZzM
         yayNEm8PXL9opRayLdU4iTKowKQUCJaaDQhIoMULkCT730bfuZepC10OxolXa6/6v7Wt
         5fznNMFajjdagERC6mRWTRQvJ1XVS3Mjtjb5MBvbs0Gdu66R29tJ4d7MTMvPnorSl7Y8
         i7SQQ/IxA3CO/2kr+fOCzsoor1+QLDVkpDkhToLowqnXbxbWrOE2Rp4Dr7Kq7B1BTJMy
         Lbnc3H8/30bm8cKSv+8OCGqI0fCCnOHhem5v8lHTfHqLLAj0G0Ege+E/uBxen0/8I3AU
         onyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9aTlLBUf3lFA9obur5zc7y+1cnyc4xl3kkY/QLnxoItxRe+ZdELjz+MODi1p1VtwL7pH4WsKI1Q0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQ3tanTU9mdLIiM+M4k5W4pjFYpVYQj9wZNqxfHFQlLaJmfqOb
	jOpo3eBIIADHyMm8HJugKUHtMpajlQr+LQjgA/ypwSSHv0L7bPkH3wq7C5qojCcV/rFeDqSTY2U
	l9g==
X-Google-Smtp-Source: AGHT+IHtKk+I6CjiXseOd50XgDWMmjujWmhaISGeVrM7QdPNRD38ZmcvZcY1czgAsTeMYVLsyWS8xRRgOkA=
X-Received: from pjbsv3.prod.google.com ([2002:a17:90b:5383:b0:2da:5868:311c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2685:b0:2f5:5bc6:a78d
 with SMTP id 98e67ed59e1d1-2f9ff78641amr13455568a91.3.1738949005804; Fri, 07
 Feb 2025 09:23:25 -0800 (PST)
Date: Fri, 7 Feb 2025 09:23:24 -0800
In-Reply-To: <20250201021718.699411-17-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-17-seanjc@google.com>
Message-ID: <Z6ZBjNdoULymGgxz@google.com>
Subject: Re: [PATCH 16/16] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

Dropping a few people/lists whose emails are bouncing.

On Fri, Jan 31, 2025, Sean Christopherson wrote:
> @@ -369,6 +369,11 @@ void __init kvmclock_init(void)
>  #ifdef CONFIG_X86_LOCAL_APIC
>  	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
>  #endif
> +	/*
> +	 * Save/restore "sched" clock state even if kvmclock isn't being used
> +	 * for sched_clock, as kvmclock is still used for wallclock and relies
> +	 * on these hooks to re-enable kvmclock after suspend+resume.

This is wrong, wallclock is a different MSR entirely.

> +	 */
>  	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
>  	x86_platform.restore_sched_clock_state = kvm_restore_sched_clock_state;

And usurping sched_clock save/restore is *really* wrong if kvmclock isn't being
used as sched_clock, because when TSC is reset on suspend/hiberation, not doing
tsc_{save,restore}_sched_clock_state() results in time going haywire.

Subtly, that issue goes all the way back to patch "x86/paravirt: Don't use a PV
sched_clock in CoCo guests with trusted TSC" because pulling the rug out from
under kvmclock leads to the same problem.

The whole PV sched_clock scheme is a disaster.

Hyper-V overrides the save/restore callbacks, but _also_ runs the old TSC callbacks,
because Hyper-V doesn't ensure that it's actually using the Hyper-V clock for
sched_clock.  And the code is all kinds of funky, because it tries to keep the
x86 code isolated from the generic HV clock code, but (a) there's already x86 PV
specific code in drivers/clocksource/hyperv_timer.c, and (b) splitting the code
means that Hyper-V overides the sched_clock save/restore hooks even when PARAVIRT=n,
i.e. when HV clock can't possibly be used as sched_clock.

VMware appears to be buggy and doesn't do have offset adjustments, and also lets
the TSC callbacks run.

I can't tell if Xen is broken, or if it's the sanest of the bunch.  Xen does
save/restore things a la kvmclock, but only in the Xen PV suspend path.  So if
the "normal" suspend/hibernate paths are unreachable, Xen is sane.  If not, Xen
is quite broken.

To make matters worse, kvmclock is a mess and has existing bugs.  The BSP's clock
is disabled during syscore_suspend() (via kvm_suspend()), but only re-enabled in
the sched_clock callback.  So if suspend is aborted due to a late wakeup, the BSP
will run without its clock enabled, which "works" only because KVM-the-hypervisor
is kind enough to not clobber the shared memory when the clock is disabled.  But
over time, I would expect time on the BSP to drift from APs.

And then there's this crud:

  #ifdef CONFIG_X86_LOCAL_APIC
	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
  #endif

which (a) should be guarded by CONFIG_SMP, not X86_LOCAL_APIC, and (b) is only
actually needed when kvmclock is sched_clock, because timekeeping doesn't actually
need to start that early.  But of course kvmclock craptastic handling of suspend
and resume makes untangling that more difficult than it needs to be.

The icing on the cake is that after cleaning up all the hacks, and having
kvmclock hook clocksource.suspend/resume like it should, suspend/resume under
kvmclock corrupts wall clock time because timekeeping_resume() reads the persistent
clock before resuming clocksource clocks, and the stupid kvmclock wall clock subtly
consumes the clocksource/system clock.  *sigh*

I have yet more patches to clean all of this up.  The series is rather unwieldly,
as it's now sitting at 38 patches (ugh), but I don't see a way to chunk it up in
a meaningful way, because everything is so intertwined.  :-/

