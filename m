Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926F6060BC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 14:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426732.675367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olV6J-0004tQ-Lx; Thu, 20 Oct 2022 12:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426732.675367; Thu, 20 Oct 2022 12:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olV6J-0004rM-Ir; Thu, 20 Oct 2022 12:56:43 +0000
Received: by outflank-mailman (input) for mailman id 426732;
 Thu, 20 Oct 2022 12:56:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bGcH=2V=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1olV6H-0004rG-S5
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 12:56:41 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a40c170a-5076-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 14:56:40 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id e18so29745694edj.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 05:56:40 -0700 (PDT)
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
X-Inumbo-ID: a40c170a-5076-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=211dklALD6kGYLtQWYoou26mE1SCmw0zj++qOMCYAqo=;
        b=bB5izx67N6r3OD509n1Qml1Lhtq/mqwKb4YnJlEiBLkuOTQy7gJbbSSoQsG2j89rW3
         tfz2SZsi4mEYpMMuj1CuhgwdREvJeeUr+UW59UTPIjEopAltK2ihEAbKBNCi44cOIces
         kaq76CsNQuhycRuA6xevwN81B0e6J2ee7qzuk287844nUVu34FM5nhrACUtUHjn2MBrZ
         r+KSmX4jMMyUGVB6zvMJ/sDNPA1fgt96q/04oYFl8uJEuxXd8me1MZcWUgEI7GUBuTv5
         lsxMnj/5W2DEB5vXJvle3f3wRI/0723NSensamUuIjaX3sDc6/Y2E9CB4ulFbu314xbz
         hVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=211dklALD6kGYLtQWYoou26mE1SCmw0zj++qOMCYAqo=;
        b=NtDbUUwPV37JvO6y/ehWcSUJggqDzfiF99d1hzeaHDU/zyCiBymWsRSzbv7i5iykcx
         XEiIGdBnK/nmbvJVZSQxgdkn8wvn8GRb5irAecva0NRBaK2AdpfUyQ3fji6J60b6XRos
         29g8bMKim3rDkx8CHYqJ7jetiEbmeUDOxwaqwNzfCRHKxywAnUckAZXKJDC3AQOl/WNM
         DoYtzVBzdMB9GmHakg8pDIvzYwoB19jjRcIGnCOXagf6A0ZnOjqHYuHfv/xTmEQaIQYn
         GcHbYM4qaipnCaYt4m7s/Q4FYo2sWPsiz8Vfo40Bfk02Sat6C/oQvN0tALXMoVaPS/kO
         B7zA==
X-Gm-Message-State: ACrzQf0nV69FaB4Hl9UBQOTk4ee4AkWRDww+Sq2fA43rSjpyb9AOrKjU
	Q8YqZheXt/cvPnQvl19hhoaXg6zHBexDn+t1GlgQseLibLM=
X-Google-Smtp-Source: AMsMyM6ct2gQbef1pZcBeR72NPxKc89pqQgxVpdTN84gbT3+Qc7/qAxzeQBOM4cb7WeVMjaW6um+zrL3dI2YH/lcqB4=
X-Received: by 2002:aa7:ca45:0:b0:458:d9a2:6164 with SMTP id
 j5-20020aa7ca45000000b00458d9a26164mr12275972edt.340.1666270600413; Thu, 20
 Oct 2022 05:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221019201458.21803-1-jandryuk@gmail.com> <87zgdq99qx.fsf@baylibre.com>
 <CAKf6xpvHa86frvOp5L3x1nerTCQD=cjz7xqR4VwFBExquKG5bw@mail.gmail.com>
In-Reply-To: <CAKf6xpvHa86frvOp5L3x1nerTCQD=cjz7xqR4VwFBExquKG5bw@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 20 Oct 2022 08:56:27 -0400
Message-ID: <CAKf6xpvd6rg4AP1XfhCLo0K+BfhVrydBhJy8TReAaTD_1zcY0g@mail.gmail.com>
Subject: Re: [PATCH] Input: xen-kbdfront - drop keys to shrink modalias
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Phillip Susi <phill@thesusis.net>, stable@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 20, 2022 at 8:21 AM Jason Andryuk <jandryuk@gmail.com> wrote:
>
> On Thu, Oct 20, 2022 at 4:31 AM Mattijs Korpershoek
> <mkorpershoek@baylibre.com> wrote:
> >
> > On Wed, Oct 19, 2022 at 16:14, Jason Andryuk <jandryuk@gmail.com> wrote:
> >
> > > xen kbdfront registers itself as being able to deliver *any* key since
> > > it doesn't know what keys the backend may produce.
> > >
> > > Unfortunately, the generated modalias gets too large and uevent creation
> > > fails with -ENOMEM.
> > >
> > > This can lead to gdm not using the keyboard since there is no seat
> > > associated [1] and the debian installer crashing [2].
> > >
> > > Trim the ranges of key capabilities by removing some BTN_* ranges.
> > > While doing this, some neighboring undefined ranges are removed to trim
> > > it further.
> > >
> > > This removes:
> > > BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
> > > Empty space 0x224..0x229
> > >
> > > Emtpy space 0x2bd..0x2bf
> > > BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
> > > Empty space 0x2e8..0x2ff
> > >
> > > The modalias shrinks from 2082 to 1754 bytes.
> > >
> > > [1] https://github.com/systemd/systemd/issues/22944
> > > [2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net/T/
> > >
> > > Cc: Phillip Susi <phill@thesusis.net>
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>
> This patch doesn't work and needs to be withdrawn.  My gdm/udev
> workaround was still active when I tested, so that is why I had a
> working keyboard.  Sorry about that.
>
> Now the question is, which additional keys can be omitted to trim the
> modalias to an acceptable size?
>
> Regards,
> Jason
>
> > > ---
> > >  drivers/input/misc/xen-kbdfront.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
> > > index 8d8ebdc2039b..23f37211be78 100644
> > > --- a/drivers/input/misc/xen-kbdfront.c
> > > +++ b/drivers/input/misc/xen-kbdfront.c
> > > @@ -256,7 +256,14 @@ static int xenkbd_probe(struct xenbus_device *dev,
> > >               __set_bit(EV_KEY, kbd->evbit);
> > >               for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
> > >                       __set_bit(i, kbd->keybit);
> > > -             for (i = KEY_OK; i < KEY_MAX; i++)
> > > +             /* In theory we want to go KEY_OK..KEY_MAX, but that grows the
> > > +              * modalias line too long.  KEY_KBD_LCD_MENU5 is the last
> > > +              * defined non-button key. There is a gap of buttons from
> > > +              * BTN_DPAD_UP..BTN_DPAD_RIGHT and KEY_ALS_TOGGLE is the next
> > > +              * defined. */
> > > +             for (i = KEY_OK; i < BTN_DPAD_UP; i++)
> > > +                     __set_bit(i, kbd->keybit);
> > > +             for (i = KEY_ALS_TOGGLE; i <= KEY_KBD_LCD_MENU5; i++)

Changing the upper bound to KEY_BRIGHTNESS_MENU works.  That trims out
KEY_MACRO* and KEY_KBD_LCD_MENU*.

Something has to get trimmed out to bring the size down.  These are
probably less common and okay to remove, but I'm just guessing.

Regards,
Jason

