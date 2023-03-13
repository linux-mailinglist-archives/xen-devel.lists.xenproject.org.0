Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735E6B8189
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 20:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509374.785015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbncs-00060N-Ed; Mon, 13 Mar 2023 19:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509374.785015; Mon, 13 Mar 2023 19:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbncs-0005y6-Bo; Mon, 13 Mar 2023 19:14:30 +0000
Received: by outflank-mailman (input) for mailman id 509374;
 Mon, 13 Mar 2023 19:14:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jvaw=7F=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pbncr-0005xz-Am
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 19:14:29 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bb94019-c1d3-11ed-b463-930f4c7d94ae;
 Mon, 13 Mar 2023 20:14:10 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id cn21so22775754edb.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Mar 2023 12:14:26 -0700 (PDT)
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
X-Inumbo-ID: 3bb94019-c1d3-11ed-b463-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678734866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2Z/JwvQAbkq+jbR35+zT7Gv5+mYDXu9h5Itgt8QB4g=;
        b=PacRZHXFlrHn8DgGrtmp/4+mOw3R6cxdIlww9hm2snjvQv5h1wHHKOLy9WJ6qADZ5T
         lVuBWIs5os82/4ePa8OHEF2YYeHV6h63wN0Hz38IPKe2undUi13NgDQlqrlneYQwKFxW
         AyA48umLBx8b5bnxw71tUeVH/NNLjg5ChPdjIhKCtavHguLwFY9aIEAs2zJtOInl0QXV
         C6cKp2sUVqAb/UF2uH8qj/xiXtu/EAiWdM7AD+vdhDAYRp3a4n90p26v15zoTpbKWuTv
         f88tXFjihrBLGqUUzi5dXUZPW78hb0ryvrk90D9Tbf7q5aWyuLCq49A6HtefYUh8SQo5
         v85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678734866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2Z/JwvQAbkq+jbR35+zT7Gv5+mYDXu9h5Itgt8QB4g=;
        b=Oj7sVyTvYvcY4NiXtJ3fYljHaFlN6RXPK+icfMsDmyLLSlwi8WBdrqEpSQex56nUQL
         x0c2N1GbpvAnaR2VxlUGnWtmx+PhVV0WS2Q8K8gZuNfBSg6/OpdllSTRbwDHKA4ODdk3
         gfht5sqDgwQTkliJxRq7qCpmXevUVj8TpY/HcAdHvl6vGfMW7EzDrOmM/1nvkpTPu1hc
         u+ZpkEBb8YeQQjg3kM2R9S+Ed0dVFGElAZrm1XKSiSEPROYhJx9E+uXpG5QbgfVgGfLH
         E+pswJ58g2+hL+X6HWFj6ShsvOnkI3PP+2nlkgbmQCMQjiLS3bv2n5A6lEvwwXpNl0mD
         RYxg==
X-Gm-Message-State: AO0yUKUzYVv26XeKWJY2JoNuaNyYnekdx/MSPH7fqarUC5MMM35WCEnx
	q2xzWuy4XydQ5vxWlll7q9eV3SA9LJAmZDL0tVW1UL455vA=
X-Google-Smtp-Source: AK7set801lIQQHZJGnfW9V4W5IhO6zq7jFjzBE36Qsk8ydsMs844sKhD7bb1EYRUj8brPko1ymVTqhsZrNinVJDMApI=
X-Received: by 2002:a17:907:9618:b0:91f:79d3:d3e2 with SMTP id
 gb24-20020a170907961800b0091f79d3d3e2mr4277945ejc.3.1678734866078; Mon, 13
 Mar 2023 12:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230313175047.20719-1-jandryuk@gmail.com> <a990fe77-6132-c5df-c149-6255fb13d845@apertussolutions.com>
In-Reply-To: <a990fe77-6132-c5df-c149-6255fb13d845@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 13 Mar 2023 15:14:13 -0400
Message-ID: <CAKf6xpt02aK7SWNb=xB3kKZB3Dt9UC8mMKMVz5kq96uNJvdzbQ@mail.gmail.com>
Subject: Re: [PATCH] flask: label-pci: Allow specifying optional irq label
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 2:49=E2=80=AFPM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
> On 3/13/23 13:50, Jason Andryuk wrote:
> >               usage(argCnt, argv);
> >
> > +     if (argCnt =3D=3D 4) {
> > +         pirq_label =3D argv[3];
> > +     } else {
> > +         pirq_label =3D argv[2];
> > +     }
> > +
>
> style nit: space inside parens and curly brackets could be dropped or
> should be moved to their own lines.

This file doesn't follow Xen style.  I think dropping the curly braces
is fine, but the lack of spaces 'if (argCnt =3D=3D 4)' should stay for
consistency.  Does that sound okay?

> >       xch =3D xc_interface_open(0,0,0);
> >       if ( !xch )
> >       {
> > @@ -107,7 +114,7 @@ int main (int argCnt, char *argv[])
> >       if (fscanf(f, "%" SCNu64, &start) !=3D 1)
> >               start =3D 0;
> >       if (start) {
> > -             ret =3D xc_flask_add_pirq(xch, start, argv[2]);
> > +             ret =3D xc_flask_add_pirq(xch, start, pirq_label);
> >               if (ret) {
> >                       fprintf(stderr, "xc_flask_add_pirq %"PRIu64" fail=
ed: %d\n",
> >                                       start, ret);
>
> Style nits aside, LGTM.
>
> Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Thanks,
Jason

