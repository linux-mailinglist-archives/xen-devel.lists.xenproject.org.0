Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43413FB28C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 10:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174916.318809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKcmd-0007BR-EV; Mon, 30 Aug 2021 08:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174916.318809; Mon, 30 Aug 2021 08:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKcmd-00078E-Aa; Mon, 30 Aug 2021 08:36:47 +0000
Received: by outflank-mailman (input) for mailman id 174916;
 Mon, 30 Aug 2021 08:36:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gR2H=NV=gmail.com=fontaine.fabrice@srs-us1.protection.inumbo.net>)
 id 1mKcmc-000788-3B
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 08:36:46 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f86173d5-7875-47ed-b3fa-df05e227df1d;
 Mon, 30 Aug 2021 08:36:45 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id y6so24581157lje.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Aug 2021 01:36:44 -0700 (PDT)
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
X-Inumbo-ID: f86173d5-7875-47ed-b3fa-df05e227df1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gBIeI78B8yZ1U8MrUiRGpXlDjkQ7Fe0pO7nAHfTjnvE=;
        b=Jeq9S497tRDly9oNzMhPLOwuvXnNLQDyn6XApmCIB9dQK4pOrdRYjl4HKsCYpDGzuW
         xI5sFmbiHFtGIQJ9Gzoo9twF0N7YOvDThrGtKAG8vA495iRiTX/cLTXAjsB3VqbBu/h9
         L+0I9IfjIPmiP1/IYOOQpHL95gbsMiJl27UZCCtQ6quPrmTMlZ8xAGL63LvgKg4Fev2B
         GqvotCIbXPxK8Fxe2RaisbCi78Pk6eyAz+OnDKbzsPmUHTXBtY6881L2c5zPJ7rtslUH
         U4QyccAbrWhLXGcxPeBlmKCSBV2H7+Ajf0udwK6gufpbUJFiqmMyClitsubPZXjwkp5Q
         zeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gBIeI78B8yZ1U8MrUiRGpXlDjkQ7Fe0pO7nAHfTjnvE=;
        b=bze0fV3WdYtdAcgrk6NGsl1QqocUYvuaK6O4c26uVkbWRpz13BRZeOiOWFpKtoh6a9
         MkSAL+H86BcyztmeKIhH7cBYt98nqnJi9xLTVCCWt5HFG/61DYHZHln165HR4kaaam8j
         I3uzST2F5cPcssS/MsBFEZrX9/zYJtUvsdyyzHBj5wTK0emrMgg+HQFIfLObUzOoHZJI
         QU25vmG058nQ1nSk5KeL6WCcwbtNTfPbI06nEO3OJ8spOKpcLttxpmLOOpUg7s3Bvbji
         rb1BUwaFCghj9MhiJ5ywnBHgE9Zuk65UnTFjQQt9CKe5OU1bHQ/XrSz4P7qk81hnBZdE
         Is9Q==
X-Gm-Message-State: AOAM532KLWOI7BXt9bmXakY4HwfAwpldjGDTLmp53++TkVoel0+F1at6
	b980DKAFuBPckE5SQUEt7IN28XwhCwtV4k5PLFs=
X-Google-Smtp-Source: ABdhPJwKg8MrsUheJaLlYKW+0lKvLm5U1+3E8pBiELaoudXGuYEnxLAkP+uQoDfJCWYYBf7tFEu/3KvuDHqcOqf7vcg=
X-Received: by 2002:a2e:9852:: with SMTP id e18mr19297646ljj.173.1630312604024;
 Mon, 30 Aug 2021 01:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210828090709.738512-1-fontaine.fabrice@gmail.com> <48e33bf0-67f6-4259-ac9e-71da16621c5f@suse.com>
In-Reply-To: <48e33bf0-67f6-4259-ac9e-71da16621c5f@suse.com>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 30 Aug 2021 10:36:32 +0200
Message-ID: <CAPi7W80gf+gcd0fczTLN7DgnxiwdzhMFxNVTyRvfGRm3PmQYZQ@mail.gmail.com>
Subject: Re: [PATCH] libs/light: fix tv_sec fprintf format
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 30 ao=C3=BBt 2021 =C3=A0 10:31, Juergen Gross <jgross@suse.com> a =
=C3=A9crit :
>
> On 28.08.21 11:07, Fabrice Fontaine wrote:
> > Don't assume tv_sec is a unsigned long, it is 64 bits on NetBSD 32 bits=
.
> > Use %jd and cast to (intmax_t) instead
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >   tools/libs/light/libxl_domain.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_d=
omain.c
> > index c00c36c928..51a6127552 100644
> > --- a/tools/libs/light/libxl_domain.c
> > +++ b/tools/libs/light/libxl_domain.c
> > @@ -1444,7 +1444,7 @@ static int libxl__mark_domid_recent(libxl__gc *gc=
, uint32_t domid)
> >           }
> >       }
> >
> > -    r =3D fprintf(nf, "%lu %u\n", ctxt.ts.tv_sec, domid);
> > +    r =3D fprintf(nf, "%jd %u\n", (intmax_t)ctxt.ts.tv_sec, domid);
>
> Any reason not to keep the unsigned attribute?
Yes, for consistency, I applied the same fix that was merged seven
months ago to libs/light/libxl_create.c:
https://gitlab.com/xen-project/xen/-/commit/a8ac01aa3e3ea5e6a9a1620aa8fa7e9=
da3458120
>
>
> Juergen
Fabrice

