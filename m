Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FADB9F4A49
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 12:48:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858879.1271111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNW3P-0004d5-Ec; Tue, 17 Dec 2024 11:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858879.1271111; Tue, 17 Dec 2024 11:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNW3P-0004bD-By; Tue, 17 Dec 2024 11:47:55 +0000
Received: by outflank-mailman (input) for mailman id 858879;
 Tue, 17 Dec 2024 11:47:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+zK=TK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNW3O-0004Ze-3J
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 11:47:54 +0000
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [2607:f8b0:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd9b5c1f-bc6c-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 12:47:50 +0100 (CET)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a817ee9936so17929135ab.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 03:47:50 -0800 (PST)
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
X-Inumbo-ID: bd9b5c1f-bc6c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734436069; x=1735040869; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxkqG6+sbk5sKBrS2+qvdvRHFQfIeGSH0RGpGDa8dZY=;
        b=kDjPNjXrLf4YsOIgZ/YyHmlzkJiQ27vdAnEtMbBJL4rZLOdVynOSlN/G7fSc73I5BI
         gn+rGOZSmab7x3pyt3gmKnJFPqSHzee75LNSGk1mOtONylD/r2f3qJCdooSjQFWohmWa
         qXTrSK0BAnNyktY0gs3NE1kHJFQFFL2KTfp4tM0EYN5u3wMalxa1IWm4gGUkrmJRrhjN
         zJS6MzpWXOeQD+ab9K+6bJVodYuXjIc5vB6x63gpZ7JEwx+34i1TzGd0YSKRuLI2cbXx
         cU+kKOS+gPF4FKewg01/3JEKKYVarix/jQbNAySnpvDoYI/jODFbUy8Xyh2H4KSTX1mz
         0Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436069; x=1735040869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxkqG6+sbk5sKBrS2+qvdvRHFQfIeGSH0RGpGDa8dZY=;
        b=fA1HkyiM6RVjEArqD/zfPqZ2C0xd3yuyhXhfgKFd/qERYySkJE7dIYThRyaMuKjsfL
         Qz48D+NPEqgs37Ga+DxkdkRpTfvCB4oFNQGd71MiznjJM6UslVb1FDnCuGzSrM1AAnEW
         pPBIlNL7KkcTguavQE7cw2/WfOpGR0DfTsITrBDXjx/2b+mCfHtOnuxVYXrWx4zlzLzv
         niYQUVk6zXGoNzR6QnjtUIrW5j39pkuOoBfvtq1IP79s1bxC6EKpkJnT5fgtDaEMTbcZ
         j84buTXSmxVj05jskn1/oWRhBSuFmkZfBpc9ld2HFY0hPq8RaBzrhDcR6U632No2z7lC
         mjEg==
X-Forwarded-Encrypted: i=1; AJvYcCVEBzwDwmpNqzDWn88/R5PSg8arihsHF9Ze8JEz2ZS4PWew5l5Pe07MgO5b8m//v5J+EGO2Eam7OZA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgiwFfPspRAMpRLFN5xOIOOwLstPV54OFgzH4HO6cjX4Vzio/T
	KBTbc3IB/PwB9T5B+S+WiAWQaO7e6JKjx2JWQtvFfGB1ZnN4GcaHYBesQf8JDXR5oB95ixemsWA
	ddGhIFikVDN/3oLgLWJA0EPnqu0IIobnA7uwVYg==
X-Gm-Gg: ASbGnctnqvv0HNlpgphAnNwP3tx9/I0Wjr1NzyslU9YAgUNED3LmlbpJeYHZT0+IKlZ
	O4/3wP/UEMQuYkzFPWX3nSfddGCvSthOCbuvHy7g=
X-Google-Smtp-Source: AGHT+IE4YEOQO8YPq3Y5Nu3QJ58o1w1Ezq9+apYD15YDpwwCYXmRXgVIykIPW/l++4pPj0zUDeRK/w9+e08XLvO+P4g=
X-Received: by 2002:a05:6e02:1a8b:b0:3a7:7124:bd2c with SMTP id
 e9e14a558f8ab-3affab62206mr169815225ab.19.1734436068997; Tue, 17 Dec 2024
 03:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-2-carlo.nonato@minervasys.tech> <eaf99fc7-30f4-4820-ab36-8f5926a4e9b8@suse.com>
 <CAG+AhRUNrj9a2P1TL7MNbkPw5scZjcTamQGxKsDS5sBWqpZrYg@mail.gmail.com>
 <00e38f79-6185-4dcb-be69-4b08fb4a81f4@suse.com> <CAG+AhRUxBDkw+Vhjg+dKcEX-56rM95NOuxSF2-a8DWangp-2uA@mail.gmail.com>
 <49a1b364-595e-4971-9819-f7e4beb35b05@suse.com>
In-Reply-To: <49a1b364-595e-4971-9819-f7e4beb35b05@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 17 Dec 2024 12:47:38 +0100
Message-ID: <CAG+AhRWs09f8uZj=cOGzGcL2gBF+XmMaNtGMuKn0sZ64SBUqCg@mail.gmail.com>
Subject: Re: [PATCH v12 01/12] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 12:12=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 17.12.2024 11:25, Carlo Nonato wrote:
> > On Tue, Dec 17, 2024 at 9:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 16.12.2024 17:33, Carlo Nonato wrote:
> >>> On Mon, Dec 16, 2024 at 11:51=E2=80=AFAM Jan Beulich <jbeulich@suse.c=
om> wrote:
> >>>> On 13.12.2024 17:28, Carlo Nonato wrote:
> >>>>> --- /dev/null
> >>>>> +++ b/xen/common/llc-coloring.c
> >>>>> @@ -0,0 +1,124 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>>>> +/*
> >>>>> + * Last Level Cache (LLC) coloring common code
> >>>>> + *
> >>>>> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> >>>>> + * Copyright (C) 2024, Minerva Systems SRL
> >>>>> + */
> >>>>> +#include <xen/keyhandler.h>
> >>>>> +#include <xen/llc-coloring.h>
> >>>>> +#include <xen/param.h>
> >>>>> +
> >>>>> +#define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
> >>>>> +
> >>>>> +/*
> >>>>> + * -1: not specified (disabled unless llc-size and llc-nr-ways pre=
sent)
> >>>>> + *  0: explicitly disabled through cmdline
> >>>>> + *  1: explicitly enabled through cmdline
> >>>>> + */
> >>>>> +static int8_t __initdata opt_llc_coloring =3D -1;
> >>>>> +boolean_param("llc-coloring", opt_llc_coloring);
> >>>>> +
> >>>>> +static bool __ro_after_init llc_coloring_enabled;
> >>>>> +
> >>>>> +static unsigned int __initdata llc_size;
> >>>>> +size_param("llc-size", llc_size);
> >>>>> +static unsigned int __initdata llc_nr_ways;
> >>>>> +integer_param("llc-nr-ways", llc_nr_ways);
> >>>>> +/* Number of colors available in the LLC */
> >>>>> +static unsigned int __ro_after_init max_nr_colors;
> >>>>> +
> >>>>> +static void print_colors(const unsigned int colors[], unsigned int=
 num_colors)
> >>>>> +{
> >>>>> +    unsigned int i;
> >>>>> +
> >>>>> +    printk("{ ");
> >>>>> +    for ( i =3D 0; i < num_colors; i++ )
> >>>>> +    {
> >>>>> +        unsigned int start =3D colors[i], end =3D start;
> >>>>> +
> >>>>> +        printk("%u", start);
> >>>>> +
> >>>>> +        for ( ; i < num_colors - 1 && end + 1 =3D=3D colors[i + 1]=
; i++, end++ )
> >>>>> +            ;
> >>>>> +
> >>>>> +        if ( start !=3D end )
> >>>>> +            printk("-%u", end);
> >>>>> +
> >>>>> +        if ( i < num_colors - 1 )
> >>>>> +            printk(", ");
> >>>>> +    }
> >>>>> +    printk(" }\n");
> >>>>> +}
> >>>>> +
> >>>>> +void __init llc_coloring_init(void)
> >>>>> +{
> >>>>> +    unsigned int way_size;
> >>>>> +
> >>>>> +    llc_coloring_enabled =3D (opt_llc_coloring =3D=3D 1);
> >>>>
> >>>> Generally I'd suggest to only use > 0, >=3D 0, < 0, and <=3D 0 on su=
ch
> >>>> variables.
> >>>>
> >>>>> +    if ( (opt_llc_coloring !=3D 0) && llc_size && llc_nr_ways )
> >>>>> +    {
> >>>>> +        llc_coloring_enabled =3D true;
> >>>>> +        way_size =3D llc_size / llc_nr_ways;
> >>>>> +    }
> >>>>
> >>>> Hmm, I actually see a difference in someone saying
> >>>>
> >>>> "llc-coloring=3D0 llc-size=3D... llc-nr-ways=3D..."
> >>>>
> >>>> vs
> >>>>
> >>>> "llc-size=3D... llc-nr-ways=3D... llc-coloring=3D0"
> >>>>
> >>>> I'm not sure about Arm, but on x86 this can be relevant as there may=
 be
> >>>> pre-set parts of a command line with appended (human) overrides. The=
refore
> >>>> it always wants to be "last wins". Yet yes, you may weant to take th=
e
> >>>> position that in such a case the former example would require "llc-c=
oloring=3D1"
> >>>> to also be added.
> >>>
> >>> Yes, I think this should be the way to go.
> >>>
> >>>> Kind of against the shorthand llc-size+llc-nr-ways only,
> >>>> though.
> >>>
> >>> The shorthand was proposed by you here:
> >>> https://patchew.org/Xen/20240315105902.160047-1-carlo.nonato@minervas=
ys.tech/20240315105902.160047-2-carlo.nonato@minervasys.tech/#05e4d3da-4130=
-4c57-9855-43b685ce5005@suse.com
> >>>
> >>>> Wouldn't it make sense to infer "llc-coloring" when both of the latt=
er options
> >>>> were supplied?
> >>>
> >>> We both agreed that it was something good to have.
> >>
> >> Right, and I'm not putting that under question. With that, however, I =
find
> >> your reply ambiguous. If the shorthand is useful to have, is the requi=
rement
> >> to put a 2nd "llc-coloring=3D1" on a command line (as per above) reall=
y a good
> >> idea?
> >
> > I don't know an easy way to check for parameters order. We're close to =
feature
> > freeze. Isn't this solution good enough for now?
>
> Maybe it is, but then imo only when also calling out the apparent anomaly=
 in
> the command line doc. I.e. amend 'Note that using both options implies
> "llc-coloring=3Don"' by e.g. 'unless an earlier "llc-coloring=3Doff" is t=
here' (in
> both places).
>

Ok.

> Jan

