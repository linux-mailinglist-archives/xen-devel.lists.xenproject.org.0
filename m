Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF54B2A1F2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 14:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086013.1444245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzDG-0003R4-NA; Mon, 18 Aug 2025 12:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086013.1444245; Mon, 18 Aug 2025 12:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unzDG-0003PX-KV; Mon, 18 Aug 2025 12:43:46 +0000
Received: by outflank-mailman (input) for mailman id 1086013;
 Mon, 18 Aug 2025 12:43:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFvU=26=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1unzDE-0003PR-TY
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 12:43:44 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9c95796-7c30-11f0-a32a-13f23c93f187;
 Mon, 18 Aug 2025 14:43:44 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-333f8ef379dso34298761fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 05:43:44 -0700 (PDT)
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
X-Inumbo-ID: f9c95796-7c30-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755521023; x=1756125823; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xWg2an8MdDVOhi310Jn/j5TA5sUCH1R7QLJZ1Ypuok=;
        b=mhxwWzky/zVsNMbI87eD4bLOPfEC4u/Ff1Mgb3mvwjBiiaGtrH0sNqpRKudjlPurVy
         idlZ7mKeXRFtFnGBKBKMzAM6H3LKDxdwNc8xpgujoNRloifMXFeLYHjVe4kRsAKKDMkr
         AaoR3Gt1vs3F+pOCh1FA1ecsXaykev8ANyE1BKiuSvai4ig+V7X2dfDHuVKVKaWYZNoZ
         PXc8vowUIZsB9GV2FHnmGdseg7p6opmK3i5MinIrcj9Jp4reF0DtJwDrxuUrInNLcGm4
         bVzaVXHp6RzGXUQmwWhVzBA+iR/Ot38xpAf/WEU5K71taFjYZHDKkKQIqUd47fLjNVpk
         1DWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521023; x=1756125823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xWg2an8MdDVOhi310Jn/j5TA5sUCH1R7QLJZ1Ypuok=;
        b=CCT1lrJjEMiJucXJMVYVKrD+O78u+QKDahVxG8ifTkuqiDzdj8dNvBgWayv57TVJjB
         p8rJCCd0L8QXSjv1eCH/q/HPvYv4kya0mQYpWw56Oj1DEoSmgXV+Ljif5v6vvS9xG9Gi
         FGlz7juPnrVjh6yfz4OfwHWGcvXaQRQJRc5Et89xS/2eOn2W0eZnEfFGdd5JWacIQDUV
         SjSpcvjA2B5KTcEUNTQ+pW1dV34i4DSD1PYs5RLQS/RIeF084dazJ5vsBWVKVtnm5+RR
         zodx8SRAO7qjCeKF6dZqKikDkmpsVj36fjCAINVbKzyZ1GxsnxJAtVaeQLNadJAI5T+v
         8jtg==
X-Forwarded-Encrypted: i=1; AJvYcCX3+Dxan5xSZ6m8Q1iz7bS/GTIBOeBOIRrrSg94N9pla+adCfn5Ei7NGMfOTuMy3jE0OCO9ohdiND4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJw0K4l9n8kSQk/FbSehFwrAuyIe3CK6AOhQTfD7ffIEDiqFyx
	QN27+2U+yABPsdQNH83pYfnlb01bhUcpFUR4twu+3ilAVFZv88dStPYdYIdJBUyHFHUC7Jwd8xB
	MLZufbGli4cQBE+UYMGaEqq3et73nMWk=
X-Gm-Gg: ASbGncul+IMPQ17F3hp2b35fMMwDJQa+6AGRkk6wVkxQz2uu3ansH3IaPuoTqVYh5oz
	0E1QvNC6PMi/Y3eQGTQmmgqyP6hEp7eF5L92HttzKLyfeo1E64Knf73KnDkKlJpWSwm4RXYJ3q/
	1OPzQ5xSyvC8yj6ljqGRrFT8bJxkbd19m+NfNE1U5umL2myGicmP0dvXNkfvV6BHGzm1GLTx4Jm
	Btvz5zB6ZbrIxox
X-Google-Smtp-Source: AGHT+IGe6yJt0c63LktyTxX5j+EdFn5jv1w7Vv6PVh+PqXdKJwkSHsPABqIHuclYaCqz3v0W6ZYMl3r7HArA5nml9vk=
X-Received: by 2002:a2e:b8d6:0:b0:333:b6b0:e665 with SMTP id
 38308e7fff4ca-33409974206mr32094281fa.30.1755521022943; Mon, 18 Aug 2025
 05:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755506449.git.mykola_kvach@epam.com> <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
 <5bf9b184-70fb-4698-a01e-e8cbcb05935f@suse.com>
In-Reply-To: <5bf9b184-70fb-4698-a01e-e8cbcb05935f@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 18 Aug 2025 15:43:31 +0300
X-Gm-Features: Ac12FXyR_GMe1YiuIBQNUmCTJhsqX9F4TkEC9llBNBsAifKcMNWqfpN0oprtqGU
Message-ID: <CAGeoDV-JiD-sdVwGQjYbchD5N57ta8aT4_ZtPb_jNHxe77p5aQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Aug 18, 2025 at 1:15=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 18.08.2025 10:49, Mykola Kvach wrote:
> > --- a/xen/arch/arm/domain.c
> > +++ b/xen/arch/arm/domain.c
> > @@ -90,6 +90,16 @@ static void ctxt_switch_from(struct vcpu *p)
> >      if ( is_idle_vcpu(p) )
> >          return;
> >
> > +    /* Arch timer */
> > +    p->arch.cntkctl =3D READ_SYSREG(CNTKCTL_EL1);
> > +    virt_timer_save(p);
> > +
> > +    /* VGIC */
> > +    gic_save_state(p);
> > +
> > +    if ( test_bit(_VPF_suspended, &p->pause_flags) )
> > +        return;
>
> As I had to look at the Arm side uses of the new bit to at least try to
> follow the comment further down, I came across this. And now I wonder:
> Why would one of the pause flags need special casing here?

Some kind of answer was given in a previous version of this patch series,
see:
https://patchew.org/Xen/cover.1751020456.git.mykola._5Fkvach@epam.com/07227=
0e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola._5Fkvach@epam.com=
/#066c6e93-a478-4c8f-b161-d109bd0e6bb4@xen.org

To clarify:

We need to avoid updating the vCPU context when switching from a vCPU of a
domain that is being suspended to a vCPU of another domain. After the curre=
nt
HVC trap, which handles the PSCI SYSTEM_SUSPEND call, completes, the schedu=
ler
will switch to a vCPU from another domain. At this point, the virtual CPU i=
s
marked as paused either via pause_count (domain_shutdown -> vcpu_pause_nosy=
nc)
or by having the _VPF_suspended bit set in pause_flags. In both cases,
vcpu_runnable() will return false, so control will not be returned to the g=
uest
OS from this trap, and the scheduler will switch to another domain's vCPU.

During this context switch, we must not update the saved context of certain
vCPU registers for the domain that has entered suspend. The vCPU context fo=
r
suspend is set up in do_setup_vcpu_ctx(). If another function were to overw=
rite
the saved values with the current ones in a physical CPU at this point, the
domain would not be able to resume correctly after a resume command.


As an alternative, all suspend-related actions could be performed in a task=
let,
which would avoid the need for modifications in domain_pause and the
introduction of the new flag. The tasklet would execute after the context
switch, but this approach would increase code complexity and introduce
synchronization issues, such as passing the suspend command context to the
tasklet, adding extra locks, or creating a dedicated tasklet for each domai=
n.
Locking would also need to be reworked to handle cases where another domain
might attempt to change the vCPU context concurrently and just domain_pause
won't be enough.

Since the trap is a synchronous call, the current approach greatly simplifi=
es
synchronization compared to the tasklet-based alternative.

>
> > @@ -1360,13 +1357,33 @@ void domain_resume(struct domain *d)
> >
> >      for_each_vcpu ( d, v )
> >      {
> > +        /*
> > +         * No need to conditionally clear _VPF_suspended here:
> > +         * - This bit is only set on Arm64, and only after a successfu=
l suspend.

Note to self: s/Arm64/Arm/g

> > +         * - domain_resume_nopause() may also be called from paths oth=
er than
> > +         *   the suspend/resume flow, such as "soft-reset" actions (e.=
g.,
> > +         *   on_poweroff), as part of the Xenstore control/shutdown pr=
otocol.
> > +         *   These require guest acknowledgement to complete the opera=
tion.
> > +         * So clearing the bit unconditionally is safe.
> > +         */
> > +        clear_bit(_VPF_suspended, &v->pause_flags);
>
> Seeing that you set this bit for a single vCPU in a domain only, I wonder=
 why
> it needs to be a per-vCPU flag.

That's a good question. In earlier versions of this patch series, both I an=
d
some other contributors used existed fields from the domain structure, such=
 as
shutdown_code and is_shutting_down, for this purpose. However, I recall tha=
t
in a previous review, this approach was not well received. See:
https://lore.kernel.org/all/d24be446-af5a-7881-2db4-b25afac3e1f4@citrix.com=
/

Technically, there is nothing preventing me from storing this information i=
n
the domain structure. However, I do not see much benefit in introducing a n=
ew
field to the domain struct when there is already an existing per-vCPU flags
field that tracks powerdown and pause states. Using one more bit in the
pause_flags field seems sufficient and avoids further bloating the domain
structure.

>
> Apart from this, with the comment I still fear I wouldn't feel capable of
> ack-ing this, as there's too much Arm-only interaction in here. It's not =
even
> clear whether this could easily be re-used by another port.

Thank you for your feedback.

I understand your concern regarding the Arm-specific nature of this code an=
d
the potential challenges for reusing it on other architectures. The current
implementation is focused on supporting PSCI SYSTEM_SUSPEND, which is an
Arm-specific interface, so much of the logic is naturally tied to Arm.

That said, I have tried to keep the changes as contained as possible, and
where feasible, I have avoided making unnecessary modifications to common c=
ode.
If there is interest or a use case for supporting similar suspend/resume fl=
ows
on other architectures, I am open to suggestions on how to further abstract=
 or
generalize the implementation.

If you have specific recommendations for making this code more portable or
easier to adapt for other ports, I would be happy to discuss and consider
them.

>
> Jan

Best regards,
Mykola

