Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E384B6686
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 09:48:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272855.467839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtVr-0007Hr-OT; Tue, 15 Feb 2022 08:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272855.467839; Tue, 15 Feb 2022 08:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtVr-0007Ev-LB; Tue, 15 Feb 2022 08:48:43 +0000
Received: by outflank-mailman (input) for mailman id 272855;
 Tue, 15 Feb 2022 08:48:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=svD9=S6=redhat.com=btissoir@srs-se1.protection.inumbo.net>)
 id 1nJtVq-0006jJ-JW
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 08:48:42 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 124e367b-8e3c-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 09:48:41 +0100 (CET)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-ldGX96ePNJqNM7dk4ItkEw-1; Tue, 15 Feb 2022 03:48:36 -0500
Received: by mail-pj1-f71.google.com with SMTP id
 fh23-20020a17090b035700b001b9a9045bceso1358641pjb.8
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 00:48:36 -0800 (PST)
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
X-Inumbo-ID: 124e367b-8e3c-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644914919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cAghCw6nMXIP8DbPC2ZTmMjVdzgtfdV0Q4rDuIo9NkY=;
	b=DSqmbLSAwCAJVngxiscPK3AI83fBvtKyU1g0AilU1+5l1HWqSms+MFHSUGa0sZO/SfGwjz
	MTARKord6OnXu1SikYooOuoDXp45WeVwP+NSyH7Y/dELylzZWdS76PxZnMHKfa6/B5mtm0
	Kk9NNo2FFnT7z/6lrYWi3bCEQd9gsF4=
X-MC-Unique: ldGX96ePNJqNM7dk4ItkEw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cAghCw6nMXIP8DbPC2ZTmMjVdzgtfdV0Q4rDuIo9NkY=;
        b=WCWacFNw/pagzl4A2W37lrdS2tBc/clMPTDFakB84VXYJX/JucOa9MzMVXqPvAB0Au
         mAlETX1BkYqnfzKK6cevLzKHWev/xDb3VG6C8OtUgXZ/BWb0pqNRRGsWHeoff8LlFYJl
         /e2+zUjqAsU9VDynxur4HtRswzeKZXh1XXch+8P9a7+QDOHyjvUXcBV/A2tg1vR1o8yh
         S1qHULWUu/Dh2Zo6LAPhuxjfToi4eL6dBs4Z/qn99uxqVSpwm7nRkRMHiQFIhoa9mGML
         CcIfaFW7BFwP94SSlPYBtqDRIamx0veyDYTcvxIhwDSQO8iLz9YwtFRzUncbsYAKjixS
         NCfA==
X-Gm-Message-State: AOAM530fTKAIttB/SediBRmH3KBWEaI0+WZfK7PWN6hlU21E/btsMfdG
	whKXAdkP2yiKGjEpXacnFR9qb2UbtV4dOkIuEK1wn2shmHz1C2pjUpopofubFQByBlz7kHmBqWj
	HBfdvZyhl6+ts26wzCbYvOVgQgCCVgizhXKQk/AX8RTE=
X-Received: by 2002:a63:2bc5:: with SMTP id r188mr2644616pgr.363.1644914915615;
        Tue, 15 Feb 2022 00:48:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNykZwzg4bf+5n8EbXDkY7JRsdOTnLNDPgNJlOcTDejNQ8sWs8DiYpM4W3ztHYleOanIdgFMhO3Rj6Rj63QAs=
X-Received: by 2002:a63:2bc5:: with SMTP id r188mr2644575pgr.363.1644914915393;
 Tue, 15 Feb 2022 00:48:35 -0800 (PST)
MIME-Version: 1.0
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com> <1644890154-64915-7-git-send-email-wangqing@vivo.com>
In-Reply-To: <1644890154-64915-7-git-send-email-wangqing@vivo.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 15 Feb 2022 09:48:24 +0100
Message-ID: <CAO-hwJLwomyHyjza8x3cEhR97HkK7Z7yPWVXwA4-1jmM=WKqeQ@mail.gmail.com>
Subject: Re: [PATCH V3 6/13] input: serio: use time_is_before_jiffies()
 instead of open coding it
To: Qing Wang <wangqing@vivo.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jens Axboe <axboe@kernel.dk>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alasdair Kergon <agk@redhat.com>, 
	Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, xen-devel@lists.xenproject.org, 
	linux-block@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, 
	linux-clk@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	"open list:HID CORE LAYER" <linux-input@vger.kernel.org>, linux-media@vger.kernel.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=btissoir@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 15, 2022 at 2:57 AM Qing Wang <wangqing@vivo.com> wrote:
>
> From: Wang Qing <wangqing@vivo.com>
>
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>  drivers/input/serio/ps2-gpio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
> index 8970b49..7834296
> --- a/drivers/input/serio/ps2-gpio.c
> +++ b/drivers/input/serio/ps2-gpio.c
> @@ -136,7 +136,7 @@ static irqreturn_t ps2_gpio_irq_rx(struct ps2_gpio_data *drvdata)
>         if (old_jiffies == 0)
>                 old_jiffies = jiffies;
>
> -       if ((jiffies - old_jiffies) > usecs_to_jiffies(100)) {
> +       if (time_is_before_jiffies(old_jiffies + usecs_to_jiffies(100))) {
>                 dev_err(drvdata->dev,
>                         "RX: timeout, probably we missed an interrupt\n");
>                 goto err;
> @@ -237,7 +237,7 @@ static irqreturn_t ps2_gpio_irq_tx(struct ps2_gpio_data *drvdata)
>         if (old_jiffies == 0)
>                 old_jiffies = jiffies;
>
> -       if ((jiffies - old_jiffies) > usecs_to_jiffies(100)) {
> +       if (time_is_before_jiffies(old_jiffies + usecs_to_jiffies(100))) {
>                 dev_err(drvdata->dev,
>                         "TX: timeout, probably we missed an interrupt\n");
>                 goto err;
> --
> 2.7.4
>


