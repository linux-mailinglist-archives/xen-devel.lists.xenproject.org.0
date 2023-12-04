Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354628035A0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 14:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646987.1009655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9Q9-00047z-E5; Mon, 04 Dec 2023 13:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646987.1009655; Mon, 04 Dec 2023 13:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA9Q9-00045f-AP; Mon, 04 Dec 2023 13:55:37 +0000
Received: by outflank-mailman (input) for mailman id 646987;
 Mon, 04 Dec 2023 13:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwcF=HP=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rA9Q8-00045Z-5E
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 13:55:36 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbbc8df2-92ac-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 14:55:34 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bf3efe2cbso1280416e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 05:55:34 -0800 (PST)
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
X-Inumbo-ID: cbbc8df2-92ac-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701698134; x=1702302934; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FV2Oq2v1SxYDnRxaqu0JYtg4pnX8gVxl1mHoZ5zChlA=;
        b=AKl9xoi1yp6BEGAUjfmPCCPH1NiptWS/E6McSRcNGUlyAIXHv4cfPF//W955z9eRNv
         RITEcNOeqc3rgBBcPccszTwGbvwMjPyZkeTOqMwQqg7x6TuMoqEl4snCLJkZcxuWB0Qp
         27uZyOZF93pgKBZqik1LfLilWsQxFEqjpssCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701698134; x=1702302934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV2Oq2v1SxYDnRxaqu0JYtg4pnX8gVxl1mHoZ5zChlA=;
        b=bknOI7kBmHcdWoXZS90G3ffIFQJ9N7mM78VjwsndRcct2LMObj/aqVZnTOk7ks/tZo
         Mm/Ggdr1On5myHfynVtiV97yevnddCdmDcaXOqjZwQxmirBEy0s/jX9HRRVsse84qUuK
         xZ/+boG4CmXSDpSNypJr3zxHpEWgz9cISIC6bmUI0gyxmmtVBGORpdasxeQG7eTujQ3f
         ZpomFV344gJ6o7RDqM9ZHGqnQs/8tLaR0WCzgZIIFJPLvoCGlHLClN71C8XGlTvxPh+G
         6fL5rdDJIXzX4XxGH4JB+YYhta3dMMNAcpSkzrH7iUZuyGHAcwv9XVZoyVJ170WYvUWK
         WkDw==
X-Gm-Message-State: AOJu0YzPMDR4rdvh5cb1VjOHOP09fIpE/114LZz2KOZI9VKnlPyyPpS3
	YU8po9aee0N8gwXpUHqdjjVPhRME1k1HR/d5R9NNaA==
X-Google-Smtp-Source: AGHT+IGHzWYoJ/1gQc6DR9B6EQWIz4qsLCO9KpeXmgI4+91jKT8A7tlNEu5w3frn5fKV/A4Aibk5cOJYuVloFma+d9A=
X-Received: by 2002:a05:6512:370c:b0:50b:e694:e7fe with SMTP id
 z12-20020a056512370c00b0050be694e7femr618762lfr.260.1701698134045; Mon, 04
 Dec 2023 05:55:34 -0800 (PST)
MIME-Version: 1.0
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com> <7a3afb15-b7af-4fdc-bb16-bea46db6d3ed@suse.com>
In-Reply-To: <7a3afb15-b7af-4fdc-bb16-bea46db6d3ed@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 4 Dec 2023 13:55:23 +0000
Message-ID: <CA+zSX=YyPvi_atOV_Kbboo604UYEy5cD9CWgbaqx7eJ2o=bF+A@mail.gmail.com>
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
To: Juergen Gross <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Dario Faggioli <dfaggioli@suse.com>, 
	=?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 1:47=E2=80=AFPM Juergen Gross <jgross@suse.com> wrot=
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
> attached patch.
>
> Thoughts?

I only see a PGP key and signature.  Did you forget to attach the patch?

 -George

