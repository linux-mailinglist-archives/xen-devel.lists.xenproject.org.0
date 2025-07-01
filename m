Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC351AF05FD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 23:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030095.1403750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWiur-0003cx-U0; Tue, 01 Jul 2025 21:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030095.1403750; Tue, 01 Jul 2025 21:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWiur-0003ae-Qp; Tue, 01 Jul 2025 21:53:25 +0000
Received: by outflank-mailman (input) for mailman id 1030095;
 Tue, 01 Jul 2025 21:53:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVSR=ZO=gmail.com=abinashlalotra@srs-se1.protection.inumbo.net>)
 id 1uWiuq-0003aY-Go
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 21:53:24 +0000
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce706d4f-56c5-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 23:53:22 +0200 (CEST)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-4e2b5ffb932so1465342137.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 14:53:22 -0700 (PDT)
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
X-Inumbo-ID: ce706d4f-56c5-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751406801; x=1752011601; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9Tw5T21oTt8VFmq/0NfB5MMfCxNURL8ZSaWZPOqLE4=;
        b=EpzJCLG7mskrKLfbOqYA2o23RqQcUSr3IhLVQgtkFAVgN0pp7YitYcHluXFrd86lYb
         FLFqL2dp+FJ23kTmFwZ3AMeTSB+hR/c53IoENE6EcL90Q54ExshSCcY2ImKYlXAIMh04
         IKsUzkm3x6iSXnZ5rn0yYYiRU0w6rd/YJmDzRdK70GPNdSbKJ+2g2fdZXZGN5tfFThlA
         sleeoBQ6kzG7y3Ewnez+eBx0iet4crT4aUyzpwilf38j0EzLwnJQVI3MYH0J0T50WuM6
         iEDfATtGt7X9MMTam/S5bqrwwcj1BgGOGULl6GpqNeHHLZxwkoLVDKhBqZ56abvDdOaj
         iDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751406801; x=1752011601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9Tw5T21oTt8VFmq/0NfB5MMfCxNURL8ZSaWZPOqLE4=;
        b=TnkwKHj9cYFeu4aWxbUcpgwxg1J+MCRZMl71b6ekpoypl9sVkiwpP486oxpN78Hvs/
         xA/rmk8tUAuaZAfKlcHghqMiF7gS6Byt+aU5prPOf+ygaZCKUMbQOQEPsLHziIY7MZ8i
         r5VTWPpnIE6uyknedEhdfHQmKD+DvGovWZJ/bhM9uroV8ZOJ7ex19kWZqAM0mveY4Hla
         M93K/gUJx47OUPU9KNzlQFXkUFrIakTVVEoJ5BIP9i2CJ5fUbvKe/v/4RwdCVtaTOnOW
         WeDHxFdb6Bne6UzjB8Imn0aYsZiY4EW91Mammvwu7odhXceeJH+gwmPKoSAWT1G4yJuy
         emGg==
X-Forwarded-Encrypted: i=1; AJvYcCUDjnw3uTB1OSA2VoCy9DPQcrbpyjtmFnSHVkP9D/f/yLDG1Bnj/xwZVPKyN+oQGm93HJT/2HFuEjE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEx+qmJ4L/avq9JUQNXQ3AYN6otmwTixunM0iJi9xcSBImUK6D
	tpUmReB5hAhLTrD/DB++0taOf8O8zr+iCjPtHHDntNuqObs3am538I3jsxT4DoIJDsOX36h7npe
	P7bVs7O2tRzD4X26Gw2VBF8TZ498fmgc=
X-Gm-Gg: ASbGncv8mR8wx5YmRqF+PEaqzgsqcrWd3kAeHP62Un+oSNlt7nyBtZ4ZIdBhZgRof0+
	6VB/E6TSrks5O6xM34COzZcq02b9U2Y8H4LpLC0IOHKTWkssMrq5fmEwQyRoxGCu7uVDnvIfs10
	FT5DeqPKAyxT24O3eDqC4RzZpw5fn48L9vq+Mf4+kissJChqL3nWgb0KpgFzAHlp/AK6Hp/lHLY
	6eplw==
X-Google-Smtp-Source: AGHT+IHgW+audA3TQkHOsNiNO4Y5C7I1as+sT+lATM9JGrS7qA3IEYv2HU03AtfN1AT94Uq8BWvGQ4u89P5wuKzlRag=
X-Received: by 2002:a05:6102:c4d:b0:4e6:67f6:e9af with SMTP id
 ada2fe7eead31-4f161114e02mr109275137.9.1751406801281; Tue, 01 Jul 2025
 14:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com> <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
In-Reply-To: <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech>
From: Abinash <abinashlalotra@gmail.com>
Date: Wed, 2 Jul 2025 03:23:09 +0530
X-Gm-Features: Ac12FXxWN99Do6-y4I8RTPnx1rDO_yZT307Qk4LLSGsNZ3LC714vlUwHM9tF1aQ
Message-ID: <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
Subject: Re: [RFC PATCH] xen/gntdev: reduce stack usage by dynamically
 allocating gntdev_copy_batch
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	Abinash Singh <abinashsinghlalotra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi ,

Thanks for pointing that out.

I haven=E2=80=99t measured the performance impact yet =E2=80=94 my main foc=
us was on
getting rid of the stack usage warning triggered by LLVM due to
inlining. But you're right, gntdev_ioctl_grant_copy() is on a hot
path, and calling kmalloc() there could definitely slow things down,
especially under memory pressure.

I=E2=80=99ll run some benchmarks to compare the current approach with the
dynamic allocation, and also look into alternatives =E2=80=94 maybe
pre-allocating the struct or limiting inlining instead. If you have
any ideas or suggestions on how best to approach this, I=E2=80=99d be happy=
 to
hear them.

Do you have any suggestions on how to test the performance?

Best,
Abinash


On Mon, 30 Jun 2025 at 16:05, Tu Dinh <ngoc-tu.dinh@vates.tech> wrote:
>
> Hi,
>
> On 30/06/2025 06:54, Abinash Singh wrote:
> > While building the kernel with LLVM, a warning was reported due to
> > excessive stack usage in `gntdev_ioctl`:
> >
> >       drivers/xen/gntdev.c:991: warning: stack frame size (1160) exceed=
s limit (1024) in function 'gntdev_ioctl'
> >
> > Further analysis revealed that the large stack frame was caused by
> > `struct gntdev_copy_batch`, which was declared on the stack inside
> > `gntdev_ioctl_grant_copy()`. Since this function was inlined into
> > `gntdev_ioctl`, the stack usage was attributed to the latter.
> >
> > This patch fixes the issue by dynamically allocating `gntdev_copy_batch=
`
> > using `kmalloc()`, which significantly reduces the stack footprint and
> > eliminates the warning.
> >
> > This approach is consistent with similar fixes upstream, such as:
> >
> > commit fa26198d30f3 ("iommu/io-pgtable-arm: dynamically allocate selfte=
st device struct")
> >
> > Fixes: a4cdb556cae0 ("xen/gntdev: add ioctl for grant copy")
> > Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
> > ---
> > The stack usage was confirmed using the `-fstack-usage`  flag and mannu=
al analysis, which showed:
> >
> >    drivers/xen/gntdev.c:953: gntdev_ioctl_grant_copy.isra   1048 bytes
> >    drivers/xen/gntdev.c:826: gntdev_copy                     56 bytes
> >
> > Since `gntdev_ioctl` was calling the inlined `gntdev_ioctl_grant_copy`,=
 the total
> > frame size exceeded 1024 bytes, triggering the warning.
> >
> > This patch addresses the warning and keeps stack usage within acceptabl=
e limits.
> > Is this patch fine or kmalloc may affect performance ?
> > ---
>
> Have you measured the performance impact? gntdev_ioctl_grant_copy is
> called quite often especially by the backend. I'm afraid calling the
> allocator here may cause even more slowdown than there already is,
> especially when memory is tight.
>
> >   drivers/xen/gntdev.c | 24 +++++++++++++++---------
> >   1 file changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> > index 61faea1f0663..9811f3d7c87c 100644
> > --- a/drivers/xen/gntdev.c
> > +++ b/drivers/xen/gntdev.c
> > @@ -953,15 +953,19 @@ static int gntdev_grant_copy_seg(struct gntdev_co=
py_batch *batch,
> >   static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void __=
user *u)
> >   {
> >       struct ioctl_gntdev_grant_copy copy;
> > -     struct gntdev_copy_batch batch;
> > +     struct gntdev_copy_batch *batch;
> >       unsigned int i;
> >       int ret =3D 0;
> >
> >       if (copy_from_user(&copy, u, sizeof(copy)))
> >               return -EFAULT;
> > -
> > -     batch.nr_ops =3D 0;
> > -     batch.nr_pages =3D 0;
> > +
> > +     batch =3D kmalloc(sizeof(*batch), GFP_KERNEL);
> > +     if (!batch)
> > +             return -ENOMEM;
> > +
> > +     batch->nr_ops =3D 0;
> > +     batch->nr_pages =3D 0;
> >
> >       for (i =3D 0; i < copy.count; i++) {
> >               struct gntdev_grant_copy_segment seg;
> > @@ -971,18 +975,20 @@ static long gntdev_ioctl_grant_copy(struct gntdev=
_priv *priv, void __user *u)
> >                       goto out;
> >               }
> >
> > -             ret =3D gntdev_grant_copy_seg(&batch, &seg, &copy.segment=
s[i].status);
> > +             ret =3D gntdev_grant_copy_seg(batch, &seg, &copy.segments=
[i].status);
> >               if (ret < 0)
> >                       goto out;
> >
> >               cond_resched();
> >       }
> > -     if (batch.nr_ops)
> > -             ret =3D gntdev_copy(&batch);
> > -     return ret;
> > +     if (batch->nr_ops)
> > +             ret =3D gntdev_copy(batch);
> > +     goto free_batch;
> >
> >     out:
> > -     gntdev_put_pages(&batch);
> > +     gntdev_put_pages(batch);
> > +  free_batch:
> > +     kfree(batch);
> >       return ret;
> >   }
> >
>
>
>
> Ngoc Tu Dinh | Vates XCP-ng Developer
>
> XCP-ng & Xen Orchestra - Vates solutions
>
> web: https://vates.tech
>

