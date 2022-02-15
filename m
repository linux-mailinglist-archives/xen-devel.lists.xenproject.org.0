Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C254B667C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 09:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272851.467829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtVH-0006m9-G6; Tue, 15 Feb 2022 08:48:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272851.467829; Tue, 15 Feb 2022 08:48:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtVH-0006jP-Ck; Tue, 15 Feb 2022 08:48:07 +0000
Received: by outflank-mailman (input) for mailman id 272851;
 Tue, 15 Feb 2022 08:48:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=svD9=S6=redhat.com=btissoir@srs-se1.protection.inumbo.net>)
 id 1nJtVF-0006jJ-Fb
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 08:48:05 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc0f5a1b-8e3b-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 09:48:03 +0100 (CET)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-Xv9UxChINSCUe8FjjZU_LQ-1; Tue, 15 Feb 2022 03:47:55 -0500
Received: by mail-pj1-f72.google.com with SMTP id
 hi22-20020a17090b30d600b001b8b33cf0efso1375518pjb.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Feb 2022 00:47:55 -0800 (PST)
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
X-Inumbo-ID: fc0f5a1b-8e3b-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644914882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+0eleqiUVBeAPaQGD2Q6ihFW/Z9JIAN0Kj0GeNRsLaA=;
	b=FtsXq3pqFP6C86hGYM3a5DcVL1YghIVkq6/nCkdEs0oom8VudsWWDHUNp4m0bIEN8g8Zq4
	3lS+yHAvHIrtMJKVP5E+HrK5MoXGaxcO+YatICi5t5SyehpRw+8WcIHocGyfmoBCW7IBbT
	+ATa1Lkw59C36iExAKDQ7DTPTnh5Uk0=
X-MC-Unique: Xv9UxChINSCUe8FjjZU_LQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+0eleqiUVBeAPaQGD2Q6ihFW/Z9JIAN0Kj0GeNRsLaA=;
        b=JvZuvLxFO6+NpMp8XCn+KRfn5gPCWoxKBn3l+HWAHSRmiQ2+cGM/bCEByrrpYIaExB
         mMF5lXCSoxRGfAlKxC0NzAhapRYzqLbNWzPz+c2rLxrc1rvP9AYmErk5436k47L6vzdg
         oj193TtSV9H9T0uI5/Y4FCGRW0SSqYhifSHq9+I+3AyxjcGjW0eK845D3YVJ70ekY2gP
         zWJhfEV/KziChJHQFfB1t9yHU+LmrVx0cDUqxw59y1eT77BTTk7NZD+0k8NSGsaGNe3g
         i9reUf/JVCevXWrCpXCpu/d1FJYMTgVbuqY0Y2Sdv+6MogPiXVkPQcOGJo7c85ex1Bq/
         uXig==
X-Gm-Message-State: AOAM533PGlfrQVhPRZBYfviZLtKK7dTBvolbvj6tKKNwT2vVKmefnbaG
	NSICKOD9tOi1LSbbFad8wMfY4wvRLutMhaLBBwMkdQQrqXB5InaykDPiI/rP9WlBrR63LX5oLGv
	uCLrVDJb5PSZZXDJVZCNbeh7oDYjxE0zmDv4N0tJR2MM=
X-Received: by 2002:a05:6a00:9a9:: with SMTP id u41mr3233715pfg.83.1644914874678;
        Tue, 15 Feb 2022 00:47:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1RXfHqGKUOwHiOd9TXDCmkRfLOApnv8+NP4UBdUIs2zHseVmQ3Z770IwhZgE/Zg1NSmgYeteqUdN9fAOzix8=
X-Received: by 2002:a05:6a00:9a9:: with SMTP id u41mr3233676pfg.83.1644914874405;
 Tue, 15 Feb 2022 00:47:54 -0800 (PST)
MIME-Version: 1.0
References: <1644890154-64915-1-git-send-email-wangqing@vivo.com> <1644890154-64915-6-git-send-email-wangqing@vivo.com>
In-Reply-To: <1644890154-64915-6-git-send-email-wangqing@vivo.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Tue, 15 Feb 2022 09:47:43 +0100
Message-ID: <CAO-hwJJK5yeW+K_vLpWV9t3TsEdk0xCO-ETxeJsXM2c117JzNw@mail.gmail.com>
Subject: Re: [PATCH V3 5/13] hid: use time_is_after_jiffies() instead of open
 coding it
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

On Tue, Feb 15, 2022 at 2:56 AM Qing Wang <wangqing@vivo.com> wrote:
>
> From: Wang Qing <wangqing@vivo.com>
>
> Use the helper function time_is_{before,after}_jiffies() to improve
> code readability.
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

FWIW, this one is
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Wang, is there any plan to take this series through the trivial tree
or should each maintainer take the matching patches?

Cheers,
Benjamin

> ---
>  drivers/hid/intel-ish-hid/ipc/ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
> index 8ccb246..15e1423
> --- a/drivers/hid/intel-ish-hid/ipc/ipc.c
> +++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
> @@ -578,7 +578,7 @@ static void _ish_sync_fw_clock(struct ishtp_device *dev)
>         static unsigned long    prev_sync;
>         uint64_t        usec;
>
> -       if (prev_sync && jiffies - prev_sync < 20 * HZ)
> +       if (prev_sync && time_is_after_jiffies(prev_sync + 20 * HZ))
>                 return;
>
>         prev_sync = jiffies;
> --
> 2.7.4
>


