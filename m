Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D43658B9EBD
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715930.1117913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ZS5-0003Ct-Iu; Thu, 02 May 2024 16:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715930.1117913; Thu, 02 May 2024 16:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2ZS5-0003Ad-GI; Thu, 02 May 2024 16:38:33 +0000
Received: by outflank-mailman (input) for mailman id 715930;
 Thu, 02 May 2024 16:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2ZS3-0003AX-3T
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:38:31 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67725715-08a2-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 18:38:28 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a58fbbcd77aso661045966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:38:28 -0700 (PDT)
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
X-Inumbo-ID: 67725715-08a2-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714667908; x=1715272708; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tdq2b0nhg5nyul35h5bkMt4asw7wNg6ha8u+AmWjAGc=;
        b=h4/712AiA/3B8ZcDl7nhljMtOcIxywN/YD6+E2GMJQoFXwIbrt3Y+okDc9+mj1/jpX
         yGurqgCC78t3ll42ULg6Q5ztrbbrRvIFJDwbl8dkEkR2BRf7JmiE6dmvyW3Skklv5umf
         QxZqg2tSUjSyTZKwZuk+iO1WhLhVA1e99v8vWyo3LWFcMR9NPOeBjgQon/9Eb8XAwMCN
         vcgZJHTEjRh+4xiYCvb8o39DpXYIEPZ9mrkB/MA2waqqjmcYPWgub5ULwKNvk+njauM0
         f/FLGKWrud+kDKjG84ESHCpfG0+lvDgK4ZdWlSeSlk7yU9C8PEM+manoI9ZKEjytIdDn
         Uxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714667908; x=1715272708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tdq2b0nhg5nyul35h5bkMt4asw7wNg6ha8u+AmWjAGc=;
        b=pl9aDnhouetGbzsxj48k8jRyuY9KcYvgqHojbJNDpZAP9Dd60xTo0Mr1seWChSMEj2
         5140Hx+osRRWX5IM/Com3jVJfpZYhvkrp4WQHP7zaCIEckxJpW3ZjdPEgus+hmDGoB/T
         HoDqcU6afWRthDVnW1no79Q1Y4soAcn8cCAG6H+HjRRnNJ4HHgzDuVxP2JUlRF7GyR9M
         w5esaRZYrefvtYFDBhKaa1iioA8MWBSe+DkYQoIDlzJL2ls9HcN7q+R7I3Z1T6gsi5H5
         4J9+DrrnIozLn0ruMv+UgRhHD+Pwb5qbRvaIBuskpFaBQSeh2Fmk5vm/1qRCwG0yVT6h
         Rd6Q==
X-Gm-Message-State: AOJu0YzxWpHeGymGoMflk7G3xSVaVMvhf+uEDdcshPWlU2/PIeTbZ6KJ
	MuwwGnZFvmToKuIZvH7/htN8We1S3+2ZppdDu2ZlpAmHth9K+NW/QA3+7mAQLYRhqs4s+rH6q14
	pAAqSkzzQvuDeVCsR+HCxB3HOH1w=
X-Google-Smtp-Source: AGHT+IFVcTsj3sgUTVuf4RSliWYI8UVluVED1hKF9MWgodAcHSq6Usexhfi2jq/y16/YXoYU/oMdHCGBhNsUpjXhbR4=
X-Received: by 2002:a50:8e4f:0:b0:570:5214:f62 with SMTP id
 15-20020a508e4f000000b0057052140f62mr22737edx.0.1714667907978; Thu, 02 May
 2024 09:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240415231541.4140052-1-edgar.iglesias@gmail.com>
 <20240415231541.4140052-2-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2404251608320.3940@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2404251608320.3940@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Thu, 2 May 2024 18:38:16 +0200
Message-ID: <CAJy5ezoyCarP28SdXwArMM4d7AALPAURERM-c2fDTxu1Am3tNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] xen/arm64: entry: Add missing code symbol annotations
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, bertrand.marquis@arm.com, 
	michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, jbeulich@suse.com, 
	andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 1:14=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Tue, 16 Apr 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Use the generic xen/linkage.h macros when and add missing
>                                         ^ when what?
>
> > code symbol annotations.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
>
> I am looking at the implementation of FUNC and as far as I can tell
> there is no change compared to ENTRY. So from that point of view we are
> good. I wonder if we should keep using "ENTRY" because it is nice to
> mark explicitely the entry points as such but at the same time I am also
> OK with this. I'll let the other ARM maintainers decide.
>
> On the other hand, FUNC_LOCAL does introduce a change: it adds a .align
> everywhere. Should not be harmful?
>
> With the commit message fixed:

Thanks Stefano, will fix the commit message in v3:

 "Use the generic xen/linkage.h macros to annotate code symbols
 and add missing annotations."

Cheers,
Edgar



>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>
>
> > ---
> >  xen/arch/arm/arm64/entry.S | 72 +++++++++++++++++++++++++-------------
> >  1 file changed, 48 insertions(+), 24 deletions(-)
> >
> > diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> > index f963c923bb..af9a592cae 100644
> > --- a/xen/arch/arm/arm64/entry.S
> > +++ b/xen/arch/arm/arm64/entry.S
> > @@ -289,21 +289,25 @@
> >          b       do_bad_mode
> >          .endm
> >
> > -hyp_sync_invalid:
> > +FUNC_LOCAL(hyp_sync_invalid)
> >          entry   hyp=3D1
> >          invalid BAD_SYNC
> > +END(hyp_sync_invalid)
> >
> > -hyp_irq_invalid:
> > +FUNC_LOCAL(hyp_irq_invalid)
> >          entry   hyp=3D1
> >          invalid BAD_IRQ
> > +END(hyp_irq_invalid)
> >
> > -hyp_fiq_invalid:
> > +FUNC_LOCAL(hyp_fiq_invalid)
> >          entry   hyp=3D1
> >          invalid BAD_FIQ
> > +END(hyp_fiq_invalid)
> >
> > -hyp_error_invalid:
> > +FUNC_LOCAL(hyp_error_invalid)
> >          entry   hyp=3D1
> >          invalid BAD_ERROR
> > +END(hyp_error_invalid)
> >
> >  /*
> >   * SError received while running in the hypervisor mode.
> > @@ -313,11 +317,12 @@ hyp_error_invalid:
> >   * simplicity, as SError should be rare and potentially fatal,
> >   * all interrupts are kept masked.
> >   */
> > -hyp_error:
> > +FUNC_LOCAL(hyp_error)
> >          entry   hyp=3D1
> >          mov     x0, sp
> >          bl      do_trap_hyp_serror
> >          exit    hyp=3D1
> > +END(hyp_error)
> >
> >  /*
> >   * Synchronous exception received while running in the hypervisor mode=
.
> > @@ -327,7 +332,7 @@ hyp_error:
> >   * some of them. So we want to inherit the state from the interrupted
> >   * context.
> >   */
> > -hyp_sync:
> > +FUNC_LOCAL(hyp_sync)
> >          entry   hyp=3D1
> >
> >          /* Inherit interrupts */
> > @@ -338,6 +343,7 @@ hyp_sync:
> >          mov     x0, sp
> >          bl      do_trap_hyp_sync
> >          exit    hyp=3D1
> > +END(hyp_sync)
> >
> >  /*
> >   * IRQ received while running in the hypervisor mode.
> > @@ -352,7 +358,7 @@ hyp_sync:
> >   * would require some rework in some paths (e.g. panic, livepatch) to
> >   * ensure the ordering is enforced everywhere.
> >   */
> > -hyp_irq:
> > +FUNC_LOCAL(hyp_irq)
> >          entry   hyp=3D1
> >
> >          /* Inherit D, A, F interrupts and keep I masked */
> > @@ -365,8 +371,9 @@ hyp_irq:
> >          mov     x0, sp
> >          bl      do_trap_irq
> >          exit    hyp=3D1
> > +END(hyp_irq)
> >
> > -guest_sync:
> > +FUNC_LOCAL(guest_sync)
> >          /*
> >           * Save x0, x1 in advance
> >           */
> > @@ -413,8 +420,9 @@ fastpath_out_workaround:
> >          mov     x1, xzr
> >          eret
> >          sb
> > +END(guest_sync)
> >
> > -wa2_ssbd:
> > +FUNC_LOCAL(wa2_ssbd)
> >  #ifdef CONFIG_ARM_SSBD
> >  alternative_cb arm_enable_wa2_handling
> >          b       wa2_end
> > @@ -450,42 +458,55 @@ wa2_end:
> >          mov     x0, xzr
> >          eret
> >          sb
> > -guest_sync_slowpath:
> > +END(wa2_ssbd)
> > +
> > +FUNC_LOCAL(guest_sync_slowpath)
> >          /*
> >           * x0/x1 may have been scratch by the fast path above, so avoi=
d
> >           * to save them.
> >           */
> >          guest_vector compat=3D0, iflags=3DIFLAGS__AI_, trap=3Dguest_sy=
nc, save_x0_x1=3D0
> > +END(guest_sync_slowpath)
> >
> > -guest_irq:
> > +FUNC_LOCAL(guest_irq)
> >          guest_vector compat=3D0, iflags=3DIFLAGS__A__, trap=3Dirq
> > +END(guest_irq)
> >
> > -guest_fiq_invalid:
> > +FUNC_LOCAL(guest_fiq_invalid)
> >          entry   hyp=3D0, compat=3D0
> >          invalid BAD_FIQ
> > +END(guest_fiq_invalid)
> >
> > -guest_error:
> > +FUNC_LOCAL(guest_error)
> >          guest_vector compat=3D0, iflags=3DIFLAGS__AI_, trap=3Dguest_se=
rror
> > +END(guest_error)
> >
> > -guest_sync_compat:
> > +FUNC_LOCAL(guest_sync_compat)
> >          guest_vector compat=3D1, iflags=3DIFLAGS__AI_, trap=3Dguest_sy=
nc
> > +END(guest_sync_compat)
> >
> > -guest_irq_compat:
> > +FUNC_LOCAL(guest_irq_compat)
> >          guest_vector compat=3D1, iflags=3DIFLAGS__A__, trap=3Dirq
> > +END(guest_irq_compat)
> >
> > -guest_fiq_invalid_compat:
> > +FUNC_LOCAL(guest_fiq_invalid_compat)
> >          entry   hyp=3D0, compat=3D1
> >          invalid BAD_FIQ
> > +END(guest_fiq_invalid_compat)
> >
> > -guest_error_compat:
> > +FUNC_LOCAL(guest_error_compat)
> >          guest_vector compat=3D1, iflags=3DIFLAGS__AI_, trap=3Dguest_se=
rror
> > +END(guest_error_compat)
> >
> > -ENTRY(return_to_new_vcpu32)
> > +FUNC(return_to_new_vcpu32)
> >          exit    hyp=3D0, compat=3D1
> > -ENTRY(return_to_new_vcpu64)
> > +END(return_to_new_vcpu32)
> > +
> > +FUNC(return_to_new_vcpu64)
> >          exit    hyp=3D0, compat=3D0
> > +END(return_to_new_vcpu64)
> >
> > -return_from_trap:
> > +FUNC_LOCAL(return_from_trap)
> >          msr     daifset, #IFLAGS___I_ /* Mask interrupts */
> >
> >          ldr     x21, [sp, #UREGS_PC]            /* load ELR */
> > @@ -524,6 +545,7 @@ return_from_trap:
> >
> >          eret
> >          sb
> > +END(return_from_trap)
> >
> >  /*
> >   * Consume pending SError generated by the guest if any.
> > @@ -536,7 +558,7 @@ return_from_trap:
> >   * it. So the function will unmask SError exception for a small window=
 and
> >   * then mask it again.
> >   */
> > -check_pending_guest_serror:
> > +FUNC_LOCAL(check_pending_guest_serror)
> >          /*
> >           * Save elr_el2 to check whether the pending SError exception =
takes
> >           * place while we are doing this sync exception.
> > @@ -586,7 +608,7 @@ abort_guest_exit_end:
> >          cset    x19, ne
> >
> >          ret
> > -ENDPROC(check_pending_guest_serror)
> > +END(check_pending_guest_serror)
> >
> >  /*
> >   * Exception vectors.
> > @@ -597,7 +619,7 @@ ENDPROC(check_pending_guest_serror)
> >          .endm
> >
> >          .align  11
> > -ENTRY(hyp_traps_vector)
> > +FUNC(hyp_traps_vector)
> >          ventry  hyp_sync_invalid            /* Synchronous EL2t */
> >          ventry  hyp_irq_invalid             /* IRQ EL2t */
> >          ventry  hyp_fiq_invalid             /* FIQ EL2t */
> > @@ -617,6 +639,7 @@ ENTRY(hyp_traps_vector)
> >          ventry  guest_irq_compat            /* IRQ 32-bit EL0/EL1 */
> >          ventry  guest_fiq_invalid_compat    /* FIQ 32-bit EL0/EL1 */
> >          ventry  guest_error_compat          /* Error 32-bit EL0/EL1 */
> > +END(hyp_traps_vector)
> >
> >  /*
> >   * struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next)
> > @@ -626,7 +649,7 @@ ENTRY(hyp_traps_vector)
> >   *
> >   * Returns prev in x0
> >   */
> > -ENTRY(__context_switch)
> > +FUNC(__context_switch)
> >          add     x8, x0, #VCPU_arch_saved_context
> >          mov     x9, sp
> >          stp     x19, x20, [x8], #16         /* store callee-saved regi=
sters */
> > @@ -647,6 +670,7 @@ ENTRY(__context_switch)
> >          ldr     lr, [x8]
> >          mov     sp, x9
> >          ret
> > +END(__context_switch)
> >
> >  /*
> >   * Local variables:
> > --
> > 2.40.1
> >

