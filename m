Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAC01BAD43
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 20:53:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT8rB-00015d-E4; Mon, 27 Apr 2020 18:51:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ib6x=6L=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jT8rA-00015Y-IS
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 18:51:52 +0000
X-Inumbo-ID: 27c60990-88b8-11ea-9887-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27c60990-88b8-11ea-9887-bc764e2007e4;
 Mon, 27 Apr 2020 18:51:51 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t11so14730629lfe.4
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xJWtaGV3HpFJmnzJ96JfxLKzBXP4eI5AWSVq/c564Ak=;
 b=OyM1Skkym1k1VllShjxlEO5SPWnla5Rt3Qx3x0V7ETOw4ic1VvpXCQ3OkK60qQAp3C
 PTDoHH58ozbS/WzBHBnZ62XIk4AbOwZiYi9KmV1x3w8asIuoszHtcRaeXccHReOoCLlY
 60G2lBBEtYmjKLAgWcmUuSXaKHywL36qdMYYaF/AHRIhVaDk3T8QvSSTMr/5qiFsG2VY
 sx/Y2yhrS+qEvmp5qaqCtGoKClJCTxQKa72MEVlS3wON1WURQIEA5ovfEBBiSqhsOM7Z
 ZCerHaAksaw/CSoaM1nJyrjztKP0NR4Ii9gHRLRHwUMqVWzC1sXV01zEdtthbfFl3QYX
 a55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xJWtaGV3HpFJmnzJ96JfxLKzBXP4eI5AWSVq/c564Ak=;
 b=BBbTKeVZMZcv8jtrHrwVPiu/q0kmP1vxaJwbgzz2Ph9twO/cPyQTp7talIScLaxC+D
 dnO6ETzL11hoe5RSd0xo29YAm6brVT36xwp5xix6ogZzuPf18ka4QshMmJuFyXhrCqBi
 uhxwIa/wtdyjKz3XjSwypEnAn0LQ9vGCaIlTiO2lTLzDsFa8rStS64flF1fBqWva67/V
 iLtGVETudzRxV4feY5za210XA80sFCYKZ5C4+giTFmiWQVT0S5WBQ+v/d9ecnmGy/Lio
 OtQ7W05P/Nf5aLJTmjZ2K+Kp66Olelr4W0KYPBVBfEHW4cXDPlrbma8nqIK5n6MEqDTX
 L7LQ==
X-Gm-Message-State: AGi0PuYi3RNO0DJsQp34rddKDvVwqgD2eXOlJoxuMiRsoDbTf89uNNv9
 dyrMyUiTKkuCySqrm5oj81JNmCyK/21qEZ5s59o=
X-Google-Smtp-Source: APiQypLfZ/PWH3jcNEAS+wxdyNhmnLSeoENPIPfV7urhegmMSzJKEE7ZthCVD3yPpodQEY/L6jYpEVysgDkCpEy1cgU=
X-Received: by 2002:a05:6512:490:: with SMTP id
 v16mr16612049lfq.71.1588013510582; 
 Mon, 27 Apr 2020 11:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587682041.git.rosbrookn@ainfosec.com>
 <73e709cf0a87f3728de438e4a3b849462fd098ac.1587682041.git.rosbrookn@ainfosec.com>
 <59C12770-F12A-45B7-AB62-8BB3A0DC96D8@citrix.com>
In-Reply-To: <59C12770-F12A-45B7-AB62-8BB3A0DC96D8@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 27 Apr 2020 14:51:39 -0400
Message-ID: <CAEBZRSdtmyuKP4+yv8-2FjAkmBAc8L9MNr9r5cT4yUcyNM_v=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] golang/xenlight: add NameToDomid and DomidToName
 util functions
To: George Dunlap <George.Dunlap@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 8:59 AM George Dunlap <George.Dunlap@citrix.com> wr=
ote:
>
>
>
> > On Apr 24, 2020, at 4:02 AM, Nick Rosbrook <rosbrookn@gmail.com> wrote:
> >
> > Many exported functions in xenlight require a domid as an argument. Mak=
e
> > it easier for package users to use these functions by adding wrappers
> > for the libxl utility functions libxl_name_to_domid and
> > libxl_domid_to_name.
> >
> > Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> > ---
> > tools/golang/xenlight/xenlight.go | 38 ++++++++++++++++++++++++++++++-
> > 1 file changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/golang/xenlight/xenlight.go b/tools/golang/xenlight/=
xenlight.go
> > index 6b4f492550..d1d30b63e1 100644
> > --- a/tools/golang/xenlight/xenlight.go
> > +++ b/tools/golang/xenlight/xenlight.go
> > @@ -21,13 +21,13 @@ package xenlight
> > #cgo LDFLAGS: -lxenlight -lyajl -lxentoollog
> > #include <stdlib.h>
> > #include <libxl.h>
> > +#include <libxl_utils.h>
> >
> > static const libxl_childproc_hooks childproc_hooks =3D { .chldowner =3D=
 libxl_sigchld_owner_mainloop };
> >
> > void xenlight_set_chldproc(libxl_ctx *ctx) {
> >       libxl_childproc_setmode(ctx, &childproc_hooks, NULL);
> > }
> > -
> > */
> > import "C"
> >
> > @@ -75,6 +75,10 @@ var libxlErrors =3D map[Error]string{
> >       ErrorFeatureRemoved:               "Feature removed",
> > }
> >
> > +const (
> > +     DomidInvalid Domid =3D ^Domid(0)
>
> Not to be a stickler, but are we positive that this will always result in=
 the same value as C.INVALID_DOMID?
>
> There are some functions that will return INVALID_DOMID, or accept INVALI=
D_DOMID as an argument.  Users of the `xenlight` package will presumably ne=
ed to compare against this value and/or pass it in.
>
> It seems like we could:
>
> 1. Rely on language lawyering to justify our assumption that ^Domid(0) wi=
ll always be the same as C =E2=80=9C~0=E2=80=9D
>
> 2. On marshalling into / out of C, convert C.INVALID_DOMID to DomidInvali=
d
>
> 3. Set Domid =3D C.INVALID_DOMID

I just tested this way, and it does not work as expected. Since
C.INVALID_DOMID is #define'd, cgo does not know it is intended to be
used as uint32_t, and decides to declare C.INVALID_DOMID as int. So,
C.INVALID_DOMID =3D ^int(0) =3D -1, which overflows Domid.

I tried a few things in the cgo preamble without any luck.
Essentially, one cannot define a const uint32_t in C space, and use
that to define a const in Go space.

Any ideas?

-NR

