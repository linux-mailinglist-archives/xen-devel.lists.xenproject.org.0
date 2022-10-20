Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED323605AEC
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 11:16:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426291.674663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olReo-00069e-Cy; Thu, 20 Oct 2022 09:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426291.674663; Thu, 20 Oct 2022 09:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olReo-00067P-A5; Thu, 20 Oct 2022 09:16:06 +0000
Received: by outflank-mailman (input) for mailman id 426291;
 Thu, 20 Oct 2022 08:31:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=374O=2V=baylibre.com=mkorpershoek@srs-se1.protection.inumbo.net>)
 id 1olQxl-0001Av-N1
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 08:31:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c60af8a-5051-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 10:31:36 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 c7-20020a05600c0ac700b003c6cad86f38so1760988wmr.2
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 01:31:36 -0700 (PDT)
Received: from localhost ([82.66.159.240]) by smtp.gmail.com with ESMTPSA id
 j28-20020a5d6e5c000000b0022cd27bc8c1sm19246814wrz.9.2022.10.20.01.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 01:31:35 -0700 (PDT)
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
X-Inumbo-ID: 9c60af8a-5051-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/hCpDbVRoc+q/9gSPADK7PRRzF3tzQ7+LRZVH7HnjY8=;
        b=ZOwrGT8YlcyuCniv3v2gcTGYsyOsF1bRQP+5/n5cJtEfVLBTSwrkPRnwTHYdXH5AS4
         GpbQhf/EJDFhESbVNKeMcOA4AP/2TpsnqAwRkh1zuw8DPcNFNt3I1DKvWc8OhxL47HyO
         94eUlug5J2DmCBN69I9GYPdf+CiQJEmygXdjpETIGeowjOre0R79sv7c1Q9RQ0aeSgjA
         mt/1gthUycDV4pJjcXRfNC8PgwaWu2zZ3S9r53z1oORZ2tRITN3YHmhzLqhKj86MHQ3y
         7h/s9aWZfmFMX5F4eVOhSoMD5mrH13LUCX+GXuMWABU1wXjzGcvvXu+zda+XvTRoiu9v
         naog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hCpDbVRoc+q/9gSPADK7PRRzF3tzQ7+LRZVH7HnjY8=;
        b=n6hiaJbyr8/DJPy9msjR/IIHOkLszMbgLUgBQ3/eOVHDF8YVbPhDSRfM0X/iTqolth
         72ZoutRz332u51Ae7x4tnyNptsf7GGuSfhBdJS9JZC+FLCCTiaV9A5zJnUGTDd7juLXI
         lBv30vX1AQiU+53icqrAovEXVA8F/jDHRNsBPDD9ptwELx4IR08UL/FsGzcAmOur5sgk
         JtAYpxdtAn8Z6d0mKcB4zH90jB6pGDAENAcWq0I7l6oKRs/NT0fKnvUZWQ8LlzXsWlJx
         JvaZYT646k8YUEkUmqo3fsXhhE6ZV4aopYPZ9WkAA8S7Uf023li1AVWaC2VYEy5RCe5/
         7/TQ==
X-Gm-Message-State: ACrzQf3k0F+dK7QqevNq2BLXT3sEwpdDPcindXjZW2RJvk15CzgVUB8m
	C0MWT4P2sbRqq/9V+AyhRSTSrQ==
X-Google-Smtp-Source: AMsMyM6iQl1yh/y0HEH9uS1CZVI3KrJmHjy5uCOsdpFu/YF84jxhh6xVVSE8CZ2CG6O57/gkvjT9Lg==
X-Received: by 2002:a05:600c:a08:b0:3bc:eb4c:b90 with SMTP id z8-20020a05600c0a0800b003bceb4c0b90mr8488441wmp.184.1666254696083;
        Thu, 20 Oct 2022 01:31:36 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Jason Andryuk <jandryuk@gmail.com>, linux-kernel@vger.kernel.org
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Phillip Susi <phill@thesusis.net>, stable@vger.kernel.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xen-kbdfront - drop keys to shrink modalias
In-Reply-To: <20221019201458.21803-1-jandryuk@gmail.com>
References: <20221019201458.21803-1-jandryuk@gmail.com>
Date: Thu, 20 Oct 2022 10:31:34 +0200
Message-ID: <87zgdq99qx.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Oct 19, 2022 at 16:14, Jason Andryuk <jandryuk@gmail.com> wrote:

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
> This removes:
> BTN_DPAD_UP(0x220)..BTN_DPAD_RIGHT(0x223)
> Empty space 0x224..0x229
>
> Emtpy space 0x2bd..0x2bf
> BTN_TRIGGER_HAPPY(0x2c0)..BTN_TRIGGER_HAPPY40(0x2e7)
> Empty space 0x2e8..0x2ff
>
> The modalias shrinks from 2082 to 1754 bytes.
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
> diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
> index 8d8ebdc2039b..23f37211be78 100644
> --- a/drivers/input/misc/xen-kbdfront.c
> +++ b/drivers/input/misc/xen-kbdfront.c
> @@ -256,7 +256,14 @@ static int xenkbd_probe(struct xenbus_device *dev,
>  		__set_bit(EV_KEY, kbd->evbit);
>  		for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
>  			__set_bit(i, kbd->keybit);
> -		for (i = KEY_OK; i < KEY_MAX; i++)
> +		/* In theory we want to go KEY_OK..KEY_MAX, but that grows the
> +		 * modalias line too long.  KEY_KBD_LCD_MENU5 is the last
> +		 * defined non-button key. There is a gap of buttons from
> +		 * BTN_DPAD_UP..BTN_DPAD_RIGHT and KEY_ALS_TOGGLE is the next
> +		 * defined. */
> +		for (i = KEY_OK; i < BTN_DPAD_UP; i++)
> +			__set_bit(i, kbd->keybit);
> +		for (i = KEY_ALS_TOGGLE; i <= KEY_KBD_LCD_MENU5; i++)
>  			__set_bit(i, kbd->keybit);
>  
>  		ret = input_register_device(kbd);
> -- 
> 2.37.3

