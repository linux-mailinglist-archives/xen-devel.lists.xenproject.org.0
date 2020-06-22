Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE024203F67
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 20:45:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnRQx-0006XP-K1; Mon, 22 Jun 2020 18:44:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OZr4=AD=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jnRQv-0006XK-W0
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 18:44:42 +0000
X-Inumbo-ID: 6e3ce688-b4b8-11ea-bb8b-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e3ce688-b4b8-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 18:44:41 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id g2so10260033lfb.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2020 11:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bsa2D8UcUdmWeSVi19Th9t5QWO+7dW+3wkTgqvnKWig=;
 b=rkI2USsN/jAc+p2oilopycy25wr5sVI0tpE2XgEi6pMS/rAQbP7Hu26UR19nfOq1AJ
 1Np5Qo2/xMDdO95rUi5ytBqxbCK2w4BlWMl5z+bmsPHMTUSBbdJt5DbMQuaFAHu3GsE3
 hwGcOZtlqQSOx98Ccw6FViwLUqd8WVOjvdPIk8D9wZMA9ReaVhAYgEHpiR64jXe9FJKD
 SSXVNwkefgbQAKI/mrun0pFeINVWBsg+T/l3iCorhuci/7B5/ehgHBErhOy9GFBHPr08
 lmKZj+cqwUytlTTcH2nJyWykLOcJJ/aZT0F2qIBlAhfLdLnxlmRp+NlswiEiG6VvnbO5
 PZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bsa2D8UcUdmWeSVi19Th9t5QWO+7dW+3wkTgqvnKWig=;
 b=NCPbRw5i148Jo4wHfo209iXL1S5n4SsxVFPn6zX+FUklnT5uro2sbJawE8Flvs9CTW
 WmnacfV1P508z8+K5kuAsINr4FzEuGiK+KkJvM+9t4ntT5uphrwtRyR4Qj/0JI27QkaS
 NfV+8AKzwEu5ts6tyM8fj4WfYBtHedF5oH5WkDiZwMX2rio0gnjyVkD5Z1DCYK7ILzQ2
 2Ws0hG5gtIUSgadoPszYMF557JYFh57sp2NoQbelX4jHI2nADCODdQcpDWvbT4cJDtP2
 w1d9l3luZ5Hh2J6msgbjL9hVXTf7Q652rbd5UaCus4rqCxS+OzJqcCOX58DwYU9T/Okk
 +AAg==
X-Gm-Message-State: AOAM530Sl1KlmPFKtNdONnXHuIw5ikCtBdoJwxPVTYVW8ingSUcYtv2C
 o84fOmua4sC+ct1fEHKhz1bHl5cV/vBQkH+QF/g=
X-Google-Smtp-Source: ABdhPJxr4uBUcKdGTWVm9gTrdLJWlX+Uz75PHVP1LlPA9Qi3PeqXxZmwj0YtBtqv0zY1bHUzBIsUY0GR1ixqYwH0wio=
X-Received: by 2002:a19:c744:: with SMTP id x65mr10603363lff.133.1592851479925; 
 Mon, 22 Jun 2020 11:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <1592363698-4266-1-git-send-email-jrdr.linux@gmail.com>
 <d9e8ad0f-f2aa-eea4-5bc7-a802c626ace6@oracle.com>
 <CAFqt6zbJD+k9xkV9Se0nL2qKfnea3mRrWJ4gzPmPJBquYk4M+w@mail.gmail.com>
 <fe2a1d23-7abd-86a9-4aec-2c14fb11cdea@nvidia.com>
In-Reply-To: <fe2a1d23-7abd-86a9-4aec-2c14fb11cdea@nvidia.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 23 Jun 2020 00:22:56 +0530
Message-ID: <CAFqt6zb8hK+mpqfrZ_QoGLO4nNfbHvZ7aJLRrcNRgDsywFHKqg@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/privcmd: Convert get_user_pages*() to
 pin_user_pages*()
To: John Hubbard <jhubbard@nvidia.com>
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
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 19, 2020 at 1:00 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2020-06-18 20:12, Souptick Joarder wrote:
> > On Wed, Jun 17, 2020 at 11:29 PM Boris Ostrovsky
> > <boris.ostrovsky@oracle.com> wrote:
> >>
> >> On 6/16/20 11:14 PM, Souptick Joarder wrote:
> >>> In 2019, we introduced pin_user_pages*() and now we are converting
> >>> get_user_pages*() to the new API as appropriate. [1] & [2] could
> >>> be referred for more information.
>
>
> Ideally, the commit description should say which case, in
> pin_user_pages.rst, that this is.
>

Ok.

>
> >>>
> >>> [1] Documentation/core-api/pin_user_pages.rst
> >>>
> >>> [2] "Explicit pinning of user-space pages":
> >>>          https://lwn.net/Articles/807108/
> >>>
> >>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> >>> Cc: John Hubbard <jhubbard@nvidia.com>
> >>> ---
> >>> Hi,
> >>>
> >>> I have compile tested this patch but unable to run-time test,
> >>> so any testing help is much appriciated.
> >>>
> >>> Also have a question, why the existing code is not marking the
> >>> pages dirty (since it did FOLL_WRITE) ?
> >>
> >>
> >> Indeed, seems to me it should. Paul?
>
> Definitely good to get an answer from an expert in this code, but
> meanwhile, it's reasonable to just mark them dirty. Below...
>
> >>
> >>
> >>>
> >>>   drivers/xen/privcmd.c | 7 ++-----
> >>>   1 file changed, 2 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> >>> index a250d11..543739e 100644
> >>> --- a/drivers/xen/privcmd.c
> >>> +++ b/drivers/xen/privcmd.c
> >>> @@ -594,7 +594,7 @@ static int lock_pages(
> >>>                if (requested > nr_pages)
> >>>                        return -ENOSPC;
> >>>
> >>> -             pinned = get_user_pages_fast(
> >>> +             pinned = pin_user_pages_fast(
> >>>                        (unsigned long) kbufs[i].uptr,
> >>>                        requested, FOLL_WRITE, pages);
> >>>                if (pinned < 0)
> >>> @@ -614,10 +614,7 @@ static void unlock_pages(struct page *pages[], unsigned int nr_pages)
> >>>        if (!pages)
> >>>                return;
> >>>
> >>> -     for (i = 0; i < nr_pages; i++) {
> >>> -             if (pages[i])
> >>> -                     put_page(pages[i]);
> >>> -     }
> >>> +     unpin_user_pages(pages, nr_pages);
>
>
> ...so just use unpin_user_pages_dirty_lock() here, I think.
>
>
> >>
> >>
> >> Why are you no longer checking for valid pages?
> >
> > My understanding is, in case of lock_pages() end up returning partial
> > mapped pages,
> > we should pass no. of partial mapped pages to unlock_pages(), not nr_pages.
> > This will avoid checking extra check to validate the pages[i].
> >
> > and if lock_pages() returns 0 in success, anyway we have all the pages[i] valid.
> > I will try to correct it in v2.
> >
> > But I agree, there is no harm to check for pages[i] and I believe,
>
>
> Generally, it *is* harmful to do unnecessary checks, in most code, but especially
> in most kernel code. If you can convince yourself that the check for null pages
> is redundant here, then please let's remove that check. The code becomes then
> becomes shorter, simpler, and faster.

I read the code again. I think, this check is needed to handle a scenario when
lock_pages() return -ENOSPC. Better to keep this check. Let me post v2 of this
RFC for a clear view.

>
>
> > unpin_user_pages()
> > is the right place to do so.
> >
> > John any thought ?
>
>
> So far I haven't seen any cases to justify changing the implementation of
> unpin_user_pages().
>
>
> thanks,
> --
> John Hubbard
> NVIDIA

