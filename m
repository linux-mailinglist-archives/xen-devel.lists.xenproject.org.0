Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82781D682
	for <lists+xen-devel@lfdr.de>; Sat, 23 Dec 2023 21:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659768.1029509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rH8uA-0006Lj-OE; Sat, 23 Dec 2023 20:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659768.1029509; Sat, 23 Dec 2023 20:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rH8uA-0006J8-Kw; Sat, 23 Dec 2023 20:47:30 +0000
Received: by outflank-mailman (input) for mailman id 659768;
 Sat, 23 Dec 2023 20:47:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcCX=IC=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1rH8u9-0006J2-5X
 for xen-devel@lists.xenproject.org; Sat, 23 Dec 2023 20:47:29 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ab30e71-a1d4-11ee-9b0f-b553b5be7939;
 Sat, 23 Dec 2023 21:47:26 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-55359dc0290so4997711a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 23 Dec 2023 12:47:26 -0800 (PST)
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
X-Inumbo-ID: 7ab30e71-a1d4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703364445; x=1703969245; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqdbTnxB+K1sYUu2juHLYf+cK7eARVSiuTH1PFkYro0=;
        b=lWAz9bb9OBc4egTY4lwMQO88OmUlqRMMnDJM4GFmZnznkxC4Sja2CTS5q9jUYWYykV
         2bIFIcCtnOMab7VmS/hP8mOseba6CFBtT7x9+sOcDHLbj2FzPf4Tq6a7X5hyDJZzAPMq
         FyIkyhn9awC8tM4H0LVxWHfZJrpot+ehD/9SlAalV9uYFzjp50K0+tjgfn1Q67ta9S7v
         /YRIVAp9BAPPyG+cA7kXd8AZJ0TY1buM5yGZWD7QKZT7b+xrxPttEgf5Dos0+UIQLAao
         vkkbk93kGTvwWS/uzioYyQVJ1gUvhw8ORqmf3ASpZICowOxGLH6LQtNxy5v9agbDYOMJ
         OhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703364445; x=1703969245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqdbTnxB+K1sYUu2juHLYf+cK7eARVSiuTH1PFkYro0=;
        b=K12HVtgfcxkvbrNWcIA6f2pXrIg/JBfPwLC6seHmRGOTwq8RBmOSK4mF5aP1wCvjYi
         99MPEJW80TCCoXQ3qaZ16UsFLEA0nvxhsw+SwoVn/Nzi5enenywvFC2vhyZ9Zc+jThVT
         C97OCWHfTYlWx+RpWCxDrqTURIHHd4HtvzOf7wXxYphi2b+1EtpK8DzHf40hDxRtir/q
         e/xAkNefJGJEA6mQnbqwD+6zfDIKTq+p/Tc2UM7tHdmdQfZSSYpwDfUaF1Q6QDBHNeb2
         KD1utGdU0vj0/Fn9SbWaA4onRMwUY4PSlNY4ysK5VMY2Uuqk2fuVb3Sh1XU3gSfGwMLp
         RVTw==
X-Gm-Message-State: AOJu0Yyoer7XmHRMC9RIFtJQx7fAZ8qbJBrRH1ObbCW47PDc6Fzo/nrR
	Z6/1rmwB5g7sdeWZ72XJEVN9GpkEJCTF+8I98CE=
X-Google-Smtp-Source: AGHT+IGgNHzHZVXwcyD5a6+6CJ9Bm9zH5l2EFHE+3HoWANhVUiJFTz79Y3iNRISxfmx5chBgD0m967kuU6NaYIzYL2w=
X-Received: by 2002:a50:d7dd:0:b0:553:39e3:879a with SMTP id
 m29-20020a50d7dd000000b0055339e3879amr3224161edj.41.1703364445164; Sat, 23
 Dec 2023 12:47:25 -0800 (PST)
MIME-Version: 1.0
References: <580c6c48-9dd5-4296-8696-2b40beac2bc3@suse.com> <5d76295f-0438-4c5d-8b2e-73a1abcc96e6@suse.com>
In-Reply-To: <5d76295f-0438-4c5d-8b2e-73a1abcc96e6@suse.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sat, 23 Dec 2023 12:47:13 -0800
Message-ID: <CACMJ4GbvMhDdgOp=kUeL_+_j2yS_NVU69P8Xh9QYDLUwJ31Eow@mail.gmail.com>
Subject: Re: Ping: [PATCH] Argo: drop meaningless mfn_valid() check
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 17, 2023 at 11:55=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> Christopher,
>
> On 27.11.2023 14:55, Jan Beulich wrote:
> > Holding a valid struct page_info * in hands already means the reference=
d
> > MFN is valid; there's no need to check that again. Convert the checking
> > logic to a switch(), to help keeping the extra (and questionable) x86-
> > only check in somewhat tidy shape.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

>
> much like "Argo: don't obtain excess page references" (with which the one
> here actually also conflicts), this one is awaiting your ack or otherwise=
.
> Note that the other one has now been pending for quite a bit more than a
> year. I hope the same isn't going to happen here ...

Thanks for your patience and the reminders, appreciated and this patch
can be applied.

Christopher


>
> Thanks, Jan
>
> > ---
> > Initially I had this (with less code churn) as
> >
> > #ifdef CONFIG_X86
> >     if ( p2mt =3D=3D p2m_ram_logdirty )
> >         ret =3D -EAGAIN;
> >     else
> > #endif
> >     if ( (p2mt !=3D p2m_ram_rw) ||
> >          !get_page_type(page, PGT_writable_page) )
> >         ret =3D -EINVAL;
> >
> > But the "else" placement seemed too ugly to me. Otoh there better
> > wouldn't be any special casing of log-dirty here (and instead such a
> > page be converted, perhaps right in check_get_page_from_gfn() when
> > readonly=3Dfalse), at which point the odd "else" would go away, and the
> > if() likely again be preferable over the switch().
> >
> > --- a/xen/common/argo.c
> > +++ b/xen/common/argo.c
> > @@ -1421,15 +1421,24 @@ find_ring_mfn(struct domain *d, gfn_t gf
> >          return ret;
> >
> >      *mfn =3D page_to_mfn(page);
> > -    if ( !mfn_valid(*mfn) )
> > -        ret =3D -EINVAL;
> > +
> > +    switch ( p2mt )
> > +    {
> > +    case p2m_ram_rw:
> > +        if ( !get_page_and_type(page, d, PGT_writable_page) )
> > +            ret =3D -EINVAL;
> > +        break;
> > +
> >  #ifdef CONFIG_X86
> > -    else if ( p2mt =3D=3D p2m_ram_logdirty )
> > +    case p2m_ram_logdirty:
> >          ret =3D -EAGAIN;
> > +        break;
> >  #endif
> > -    else if ( (p2mt !=3D p2m_ram_rw) ||
> > -              !get_page_and_type(page, d, PGT_writable_page) )
> > +
> > +    default:
> >          ret =3D -EINVAL;
> > +        break;
> > +    }
> >
> >      put_page(page);
> >
> >
>

