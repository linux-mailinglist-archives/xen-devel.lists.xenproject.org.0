Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437AB217CE2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 04:00:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jszMB-0007sS-5t; Wed, 08 Jul 2020 01:58:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1K4e=AT=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1jszM9-0007sN-3T
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 01:58:41 +0000
X-Inumbo-ID: 8ac6fc5a-c0be-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ac6fc5a-c0be-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 01:58:40 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h19so52341759ljg.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2020 18:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=753o6lI+14JCSrORPzmiJM1I+sNyMEUrssi+r3hqays=;
 b=ADC+/wSk/ZvHTMRaqZVMsFab7QmR7F76m5bIXFQTCrGykFlnIcim/Mt9DsEFFmtIqH
 7QdE4Mw68tnCRxeihzvLD2YG4tKnCEXfsbVEMo502yX58MvOY1yGfgr9ZxBhctr/ThOQ
 nmwwiLCIVazXAt/cNFopl1b2jRhIDsjMxgzz/AcofwcRa/m2kc7oVv068u0HrhCjGaD1
 NjSUa0zJjtYdkT5c1r6Xd4h+m7qBgQGpKNIrXpkJLxjJw2T+Illoq7YlHWKRR0ySKZcs
 +993mJrKClq5YuIXWBrcwfJi1dvDLxJgtnPKMg6mk9uDmVkn1Oq3q2EkSBmIdL2XbUto
 /0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=753o6lI+14JCSrORPzmiJM1I+sNyMEUrssi+r3hqays=;
 b=X4rdb+6TF7Y+MrmdufsZ++UsPyQY6yqnkh+AzCuijt8k5cFtsLHodkpkHthHytn1u8
 q8nfBjUdy3ifuCfB6s7/5PZ3N0w7/cLc0YZePHJc6pZTEAt+VtTJFlqTSNjSKLDtldto
 4Bx07aKXxV3OImrwx8xy5amEiAQLiTotfxVyFYJLcYD4Wmc2LOrnibkno9SnR9yrD4B8
 b8quxxHcyKOnkg3XzGnleqRIj2qJSYbjYIMIX/MiSAMmLQ25ztSmoenDPRDfXWULWLmg
 3WROz2hfQSjobU6AvHBm5nI4mR6y2aziqbThoIW4YXSDHDCdbnT0N3vA/+HQneUQfjsj
 jj7Q==
X-Gm-Message-State: AOAM53029TYr6Z7dTCGSwqOQL4piqvnrLEq6HRuHcZZgwKcNCmT7UteS
 lVVMtv9Kom5tWRIUJuMO4omoMZyciVdK7g9gsyc=
X-Google-Smtp-Source: ABdhPJwX7jxnpPSaGjGI8Z53hHfavgWbxkjQSz6JsvYOwflqZC+IcLyYA9D4DBIx0PEz3GyhJjdcCJ8z+zeYHjD+EwI=
X-Received: by 2002:a2e:920e:: with SMTP id k14mr33414682ljg.430.1594173518700; 
 Tue, 07 Jul 2020 18:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <1594059372-15563-1-git-send-email-jrdr.linux@gmail.com>
 <1594059372-15563-2-git-send-email-jrdr.linux@gmail.com>
 <4bafb184-6f07-2582-3d0f-86fb53dd30dc@suse.com>
 <CAFqt6zaWbEiozfkEuMvusxig15buuS1vjJaj4Q5okxNsRz_1vw@mail.gmail.com>
 <7208d7fe-8822-8e9b-e531-05238ece0b02@suse.com>
In-Reply-To: <7208d7fe-8822-8e9b-e531-05238ece0b02@suse.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Wed, 8 Jul 2020 07:37:00 +0530
Message-ID: <CAFqt6zYXnD2VvGNcAnLC3BTyA4vSBpFLHQq3h+BzEDQcGRJD2w@mail.gmail.com>
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

On Tue, Jul 7, 2020 at 5:15 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrot=
e:
>
> On 07.07.20 13:40, Souptick Joarder wrote:
> > On Tue, Jul 7, 2020 at 3:05 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com> =
wrote:
> >>
> >> On 06.07.20 20:16, Souptick Joarder wrote:
> >>> Previously, if lock_pages() end up partially mapping pages, it used
> >>> to return -ERRNO due to which unlock_pages() have to go through
> >>> each pages[i] till *nr_pages* to validate them. This can be avoided
> >>> by passing correct number of partially mapped pages & -ERRNO separate=
ly,
> >>> while returning from lock_pages() due to error.
> >>>
> >>> With this fix unlock_pages() doesn't need to validate pages[i] till
> >>> *nr_pages* for error scenario and few condition checks can be ignored=
.
> >>>
> >>> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> >>> Cc: John Hubbard <jhubbard@nvidia.com>
> >>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> >>> Cc: Paul Durrant <xadimgnik@gmail.com>
> >>> ---
> >>>    drivers/xen/privcmd.c | 31 +++++++++++++++----------------
> >>>    1 file changed, 15 insertions(+), 16 deletions(-)
> >>>
> >>> diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
> >>> index a250d11..33677ea 100644
> >>> --- a/drivers/xen/privcmd.c
> >>> +++ b/drivers/xen/privcmd.c
> >>> @@ -580,13 +580,13 @@ static long privcmd_ioctl_mmap_batch(
> >>>
> >>>    static int lock_pages(
> >>>        struct privcmd_dm_op_buf kbufs[], unsigned int num,
> >>> -     struct page *pages[], unsigned int nr_pages)
> >>> +     struct page *pages[], unsigned int nr_pages, unsigned int *pinn=
ed)
> >>>    {
> >>>        unsigned int i;
> >>> +     int page_count =3D 0;
> >>
> >> Initial value shouldn't be needed, and ...
> >>
> >>>
> >>>        for (i =3D 0; i < num; i++) {
> >>>                unsigned int requested;
> >>> -             int pinned;
> >>
> >> ... you could move the declaration here.
> >>
> >> With that done you can add my
> >>
> >> Reviewed-by: Juergen Gross <jgross@suse.com>
> >
> > Ok. But does it going make any difference other than limiting scope ?
>
> Dropping the initializer surely does, and in the end page_count just
> replaces the former pinned variable, so why would we want to widen the
> scope with this patch?

Agree, no reason to move it up. Will change it in v3.

>
>
> Juergen

