Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7EA2F32E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 17:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884897.1294641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thWXj-0003ZO-WE; Mon, 10 Feb 2025 16:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884897.1294641; Mon, 10 Feb 2025 16:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thWXj-0003Xw-Ss; Mon, 10 Feb 2025 16:21:55 +0000
Received: by outflank-mailman (input) for mailman id 884897;
 Mon, 10 Feb 2025 16:21:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dTrx=VB=flex--seanjc.bounces.google.com=3nyeqZwYKCdoOA6JF8CKKCHA.8KITAJ-9ARAHHEOPO.TAJLNKFA8P.KNC@srs-se1.protection.inumbo.net>)
 id 1thWXh-0003Xo-Tn
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 16:21:53 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22af912d-e7cb-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 17:21:52 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f9da17946fso14855382a91.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2025 08:21:52 -0800 (PST)
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
X-Inumbo-ID: 22af912d-e7cb-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739204511; x=1739809311; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gjevNOj/bkd1TGaPwATIjylcH4KclWeK6tRAdAb+PbI=;
        b=Z65hTrYfb1AephQ3+2QfdOLYjKjckvmWLHdJLaiZILN2wfDhy2nJtMMqLDQf5pZZQ/
         RbRuwosmomm4xWNrfRCnfrRagbzZLiPiS7w4beDgKbbO3PI2vadwufClI5Qc4N+Vt9c8
         v9T40EC0BRfaD4xC8abTDYUPkrBk21lpjK+Sdz4iItnrX5D88a5EojJo6e0C4yAw8lQ5
         h8iaC2C4phUf3t6f114ojcOXIPFotn4BHz1bjkAEFpfrGE7J1fdq2TP2tYScwMZcBEei
         6WLEwvWInHh2UggqARxpu4DU6LpPOatK4t6fBQBayDCWBmNYd4HsaXhtV8Ud1hXOKM05
         rChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204511; x=1739809311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjevNOj/bkd1TGaPwATIjylcH4KclWeK6tRAdAb+PbI=;
        b=WOXz4vpH5vO/hIIg/EctzkHVIahQKsPwbEHYqwFmYVgMj6q1YrFDFLuDWaCYQKtjaH
         iCE0SgQTKhi3OYbpfQwYntbj8Gs5lsf4DwUcN1bJfbG2mlreeXa6mofTI7WtHncaIqP3
         srh9ItlVNrJp+rCy4kX/YEMw9ZXa1sfI9gBQjHKoRRbs9e1nLa8TRrSei32Gyp0TscbB
         E6jZI13gxkJIxPK+AewFByFZLoxfEuYKgM22p6wtozfiL3ob+Vkx6v2LiT5rm8cpN8Dh
         tcpeTIQpiqtGQIn1gr3F+h9b28xZmKdxpE8lsefOSwm24CCdCUQph1KyJZApFamudTAN
         aHGw==
X-Forwarded-Encrypted: i=1; AJvYcCUmNPyq/j68D6XNQ4HqGHcd/w7978ODew/W42jHdjExsjQSrYstrFNqkiu73+/c/PYFJePb3C8CQPc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzNtw7ZbHI8mf3DLUoJ1E2fc6xO5sgOyaJgzTXbxgHAzl00ogfR
	R6PyLIHHFYDz6c3EvTBsnV8Q2PySsK4it1Tm2hKWuuaYVAITgksG0u7nG2BIYZZg2BQS8XBtlWo
	AkA==
X-Google-Smtp-Source: AGHT+IHvA6NXtBXVEFbtZeSWagFJPoake9uFGdSEz34GpfES659xPG5GoxHcGoeeTGEESr/Dcqf76t3tOTs=
X-Received: from pjbsp15.prod.google.com ([2002:a17:90b:52cf:b0:2ee:53fe:d0fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cd1:b0:2fa:b84:b304
 with SMTP id 98e67ed59e1d1-2fa243db921mr18907344a91.22.1739204511253; Mon, 10
 Feb 2025 08:21:51 -0800 (PST)
Date: Mon, 10 Feb 2025 08:21:49 -0800
In-Reply-To: <SN6PR02MB4157A85EC0B1B2D45CB611FAD4F02@SN6PR02MB4157.namprd02.prod.outlook.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-17-seanjc@google.com>
 <Z6ZBjNdoULymGgxz@google.com> <SN6PR02MB4157A85EC0B1B2D45CB611FAD4F02@SN6PR02MB4157.namprd02.prod.outlook.com>
Message-ID: <Z6onnUthSBUVAklf@google.com>
Subject: Re: [PATCH 16/16] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
From: Sean Christopherson <seanjc@google.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Nikunj A Dadhania <nikunj@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Sat, Feb 08, 2025, Michael Kelley wrote:
> From: Sean Christopherson <seanjc@google.com> Sent: Friday, February 7, 2025 9:23 AM
> > 
> > Dropping a few people/lists whose emails are bouncing.
> > 
> > On Fri, Jan 31, 2025, Sean Christopherson wrote:
> > > @@ -369,6 +369,11 @@ void __init kvmclock_init(void)
> > >  #ifdef CONFIG_X86_LOCAL_APIC
> > >  	x86_cpuinit.early_percpu_clock_init = kvm_setup_secondary_clock;
> > >  #endif
> > > +	/*
> > > +	 * Save/restore "sched" clock state even if kvmclock isn't being used
> > > +	 * for sched_clock, as kvmclock is still used for wallclock and relies
> > > +	 * on these hooks to re-enable kvmclock after suspend+resume.
> > 
> > This is wrong, wallclock is a different MSR entirely.
> > 
> > > +	 */
> > >  	x86_platform.save_sched_clock_state = kvm_save_sched_clock_state;
> > >  	x86_platform.restore_sched_clock_state = kvm_restore_sched_clock_state;
> > 
> > And usurping sched_clock save/restore is *really* wrong if kvmclock isn't being
> > used as sched_clock, because when TSC is reset on suspend/hiberation, not doing
> > tsc_{save,restore}_sched_clock_state() results in time going haywire.
> > 
> > Subtly, that issue goes all the way back to patch "x86/paravirt: Don't use a PV
> > sched_clock in CoCo guests with trusted TSC" because pulling the rug out from
> > under kvmclock leads to the same problem.
> > 
> > The whole PV sched_clock scheme is a disaster.
> > 
> > Hyper-V overrides the save/restore callbacks, but _also_ runs the old TSC callbacks,
> > because Hyper-V doesn't ensure that it's actually using the Hyper-V clock for
> > sched_clock.  And the code is all kinds of funky, because it tries to keep the
> > x86 code isolated from the generic HV clock code, but (a) there's already x86 PV
> > specific code in drivers/clocksource/hyperv_timer.c, and (b) splitting the code
> > means that Hyper-V overides the sched_clock save/restore hooks even when
> > PARAVIRT=n, i.e. when HV clock can't possibly be used as sched_clock.
> 
> Regarding (a), the one occurrence of x86 PV-specific code hyperv_timer.c is
> the call to paravirt_set_sched_clock(), and it's under an #ifdef sequence so that
> it's not built if targeting some other architecture. Or do you see something else
> that is x86-specific?
> 
> Regarding (b), in drivers/hv/Kconfig, CONFIG_HYPERV always selects PARAVIRT.
> So the #else clause (where PARAVIRT=n) in that #ifdef sequence could arguably
> have a BUILD_BUG() added. If I recall correctly, other Hyper-V stuff breaks if
> PARAVIRT is forced to "n". So I don't think there's a current problem with the
> sched_clock save/restore hooks. i

Oh, there are no build issues, and all of the x86 bits are nicely cordoned off.
My complaint is essentially that they're _too_ isolated; putting the sched_clock
save/restore setup in arch/x86/kernel/cpu/mshyperv.c is well-intentioned, but IMO
it does more harm than good because the split makes it difficult to connect the
dots to hv_setup_sched_clock() in drivers/clocksource/hyperv_timer.c.

> But I would be good with some restructuring so that setting the sched clock
> save/restore hooks is more closely tied to the sched clock choice,

Yeah, this is the intent of my ranting.  After the dust settles, the code can
look like this.

---
#ifdef CONFIG_GENERIC_SCHED_CLOCK
static __always_inline void hv_setup_sched_clock(void *sched_clock)
{
	/*
	 * We're on an architecture with generic sched clock (not x86/x64).
	 * The Hyper-V sched clock read function returns nanoseconds, not
	 * the normal 100ns units of the Hyper-V synthetic clock.
	 */
	sched_clock_register(sched_clock, 64, NSEC_PER_SEC);
}
#elif defined CONFIG_PARAVIRT
static u64 hv_ref_counter_at_suspend;
/*
 * Hyper-V clock counter resets during hibernation. Save and restore clock
 * offset during suspend/resume, while also considering the time passed
 * before suspend. This is to make sure that sched_clock using hv tsc page
 * based clocksource, proceeds from where it left off during suspend and
 * it shows correct time for the timestamps of kernel messages after resume.
 */
static void hv_save_sched_clock_state(void)
{
	hv_ref_counter_at_suspend = hv_read_reference_counter();
}

static void hv_restore_sched_clock_state(void)
{
	/*
	 * Adjust the offsets used by hv tsc clocksource to
	 * account for the time spent before hibernation.
	 * adjusted value = reference counter (time) at suspend
	 *                - reference counter (time) now.
	 */
	hv_sched_clock_offset -= (hv_ref_counter_at_suspend - hv_read_reference_counter());
}

static __always_inline void hv_setup_sched_clock(void *sched_clock)
{
	/* We're on x86/x64 *and* using PV ops */
	paravirt_set_sched_clock(sched_clock, hv_save_sched_clock_state,
				 hv_restore_sched_clock_state);
}
#else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
static __always_inline void hv_setup_sched_clock(void *sched_clock) {}
#endif /* CONFIG_GENERIC_SCHED_CLOCK */
---

> as long as the architecture independence of hyperv_timer.c is preserved.

LOL, ah yes, the architecture independence of MSRs and TSC :-D

Teasing aside, the code is firmly x86-only at the moment.  It's selectable only
by x86:

  config HYPERV_TIMER
	def_bool HYPERV && X86
 
and since at least commit e39acc37db34 ("clocksource: hyper-v: Provide noinstr
sched_clock()") there are references to symbols/functions that are provided only
by x86.

I assume arm64 support is a WIP, but keeping the upstream code arch independent
isn't very realistic if the code can't be at least compile-tested.  To help
drive-by contributors like myself, maybe select HYPER_TIMER on arm64 for
COMPILE_TEST=y builds?

  config HYPERV_TIMER
	def_bool HYPERV && (X86 || (COMPILE_TEST && ARM64))

I have no plans to touch code outside of CONFIG_PARAVIRT, i.e. outside of code
that is explicitly x86-only, but something along those lines would help people
like me understand the goal/intent, and in theory would also help y'all maintain
the code by detecting breakage.

