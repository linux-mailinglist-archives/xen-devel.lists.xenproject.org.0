Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC52BAC9A84
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 12:17:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001975.1382034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLJGP-0007Ka-1g; Sat, 31 May 2025 10:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001975.1382034; Sat, 31 May 2025 10:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLJGO-0007Hg-Tl; Sat, 31 May 2025 10:16:28 +0000
Received: by outflank-mailman (input) for mailman id 1001975;
 Sat, 31 May 2025 10:16:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Itfw=YP=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uLJGN-0007Ha-8U
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 10:16:27 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e4e0b51-3e08-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 12:16:24 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55320ddb9edso3224097e87.1
 for <xen-devel@lists.xenproject.org>; Sat, 31 May 2025 03:16:24 -0700 (PDT)
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
X-Inumbo-ID: 4e4e0b51-3e08-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748686584; x=1749291384; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyKUNC7AK24oaZ+BV2NsptKAVrues0MRs6gF4p/xnLE=;
        b=BZfxCXnx6ZsCnpSeSNQZOj03y3/pQAp7GCISnrRMPq3Pvptk3DWazmvzQYgBf9ti2/
         B/fXq92sQ0eYTh9CMh98KYrj4dcCnyzBH0nqV9PgHBjZuGtWlj2SWKOXalgOKE9BXPSk
         0c63Q8b8eEnWWLyLSyntby4OgdA/uYm9oIV4qV+qehOkKRlCNWjTjMhweRS83LFAeFn3
         kcgvCBE4+pNz9o5Weu457SLac0FxM3MstfEJHD0LVs6QciV16Tk9cJg9qnqFugAoemWF
         DjJFv0TI4OoZ/niJXknGkpT10BLTZ2Y6jHdWfN+bUJKBcPYk/NXiwi3YNehDio0saY0D
         8V8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748686584; x=1749291384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyKUNC7AK24oaZ+BV2NsptKAVrues0MRs6gF4p/xnLE=;
        b=pEv1CqJDYrVTQK9O15Xt7k8sHcz8CLQPurwGFmza3yJmKUjYA5Ws0bR1oBQImkMtOK
         igMUnFqJnXLOBH+gBrDeuzxNiqZlNyqmAQv0p88hT+ObXRYVPAD4vuNlhSlUPqYi3XwA
         O2NnEgcrz4Q/CNmGJN2QJfFqoZ2JYoG9byrlvXfnFlRJwT5FR0mcyLh4e4V8x2PMUbjV
         Qr77vC26GylcL+C7fg7NQD1oU1ZuBscU3sKVLVweIVp0AvMe3PIjxh9T96Faq6sZXNE8
         at/K8heseRMXxbw+igwq11ZRLJ73J1h4kP7xeESUfnPlhj8WWbMHjhxg7iByR+VZZW/l
         OMgg==
X-Gm-Message-State: AOJu0Yx2CVjQSub1xjp5cXUsfFM1KD8yZH/m5QHpXz3KHtXpyQpBMUEJ
	9e+PODmcsR09DUYpXr1y4arzaAc0giReUwBGZMU7zsnmCGccCQcm9VAvLcMZRnwLJ4AXqFftYAV
	JZJLuFP5/VkQlQn52xwz0AELR/8DiSZM=
X-Gm-Gg: ASbGncvpPMHeQnKJtuWsdsZ4fqs/1oZfxokdQ8L3Xo4gmVli0JWpN+ToaL0CeMUBBSX
	xZv4MhvB/yTrRQzBtxsij0cpQxA/9V9dS0gl/FYs3JlQDfNU/ubMXPj9yUkqEd2j8uSX9Y+2KMX
	XPddRB8nv54mPhbc9o4qpcTDNCXCfIL9Rze51+CP0tyw==
X-Google-Smtp-Source: AGHT+IEevdzFZeolsTSfVgKK9KJyEGX7hFTGd+9eNu/Wz0UfbvRU/o9l4OOMV+f1QuRif6scF+fZousHhlepAbJVgKA=
X-Received: by 2002:a05:6512:2215:b0:553:3127:b00 with SMTP id
 2adb3069b0e04-5533b90b7d6mr2666005e87.32.1748686583420; Sat, 31 May 2025
 03:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <2ef15cb605f987eb087c5496d123c47c01cc0ae7.1741164138.git.xakep.amatop@gmail.com>
 <1bcdca51-0f31-421c-81cf-699a1b94fbd6@xen.org>
In-Reply-To: <1bcdca51-0f31-421c-81cf-699a1b94fbd6@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Sat, 31 May 2025 13:16:12 +0300
X-Gm-Features: AX0GCFu8asraicDdTvBG9bNs1w7xSxIyKJDtrCvwfe4noIAXovQahDTFuH1R5Qc
Message-ID: <CAGeoDV97no7mXSKd7auFu5E85wSXAHKWvqGW2=-VEAbkrTyU8Q@mail.gmail.com>
Subject: Re: [PATCH 14/16] xen/arm: Resume memory management on Xen resume
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Mirela Simonovic <mirela.simonovic@aggios.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Saeed Nowshadi <saeed.nowshadi@xilinx.com>, 
	Mykyta Poturai <mykyta_poturai@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, @Julien Grall

On Wed, Mar 12, 2025 at 1:04=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi,
>
> On 05/03/2025 09:11, Mykola Kvach wrote:
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > The MMU needs to be enabled in the resume flow before the context
> > can be restored (we need to be able to access the context data by
> > virtual address in order to restore it). The configuration of system
> > registers prior to branching to the routine that sets up the page
> > tables is copied from xen/arch/arm/arm64/head.S.
> > After the MMU is enabled, the content of TTBR0_EL2 is changed to
> > point to init_ttbr (page tables used at runtime).
> >
> > At boot the init_ttbr variable is updated when a secondary CPU is
> > hotplugged. In the scenario where there is only one physical CPU in
> > the system, the init_ttbr would not be initialized for the use in
> > resume flow. To get the variable initialized in all scenarios in this
> > patch we add that the boot CPU updates init_ttbr after it sets the
> > page tables for runtime.
> >
> > Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> > Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> > Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V3:
> > - updated commit message
> > - instead of using create_page_tables, enable_mmu, and mmu_init_seconda=
ry_cpu,
> >    the existing function enable_secondary_cpu_mm is now used
> > - prepare_secondary_mm (previously init_secondary_pagetables in the pre=
vious
> >    patch series) is now called at the end of start_xen instead of
> >    setup_pagetables. Calling it in the previous location caused a crash
> > - add early printk init during resume
> >
> > Changes in V2:
> > - moved hyp_resume to head.S to place it near the rest of the start cod=
e
> > - simplified the code in hyp_resume by using existing functions such as
> >    check_cpu_mode, cpu_init, create_page_tables, and enable_mmu
> > ---
> >   xen/arch/arm/arm64/head.S | 23 +++++++++++++++++++++++
> >   xen/arch/arm/setup.c      |  8 ++++++++
> >   2 files changed, 31 insertions(+)
> >
> > diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> > index 3522c497c5..fab2812e54 100644
> > --- a/xen/arch/arm/arm64/head.S
> > +++ b/xen/arch/arm/arm64/head.S
> > @@ -564,6 +564,29 @@ END(efi_xen_start)
> >   #ifdef CONFIG_SYSTEM_SUSPEND
> >
> >   FUNC(hyp_resume)
> > +        msr   DAIFSet, 0xf           /* Disable all interrupts */
>
> Surely we should be here with interrupts disabled. No?

You are right, I overlooked this and left the code unchanged from a
previous patch series.
According to the Power State Coordination Interface (DEN0022F.b 1.3):
```
6.4.3.3 Exceptions
The appropriate asynchronous exception masks must be set when starting
up the core at the Exception
level from which the call was made, or at ELns. Typically, this means
that for the Exception level where
execution is restarting:

If starting in AArch64 state, the SPSR_ELx.{D,A,I,F} bits must be set
to {1, 1, 1, 1}. ELx is the
Exception level being returned from.
```

The ARM Trusted Firmware code enforces this correctly here:
https://elixir.bootlin.com/arm-trusted-firmware/v2.13.0/source/lib/psci/psc=
i_common.c#L869

So, the code should indeed expect DAIF bits to be set on resume. I
will update the patch accordingly.

>
> > +
> > +        tlbi  alle2
> > +        dsb   sy                     /* Ensure completion of TLB flush=
 */
>
> This doesn't exist when booting Xen and I am not sure why we would need
> it for resume as we already nuke the TLbs in enable_mmu. Can you clarify?

You're absolutely right =E2=80=94 that line is a leftover from earlier chan=
ges
when the memory handling logic was being reorganized.
It's no longer necessary because enable_mmu already handles TLB
invalidation, including the TLBI and DSB instructions.
I'll remove it in the next version. Thanks for catching this!

>
> > +        isb
> > +
> > +        ldr   x0, =3Dstart
> > +        adr   x19, start             /* x19 :=3D paddr (start) */
> > +        sub   x20, x19, x0           /* x20 :=3D phys-offset */
>
> Looking at the code, I wonder if it is still necessary to set x19 and
> x20 for booting secondary CPUs and resume. There doesn't seem to be any
> use of the registers.

x20 is still required during resume. It's used inside
enable_secondary_cpu_mm via the load_paddr macro.
So although x19 may no longer be necessary in this context, x20 is
still used and needs to be set beforehand.

>
> > +
> > +        /* Initialize the UART if earlyprintk has been enabled. */
> > +#ifdef CONFIG_EARLY_PRINTK
> > +        bl    init_uart
> > +#endif
> > +        PRINT_ID("- Xen resuming -\r\n")
> > +
> > +        bl    check_cpu_mode
> > +        bl    cpu_init
> > +
> > +        ldr   lr, =3Dmmu_resumed
> > +        b     enable_secondary_cpu_mm
> > +
> > +mmu_resumed:
> >           b .
> >   END(hyp_resume)
> >
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index ffcae900d7..3a89ac436b 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -508,6 +508,14 @@ void asmlinkage __init start_xen(unsigned long fdt=
_paddr)
> >       for_each_domain( d )
> >           domain_unpause_by_systemcontroller(d);
> >
> > +#ifdef CONFIG_SYSTEM_SUSPEND
> > +    /*
> > +     * It is called to initialize init_ttbr.
> > +     * Without this call, Xen gets stuck after resuming.
>
> This is not a very descriptive comment. But, you seem to make the
> assumption that prepare_secondary_mm() can be called on the boot CPU.
> This is not always the case. For instance on arm32, it will allocate
> memory and overwrite the per-cpu page-tables pointer (not great). This
> will also soon be the case for arm64.
>
> Furthermore, this call reminded me that the secondary CPU page-tables
> are not freed when turning off a CPU. So they will leak. Not yet a
> problem for arm64 though.
>
> So overall, I think we need a separate function that will be prepare
> init_ttbr for a given CPU (not allocate any memory). This will then need
> to be called from the suspend helper.

Thank you for the detailed explanation.

I will rework this part to avoid calling prepare_secondary_mm() on
the boot CPU. As suggested, I plan to introduce a dedicated helper
function that will only initialize init_ttbr without allocating
memory and call it  from the suspend helper.

>
> > +     */
>  > +    prepare_secondary_mm(0);> +#endif
> > +
> >       /* Switch on to the dynamically allocated stack for the idle vcpu
> >        * since the static one we're running on is about to be freed. */
> >       memcpy(idle_vcpu[0]->arch.cpu_info, get_cpu_info(),
>
> Cheers,
>
> --
> Julien Grall
>

Thank you for reviewing this patch series.

Best regards,
Mykola

