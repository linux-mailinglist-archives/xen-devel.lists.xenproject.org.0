Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 763BB826D34
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:56:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663444.1033377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMoEF-0001ys-Jy; Mon, 08 Jan 2024 11:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663444.1033377; Mon, 08 Jan 2024 11:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMoEF-0001wG-H2; Mon, 08 Jan 2024 11:55:39 +0000
Received: by outflank-mailman (input) for mailman id 663444;
 Mon, 08 Jan 2024 11:55:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMoEE-0001wA-Bo
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:55:38 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5733d6e-ae1c-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 12:55:36 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a28fb463a28so162609166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 03:55:36 -0800 (PST)
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
X-Inumbo-ID: d5733d6e-ae1c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704714935; x=1705319735; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAniKut4uEARyJKjz0n6VGdNJHr94yuj5i+tiN2adPI=;
        b=hebK/DirheazOb7vcbIMjCWBTqEnH118gvPA5lfmEKNnZ7beHPHP/3UcmAW2DsRtwz
         vLPSSTkyOOYcvF7pF28hWXygarjS60WT0Kf1FIQBKshEnpfg+jbOt1GJKQFUDBTNFnOD
         zaMWyXQmBcY+qgyJvtTraVZO1XOHk3TmLrJNAwXTBM2MeZmvD55M3N/ZNZo/EPx38rt7
         ZwejJED5+Z+6Y7DP6RtxtCfG3tefDRMbsd/OkGcRE/5V4Nfc09tgCd6KE8Gs/eOkcB4K
         TqLG9QjqhX5hT6Zi60lFCujgGiX2bs+RbNuMupmBiFEDDYkXL/ydX8k+2u5OGHogqWCS
         3rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704714935; x=1705319735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAniKut4uEARyJKjz0n6VGdNJHr94yuj5i+tiN2adPI=;
        b=TGZsGAxsFwv2Ulyo/iHUFBt+QkhCAO+nfqqz0P4yb4YAuaNyWnGDuxHtyIxdm74UIS
         rjcVCdTmWgv94wivy4Ec5ugggOd8Wl83gFyt8PLF7rfEHIDVNR7QFDT5T5tMTkmEapEd
         5T6kYVpYPU+pNaKg8EAxBjzxxPRQOtHQwa+u5EWEAsRbcmdUm3hIwPfxE79h6zy2hjpC
         19FN4ckV3Ee7hkIKusoAe4hJoyGKBne/FdIFY0T6OmrtnBb9rnYcuXM69XkipmxzC7ao
         tmL9rTugEA2oJGwxyAl/eRTi8sF/fY2Qz9ZbgE+892jPseatUPq1Uawihxoda6b3oEIj
         bnaQ==
X-Gm-Message-State: AOJu0YzJwdhVM4orr/hue540IoXh7vV8fFbe3d1vK7kanTyjqSxkjyM/
	rDsAlWki21e3aLuubLUITgkNSQEkPtGDg8hbXC9XwcKL3olWcD89Ot3pwGKyNgXTfQ==
X-Google-Smtp-Source: AGHT+IH1g/M/0tHzdGO8aozGkNspQM+d2ZKRrlmirAHrIYTWYCBRXMMiUEYTL74mYiNqpzBCCZM1f7NZjqmKvjth7HM=
X-Received: by 2002:a17:906:6409:b0:a27:ee21:58c with SMTP id
 d9-20020a170906640900b00a27ee21058cmr1268598ejm.155.1704714935315; Mon, 08
 Jan 2024 03:55:35 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-4-carlo.nonato@minervasys.tech> <046e9949-d126-42b1-90a6-12af540d63bf@xen.org>
 <CAG+AhRWm4N7GV3HfkTNCvXQw7-6Woq=+zBqdHAgN=-PgGr-WRg@mail.gmail.com>
 <0905b0f4-9a5e-48c7-8764-58cdd440130f@xen.org> <CAG+AhRVL8_YMkw+Z4EcTLZgM7m10+9DToSkaeNLMaFY3gcng7Q@mail.gmail.com>
 <4f8b3a59-c277-4f2e-a9de-82ea9ce2eda0@xen.org> <CAG+AhRUE8MQjW=1rLsp79=MisUtjiB-5daXYz8S6-8JX6kAosA@mail.gmail.com>
 <24e9adad-0f3d-4e0f-8202-33992718e9c3@xen.org>
In-Reply-To: <24e9adad-0f3d-4e0f-8202-33992718e9c3@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 12:55:24 +0100
Message-ID: <CAG+AhRWJbaUEFgm7rTTUT+Qz4=xSFXxLgBFRGbgStRNoP7MxKQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] xen/arm: add Dom0 cache coloring support
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 8, 2024 at 12:44=E2=80=AFPM Julien Grall <julien@xen.org> wrote=
:
>
>
>
> On 08/01/2024 11:04, Carlo Nonato wrote:
> > Hi Julien,
> >
> > On Mon, Jan 8, 2024 at 11:25=E2=80=AFAM Julien Grall <julien@xen.org> w=
rote:
> >>
> >> Hi Carlo,
> >>
> >> On 08/01/2024 10:06, Carlo Nonato wrote:
> >>>> One of the reason is at least in the dom0less case, you will overrid=
e
> >>>> the value afterwards.
> >>>
> >>> In that case I need to allocate the array before parsing the string.
> >>> I allocate a full array then the string is parsed and the actual size=
 is found
> >>> at the end of this phase. Knowing the actual size would require two p=
arsing
> >>> stages. Yes I'm wasting a bit of memory by oversizing the array here.=
 Is it
> >>> a problem?
> >>
> >> While wasting memory is indeed not nice. This wasn't the main reason o=
f
> >> this comment.
> >>
> >> The reason is that you seem to set d->num_lcc_colors will but will nev=
er
> >> be read before it gets overwritten. Looking again at the code, you are
> >> also assuming parse_colors() will always take an array of nr_colors.
> >
> > Ok, I think I understood, but that happens only in dom0less case becaus=
e
> > d->num_llc_colors is overwritten after parsing. In other cases it's ok =
to set
> > it there. Anyway I can move the assignment out of the function if that =
is
> > clearer.
> >
> >> It would be better if parse_colors() takes the maximum size of the arr=
ay
> >> in parameter. This would harden the code and it makes more sense for
> >> domain_alloc_colors() to set d->num_lcc_colors.
> >
> > I don't understand this. parse_colors() must take only arrays of nr_col=
ors
> > size (the global, maximum number of colors), otherwise the parsed strin=
g
> > config could exceed the array size. Since we don't know in advance the =
real
> > size before parsing, I think it's better to pass only arrays that are a=
lready
> > allocated with the maximum size.
>
> My concern is there is a disconnect. From the code, it is not obvious at
> all that parse_colors() only want to accept an array of nr_colors. If
> you pass an extra argument (or re-use the one you pass) for the array
> size and use within the code, then it makes more obvious that your array
> is always the correct size.
>
> At least to me, this is a good practice in C to always pass the array
> and its size together (other language have that embedded). But I can
> appreciate this is not view like that for everyone. The minimum would be
> to document this requirement in a comment

Ok got it. Thanks for the explanation.

> > Doing as you said I would still pass nr_colors as the maximum size, but=
 that
> > would be strange since the global would still be accessible.
>
> I don't really see the problem here. Your code doesn't need to use the
> global variable.
>
> > If domain_alloc_colors() setting d->num_llc_colors is so confusing,
> > I will just move the assignment after the function call.
> >
> >> Also, I just noticed you have a global variable named nr_colors and th=
e
> >> function parse_colors() takes an argument called *num_colors. This is
> >> quite confusing, can we have better name?
> >>
> >> Maybe rename nr_colors to nr_global_colors and and num_colors to
> >> nr_array_colors?
> >
> > I agree with the fact that naming is confusing. I would opt for max_nr_=
colors
> > for the global.
>
> I am fine with that.
>
> Cheers,
>
> --
> Julien Grall

