Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A8F9C0C0F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 17:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832116.1247513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t95ox-0004mm-PW; Thu, 07 Nov 2024 16:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832116.1247513; Thu, 07 Nov 2024 16:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t95ox-0004kG-Md; Thu, 07 Nov 2024 16:57:23 +0000
Received: by outflank-mailman (input) for mailman id 832116;
 Thu, 07 Nov 2024 16:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FYad=SC=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t95ox-0004kA-07
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 16:57:23 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5934c284-9d29-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 17:57:18 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539e63c8678so1276711e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 08:57:18 -0800 (PST)
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
X-Inumbo-ID: 5934c284-9d29-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1sZjEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU5MzRjMjg0LTlkMjktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTk4NjM4Ljg4MDY3Niwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1730998638; x=1731603438; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxt3mGwCtGS1IdHVDEZ8tA7dhZ6/D/HzwCVdK+BSeMg=;
        b=SBdgVjVLKFG1q3EA/v64LB6PGyH90kUI6zUCvMzc9P9Jn5U6zg4nKHGolnlTzyZBSZ
         pEoXlQouytVDuGsCRZniww71dqH5wYAHdyEp7q7PjMhwhannhLLY1yQw17PTIBU8/XSG
         X+l31Dho2sbYAdji2uYPM8Pm8WSYMdIbGZBlUadUva/oGyIfCD3HcxJ8evKOeQQZim/y
         kn2WBrDKhrtF/gYUsVAzceDuYwvJDpipS8qtv8mn+cdlbG3uIc1YmUv1DLLBbcySlTRo
         aFKHI7Vn7G5MJwXwWx5pRQEUCquOqyunbSFGz38rfHlPO4WyQgt4BZwEJsfcG0F+6tau
         90jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730998638; x=1731603438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxt3mGwCtGS1IdHVDEZ8tA7dhZ6/D/HzwCVdK+BSeMg=;
        b=Pb4+FbBdoRhikBF9/+oCqrJuGIavzyCcfTE/twIhxve42RLNiE0P7D5NUSZxA82NWB
         dOTloxz3ipxhcxQoRaoI2d3tLh7PtOnJBwmAXYCiox7T/wypVWq8tcANCU5RuHNjckla
         X88kWh5rIsd+fNB0ocKHaF70MrjCktHODdzRbQmyHY+jSub/4xrehsblXf5lNM9VH7VH
         0RxxF5iC86xQgGBHHRZP7lWoMn35aBL5hqtpJr9tybumkT654EgMXmNYC5P9N5hh0Mv9
         jVuYxQYWhDcq5fG5SrRFi6vXruEmyDljyS7QPzcAP8FeyjZkEhSNC2Bq/4AZ7eTkmWGX
         DToA==
X-Forwarded-Encrypted: i=1; AJvYcCWxvFxgo/AZDy8Dt9fxOvnhIcCIvTWHHLgRmWKG9eZ/IgUruSyP0p3be4ekwZif8I0HZliTvtYzF7c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQZQkwYgHqpSMeRaWIx2lilcKQv1z1wh7zwjeFIc3CbCDa4YTW
	Fa5B0mZbc5PZYWmq7MTL4NeTbsrpME0Lwc26IDwxhgYHapkhf79iv9FP7rVKCjI9mYtua2AmxFr
	BW46Hcn5wjwj6Rw1ApraM+xqMl9x05MIoZ3n3Ug==
X-Google-Smtp-Source: AGHT+IFUIMIo/KQddU6V+M3es5kQWT37nVWea833ApWmPd5ZI1y3OOn4M692WPr+R9Kg7XfOEowlU3GxDNHSblWjoWM=
X-Received: by 2002:a05:6512:3ba4:b0:52c:9468:c991 with SMTP id
 2adb3069b0e04-53d65de495bmr12150660e87.14.1730998638091; Thu, 07 Nov 2024
 08:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
 <20241025095014.42376-2-carlo.nonato@minervasys.tech> <6e6f8e2a-ea16-4b48-ac70-23e72ade2b1a@suse.com>
 <CAG+AhRUtmpB1uSd5kW7zNjyDdmBcVCta9t5Qdu6ND+RYx3VUfQ@mail.gmail.com> <3ee6d76d-25ee-4c14-a71a-e93d06812320@suse.com>
In-Reply-To: <3ee6d76d-25ee-4c14-a71a-e93d06812320@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 7 Nov 2024 17:57:06 +0100
Message-ID: <CAG+AhRUEw035DVZtxGWuVkSx3aY5dkBacjZ4AC2N0jysa4fvKg@mail.gmail.com>
Subject: Re: [PATCH v9 01/13] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Nov 7, 2024 at 10:05=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 06.11.2024 17:09, Carlo Nonato wrote:
> > On Tue, Nov 5, 2024 at 4:46=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 25.10.2024 11:50, Carlo Nonato wrote:
> >>> --- a/xen/common/Kconfig
> >>> +++ b/xen/common/Kconfig
> >>> @@ -71,6 +71,9 @@ config HAS_IOPORTS
> >>>  config HAS_KEXEC
> >>>       bool
> >>>
> >>> +config HAS_LLC_COLORING
> >>> +     bool
> >>> +
> >>>  config HAS_PIRQ
> >>>       bool
> >>>
> >>> @@ -516,4 +519,23 @@ config TRACEBUFFER
> >>>         to be collected at run time for debugging or performance anal=
ysis.
> >>>         Memory and execution overhead when not active is minimal.
> >>>
> >>> +config LLC_COLORING
> >>> +     bool "Last Level Cache (LLC) coloring" if EXPERT
> >>> +     depends on HAS_LLC_COLORING
> >>> +     depends on !NUMA
> >>
> >> Instead of this dependency, wouldn't it be more natural to suppress th=
e
> >> setting of HAS_LLC_COLORING by an arch when NUMA is on?
> >
> > So moving the "depends on" in the HAS_LLC_COLORING definition? Yes I be=
lieve
> > it would be better.
>
> No. Putting it on an option without prompt will, iirc, only cause a warni=
ng
> when violated, but will otherwise have no real effect. The "select" of
> HAS_LLC_COLORING wants to become dependent upon !NUMA, until that combina=
tion
> was made work.

Ok, got it.

> >>> --- /dev/null
> >>> +++ b/xen/common/llc-coloring.c
> >>> @@ -0,0 +1,111 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +/*
> >>> + * Last Level Cache (LLC) coloring common code
> >>> + *
> >>> + * Copyright (C) 2022 Xilinx Inc.
> >>
> >> Does this need updating (if it can't be dropped)?
> >
> > I don't remember what's the current policy for these copyright lines.
> > Do you still use them? If they are used, should they reflect the histor=
y
> > of the revisions of the patch series? I mean, in v1 it was "2019 Xilinx=
 Inc."
> > 2023-2024 would then be MinervaSys.
>
> I don't know what the policy is either. I think it can be there or it can
> be omitted. Yet if it's there, I think it wants to be accurate at least a=
t
> the time a new file is being added. (These lines usually aren't updated
> when later changes are made to the files.)

Ok, makes sense.

> >>> +void __init llc_coloring_init(void)
> >>> +{
> >>> +    unsigned int way_size;
> >>> +
> >>> +    if ( llc_size && llc_nr_ways )
> >>> +    {
> >>> +        llc_coloring_enabled =3D true;
> >>> +        way_size =3D llc_size / llc_nr_ways;
> >>> +    }
> >>> +    else if ( !llc_coloring_enabled )
> >>> +        return;
> >>> +    else
> >>> +    {
> >>> +        way_size =3D get_llc_way_size();
> >>> +        if ( !way_size )
> >>> +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways=
' missing\n");
> >>> +    }
> >>> +
> >>> +    /*
> >>> +     * The maximum number of colors must be a power of 2 in order to=
 correctly
> >>> +     * map them to bits of an address.
> >>> +     */
> >>> +    max_nr_colors =3D way_size >> PAGE_SHIFT;
> >>
> >> This discards low bits of the quotient calculated above, bearing a cer=
tain
> >> risk that ...
> >>
> >>> +    if ( max_nr_colors & (max_nr_colors - 1) )
> >>> +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_=
nr_colors);
> >>
> >> ... this panic() wrongly doesn't trigger.
> >
> > Yes, but I don't care if way_size isn't a power of 2.
>
> Well, you may not care, but imo the resulting configuration ought to refl=
ect
> what was requested on the command line (maybe unless e.g. documentation
> explicitly says otherwise). If way_size has low bits set, that wouldn't b=
e
> the case.

Ok.

> Jan

- Carlo

