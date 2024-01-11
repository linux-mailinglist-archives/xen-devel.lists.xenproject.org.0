Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E33982ABA1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:10:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666095.1036545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNs0x-0007Of-Gv; Thu, 11 Jan 2024 10:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666095.1036545; Thu, 11 Jan 2024 10:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNs0x-0007MO-E3; Thu, 11 Jan 2024 10:10:19 +0000
Received: by outflank-mailman (input) for mailman id 666095;
 Thu, 11 Jan 2024 10:10:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nyxv=IV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rNs0v-0007MI-DZ
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:10:17 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cf3c46c-b069-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 11:10:14 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a2814fa68eeso425598466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 02:10:14 -0800 (PST)
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
X-Inumbo-ID: 9cf3c46c-b069-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704967814; x=1705572614; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4QlDijI+0BlR7vvZB2GluE5/SYVSsNwQI26CiTSdEw=;
        b=mwgY0e1c9XuG7+Ebv3yb9dWIC+u1FX4eOuiAx52YqCo5Yua7j+XV7jSEESLdfwo37X
         E4vuDvjkoCgGnrRZqfp+J/MFzsUVzUN8427h9FgCgfhFZCP0YoEHg01IZ/ztxwVXy6VU
         JMkneWPu/TtuKksD9VeGhdlZco1OOOBf2Mkz6j5jhzHvquaQrW+lkXWII+/PGX1FS7Pg
         5xEYsR4wuHt4NYBaA1qlfTACqDpDtVbAp7HQPf/xWNrZqCB8QcYq6sFbGdFdKC3e/kvr
         ZU5VBdB49bUD6C3dhQOl0E84OHEnqkeGiMEUmmtiBw49NPO7aWvF6T8nkMQ5p/Xl7cmC
         T6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704967814; x=1705572614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4QlDijI+0BlR7vvZB2GluE5/SYVSsNwQI26CiTSdEw=;
        b=BmqwMjsYOR4nkZNHdSJMQWdAm2cL51UASB5635y+XT2/fCQc4Nf1DtfRU3/+FhBk5T
         CUZjmU8ODkFGyZJwuznuSFNmoX/6QIJt+qzoJMDzGO/QMXaCvF6hhB6Rsm8gki7xJLCj
         6/emtMJc1CC24RKfeUCQWbyog+XtcMkt8S4jQtvnha2HPD1cx3zFTGC+shG9xK1tSBxL
         kg/j29I6YwJ7F+LjzZ8saVpsSrIH4rBxgP3uwZnsR0v18mA7WN4IEhYkZEjVZLVARRNC
         1zd5gyjIfYXSGGbQG5qlSF/pSvMyp9WjZRozKTdej0ObEObonbknqxHZaJT09aHxHITT
         vtow==
X-Gm-Message-State: AOJu0YxYlOoMGOhLSzriMvGppQUlrt1zYp0sj766DEX6A+/OePtWQC3b
	NjEahyvKGUWeJir1ZHbyAgIkH2Q+nQPMQ1UOun+N5N/yIgyZmA==
X-Google-Smtp-Source: AGHT+IG3wTPwDPvhZDzt2noVhl3WTd6T5eIh2H8ZMxJ1o4UvAJ9wK9gXq+ovsmFhNekDI9ddbkX55felhBA/eMMtedQ=
X-Received: by 2002:a17:907:1c03:b0:a2a:7a55:5dd with SMTP id
 nc3-20020a1709071c0300b00a2a7a5505ddmr810424ejc.16.1704967814213; Thu, 11 Jan
 2024 02:10:14 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-2-carlo.nonato@minervasys.tech> <feb5542a-081a-4677-b569-5d4218eb794d@suse.com>
In-Reply-To: <feb5542a-081a-4677-b569-5d4218eb794d@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 11 Jan 2024 11:10:03 +0100
Message-ID: <CAG+AhRWkasky8hrNBrtXsmmnmsJjf+-Nj3Nr7Nu4LfXvFYvwvQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Mon, Jan 8, 2024 at 5:53=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.01.2024 10:51, Carlo Nonato wrote:
> > This commit adds the Last Level Cache (LLC) coloring common header, Kco=
nfig
> > options and functions. Since this is an arch specific feature, actual
> > implementation is postponed to later patches and Kconfig options are pl=
aced
> > under xen/arch.
>
> As a general remark / nit: "This commit", "this patch", or alike aren't
> well suited for descriptions.
>
> > --- a/xen/arch/Kconfig
> > +++ b/xen/arch/Kconfig
> > @@ -31,3 +31,19 @@ config NR_NUMA_NODES
> >         associated with multiple-nodes management. It is the upper boun=
d of
> >         the number of NUMA nodes that the scheduler, memory allocation =
and
> >         other NUMA-aware components can handle.
> > +
> > +config LLC_COLORING
> > +     bool "Last Level Cache (LLC) coloring" if EXPERT
> > +     depends on HAS_LLC_COLORING
> > +
> > +config NR_LLC_COLORS
> > +     int "Maximum number of LLC colors"
> > +     default 128
>
> What if I set to value to 0? Or to an unreasonably large one? You don't
> bound the value range at all.

I can reintroduce the range (it was there in previous versions). I just don=
't
know what numbers to put.
range 2 1024 seems reasonable since having 1 color only actually lowers
performances because of the obvious sharing of resources. 1024 are the colo=
rs
that can fit into a standard 4KiB page. It's big enough for currently
supported hardware that normally has 16 or 32 colors.

> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -7,6 +7,7 @@
> >  #include <xen/compat.h>
> >  #include <xen/init.h>
> >  #include <xen/lib.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/ctype.h>
> >  #include <xen/err.h>
> >  #include <xen/param.h>
> > @@ -1144,6 +1145,9 @@ static void cf_check complete_domain_destroy(stru=
ct rcu_head *head)
> >      struct vcpu *v;
> >      int i;
> >
> > +    if ( is_domain_llc_colored(d) )
> > +        domain_llc_coloring_free(d);
>
> Would be nice if the freeing function could be called unconditionally,
> being a no-op for non-colored domains.

Ok.

> Further - is it really necessary to do this freeing this late?

No, I can move it in domain_destroy().

> > --- a/xen/common/keyhandler.c
> > +++ b/xen/common/keyhandler.c
> > @@ -6,6 +6,7 @@
> >  #include <xen/debugger.h>
> >  #include <xen/delay.h>
> >  #include <xen/keyhandler.h>
> > +#include <xen/llc-coloring.h>
> >  #include <xen/param.h>
> >  #include <xen/shutdown.h>
> >  #include <xen/event.h>
> > @@ -307,6 +308,9 @@ static void cf_check dump_domains(unsigned char key=
)
> >
> >          arch_dump_domain_info(d);
> >
> > +        if ( is_domain_llc_colored(d) )
> > +            domain_dump_llc_colors(d);
>
> I'm less concerned of the conditional here, but along the lines of the
> comment above, it could of course again be the function that simply is
> a no-op for non-colored domains.

Ok.

> > --- /dev/null
> > +++ b/xen/include/xen/llc-coloring.h
> > @@ -0,0 +1,46 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Last Level Cache (LLC) coloring common header
> > + *
> > + * Copyright (C) 2022 Xilinx Inc.
> > + *
> > + * Authors:
> > + *    Carlo Nonato <carlo.nonato@minervasys.tech>
> > + */
> > +#ifndef __COLORING_H__
> > +#define __COLORING_H__
> > +
> > +#include <xen/sched.h>
> > +#include <public/domctl.h>
> > +
> > +#ifdef CONFIG_HAS_LLC_COLORING
>
> Why does this matter here? IOW why ...
>
> > +#include <asm/llc-coloring.h>
> > +
> > +#ifdef CONFIG_LLC_COLORING
>
> ... is it not just this which is checked?
>
> > +extern bool llc_coloring_enabled;
> > +#define llc_coloring_enabled (llc_coloring_enabled)
> > +#endif
> > +
> > +#endif
> > +
> > +#ifndef llc_coloring_enabled
> > +#define llc_coloring_enabled (false)
> > +#endif
>
> +1 to the question Julien has raised here.

Yes this whole block can be better structured.

> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -626,6 +626,11 @@ struct domain
> >
> >      /* Holding CDF_* constant. Internal flags for domain creation. */
> >      unsigned int cdf;
> > +
> > +#ifdef CONFIG_LLC_COLORING
> > +    unsigned int *llc_colors;
>
> Can the color values change over the lifetime of a domain? If not,
> it may be prudent to have this be pointer-to-const.

Can I free a pointer-to-const array?

> Jan
>
> > +    unsigned int num_llc_colors;
> > +#endif
> >  };
> >
> >  static inline struct page_list_head *page_to_list(
>

Thanks.

