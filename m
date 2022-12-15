Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2AF64DC86
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 14:54:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463422.721591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ogu-0003R6-B2; Thu, 15 Dec 2022 13:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463422.721591; Thu, 15 Dec 2022 13:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5ogu-0003Ow-88; Thu, 15 Dec 2022 13:54:28 +0000
Received: by outflank-mailman (input) for mailman id 463422;
 Thu, 15 Dec 2022 13:54:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e6nk=4N=baylibre.com=mkorpershoek@srs-se1.protection.inumbo.net>)
 id 1p5ogs-0003Oq-K2
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 13:54:26 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb422604-7c7f-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 14:54:24 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1885703wms.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Dec 2022 05:54:24 -0800 (PST)
Received: from localhost ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 w23-20020a05600c099700b003d1de805de5sm5632729wmp.16.2022.12.15.05.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Dec 2022 05:54:23 -0800 (PST)
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
X-Inumbo-ID: fb422604-7c7f-11ed-8fd3-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OTgqMJ72hTY8DmgwqYKfCFn5Uuqu5CGzMqc6diHDoY=;
        b=uRvXA3sWZXvyIXrliOdhwK6HbALAYO1yJfHGmadQChubshMyKVuUMe1LaRyVZT/p6g
         vD2RwRQVrzQUTjhNkNbDq3VU6SmxfYEJc5woUO4YwpxrZJ+gvCjzWoRQLihCNmre8M6u
         I+Pfo122gPGAO3HQHXnpaJuuuPb7fFOB7TihTG6uEWHvXMtMN4wOs9Mmkg1vdU5oR26O
         fdcp+P/UxjHHsyZbh2Qww9sA6XIRYc6RKkpgI+ggCB0Xb3E0L8CjT5GXOiE7ERlWxpik
         LQ47MaHFDob5Pzq3mfuoa4BXA0TIB8xpBOMytHBvQmZBizGh0iUo+FQOdRXV3nvnAK19
         JAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9OTgqMJ72hTY8DmgwqYKfCFn5Uuqu5CGzMqc6diHDoY=;
        b=ba0JTQOjEc/ZbGrd1JsxUIIR8dmcB4wmJtl3L7l4A0kCiN/xwuyCzgTZZ6wzjSnMvm
         2IhdWGCHj978RllDTMnQ69locCk7QEmrBsmdZOlplCAhyYXqsN7xYRBZvKhP0UW4hxZE
         Ghj2RhSjFAkhEyfhLZMFlpo2zTAKyV9bJ00ce1yuElddzQgiKMKgclX/nyts03SASM4s
         fdOYrSJanROLeB6dTIUIAT0+yi7c9WC76LjzvsrWMQCtkZHWPdJ0rE/mm1qZQxfDvBcr
         YB4yG5QadQpInX5G33PFZI6lIBc71x5HkZbdY+BzgB1VnoRdCHkOMYGgK2igWUS5f0/1
         z94A==
X-Gm-Message-State: ANoB5pmldjv+dNlit4USupAP+VUbOjlaDVilSNBHbG/POBQaiImZASv+
	R1y0TItMkmR+h6YV54TcwjTeZg==
X-Google-Smtp-Source: AA0mqf7JVIcTPYdeX+DwIlk55rlpMShtycDHmgZrVZxgWpoACaOHyPw1OWw+dIhhtCWJetqZGFJ0Vg==
X-Received: by 2002:a05:600c:3c92:b0:3cf:a851:d2f2 with SMTP id bg18-20020a05600c3c9200b003cfa851d2f2mr22167012wmb.21.1671112463881;
        Thu, 15 Dec 2022 05:54:23 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Jason Andryuk <jandryuk@gmail.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Phillip Susi <phill@thesusis.net>, stable@vger.kernel.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: xen-kbdfront - drop keys to shrink modalias
In-Reply-To: <20221209142615.33574-1-jandryuk@gmail.com>
References: <20221209142615.33574-1-jandryuk@gmail.com>
Date: Thu, 15 Dec 2022 14:54:22 +0100
Message-ID: <87359gkc1d.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Dec 09, 2022 at 09:26, Jason Andryuk <jandryuk@gmail.com> wrote:

> xen kbdfront registers itself as being able to deliver *any* key since
> it doesn't know what keys the backend may produce.
>
> Unfortunately, the generated modalias gets too large and uevent creation
> fails with -ENOMEM.
>
> This can lead to gdm not using the keyboard since there is no seat
> associated [1] and the debian installer crashing [2].
>
> Trim the ranges of key capabilities by removing some BTN_* ranges.
> While doing this, some neighboring undefined ranges are removed to trim
> it further.
>
> An upper limit of KEY_KBD_LCD_MENU5 is still too large.  Use an upper
> limit of KEY_BRIGHTNESS_MENU.
>
> This removes:
> BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
> Empty space 0x224..0x229
>
> Empty space 0x28a..0x28f
> KEY_MACRO1(0x290)..KEY_MACRO30(0x2ad)
> KEY_MACRO_RECORD_START          0x2b0
> KEY_MACRO_RECORD_STOP           0x2b1
> KEY_MACRO_PRESET_CYCLE          0x2b2
> KEY_MACRO_PRESET1(0x2b3)..KEY_MACRO_PRESET3(0xb5)
> Empty space 0x2b6..0x2b7
> KEY_KBD_LCD_MENU1(0x2b8)..KEY_KBD_LCD_MENU5(0x2bc)
> Empty space 0x2bd..0x2bf
> BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
> Empty space 0x2e8..0x2ff
>
> The modalias shrinks from 2082 to 1550 bytes.
>
> A chunk of keys need to be removed to allow the keyboard to be used.
> This may break some functionality, but the hope is these macro keys are
> uncommon and don't affect any users.
>
> [1] https://github.com/systemd/systemd/issues/22944
> [2] https://lore.kernel.org/xen-devel/87o8dw52jc.fsf@vps.thesusis.net/T/
>
> Cc: Phillip Susi <phill@thesusis.net>
> Cc: stable@vger.kernel.org
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/xen-kbdfront.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> v2:
> Remove more keys: v1 didn't remove enough and modalias was still broken.
>
> diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
> index 8d8ebdc2039b..4ecb579df748 100644
> --- a/drivers/input/misc/xen-kbdfront.c
> +++ b/drivers/input/misc/xen-kbdfront.c
> @@ -256,7 +256,14 @@ static int xenkbd_probe(struct xenbus_device *dev,
>  		__set_bit(EV_KEY, kbd->evbit);
>  		for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
>  			__set_bit(i, kbd->keybit);
> -		for (i = KEY_OK; i < KEY_MAX; i++)
> +		/* In theory we want to go KEY_OK..KEY_MAX, but that grows the
> +		 * modalias line too long.  There is a gap of buttons from
> +		 * BTN_DPAD_UP..BTN_DPAD_RIGHT and KEY_ALS_TOGGLE is the next
> +		 * defined. Then continue up to KEY_BRIGHTNESS_MENU as an upper
> +		 * limit. */
> +		for (i = KEY_OK; i < BTN_DPAD_UP; i++)
> +			__set_bit(i, kbd->keybit);
> +		for (i = KEY_ALS_TOGGLE; i <= KEY_BRIGHTNESS_MENU; i++)
>  			__set_bit(i, kbd->keybit);
>  
>  		ret = input_register_device(kbd);
> -- 
> 2.38.1

