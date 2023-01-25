Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8567B102
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 12:19:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484245.750780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdnR-0002uc-Lr; Wed, 25 Jan 2023 11:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484245.750780; Wed, 25 Jan 2023 11:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdnR-0002sv-I1; Wed, 25 Jan 2023 11:18:29 +0000
Received: by outflank-mailman (input) for mailman id 484245;
 Wed, 25 Jan 2023 11:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDzi=5W=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pKdnQ-0002sp-BW
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 11:18:28 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc7c4e57-9ca1-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 12:18:26 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id os24so2985451ejb.8
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 03:18:25 -0800 (PST)
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
X-Inumbo-ID: fc7c4e57-9ca1-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JnELyy+I0V7mbAt5rOK/y3cLZLtcPiOcehs2mJ0Lxq4=;
        b=SP6fh37trHBOP+aM02xr4JeZ7OBYIi1UtiqQpyfUgGX/uctS/hOiUBOkb9qomlLTKL
         2ajH8hQe6hjV6yosI3A7iXTouab5/34xETCzMAkx2ZqWOq8ERPPjZZdS3yLFebDSpCh+
         4ag5sezJQAzp+Vzw0DzYb0OR0SmrlXWe8rgkKozDZ701aN6pkvSQXteqxwxdvxEd1STy
         sR3eIDdHjkoqvKvyYR4/Url13ZUXSuKVoi6lcUXjTWmQePSvqx8zn1hyvFnDBbnTKTnu
         wrfoz7OL10ZEvhINZiZwpEETMCvq80XGRZJcVlowkhgW1Nt+C6x9bdhHHYTE7P/J7PB+
         G2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnELyy+I0V7mbAt5rOK/y3cLZLtcPiOcehs2mJ0Lxq4=;
        b=NnaBCzYHQvHtlW+fYJQgE2v4G79OZS2cMt7R+91T2Qy0R7Nqarvsd0s6RDOH6hSHUO
         kCFXgXjCtXzaOyOZPtSsFHCk3f0Bmm80mBPH/jRYvguKFw4LzNvsMtNi8qtC4rYJusy6
         MlxfooJ+woS3J/r3/3R1NquEFbT9ibSE3HBinFxt+RNBYHd0POn/nOYwu75Cj9mpL1vB
         x/ErOo3twoGOy0Xz4WEyw70zp0GHGpVcnoyc5HGmFs2N9EOLSHwjCt5L9R03xHzjYJNJ
         kFPEUtOra4uexYHOvOkfQ7d3qOIY611ba1L73sEd+a21bTwCNrVJalR5p8XolIsf9l8d
         Y21w==
X-Gm-Message-State: AFqh2koJAVhcK6yq1v53loMQjavM+Sy0CsU/L/MdghpENg8oyGe9Q0By
	oV2Bo2CXLFBRnbeIhAZ0plNqZkMnoDeUDmlS50hcNQ==
X-Google-Smtp-Source: AMrXdXs+hpQ28/87xMp4v/W7H/UScjp7IjM0rSK6tb5nE99q2BDMnqZI2qcfcTHWjZTdwzhQPwCrw+z3PKvgtsCNZnk=
X-Received: by 2002:a17:907:c928:b0:85e:4218:c011 with SMTP id
 ui40-20020a170907c92800b0085e4218c011mr3335275ejc.258.1674645505312; Wed, 25
 Jan 2023 03:18:25 -0800 (PST)
MIME-Version: 1.0
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-2-carlo.nonato@minervasys.tech> <a470be46-ab6e-3970-2b04-6f4035adf1cb@suse.com>
In-Reply-To: <a470be46-ab6e-3970-2b04-6f4035adf1cb@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Wed, 25 Jan 2023 12:18:14 +0100
Message-ID: <CAG+AhRX9DVW5EfXKQoDG9hmcE0FORydTZd0pNm-0uqwddaN9NQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/11] xen/common: add cache coloring common code
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

Hi Jan, Julien

On Tue, Jan 24, 2023 at 5:37 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.01.2023 16:47, Carlo Nonato wrote:
> > @@ -769,6 +776,13 @@ struct domain *domain_create(domid_t domid,
> >      return ERR_PTR(err);
> >  }
> >
> > +struct domain *domain_create(domid_t domid,
> > +                             struct xen_domctl_createdomain *config,
> > +                             unsigned int flags)
> > +{
> > +    return domain_create_llc_colored(domid, config, flags, 0, 0);
>
> Please can you use NULL when you mean a null pointer?
>
> > --- /dev/null
> > +++ b/xen/include/xen/llc_coloring.h
> > @@ -0,0 +1,54 @@
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
> > +
> > +#include <asm/llc_coloring.h>
> > +
> > +extern bool llc_coloring_enabled;
> > +
> > +int domain_llc_coloring_init(struct domain *d, unsigned int *colors,
> > +                             unsigned int num_colors);
> > +void domain_llc_coloring_free(struct domain *d);
> > +void domain_dump_llc_colors(struct domain *d);
> > +
> > +#else
> > +
> > +#define llc_coloring_enabled (false)
>
> While I agree this is needed, ...
>
> > +static inline int domain_llc_coloring_init(struct domain *d,
> > +                                           unsigned int *colors,
> > +                                           unsigned int num_colors)
> > +{
> > +    return 0;
> > +}
> > +static inline void domain_llc_coloring_free(struct domain *d) {}
> > +static inline void domain_dump_llc_colors(struct domain *d) {}
>
> ... I don't think you need any of these. Instead the declarations above
> simply need to be visible unconditionally (to be visible to the compiler
> when processing consuming code). We rely on DCE to remove such references
> in many other places.

So this is true for any other stub function that I used in the series, right?
Since all of them are guarded by the same kind of if statement: checking for
llc_coloring_enabled value which, in case of coloring disabled from Kconfig,
is always false and then DCE comes in. Sorry for being so verbose, but I just
want to be sure I understood.

> > +#endif /* CONFIG_HAS_LLC_COLORING */
> > +
> > +#define is_domain_llc_colored(d) (llc_coloring_enabled)
> > +
> > +#endif /* __COLORING_H__ */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > \ No newline at end of file
>
> This wants taking care of.
>
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -602,6 +602,9 @@ struct domain
> >
> >      /* Holding CDF_* constant. Internal flags for domain creation. */
> >      unsigned int cdf;
> > +
> > +    unsigned int *llc_colors;
> > +    unsigned int num_llc_colors;
> >  };
>
> Why outside of any #ifdef, and why not in struct arch_domain?

Moving this in sched.h seemed like the natural continuation of the common +
arch specific split. Notice that this split is also because Julien pointed
out (as you did in some earlier revision) that cache coloring can be used
by other arch in the future (even if x86 is excluded). Having two maintainers
saying the same thing sounded like a good reason to do that.

The missing #ifdef comes from a discussion I had with Julien in v2 about
domctl interface where he suggested removing it
(https://marc.info/?l=xen-devel&m=166151802002263). We were talking about
a different struct, but I thought the principle was the same. Anyway I would
like the #ifdef too.

So @Jan, @Julien, can you help me fix this once for all?

> Jan

Thanks.

- Carlo Nonato

