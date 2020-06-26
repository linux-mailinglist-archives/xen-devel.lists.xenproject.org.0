Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B963B20AC80
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 08:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joiAA-0000ZS-2L; Fri, 26 Jun 2020 06:48:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+r8=AH=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1joiA9-0000ZN-1U
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 06:48:37 +0000
X-Inumbo-ID: 0ecb8844-b779-11ea-8496-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ecb8844-b779-11ea-8496-bc764e2007e4;
 Fri, 26 Jun 2020 06:48:36 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n23so9166972ljh.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2020 23:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tAiutF2JVV2jVzi4JN5lKA5pAFxBJvB1zS7W+zLCNGU=;
 b=Jz68M9cZSFRsa1lfuYI3fBa8wMImUyWpZmFLLZbO40bbGfouXOj3N6vDdnVrcVqqTX
 Lbi15a+HZlQXw04tJgZx7ZXkGgXgQERKqgR7Z/sv2m7ETVW9mami6HmOgwYPMhOdUecQ
 wvzjWm6VbFP3Jly0snbok9qhBxmvxgclwE3n0J0kwGzahrDuDGL9ZhVzLJyH8Znv3FDx
 lqoAb4K+DUnybEjiQ7y3HXXOpNX9vwZL5Ce+k22vvFszcQcxlNO+rRwx5WziQwbbXVhq
 my1X1ocgZrIQp7b2Leqc5DRVI+4Qf/008okO2tVZ1QGMj84x5Tj6SYrNxSBZ8/fqkyq0
 thCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tAiutF2JVV2jVzi4JN5lKA5pAFxBJvB1zS7W+zLCNGU=;
 b=D00zSUekBKiyMsk2I58WysvJxsnifaB1SHTiQQ20u7Kv/xF4EEjTXQUi1sK8U/Boyb
 67o0KuKmCLvAHmVsDmc08OBRmcefftQv/Ejcfcgt83H+9sgDUe42CiiM0vrv3uIwsKtW
 9vZfS8AKjJFCAIqEg/81zaObDdc6wlRYlz15fzj3rKt/2/9rLhFPS9aFsmbsHX9a4Cd1
 T5263ntZDm5psy5SNKUt/zqzlYe/kF3W+8Hhir8gF4dCH1xlDKmRG3Weq6lmvTDRT6d/
 Fadwb+h6yLMd/mw0+u0JqhHl9kGReCMWCAUhMAoFUqAHFWoOBJawxqxiellrh+fgV55A
 9btQ==
X-Gm-Message-State: AOAM531uSnMnBIocf0A+yauIn1IrnHzsnTN55EMt2AJhOlfO7RAF+jlD
 gzqRp8XeESypzBQ4U8ObGtP2B9pKVIQwc1pnflk=
X-Google-Smtp-Source: ABdhPJwywRiIDFcdW8SgEjZ9w6GKNMQWagCVc2TIKPv5IsPXc4jb6x5KjKPF+JpzzRyAUIZFamnEc6LM3RArfv1S/9I=
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr551883ljf.257.1593154114931;
 Thu, 25 Jun 2020 23:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
 <9ff52733-6ce0-6bda-8e49-a6908b4ff7dc@suse.com>
In-Reply-To: <9ff52733-6ce0-6bda-8e49-a6908b4ff7dc@suse.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 26 Jun 2020 12:18:23 +0530
Message-ID: <CAFqt6zYvU7hFoY_5T2P0C4=G_gZWoQZYCpdcMM6Mn9WQ_rnXaQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/privcmd: Corrected error handling path and mark
 pages dirty
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: sstabellini@kernel.org, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, Paul Durrant <xadimgnik@gmail.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 11:22 AM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wr=
ote:
>
> On 25.06.20 05:02, Souptick Joarder wrote:
> > Previously, if lock_pages() end up partially mapping pages, it used
> > to return -ERRNO due to which unlock_pages() have to go through
> > each pages[i] till *nr_pages* to validate them. This can be avoided
> > by passing correct number of partially mapped pages & -ERRNO separately=
,
> > while returning from lock_pages() due to error.
> >
> > With this fix unlock_pages() doesn't need to validate pages[i] till
> > *nr_pages* for error scenario and few condition checks can be ignored.
> >
> > As discussed, pages need to be marked as dirty before unpinned it in
> > unlock_pages() which was oversight.
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
> >   drivers/xen/privcmd.c | 34 +++++++++++++++++++---------------
> >   1 file changed, 19 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> > index a250d11..0da417c 100644
> > --- a/drivers/xen/privcmd.c
> > +++ b/drivers/xen/privcmd.c
> > @@ -580,43 +580,44 @@ static long privcmd_ioctl_mmap_batch(
> >
> >   static int lock_pages(
> >       struct privcmd_dm_op_buf kbufs[], unsigned int num,
> > -     struct page *pages[], unsigned int nr_pages)
> > +     struct page *pages[], unsigned int nr_pages, int *pinned)
>
> unsigned int *pinned, please.
>
> >   {
> >       unsigned int i;
> > +     int errno =3D 0, page_count =3D 0;
>
> Please drop the errno variable. It is misnamed (you never assign an
> errno value to it) and not needed, as you can ...
>
> >
> >       for (i =3D 0; i < num; i++) {
> >               unsigned int requested;
> > -             int pinned;
> >
> > +             *pinned +=3D page_count;
> >               requested =3D DIV_ROUND_UP(
> >                       offset_in_page(kbufs[i].uptr) + kbufs[i].size,
> >                       PAGE_SIZE);
> >               if (requested > nr_pages)
> >                       return -ENOSPC;
> >
> > -             pinned =3D get_user_pages_fast(
> > +             page_count =3D get_user_pages_fast(
> >                       (unsigned long) kbufs[i].uptr,
> >                       requested, FOLL_WRITE, pages);
> > -             if (pinned < 0)
> > -                     return pinned;
> > +             if (page_count < 0) {
> > +                     errno =3D page_count;
> > +                     return errno;
>
> ... just return page_count her, and ...
>
> > +             }
> >
> > -             nr_pages -=3D pinned;
> > -             pages +=3D pinned;
> > +             nr_pages -=3D page_count;
> > +             pages +=3D page_count;
> >       }
> >
> > -     return 0;
> > +     return errno;
>
> ... leave this as it was.
>
> >   }
> >
> >   static void unlock_pages(struct page *pages[], unsigned int nr_pages)
> >   {
> >       unsigned int i;
> >
> > -     if (!pages)
> > -             return;
> > -
> >       for (i =3D 0; i < nr_pages; i++) {
> > -             if (pages[i])
> > -                     put_page(pages[i]);
> > +             if (!PageDirty(page))
> > +                     set_page_dirty_lock(page);
>
> page? Not pages[i]?

I fixed it in compile branch, but missed it in patch creation work
space at the time of posting.
I think, this is the compile error Boris was pointing to.
Sorry about it. I will fix it and post the v2.

>
> > +             put_page(pages[i]);
> >       }
> >   }
> >
> > @@ -630,6 +631,7 @@ static long privcmd_ioctl_dm_op(struct file *file, =
void __user *udata)
> >       struct xen_dm_op_buf *xbufs =3D NULL;
> >       unsigned int i;
> >       long rc;
> > +     int pinned =3D 0;
> >
> >       if (copy_from_user(&kdata, udata, sizeof(kdata)))
> >               return -EFAULT;
> > @@ -683,9 +685,11 @@ static long privcmd_ioctl_dm_op(struct file *file,=
 void __user *udata)
> >               goto out;
> >       }
> >
> > -     rc =3D lock_pages(kbufs, kdata.num, pages, nr_pages);
> > -     if (rc)
> > +     rc =3D lock_pages(kbufs, kdata.num, pages, nr_pages, &pinned);
> > +     if (rc < 0) {
> > +             nr_pages =3D pinned;
> >               goto out;
> > +     }
> >
> >       for (i =3D 0; i < kdata.num; i++) {
> >               set_xen_guest_handle(xbufs[i].h, kbufs[i].uptr);
> >
>
>
> Juergen

