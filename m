Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F06B2A73
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 17:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508322.782904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paIpW-0002X5-8V; Thu, 09 Mar 2023 16:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508322.782904; Thu, 09 Mar 2023 16:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paIpW-0002Us-5I; Thu, 09 Mar 2023 16:09:22 +0000
Received: by outflank-mailman (input) for mailman id 508322;
 Thu, 09 Mar 2023 16:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ET1K=7B=baylibre.com=mkorpershoek@srs-se1.protection.inumbo.net>)
 id 1paIpU-0002Uk-0X
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 16:09:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd826682-be94-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 17:09:16 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso4001983wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Mar 2023 08:09:16 -0800 (PST)
Received: from localhost ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 z18-20020a1c4c12000000b003e876122dc1sm216880wmf.47.2023.03.09.08.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 08:09:07 -0800 (PST)
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
X-Inumbo-ID: bd826682-be94-11ed-956e-85ef70e17bfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678378148;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pU1OTBYl8ElxfZaqjfIJsMTqsKjO/PQMi+tQNnzKT4Q=;
        b=pIgcoivNGH4MKiseDjCPBwqwNgcTN+oHqzet6pS9bNggnPMB+NZupnyxZVeXmTloRt
         6tqVOXifm2/34Zb11GLdRq3BUUe4ML25dHdivce8TeJaZPigbLNX1QkIXM7s0id4CpnZ
         febcVLWZAAony4gltW1DYbDs4GGFeRcql/RLIJyCILnNBlvpGkOVMLuMnopUtYpG7StH
         R5L1crHAgfz3jszL7ceMTPyeQbr+k0CyLlDo0lxTREaKBohPHPg+gpG320/6prtloP9t
         RfTEOyD6IDf7GUMs/Nb/SmpU/eP26aT0msmCzSpgEE34atz8GTAftSF2WtZUA+CAvws6
         PGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678378148;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pU1OTBYl8ElxfZaqjfIJsMTqsKjO/PQMi+tQNnzKT4Q=;
        b=frrPEyubtGMRnh9KFTZQ8i03Of93MwrVu7siaCfG48mG1Ms3rhE95nHmxe/EIbDzcC
         ZqVtG9GlNX8ErgwjNdmi4ROKDyj+7fll6sp2eiuLCrlKNAvQ/cLnoC58l2VpraqLX7Jf
         rH+f2VoqHBv792cY/cY8jdd2v1KiCCRPzDgI+kwh4+MHHucK29p+fm9j8R0qKfZ21IFp
         U8qFWfHCYchj0sv3AxopEol6YtoDpsjyHdJkolKd2O6yHKjq59Oj9+TNU+dVL4xO5uJt
         9UUmjFNQDDa0MLSqIEfMrMhmcvBHT4MuxVDGT+jyUV0lrBvsGRN3toqBkcYfHkgTAGLk
         E8JA==
X-Gm-Message-State: AO0yUKXskGcKP/5Up+uDcCXKfg8G21pGJfPdqw5WFxkByXTJQtj6FR3p
	4FcZWJotYFWAu5h2WH2jOtkWjA==
X-Google-Smtp-Source: AK7set/uDxSQX6guni2q9LjuMZgDKvnwtVPDVc/y4ZwVZTtKpMFGC+aDylsQfmADZ8cH166t4rv0qg==
X-Received: by 2002:a05:600c:1906:b0:3eb:3c76:c23c with SMTP id j6-20020a05600c190600b003eb3c76c23cmr20444802wmq.3.1678378147773;
        Thu, 09 Mar 2023 08:09:07 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, Phillip
 Susi <phill@thesusis.net>, stable@vger.kernel.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: xen-kbdfront - drop keys to shrink modalias
In-Reply-To: <CAKf6xpsGy7rjK3Rkosevr3dD+64-WqCEzAecBbHEHpBMeAHh7A@mail.gmail.com>
References: <20221209142615.33574-1-jandryuk@gmail.com>
 <87359gkc1d.fsf@baylibre.com>
 <CAKf6xpsGy7rjK3Rkosevr3dD+64-WqCEzAecBbHEHpBMeAHh7A@mail.gmail.com>
Date: Thu, 09 Mar 2023 17:09:05 +0100
Message-ID: <87o7p1dhzy.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On mer., mars 08, 2023 at 11:26, Jason Andryuk <jandryuk@gmail.com> wrote:

> On Thu, Dec 15, 2022 at 8:54=E2=80=AFAM Mattijs Korpershoek
> <mkorpershoek@baylibre.com> wrote:
>>
>> On Fri, Dec 09, 2022 at 09:26, Jason Andryuk <jandryuk@gmail.com> wrote:
>>
>> > xen kbdfront registers itself as being able to deliver *any* key since
>> > it doesn't know what keys the backend may produce.
>> >
>> > Unfortunately, the generated modalias gets too large and uevent creati=
on
>> > fails with -ENOMEM.
>> >
>> > This can lead to gdm not using the keyboard since there is no seat
>> > associated [1] and the debian installer crashing [2].
>> >
>> > Trim the ranges of key capabilities by removing some BTN_* ranges.
>> > While doing this, some neighboring undefined ranges are removed to trim
>> > it further.
>> >
>> > An upper limit of KEY_KBD_LCD_MENU5 is still too large.  Use an upper
>> > limit of KEY_BRIGHTNESS_MENU.
>> >
>> > This removes:
>> > BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
>> > Empty space 0x224..0x229
>> >
>> > Empty space 0x28a..0x28f
>> > KEY_MACRO1(0x290)..KEY_MACRO30(0x2ad)
>> > KEY_MACRO_RECORD_START          0x2b0
>> > KEY_MACRO_RECORD_STOP           0x2b1
>> > KEY_MACRO_PRESET_CYCLE          0x2b2
>> > KEY_MACRO_PRESET1(0x2b3)..KEY_MACRO_PRESET3(0xb5)
>> > Empty space 0x2b6..0x2b7
>> > KEY_KBD_LCD_MENU1(0x2b8)..KEY_KBD_LCD_MENU5(0x2bc)
>> > Empty space 0x2bd..0x2bf
>> > BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
>> > Empty space 0x2e8..0x2ff
>> >
>> > The modalias shrinks from 2082 to 1550 bytes.
>> >
>> > A chunk of keys need to be removed to allow the keyboard to be used.
>> > This may break some functionality, but the hope is these macro keys are
>> > uncommon and don't affect any users.
>> >
>> > [1] https://github.com/systemd/systemd/issues/22944
>> > [2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net/=
T/
>> >
>> > Cc: Phillip Susi <phill@thesusis.net>
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>>
>> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>
> Thank you, Mattjis.
>
> Any other thoughts?  Can this patch be applied?

That's not up to to decide, Dmitry might pick this up or give you a
review whenever he has time.

>
> Thanks,
> Jason

