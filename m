Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF193606011
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 14:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426699.675311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUYQ-0007Pc-Uj; Thu, 20 Oct 2022 12:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426699.675311; Thu, 20 Oct 2022 12:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUYQ-0007NT-S5; Thu, 20 Oct 2022 12:21:42 +0000
Received: by outflank-mailman (input) for mailman id 426699;
 Thu, 20 Oct 2022 12:21:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bGcH=2V=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1olUYP-0007NN-N6
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 12:21:41 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbc07782-5071-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 14:21:33 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id r17so46914965eja.7
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 05:21:40 -0700 (PDT)
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
X-Inumbo-ID: bbc07782-5071-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IGrBQa4dKAVSu2S4BcOlLBn8S/NnavFLgJaicb8vQu0=;
        b=ZQpm2lcsli3QYI8c+XXlZ/PVz3ooW6w4b5Mmjq4S3wj2ZWs0gomnrAEswUfuVMSEcB
         eH24HXopl+ejc6j6q/xST8VBrxCaZYXtbEYUPmay04U2bKYOwf9a3pXlqchfvHgimGxX
         as0oF66ECDb/95M4SC8EA9Ok4PNFayvL7AQqqeHJE1HNYRygU07DNFiOxi4+xPxF0Td7
         w6NULbuuQSXju9Ujzv80/cNS10Vf8HrMlRdu5OYSFgeyeLtjYXYgKWdNRjL67GY8bz3Q
         +nrJhBhKiywK9iOG50lN3PB+JLhDtnXo99WNa8FWonU0GY2Uq6cgONd6aHAz0rRUptDu
         u4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGrBQa4dKAVSu2S4BcOlLBn8S/NnavFLgJaicb8vQu0=;
        b=3AJTL64ahafqKMKVITZ6HM4xx6fg8UvxqTPT9K7RoJegjnYipLIu7PPp40FBEkEpZN
         GpB1kFkVAit/pNbmPNZI4ux7fcijdGAZwd6X5xt5Vp/zspKKfEjfOXvTsFQeeETFEGt4
         8OPEv1n2OHhNnioujxVge/drTqw/5EtQRAwRd4qcJ9S/lJHgue43goBc4aZkURZfvp3p
         Fd0fWShZ+N75yyX4t90PySfKKsMjfB57xw73NqmzERHH0XzuYKhLJEV78/u4mQXF7/KD
         m9ViXbxH8/V2Xv7hyzjijO6IXIxfvxELm78lKo8yq5GxHTGnVgiomiq0B0/T5RTuqgOP
         hExQ==
X-Gm-Message-State: ACrzQf39RvFNleg20ee2GOGajrCc6zeb1zov5oj6hcaUh9D2nUNr7Ui/
	gsbSo41uBzmnLfLfuBIXo8WwD89aGc7JWb85dWE=
X-Google-Smtp-Source: AMsMyM5rrYLJxnUL0QjcOxLrM4KH7p1BP8kgKiFJVnjNMqYfXBoY0qw73eoKLyoIKGqreJdS0nOkOF5NidYfzvwAPyA=
X-Received: by 2002:a17:907:788:b0:741:4d1a:595d with SMTP id
 xd8-20020a170907078800b007414d1a595dmr10552932ejb.737.1666268499744; Thu, 20
 Oct 2022 05:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221019201458.21803-1-jandryuk@gmail.com> <87zgdq99qx.fsf@baylibre.com>
In-Reply-To: <87zgdq99qx.fsf@baylibre.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 20 Oct 2022 08:21:27 -0400
Message-ID: <CAKf6xpvHa86frvOp5L3x1nerTCQD=cjz7xqR4VwFBExquKG5bw@mail.gmail.com>
Subject: Re: [PATCH] Input: xen-kbdfront - drop keys to shrink modalias
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Phillip Susi <phill@thesusis.net>, stable@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 4:31 AM Mattijs Korpershoek
<mkorpershoek@baylibre.com> wrote:
>
> On Wed, Oct 19, 2022 at 16:14, Jason Andryuk <jandryuk@gmail.com> wrote:
>
> > xen kbdfront registers itself as being able to deliver *any* key since
> > it doesn't know what keys the backend may produce.
> >
> > Unfortunately, the generated modalias gets too large and uevent creation
> > fails with -ENOMEM.
> >
> > This can lead to gdm not using the keyboard since there is no seat
> > associated [1] and the debian installer crashing [2].
> >
> > Trim the ranges of key capabilities by removing some BTN_* ranges.
> > While doing this, some neighboring undefined ranges are removed to trim
> > it further.
> >
> > This removes:
> > BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
> > Empty space 0x224..0x229
> >
> > Emtpy space 0x2bd..0x2bf
> > BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
> > Empty space 0x2e8..0x2ff
> >
> > The modalias shrinks from 2082 to 1754 bytes.
> >
> > [1] https://github.com/systemd/systemd/issues/22944
> > [2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net/T/
> >
> > Cc: Phillip Susi <phill@thesusis.net>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

This patch doesn't work and needs to be withdrawn.  My gdm/udev
workaround was still active when I tested, so that is why I had a
working keyboard.  Sorry about that.

Now the question is, which additional keys can be omitted to trim the
modalias to an acceptable size?

Regards,
Jason

> > ---
> >  drivers/input/misc/xen-kbdfront.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
> > index 8d8ebdc2039b..23f37211be78 100644
> > --- a/drivers/input/misc/xen-kbdfront.c
> > +++ b/drivers/input/misc/xen-kbdfront.c
> > @@ -256,7 +256,14 @@ static int xenkbd_probe(struct xenbus_device *dev,
> >               __set_bit(EV_KEY, kbd->evbit);
> >               for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
> >                       __set_bit(i, kbd->keybit);
> > -             for (i = KEY_OK; i < KEY_MAX; i++)
> > +             /* In theory we want to go KEY_OK..KEY_MAX, but that grows the
> > +              * modalias line too long.  KEY_KBD_LCD_MENU5 is the last
> > +              * defined non-button key. There is a gap of buttons from
> > +              * BTN_DPAD_UP..BTN_DPAD_RIGHT and KEY_ALS_TOGGLE is the next
> > +              * defined. */
> > +             for (i = KEY_OK; i < BTN_DPAD_UP; i++)
> > +                     __set_bit(i, kbd->keybit);
> > +             for (i = KEY_ALS_TOGGLE; i <= KEY_KBD_LCD_MENU5; i++)
> >                       __set_bit(i, kbd->keybit);
> >
> >               ret = input_register_device(kbd);
> > --
> > 2.37.3

