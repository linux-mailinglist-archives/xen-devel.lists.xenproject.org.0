Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AAE901F7B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 12:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737150.1143318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcMH-0002iM-Rk; Mon, 10 Jun 2024 10:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737150.1143318; Mon, 10 Jun 2024 10:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGcMH-0002g0-Oc; Mon, 10 Jun 2024 10:34:37 +0000
Received: by outflank-mailman (input) for mailman id 737150;
 Mon, 10 Jun 2024 10:34:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7qHj=NM=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1sGcMG-0002fq-5e
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 10:34:36 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06ebcd3b-2715-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 12:34:34 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3d226c5a157so673649b6e.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 03:34:34 -0700 (PDT)
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
X-Inumbo-ID: 06ebcd3b-2715-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718015673; x=1718620473; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7ZgxAqjXY9AET+7F5hBQjyBy8YsMtzIxOARp//Ut1k=;
        b=MEFfyxCYmW0lBGEQ8GHXXm3liJNyqDh05Ep9SX9FzAFa2jT4rKJlsOXlJPoZn0pmWl
         bRH8KReR1tnXgMeC4AEfpZg4vfpVpRWYplp/ffCeCWqZD8UGwVY15CRlmIAEZZG2YAGn
         Cq8JWGCKEhkGohUxJbaSf3l9J5P3d9UuAfmnoJ0lwSAwFkGimCPiHnUtYFI/oF02v5kE
         +QEe0xBSJw1167oDmNfhc8ekxzbqVLstb5+AUl3fEb1T1hP3jeOBR9JiQyk8h6KjcK3I
         vPjI59n7dcTS5WTLJIMjyLNtBbKUrtdpf1z+tzYuHWFPsMpzQMa/pfCwqlDqOHn73vMI
         +jfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718015673; x=1718620473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7ZgxAqjXY9AET+7F5hBQjyBy8YsMtzIxOARp//Ut1k=;
        b=MlfD71wtTRffmLG9ZL+2rEMzRp5fTNsZTdmEo231fONCgAIGhwVe4WRdJnOHp3pYzm
         P5kx3OEfF920PpgA9Ed6GUsBMgc7LftXupf/eGWUdPibvYfrZfk+WUmsQsts0dEHs8fi
         9399/3jbnSywQt3+kyzU9Yo9Xm6PmCE9v27bOpzeRfibMWjibjkQ6+pmhqU3EnZS1WkM
         UYky02zVOrF52g7pooRpKFhoqIocVmZy6mkEwBnoQQhKdtp/3+UPOjLvSd820lR1cQmy
         5w4SEtcPlgTidJUrIUbt6R4OwPgEq/MUOZ6mJ8Qode7jotqA8qphbjxXrck/LHmE8XxR
         CZHA==
X-Forwarded-Encrypted: i=1; AJvYcCXHwGLajnuaSjkTM49q4lHtu6t6g9uz20Blittd3K1KXAuVbfTYpXuyJ7BAol5Abmix88qLq7OePUbqXIxYsUNvtABl9mabDkAa5u3Z4vE=
X-Gm-Message-State: AOJu0YwFP6TZBxHVDODGPNvFyo/8aIv4tpaUJhL5bCOFlwNBtn4F86al
	LXWFCF25S+7zozrGw/DhdvIot6dmU8rAN0fHWse5QdqAwYzV39wP7BiKJKFibzDNEYAuqw7bVo8
	emfAybwtzBoG4KjL+Y2076XOwj8o=
X-Google-Smtp-Source: AGHT+IE+UlLNyd1/61vLAoD8Eisrzv+MvwA3XfkK6aJ5nPuZsOV8aV16RayME3zDO8Fy5BiCHA6eVKJ4KPQ3M3Q3nEg=
X-Received: by 2002:a05:6870:d24c:b0:24f:c0bc:5ac6 with SMTP id
 586e51a60fabf-254644514e6mr10170426fac.11.1718015672792; Mon, 10 Jun 2024
 03:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1717356829.git.w1benny@gmail.com> <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
 <22eabe14-10c3-4095-91d3-b63911908cb2@suse.com> <CAKBKdXhZ4HOqThPMkwaWB5ZhQOc6gE=xsKzkoL4_h+M6y33dcQ@mail.gmail.com>
 <f3cd00f2-bdcb-4604-bdc2-fd13eddb8ea0@suse.com> <CAKBKdXje+_dd7kh3+aDJACw84+-1ozXt6N==KbA6Tgm7GeZEnQ@mail.gmail.com>
 <8961cf72-4eeb-4c47-9723-35da3e47d4d2@suse.com>
In-Reply-To: <8961cf72-4eeb-4c47-9723-35da3e47d4d2@suse.com>
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Mon, 10 Jun 2024 12:34:22 +0200
Message-ID: <CAKBKdXiQhFeihx9HeuOv5cFe8K7H2O+GFUXy4ThF1X6ZGjCrig@mail.gmail.com>
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

On Mon, Jun 10, 2024 at 12:16=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 10.06.2024 11:10, Petr Bene=C5=A1 wrote:
> > On Mon, Jun 10, 2024 at 9:30=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 09.06.2024 01:06, Petr Bene=C5=A1 wrote:
> >>> On Thu, Jun 6, 2024 at 9:24=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>>> @@ -122,7 +131,12 @@ int p2m_init_altp2m(struct domain *d)
> >>>>>      struct p2m_domain *hostp2m =3D p2m_get_hostp2m(d);
> >>>>>
> >>>>>      mm_lock_init(&d->arch.altp2m_list_lock);
> >>>>> -    for ( i =3D 0; i < MAX_ALTP2M; i++ )
> >>>>> +    d->arch.altp2m_p2m =3D xzalloc_array(struct p2m_domain *, d->n=
r_altp2m);
> >>>>> +
> >>>>> +    if ( !d->arch.altp2m_p2m )
> >>>>> +        return -ENOMEM;
> >>>>
> >>>> This isn't really needed, is it? Both ...
> >>>>
> >>>>> +    for ( i =3D 0; i < d->nr_altp2m; i++ )
> >>>>
> >>>> ... this and ...
> >>>>
> >>>>>      {
> >>>>>          d->arch.altp2m_p2m[i] =3D p2m =3D p2m_init_one(d);
> >>>>>          if ( p2m =3D=3D NULL )
> >>>>> @@ -143,7 +157,10 @@ void p2m_teardown_altp2m(struct domain *d)
> >>>>>      unsigned int i;
> >>>>>      struct p2m_domain *p2m;
> >>>>>
> >>>>> -    for ( i =3D 0; i < MAX_ALTP2M; i++ )
> >>>>> +    if ( !d->arch.altp2m_p2m )
> >>>>> +        return;
> >>
> >> I'm sorry, the question was meant to be on this if() instead.
> >>
> >>>>> +    for ( i =3D 0; i < d->nr_altp2m; i++ )
> >>>>>      {
> >>>>>          if ( !d->arch.altp2m_p2m[i] )
> >>>>>              continue;
> >>>>> @@ -151,6 +168,8 @@ void p2m_teardown_altp2m(struct domain *d)
> >>>>>          d->arch.altp2m_p2m[i] =3D NULL;
> >>>>>          p2m_free_one(p2m);
> >>>>>      }
> >>>>> +
> >>>>> +    XFREE(d->arch.altp2m_p2m);
> >>>>>  }
> >>>>
> >>>> ... this ought to be fine without?
> >>>
> >>> Could you, please, elaborate? I honestly don't know what you mean her=
e
> >>> (by "this isn't needed").
> >>
> >> I hope the above correction is enough?
> >
> > I'm sorry, but not really? I feel like I'm blind but I can't see
> > anything I could remove without causing (or risking) crash.
>
> The loop is going to do nothing when d->nr_altp2m =3D=3D 0, and the XFREE=
() is
> going to do nothing when d->arch.altp2m_p2m =3D=3D NULL. Hence what does =
the
> if() guard against? IOW what possible crashes are you seeing that I don't
> see?

I see now. I was seeing ghosts - my thinking was that if
p2m_init_altp2m fails to allocate altp2m_p2m, it will call
p2m_teardown_altp2m - which, without the if(), would start to iterate
through an array that is not allocated. It doesn't happen, it just
returns -ENOMEM.

So to reiterate:

    if ( !d->arch.altp2m_p2m )
        return;

... are we talking that this condition inside p2m_teardown_altp2m
isn't needed? Or is there anything else?

P.

