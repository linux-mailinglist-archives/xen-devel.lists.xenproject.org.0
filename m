Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816899DC18B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 10:33:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845866.1261195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGxNA-00028U-8t; Fri, 29 Nov 2024 09:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845866.1261195; Fri, 29 Nov 2024 09:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGxNA-00025j-6E; Fri, 29 Nov 2024 09:33:12 +0000
Received: by outflank-mailman (input) for mailman id 845866;
 Fri, 29 Nov 2024 09:33:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+lhP=SY=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tGxN9-00025d-Dl
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 09:33:11 +0000
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [2607:f8b0:4864:20::d36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f05da3a6-ae34-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 10:33:07 +0100 (CET)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-841acc8151aso51793839f.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 01:33:07 -0800 (PST)
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
X-Inumbo-ID: f05da3a6-ae34-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpkMzYiLCJoZWxvIjoibWFpbC1pbzEteGQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYwNWRhM2E2LWFlMzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODcyNzg3LjM4MjA1NSwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732872786; x=1733477586; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1TvX848ZthzGk7lUVCMo/coR5b6IZQCoXBAdJLNAJY=;
        b=d5j/+Q/RlgebzZndBXGFX0/xzFdnwCgVkircXWQGtXAKBMn6EqpdkHmtGQfylhpdgr
         acRK6Pr85mNxLynk2HExzZBJS+gC3QZFAe2ihgsPZYSKCh6rgXtXKdB0YG9yEg5WXWrP
         qIeTseiwulHvkVmjaJ8tdrwpF6zzhr2gUZ7xJ5n+HbIZb3ZzBFfveGIDyuW4MurxXuGd
         51RW29FzhFZXm/I3rmCsL2KQ3/3xsFs8GuYaexT9SnYhcnFprQ8utodzuhjqojavcFMc
         4mXWpGXTggaJonGxfrOoJfMsy7TchbPQM9D0XRx2dAjhnNFGyLzzHfOKjPpe5Kgulboa
         hN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732872786; x=1733477586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1TvX848ZthzGk7lUVCMo/coR5b6IZQCoXBAdJLNAJY=;
        b=M0QUn6bChduIEKJplk4flziB/4i/NPjrB5105MU7U1Dsyd4yM1+r7KiIhyOIznq+S/
         Mf5xV3aTnG5NiWVSRrq9c96t4DyXM1X8hFw8SwneKkUWqyM8hW7NmuSrUJv48SZFqRB8
         h79PlfcopbuSA/HXjCxsccSCvlBMt01v7QT1fc1Skd/EyhtE9y1UrSdECZndSue3DiGA
         pd1dtwm6gIAT2yxpF829SVSfv8uD0G0njcP9xxIKe0T+oo7myTNOOORCZf5aovzj6MyI
         1HovLj/tXggW58Sv0Q86XALLUghkmlQ1bkaYQ+ra5eEnp50iZEAQ+K4j7zf/DRTwQ7Yi
         Q1xg==
X-Forwarded-Encrypted: i=1; AJvYcCXg0nq5wLx3AOKW/H+weq9QMqZeqH3yn5fn6w0QbIbLLtq7A2Sz6WJ2xnmwDQB9eplYXrbedEqYkOw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytKy8hxJxcuA2PGooJDKt6rzVWg6gatHncnKsF0w923hrBtkBT
	vz4cawTnnRKkS0qkOebtzZwcoDON0+hl3fsFx+LYPFxvpe99GgoNh1XQ/kcBeWuMM9gtA9GCjER
	eCHF7NV/AUY5nfM9z1TZ7tytoiz1dxRd4Swg6FDmKBhRtU688aY0=
X-Gm-Gg: ASbGncsT0I5P0Lnx1tttp8UebN3knQLbNYPWGxG7cg37DUVshHYz64Y6WSFmbxZYsQp
	keIu/8PiMrNW1lOjxVNOmCkMa04vcZGq9
X-Google-Smtp-Source: AGHT+IEOrZMQrBPwTD3IlKeBxNR0OFBb/s2PYtrS9Riw1xOVUTK+77XPPic2buZqcTQWsNWnjJzcLYWKk5Y2UJC3Is0=
X-Received: by 2002:a05:6602:1513:b0:841:8d66:8aea with SMTP id
 ca18e2360f4ac-843ece805d0mr1244204539f.2.1732872786104; Fri, 29 Nov 2024
 01:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-9-carlo.nonato@minervasys.tech> <29e69d97-41ef-4ebc-a68e-0253e230f6f4@suse.com>
In-Reply-To: <29e69d97-41ef-4ebc-a68e-0253e230f6f4@suse.com>
From: Carlo Nonato <carlo.nonato@minervasys.tech>
Date: Fri, 29 Nov 2024 10:32:54 +0100
Message-ID: <CAG+AhRWWK6e3KJ66v5wvowTzOvyJRaECpkXYpSzMa9+83ea0eA@mail.gmail.com>
Subject: Re: [PATCH v10 08/12] xen/page_alloc: introduce preserved page flags macro
To: Jan Beulich <jbeulich@suse.com>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jan,

On Thu, Nov 28, 2024 at 12:05=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 19.11.2024 15:13, Carlo Nonato wrote:
> > PGC_static, PGC_extra and PGC_broken need to be preserved when assignin=
g a
> > page. Define a new macro that groups those flags and use it instead of =
or'ing
> > every time.
> >
> > To make preserved flags even more meaningful, they are kept also when
> > switching state in mark_page_free().
> > Enforce the removal of PGC_extra before freeing domain pages as this is
> > considered an error and can cause ASSERT violations.
> >
> > Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> > ---
> > v10:
> > - fixed commit message
> > v9:
> > - add PGC_broken to PGC_preserved
> > - clear PGC_extra in alloc_domheap_pages() only if MEMF_no_refcount is =
set
> > v8:
> > - fixed PGC_extra ASSERT fail in alloc_domheap_pages() by removing PGC_=
extra
> >   before freeing
> > v7:
> > - PGC_preserved used also in mark_page_free()
> > v6:
> > - preserved_flags renamed to PGC_preserved
> > - PGC_preserved is used only in assign_pages()
> > v5:
> > - new patch
> > ---
> >  xen/common/page_alloc.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> > index 7b911b5ed9..34cd473150 100644
> > --- a/xen/common/page_alloc.c
> > +++ b/xen/common/page_alloc.c
> > @@ -160,6 +160,7 @@
> >  #endif
> >
> >  #define PGC_no_buddy_merge PGC_static
> > +#define PGC_preserved (PGC_extra | PGC_static | PGC_broken)
> >
> >  #ifndef PGT_TYPE_INFO_INITIALIZER
> >  #define PGT_TYPE_INFO_INITIALIZER 0
> > @@ -1427,12 +1428,11 @@ static bool mark_page_free(struct page_info *pg=
, mfn_t mfn)
> >      {
> >      case PGC_state_inuse:
> >          BUG_ON(pg->count_info & PGC_broken);
> > -        pg->count_info =3D PGC_state_free;
> > +        pg->count_info =3D PGC_state_free | (pg->count_info & PGC_pres=
erved);
> >          break;
>
> PGC_extra doesn't want preserving here. Since it's mark_page_free(), and
> since PGC_extra is removed before freeing, the state change is apparently
> fine. But an assertion may want adding, for documentation purposes if
> nothing else.
>
> Alternatively it may make sense to indeed exclude PGC_extra here. In fact
> PGC_static doesn't need using here either, as unprepare_staticmem_pages()
> will explicitly set it again anyway.
>
> Hence I wonder whether the change here really is necessary (one will then
> be needed in the next patch aiui, when PGC_colored is introduced). Which
> would then eliminate the need for the final two hunks of the patch, I
> think.
>
> >      case PGC_state_offlining:
> > -        pg->count_info =3D (pg->count_info & PGC_broken) |
> > -                         PGC_state_offlined;
> > +        pg->count_info =3D (pg->count_info & PGC_preserved) | PGC_stat=
e_offlined;
> >          pg_offlined =3D true;
> >          break;
>
> I'm similarly unconvinced that anything other than PGC_broken (and
> subsequently perhaps PGC_colored) would need preserving here.

Yes, we (re)checked the code and also believe that the introduction of
PGC_preserved is generating more confusion (and code) then the actual logic=
al
help it provides.

We'll remove this patch and integrate PGC_colored explicitly in the flags t=
o
be preserved. This avoid the clumsy logic of preserving something (extra)
when it's not needed and then handling the special case to remove it
explicitly.
Basically my goal is to go back to v4 where this patch didn't exist.

> Jan

Thanks.
- Carlo

