Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9566375C30
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 22:28:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123705.233365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lekaF-0006lt-7x; Thu, 06 May 2021 20:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123705.233365; Thu, 06 May 2021 20:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lekaF-0006id-4u; Thu, 06 May 2021 20:26:55 +0000
Received: by outflank-mailman (input) for mailman id 123705;
 Thu, 06 May 2021 20:26:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aTiY=KB=gmail.com=dmitry.torokhov@srs-us1.protection.inumbo.net>)
 id 1lekaD-0006iX-UG
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 20:26:54 +0000
Received: from mail-pg1-x535.google.com (unknown [2607:f8b0:4864:20::535])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63008893-2cb0-4786-a232-5334353f20ac;
 Thu, 06 May 2021 20:26:53 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id p12so5518648pgj.10
 for <xen-devel@lists.xenproject.org>; Thu, 06 May 2021 13:26:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:5228:3770:a497:742])
 by smtp.gmail.com with ESMTPSA id b2sm10735266pji.28.2021.05.06.13.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 13:26:51 -0700 (PDT)
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
X-Inumbo-ID: 63008893-2cb0-4786-a232-5334353f20ac
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6PS4r5ihm0TuTFmfAJ2NxYhkHmZSjT5J6bjZKfQ3GX4=;
        b=lJX8V3dsO+IedLBuCkDF8k0tvFt6ddIGfxv2EHMfH8XYiqjCm/tMVd46N+tDLqBBSO
         uVwM8SLavveoTp/5so3jz4RDXzHuvGavDxV00ZmfzespKFCvm7A8QAIRhm2luq+CX5YD
         kR1HyIpgjjKOLXFZmGd0w5iqP8MIdvhkwIGKxjYYOqrvgrYMae/AQ20xUC1mQdtH/whN
         17rHE5ybJVP66G87wFYxfYtX2/5PjYKbGbENgp5siKPyBNOFZloGfur4kjXXZpf0OHPl
         MZBgcfdxgf1SsT4LmajECuDWxLLhz/c2DGind/Orbv0so7nK3vSrriqZtGCvizuvY91N
         6rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6PS4r5ihm0TuTFmfAJ2NxYhkHmZSjT5J6bjZKfQ3GX4=;
        b=kENfDmgjeHVcP8LdZG1mn6rIar9TJRAAz8fE7Y++hnEzFe64PbV+abLDPpFYziKHvT
         ao2yPOVP0qi4DZE4xkm6XbS6zcG7KBqmFOduMZe+1630ZZ9Jl3vBK2fi7B2uTfPfS9xJ
         2EFXM+dVG+Y5/OWvzx93WWelplSLd4MMpKmj5e4/YQe8+PnSvrq1UJEVIw7Op/iB+tX9
         8UXNAl6tgKerGHUdg294OyOzeUfrMDUF6DfV37Jf8XDY0HXlwmsZOUqsi+DBpVJ70EOp
         9H0h/YFhGWHoZBTt4KPxyIUNngh1zya8mCd29fWfrPfm3C0pEw853lvo4z7lP6zW1qgV
         tyIQ==
X-Gm-Message-State: AOAM531FM4jurKoc9keupwjc8vvW2wCuZhPiH2n6SHI7L26uZN79Zxma
	WG0NCzRJwK/xwMsngAAXRM8=
X-Google-Smtp-Source: ABdhPJwyOd9a/hNWBoTSoQpiUH3+3o7sEIxqT9F2v1nZL3DFH01uXnAbmQ64QQV0BapasH5VDSAa2w==
X-Received: by 2002:a62:1517:0:b029:28e:a871:ffb2 with SMTP id 23-20020a6215170000b029028ea871ffb2mr6632315pfv.19.1620332812328;
        Thu, 06 May 2021 13:26:52 -0700 (PDT)
Date: Thu, 6 May 2021 13:26:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Phillip Susi <phill@thesusis.net>
Cc: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Xen Keyboard: don't advertise every key known to man
Message-ID: <YJRRCEJrQOwVymdP@google.com>
References: <87o8dw52jc.fsf@vps.thesusis.net>
 <20210506143654.17924-1-phill@thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506143654.17924-1-phill@thesusis.net>

On Thu, May 06, 2021 at 02:36:54PM +0000, Phillip Susi wrote:
> For reasons I still don't understand, the input subsystem allows
> input devices to advertise what keys they have, and adds this
> information to the modalias for the device.  The Xen Virtual
> Keyboard was advertising every known key, which resulted in a
> modalias string over 2 KiB in length, which caused uevents to
> fail with -ENOMEM ( when trying to add the modalias to the env ).
> Remove this advertisement.
> ---
>  drivers/input/misc/xen-kbdfront.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
> index 4ff5cd2a6d8d..d4bd558afda9 100644
> --- a/drivers/input/misc/xen-kbdfront.c
> +++ b/drivers/input/misc/xen-kbdfront.c
> @@ -254,11 +254,6 @@ static int xenkbd_probe(struct xenbus_device *dev,
>  		kbd->id.product = 0xffff;
>  
>  		__set_bit(EV_KEY, kbd->evbit);
> -		for (i = KEY_ESC; i < KEY_UNKNOWN; i++)
> -			__set_bit(i, kbd->keybit);
> -		for (i = KEY_OK; i < KEY_MAX; i++)
> -			__set_bit(i, kbd->keybit);
> -

By doing this you are stopping delivery of all key events from this
device.

Thanks.

-- 
Dmitry

