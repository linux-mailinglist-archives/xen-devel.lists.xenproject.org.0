Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4593B3AA78
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 21:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099869.1453553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urhqY-0003Ok-FA; Thu, 28 Aug 2025 18:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099869.1453553; Thu, 28 Aug 2025 18:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urhqY-0003Ld-By; Thu, 28 Aug 2025 18:59:42 +0000
Received: by outflank-mailman (input) for mailman id 1099869;
 Thu, 28 Aug 2025 18:59:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mimg=3I=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1urhqW-0003LX-W2
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 18:59:40 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2551394a-8441-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 20:59:38 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-336925ebb8aso9890811fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 11:59:38 -0700 (PDT)
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
X-Inumbo-ID: 2551394a-8441-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756407578; x=1757012378; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHgmDngHhWHNxKCCMEU9OyOc6gxLMrfY0m3Mm7E3F8A=;
        b=EA1eAG/0Zx2VS11RVNCBe4qlz5+adJSSz+HvFf66uVcJCTnKfIIuUMmL+pfrX7vtBo
         iX5ymJHQ3YeGcZl3NdQqjQxy34pZuUXZB2TYyHOXFGIW3Scyfrs3yv44PLrO51/G8hCD
         xunFHoIHrSC9fjZ/frdyNZN91bjXHYcJeh+JpI2dXwrNgmlKQLCt/0wwUpd5BsKNAUhL
         3Fxz45yZ6G/yonCI0fbFPhyo+ztQPca20Dk97zWojDmc6Tlsw/a5DS0t3okU3CCIpeP8
         1oPhSR51V7oLgtU1oF4xfv7eXyUlEHzGPfFKFwDvMqVVXITpiUVHHraMa5Ga+B9byinv
         4pdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756407578; x=1757012378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHgmDngHhWHNxKCCMEU9OyOc6gxLMrfY0m3Mm7E3F8A=;
        b=gHeBPTD7Rs8Gxv9404Dd+zeXcxWkjHuqTwWoNFBB/tfqu9v2GM3JPVAFlUUYmZNYZl
         ks3U+xYzHLJiJrZAgXxgKde+c2A0UDoG9IKEqdJznsosf3cbZWs2ghnb8LMz77VLInUC
         wOiU7l/1QgQzI1w18j4wVl8aB2Hp3hYgTummEGXkZfrtwgFg6NLDF3rXHmTQlD2HkvzZ
         s4SaKVS4oJxO45N0bkp+4yINCAiOFvUWYBFUPMtcIXCwMDy8hcllF31YAJT7J2sSgUHX
         2/VLyrIsb+whEH8QbdAFZGJxKroiKsTRGDI78LFWPKVEhmNyc71YxqgUkQ4bp4jxk3OK
         Q+RA==
X-Forwarded-Encrypted: i=1; AJvYcCU4tiUbDU9p/icp/1qmgDaq48IGeBA4J5W9hfTKKp01ytkMPYhFdn2TLpPZN8w8D5HZoGIp5MHUUSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWJeKHl8oYkNcdzAekLyfiq/2whJsCGPOmHr/9KgYvZ9SjJLab
	XTgXp3y8/xLcu/qYk5+VrPIYdoSfElnDD5z5hbiCcMHzVthaFzvJ9mu48UA60nFolXljcoiXwDx
	l/GNjaMf6xkmuI0qtXj2UQkT344gcMZ4=
X-Gm-Gg: ASbGncv9peDxDO+7dhSjOQQ1aCNm4O8ANbAxZ0+OGUyjn7zBFyUZxz5Qqd8rbbzLFn6
	Xbd0+2MnHM1YF6/1JeLNfMEWarl3Mx0/TtqCG9CM2hf03HU+4taLCWy9MKQZFxLl4iEN11L3sIX
	3wd3ga1D7RqnA7zuEVD+w/y8BYAlFmhKXFB3h9/1fHtHdhMHoR49uJ0rntxfkeMhxGu+3szrX0c
	+gfhYKjy3GE06pw
X-Google-Smtp-Source: AGHT+IF9i1tbas/wTl5/MO4xtuhrul2Bxoi5i84DjsVRTTe2/ck0Ihpm8h9/qrVAxzrdsANfGFsgLzJjWvx5hvb3DuQ=
X-Received: by 2002:a2e:ae18:0:10b0:333:f3e6:9f2d with SMTP id
 38308e7fff4ca-33650dd353fmr42540301fa.6.1756407577355; Thu, 28 Aug 2025
 11:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756329091.git.mykola_kvach@epam.com> <55ff99acd69f9eaf20f077e6b453b54931b541d4.1756329091.git.mykola_kvach@epam.com>
 <a132f2fe-124b-45ec-9444-42c1840cc29c@suse.com>
In-Reply-To: <a132f2fe-124b-45ec-9444-42c1840cc29c@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Thu, 28 Aug 2025 21:59:26 +0300
X-Gm-Features: Ac12FXyocYp4Skb5IrBtOPOpqf6iwqPRCPnbkNzKN2lYPS7TbO9aBurcpBE5IU8
Message-ID: <CAGeoDV9vKbcanhxTwNUN1SuUOA5wH6UVQZ3_CSeE=iFQz2Ggdw@mail.gmail.com>
Subject: Re: [PATCH v10 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
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

I have completely changed the implementation so that the common parts
of the code are almost untouched. Therefore, there is no longer a need
to address the previous issues with comments and other concerns.

Thank you for your review. Please take a look at the new version of
this patch series. I hope there are no issues remaining.

On Thu, Aug 28, 2025 at 10:40=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 27.08.2025 23:21, Mykola Kvach wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -1349,16 +1349,10 @@ int domain_shutdown(struct domain *d, u8 reason=
)
> >      return 0;
> >  }
> >
> > -void domain_resume(struct domain *d)
> > +static void domain_resume_nopause(struct domain *d)
> >  {
> >      struct vcpu *v;
> >
> > -    /*
> > -     * Some code paths assume that shutdown status does not get reset =
under
> > -     * their feet (e.g., some assertions make this assumption).
> > -     */
> > -    domain_pause(d);
> > -
> >      spin_lock(&d->shutdown_lock);
> >
> >      d->is_shutting_down =3D d->is_shut_down =3D 0;
> > @@ -1366,13 +1360,40 @@ void domain_resume(struct domain *d)
> >
> >      for_each_vcpu ( d, v )
> >      {
> > +        /*
> > +         * No need to conditionally clear _VPF_suspended here:
> > +         * - This bit is only set on Arm, and only after a successful =
suspend.
>
> How likely do you think it is that, if e.g. RISC-V or PPC clone Arm's
> code, this comment would then be updated accordingly? IOW I don't think
> a justification like this one should be written in such terms.
>
> > +         * - domain_resume_nopause() may also be called from paths oth=
er than
> > +         *   the suspend/resume flow, such as "soft-reset" actions (e.=
g.,
> > +         *   on_poweroff), as part of the Xenstore control/shutdown pr=
otocol.
> > +         *   These require guest acknowledgement to complete the opera=
tion.
>
> I'm having trouble connecting "require guest acknowledgement" to ...
>
> > +         * So clearing the bit unconditionally is safe.
>
> ... the safety of the unconditional clearing.
>
> > +         */
> > +        clear_bit(_VPF_suspended, &v->pause_flags);
> > +
> >          if ( v->paused_for_shutdown )
> >              vcpu_unpause(v);
> >          v->paused_for_shutdown =3D 0;
> >      }
> >
> >      spin_unlock(&d->shutdown_lock);
> > +}
> >
> > +#ifdef CONFIG_ARM
> > +void domain_resume_nopause_helper(struct domain *d)
>
> This is an odd name to use from code meaning to invoke domain_resume_nopa=
use().
> Why isn't this called domain_resume_nopause(), and ...
>
> > +{
> > +    domain_resume_nopause(d);
>
> ... the static function simply _domain_resume_nopause() (in full accordan=
ce
> to the C standard's naming rules)?
>
> > +}
> > +#endif
> > +
> > +void domain_resume(struct domain *d)
> > +{
> > +    /*
> > +     * Some code paths assume that shutdown status does not get reset =
under
> > +     * their feet (e.g., some assertions make this assumption).
> > +     */
> > +    domain_pause(d);
>
> As you move the comment - no such assumptions exist when the code path
> through domain_resume_nopause_helper() is taken?
>
> Jan

Best regards,
Mykola

