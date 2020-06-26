Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE24120ABD7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 07:28:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jogtJ-0002AL-HH; Fri, 26 Jun 2020 05:27:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+r8=AH=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jogtH-0002AG-Er
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 05:27:07 +0000
X-Inumbo-ID: ac3644ae-b76d-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac3644ae-b76d-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 05:27:06 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h22so1831133lji.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2020 22:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VuCEJOiQoqa0Rytop5ZoclTGnejYAU1zTtQWpgV+XJk=;
 b=tRZemnxbVY6+6epMlhA+YSEtiuBGPEfAgB7O3fyn6uOiRsNkYm8inikyYy99XChNgC
 IjyB5mPxS+WDnHZLaTELQk0or68E/i08k+5eQ3qHN3hKJ1lSGExWo7fLmnSljN8CSPZs
 3aotvq09CnSbdrOE4Qao5qky74s3HwM8Lhtc8h6mzIfbma4aaEyH8/pfiNoqDA0cMX7m
 Hua8P47pfUW94Ms5WNu2oeE2qYHV5+np7uwKMXTbrBkfI6BepiAUIbwVtsafO2aWaVhP
 ZEYnQCUjJEmgnL+8WiH40CxOdIE5lltvkb7bOjS9g6lRMmYGAfsqdBfeGs60h3rO6SNw
 RTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VuCEJOiQoqa0Rytop5ZoclTGnejYAU1zTtQWpgV+XJk=;
 b=YuzMbkNxWSeN5MarjmC6bKElZU8UaAUMfmdlmnbncIWdAqDA4m2XKbccxYENlkxMs9
 VnUKiTwCrpPXWjANG0LGVwSDSRFQUxqpwZjIuhKwRgOs24np5NCKqjMSFNYLZCXRWRc2
 C+p9hzgC2x0c5KmcxpSlu4KMVQO6id/YuK2wJVKYzMQpT8r3zvpJzl55Y+INhQflS8ZG
 BWB/VRVnVrkq5N2L9OsNyBWOpTyKlxfon4Qg0majey6EiQzAj/3/dUg9opjuVSwhkXzE
 RE+824IvJYT3VX/XZboC/Amup1j1x7PhPL9sRxgBF5gXAyqP6Oe7sbkN5HNXDzpvDSa4
 vB6Q==
X-Gm-Message-State: AOAM530ji8tMKNyD8vNvm8MRorDGvSljsB5epED+nNu/gPfAnWG72hhc
 TyDDdv6uKSKBz/T4QjQ+TNnG5v8GHHay8cFoPBE=
X-Google-Smtp-Source: ABdhPJympWOSvfCz5C0Bh0T+ZGbmTwsB4TIChwXQNXDAd0cIBhtJwVxJLh3CgynI4lIIQS2Vw2jHrcfucD0IFOhz1vE=
X-Received: by 2002:a2e:b704:: with SMTP id j4mr593539ljo.458.1593149225080;
 Thu, 25 Jun 2020 22:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
 <1593054160-12628-2-git-send-email-jrdr.linux@gmail.com>
 <59afe2fe-3718-85aa-f3b5-83ca0b9df577@nvidia.com>
In-Reply-To: <59afe2fe-3718-85aa-f3b5-83ca0b9df577@nvidia.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 26 Jun 2020 10:56:53 +0530
Message-ID: <CAFqt6zZdq_OMZ3EBDGC+Bn4uPBEhDGOYF=jB4B16z7rY6hpZ7g@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/privcmd: Convert get_user_pages*() to
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
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org,
 linux-kernel@vger.kernel.org, Paul Durrant <xadimgnik@gmail.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 25, 2020 at 11:19 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2020-06-24 20:02, Souptick Joarder wrote:
> > In 2019, we introduced pin_user_pages*() and now we are converting
> > get_user_pages*() to the new API as appropriate. [1] & [2] could
> > be referred for more information. This is case 5 as per document [1].
> >
> > [1] Documentation/core-api/pin_user_pages.rst
> >
> > [2] "Explicit pinning of user-space pages":
> >          https://lwn.net/Articles/807108/
> >
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Paul Durrant <xadimgnik@gmail.com>
> > ---
> > Hi,
> >
> > I'm compile tested this, but unable to run-time test, so any testing
> > help is much appriciated.
> >
> >   drivers/xen/privcmd.c | 10 ++--------
> >   1 file changed, 2 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> > index 0da417c..eb05254 100644
> > --- a/drivers/xen/privcmd.c
> > +++ b/drivers/xen/privcmd.c
> > @@ -595,7 +595,7 @@ static int lock_pages(
> >               if (requested > nr_pages)
> >                       return -ENOSPC;
> >
> > -             page_count = get_user_pages_fast(
> > +             page_count = pin_user_pages_fast(
> >                       (unsigned long) kbufs[i].uptr,
> >                       requested, FOLL_WRITE, pages);
> >               if (page_count < 0) {
> > @@ -612,13 +612,7 @@ static int lock_pages(
> >
> >   static void unlock_pages(struct page *pages[], unsigned int nr_pages)
> >   {
> > -     unsigned int i;
> > -
> > -     for (i = 0; i < nr_pages; i++) {
> > -             if (!PageDirty(page))
> > -                     set_page_dirty_lock(page);
> > -             put_page(pages[i]);
> > -     }
> > +     unpin_user_pages_dirty_lock(pages, nr_pages, 1);
>
> "true", not "1", is the correct way to call that function.

Ok.

>
> Also, this approach changes the behavior slightly, but I think it's
> reasonable to just set_page_dirty_lock() on the whole range--hard to
> see much benefit in checking PageDirty first.

unpin_user_pages_dirty_lock() internally will do the same check after
patch [2/2]
So I thought to keep old and new code in sync. Shall we avoid this check ?


>
>
> >   }
> >
> >   static long privcmd_ioctl_dm_op(struct file *file, void __user *udata)
> >
>
> thanks,
> --
> John Hubbard
> NVIDIA

