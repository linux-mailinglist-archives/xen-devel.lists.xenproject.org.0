Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C382ABC6
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 11:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666117.1036586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNs8c-0002th-0K; Thu, 11 Jan 2024 10:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666117.1036586; Thu, 11 Jan 2024 10:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNs8b-0002qq-T8; Thu, 11 Jan 2024 10:18:13 +0000
Received: by outflank-mailman (input) for mailman id 666117;
 Thu, 11 Jan 2024 10:18:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nyxv=IV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rNs8a-0002qk-7W
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 10:18:12 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b90b2ff3-b06a-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 11:18:11 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50eac018059so6391670e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 02:18:11 -0800 (PST)
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
X-Inumbo-ID: b90b2ff3-b06a-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704968291; x=1705573091; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tyn+8LYbh8AWGusmGVXZ3mQVmHwQC9PpIBkD9NUbPVI=;
        b=n+yihhRXyLzk3PV86OGWeyga5aC1+wKK/9DmgEg8GkHddAeLl5zK8hgvKVoezQUeJe
         R8ZgoJUu/xCDYXF8tDiYlVS/s8RDGciR1oD/uGOn6N45bODRDo8l7WsmTYZ+BSaQHTS7
         K6HmUfahNJtWLqwaTscgRVXkMReo8L3TAt1Q6JHY3aAJgzZdYDCC50m+a7ye/QGbpo9Y
         jkv+W75/kXCtoSfW+Xlvvlbv320RFd44Yoq3osY1ZSsgb0Jfk1UhITCr134ghxjkjYed
         s2AQr79fKguN3OvVFV1SVhUbRp51E/x93HGreDM5VIQ/z9Uu+CLDFB1V1A+9iCCXqdjB
         rJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704968291; x=1705573091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tyn+8LYbh8AWGusmGVXZ3mQVmHwQC9PpIBkD9NUbPVI=;
        b=aArG3BElNGd14nqu+x3WmPe+olffw+9dmrv1TfyWmG1C+efNexMpQl8Sk/cc8mRoHn
         1H2/379GlJRve2MK82E9JqKb69+PIiz49SHR87ecwYZ3HHxVOi4GX8XK+tcifCj2fPF9
         FXU7E3vrzX5/kwfjtf1dvYZQQCzxGGz2qrWrxjVSNGcMHF5Zo9HEz19citq4BNrR3gjz
         ybdOHgbYtemMeJMnSehOaXiBcy9nuqYtHDlHLfv2WKHoWl0DWC9kB1GL9/h1wn6NMkCh
         Gbbf023YFqjKh36/k6SCs1ENk3a7WyLTPBD2H+yzLaWLPYEkNwChX9X58ztRDnHS20yA
         fPuA==
X-Gm-Message-State: AOJu0Yy/LZ7qu+Kn8H0Zv46I4DYzANRydldptWQtHVjIT1hUdkHR9X3e
	kdOCu2iE9V1npsiTGwFUslVF2X9s9pxZIQ5GgrcZkvdv7WMmag==
X-Google-Smtp-Source: AGHT+IG4Zn9knhmyZBuxU1Fdcb7j3p8yObT7SC5gHZ2BrDYz/iu/BBeubAim1hFkkENV0xGezAE7OZmtyB7RC1f6tdU=
X-Received: by 2002:ac2:5e6f:0:b0:50e:7e55:be9c with SMTP id
 a15-20020ac25e6f000000b0050e7e55be9cmr419274lfr.49.1704968290322; Thu, 11 Jan
 2024 02:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-3-carlo.nonato@minervasys.tech> <5eb9fa24-c95e-4ea0-84ef-be74c629c106@xen.org>
 <CAG+AhRW5Xxy7BHVhmfkBqbdeKqRz7E1Mrc7wNv6F+ecM4P_QPw@mail.gmail.com>
In-Reply-To: <CAG+AhRW5Xxy7BHVhmfkBqbdeKqRz7E1Mrc7wNv6F+ecM4P_QPw@mail.gmail.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Thu, 11 Jan 2024 11:17:59 +0100
Message-ID: <CAG+AhRUw23a92v7geAwoDX-vqPLTPUEg3uoyOTThiUzL1CTk7w@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] xen/arm: add cache coloring initialization
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@minervasys.tech>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

> > > +bool __init llc_coloring_init(void)
> > > +{
> > > +    if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
> > > +    {
> > > +        printk(XENLOG_ERR
> > > +               "Probed LLC way size is 0 and no custom value provided\n");
> > > +        return false;
> > > +    }
> > > +
> > > +    /*
> > > +     * The maximum number of colors must be a power of 2 in order to correctly
> > > +     * map them to bits of an address, so also the LLC way size must be so.
> > > +     */
> > > +    if ( llc_way_size & (llc_way_size - 1) )
> > > +    {
> > > +        printk(XENLOG_WARNING "LLC way size (%u) isn't a power of 2.\n",
> > > +               llc_way_size);
> > > +        llc_way_size = 1U << flsl(llc_way_size);
> > > +        printk(XENLOG_WARNING
> > > +               "Using %u instead. Performances will be suboptimal\n",
> > > +               llc_way_size);
> > > +    }
> > > +
> > > +    nr_colors = llc_way_size >> PAGE_SHIFT;
> > > +
> > > +    if ( nr_colors < 2 || nr_colors > CONFIG_NR_LLC_COLORS )
> >
> > I didn't find any documentation explaining why we need at least two
> > colors. I guess you want to make sure that there is a color for Xen and
> > domain. But I wonder what could wrong with just one color (other than
> > been pointless)?
>
> Yes, it would just be pointless. I'll change it to 1.

Just wanted to correct myself here. Having just a single color introduces a
clear sharing of the cache between Xen and domains. So it's not just
pointless, but also inefficient. I would discourage such a configuration, so I
plan to better describe this with a range in the Kconfig option (see
discussion in #1).

Thanks

