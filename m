Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BBAB3ECDF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 19:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105218.1456162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut7vW-00054t-79; Mon, 01 Sep 2025 17:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105218.1456162; Mon, 01 Sep 2025 17:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut7vW-00053P-47; Mon, 01 Sep 2025 17:02:42 +0000
Received: by outflank-mailman (input) for mailman id 1105218;
 Mon, 01 Sep 2025 17:02:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ut7vU-00053J-7e
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 17:02:40 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76a88707-8755-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 19:02:38 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55f6b0049fbso3417973e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 10:02:38 -0700 (PDT)
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
X-Inumbo-ID: 76a88707-8755-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746158; x=1757350958; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yXguVzHvh08yNIktYepZOCHpmrKoT08r2kRg4ANyfY=;
        b=AzHm9vEfS93auHl8oBFu1tFjykKWCwZLtjKi6Zh0Fy6D6vTQGShUkUenbTOeOlB++y
         MvuxDGBE+qyXH8ETr72pKw7SvtAaHd4CQ+AULEo5g2mPBcutywVlBdYFeh6D5vV4LsG2
         vl8+TFx4fvNbV28gt8IeaSqG8u4/wDtH5AxoDOU0KQdyE5/0xb90dB7FHy1haU8rED6h
         hbZj1iyrFuR5LLRKcnS8H+nNp7n2ptkY+wd94tJC/BIg/X+0BSqc16nZ3Fr3NPfprtH3
         8EXdVkqHwFAyZUzVsr3lTV9PwwY+gnB3D61cjxG+E9XPl4YQbUG/KFsVvtUEj7vUCVSN
         FaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746158; x=1757350958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2yXguVzHvh08yNIktYepZOCHpmrKoT08r2kRg4ANyfY=;
        b=q//cLwf49YpSW5FoaefJVSlmmC/qJhqELD/mFIayXvTfKGk+e9y5pVZQ95129db4Cr
         vy/phs0wD9NaU/zMf9WZ4+SNpBEFnim7CXuA2d2xpFXFnj6EfAkNAIk38BEMEiY98TxC
         58qy7t6VLWUgLLL9rdlyG8yCJK5N80UsmYHBeJ+p0fuV+pk0RpEaAmZ++VgXLb/dnFDU
         ft6CFwbERosBrbrM5YdK7eMRKi7AT76EcvZ7KoRTUs/tDSBE5MYwwwD1O4STnhRo+iq7
         gy57DMFyEN4g3Duz3NOJQJZnZz1tffd1ZUFYPl8BKRrFxDhnwR7x30PxSXzC5i0deovl
         0ZYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1XVbWsJBNaqtRo7HaBbJib3tsDFBT+28RjP8Lb5svH6UnGl+vyj5lrRVBsgP53oUA2P4ae5bxvy4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxSEZ2tgcPUwVqBPmO0qnnCM0LqABAaQbIkNAkUH45w1Txs6HE
	+D4kJ2lbklfmGGhbkUWU3cjE6n3SYLjhRKsaBPOEJGjzp3Nnl/Gf6N4JVxC0DEh2tZxEz8VHxaL
	OEg8B849F7ouTlL+64GMoMaIcM6csIy8=
X-Gm-Gg: ASbGncs6Fvlw5Fuji2YcXv/BzST3wLo69ib39ywZj8Hx94ZWSnybqviRDTll2tQT4IX
	a13ferbN6adUsYe0fDxq2wP4Yb3OWDqQ2U/2PfCXh4BbbY4vIMMDYzBqaKBPIbCOjGdW1qKFOLm
	deZC6toUoDKOJdw4/oWu5Ga9PpDrPwfqgH2iSLf8rU3U/DIqUHhvpKd2SmBh7OuxmI5N3FZm7oF
	hb7yO5Mtjq0hu7/
X-Google-Smtp-Source: AGHT+IFpq5oh5tAc/zFSmTvNrjz0pfHuaJHfvXC0RE+QFOJBI3zTI9ALRmwdshv+2PgTOMDY0chO5NkX25EdJGToljw=
X-Received: by 2002:a05:6512:258c:b0:55f:43ba:9410 with SMTP id
 2adb3069b0e04-55f708b4592mr2396976e87.15.1756746157242; Mon, 01 Sep 2025
 10:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756586648.git.mykola_kvach@epam.com> <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
 <80c8dbfe-5240-441d-84fc-603e9c5f9812@suse.com>
In-Reply-To: <80c8dbfe-5240-441d-84fc-603e9c5f9812@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 1 Sep 2025 20:02:26 +0300
X-Gm-Features: Ac12FXzP5QZzLRXppI3dJsIHJTUoFU8UMfgp-ZGQtjm2zgTsgrGh6wCnBOYW_Po
Message-ID: <CAGeoDV8Jjri+EhJDvxuZED9gm_b5JGcCouSeHqdBF=xR6VZw+w@mail.gmail.com>
Subject: Re: [PATCH v12 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Connor Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Sep 1, 2025 at 5:29=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 31.08.2025 00:10, Mykola Kvach wrote:
> > --- a/xen/arch/ppc/stubs.c
> > +++ b/xen/arch/ppc/stubs.c
> > @@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domain *=
d)
> >      BUG_ON("unimplemented");
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +
> >  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> >  {
> >      BUG_ON("unimplemented");
> > diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
> > index 1a8c86cd8d..52532ae14d 100644
> > --- a/xen/arch/riscv/stubs.c
> > +++ b/xen/arch/riscv/stubs.c
> > @@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domain *=
d)
> >      BUG_ON("unimplemented");
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +
> >  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
> >  {
> >      BUG_ON("unimplemented");
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 19fd86ce88..94a06bc697 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct domain=
 *d)
> >          hvm_domain_creation_finished(d);
> >  }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    return 0;
> > +}
> > +
> >  #ifdef CONFIG_COMPAT
> >  #define xen_vcpu_guest_context vcpu_guest_context
> >  #define fpu_ctxt fpu_ctxt.x
>
> I definitely don't like this redundancy, and even less so that you introd=
uce out-
> of-line calls.

Thank you for your feedback.
I followed the existing pattern used in other architecture stubs.

>
> > --- a/xen/include/xen/domain.h
> > +++ b/xen/include/xen/domain.h
> > @@ -109,6 +109,8 @@ int arch_domain_soft_reset(struct domain *d);
> >
> >  void arch_domain_creation_finished(struct domain *d);
> >
> > +int arch_domain_resume(struct domain *d);
>
> I think this wants to move to a per-arch header, presence of which is che=
cked by
> has_include(), with an inline fallback define once centrally here.

Would it be acceptable to use a weak function as the default
implementation instead? This way, architectures needing a real
implementation could override it, while others would use the weak
default.

>
> Jan

Best regards,
Mykola

