Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EFF89DC63
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 16:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702479.1097541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCZB-00017t-SW; Tue, 09 Apr 2024 14:35:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702479.1097541; Tue, 09 Apr 2024 14:35:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCZB-00016H-Ox; Tue, 09 Apr 2024 14:35:17 +0000
Received: by outflank-mailman (input) for mailman id 702479;
 Tue, 09 Apr 2024 14:35:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zydU=LO=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1ruCZ9-00016B-Q8
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 14:35:15 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60de3a56-f67e-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 16:35:14 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e69a51a33so1667287a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 07:35:14 -0700 (PDT)
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
X-Inumbo-ID: 60de3a56-f67e-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712673314; x=1713278114; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxP/xLOSQE4DlqjS6hxD6RpV28qNSWUAHdA1VliyOg0=;
        b=zlHNPrA0nNq8HSQt08B6M+Bx0blVYyygdRBmjhbANf8F2dG+bM3E3sjWpQ9tzL4T/f
         wVeUo1A1eJiz7XynpcK8v6uh9/6lwQdC4DlM9wK1yM0O4afa4KZP7H9FafceuC07o00m
         lOS7I6efIwIt3JmvHlj1IALTH/G0aOHWYqtxsIrCSac54z5V4jmB+D2abIBw05sjhDDC
         Hv4PN0DpJ8ew7ohx+KrPqBxJQ6moRCOUXCAj+4j+L8HbfFxgTfdKm4n4g1ugksuOoUJk
         m+QQu9OUm5xmR+BqsjzOWwE3fMHMWamgS45mbT+hcH+zTwOgrqFQjRb0gPC9a9RV9m31
         i3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712673314; x=1713278114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxP/xLOSQE4DlqjS6hxD6RpV28qNSWUAHdA1VliyOg0=;
        b=MfFHuXT9Y8O3k3u2mZusvsFdozFDWY/hE984gG00i2SdU1Ty1rUEYVZzdgIm8LxCMH
         WY9Gp55Zvlj8mJFP4SiI4OdN6fkAbm3OCzYhhEjqWL7PtILx6pqgVYWkUBB8zo30ueLY
         x/7J+EJ+IxWmvIgwC5He3QvTxUaTIuEFo/EEW6RDBBYM+h1MBr+Qzc6sX+VuezjxQdNI
         EeRqYq5RWalqjaISUqJ51nF/I9CT9w3vFdCUPPoergtLXI7LDp3MUI6g0uhiAAAMBkRc
         Xai1P2bQ1VRrM4NPvzGqotokBi3XrAcFj8iO9ZGS9RRsCpiuSvQcb+gqcTwOsZi6l3SS
         SIVg==
X-Forwarded-Encrypted: i=1; AJvYcCU4uv4aNvfTyYQqgSqTCK8DAPdXVl4j5/w3a39mkA6z7e7p+SaBhW1MW0TmD1sr26AzMSm9PSwzxbytKPWIIHiltQJgmEVCPxtbYOVdFWk=
X-Gm-Message-State: AOJu0YyhHDLrKz4GAKPAYdFQ6R3eH/IfmFc9SpqQZA7T5mKBzJ/EhCeR
	VrHBovfl5TvTwMoxOG/Fgf5EsLaIAllT9bjOo/OhZTewW/ZfVWNF0GEXUnPlw3kIH6DqXNYowz3
	35CBZrQRzCSTzYPv7NRHmuqv3fN39/1/M/tlEgw==
X-Google-Smtp-Source: AGHT+IECGSkbWKFSnYTrHx1muxALrruUoMZs6nDrfynceIA6/aSeJRRdgHOQklv/+WejsjqIX4AQOqSvzB4xb/UQwsE=
X-Received: by 2002:a50:cd5d:0:b0:56e:2464:7c41 with SMTP id
 d29-20020a50cd5d000000b0056e24647c41mr9418694edj.19.1712673314113; Tue, 09
 Apr 2024 07:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240404140833.1557953-1-ross.lagerwall@citrix.com>
 <90f07634-1600-4654-8e36-7ac9e2f457e8@perard> <CAG7k0EqJvVZJUNaf31Jd1ZfwvOon8saNbtHofon=VvB6gpj9qw@mail.gmail.com>
In-Reply-To: <CAG7k0EqJvVZJUNaf31Jd1ZfwvOon8saNbtHofon=VvB6gpj9qw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Apr 2024 15:35:03 +0100
Message-ID: <CAFEAcA9LzTTO=H6CB26-wVAFJg5xvq8tpkrKOY_D57376NNfkw@mail.gmail.com>
Subject: Re: [PATCH] xen-hvm: Avoid livelock while handling buffered ioreqs
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Anthony PERARD <anthony.perard@cloud.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 9 Apr 2024 at 15:20, Ross Lagerwall <ross.lagerwall@citrix.com> wro=
te:
>
> On Tue, Apr 9, 2024 at 11:20=E2=80=AFAM Anthony PERARD <anthony.perard@cl=
oud.com> wrote:
> >
> > On Thu, Apr 04, 2024 at 03:08:33PM +0100, Ross Lagerwall wrote:
> > > diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> > > index 1627da739822..1116b3978938 100644
> > > --- a/hw/xen/xen-hvm-common.c
> > > +++ b/hw/xen/xen-hvm-common.c
> > > @@ -521,22 +521,30 @@ static bool handle_buffered_iopage(XenIOState *=
state)
> > [...]
> > >
> > >  static void handle_buffered_io(void *opaque)
> > >  {
> > > +    unsigned int handled;
> > >      XenIOState *state =3D opaque;
> > >
> > > -    if (handle_buffered_iopage(state)) {
> > > +    handled =3D handle_buffered_iopage(state);
> > > +    if (handled >=3D IOREQ_BUFFER_SLOT_NUM) {
> > > +        /* We handled a full page of ioreqs. Schedule a timer to con=
tinue
> > > +         * processing while giving other stuff a chance to run.
> > > +         */
> >
> > ./scripts/checkpatch.pl report a style issue here:
> >     WARNING: Block comments use a leading /* on a separate line
> >
> > I can try to remember to fix that on commit.
>
> I copied the comment style from a few lines above but I guess it was
> wrong.

Yes, this is one of those cases where we've settled on a
style choice but there's still quite a lot of older code
in the codebase that doesn't adhere to it. Checkpatch
usually will catch this kind of nit for you.

thanks
-- PMM

