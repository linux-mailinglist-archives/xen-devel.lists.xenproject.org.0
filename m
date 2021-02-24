Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C793241B2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 17:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89420.168424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEwqu-0003Ld-MZ; Wed, 24 Feb 2021 16:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89420.168424; Wed, 24 Feb 2021 16:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEwqu-0003LD-IF; Wed, 24 Feb 2021 16:17:28 +0000
Received: by outflank-mailman (input) for mailman id 89420;
 Wed, 24 Feb 2021 16:17:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f+Xn=H2=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1lEwqs-0003L8-8O
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 16:17:27 +0000
Received: from mail-ot1-x332.google.com (unknown [2607:f8b0:4864:20::332])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c4207b38-3a37-4950-9d44-a8cfd7764962;
 Wed, 24 Feb 2021 16:17:24 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id s6so2661640otk.4
 for <xen-devel@lists.xenproject.org>; Wed, 24 Feb 2021 08:17:24 -0800 (PST)
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
X-Inumbo-ID: c4207b38-3a37-4950-9d44-a8cfd7764962
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WoFEQ1/bfKoFI9xvg8DWul0UZStnDpuh33pXiEHG16U=;
        b=N4/rUSMsYrYBLT2mWYW11Tj9i5sFyWaQXEkIWwmk5faDg80d4hXBplnYGQb9fvPTVg
         hjP97F8wrC7M83DOiTXQ1mubWe8HtNkh9bTaT4tfOOL2gcASsySWCWKbJJpuDagAyl2R
         wJMirrr073YqLP+Rq4+WnrHyHvuoa6PNBGeL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WoFEQ1/bfKoFI9xvg8DWul0UZStnDpuh33pXiEHG16U=;
        b=HOYD93mfJbOnbLERVUPAidGlsSxoyAdQCa8nk1WAwb+74hKmobwwljmUYoGjzohBUP
         otebEJ8lyIouM8vO2lkFL7IMBatmCpu8/4t44gxHCa/AsmCPvhhW5Kg2hb5m9P6sIGrJ
         JREi5f/7HTq+S0NgojXYV+JU9dHg8IKfdYzq8oXag97PhU/D6LpvqViKzvRcdP1T2Fxb
         8YHDrmd2bmkRYFtOivcy5Tqa/YytUdl6GBbx3fJnXEW2En37GGk93qoq0MzJKx13V1mU
         mStpbcp6pQCC4BtCqpCYsCG4WKRrOHy5GwW1gfNMg1dtvP8k9f364Ubd+I3B/yFwpg6c
         FeMw==
X-Gm-Message-State: AOAM532mBVSX7Z4ahPJJBWDrrH2YGSSUb5fbuM43NgsMXiYPrSTmc7qO
	O+yKL6CVy1zCSImBcGrxcG+iwkzZ5S5vDKoeUPOzCA==
X-Google-Smtp-Source: ABdhPJy5Y98h9GUiqrOFjUQF2+PwNwCz5OXAmFFcvCNRB9jriSwRzPjd90bBKiziOEProUm0GiPXnDfVdnnviyzzWx4=
X-Received: by 2002:a9d:2265:: with SMTP id o92mr24849267ota.188.1614183444301;
 Wed, 24 Feb 2021 08:17:24 -0800 (PST)
MIME-Version: 1.0
References: <54ae54f9-1ba9-900b-a56f-f48e2c9a82b0@suse.com> <a9597f1a-39a6-3664-8617-90338e7943d0@epam.com>
In-Reply-To: <a9597f1a-39a6-3664-8617-90338e7943d0@epam.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 24 Feb 2021 17:17:13 +0100
Message-ID: <CAKMK7uGV25ERN0wy1pJvZqvC0QXBh=oQ_RfpRy7+ViQbEdBNPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/xen: adjust Kconfig
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 24, 2021 at 8:55 AM Oleksandr Andrushchenko
<Oleksandr_Andrushchenko@epam.com> wrote:
>
> Hello, Jan!
>
> On 2/23/21 6:41 PM, Jan Beulich wrote:
> > By having selected DRM_XEN, I was assuming I would build the frontend
> > driver. As it turns out this is a dummy option, and I have really not
> > been building this (because I had DRM disabled). Make it a promptless
> > one, moving the "depends on" to the other, real option, and "select"ing
> > the dummy one.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Since you're maintainer/committer, I'm assuming you'll also merge
this? Always confusing when there's an r-b but nothing about whether
the patch will get merged or not.
-Daniel

> > --- a/drivers/gpu/drm/xen/Kconfig
> > +++ b/drivers/gpu/drm/xen/Kconfig
> > @@ -1,15 +1,11 @@
> >   # SPDX-License-Identifier: GPL-2.0-only
> >   config DRM_XEN
> > -     bool "DRM Support for Xen guest OS"
> > -     depends on XEN
> > -     help
> > -       Choose this option if you want to enable DRM support
> > -       for Xen.
> > +     bool
> >
> >   config DRM_XEN_FRONTEND
> >       tristate "Para-virtualized frontend driver for Xen guest OS"
> > -     depends on DRM_XEN
> > -     depends on DRM
> > +     depends on XEN && DRM
> > +     select DRM_XEN
> >       select DRM_KMS_HELPER
> >       select VIDEOMODE_HELPERS
> >       select XEN_XENBUS_FRONTEND
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

