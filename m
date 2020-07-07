Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E0A216B89
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 13:31:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsloX-0001Iz-1z; Tue, 07 Jul 2020 11:31:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aoUK=AS=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jsloV-0001Iu-8I
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2020 11:31:03 +0000
X-Inumbo-ID: 5618d2cc-c045-11ea-b7bb-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5618d2cc-c045-11ea-b7bb-bc764e2007e4;
 Tue, 07 Jul 2020 11:31:02 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z24so24574037ljn.8
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2020 04:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oU+zHS1dWLePXpv1roLop07qC5/+PHNWookUwJLe/zU=;
 b=HzqoVfv5RmJSiJec48Z3gyXEpw3X1xzcpa7yGskC4YP4FKDLYWnNwGMKx7bPp5Di7M
 tAPv4yoi7/blcmwpByoACwe0S74SDsfhbuSrSJbAMsKtYruaS6ia/LBd+13co+pkezkk
 7ED8pj13E7YmJr85IrN0MVKjFyHLI0G0TJ73UB9v7WnD2zN0X7ICOOtfjGUQ0J71cnjP
 iYWwsuoH7p9DXqBStWZvc8pwrz62bilvgWSXrlKpRzl7c1aLuLFkvFYxt82/FhaGmybv
 fSUho90IdiLmF9K8hKcl976CmHjAZzritDhMnDBdK/WDiwPviUgXcEseAddmE8iDGBHE
 TFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oU+zHS1dWLePXpv1roLop07qC5/+PHNWookUwJLe/zU=;
 b=Pqu3HB2Qoo9dw++5QKqwoDGybe+vP8SinWbxEb4qYxmeL9A4es3btmTP5NyCkfDFsG
 SL3edwn6oUxlOR28sn78gij0qWXHW+SWZiYQGR0d8DysBMhO04RRpRonWdBGj7nvIqFI
 ffDrLUYG9XPvUdl/zb53pOlsIe6lsJNexRNk1FZ+e1RjOhWJyhu4KXMhvAV7znmyC2+O
 Rvq4GyR7AuayJyqLgNch2PsBHXVIR8KAnlCMT1fO2u1uoIRzu4dEFzYHOsOldyEvxglG
 3Oe3DNHyl1RvOj1t/eDk5oWyp+tusPAoC5LbWF7BEmNhhYIXi/FI1pb7dzF3N3Ahp6Hb
 aWUQ==
X-Gm-Message-State: AOAM531nh8vW2wR8hVSZ6uxG3Znc9m6EISpwWN+vY8zQ4o9/2FtoEjBE
 0R/x1V/JfnHAJmGEG8xqRFQmciBgEMJandIoUrY=
X-Google-Smtp-Source: ABdhPJwnwnMnJ0iADB+yNPtPOSoRhfTA8saUU2vq4vN7LszeEgrx/ZXEdYoZDO9/LdNXumlwQmvPr/VyPXzdTGQtYqA=
X-Received: by 2002:a2e:5d8:: with SMTP id 207mr28871025ljf.257.1594121461257; 
 Tue, 07 Jul 2020 04:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
 <1594059372-15563-3-git-send-email-jrdr.linux@gmail.com>
 <8fdd8c77-27dd-2847-7929-b5d3098b1b45@suse.com>
In-Reply-To: <8fdd8c77-27dd-2847-7929-b5d3098b1b45@suse.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 7 Jul 2020 17:00:49 +0530
Message-ID: <CAFqt6zZRx3oDO+p2e6EiDig9fzKirME-t6fanzDRh6e7gWx+nA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] xen/privcmd: Mark pages as dirty
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

On Tue, Jul 7, 2020 at 3:08 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrot=
e:
>
> On 06.07.20 20:16, Souptick Joarder wrote:
> > pages need to be marked as dirty before unpinned it in
> > unlock_pages() which was oversight. This is fixed now.
> >
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> > Suggested-by: John Hubbard <jhubbard@nvidia.com>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Paul Durrant <xadimgnik@gmail.com>
> > ---
> >   drivers/xen/privcmd.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> > index 33677ea..f6c1543 100644
> > --- a/drivers/xen/privcmd.c
> > +++ b/drivers/xen/privcmd.c
> > @@ -612,8 +612,11 @@ static void unlock_pages(struct page *pages[], uns=
igned int nr_pages)
> >   {
> >       unsigned int i;
> >
> > -     for (i =3D 0; i < nr_pages; i++)
> > +     for (i =3D 0; i < nr_pages; i++) {
> > +             if (!PageDirty(pages[i]))
> > +                     set_page_dirty_lock(pages[i]);
>
> With put_page() directly following I think you should be able to use
> set_page_dirty() instead, as there is obviously a reference to the page
> existing.

Patch [3/3] will convert above codes to use unpin_user_pages_dirty_lock()
which internally do the same check. So I thought to keep linux-stable and
linux-next code in sync. John had a similar concern [1] and later agreed to=
 keep
this check.

Shall I keep this check ?  No ?

[1] https://lore.kernel.org/xen-devel/a750e5e5-fd5d-663b-c5fd-261d7c939ba7@=
nvidia.com/

>
> >               put_page(pages[i]);
> > +     }
> >   }
> >
> >   static long privcmd_ioctl_dm_op(struct file *file, void __user *udata=
)
> >
>
> Juergen

