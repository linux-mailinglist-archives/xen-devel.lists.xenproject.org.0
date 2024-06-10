Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39D902187
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 14:22:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737266.1143483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGe1q-00061O-3h; Mon, 10 Jun 2024 12:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737266.1143483; Mon, 10 Jun 2024 12:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGe1p-0005za-WE; Mon, 10 Jun 2024 12:21:38 +0000
Received: by outflank-mailman (input) for mailman id 737266;
 Mon, 10 Jun 2024 12:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGe1n-0005zP-Ob
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 12:21:35 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8e781e1-2723-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 14:21:33 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-254c5bc84c6so479931fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 05:21:33 -0700 (PDT)
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
X-Inumbo-ID: f8e781e1-2723-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718022092; x=1718626892; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNBQSeigbJsHzkU0snWQtpMi1kk6ZjIJqgd5Q0fbImI=;
        b=OJUKDkgQ3liiZK8HCjH/JY9W+JF+4thM/4gbePQOBpOgg5s61S7LEg7VcJ3QEF+qfU
         yMazyC1NuL9UWfjUTuzGvo+Scek7UKk4tNBBTWi+sAKcMX39+ezzmHv2CtdVFvhnWUW+
         SoSOtKwYm98A9Oxx5ZtXAZBGEucAzyUGjlQHt3GzO+18mrItgamTiaHTV5v4GQEcQHrN
         +ZV0nRcew6fPLJTtGgWnMXz/q3iRNdJro63c4TC5fVp+j5i3YskC89Pm/3zk8wq3wzag
         yuYfqcyy14Jl5q45H+ID+Opid7BTF5/5Y3rBdngewDw5tpx4eQ12K/7HQbe4X4HeieDr
         uC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718022092; x=1718626892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNBQSeigbJsHzkU0snWQtpMi1kk6ZjIJqgd5Q0fbImI=;
        b=tvBaAPAJSFM8Xn5MyBreyetly2tn/cJY9dLUMn6eVQWpXHUalGZThwXJv2/RQ/q7q9
         SJ29E2Q8yL8DmuESbVBMW6d5TV1o3vX/6BaXBYvMi4cbEL3sWP3xWBhYV5VX7Recso75
         rV6MukJlfITsWA5AUC/c/ez/zV/kmRgemeoU92YR61BZ7lxTm4qtsvqWrUY/qeZwCd8i
         FMBlnE/iOS84gM12F/qX8toZeXmZxj1o1WQZJKeLmCTlNRw9jo0zP0DR8jEN6HGd4tJ4
         qsdIq8Gp/9AVGvYFkdC1gaiIkgLO7x+UECwQ0RiKUf9OIAmTV9N+Oi7yVAzGGvOMWjjv
         2YPA==
X-Forwarded-Encrypted: i=1; AJvYcCUhoo8oZpdSTwOAaevozZmSsVWpVgapBd8pirR5C3UEwtcaq9vezKyz36Eh9Yuq9gAdi1zFZqu6lry/LBTZwVNn51fDfWT3Agelz5iumDo=
X-Gm-Message-State: AOJu0YzSzAWCZX7jHq6AcFik963Wr+znIcQx6CG0cQ6U9EjIBYdkAS5q
	wLTb0Z6q+3mjG2kJ3xdcDJTw26PaXaspoz/B1iD4ti0dAyupeiqiVkAZQKZ25ilVRBdo9B1fNAI
	6SXWzO+uq5oFXO1j4FYhLNW2zK3aUxHRr
X-Google-Smtp-Source: AGHT+IFjlGkFVbDMELsDZcehtgz35sJ23cqrWFOP1uude3AjQojhHc4nMgIi6EIKAnAftXA6SILzFgLesf9XHovIC6A=
X-Received: by 2002:a05:6870:224c:b0:254:c3d7:fbeb with SMTP id
 586e51a60fabf-254c3d8015dmr3437114fac.13.1718022091764; Mon, 10 Jun 2024
 05:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717356829.git.w1benny@gmail.com> <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
 <22eabe14-10c3-4095-91d3-b63911908cb2@suse.com> <CAKBKdXhZ4HOqThPMkwaWB5ZhQOc6gE=xsKzkoL4_h+M6y33dcQ@mail.gmail.com>
 <f3cd00f2-bdcb-4604-bdc2-fd13eddb8ea0@suse.com> <CAKBKdXje+_dd7kh3+aDJACw84+-1ozXt6N==KbA6Tgm7GeZEnQ@mail.gmail.com>
 <8961cf72-4eeb-4c47-9723-35da3e47d4d2@suse.com> <CAKBKdXiQhFeihx9HeuOv5cFe8K7H2O+GFUXy4ThF1X6ZGjCrig@mail.gmail.com>
 <093a45d0-da0b-44d1-902e-730eede80112@suse.com>
In-Reply-To: <093a45d0-da0b-44d1-902e-730eede80112@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 10 Jun 2024 14:21:19 +0200
Message-ID: <CAKBKdXjWmVJtCNWsGHnM_9TT2BZ6S=qyxYbYS7hsLWqb4vR16w@mail.gmail.com>
Subject: Re: [PATCH for-4.19? v5 07/10] xen: Make the maximum number of altp2m
 views configurable for x86
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, 
	Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 1:21=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.06.2024 12:34, Petr Bene=C5=A1 wrote:
> > On Mon, Jun 10, 2024 at 12:16=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>
> >> On 10.06.2024 11:10, Petr Bene=C5=A1 wrote:
> >>> On Mon, Jun 10, 2024 at 9:30=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>>
> >>>> On 09.06.2024 01:06, Petr Bene=C5=A1 wrote:
> >>>>> On Thu, Jun 6, 2024 at 9:24=E2=80=AFAM Jan Beulich <jbeulich@suse.c=
om> wrote:
> >>>>>>> @@ -122,7 +131,12 @@ int p2m_init_altp2m(struct domain *d)
> >>>>>>>      struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
> >>>>>>>
> >>>>>>>      mm_lock_init(&d->arch.altp2m_list_lock);
> >>>>>>> -    for ( i =3D 0; i < MAX_ALTP2M; i++ )
> >>>>>>> +    d->arch.altp2m_p2m =3D xzalloc_array(struct p2m_domain *, d-=
>nr_altp2m);
> >>>>>>> +
> >>>>>>> +    if ( !d->arch.altp2m_p2m )
> >>>>>>> +        return -ENOMEM;
> >>>>>>
> >>>>>> This isn't really needed, is it? Both ...
> >>>>>>
> >>>>>>> +    for ( i =3D 0; i < d->nr_altp2m; i++ )
> >>>>>>
> >>>>>> ... this and ...
> >>>>>>
> >>>>>>>      {
> >>>>>>>          d->arch.altp2m_p2m[i] =3D p2m =3D p2m_init_one(d);
> >>>>>>>          if ( p2m =3D=3D NULL )
> >>>>>>> @@ -143,7 +157,10 @@ void p2m_teardown_altp2m(struct domain *d)
> >>>>>>>      unsigned int i;
> >>>>>>>      struct p2m_domain *p2m;
> >>>>>>>
> >>>>>>> -    for ( i =3D 0; i < MAX_ALTP2M; i++ )
> >>>>>>> +    if ( !d->arch.altp2m_p2m )
> >>>>>>> +        return;
> >>>>
> >>>> I'm sorry, the question was meant to be on this if() instead.
> >>>>
> >>>>>>> +    for ( i =3D 0; i < d->nr_altp2m; i++ )
> >>>>>>>      {
> >>>>>>>          if ( !d->arch.altp2m_p2m[i] )
> >>>>>>>              continue;
> >>>>>>> @@ -151,6 +168,8 @@ void p2m_teardown_altp2m(struct domain *d)
> >>>>>>>          d->arch.altp2m_p2m[i] =3D NULL;
> >>>>>>>          p2m_free_one(p2m);
> >>>>>>>      }
> >>>>>>> +
> >>>>>>> +    XFREE(d->arch.altp2m_p2m);
> >>>>>>>  }
> >>>>>>
> >>>>>> ... this ought to be fine without?
> >>>>>
> >>>>> Could you, please, elaborate? I honestly don't know what you mean h=
ere
> >>>>> (by "this isn't needed").
> >>>>
> >>>> I hope the above correction is enough?
> >>>
> >>> I'm sorry, but not really? I feel like I'm blind but I can't see
> >>> anything I could remove without causing (or risking) crash.
> >>
> >> The loop is going to do nothing when d->nr_altp2m =3D=3D 0, and the XF=
REE() is
> >> going to do nothing when d->arch.altp2m_p2m =3D=3D NULL. Hence what do=
es the
> >> if() guard against? IOW what possible crashes are you seeing that I do=
n't
> >> see?
> >
> > I see now. I was seeing ghosts - my thinking was that if
> > p2m_init_altp2m fails to allocate altp2m_p2m, it will call
> > p2m_teardown_altp2m - which, without the if(), would start to iterate
> > through an array that is not allocated. It doesn't happen, it just
> > returns -ENOMEM.
> >
> > So to reiterate:
> >
> >     if ( !d->arch.altp2m_p2m )
> >         return;
> >
> > ... are we talking that this condition inside p2m_teardown_altp2m
> > isn't needed?
>
> I'm not sure about "isn't" vs "shouldn't". The call from p2m_final_teardo=
wn()
> also needs to remain safe to make. Which may require that upon allocation
> failure you zap d->nr_altp2m. Or which alternatively may mean that the if=
()
> actually needs to stay.

True, p2m_final_teardown is called whenever p2m_init (and by extension
p2m_init_altp2m) fails. Which means that condition must stay - or, as
you suggested, reset nr_altp2m to 0.

I would rather leave the code as is. Modifying nr_altp2m would (in my
opinion) feel semantically incorrect, as that value should behave more
or less as const, that is initialized once.

> > Or is there anything else?
>
> There was also the question of whether to guard the allocation, to avoid =
a
> de-generate xmalloc_array() of zero size. Yet in the interest of avoiding
> not strictly necessary conditionals, that may well want to remain as is.

True, nr_altp2m would mean zero-sized allocation, as p2m_init_altp2m
is called unconditionally (when booted with altp2m=3D1). Is it a
problem, though?

P.

