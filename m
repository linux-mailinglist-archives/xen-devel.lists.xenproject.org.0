Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685D9D4E11
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 14:48:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841513.1257001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE7XI-0006oz-9L; Thu, 21 Nov 2024 13:47:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841513.1257001; Thu, 21 Nov 2024 13:47:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE7XI-0006ms-6f; Thu, 21 Nov 2024 13:47:56 +0000
Received: by outflank-mailman (input) for mailman id 841513;
 Thu, 21 Nov 2024 13:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn03=SQ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tE7XG-0006mk-Mf
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 13:47:54 +0000
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [2607:f8b0:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31bcffb4-a80f-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 14:47:49 +0100 (CET)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3e5ffbc6acbso570398b6e.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 05:47:49 -0800 (PST)
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
X-Inumbo-ID: 31bcffb4-a80f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjoyMzUiLCJoZWxvIjoibWFpbC1vaTEteDIzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMxYmNmZmI0LWE4MGYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTk2ODY5LjIzNjU1Nywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1732196868; x=1732801668; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lktt4rpgGO68szIijmKgn4n1uRFXqIXG3qCErjJvxvM=;
        b=EVdTHVt+bPCCpSkHAywydrwRCkzBJMP4uRE9oHJM6QwNZkAsq3JxOOEmGdpGr49kcE
         /XF65569N13KtDl2UVtgEtXncdiFP/viXEhMXHW33WDJlz34pULtb1h4JsOYPRCj55NE
         Z85ArGef+UZQf8bKpAfyDQK4tWB9+QqXLc1HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732196868; x=1732801668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lktt4rpgGO68szIijmKgn4n1uRFXqIXG3qCErjJvxvM=;
        b=rWB/2i0wAXSxGkrEgddrC3m9C+a3/Mw6ilamlqZSDqVes775yybWmqyPv1NFy/U2sI
         /6s40af5mX5YI0y21TiKFTQrEsFkGH6rmxX5AYOJ8e5oGV2eqZ1UK+1MywFxsHVI8zl1
         t3oHpUn0cnCRLcQm9K5AdK9MZYaX28voAjm/w4+M3wY6vI5Ba6f6BRY4t8TBotOGS/MR
         tEwWdFew+Nl2WdosMDQYNgqudoT95W79lkQQdvvXST8kF72EkAL0OiK+fubMxOl1VYCX
         VmrxYvXtNjwajfr0qg6k1Qkt5vPqa0q6TRRGGWS/LYEXCGj266LvFqi0QZjGcsLDhhkF
         W7nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyrFqJ1BvR3sIq3moPYM47mGrz/C1TLkdAh+caJWZA112qIQR5KCJtiZZG7Jvoxb/0Sl2oXnNd+vo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5OoqkvAzsib1LaoHa9RUU5vpvH/tjXYb6S3MaTzCAgzO/5fln
	Anqx9T2Wekl403FYhDlNURiPpy/VaxAHB3qUlsuz3jDsY+XdgkvkHsWYE5DYo9FgL3Q8/Mxnuzs
	ewu6GvaUcGM86sy2u4c7uEWqshdUBVuY8LS4w7A==
X-Gm-Gg: ASbGncvaYqFICJayTVt0oQ+Ea5g5plLWxt0N/SAHoLeaIOHCSBzuFC8f+aQSHcV/h9n
	pRl8exD3XvtSc66H0DSXvLRIGu5rdwTSjiQ==
X-Google-Smtp-Source: AGHT+IHYMF04+CLdS72p7w8qGSmoBkMwDkkJSxlS2G8gM46ZEjEKol1CSouIa+nuVqZlgo7pLSx6uPM8McCC1l3JYpw=
X-Received: by 2002:a05:6808:f11:b0:3e5:c7f8:ad7d with SMTP id
 5614622812f47-3e7eb7d4648mr6547344b6e.39.1732196867915; Thu, 21 Nov 2024
 05:47:47 -0800 (PST)
MIME-Version: 1.0
References: <e470822f190a41b2f1600821b81d7ad158ed33db.camel@gmail.com>
 <227db2a2-d36f-453e-8886-b8ef0d5f9616@citrix.com> <CACHz=ZjnfL_MorLcwduhJpUjFLX2y3KtQE8Pd4s=V68OgiV_rA@mail.gmail.com>
 <21cfb919-9150-4276-b613-d972a4b1d864@suse.com>
In-Reply-To: <21cfb919-9150-4276-b613-d972a4b1d864@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 21 Nov 2024 13:47:36 +0000
Message-ID: <CACHz=Zhf6Gh62eeWj-jBTcMrOpa1g+_dC-uT-D8vF2BLbFwX0Q@mail.gmail.com>
Subject: Re: Xen 4.20 release schedule
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, oleksii.kurochko@gmail.com, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	Community Manager <community.manager@xenproject.org>, 
	"committers @ xenproject . org" <committers@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 1:40=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.11.2024 13:53, Frediano Ziglio wrote:
> > On Wed, Oct 30, 2024 at 1:25=E2=80=AFPM Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
> >>
> >> On 21/10/2024 1:02 pm, oleksii.kurochko@gmail.com wrote:
> >>> Hello everyone,
> >>>
> >>> As there were no objections to the proposed release schedule
> >>> (https://lore.kernel.org/xen-devel/CAMacjJxEi6PThwH2=3DNwG3He8eQn39ai=
axZCw3bQF7i4YcmjuNw@mail.gmail.com/
> >>> ), I've updated the wiki with the schedule for Xen 4.20 release
> >>> (https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes), an=
d
> >>> it is now accessible from
> >>> https://xenbits.xen.org/docs/unstable-staging/support-matrix.html.
> >>
> >> I have a blocker to raise (against myself...) and no good idea of how =
to
> >> proceed.
> >>
> >> The for_each_bit work has a unexpected bug.
> >>
> >>     for_each_bit ( ... )
> >>     {
> >>         if ( ... )
> >>             break;
> >>     }
> >>
> >> will fall into an infinite loop.  This is caused by for_each_bit()
> >> hiding a double for() loop, in order to declare two scope-local
> >> variables of different types.
> >>
> >> The two variables are one copy of the source expression (really quite
> >> important to keep), and one unsigned int iterator (improved optimisati=
on
> >> capability by not using a wider-scope variable).
> >>
> >> Options are (off the top of my head)
> >>
> >> 1) Always take the iterator from outer scope
> >> 2) Iterator always the same type as the source expression
> >> 3) Figure out some way of expressing "once" in the outer loop
> >>
> >> Or anything else that I've missed.
> >>
> >> ~Andrew
> >>
> >
> > Something like
> >
> > #define for_each_set_bit(iter, val)                     \
> >     for ( typeof(val) __v =3D (val), __c=3D1; __c; __c=3D0)   \
> >         for ( unsigned int (iter);                      \
> >               __v && ((iter) =3D ffs_g(__v) - 1, true);   \
> >               __v &=3D __v - 1 )
> >
> > ?
>
> Hmm, right, but then we don't even need a 2nd variable, do we?
>
> #define for_each_set_bit(iter, val)                     \
>     for ( typeof(val) __v =3D (val); __v; __v =3D 0 )       \
>         for ( unsigned int (iter);                      \
>               __v && ((iter) =3D ffs_g(__v) - 1, true);   \
>               __v &=3D __v - 1 )
>
> Jan

In theory it should work too, not sure if the variable aliasing would
compromise the assembly output. We depend on the compiler doing some
optimizations.

Frediano

