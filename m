Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3342901DE0
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 11:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737081.1143219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGb39-0000Vx-1r; Mon, 10 Jun 2024 09:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737081.1143219; Mon, 10 Jun 2024 09:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGb38-0000Ts-UP; Mon, 10 Jun 2024 09:10:46 +0000
Received: by outflank-mailman (input) for mailman id 737081;
 Mon, 10 Jun 2024 09:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGb37-0000Tm-Og
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 09:10:45 +0000
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [2001:4860:4864:20::2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 509a9218-2709-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 11:10:44 +0200 (CEST)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-254ab6d5745so901103fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 02:10:43 -0700 (PDT)
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
X-Inumbo-ID: 509a9218-2709-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718010642; x=1718615442; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh24kQOy+eI4fBtuWuIBT0um3qXBUckqBM47GYuT7+E=;
        b=iH5jt+3Jo4o/qnZGBOAQjTrBuNAYUdBTWlckp913FOFQAOP+HMRmaJ2lhB9bWZtLhl
         Mr6759MnSJOYnYCKN0l5runFEt+ar3n2lb88Pc2vze1u0r2zXqG+Dfht0kZ6h8koQtnE
         B9LiZ2pA/CQe1hrM0CviVSz2Og2CAyHzP/mHewluV5iknZFZ9CpMxk2FKwMCMKUKhJOk
         hwCbxCB0oNrWqKY2kTo77jfan3+byp+fIzT/cL3oa5N6usgUM6YU9fJbbSOUNeySOSvM
         iwegWyU0pIxQDzeUvs7z0kmFHmGpoJGx9/A8Nqqd8ZCFSsC+sSJC81KBehbTnGgfIrXO
         +u2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718010642; x=1718615442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zh24kQOy+eI4fBtuWuIBT0um3qXBUckqBM47GYuT7+E=;
        b=ss2uEnrxC+zYp8MpgQb73ZwJEzD5RSavzyfCk7qht7M2RJ1uUPIeQznBs+BN5rKuoW
         nMlheTSuBZ5j3AKJq6k2oL7jvW50A1gMT/52e6PfT3Vxop8oUblfFltuoKoKB6dF0TKo
         X3u7HLq6QrVpTiHStOHMQemK4HHLzN7acbtYIFfjS9hosv729Ir3brbqIhcD7o4V14Po
         EJBCp6pTVdgzAK4v9uDxoeSw1A3S47zFRy/gBOG0P+ETPlfZqtC9a2EAt5ZR7+xOdzXo
         DEaQYWAj3vMUS409CM9fdvLrAs4dbOcCw0poRWJN9rmpxiy0yujx71Kt0VKZ2aIXaS1S
         8S2A==
X-Forwarded-Encrypted: i=1; AJvYcCUAr+bopBewN2WQTXDGd7/MZ6JYnoqRC6546E/EVj8CnKDEeZr7fxDYFQK/CcfTF3yauye0jZxyjwYrpr6JwTSmXFxXVCCdUuKdZT+UWZM=
X-Gm-Message-State: AOJu0Yz9BJ7nvjvdSLeJT7bfiWgDCFOhqgaraNMu92LAs3u6qK4KD1tp
	hnPkQNsVFy4Bo0+JV6egi91CUyL5ViU/iPqqi7zCmsTWE+zc8XUPAoig3stc+6X59jQfCEnz9td
	3XQANYhkLXi2yfLWXRue7D3be6yk=
X-Google-Smtp-Source: AGHT+IGPphbNxbkOIVS1Q2L9q867m24QYlQGpxuWkknmDyyV2wJIWyd345yilSFqzX+5aeul9cBvlpcU2KOZFKBKl5c=
X-Received: by 2002:a05:6871:e015:b0:250:7353:c8f2 with SMTP id
 586e51a60fabf-254647efd11mr9805537fac.43.1718010642523; Mon, 10 Jun 2024
 02:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717356829.git.w1benny@gmail.com> <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
 <22eabe14-10c3-4095-91d3-b63911908cb2@suse.com> <CAKBKdXhZ4HOqThPMkwaWB5ZhQOc6gE=xsKzkoL4_h+M6y33dcQ@mail.gmail.com>
 <f3cd00f2-bdcb-4604-bdc2-fd13eddb8ea0@suse.com>
In-Reply-To: <f3cd00f2-bdcb-4604-bdc2-fd13eddb8ea0@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 10 Jun 2024 11:10:31 +0200
Message-ID: <CAKBKdXje+_dd7kh3+aDJACw84+-1ozXt6N==KbA6Tgm7GeZEnQ@mail.gmail.com>
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

On Mon, Jun 10, 2024 at 9:30=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 09.06.2024 01:06, Petr Bene=C5=A1 wrote:
> > On Thu, Jun 6, 2024 at 9:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>> @@ -122,7 +131,12 @@ int p2m_init_altp2m(struct domain *d)
> >>>      struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
> >>>
> >>>      mm_lock_init(&d->arch.altp2m_list_lock);
> >>> -    for ( i =3D 0; i < MAX_ALTP2M; i++ )
> >>> +    d->arch.altp2m_p2m =3D xzalloc_array(struct p2m_domain *, d->nr_=
altp2m);
> >>> +
> >>> +    if ( !d->arch.altp2m_p2m )
> >>> +        return -ENOMEM;
> >>
> >> This isn't really needed, is it? Both ...
> >>
> >>> +    for ( i =3D 0; i < d->nr_altp2m; i++ )
> >>
> >> ... this and ...
> >>
> >>>      {
> >>>          d->arch.altp2m_p2m[i] =3D p2m =3D p2m_init_one(d);
> >>>          if ( p2m =3D=3D NULL )
> >>> @@ -143,7 +157,10 @@ void p2m_teardown_altp2m(struct domain *d)
> >>>      unsigned int i;
> >>>      struct p2m_domain *p2m;
> >>>
> >>> -    for ( i =3D 0; i < MAX_ALTP2M; i++ )
> >>> +    if ( !d->arch.altp2m_p2m )
> >>> +        return;
>
> I'm sorry, the question was meant to be on this if() instead.
>
> >>> +    for ( i =3D 0; i < d->nr_altp2m; i++ )
> >>>      {
> >>>          if ( !d->arch.altp2m_p2m[i] )
> >>>              continue;
> >>> @@ -151,6 +168,8 @@ void p2m_teardown_altp2m(struct domain *d)
> >>>          d->arch.altp2m_p2m[i] =3D NULL;
> >>>          p2m_free_one(p2m);
> >>>      }
> >>> +
> >>> +    XFREE(d->arch.altp2m_p2m);
> >>>  }
> >>
> >> ... this ought to be fine without?
> >
> > Could you, please, elaborate? I honestly don't know what you mean here
> > (by "this isn't needed").
>
> I hope the above correction is enough?

I'm sorry, but not really? I feel like I'm blind but I can't see
anything I could remove without causing (or risking) crash.

P.

