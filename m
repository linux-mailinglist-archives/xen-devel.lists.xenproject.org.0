Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207F2FD294
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:29:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71447.127946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ETj-0005i4-Hl; Wed, 20 Jan 2021 14:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71447.127946; Wed, 20 Jan 2021 14:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2ETj-0005hf-EI; Wed, 20 Jan 2021 14:28:59 +0000
Received: by outflank-mailman (input) for mailman id 71447;
 Wed, 20 Jan 2021 14:28:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uQjw=GX=gmail.com=arthurborsboom@srs-us1.protection.inumbo.net>)
 id 1l2ETh-0005ha-UP
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:28:58 +0000
Received: from mail-yb1-xb34.google.com (unknown [2607:f8b0:4864:20::b34])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f728f80f-fd64-4774-8e5d-b8f2b26d3ea2;
 Wed, 20 Jan 2021 14:28:57 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id p185so8458453ybg.8
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 06:28:56 -0800 (PST)
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
X-Inumbo-ID: f728f80f-fd64-4774-8e5d-b8f2b26d3ea2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CzqrPjifLSTHMVm2CseEp0L4soBbAOYky+LNWDRochQ=;
        b=EKMpharTDwpUWY4pVgsSQFX8dcRcclXhTfHwwR0mXQdbxFfeNd/+prfHuZ9cI05Ev/
         gPkVcOSyjizZe4t/7LEgV14+dqDQeDpQeXnDbwKjSO3zG8JtnpZ73UQErB8s0ct1V36G
         IXc++10F9qsKQh/hXjo3I5ZUTuF0bUoEPFbfAd7rdzOOqqeamQCPtntIhCIfqnONVhU/
         gly8q12RIksYTGMAF65x5yv5lUeem3QOW7nzAn3KhKPAIBblGuHJZSkJd6UC9bQmeu6K
         11D0RZu8+VEtmKFy+zIEWakOAUL6jNktciyuh63b74V4lWxTPa/fXVv+gdjJpngO7LG0
         /ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CzqrPjifLSTHMVm2CseEp0L4soBbAOYky+LNWDRochQ=;
        b=SvxPS9lHO5nfp3EXJHLXXEGhnR9peKPsZAxv21VBoAaTzLdnpI3kYe0maSS6T1Kk54
         G2LIydhBhHhrsAO3R6UjTwrmL807HmPzeyOIeFPVJErWVR2voqYb8C6SzHCf3mzQxVJn
         Y+VkAskeKW+sR7oEUn+b5e14vwYpLtZMFgCSVPzKWPzV4IHFCmv9JoK+50XeWxR3SBjM
         GE6AwZPyIq2InE0K5Iq8enXpTTSHRFoMeJh9J3n1wUnnVlTwGeI7uIAPnUh7JjeADc8c
         Lf4CxjGGrBrps+USPzvoj5wCYxuFvixP10YKd8vI/4JA1kEyJzy60tjMCliM1cQ8CdIi
         nsxg==
X-Gm-Message-State: AOAM532vJQUAiHYVRK+kd19O97cQJLt+VhaEQdbB/nuVWaI4OqxLEv7g
	Djpv2DcXp8SbmakWC+ewjHIZz9DqPUw6GfHQKhY=
X-Google-Smtp-Source: ABdhPJyLsoNSlH3wnezZX5xFKwG8FPYcT3DetCwzzRFLGSFEENIpzEmiVIngcPvfxdycBZI/vH4XRmqtwmNy947Uv4g=
X-Received: by 2002:a25:9242:: with SMTP id e2mr12940443ybo.405.1611152936516;
 Wed, 20 Jan 2021 06:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20210119105727.95173-1-roger.pau@citrix.com>
In-Reply-To: <20210119105727.95173-1-roger.pau@citrix.com>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Wed, 20 Jan 2021 15:28:40 +0100
Message-ID: <CALUcmUnA+7bOtqg9VtaeXsrd079VKpHv+=tNX3LbhKZw7o1QTw@mail.gmail.com>
Subject: Re: [PATCH v2] xen-blkfront: allow discard-* nodes to be optional
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roger,

I have set up a test environment based on Linux 5.11.0-rc4.
The patch did not apply clean, so I copied/pasted the patch manually.

Without the patch the call trace (as reported) is visible in dmesg.
With the patch the call trace in dmesg is gone, but ... (there is
always a but) ...

Now the discard action returns the following.

[arthur@test-arch ~]$ sudo fstrim -v /
fstrim: /: the discard operation is not supported

It might be correct, but of course I was hoping the Xen VM guest would
pass on the discard request to the block device in the Xen VM host,
which is a disk partition.
Any suggestions?

(Resend due to the previous email being HTML instead of plain text).


On Tue, 19 Jan 2021 at 11:57, Roger Pau Monne <roger.pau@citrix.com> wrote:
>
> This is inline with the specification described in blkif.h:
>
>  * discard-granularity: should be set to the physical block size if
>    node is not present.
>  * discard-alignment, discard-secure: should be set to 0 if node not
>    present.
>
> This was detected as QEMU would only create the discard-granularity
> node but not discard-alignment, and thus the setup done in
> blkfront_setup_discard would fail.
>
> Fix blkfront_setup_discard to not fail on missing nodes, and also fix
> blkif_set_queue_limits to set the discard granularity to the physical
> block size if none is specified in xenbus.
>
> Fixes: ed30bf317c5ce ('xen-blkfront: Handle discard requests.')
> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-block@vger.kernel.org
> Cc: Arthur Borsboom <arthurborsboom@gmail.com>
> ---
> Changes since v2:
>  - Allow all discard-* nodes to be optional.
> ---
>  drivers/block/xen-blkfront.c | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 5265975b3fba..e1c6798889f4 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -945,7 +945,8 @@ static void blkif_set_queue_limits(struct blkfront_in=
fo *info)
>         if (info->feature_discard) {
>                 blk_queue_flag_set(QUEUE_FLAG_DISCARD, rq);
>                 blk_queue_max_discard_sectors(rq, get_capacity(gd));
> -               rq->limits.discard_granularity =3D info->discard_granular=
ity;
> +               rq->limits.discard_granularity =3D info->discard_granular=
ity ?:
> +                                                info->physical_sector_si=
ze;
>                 rq->limits.discard_alignment =3D info->discard_alignment;
>                 if (info->feature_secdiscard)
>                         blk_queue_flag_set(QUEUE_FLAG_SECERASE, rq);
> @@ -2179,19 +2180,12 @@ static void blkfront_closing(struct blkfront_info=
 *info)
>
>  static void blkfront_setup_discard(struct blkfront_info *info)
>  {
> -       int err;
> -       unsigned int discard_granularity;
> -       unsigned int discard_alignment;
> -
>         info->feature_discard =3D 1;
> -       err =3D xenbus_gather(XBT_NIL, info->xbdev->otherend,
> -               "discard-granularity", "%u", &discard_granularity,
> -               "discard-alignment", "%u", &discard_alignment,
> -               NULL);
> -       if (!err) {
> -               info->discard_granularity =3D discard_granularity;
> -               info->discard_alignment =3D discard_alignment;
> -       }
> +       info->discard_granularity =3D xenbus_read_unsigned(info->xbdev->o=
therend,
> +                                                        "discard-granula=
rity",
> +                                                        0);
> +       info->discard_alignment =3D xenbus_read_unsigned(info->xbdev->oth=
erend,
> +                                                      "discard-alignment=
", 0);
>         info->feature_secdiscard =3D
>                 !!xenbus_read_unsigned(info->xbdev->otherend, "discard-se=
cure",
>                                        0);
> --
> 2.29.2
>


--=20
Arthur Borsboom

