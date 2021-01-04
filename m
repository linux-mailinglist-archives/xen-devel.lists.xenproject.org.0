Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92782E9BE5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:22:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61416.108062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTYY-00025x-LC; Mon, 04 Jan 2021 17:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61416.108062; Mon, 04 Jan 2021 17:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTYY-00025T-Gl; Mon, 04 Jan 2021 17:22:10 +0000
Received: by outflank-mailman (input) for mailman id 61416;
 Mon, 04 Jan 2021 17:22:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=25yB=GH=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1kwTYX-00025O-QX
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:22:09 +0000
Received: from MTA-10-1.privateemail.com (unknown [68.65.122.30])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06bf4594-89fc-4331-bcd1-b2a41aa5e311;
 Mon, 04 Jan 2021 17:22:09 +0000 (UTC)
Received: from MTA-10.privateemail.com (localhost [127.0.0.1])
 by MTA-10.privateemail.com (Postfix) with ESMTP id 2A67B60052
 for <xen-devel@lists.xenproject.org>; Mon,  4 Jan 2021 12:22:08 -0500 (EST)
Received: from mail-wm1-f53.google.com (unknown [10.20.151.246])
 by MTA-10.privateemail.com (Postfix) with ESMTPA id E7AFC60047
 for <xen-devel@lists.xenproject.org>; Mon,  4 Jan 2021 17:22:07 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id r4so20061755wmh.5
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jan 2021 09:22:07 -0800 (PST)
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
X-Inumbo-ID: 06bf4594-89fc-4331-bcd1-b2a41aa5e311
X-Gm-Message-State: AOAM532zyb9LVyIPqJhTQDOrlepCJ2G5eCsRAIQM1CDAVK58A89DCXn5
	Bw8nbAW3EwVe1RNS8xP1bA27QGXDytxzqlzhBJM=
X-Google-Smtp-Source: ABdhPJzaNhFmx1gdqwih2MCGEsLzkNkUaaY+wzlZphjinjs0yRWej0Cuv4II+K84UsoOQnfwybq2ntBOYTlTFiEs6iM=
X-Received: by 2002:a1c:4843:: with SMTP id v64mr27735338wma.186.1609780926508;
 Mon, 04 Jan 2021 09:22:06 -0800 (PST)
MIME-Version: 1.0
References: <7536d7bd92337933e6e23be359ca981deab50016.1609699565.git.tamas@tklengyel.com>
 <0405f97f-ee4f-6379-c0f4-3db149386bc2@citrix.com>
In-Reply-To: <0405f97f-ee4f-6379-c0f4-3db149386bc2@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 4 Jan 2021 12:21:30 -0500
X-Gmail-Original-Message-ID: <CABfawhnGC2S3StnzcCkS0bQr3h_J1=i6LE7ma8vkZYJK_WoQuQ@mail.gmail.com>
Message-ID: <CABfawhnGC2S3StnzcCkS0bQr3h_J1=i6LE7ma8vkZYJK_WoQuQ@mail.gmail.com>
Subject: Re: [PATCH] x86/mem_sharing: silence ubsan warning
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	George Dunlap <george.dunlap@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Jan 4, 2021 at 7:31 AM Andrew Cooper <andrew.cooper3@citrix.com> wr=
ote:
>
> On 03/01/2021 18:47, Tamas K Lengyel wrote:
> > Running Xen compiled with UBSAN produces a warning for mismatched size.=
 It's
> > benign but this patch silences the warning.
> >
> > Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> > ---
> >  xen/arch/x86/mm/mem_sharing.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharin=
g.c
> > index c428fd16ce..6920077dbf 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1638,7 +1638,10 @@ static int fork_hap_allocation(struct domain *cd=
, struct domain *d)
> >      rc =3D hap_set_allocation(cd, mb << (20 - PAGE_SHIFT), &preempted)=
;
> >      paging_unlock(cd);
> >
> > -    return preempted ? -ERESTART : rc;
> > +    if ( preempted )
> > +        rc =3D -ERESTART;
> > +
> > +    return rc;
>
> I can't repro this at all, even with some simplified examples.
>
> -ERESTART is int (it is an enum constant in C files), as is rc, so I
> can't spot a legitimate UBSAN complaint here.
>
> Which compiler, and/or do you have the exact complaint available?

It was with gcc-7 on debian buster but can't recreate it after a make
clean & make, it's now gone =C2=AF\_(=E3=83=84)_/=C2=AF, seems like it was =
just a bad
build. Sorry for the noise.

Tamas

