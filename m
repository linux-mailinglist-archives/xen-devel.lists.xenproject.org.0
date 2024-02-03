Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7B848548
	for <lists+xen-devel@lfdr.de>; Sat,  3 Feb 2024 11:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675344.1050702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWDiA-0003IS-7b; Sat, 03 Feb 2024 10:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675344.1050702; Sat, 03 Feb 2024 10:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWDiA-0003GA-47; Sat, 03 Feb 2024 10:57:26 +0000
Received: by outflank-mailman (input) for mailman id 675344;
 Sat, 03 Feb 2024 10:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBn0=JM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rWDi8-0003G3-4d
 for xen-devel@lists.xenproject.org; Sat, 03 Feb 2024 10:57:24 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 012caa73-c283-11ee-98f5-efadbce2ee36;
 Sat, 03 Feb 2024 11:57:21 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so3899788a12.1
 for <xen-devel@lists.xenproject.org>; Sat, 03 Feb 2024 02:57:21 -0800 (PST)
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
X-Inumbo-ID: 012caa73-c283-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706957841; x=1707562641; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGsty/kH/g/f05zone2AZ5tXmGe1ChZeNzwKEwhoKGA=;
        b=ijxnYlsbXpC8l7sYfkt39Rd32xUmUf0c72ssCYPKKJ8S5Zj3Axa338qOc8/q3fjeFl
         dVBBd8nhvQEcyDC5BXBQykF/tLyFHiR8bKsmxEMA7q77MMK61cNijU8NDG5CObZyp1ep
         Zj9PKJNRoeqV9SpcKsD4QKR8pwUWFxrILlp1+OaJxxyzojYmkLAZNOBkuyEMmsulYORw
         jUnqfHsB76qBtsTSfPif9t4DMCZUJa34irqSrc6xOOw00/DLD3zqUSIUg7WHpwttkGuQ
         zT2vjEsRVJ6jHdurPLEou9OmthafIO0H3TXm+JRPj2D0uhoP4YABpT4idL5qJRs4oxEN
         HoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706957841; x=1707562641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGsty/kH/g/f05zone2AZ5tXmGe1ChZeNzwKEwhoKGA=;
        b=SoJgAxVbZUEFqoOSiWsdFEvNS0VjQpLYROjTHY3acK6+BnMN7SaZHZEHGk5Y+xDDi2
         J6Gc41EWsGoVxiargFFMB9KVK1rgorxhP3j5jzYLJnZi7a9yeT9qld8slgKw5wXurEui
         0GphCAsThvP0jwPpH6AhLiT5Q6+fDF9EgDIaYpgUL4JLIKMUz0aDrHAzxC/ybPkV+kbv
         LUV/AZNxwYwlmE3Am1WHOpgT1uRlYHR+C0RwN3vYvctRfXgtCWD2Df7sQWfincVUQ13G
         trXtg8voaQgTJF5AJLVEzgcwgKZxwuAGwpvQmliuuO3S0897+GfDb/0VUM1MapPlSsOS
         5lfA==
X-Gm-Message-State: AOJu0YyPwbvEUoEsyEM+jQSN69xhgFJHvO9i+qNLpuYFZw7ye8jVPGBO
	Q7mY9S6zFv2YuxmIaxCZz4UR3jsDdbZitSfWOnWPGq4zcIsNqYMrb+NuZ0/hGuNGj6otzXnPfmV
	rzPJhQlFpEc+9i4IJx1MLgENQtX1vAGM+ao5LQw==
X-Google-Smtp-Source: AGHT+IGxOlJQqTT4EJoO7G6v0ZohXm/9L+cN7xvZpOugu9RQQGwd20bWHNtr7buh1aFaHtrjk5Tn4IfFKz0BRfFelNQ=
X-Received: by 2002:aa7:c89a:0:b0:55f:fad9:a91c with SMTP id
 p26-20020aa7c89a000000b0055ffad9a91cmr1453613eds.6.1706957840528; Sat, 03 Feb
 2024 02:57:20 -0800 (PST)
MIME-Version: 1.0
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech> <42eabd87-b245-44e3-9945-40b1a5c5eaf5@suse.com>
In-Reply-To: <42eabd87-b245-44e3-9945-40b1a5c5eaf5@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Sat, 3 Feb 2024 11:57:09 +0100
Message-ID: <CAG+AhRVjiqjae+Lwdk71OkF=X93m+CNLFYpK65h+O1kozOgtew@mail.gmail.com>
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Wed, Jan 31, 2024 at 4:57=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 29.01.2024 18:17, Carlo Nonato wrote:
> > Last Level Cache (LLC) coloring allows to partition the cache in smalle=
r
> > chunks called cache colors. Since not all architectures can actually
> > implement it, add a HAS_LLC_COLORING Kconfig and put other options unde=
r
> > xen/arch.
> >
> > LLC colors are a property of the domain, so the domain struct has to be
> > extended.
> >
> > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > ---
> > v6:
> > - moved almost all code in common
> > - moved documentation in this patch
> > - reintroduced range for CONFIG_NR_LLC_COLORS
> > - reintroduced some stub functions to reduce the number of checks on
> >   llc_coloring_enabled
> > - moved domain_llc_coloring_free() in same patch where allocation happe=
ns
> > - turned "d->llc_colors" to pointer-to-const
> > - llc_coloring_init() now returns void and panics if errors are found
> > v5:
> > - used - instead of _ for filenames
> > - removed domain_create_llc_colored()
> > - removed stub functions
> > - coloring domain fields are now #ifdef protected
> > v4:
> > - Kconfig options moved to xen/arch
> > - removed range for CONFIG_NR_LLC_COLORS
> > - added "llc_coloring_enabled" global to later implement the boot-time
> >   switch
> > - added domain_create_llc_colored() to be able to pass colors
> > - added is_domain_llc_colored() macro
> > ---
> >  docs/misc/cache-coloring.rst      | 87 +++++++++++++++++++++++++++++++
> >  docs/misc/xen-command-line.pandoc | 27 ++++++++++
> >  xen/arch/Kconfig                  | 17 ++++++
> >  xen/common/Kconfig                |  3 ++
> >  xen/common/Makefile               |  1 +
> >  xen/common/keyhandler.c           |  3 ++
> >  xen/common/llc-coloring.c         | 87 +++++++++++++++++++++++++++++++
> >  xen/include/xen/llc-coloring.h    | 38 ++++++++++++++
> >  xen/include/xen/sched.h           |  5 ++
> >  9 files changed, 268 insertions(+)
> >  create mode 100644 docs/misc/cache-coloring.rst
> >  create mode 100644 xen/common/llc-coloring.c
> >  create mode 100644 xen/include/xen/llc-coloring.h
> >
> > diff --git a/docs/misc/cache-coloring.rst b/docs/misc/cache-coloring.rs=
t
> > new file mode 100644
> > index 0000000000..9fe01e99e1
> > --- /dev/null
> > +++ b/docs/misc/cache-coloring.rst
> > @@ -0,0 +1,87 @@
> > +Xen cache coloring user guide
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> > +
> > +The cache coloring support in Xen allows to reserve Last Level Cache (=
LLC)
> > +partitions for Dom0, DomUs and Xen itself. Currently only ARM64 is sup=
ported.
> > +
> > +To compile LLC coloring support set ``CONFIG_LLC_COLORING=3Dy``.
> > +
> > +If needed, change the maximum number of colors with
> > +``CONFIG_NR_LLC_COLORS=3D<n>``.
> > +
> > +Compile Xen and the toolstack and then configure it via
> > +`Command line parameters`_.
> > +
> > +Background
> > +**********
> > +
> > +Cache hierarchy of a modern multi-core CPU typically has first levels =
dedicated
> > +to each core (hence using multiple cache units), while the last level =
is shared
> > +among all of them. Such configuration implies that memory operations o=
n one
> > +core (e.g. running a DomU) are able to generate interference on anothe=
r core
> > +(e.g .hosting another DomU). Cache coloring allows eliminating this
> > +mutual interference, and thus guaranteeing higher and more predictable
> > +performances for memory accesses.
> > +The key concept underlying cache coloring is a fragmentation of the me=
mory
> > +space into a set of sub-spaces called colors that are mapped to disjoi=
nt cache
> > +partitions. Technically, the whole memory space is first divided into =
a number
> > +of subsequent regions. Then each region is in turn divided into a numb=
er of
> > +subsequent sub-colors. The generic i-th color is then obtained by all =
the
> > +i-th sub-colors in each region.
> > +
> > +::
> > +
> > +                            Region j            Region j+1
> > +                .....................   ............
> > +                .                     . .
> > +                .                       .
> > +            _ _ _______________ _ _____________________ _ _
> > +                |     |     |     |     |     |     |
> > +                | c_0 | c_1 |     | c_n | c_0 | c_1 |
> > +           _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
> > +                    :                       :
> > +                    :                       :...         ... .
> > +                    :                            color 0
> > +                    :...........................         ... .
> > +                                                :
> > +          . . ..................................:
> > +
> > +There are two pragmatic lesson to be learnt.
> > +
> > +1. If one wants to avoid cache interference between two domains, diffe=
rent
> > +   colors needs to be used for their memory.
> > +
> > +2. Color assignment must privilege contiguity in the partitioning. E.g=
.,
> > +   assigning colors (0,1) to domain I  and (2,3) to domain  J is bette=
r than
> > +   assigning colors (0,2) to I and (1,3) to J.
>
> I can't connect this 2nd point with any of what was said above.

If colors are contiguous then a greater spatial locality is achievable. You
mean we should better explain this?

> > +How to compute the number of colors
> > +***********************************
> > +
> > +To compute the number of available colors for a specific platform, the=
 size of
> > +an LLC way and the page size used by Xen must be known. The first para=
meter can
> > +be found in the processor manual or can be also computed dividing the =
total
> > +cache size by the number of its ways. The second parameter is the mini=
mum
> > +amount of memory that can be mapped by the hypervisor,
>
> I find "amount of memory that can be mapped" quite confusing here. Don't =
you
> really mean the granularity at which memory can be mapped?

Yes that's what I wanted to describe. I'll change it.

> > thus dividing the way
> > +size by the page size, the number of total cache partitions is found. =
So for
> > +example, an Arm Cortex-A53 with a 16-ways associative 1 MiB LLC, can i=
solate up
> > +to 16 colors when pages are 4 KiB in size.
>
> I guess it's a matter of what one's use to, but to me talking of "way siz=
e"
> and how the calculation is described is, well, unusual. What I would star=
t
> from is the smallest entity, i.e. a cache line. Then it would be relevant
> to describe how, after removing the low so many bits to cover for cache l=
ine
> size, the remaining address bits are used to map to a particular set. It
> looks to me as if you're assuming that this mapping is linear, using the
> next so many bits from the address. Afaik this isn't true on various mode=
rn
> CPUs; instead hash functions are used. Without knowing at least certain
> properties of such a hash function, I'm afraid your mapping from address =
to
> color isn't necessarily guaranteeing the promised isolation. The guarante=
e
> may hold for processors you specifically target, but then I think in this
> description it would help if you would fully spell out any assumptions yo=
u
> make on how hardware maps addresses to elements of the cache.

You're right, we are assuming a linear mapping. We are going to review and
extend the documentation in order to fully specify when coloring can be
applied.

About the "way size" it's a way of summarizing all the parameters into one.
We could ask for different cache parameters as you said, but in the end wha=
t
we are interested in is how many partitions is the cache capable of isolate
and how big they are. The answer is, in theory, as many partitions as the
number of sets, each one as big as a cache line, bacause we can't have
isolation inside a set.
Then memory mapping comes into place and the minimum granularity at which
mapping can happen actually lowers the number of partitions.
To recap we can isolate:
    nr_sets * line_size / page_size
Then we simply named:
    way_size =3D nr_sets * line_size
Another way of computing it:
    way_size =3D cache_size / nr_ways

We are ok with having two parameters: cache_size and nr_ways which are even
easier and intuitive to find for a normal user.

> Or, alternatively, have the number of colors be specifiable directly.

This is to be avoided in my opinion since it's more difficult to compute an=
d
it requires more knowledge.

Thanks.

>
> > +Cache layout is probed automatically by looking at the CLIDR_EL1 arm r=
egister.
> > +This means that other system caches that aren't visible there, are ign=
ored.
> > +The possibility of manually setting the way size is left to the user t=
o overcome
> > +failing situations or for debugging/testing purposes. See
> > +`Command line parameters`_ for more information on that.
> > +
> > +Command line parameters
> > +***********************
> > +
> > +More specific documentation is available at `docs/misc/xen-command-lin=
e.pandoc`.
> > +
> > ++----------------------+-------------------------------+
> > +| **Parameter**        | **Description**               |
> > ++----------------------+-------------------------------+
> > +| ``llc-coloring``     | enable coloring at runtime    |
> > ++----------------------+-------------------------------+
> > +| ``llc-way-size``     | set the LLC way size          |
> > ++----------------------+-------------------------------+
>
> As a result of the above, I also find it confusing to specify "way size"
> as a command line option. Cache size, number of ways, and cache line size
> would seem more natural to me.
>
> I'll get to looking nat the actual code later.
>
> Jan

