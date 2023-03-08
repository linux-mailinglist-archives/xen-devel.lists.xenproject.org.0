Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167FD6B0EBD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 17:28:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508111.782421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZwe6-0003yC-Hk; Wed, 08 Mar 2023 16:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508111.782421; Wed, 08 Mar 2023 16:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZwe6-0003vO-Ed; Wed, 08 Mar 2023 16:28:06 +0000
Received: by outflank-mailman (input) for mailman id 508111;
 Wed, 08 Mar 2023 16:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pZwe5-0003vI-7S
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 16:28:05 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32c2a014-bdce-11ed-956e-85ef70e17bfa;
 Wed, 08 Mar 2023 17:28:03 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id k10so44136336edk.13
 for <xen-devel@lists.xenproject.org>; Wed, 08 Mar 2023 08:28:03 -0800 (PST)
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
X-Inumbo-ID: 32c2a014-bdce-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678292882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qplyMQINe2W3LTK4CSzGPDowxH4S62V5RleKulPJLo=;
        b=UtXXjB2Sb8uE0I4aQP+tKLypRWWg8k3euJKU2xyVGn64N6QNcvZeL21p+DOHBO63lz
         gZkplvHD9ZzIaTXGvqSOp3gmPNC+rmIPzX3HMIBoW5fHIZcEjiFeovQTma48qQrCmtDL
         B1n7s5Kaggh90Z/RXSXXfnypGsOT5SMrjcerMVXz4qTgDlSgqm0NxX7BB/3AdeGXXZ+Q
         7nxPhpFKOI7n3b4fa3Rfu+wwB+ceq7APuXgJGE2pJmXLlio7Kl7JaylaKPSgrXsqDSIi
         usqxI8ZBZe+BR0o2rb40Zm4iTall99XMKe1a/ho6rCaRJLd+kfsXWLLWYnaz/mvAV/je
         wqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678292882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qplyMQINe2W3LTK4CSzGPDowxH4S62V5RleKulPJLo=;
        b=WzsfqFkrI4nmH2RonmuvaMPbT+GHD2x9GKqk1e4yOZkg5czN1FxAMJx+4UdWnW7Dhj
         OvpLnndPvxd3pnsgs5iPhLaSbxcBNfIllJNr3yvzubGxVtfZNRef3Z3zchnWp2YMDG9Q
         El/pGKn4fsNH5bvocXTxUhbHzfn3TWVvJbvF93DkrANdPXIve4TxC6oQFzh9tO7Gu8eG
         1gJoQnSH2ooXcrJMSC/NOTk2GluVtJ9meJoQj2419nj9M8bw/Sg2h4BS2JHx/IWyaFgi
         DR9UiMLBuQv6MqxwcT/1kUIIdwyoNXIdTpktlGma4aquyqpfTSOV33xMtQQ8QIWsAdTZ
         4IOg==
X-Gm-Message-State: AO0yUKXQE4QWJKwl0lnN02vD1KvUziNATDx8dSt5e8kOm0ayuNyi7YTL
	YHaSkAWnww2dfMKxY9EFgzA9KFClJ/uojAQh5JI=
X-Google-Smtp-Source: AK7set+hOtnRk+qv+mClFvaRL1/R3Qml7puc5AuPLJ04zytXRlCcUdQoy38YoFwXbCxX06FIf9stExK/tK3Naq6QgOM=
X-Received: by 2002:a17:906:6b83:b0:878:790b:b7fd with SMTP id
 l3-20020a1709066b8300b00878790bb7fdmr8941949ejr.14.1678292882589; Wed, 08 Mar
 2023 08:28:02 -0800 (PST)
MIME-Version: 1.0
References: <20221209142615.33574-1-jandryuk@gmail.com> <87359gkc1d.fsf@baylibre.com>
 <CAKf6xpsGy7rjK3Rkosevr3dD+64-WqCEzAecBbHEHpBMeAHh7A@mail.gmail.com>
In-Reply-To: <CAKf6xpsGy7rjK3Rkosevr3dD+64-WqCEzAecBbHEHpBMeAHh7A@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 8 Mar 2023 11:27:50 -0500
Message-ID: <CAKf6xpsXjZ11cB05q3iKUcY3k2i0MXnpC-8anRe8YAwwxrhh7A@mail.gmail.com>
Subject: Re: [PATCH v2] Input: xen-kbdfront - drop keys to shrink modalias
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Phillip Susi <phill@thesusis.net>, stable@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2023 at 11:26=E2=80=AFAM Jason Andryuk <jandryuk@gmail.com> =
wrote:
>
> On Thu, Dec 15, 2022 at 8:54=E2=80=AFAM Mattijs Korpershoek
> <mkorpershoek@baylibre.com> wrote:
> >
> > On Fri, Dec 09, 2022 at 09:26, Jason Andryuk <jandryuk@gmail.com> wrote=
:
> >
> > > xen kbdfront registers itself as being able to deliver *any* key sinc=
e
> > > it doesn't know what keys the backend may produce.
> > >
> > > Unfortunately, the generated modalias gets too large and uevent creat=
ion
> > > fails with -ENOMEM.
> > >
> > > This can lead to gdm not using the keyboard since there is no seat
> > > associated [1] and the debian installer crashing [2].
> > >
> > > Trim the ranges of key capabilities by removing some BTN_* ranges.
> > > While doing this, some neighboring undefined ranges are removed to tr=
im
> > > it further.
> > >
> > > An upper limit of KEY_KBD_LCD_MENU5 is still too large.  Use an upper
> > > limit of KEY_BRIGHTNESS_MENU.
> > >
> > > This removes:
> > > BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
> > > Empty space 0x224..0x229
> > >
> > > Empty space 0x28a..0x28f
> > > KEY_MACRO1(0x290)..KEY_MACRO30(0x2ad)
> > > KEY_MACRO_RECORD_START          0x2b0
> > > KEY_MACRO_RECORD_STOP           0x2b1
> > > KEY_MACRO_PRESET_CYCLE          0x2b2
> > > KEY_MACRO_PRESET1(0x2b3)..KEY_MACRO_PRESET3(0xb5)
> > > Empty space 0x2b6..0x2b7
> > > KEY_KBD_LCD_MENU1(0x2b8)..KEY_KBD_LCD_MENU5(0x2bc)
> > > Empty space 0x2bd..0x2bf
> > > BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
> > > Empty space 0x2e8..0x2ff
> > >
> > > The modalias shrinks from 2082 to 1550 bytes.
> > >
> > > A chunk of keys need to be removed to allow the keyboard to be used.
> > > This may break some functionality, but the hope is these macro keys a=
re
> > > uncommon and don't affect any users.
> > >
> > > [1] https://github.com/systemd/systemd/issues/22944
> > > [2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net=
/T/
> > >
> > > Cc: Phillip Susi <phill@thesusis.net>
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> >
> > Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>
> Thank you, Mattjis.

Thank you, Mattijs.  My apologies.

Regards,
Jason

