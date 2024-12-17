Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3459F48D1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 11:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858730.1270970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNUlw-0003UG-Lg; Tue, 17 Dec 2024 10:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858730.1270970; Tue, 17 Dec 2024 10:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNUlw-0003Sm-It; Tue, 17 Dec 2024 10:25:48 +0000
Received: by outflank-mailman (input) for mailman id 858730;
 Tue, 17 Dec 2024 10:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+zK=TK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNUlv-0003Se-1K
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 10:25:47 +0000
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [2607:f8b0:4864:20::d34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45d96c17-bc61-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 11:25:44 +0100 (CET)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-844d67eb693so364365939f.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 02:25:44 -0800 (PST)
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
X-Inumbo-ID: 45d96c17-bc61-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734431143; x=1735035943; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdq547quTPr4F+j8gB5Fv7DWvFlx+ayEZm+4Oa/Abao=;
        b=BiMuOU4psl2UhpLSBd4lkVrvRY3Sq5HxRRL0vtrJEKBStxuA4k2SzEvdSuYkQKpArl
         yd0NPme0QTltbRRre4HGOWKJGegZJWHFl7wD9aEgBa08d82WjtkyBwHfC7FMFU/OCcsj
         3on8wF6WPAAwptH/jDcz9tzyfUTBls96r8PFmMS1ILVag1djy+LNK8AxyGYu+jLbVAkd
         24fK+DSU2H/hrFhC/c+JFhG7MvlLqyviA+nnR5NaW3HDFe/LnfhOLf9r83LX0W7YU01U
         zjycabfhYz3Pjo1qihJ+33rSh7HaNUqjfkU8lIfcA51iAdvWRIPpFrXRA0E0IZNHPB/Q
         c6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734431143; x=1735035943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdq547quTPr4F+j8gB5Fv7DWvFlx+ayEZm+4Oa/Abao=;
        b=MNqydjZW0Ll5tlGwyolg8R3qfUnhEIwQ9O8/DS4//6v19lxTaVWlAb9+q5+d9oacP7
         /DDOiaa07Sx+WcollkgjmCkHdOR+uspj+z5veD/N7jcckFKQYwGvZHHjbTWvceIMhJRv
         ViJSC28a+pb3lQ50PcLaYzLbUDf34fKec3FrfYl890IiU0pPc7NB0l9K17+CUJ7pxg3i
         KUCQpTaf1D1Ri/uR305ZeIzr7Dlz61p2Id1OOvS1j+p23fv7IWd0/66WU9m0LJcTUCt5
         KiCXN8R7tM6aN50CCAaeZieffVD4qHPJCZ1Zbfbu2E+W/PE0o06m4Y1bngSFOuIO7THM
         PZcw==
X-Forwarded-Encrypted: i=1; AJvYcCXdl/Bi0rmOsUzGXpEWjIYdS4O662phMylBJR0Op7v9iBtMZj5KUW/VHt1SaODCv3YSnpNXz7mxPmM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvitJbC9pXTzwvs00nlEtY2d7hR2fU+Bb7cat7H9jKQL9yaMB6
	COtKMU4pGDyxBFkOzrSFshAeZLS+mvWMHQpddjik0xCqjMV5QeQzj9V9YDr0Na+AWL31AUdWj5s
	3J0Z3/WA9xGN87wz675yU8RSKnNLjrG4+UYkPMA==
X-Gm-Gg: ASbGncu0aLAi5n892dYyZ44z46uZbwKcxppB3IlhHQ8Q+Jr4UD0KgrknPsFPyFRbqZU
	3e/2rsPvAPX2s8fppTHAidg/g//BaaAdtJXCY/ec=
X-Google-Smtp-Source: AGHT+IECGM/3Xs5L+2OH6MPD4XKNk3kUJjnydo5Y/uMMMTZLidRKnYuDqyfqbSFVzuLMMYRWNiZ1VWR0i7Fa9cfsqqI=
X-Received: by 2002:a05:6e02:3288:b0:3a7:159d:2dd8 with SMTP id
 e9e14a558f8ab-3afedc1a255mr162643755ab.7.1734431143638; Tue, 17 Dec 2024
 02:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
 <20241213162815.9196-2-carlo.nonato@minervasys.tech> <eaf99fc7-30f4-4820-ab36-8f5926a4e9b8@suse.com>
 <CAG+AhRUNrj9a2P1TL7MNbkPw5scZjcTamQGxKsDS5sBWqpZrYg@mail.gmail.com> <00e38f79-6185-4dcb-be69-4b08fb4a81f4@suse.com>
In-Reply-To: <00e38f79-6185-4dcb-be69-4b08fb4a81f4@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Tue, 17 Dec 2024 11:25:33 +0100
Message-ID: <CAG+AhRUxBDkw+Vhjg+dKcEX-56rM95NOuxSF2-a8DWangp-2uA@mail.gmail.com>
Subject: Re: [PATCH v12 01/12] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 9:57=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 16.12.2024 17:33, Carlo Nonato wrote:
> > On Mon, Dec 16, 2024 at 11:51=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >> On 13.12.2024 17:28, Carlo Nonato wrote:
> >>> --- /dev/null
> >>> +++ b/xen/common/llc-coloring.c
> >>> @@ -0,0 +1,124 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +/*
> >>> + * Last Level Cache (LLC) coloring common code
> >>> + *
> >>> + * Copyright (C) 2024, Advanced Micro Devices, Inc.
> >>> + * Copyright (C) 2024, Minerva Systems SRL
> >>> + */
> >>> +#include <xen/keyhandler.h>
> >>> +#include <xen/llc-coloring.h>
> >>> +#include <xen/param.h>
> >>> +
> >>> +#define NR_LLC_COLORS          (1U << CONFIG_LLC_COLORS_ORDER)
> >>> +
> >>> +/*
> >>> + * -1: not specified (disabled unless llc-size and llc-nr-ways prese=
nt)
> >>> + *  0: explicitly disabled through cmdline
> >>> + *  1: explicitly enabled through cmdline
> >>> + */
> >>> +static int8_t __initdata opt_llc_coloring =3D -1;
> >>> +boolean_param("llc-coloring", opt_llc_coloring);
> >>> +
> >>> +static bool __ro_after_init llc_coloring_enabled;
> >>> +
> >>> +static unsigned int __initdata llc_size;
> >>> +size_param("llc-size", llc_size);
> >>> +static unsigned int __initdata llc_nr_ways;
> >>> +integer_param("llc-nr-ways", llc_nr_ways);
> >>> +/* Number of colors available in the LLC */
> >>> +static unsigned int __ro_after_init max_nr_colors;
> >>> +
> >>> +static void print_colors(const unsigned int colors[], unsigned int n=
um_colors)
> >>> +{
> >>> +    unsigned int i;
> >>> +
> >>> +    printk("{ ");
> >>> +    for ( i =3D 0; i < num_colors; i++ )
> >>> +    {
> >>> +        unsigned int start =3D colors[i], end =3D start;
> >>> +
> >>> +        printk("%u", start);
> >>> +
> >>> +        for ( ; i < num_colors - 1 && end + 1 =3D=3D colors[i + 1]; =
i++, end++ )
> >>> +            ;
> >>> +
> >>> +        if ( start !=3D end )
> >>> +            printk("-%u", end);
> >>> +
> >>> +        if ( i < num_colors - 1 )
> >>> +            printk(", ");
> >>> +    }
> >>> +    printk(" }\n");
> >>> +}
> >>> +
> >>> +void __init llc_coloring_init(void)
> >>> +{
> >>> +    unsigned int way_size;
> >>> +
> >>> +    llc_coloring_enabled =3D (opt_llc_coloring =3D=3D 1);
> >>
> >> Generally I'd suggest to only use > 0, >=3D 0, < 0, and <=3D 0 on such
> >> variables.
> >>
> >>> +    if ( (opt_llc_coloring !=3D 0) && llc_size && llc_nr_ways )
> >>> +    {
> >>> +        llc_coloring_enabled =3D true;
> >>> +        way_size =3D llc_size / llc_nr_ways;
> >>> +    }
> >>
> >> Hmm, I actually see a difference in someone saying
> >>
> >> "llc-coloring=3D0 llc-size=3D... llc-nr-ways=3D..."
> >>
> >> vs
> >>
> >> "llc-size=3D... llc-nr-ways=3D... llc-coloring=3D0"
> >>
> >> I'm not sure about Arm, but on x86 this can be relevant as there may b=
e
> >> pre-set parts of a command line with appended (human) overrides. There=
fore
> >> it always wants to be "last wins". Yet yes, you may weant to take the
> >> position that in such a case the former example would require "llc-col=
oring=3D1"
> >> to also be added.
> >
> > Yes, I think this should be the way to go.
> >
> >> Kind of against the shorthand llc-size+llc-nr-ways only,
> >> though.
> >
> > The shorthand was proposed by you here:
> > https://patchew.org/Xen/20240315105902.160047-1-carlo.nonato@minervasys=
.tech/20240315105902.160047-2-carlo.nonato@minervasys.tech/#05e4d3da-4130-4=
c57-9855-43b685ce5005@suse.com
> >
> >> Wouldn't it make sense to infer "llc-coloring" when both of the latter=
 options
> >> were supplied?
> >
> > We both agreed that it was something good to have.
>
> Right, and I'm not putting that under question. With that, however, I fin=
d
> your reply ambiguous. If the shorthand is useful to have, is the requirem=
ent
> to put a 2nd "llc-coloring=3D1" on a command line (as per above) really a=
 good
> idea?

I don't know an easy way to check for parameters order. We're close to feat=
ure
freeze. Isn't this solution good enough for now?

> Jan

