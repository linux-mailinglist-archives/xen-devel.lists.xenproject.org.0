Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B480363F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647015.1009695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9mt-00045g-Sv; Mon, 04 Dec 2023 14:19:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647015.1009695; Mon, 04 Dec 2023 14:19:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9mt-00043o-PD; Mon, 04 Dec 2023 14:19:07 +0000
Received: by outflank-mailman (input) for mailman id 647015;
 Mon, 04 Dec 2023 14:19:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwcF=HP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rA9mr-00042T-Jj
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:19:05 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13824487-92b0-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 15:19:03 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50be10acaf9so2454889e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 06:19:03 -0800 (PST)
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
X-Inumbo-ID: 13824487-92b0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701699543; x=1702304343; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoXpYKeAwkkXM5zAxEhzOuV4q5RZWoJvtgzz21y8toE=;
        b=kQozw+dN9mhS+HxrbNdou3xSNWK1cWQSZK5TYY3V0nhgLdwrXbePwazjJDx3DOz5ml
         v7dbx4CcXWnUQZ6GmO5p2S/WUP9VROVrEVjz5dgdQOHM8zgyq8ass1USmDGPR55So/h4
         mLBsJcSQeyYzN2Y9C0EzKjoPwTdHGYIZdIOu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701699543; x=1702304343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoXpYKeAwkkXM5zAxEhzOuV4q5RZWoJvtgzz21y8toE=;
        b=dA0/EZy81g8zBg+DedAJ4NhRzpZT9glBO2SOAps9rO5faqZh3Dwm88pAsvZcclWBqd
         6CBQ7URaaJKeDiGprJG52cKUzymdMa9foOvMQO+9PLVBNcRoYpDtA+5oFCJnAXL5YwZr
         V/q6dUg8fl0JUoRh4OVNt+E3f9EAEuWXFT2y5sQhjrv3kTzSmLwRqospi1DSADagIEK4
         Im17qMdakWGHB7bGaTRDrS++uQ7prrHMj9rJ/5DKYCiQAZMa9DITffpxkasPV6vRMSrO
         qZDyLM1Wpvoh7nuqgsVCi/ArAD0FXi+bS9hAmsXhSrTBag2bqV8NjPD1u9ulAE1YjjFw
         EKXw==
X-Gm-Message-State: AOJu0YzJOP2FuzF+l2OxwyjC7i7nO+xr8cDEPf4somz8Fo0o6dgEUdw5
	uJ+TJUdyGl9xwSP7jyzpyPGt/hYPlRx+ezgEiJ5Djg==
X-Google-Smtp-Source: AGHT+IHzgXYXlV5kZlqZeRDSc0KdLqRPGLuEz/Oy4IzEgPC1nm7GcEwCrPaQrhuPB6DE+gJ8ekslu0qdttWGT/5dOno=
X-Received: by 2002:ac2:5dc3:0:b0:50b:f3fc:125a with SMTP id
 x3-20020ac25dc3000000b0050bf3fc125amr963378lfq.10.1701699542965; Mon, 04 Dec
 2023 06:19:02 -0800 (PST)
MIME-Version: 1.0
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com> <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
In-Reply-To: <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 4 Dec 2023 14:18:52 +0000
Message-ID: <CA+zSX=aicqMNWybLQYe3Jb6rzfePVrgbg6KT=rYnLnvq-GKrcA@mail.gmail.com>
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, 
	=?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 2:10=E2=80=AFPM Juergen Gross <jgross@suse.com> wrot=
e:
>
> On 04.12.23 14:00, George Dunlap wrote:
> > On Mon, Dec 4, 2023 at 10:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> It is only in the error case that we want to clean up the new pool's
> >> scheduler data; in the success case it's rather the old scheduler's
> >> data which needs cleaning up.
> >>
> >> Reported-by: Ren=C3=A9 Winther H=C3=B8jgaard <renewin@proton.me>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Reviewed-by: Juergen Gross <jgross@suse.com>
> >>
> >> --- a/xen/common/sched/core.c
> >> +++ b/xen/common/sched/core.c
> >> @@ -810,7 +810,7 @@ int sched_move_domain(struct domain *d,
> >>       for ( unit =3D old_units; unit; )
> >>       {
> >>           if ( unit->priv )
> >> -            sched_free_udata(c->sched, unit->priv);
> >> +            sched_free_udata(ret ? c->sched : old_ops, unit->priv);
> >>           old_unit =3D unit;
> >>           unit =3D unit->next_in_list;
> >>           xfree(old_unit);
> >
> > This code is unfortunately written in a "clever" way which seems to
> > have introduced some confusion.  The one place which calls "goto
> > out_free" goes through and replaces *most* of the "old_*" variables
> > with the "new" equivalents.  That's why we're iterating over
> > `old_units` even on the failure path.
> >
> > The result is that this change doesn't catch another bug on the
> > following line, in the error case:
> >
> > sched_free_domdata(old_ops, old_domdata);
> >
> > At this point, old_ops is still the old ops, but old_domdata is the
> > *new* domdata.
> >
> > A patch like the following (compile tested only) would fix it along
> > the lines of the original intent:
> > 8<-------
> > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > index eba0cea4bb..78f21839d3 100644
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -720,6 +720,7 @@ int sched_move_domain(struct domain *d, struct cpup=
ool *c)
> >           {
> >               old_units =3D new_units;
> >               old_domdata =3D domdata;
> > +            old_ops =3D c->sched;
> >               ret =3D -ENOMEM;
> >               goto out_free;
> >           }
> > @@ -809,10 +810,15 @@ int sched_move_domain(struct domain *d, struct cp=
upool *c)
> >       domain_unpause(d);
> >
> >    out_free:
> > +    /*
> > +     * NB if we've jumped here, "old_units", "old_ops", and so on will
> > +     * actually be pointing to the new ops, since when aborting it's
> > +     * the new ops we want to free.
> > +     */
> >       for ( unit =3D old_units; unit; )
> >       {
> >           if ( unit->priv )
> > -            sched_free_udata(c->sched, unit->priv);
> > +            sched_free_udata(old_ops, unit->priv);
> >           old_unit =3D unit;
> >           unit =3D unit->next_in_list;
> >           xfree(old_unit);
> > ---->8
> >
> > But given that this kind of cleverness has already fooled two of our
> > most senior developers, I'd suggest making the whole thing more
> > explicit; something like the attached (again compile-tested only)?
>
> And I have again a third approach, making it crystal clear what is happen=
ing
> with which data. No need to explain what is freed via which variables. Se=
e
> attached patch (this time it should be really there).

Yes, I thought about making a function as well -- that works for me too.

Personally I prefer to keep the "goto out", rather than duplicating
the rcu_read_unlock().  I'd yield if Jan said he preferred
duplication, however.

 -George

