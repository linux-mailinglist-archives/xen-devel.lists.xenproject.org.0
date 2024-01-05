Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C291825836
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 17:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662259.1032293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLn88-0001Ho-BK; Fri, 05 Jan 2024 16:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662259.1032293; Fri, 05 Jan 2024 16:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLn88-0001EU-8E; Fri, 05 Jan 2024 16:33:08 +0000
Received: by outflank-mailman (input) for mailman id 662259;
 Fri, 05 Jan 2024 16:33:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Ewp=IP=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rLn87-0001EO-8e
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 16:33:07 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a22ef14-abe8-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 17:33:05 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50eabfac2b7so1894213e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jan 2024 08:33:05 -0800 (PST)
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
X-Inumbo-ID: 1a22ef14-abe8-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704472385; x=1705077185; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zneEtLu/ULoQnKCpHeMm44R6ycA7kpLHQd0iHcGdc8w=;
        b=xeK48usPnDGTKg5NS9RUj7lIP+nemcyNmE9Gx2WBLCxiz02OrUnskJNXUpP11Iu79b
         Trm88O5OF2FcHsbNK4NE0i/imXlozlNAuVu1sa0u8Ug8OxTQIhZNttOw0u4MFjOqtyzu
         FWEMz8uSI4T04vwOZEeHqUvTqYPVPWCDLYHdTItY9Jd/qnEZa84oS6HUCrQzYkuXXQtQ
         yTIQ9BScwn5JLFuWkrkfA5hamnENcWos30C70WNH0LSJ+KxCvmrZbkkgBiczKrsF915u
         i/K9z0+PnaJjZnubVnVNj0NMiitxw7tIWdrHsIanoB26UdCV9vD9pZ8mX1ZNDAo4CBcK
         Q2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704472385; x=1705077185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zneEtLu/ULoQnKCpHeMm44R6ycA7kpLHQd0iHcGdc8w=;
        b=nXuBF2StFvkyiLmOZpWJOIqEBID/dFrheWm0IHbj6lSi7LBJwmStMHT86TnwaWSxYM
         00cSGvVf3GGCtZlgj3SMzSuZjNvCRoNQ0lvKqRmsBMWPYGTJGeQ0PxKnBGFpUWyTqfNZ
         4+0plFC4KpIDoRKokTTOMyK4BSClG/nzsdioazUZ3sCCwgp9lwRrFfntJakjZ7xjS6dv
         O93sacKucpLIcv7EXNUhPlbA1mkbqR7u+LdsNo48PbCaNe2gu+Y4xUdGbLl0/37ODilN
         tQGZt+PKH1/7KXrZVpEPDtzMo3BSw+r50SoA0q6xQfqRTfaQl1l6bJFizBfr4fZmmK5X
         0jGg==
X-Gm-Message-State: AOJu0YyTVvhfPqNQyUGMI+GIPtMDlO7gSZ83knD+QDc4y5tgA/oyBjKH
	8R39SommPn7/ivV4LimbyAq05lzfUxKGoC/ZEc0xHCqsiJnH8A==
X-Google-Smtp-Source: AGHT+IF5/2YdEy21H8GgiuQkf+VuVQg817g8BVnz5Q2+eckN65ddAk9xXp0dpu1Yf0RPVcbj8FkzGpzINdS1azZOKzA=
X-Received: by 2002:ac2:5dc7:0:b0:50e:af1a:1dcf with SMTP id
 x7-20020ac25dc7000000b0050eaf1a1dcfmr1059852lfq.87.1704472384958; Fri, 05 Jan
 2024 08:33:04 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-2-carlo.nonato@minervasys.tech> <1ac0e50d-0551-4abb-a929-03d5b0be25c1@xen.org>
 <alpine.DEB.2.22.394.2401041343100.1322202@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2401041343100.1322202@ubuntu-linux-20-04-desktop>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 5 Jan 2024 17:32:53 +0100
Message-ID: <CAG+AhRVJ7jnTzdaPMqJxOjsRMhLCN8OinRQYC=6-DYYc32vEpw@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] xen/common: add cache coloring common code
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano, Julien,

On Thu, Jan 4, 2024 at 10:43=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Thu, 4 Jan 2024, Julien Grall wrote:
> > Hi,
> >
> > On 02/01/2024 09:51, Carlo Nonato wrote:
> > > This commit adds the Last Level Cache (LLC) coloring common header, K=
config
> > > options and functions. Since this is an arch specific feature, actual
> > > implementation is postponed to later patches and Kconfig options are =
placed
> > > under xen/arch.
> > >
> > > LLC colors are a property of the domain, so the domain struct has to =
be
> > > extended.
> > >
> > > Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> > >
> > > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > > ---
> > > v5:
> > > - used - instead of _ for filenames
> > > - removed domain_create_llc_colored()
> > > - removed stub functions
> > > - coloring domain fields are now #ifdef protected
> > > v4:
> > > - Kconfig options moved to xen/arch
> > > - removed range for CONFIG_NR_LLC_COLORS
> > > - added "llc_coloring_enabled" global to later implement the boot-tim=
e
> > >    switch
> > > - added domain_create_llc_colored() to be able to pass colors
> > > - added is_domain_llc_colored() macro
> > > ---
> > >   xen/arch/Kconfig               | 16 ++++++++++++
> > >   xen/common/Kconfig             |  3 +++
> > >   xen/common/domain.c            |  4 +++
> > >   xen/common/keyhandler.c        |  4 +++
> > >   xen/include/xen/llc-coloring.h | 46 +++++++++++++++++++++++++++++++=
+++
> > >   xen/include/xen/sched.h        |  5 ++++
> > >   6 files changed, 78 insertions(+)
> > >   create mode 100644 xen/include/xen/llc-coloring.h
> > >
> > > diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> > > index 67ba38f32f..aad7e9da38 100644
> > > --- a/xen/arch/Kconfig
> > > +++ b/xen/arch/Kconfig
> > > @@ -31,3 +31,19 @@ config NR_NUMA_NODES
> > >       associated with multiple-nodes management. It is the upper boun=
d of
> > >       the number of NUMA nodes that the scheduler, memory allocation =
and
> > >       other NUMA-aware components can handle.
> > > +
> > > +config LLC_COLORING
> > > +   bool "Last Level Cache (LLC) coloring" if EXPERT
> >
> > While look at the rest of the series, I noticed that SUPPORT.md is not
> > updated. Can this be done?
> >
> > I think the feature should be in experimental for now. We can decide to=
 switch
> > to tech preview before Xen 4.19 is out and the support is completed.
> >
> > Stefano, what do you think?
>
> That's reasonable

I would put it under "Resource management" features. Are you ok with it?

Thanks.

