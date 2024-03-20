Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9E8816BC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 18:42:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696080.1086689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzxb-0001FR-TO; Wed, 20 Mar 2024 17:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696080.1086689; Wed, 20 Mar 2024 17:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmzxb-0001CN-QB; Wed, 20 Mar 2024 17:42:43 +0000
Received: by outflank-mailman (input) for mailman id 696080;
 Wed, 20 Mar 2024 17:42:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5f7=K2=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1rmzxa-0001CB-K3
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 17:42:42 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5b8f13-e6e1-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 18:42:40 +0100 (CET)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so124111276.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 10:42:40 -0700 (PDT)
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
X-Inumbo-ID: 3f5b8f13-e6e1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710956559; x=1711561359; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PNmrfeclRSaZ0piCvl3NPFSnMqmFKWwWU1pPxBzzB4=;
        b=nkRbUSfqlhxIGfWA4dFhT8hmEPqREEXhOxzv0gj0g4be49m8+rGuubh7ksgdeq+0XA
         M1zuipMyx2FDXzKMi+FRxu9KLwX/TkcaBGJNHNbZw9gH9/Ow/q58JhqezvpChyV50EtY
         5Nq1p/N2Ed1XxNBWAu+dMRqCegKoa3k1WF5zmwCLIn8Uv8JP5XWswaGdXZONz4jylK9c
         ya9U3R/KRq6BERxYTCwoaMJe4Y/mSfZQFFBLO1kL1Owu45qK1rKkQb2NXa6mr+y8X2RL
         Yq2ERtdVvn7QMd2UnwRUqbm0V3uO9JYnMNQocxKcrFMr2MSNKjxHATYUA5w22kScbl5N
         cbjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710956559; x=1711561359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PNmrfeclRSaZ0piCvl3NPFSnMqmFKWwWU1pPxBzzB4=;
        b=BWGharQ8kON+ml+zEQONl4VxS2AVHNpix/0aBmVtpRWxo6nrU0mvfY4KccYGk8HJsq
         p+L0uroe21VDNQsbOV7Xly8m1spqIx21iNdmWwcYXp0c9uTEQMrXXdE9KsYvxZ/v+PSX
         DNMxsVA2FFploTDDBbd3BNPmUsJ0FaWtpdeSc/qU9KmUuR/6TGOn3FVP2UZlgiqnmMst
         KjzTY7QqCeUk82l8jhE7T89DPxP+Gw0PYjH8Y9zWVbAaS04WTR1zsokZElowGxnMeVOM
         2IVNm3AXMcgtRrjWh+D6uBe9gBxgVOMKHU/V9/3RWkS46a+Uu+6DojYH1LyKhwRTsI09
         7Xbw==
X-Forwarded-Encrypted: i=1; AJvYcCXil3q3rHiPW1StUouBxsN6s165pz2IhYFL1x8LHhGPKOuzKLN3zhSmneylWnb0DBYLqD/QARakDdvxb40JIKpe71poosNCBPP0uMsl20I=
X-Gm-Message-State: AOJu0YzdPv+BJLFzPU/ed4g6Hqus3/g753t6lZhVIC3lBeHXnt04476F
	teHitar3am3bRBRfbjY8yuktizc5nRmohqizNXaRgHtbsw0rejuPghO1VRKO59LcPruxpH7jj7i
	mrqIDUbnxWzKDRrIpM/blbuolVSA=
X-Google-Smtp-Source: AGHT+IF1vHg3nWNn8XTf2zs//TlcE4NB9URz9j93fR3rDahcsKwH8Qh2oWbvidfw1UwEtC6WUuLogrROJAMX9zdn2KI=
X-Received: by 2002:a25:c747:0:b0:dd1:6cad:8fd3 with SMTP id
 w68-20020a25c747000000b00dd16cad8fd3mr284023ybe.27.1710956559522; Wed, 20 Mar
 2024 10:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231011193444.81254-1-jandryuk@gmail.com> <CAKf6xpuJe6Cza6bow3QxDGf1viu0kish7Y8YRN8haXL1oEF3HA@mail.gmail.com>
In-Reply-To: <CAKf6xpuJe6Cza6bow3QxDGf1viu0kish7Y8YRN8haXL1oEF3HA@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 20 Mar 2024 13:42:27 -0400
Message-ID: <CAKf6xpv2oDpPB3wWh=Fz_ahDVgmvw2MSj_q3RYqQ8NG6km5Tuw@mail.gmail.com>
Subject: Re: [PATCH v3] Input: xen-kbdfront - drop keys to shrink modalias
To: linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Phillip Susi <phill@thesusis.net>, stable@vger.kernel.org, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-input@vger.kernel.org, 
	xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Do you have any feedback, or can you pick up this patch?  It solves a
real issue affecting udev, which crashes the Debian installer and
breaks the mouse for Gnome.

Or would you be okay if this patch went in via the Xen tree?

Thanks,
Jason

On Wed, Nov 1, 2023 at 10:11=E2=80=AFAM Jason Andryuk <jandryuk@gmail.com> =
wrote:
>
> Hi Dmitry,
>
> Do you have any feedback or can you pick this up?
>
> Thanks,
> Jason
>
> On Wed, Oct 11, 2023 at 3:34=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com=
> wrote:
> >
> > xen kbdfront registers itself as being able to deliver *any* key since
> > it doesn't know what keys the backend may produce.
> >
> > Unfortunately, the generated modalias gets too large and uevent creatio=
n
> > fails with -ENOMEM.
> >
> > This can lead to gdm not using the keyboard since there is no seat
> > associated [1] and the debian installer crashing [2].
> >
> > Trim the ranges of key capabilities by removing some BTN_* ranges.
> > While doing this, some neighboring undefined ranges are removed to trim
> > it further.
> >
> > An upper limit of KEY_KBD_LCD_MENU5 is still too large.  Use an upper
> > limit of KEY_BRIGHTNESS_MENU.
> >
> > This removes:
> > BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
> > Empty space 0x224..0x229
> >
> > Empty space 0x28a..0x28f
> > KEY_MACRO1(0x290)..KEY_MACRO30(0x2ad)
> > KEY_MACRO_RECORD_START          0x2b0
> > KEY_MACRO_RECORD_STOP           0x2b1
> > KEY_MACRO_PRESET_CYCLE          0x2b2
> > KEY_MACRO_PRESET1(0x2b3)..KEY_MACRO_PRESET3(0xb5)
> > Empty space 0x2b6..0x2b7
> > KEY_KBD_LCD_MENU1(0x2b8)..KEY_KBD_LCD_MENU5(0x2bc)
> > Empty space 0x2bd..0x2bf
> > BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
> > Empty space 0x2e8..0x2ff
> >
> > The modalias shrinks from 2082 to 1550 bytes.
> >
> > A chunk of keys need to be removed to allow the keyboard to be used.
> > This may break some functionality, but the hope is these macro keys are
> > uncommon and don't affect any users.
> >
> > [1] https://github.com/systemd/systemd/issues/22944
> > [2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net/T=
/
> >
> > Cc: Phillip Susi <phill@thesusis.net>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> > ---
> > v3:
> > Add Mattijs R-b
> > Put /* and */ on separate lines
> > ---
> >  drivers/input/misc/xen-kbdfront.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen=
-kbdfront.c
> > index 67f1c7364c95..d59ba8f9852e 100644
> > --- a/drivers/input/misc/xen-kbdfront.c
> > +++ b/drivers/input/misc/xen-kbdfront.c
> > @@ -256,7 +256,16 @@ static int xenkbd_probe(struct xenbus_device *dev,
> >                 __set_bit(EV_KEY, kbd->evbit);
> >                 for (i =3D KEY_ESC; i < KEY_UNKNOWN; i++)
> >                         __set_bit(i, kbd->keybit);
> > -               for (i =3D KEY_OK; i < KEY_MAX; i++)
> > +               /*
> > +                * In theory we want to go KEY_OK..KEY_MAX, but that gr=
ows the
> > +                * modalias line too long.  There is a gap of buttons f=
rom
> > +                * BTN_DPAD_UP..BTN_DPAD_RIGHT and KEY_ALS_TOGGLE is th=
e next
> > +                * defined. Then continue up to KEY_BRIGHTNESS_MENU as =
an upper
> > +                * limit.
> > +                */
> > +               for (i =3D KEY_OK; i < BTN_DPAD_UP; i++)
> > +                       __set_bit(i, kbd->keybit);
> > +               for (i =3D KEY_ALS_TOGGLE; i <=3D KEY_BRIGHTNESS_MENU; =
i++)
> >                         __set_bit(i, kbd->keybit);
> >
> >                 ret =3D input_register_device(kbd);
> > --
> > 2.41.0
> >

