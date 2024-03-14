Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4718987BDAE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:28:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693224.1081041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkl8J-000154-Rc; Thu, 14 Mar 2024 13:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693224.1081041; Thu, 14 Mar 2024 13:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkl8J-00012x-OR; Thu, 14 Mar 2024 13:28:31 +0000
Received: by outflank-mailman (input) for mailman id 693224;
 Thu, 14 Mar 2024 13:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fwP0=KU=gmail.com=flyingpenghao@srs-se1.protection.inumbo.net>)
 id 1rkl8H-00012g-PV
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:28:29 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdd20f53-e206-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 14:28:27 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33e9ba0eadcso769527f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:28:27 -0700 (PDT)
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
X-Inumbo-ID: bdd20f53-e206-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710422907; x=1711027707; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rxz6zr/A0KmtPpM6C1crLjJ3+KNq8mczIP+nYFliWBI=;
        b=Y30Tyvh7YFa57vDEe0WczIfYQvI/jIMxiB7/GiuhEpXgAJJaKQ0LVqFaI9uy8sPgmP
         iDvBkP8vh9qelfxr/zrSvtosUczAhn2qzE55euz3AcOMprJGPjwwEZE1trSOjY4oeR8Z
         PZRS+PtLP17n1KN89F0jjRZKpJuOc1Esez3/MbVxSXWvQIz19kTqahixEdTW/g4uKDgz
         RPxM1sic6ViWXlLUI9ZV0u58gqFpr7KKvmhhFablVJFb5ax6H8hz6TZNFnmFs+cD+p9+
         DzDooqlyaz3xaJxMuDg5paWKUnRmRhxvKuUNsoSEkp58vvsT3GKfMP3IKggvfNdYRFoN
         C1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710422907; x=1711027707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rxz6zr/A0KmtPpM6C1crLjJ3+KNq8mczIP+nYFliWBI=;
        b=xGGRJkaArTUkxPfG9Elyy4o7jLiac6SIWpBK1NvFnmsgKp6asi6K19F+Jo/DfxDCot
         9Ujo1uNzWD/+ZtXNVwbpkHuii95rEQlLvWHJ77xx1MwrnvkPRQBfDhtf8mfgcxJqwlwF
         BryXBOoiC273C92P3f1S951SOGSiTI6GrIvm4nZt4kffQ/XB+P8U+TS0fdHz85r11aK9
         WMFmWFtc8NGRYLcf8vgaxt3P3T7xjTe+KG+U6spF5YkB0fX/Ya8jneHaA7tdQnTelA4T
         aNIZqj10CKbzWzsehrSvKXkscJrkNnJycJN7h5ag3AokgiI1U3wD48pfi0LAhp/G2iHL
         0nRw==
X-Gm-Message-State: AOJu0YzDRDuzFi5ufwMOoW5QeNUfDRjhpTny/bmiRR2gOQkUJkZc+Y9X
	6LfO7c+ngrwZqgiHLFgMecSHo02DLi1HeFbElOpLu2ARm7fqafLha3v4mXrslObbY2dObPoM/nx
	CTHgzdxVIlv/aTBFqVyu1pdUeqPM=
X-Google-Smtp-Source: AGHT+IHS6Tga3i38yK7PAZXOPp0aJeW4RgTQuu45hEIVwS7IzD64dnQb9Nu3Bg8U4DHSg947etd+nz8y34WRN+qXF8k=
X-Received: by 2002:adf:f6c1:0:b0:33d:5f98:82e3 with SMTP id
 y1-20020adff6c1000000b0033d5f9882e3mr1182135wrp.13.1710422907128; Thu, 14 Mar
 2024 06:28:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240306051548.90954-1-flyingpeng@tencent.com> <ZegsUUDfgNg3mzEw@macbook>
In-Reply-To: <ZegsUUDfgNg3mzEw@macbook>
From: Hao Peng <flyingpenghao@gmail.com>
Date: Thu, 14 Mar 2024 21:28:15 +0800
Message-ID: <CAPm50aJW98XPD7gMp6wSFXssDn2E-i5RfW=DUqwXcqqKeq2Tbw@mail.gmail.com>
Subject: Re: [PATCH] xen/blkback: use kmap_local_page()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Peng Hao <flyingpeng@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 4:41=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@citr=
ix.com> wrote:
>
> On Wed, Mar 06, 2024 at 01:15:48PM +0800, flyingpenghao@gmail.com wrote:
> > From: Peng Hao <flyingpeng@tencent.com>
> >
> > From: Peng Hao <flyingpeng@tencent.com>
> >
> > Use kmap_local_page() instead of kmap_atomic() which has been
> > deprecated.
> >
> > Signed-off-by: Peng Hao <flyingpeng@tencent.com>
> > ---
> >  drivers/block/xen-blkback/blkback.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-bl=
kback/blkback.c
> > index 4defd7f387c7..cce534f43292 100644
> > --- a/drivers/block/xen-blkback/blkback.c
> > +++ b/drivers/block/xen-blkback/blkback.c
> > @@ -937,8 +937,8 @@ static int xen_blkbk_parse_indirect(struct blkif_re=
quest *req,
> >               if ((n % SEGS_PER_INDIRECT_FRAME) =3D=3D 0) {
> >                       /* Map indirect segments */
> >                       if (segments)
> > -                             kunmap_atomic(segments);
> > -                     segments =3D kmap_atomic(pages[n/SEGS_PER_INDIREC=
T_FRAME]->page);
> > +                             kunmap_local(segments);
> > +                     segments =3D kmap_local_page(pages[n/SEGS_PER_IND=
IRECT_FRAME]->page);
>
> Don't you need to also switch to kunmap_local() then instead of
> kunmap_atomic()?
 kmap_local() and  kunmap_local() are paired.
 I found that I missed a modification, I will re-issue patch v2
 Thanks.
>
> Thanks, Roger.

