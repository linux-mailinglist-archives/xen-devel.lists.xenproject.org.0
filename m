Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A041D20ABE0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 07:36:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joh2N-00032M-F1; Fri, 26 Jun 2020 05:36:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+r8=AH=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1joh2M-00032H-Gv
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 05:36:30 +0000
X-Inumbo-ID: fbfb0f96-b76e-11ea-b7bb-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbfb0f96-b76e-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 05:36:29 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h22so1847813lji.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2020 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+l+muZt/sw8G/XSlHsPuBLXnNDdXq2H/AVjO/IHBoc=;
 b=K5UV7DHm9sm3s0sHYb6ba/xN6yhjka7U9GIVRvzcWhmYHefr1XG5DjTflYuMoeUMSq
 TUAn/RBtSxiX3HJvfVtUk9kCwiQmGcHx/xCyazjugjCJln4lJo5EjMf8spOFgpo0T5+N
 TRYQ6oLyMEmgzyYAjoUipGDHORX2lcIkK4ubblOYSITS0iDoK2UpHWGivXGOyqJQSgLs
 m/7M1p1kk233506tloZkznzt9JpH7aJ4qt/pW3GsFC699uzoZUruaZJJpnl04B+wQUcM
 V0UlqtGFtm0T2l2ovrVzXP8pqGkyWo7CGCtTYMnXKAMz4D0ityGEf68qvnJ7rktsoQbh
 FyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+l+muZt/sw8G/XSlHsPuBLXnNDdXq2H/AVjO/IHBoc=;
 b=j28oHz0Q0CSYVXI7sIWuU65+u7EJmb7vdipni6K9xb76U6Do3UE6Ee0nW47TAduwNF
 pVNxnoc9iO0Apj6d/6mHcFEEnjHO6uliG5kA23Cc6ea7b+ZmGwht/962LP9gGGHLi+KQ
 +1IW+LQ+UQ8rmfYbQ6704DzIRxo3pQQ0s7z3l2PPR4AKXTj1w5tCSGKe9UFhaZTMMbys
 q0V0DjypPN25XTgEU5ubLGBROlZyz60SZSiivclm+7N/PcW7jrzK6lSe0tAigyMgEDjy
 Isi9dx8pT7DIprZaMIpxIUnXOpdhqg0/IxqKDfWxLmGrSzC6Q6lcautxVo3FJWnTCVOf
 eG/Q==
X-Gm-Message-State: AOAM530YjhXOFUp6sEJ4+crj8efKp7S77V4rbGDppIQTvEM7DzO1DeZE
 QvrhhcjrwMLIbNw4yA2TRdYRhk1NBu7PNBVIUuE=
X-Google-Smtp-Source: ABdhPJzIUFNuOxJQ0Aijnx2p4E9Vz6x+8sGaNXNn5drRq5ZePW0EA4mQt/9xzTyw4YiwM8MaovWxJOaFTbifklgsRNA=
X-Received: by 2002:a2e:7208:: with SMTP id n8mr516027ljc.315.1593149788481;
 Thu, 25 Jun 2020 22:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <1593054160-12628-1-git-send-email-jrdr.linux@gmail.com>
 <a9b8cc50-6635-0551-596b-5a67a8261e59@oracle.com>
In-Reply-To: <a9b8cc50-6635-0551-596b-5a67a8261e59@oracle.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 26 Jun 2020 11:06:17 +0530
Message-ID: <CAFqt6zZDLiz-+3H0Xq_WPYN_=PXtEuWYEvA-HXOUeup_nkVjeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/privcmd: Corrected error handling path and mark
 pages dirty
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
Cc: Juergen Gross <jgross@suse.com>, sstabellini@kernel.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Paul Durrant <xadimgnik@gmail.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 26, 2020 at 5:01 AM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
> On 6/24/20 11:02 PM, Souptick Joarder wrote:
> > Previously, if lock_pages() end up partially mapping pages, it used
> > to return -ERRNO due to which unlock_pages() have to go through
> > each pages[i] till *nr_pages* to validate them. This can be avoided
> > by passing correct number of partially mapped pages & -ERRNO separately,
> > while returning from lock_pages() due to error.
> >
> > With this fix unlock_pages() doesn't need to validate pages[i] till
> > *nr_pages* for error scenario and few condition checks can be ignored.
> >
> > As discussed, pages need to be marked as dirty before unpinned it in
> > unlock_pages() which was oversight.
>
>
> There are two unrelated changes here (improving error path and marking
> pages dirty), they should be handled by separate patches.

Sure, will do it in v2.

>
>
> (I assume marking pages dirty is something you want to go to stable tree
> since otherwise there is no reason for making this change)
>
>
> >
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Paul Durrant <xadimgnik@gmail.com>
> > ---
> > Hi,
> >
> > I'm compile tested this,
>
>
> I don't think so.

I compile test it against ARM and it was fine.
Against which ARCH is it failing ?

>
>
> >  but unable to run-time test, so any testing
> > help is much appriciated.
> >
> >  drivers/xen/privcmd.c | 34 +++++++++++++++++++---------------
> >  1 file changed, 19 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> > index a250d11..0da417c 100644
> > --- a/drivers/xen/privcmd.c
> > +++ b/drivers/xen/privcmd.c
> > @@ -580,43 +580,44 @@ static long privcmd_ioctl_mmap_batch(
> >
> >  static int lock_pages(
> >       struct privcmd_dm_op_buf kbufs[], unsigned int num,
> > -     struct page *pages[], unsigned int nr_pages)
> > +     struct page *pages[], unsigned int nr_pages, int *pinned)
> >  {
> >       unsigned int i;
> > +     int errno = 0, page_count = 0;
>
>
> No need for error, really --- you can return the value immediately.

yes, this is unnecessary.

>
>
> >
> >       for (i = 0; i < num; i++) {
> >               unsigned int requested;
> > -             int pinned;
> >
> > +             *pinned += page_count;
>
>
> I'd move this lower, after a successful call to get_user_pages_fast()
> (and then you won't need to initialize it)

Ok.

>
>
> >               requested = DIV_ROUND_UP(
> >                       offset_in_page(kbufs[i].uptr) + kbufs[i].size,
> >                       PAGE_SIZE);
> >               if (requested > nr_pages)
> >                       return -ENOSPC;
> >
> > -             pinned = get_user_pages_fast(
> > +             page_count = get_user_pages_fast(
> >                       (unsigned long) kbufs[i].uptr,
> >                       requested, FOLL_WRITE, pages);
> > -             if (pinned < 0)
> > -                     return pinned;
> > +             if (page_count < 0) {
> > +                     errno = page_count;
> > +                     return errno;
> > +             }
> >
> > -             nr_pages -= pinned;
> > -             pages += pinned;
> > +             nr_pages -= page_count;
> > +             pages += page_count;
> >       }
> >
> > -     return 0;
> > +     return errno;
> >  }
> >
> >  static void unlock_pages(struct page *pages[], unsigned int nr_pages)
> >  {
> >       unsigned int i;
> >
> > -     if (!pages)
> > -             return;
> > -
> >       for (i = 0; i < nr_pages; i++) {
> > -             if (pages[i])
> > -                     put_page(pages[i]);
> > +             if (!PageDirty(page))
> > +                     set_page_dirty_lock(page);
> > +             put_page(pages[i]);
> >       }
>
>
> This won't compile.
>
>
> -boris
>
>
>

