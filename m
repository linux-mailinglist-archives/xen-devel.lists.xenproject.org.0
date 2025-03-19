Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42570A68C53
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 13:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.920438.1324609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus9L-0007sD-Ld; Wed, 19 Mar 2025 12:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 920438.1324609; Wed, 19 Mar 2025 12:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tus9L-0007ql-It; Wed, 19 Mar 2025 12:03:55 +0000
Received: by outflank-mailman (input) for mailman id 920438;
 Wed, 19 Mar 2025 12:03:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eFby=WG=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tus9K-0007qd-KU
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 12:03:54 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39961b24-04ba-11f0-9ffa-bf95429c2676;
 Wed, 19 Mar 2025 13:03:52 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5e5e8274a74so10772436a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 05:03:52 -0700 (PDT)
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
X-Inumbo-ID: 39961b24-04ba-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742385832; x=1742990632; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxS6w16o89dFteZDSVW101Y6QMwZfp2IX7lE01QHLQk=;
        b=ElEQqzBXnw0dzPol4VEYjcGsqOgXHkcq1Y/guPcIUEo+rfjA+cA+7lViRlcNTxCi4p
         T3ibJc7iIIwI1i2Ehor70pIxKVp1d7XlqcIMi3riapnKseec+qUNpc1MKnkvR8a+5A9V
         3TlzdkpjNn0fsUdS2NEyUsshn0bGobuNiDxlt/eQ0qPTsaX+LQEIwVM+z9NfmsAorv5b
         en26XeQChY31EGxZsndIyopNGyd28P5swIcI+5eB6oLQuJ6OhQzJqjxGqT1hjYruE0Pq
         TyhVnhRaDewn+bkeLHinXOMRU9+7zIK0NA8EW3p884zx6LrfNOMKYSd7cHD4u4Rq9Emf
         pM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385832; x=1742990632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxS6w16o89dFteZDSVW101Y6QMwZfp2IX7lE01QHLQk=;
        b=DwmqO3Dwl4E4pUw8O8yP9Fun2VAPip/yOirXw7ewfc3vmLsOpYMEM/CHfBqHMBcJ6q
         TpS/TDX3p2ejYLKEmjwNfXpofntfeE8IBnl+IREqGNNoJfy+xFtjZ1gYKpyKrbetHDxS
         EaZiA5BORb1fZCu8xLNS4PWu6laue+TGZGHBTWIQLdUVkXkfjLq9y4FThDLyaP9zuVBn
         FQxYwpyvc5yFgFgo9HeRKOq9bVY+ihN6mDOOUon1RDO/j4K0c/xUdw9vzAdfJ7xUAA0J
         m3aGeZaCOJgsiFRyxLprLHrkGRYTrY+WmY1YAoVeJpZSyRg317GetZLi7esxhb/QvX6W
         9xOw==
X-Forwarded-Encrypted: i=1; AJvYcCXhdRDLfkwc29dDdPBMSeZZmX/zS8k0LTAvj3Ad9S0NF/Z7KsUd3jJHv7y7VLWTBt6P0YbJguZ5xYI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKoI6CUe55niMp2tPS20yzffHPebfGHUacGQorVbxJ5y/WoRjY
	DMGV315mYF1r80L82GYqF6eGSd5jFVVlBDqS54wF844WMVvLsXUjHDo7ezQ/PCWGBeB1gXJTeeA
	fkh0B3o6SmXjp3S4mZtzbshnx3QE=
X-Gm-Gg: ASbGncvwZ2Rr+GB2ogHYwENfMuhb262+/6Hu04+KEwSCJo6Uoyx6VjFu/bVzAdV6J4C
	FQg1EmJZZfSGew/jf/QzB7C6+T6NZetyAJvXzilyKsUA4P5uGLE/d1+KGv/sAIziPgfDYrr5IZb
	DsLhE/ojcdPhtyYaROPbyAWsl9
X-Google-Smtp-Source: AGHT+IGSyAxqDhbDys1Ce3Tuffid5DAtT9SjwMikrqnWTtVqm3lh/iEjpWImrmi3QD7n9QggdFaomsch2xmgR4GlW2w=
X-Received: by 2002:a05:6402:278f:b0:5e6:1842:1346 with SMTP id
 4fb4d7f45d1cf-5eb80fbd591mr2219583a12.30.1742385831739; Wed, 19 Mar 2025
 05:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1741164138.git.xakep.amatop@gmail.com> <82d394363821b74fb1617e81e6e726a7a25b4028.1741164138.git.xakep.amatop@gmail.com>
 <9a958cb6-d9f3-4bc3-9305-db954902f897@suse.com>
In-Reply-To: <9a958cb6-d9f3-4bc3-9305-db954902f897@suse.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 19 Mar 2025 14:03:40 +0200
X-Gm-Features: AQ5f1JoQmnJiProCjGNE3KAGxjcWtT5NvANhIQRcOUdupm0schrPMPv4sfsRz10
Message-ID: <CAGeoDV8zK89jfq-2uOayUVEAo5uEdGsXqTnyz-9h7+CjBYAtgQ@mail.gmail.com>
Subject: Re: [PATCH 02/16] xen/x86: Move freeze/thaw_domains into common files
To: Jan Beulich <jbeulich@suse.com>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>, Mykyta Poturai <mykyta_poturai@epam.com>, 
	Mykola Kvach <mykola_kvach@epam.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 6:48=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 05.03.2025 10:11, Mykola Kvach wrote:
> > From: Mirela Simonovic <mirela.simonovic@aggios.com>
> >
> > These functions will be reused by suspend/resume support for ARM.
>
> And until then they are going to violate the Misra rule requiring there
> to not be unreachable code.
>
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -2259,6 +2259,36 @@ int continue_hypercall_on_cpu(
> >      return 0;
> >  }
> >
> > +
> > +void freeze_domains(void)
>
> Nit: No double blank lines please.

Thanks for pointing that out! I'll fix it in the next version of the
patch series.

>
> > +{
> > +    struct domain *d;
> > +
> > +    rcu_read_lock(&domlist_read_lock);
> > +    /*
> > +     * Note that we iterate in order of domain-id. Hence we will pause=
 dom0
> > +     * first which is required for correctness (as only dom0 can add d=
omains to
> > +     * the domain list). Otherwise we could miss concurrently-created =
domains.
> > +     */
> > +    for_each_domain ( d )
> > +        domain_pause(d);
> > +    rcu_read_unlock(&domlist_read_lock);
> > +
> > +    scheduler_disable();
>
> When made generally available I'm unsure having this and ...
>
> > +}
> > +
> > +void thaw_domains(void)
> > +{
> > +    struct domain *d;
> > +
> > +    scheduler_enable();
>
> ... this here is a good idea. Both scheduler operations aren't related
> to what the function names say is being done here.

I have just moved these functions from x86-specific headers to a common one=
,
but they are still used only for suspend/resume purposes.
It's not a problem for me to adjust the names slightly in the next
version of the
patch series.

>
> Jan

Best regards,
~Mykola

