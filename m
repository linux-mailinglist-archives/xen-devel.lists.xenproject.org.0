Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459E216BD1
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 13:40:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jslxX-0002If-B5; Tue, 07 Jul 2020 11:40:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aoUK=AS=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jslxV-0002Ia-Sf
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 11:40:21 +0000
X-Inumbo-ID: a30a3232-c046-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a30a3232-c046-11ea-bb8b-bc764e2007e4;
 Tue, 07 Jul 2020 11:40:21 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j11so757868ljo.7
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2020 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NlD5Coj6tItyyuvkckmXcC1NzYj94/V/Y7EED+OVWYo=;
 b=ur/ID3tfSVMUmuYc56bPe6NPM1LH2sYj4bu4bhvgZAmORagv/bvqXunhRxwyqeod6L
 SOm/cGGjOtiumCNKjq0K3oDIZWwDwqm95Dj83bqeIZD2Rtyf6YOKwx6sGcjHePyu7aUj
 G1nKcmBmSiqLu18Io1vVZcf9ny8a+5q1hBkQjzbmra5VbcqKI8Q2Tq7ljTYr3gjOs0IY
 bEFhHK2Swntv/N5IkEbC5vyIlSwff0Svb4JNTFaxeweXV1er6tXcsdYxwJ9zkC85J2wh
 ViXR4KEJnfkEY8clR9ou0fiEewKDwfvy4M/9i+ZMwrzhbHf7z6Ls3fe8LzrJ5jnMHQy4
 +m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NlD5Coj6tItyyuvkckmXcC1NzYj94/V/Y7EED+OVWYo=;
 b=aKHZeLDm3tbsTWXr3qq9/gy3j83Xw3iBH+/NDQH78BfBVCbkiy+S2SYZyVNmm+VBl/
 QsmJxjlCcxyshENaTOP3ie9T2BtgIHAZKob6ycpf3abAi4ng00LwiflomDRe7I425VvU
 GYZVKqcRc74yhkFCdDEe9lXrvF4KNiuwIgkufpxjBfZmWcfiFXNirwbwz+N6+6qLq0dY
 7MVeZKrNv6X76l17AXuaFm57vkQJdZwkzcZE8FKZI1ixmCjOYYK1V8WyaNxqtYS66LjT
 rFKzYDa6GjcDa41twz3QP71L1jof6pNkqXOF94yOUCjKYrWt4rWDBgHKV5JAPxNPr5kP
 ubvg==
X-Gm-Message-State: AOAM533xGWUqYKn+4hAsvm3D1kFwvzd5cKK1tfzMNfi8b8+zdllWtSsP
 CxptigRwM6ciL0/da6P6GR0+M9MPcB1al2elSmQ=
X-Google-Smtp-Source: ABdhPJzhH1+0xPd3Q4buxdjJqgwE4vDYVmSliZxyPTqVkoGiSg5XII9WREdm6ITrWaZ34HU1/VmklFDcrGbcJ8rh5yw=
X-Received: by 2002:a2e:9746:: with SMTP id f6mr22572230ljj.68.1594122019940; 
 Tue, 07 Jul 2020 04:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
 <1594059372-15563-2-git-send-email-jrdr.linux@gmail.com>
 <4bafb184-6f07-2582-3d0f-86fb53dd30dc@suse.com>
In-Reply-To: <4bafb184-6f07-2582-3d0f-86fb53dd30dc@suse.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 7 Jul 2020 17:10:08 +0530
Message-ID: <CAFqt6zaWbEiozfkEuMvusxig15buuS1vjJaj4Q5okxNsRz_1vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] xen/privcmd: Corrected error handling path
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

On Tue, Jul 7, 2020 at 3:05 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrot=
e:
>
> On 06.07.20 20:16, Souptick Joarder wrote:
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
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Paul Durrant <xadimgnik@gmail.com>
> > ---
> >   drivers/xen/privcmd.c | 31 +++++++++++++++----------------
> >   1 file changed, 15 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> > index a250d11..33677ea 100644
> > --- a/drivers/xen/privcmd.c
> > +++ b/drivers/xen/privcmd.c
> > @@ -580,13 +580,13 @@ static long privcmd_ioctl_mmap_batch(
> >
> >   static int lock_pages(
> >       struct privcmd_dm_op_buf kbufs[], unsigned int num,
> > -     struct page *pages[], unsigned int nr_pages)
> > +     struct page *pages[], unsigned int nr_pages, unsigned int *pinned=
)
> >   {
> >       unsigned int i;
> > +     int page_count =3D 0;
>
> Initial value shouldn't be needed, and ...
>
> >
> >       for (i =3D 0; i < num; i++) {
> >               unsigned int requested;
> > -             int pinned;
>
> ... you could move the declaration here.
>
> With that done you can add my
>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Ok. But does it going make any difference other than limiting scope ?

>
>
> Juergen

