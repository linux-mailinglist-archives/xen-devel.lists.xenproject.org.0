Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76821AED433
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 08:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028849.1402521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW7ax-0002lu-HC; Mon, 30 Jun 2025 06:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028849.1402521; Mon, 30 Jun 2025 06:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uW7ax-0002kW-Dm; Mon, 30 Jun 2025 06:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1028849;
 Mon, 30 Jun 2025 06:02:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nOrf=ZN=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uW7aw-0002kQ-2q
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 06:02:22 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c86ebf74-5577-11f0-a312-13f23c93f187;
 Mon, 30 Jun 2025 08:02:20 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-553bcf41440so4073812e87.3
 for <xen-devel@lists.xenproject.org>; Sun, 29 Jun 2025 23:02:20 -0700 (PDT)
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
X-Inumbo-ID: c86ebf74-5577-11f0-a312-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751263339; x=1751868139; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gn/KyGyri6kzGvax5/vbwEA0eNlYQ1eBcq1jD4zRnNU=;
        b=UfZSf4uVCdSDDByA8FjSscYZZUO9gVRAZ2EDzsWCQ2KQJhE4rPN7cjdzvOHpDle279
         sJoRsOePZ7h9zveO4M6dM6ZZ72OPXEm9Zb2uO6AKXVZp7zf0uQI+0Qj5xIsBsbKx3hLG
         0o5+llMjkKFpF9NUogVM/16fil53jYDUvQXCWW2Jv6kWoJAKclGajCNqoigY8AihkeRL
         78v7A+MUPVSb0iaoNcNeUmvH5VgMOtVD6yJ/d88X6lxnO94VaL1rb+g0lNyv1PIGW7ZG
         fEcnImV4mniLoll41xkqORXBK3GcgSjUPpS9IEStH6+/DBfEPkODjhOLFgBo+EpkfTs/
         Q9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751263339; x=1751868139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gn/KyGyri6kzGvax5/vbwEA0eNlYQ1eBcq1jD4zRnNU=;
        b=p5AqPXMul3bAxJe9Lzm56riYswOulCqdlXY+I0P4K6QSZvEPp4L0Bm7XHWog1jkVOU
         A4ywl8TE1pYyajeFKOIRY+9u3QCjvkPwbp+AgQ8CVqDUxTp0qZcfVbs55T6/7F+FDqv1
         GEhd02anZosbfvS7pRfqqzyOHduf2tTzA9gfqIbi3lJ8spTo7Ut4+PWkdpMBol3tsB98
         GixCD5ZAS+aQuN7OmLHBviUC4K3dzh+N3HYp/i0oESTxsrY46uW37/Lok3Tl2AjOvhzO
         J5bBdHpZT7kwb61UZgDIHgCBqwWgQmzeBJt/sALoCM1C3PWLxKsCMWZHe+WSXUJFHp9H
         gJwA==
X-Gm-Message-State: AOJu0Yzf6BEnncSPqTJ4mAx33UnyNk144Rgg/s6oEptabbniWcmf4NmO
	5nnmE14XoAiiaqiT5yP3NTInIUHC/Sl7Lh64BLHLnXnZqm45l5LsNWH8PXPLbadok1pXhR94ljy
	WrCZ3Yh9e4bmCxVCz7K//6g3SIPUDE7s=
X-Gm-Gg: ASbGncvLdwuy1PfWrstV2mOk/Kq0NOOimkeU72sbxydIx2fLn0niYTYhl0yQcs2Vt8N
	03sUCdVn1vJeBmAv9Cvr4s7yvEMLk0Mni7YGk+FHwz0aYADSWQ7Lx36/Vj+V0TyW61P0r1nudJ+
	Po8IPsyd6bpUnhro9lpZh0UiFGxy/UYIAYKnwjnYrgRwt1qDTSU+fU
X-Google-Smtp-Source: AGHT+IGR8KjOiHt6e0rM5kNk9vPKTlSXZufIwUvBD7gOVgJTmSawcpAGdvbDB1GehhZqPfKlh9i13iP9oOFs6m13zAs=
X-Received: by 2002:a05:6512:398e:b0:554:fa07:c56 with SMTP id
 2adb3069b0e04-5550b9efd5fmr3453739e87.26.1751263339182; Sun, 29 Jun 2025
 23:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1751020456.git.mykola_kvach@epam.com> <401d3745a295812fef14a22b0c2a3c6017d588c1.1751020456.git.mykola_kvach@epam.com>
 <f891958a-35cf-4c6d-b1b9-51d34559f221@xen.org>
In-Reply-To: <f891958a-35cf-4c6d-b1b9-51d34559f221@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Mon, 30 Jun 2025 09:02:08 +0300
X-Gm-Features: Ac12FXy2KdPwV4sSQcQCA3ik-SQUxKPJhrOUHKibSAQO4XS0CponfUZ3Zz-Razw
Message-ID: <CAGeoDV9rDPj3ixbQuv2ACoECcPNg8iJH_mg_5OWC7meZ_panAw@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] SUPPORT.md: Add entry for guest PSCI
 SYSTEM_SUSPEND support
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

On Sat, Jun 28, 2025 at 9:27=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 27/06/2025 11:51, Mykola Kvach wrote:
> > From: Mykola Kvach <mykola_kvach@epam.com>
> >
> > Document support for the optional PSCI SYSTEM_SUSPEND function, exposed
> > via the virtual PSCI (vPSCI) interface to guests.
> >
> > This allows non-hardware domain guests (domUs) to initiate system suspe=
nd
> > operations via PSCI calls. The feature is currently marked as Experimen=
tal.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in v5:
> > - Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls=
,
> >    which is not relevant for SUPPORT.md
> > - Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic gu=
est
> >    PSCI info; guest PSCI support was documented in a separate patch
> > ---
> >   SUPPORT.md | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/SUPPORT.md b/SUPPORT.md
> > index f0b5718e84..659b9c3052 100644
> > --- a/SUPPORT.md
> > +++ b/SUPPORT.md
> > @@ -956,6 +956,13 @@ by hwdom. Some platforms use SCMI for access to sy=
stem-level resources.
> >
> >       Status: Supported
> >
> > +### ARM: Guest PSCI SYSTEM_SUSPEND support
>
> You are already adding a Guest PSCI section in [1]. I would rather not
> another section just for SYSTEM_SUSPEND. This would make more difficult
> to know what part of PSCI is supported.
>
> Instead, I would tweak the merge the two patches and tweak the wording
> to have something like:
>
>    Status, Mandatory: Supported
>    Status, MIGRATE_INFO_TYPE: Supported
>    Status, SYSTEM_SUSPEND: Experimental

If you don't mind, I'd prefer to keep the two patches separate rather than
merging them. In my view, patch [1] is a generic and straightforward change
that can be merged easily, with the remarks you've proposed here.
The suspend-related part depends on logic introduced in this PR, which stil=
l
has some issues and may take more time to finalize and get reviewed.

>
> Also, I will comment directly here:
>
>  > Emulated PSCI interface exposed to guests. Supports all mandatory
> functions from PSCI versions 0.2 and 1.0, as well as the optional
> MIGRATE_INFO_TYPE
>
> Xen is supporting PSCI 1.1 which is backwards compatible up to 0.2. But
> effectively, we don't expose 0.2 nor 1.0.
>
> So I would reword to:
>
> Emulated PSCI interface exposed to guests. We support all mandatory
> functions of PSCI 1.1. See below for the list of optional PSCI call
> implemented and their status.

Sure, I'll rephrase it as suggested =E2=80=94 thank you for the clarificati=
on.

Best regards,
Mykola

>
> Cheers,
>
> [1]
> https://lore.kernel.org/all/20250627053313.2233826-1-xakep.amatop@gmail.c=
om/
> --
> Julien Grall
>

