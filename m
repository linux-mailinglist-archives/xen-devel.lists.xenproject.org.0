Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C52B6B0EAB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 17:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508108.782412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZwce-0003RF-6z; Wed, 08 Mar 2023 16:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508108.782412; Wed, 08 Mar 2023 16:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZwce-0003OG-3G; Wed, 08 Mar 2023 16:26:36 +0000
Received: by outflank-mailman (input) for mailman id 508108;
 Wed, 08 Mar 2023 16:26:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pZwcd-0003O8-3P
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 16:26:35 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd24eb13-bdcd-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 17:26:33 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id a25so68244668edb.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Mar 2023 08:26:33 -0800 (PST)
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
X-Inumbo-ID: fd24eb13-bdcd-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678292793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgeq78gxLIL21D+IlAHaFMTP9xI3MPSeyQyoWJK0zfA=;
        b=GFX5HX0K7Tx2uIr251PpqSuZ8wwtoOoiqB1FQIQTABwC3UKfOcLbXUPi2viqlFfvbZ
         utvcZCyW8ORX+t2nO79ztUr/QzfPDzSSyNdkiLuDN6+9nGSGVKFZfVpoEkd2H7meGdcb
         z3jGtbPkxVgCeTd4HUHDyoAR84+BK+d7UPdgfMitw8N5/qP3wwhFWRijFN799GFqiSOJ
         CZuyxFuwJK+Jl/4C0/aeIxR/U1kqL9L9Sfl8vejqNgRagcY3z6oCg1M9l6kj+iS7qnzQ
         YXvtE6K50caEAHEBk8FZtxTacYnDVJiUNwUfO/h2wz0lQjaIGnxTSBapr0Z/pkyONXlL
         1kZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678292793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgeq78gxLIL21D+IlAHaFMTP9xI3MPSeyQyoWJK0zfA=;
        b=3d6WuLPWflPPKyGkz0ffZFXXqn0oSl3ynnhT/yoNS7j0wJTwCsrFu2ulxbTNtnCV7Q
         lp7c/LUKfhtUOHG9winLFxaW/GCLA8qyC/JaaNmFoPH2vngOM7zmxcRAFC49KlmwIDlX
         Fn2/WPUdbJPaRi9/zkKHEpKPhV7E3j8bVx8hK7eOiA22mDZDBAXTwLfHcIa7vCKFLaXp
         EG/B/XrApk7jgXuD+puuOiS1xYVf6HrIfXQAH3wdn9ltV6rXScWzcbh+dM+m5P4By8NA
         M9dWITzVMiKhN4QxT3VYaimyTrmxsajkWrmRVEeBleZr0EBikbGupRM2VFaTttY8lurB
         AcYg==
X-Gm-Message-State: AO0yUKU6EzRXGzhacp4I/sVxc8EYE8dczNn8SAvPvPnNtL22EEkGx49I
	YBAJUIFgyfcNLp9ySUpHao9E4iQYc2uopq5UeJNNL2+U
X-Google-Smtp-Source: AK7set/GaI7SD2azpTIvM79a+TR5Z7cOLnZiQ9WZQ9Nhtda1MjFzID3oaJfGnh3IEVk3XUW6+PmZMzp5v6bZmTsLvJg=
X-Received: by 2002:a17:906:5811:b0:877:747d:4a90 with SMTP id
 m17-20020a170906581100b00877747d4a90mr9518767ejq.14.1678292792688; Wed, 08
 Mar 2023 08:26:32 -0800 (PST)
MIME-Version: 1.0
References: <20221209142615.33574-1-jandryuk@gmail.com> <87359gkc1d.fsf@baylibre.com>
In-Reply-To: <87359gkc1d.fsf@baylibre.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 8 Mar 2023 11:26:20 -0500
Message-ID: <CAKf6xpsGy7rjK3Rkosevr3dD+64-WqCEzAecBbHEHpBMeAHh7A@mail.gmail.com>
Subject: Re: [PATCH v2] Input: xen-kbdfront - drop keys to shrink modalias
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Phillip Susi <phill@thesusis.net>, stable@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 15, 2022 at 8:54=E2=80=AFAM Mattijs Korpershoek
<mkorpershoek@baylibre.com> wrote:
>
> On Fri, Dec 09, 2022 at 09:26, Jason Andryuk <jandryuk@gmail.com> wrote:
>
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
>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Thank you, Mattjis.

Any other thoughts?  Can this patch be applied?

Thanks,
Jason

