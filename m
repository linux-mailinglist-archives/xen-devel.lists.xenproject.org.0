Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DB2807A91
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 22:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649440.1013990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAzZY-0003Je-Jw; Wed, 06 Dec 2023 21:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649440.1013990; Wed, 06 Dec 2023 21:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAzZY-0003GY-H6; Wed, 06 Dec 2023 21:36:48 +0000
Received: by outflank-mailman (input) for mailman id 649440;
 Wed, 06 Dec 2023 21:36:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1JC=HR=gmail.com=julien.grall@srs-se1.protection.inumbo.net>)
 id 1rAzZX-0003GS-Hs
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 21:36:47 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d4d9b48-947f-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 22:36:45 +0100 (CET)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-db7d198e791so281147276.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 13:36:45 -0800 (PST)
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
X-Inumbo-ID: 8d4d9b48-947f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701898604; x=1702503404; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FC1WMHYI5xsD/RHWYbeYlCVzcJRbeBGfCPFuq9VO6u4=;
        b=inwcUB3UyDMb3qKJsGo8oA33WpNKPjhYEXdL4IdEeXNBVj1rZXSwQi57ossdhw3glK
         41bIFx/DIKUPZ+a9b+CFjPYB0nnyi+9Y65PF7HBkRrcXYmicTUecTY6o7C66MnmMh4E2
         BWAXDeFf8jKRlDlKrAfDSp9qJwiIAbf/ztxydJ5r0H7h0Dcn8b56T42bjQlvKtPvjB2a
         KZnTX/1Cqb0GrbqgqKJdPLm3Q6KP6zMGewMWcdAZEy1JhRta2RNL0Z+mN6FlZD9APS6G
         trNXfnjZ3o1EdDzDnx0oGx3dnyoRXBrSSbagnloGE6irnHGamLaQ9knxezX2tFJ0GtG3
         2xSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701898604; x=1702503404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FC1WMHYI5xsD/RHWYbeYlCVzcJRbeBGfCPFuq9VO6u4=;
        b=WJh3LXDpvtQpo1XUmetZ+Exgd378n9ZmWhHd/RyPO3DkYg0FtuzBfaW2QUOQPnoH0m
         997pTYBvHDRv1lR4cBIcOHH10y6/7AXZ7uzPDY5SHoKAn4UVCkj7WACULfv4FeqgB1vJ
         TS/lNzmLEndboYU8zd9dO8OLO8KdRt3hSLRNmxE+Itt/n+ha1/f3yN90VoJujU1tqCcn
         QtrY8ELtmD6YNIaIgl7lNeva7h7Fbmz6GNz7GPiROYFSOtN/7KDS6x87g/+XMigQ20y1
         xCECRs5U+q85BmI6zErU/ISJF6wrOVqJkaFor8PRDdjwxaZdOuu1tBhIdWNgcRQxjhra
         iEOg==
X-Gm-Message-State: AOJu0Yxtt3iUs3aPDr1+Z/+YMFJN7ACVi9KwhaEeJDu6ESP27ZQRhCiJ
	NwqX2eUnWcdlLS0wLDNueNC1G3jNHzmpopjVcPQ=
X-Google-Smtp-Source: AGHT+IH8E1i7uafefxRbkwXAPC6Ft9EFmbr3EfiZoX1ftVl9hp7STgJoQJMCibuf99dt0FgZ2dSFHaONmj08gYLsAE8=
X-Received: by 2002:a25:870f:0:b0:db7:dacf:4d54 with SMTP id
 a15-20020a25870f000000b00db7dacf4d54mr1104412ybl.80.1701898604143; Wed, 06
 Dec 2023 13:36:44 -0800 (PST)
MIME-Version: 1.0
References: <20231206144009.29154-1-jgross@suse.com> <CAKf6xpvu5txfU4uU26=Q-FyEmaaBazXPcOK_gU_=Tp=T98sS7g@mail.gmail.com>
 <b5b74155-e086-425d-8f5a-e9878d5d2da2@suse.com> <CAKf6xpvR1sOGCeH5PgdPGCuwAtLCH=J8c0C_V-DXopmw46=onQ@mail.gmail.com>
In-Reply-To: <CAKf6xpvR1sOGCeH5PgdPGCuwAtLCH=J8c0C_V-DXopmw46=onQ@mail.gmail.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Wed, 6 Dec 2023 21:36:07 +0000
Message-ID: <CAF3u54DGYjbVnd6oO=TfqN-aAP5JpBW1agihNL3t=HO8muMtRQ@mail.gmail.com>
Subject: Re: [PATCH] tools/libs/evtchn: drop assert()s in stubdom
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 6 d=C3=A9c. 2023 =C3=A0 21:03, Jason Andryuk <jandryuk@gmail.com> a=
 =C3=A9crit :
>
> On Wed, Dec 6, 2023 at 11:44=E2=80=AFAM Juergen Gross <jgross@suse.com> w=
rote:
> >
> > On 06.12.23 17:38, Jason Andryuk wrote:
> > > On Wed, Dec 6, 2023 at 9:40=E2=80=AFAM Juergen Gross <jgross@suse.com=
> wrote:
> > >>
> > >> In tools/libs/evtchn/minios.c there are assert()s for the current
> > >> thread being the main thread when binding an event channel.
> > >>
> > >> As Mini-OS is supporting multiple threads, there is no real reason
> > >> why the binding shouldn't be allowed to happen in any other thread.
> > >>
> > >> Just drop the assert()s.
> > >>
> > >> Signed-off-by: Juergen Gross <jgross@suse.com>
> > >> ---
> > >>   tools/libs/evtchn/minios.c | 3 ---
> > >>   1 file changed, 3 deletions(-)
> > >>
> > >> diff --git a/tools/libs/evtchn/minios.c b/tools/libs/evtchn/minios.c
> > >> index 28743cb055..e33ddec7e7 100644
> > >> --- a/tools/libs/evtchn/minios.c
> > >> +++ b/tools/libs/evtchn/minios.c
> > >> @@ -195,7 +195,6 @@ xenevtchn_port_or_error_t xenevtchn_bind_unbound=
_port(xenevtchn_handle *xce,
> > >>       int ret;
> > >>       evtchn_port_t port;
> > >>
> > >> -    assert(get_current() =3D=3D main_thread);
> > >>       port_info =3D port_alloc(xce);
> > >
> > > If multiple threads are allowed, does port_list need to gain a lock
> > > protecting it?
> >
> > I thought of that, too.
> >
> > The answer is: maybe
> >
> > Any other list operation on the list isn't protected by an assert(), so
> > technically there is no real new aspect added in this regard.

I read this as "The others are not protected so let's remove all the
protections"
which sounds really wrong to me.
At least with the existing ASSERT()s there is a chance a user would hit the=
m.

Without any, how would a user be able to know that they are mixing threads?
Where is it documented?

>
> Yes.
>
> > I believe adding a lock would make sense, but it is orthogonal to this
> > patch.
>
> The assert() feels like it was an attempt to avoid introducing
> locking, so I'm not sure it is really orthogonal.

+1. I agree this is not orthogonal.

>
> I was kinda waiting to see if anyone else would lend an opinion.
>
> Since the asserts haven't been tripping there doesn't seem to be an
> issue with the code as-is, so:

The goal of an ASSERTs() is really to never trip in normal circumstances.
So the fact nobody complained until now is a sign that they are working :).

The right course of action is to add more, not less. If there is a problem
with the existing ASSERT(), then the condition should either be updated
as we switch to proper locking.

Cheers,

--=20
Julien Grall

