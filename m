Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E261200093
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 05:14:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm7SZ-0004PI-1Q; Fri, 19 Jun 2020 03:12:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xII3=AA=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jm7SX-0004OZ-GH
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 03:12:53 +0000
X-Inumbo-ID: c2fe21f4-b1da-11ea-b7bb-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2fe21f4-b1da-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 03:12:52 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y13so4707073lfe.9
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 20:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ux+RlrRIaul1vx3+RsucEfoBIW1+wn2hepN2AwYL3gA=;
 b=Bt+wAPHbtIEVMjqIuaGC/1uyx9g+h0JmstAgvL3YJl4+t451+WyOTbJOfEvXeXX9eD
 1Ltc346gaSEn7p3ivSehx5IBh4xH6ymqh+Cq5lYwtfijHLGYMnDbhhfUEQEC6v7QTi9t
 Gvpm/+doEjzk2t50RGWoXl/eMh2lar/D82DnoQZeJv6XzRq+Fc5AvAcG2D+/Hskhaijt
 5qOCFYr9fyIP7Xa+r/t0Lv45+tYjKdVg59nS+ejWw+WcV4bkYdYXGAGgDgDTeKjRc7CK
 GEn4QL8/i4qrDlg0rT9E35HKdjJaOz/dsHKWRrtezLn9lpB9h6gMQoE0SemWFonpZquG
 NmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ux+RlrRIaul1vx3+RsucEfoBIW1+wn2hepN2AwYL3gA=;
 b=IYliRRqc6IEOAdgJqxof/Aoev/iZY6uCgWKMcTc2TCRJt7gZCy6jeEHyO7KRJC/lvz
 QI2AOVzCwWeCYMxvkyOoyHw0SftK8CHRdUWBLm3GNzdxzRZchZRRtPuPogSKhMus1lzh
 7YhNvpSWfr8SCPk6aiFO3d7ZtGzjhhNbhdDuQnDj1Gpd10+I2252rYu8RNfVS8pbPazO
 ZQO/fO6i0K/270XvCgm56dBGozZx320FYL+fpza5VUyk94oL8rmk/Szx5gdElY8D/6fE
 fVPg51Wd9QS3BMN4MUZhcgwG0y07D308U/dictuv53ohhsSYmKMwryjC3H7IGhfF93/i
 z3zw==
X-Gm-Message-State: AOAM532cHINz2ABDnU+n8YNX6rws7slXnraOGRv+NinHmvii3J0WMbEC
 3dGk48Il/GND/PpehndJbpUWENR+Vh93m8WDjNw=
X-Google-Smtp-Source: ABdhPJwoJSHfdvQytNKngbcarE9utMq6l97RiL9akPNyVTfXUc439uP32EBiYbbxCOoeDZvLjAyRLu9iHNLCGLt7VZU=
X-Received: by 2002:a19:b07:: with SMTP id 7mr509645lfl.38.1592536371497; Thu,
 18 Jun 2020 20:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <1592363698-4266-1-git-send-email-jrdr.linux@gmail.com>
 <d9e8ad0f-f2aa-eea4-5bc7-a802c626ace6@oracle.com>
In-Reply-To: <d9e8ad0f-f2aa-eea4-5bc7-a802c626ace6@oracle.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 19 Jun 2020 08:42:39 +0530
Message-ID: <CAFqt6zbJD+k9xkV9Se0nL2qKfnea3mRrWJ4gzPmPJBquYk4M+w@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org, paul@xen.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 17, 2020 at 11:29 PM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
> On 6/16/20 11:14 PM, Souptick Joarder wrote:
> > In 2019, we introduced pin_user_pages*() and now we are converting
> > get_user_pages*() to the new API as appropriate. [1] & [2] could
> > be referred for more information.
> >
> > [1] Documentation/core-api/pin_user_pages.rst
> >
> > [2] "Explicit pinning of user-space pages":
> >         https://lwn.net/Articles/807108/
> >
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > ---
> > Hi,
> >
> > I have compile tested this patch but unable to run-time test,
> > so any testing help is much appriciated.
> >
> > Also have a question, why the existing code is not marking the
> > pages dirty (since it did FOLL_WRITE) ?
>
>
> Indeed, seems to me it should. Paul?
>
>
> >
> >  drivers/xen/privcmd.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> > index a250d11..543739e 100644
> > --- a/drivers/xen/privcmd.c
> > +++ b/drivers/xen/privcmd.c
> > @@ -594,7 +594,7 @@ static int lock_pages(
> >               if (requested > nr_pages)
> >                       return -ENOSPC;
> >
> > -             pinned = get_user_pages_fast(
> > +             pinned = pin_user_pages_fast(
> >                       (unsigned long) kbufs[i].uptr,
> >                       requested, FOLL_WRITE, pages);
> >               if (pinned < 0)
> > @@ -614,10 +614,7 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
> >       if (!pages)
> >               return;
> >
> > -     for (i = 0; i < nr_pages; i++) {
> > -             if (pages[i])
> > -                     put_page(pages[i]);
> > -     }
> > +     unpin_user_pages(pages, nr_pages);
>
>
> Why are you no longer checking for valid pages?

My understanding is, in case of lock_pages() end up returning partial
mapped pages,
we should pass no. of partial mapped pages to unlock_pages(), not nr_pages.
This will avoid checking extra check to validate the pages[i].

and if lock_pages() returns 0 in success, anyway we have all the pages[i] valid.
I will try to correct it in v2.

But I agree, there is no harm to check for pages[i] and I believe,
unpin_user_pages()
is the right place to do so.

John any thought ?

