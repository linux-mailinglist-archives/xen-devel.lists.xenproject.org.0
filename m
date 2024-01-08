Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E6826B55
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 11:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663288.1033155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMmXD-00065x-MY; Mon, 08 Jan 2024 10:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663288.1033155; Mon, 08 Jan 2024 10:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMmXD-000649-Jt; Mon, 08 Jan 2024 10:07:07 +0000
Received: by outflank-mailman (input) for mailman id 663288;
 Mon, 08 Jan 2024 10:07:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvth=IS=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rMmXC-000641-7T
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 10:07:06 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac92efc1-ae0d-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 11:07:04 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-553ba2f0c8fso1807639a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 02:07:04 -0800 (PST)
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
X-Inumbo-ID: ac92efc1-ae0d-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704708424; x=1705313224; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqduyHr7pdaQeejibwqGH3EAUxC9w1DMd/U0/tsdsuw=;
        b=FXA6h1A77cj2sqQ1WkHKLDEVzOXT46wB+AcD0CJdr7GDGVaJ8vnxHBHdUF4o6y19+2
         qjtBPOJFQ7WIUw43Ng5CzUWkqI0xnL+SIoIzt+BjfNJpGsSEYbPhT6KTNA2hdaC0DiRE
         69cFyD+RD5rn/GV90yWmFUdPTOR7xP3CkM7MF+BiGrmmGy1KQA6tGb5EjIzmh487D01h
         1cj0gRJs01rx9OKkN2GlqwnlbcDECs9m8JFuhSWYPW2GPQY78mqvSV3tja0iO/sX0ntL
         dvM3PZZBB+DER6RHcrb+yx+J0BxHCXD29vvQUEnPdWBBO9wSDwvjAVu8jevA2zPDBnnr
         Aing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704708424; x=1705313224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqduyHr7pdaQeejibwqGH3EAUxC9w1DMd/U0/tsdsuw=;
        b=M8SqmHvslsjPKP8yC9OBevwWx6o5UyA1e5hI5ZDEMysVY6Ce5Ajv31AkkHnYyn+1QK
         3hmTmxaZ4LGk76/msOPQyhvHY51W2DMnOdG4V9j++BByB/N0Pn5JMisxaRh6DW8BACeR
         39gyNsHnBP+iKWlMg8Wm9MUm1uazny8Nw/ypZsy1fMfHV5SwA30/T6NPTE3GOjnEFKMZ
         LFQnyUcpYR/5nPeU+e3HEquwDEv+yQAR+uPw3CMlUHDiC2lq5GwLDBertG2JyNXKf9HR
         A5ZlVXODL6VRwRZm69P8hqWqQDVRKHMzqA3GK1l3oqcQNasysKR7YgjwONo7E8rbKA3E
         1oiw==
X-Gm-Message-State: AOJu0Yy8GDiapEq0trXqPCDkpH1H33GTo1VbdCyIui+OUeX287W/pCKy
	+IDVuVv3qCgy2+X9aTWaSK1TNE795Ec1LE9rOpWCQkXByTl6sg==
X-Google-Smtp-Source: AGHT+IEpmst7MiOz9F8xW1t5cNBeh4YeoejQ/RcBbtw2A4d+ktBlnt+BJWt+aZfuTi6cihHqdJJh1T1rxgj0YqYPwiY=
X-Received: by 2002:a17:906:3091:b0:a27:efde:c6f5 with SMTP id
 17-20020a170906309100b00a27efdec6f5mr642587ejv.300.1704708424342; Mon, 08 Jan
 2024 02:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-4-carlo.nonato@minervasys.tech> <046e9949-d126-42b1-90a6-12af540d63bf@xen.org>
 <CAG+AhRWm4N7GV3HfkTNCvXQw7-6Woq=+zBqdHAgN=-PgGr-WRg@mail.gmail.com> <0905b0f4-9a5e-48c7-8764-58cdd440130f@xen.org>
In-Reply-To: <0905b0f4-9a5e-48c7-8764-58cdd440130f@xen.org>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Mon, 8 Jan 2024 11:06:53 +0100
Message-ID: <CAG+AhRVL8_YMkw+Z4EcTLZgM7m10+9DToSkaeNLMaFY3gcng7Q@mail.gmail.com>
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

Hi Julien,

On Fri, Jan 5, 2024 at 6:50=E2=80=AFPM Julien Grall <julien@xen.org> wrote:
>
>
>
> On 05/01/2024 16:52, Carlo Nonato wrote:
> > Hi Julien,
> >
> > On Thu, Jan 4, 2024 at 8:54=E2=80=AFPM Julien Grall <julien@xen.org> wr=
ote:
> >>
> >> Hi Carlo,
> >>
> >> On 02/01/2024 09:51, Carlo Nonato wrote:
> >>> This commit allows the user to set the cache coloring configuration f=
or
> >>> Dom0 via a command line parameter.
> >>> Since cache coloring and static memory are incompatible, direct mappi=
ng
> >>> Dom0 isn't possible when coloring is enabled.
> >>>
> >>> A common configuration syntax for cache colors is also introduced.
> >>>
> >>> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >>>
> >>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> >>> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> >>> ---
> >>> v5:
> >>> - Carlo Nonato as the new author
> >>> - moved dom0 colors parsing (parse_colors()) in this patch
> >>> - added dom0_set_llc_colors() to set dom0 colors after creation
> >>> - moved color allocation and checking in this patch
> >>> - error handling when allocating color arrays
> >>> - FIXME: copy pasted allocate_memory() cause it got moved
> >>> v4:
> >>> - dom0 colors are dynamically allocated as for any other domain
> >>>     (colors are duplicated in dom0_colors and in the new array, but l=
ogic
> >>>     is simpler)
> >>> ---
> >>>    docs/misc/arm/cache-coloring.rst        |  29 ++++++
> >>>    docs/misc/xen-command-line.pandoc       |   9 ++
> >>>    xen/arch/arm/domain_build.c             |  60 ++++++++++-
> >>>    xen/arch/arm/include/asm/llc-coloring.h |   1 +
> >>>    xen/arch/arm/llc-coloring.c             | 128 ++++++++++++++++++++=
++++
> >>>    5 files changed, 224 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/docs/misc/arm/cache-coloring.rst b/docs/misc/arm/cache-c=
oloring.rst
> >>> index eabf8f5d1b..acf82c3df8 100644
> >>> --- a/docs/misc/arm/cache-coloring.rst
> >>> +++ b/docs/misc/arm/cache-coloring.rst
> >>> @@ -84,6 +84,35 @@ More specific documentation is available at `docs/=
misc/xen-command-line.pandoc`.
> >>>    +----------------------+-------------------------------+
> >>>    | ``llc-way-size``     | set the LLC way size          |
> >>>    +----------------------+-------------------------------+
> >>> +| ``dom0-llc-colors``  | Dom0 color configuration      |
> >>> ++----------------------+-------------------------------+
> >>> +
> >>> +Colors selection format
> >>> +***********************
> >>> +
> >>> +Regardless of the memory pool that has to be colored (Xen, Dom0/DomU=
s),
> >>> +the color selection can be expressed using the same syntax. In parti=
cular a
> >>> +comma-separated list of colors or ranges of colors is used.
> >>> +Ranges are hyphen-separated intervals (such as `0-4`) and are inclus=
ive on both
> >>> +sides.
> >>> +
> >>> +Note that:
> >>> +
> >>> +- no spaces are allowed between values.
> >>> +- no overlapping ranges or duplicated colors are allowed.
> >>> +- values must be written in ascending order.
> >>> +
> >>> +Examples:
> >>> +
> >>> ++-------------------+-----------------------------+
> >>> +| **Configuration** | **Actual selection**        |
> >>> ++-------------------+-----------------------------+
> >>> +| 1-2,5-8           | [1, 2, 5, 6, 7, 8]          |
> >>> ++-------------------+-----------------------------+
> >>> +| 4-8,10,11,12      | [4, 5, 6, 7, 8, 10, 11, 12] |
> >>> ++-------------------+-----------------------------+
> >>> +| 0                 | [0]                         |
> >>> ++-------------------+-----------------------------+
> >>>
> >>>    Known issues and limitations
> >>>    ****************************
> >>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-comman=
d-line.pandoc
> >>> index 22d2d5b6cf..51f6adf035 100644
> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
> >>>
> >>>    Specify a list of IO ports to be excluded from dom0 access.
> >>>
> >>> +### dom0-llc-colors (arm64)
> >>> +> `=3D List of [ <integer> | <integer>-<integer> ]`
> >>
> >> Someone reading only xen-command-line.pandoc would not know how each
> >> item of the list is separated. Can this be clarified?
> >
> > Isn't it already known that the list is comma separated? It's written a=
t the
> > beginning of this file for the "List" type.
> > I can also point to cache-coloring documentation if needed.
>
> Ah I forgot that part. Please ignore this comment.
>
> [...]
>
> >>> +                return -EINVAL;
> >>> +            for ( color =3D start; color <=3D end; color++ )
> >>> +                colors[(*num_colors)++] =3D color;
> >>> +        }
> >>> +        else
> >>> +            s++;
> >>> +    }
> >>> +
> >>> +    return *s ? -EINVAL : 0;
> >>> +}
> >>> +
> >>> +static int __init parse_dom0_colors(const char *s)
> >>> +{
> >>> +    return parse_color_config(s, dom0_colors, &dom0_num_colors);
> >>> +}
> >>> +custom_param("dom0-llc-colors", parse_dom0_colors);
> >>> +
> >>>    /* Return the LLC way size by probing the hardware */
> >>>    static unsigned int __init get_llc_way_size(void)
> >>>    {
> >>> @@ -102,6 +159,28 @@ static void dump_coloring_info(unsigned char key=
)
> >>>        printk("Number of LLC colors supported: %u\n", nr_colors);
> >>>    }
> >>>
> >>> +static bool check_colors(unsigned int *colors, unsigned int num_colo=
rs)
> >>> +{
> >>> +    unsigned int i;
> >>> +
> >>> +    if ( num_colors > nr_colors )
> >>> +    {
> >>> +        printk(XENLOG_ERR "Number of LLC colors requested > %u\n", n=
r_colors);
> >>> +        return false;
> >>> +    }
> >>> +
> >>> +    for ( i =3D 0; i < num_colors; i++ )
> >>> +    {
> >>> +        if ( colors[i] >=3D nr_colors )
> >>> +        {
> >>> +            printk(XENLOG_ERR "LLC color %u >=3D %u\n", colors[i], n=
r_colors);
> >>> +            return false;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    return true;
> >>> +}
> >>> +
> >>>    bool __init llc_coloring_init(void)
> >>>    {
> >>>        if ( !llc_way_size && !(llc_way_size =3D get_llc_way_size()) )
> >>> @@ -150,6 +229,55 @@ void domain_dump_llc_colors(struct domain *d)
> >>>        print_colors(d->llc_colors, d->num_llc_colors);
> >>>    }
> >>>
> >>> +static int domain_alloc_colors(struct domain *d, unsigned int num_co=
lors)
> >>> +{
> >>> +    d->num_llc_colors =3D num_colors;
> >>
> >> Shouldn't this be set *only* after the array was allocated?
> >
> > Yes, it works also like I did, but it's cleaner like you said.
>
> Actually, looking at the rest of the code. I think  d->num_llc_colors
> should be set outside of domain_alloc_colors().
>
> One of the reason is at least in the dom0less case, you will override
> the value afterwards.

In that case I need to allocate the array before parsing the string.
I allocate a full array then the string is parsed and the actual size is fo=
und
at the end of this phase. Knowing the actual size would require two parsing
stages. Yes I'm wasting a bit of memory by oversizing the array here. Is it
a problem?

Thanks.

> Cheers,
>
> --
> Julien Grall

