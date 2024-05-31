Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C4B8D5DBE
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733485.1139762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyFz-0004Vr-Qv; Fri, 31 May 2024 09:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733485.1139762; Fri, 31 May 2024 09:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyFz-0004Sy-Nk; Fri, 31 May 2024 09:09:03 +0000
Received: by outflank-mailman (input) for mailman id 733485;
 Fri, 31 May 2024 09:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOju=NC=gmail.com=idryomov@srs-se1.protection.inumbo.net>)
 id 1sCyFy-0004Eb-QW
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:09:02 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b8bc4cd-1f2d-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 11:09:02 +0200 (CEST)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-25076dde95eso532008fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:09:02 -0700 (PDT)
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
X-Inumbo-ID: 6b8bc4cd-1f2d-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146540; x=1717751340; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7TiTdx/nEWXXgHHbHN78B+YsjlKDnX0w9LWVG0G2x4=;
        b=Olb7esvQJJdgWc1w+jurUljBIZwYghFM0dXmiSAiXDrmpFc1FNFW6+rsNIV5P3G38U
         3tIwJ3u4jm6VnzUORWtA2VthKxsHtYsNlj+lgwtvIAxZ+99asQ8IuexrYTCLPHnoBcVF
         6uGy7jtE9qblLc8Xwu3JCG7s1kNrHkQcaTwc39ksp0eVPgsx7+mKxi2P9gYy7m3+pv8t
         /o3mVXmzWQk6i/dOsd+yatAleBuLkzJvN/oRHkX/AiGgdYjmoen1CTlqAWKRI0qjBSkr
         70SHcL4ZhDsTgmdpO+ZMG/xHf6/YsS4S9GxMYrfyVCnRzB/O0Wlxo8zjHy4W5iG4ZQXS
         9otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146540; x=1717751340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7TiTdx/nEWXXgHHbHN78B+YsjlKDnX0w9LWVG0G2x4=;
        b=cIXHJ4W2y4Gl8eDil0eCqFO8MpUNoe7+k9NldqBA2Q1G00e9yp75m+3Dz62zCdulme
         G/nqkO4Sgyi9tgQLAJlhlsCcqu0M9UpFu/EMuYawetdZedgYtyJAMij8/yR4OK/kJkut
         vqZ11eD/VkMDZx8gnnZHswBEibdO6yJB4EEzP+/aWavi/rfifZxRITYYHhWvsUOHuVwL
         57KAOZ9JDnxFVxZcHbEc6J3JdKnIZ7uJgPLlo1dK0ekWoCumVR5/Fv+Dt2FqCsjJaHg+
         xL4zLB7qhm4MzwJwJzGemS0FbWm3FV9+bBt5fdNChqagysDMGEZXOLKJLaHmq+R+ft0H
         avuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsAYQYKMaVcI+XmCSjV5/wzz7QWD7uTje/gsTqIHI4XUq1ZFZYYIWRtz9nbtltmlJJf+gGDTqL09sAoedqBaIgWdaQx92pkpqLaUf906M=
X-Gm-Message-State: AOJu0Yx6HADRbyU9ZvHsdUL7FSmc5n+2oITbcrUSSzI6ZkxbiMUe0LHZ
	xZ50vSTgRtdGz32Yo1Mz169TPCVpSyhAjyq10s+lAbvtOHDdQ85fQYD+L/lR1f1wJfLMrz1MLUi
	6wuBtYCWfbV+UCJI+sbPiOfhFmSs=
X-Google-Smtp-Source: AGHT+IHoKiJiwn0RUfGlBR1LOXIQjJEAP/TieA174CPldpRPuDqgZrspO+vxp9UsllxKnQz9RUjusbGg9aknaFlS5Ec=
X-Received: by 2002:a05:6870:9346:b0:250:6422:86a with SMTP id
 586e51a60fabf-25065b70997mr1985845fac.10.1717146540364; Fri, 31 May 2024
 02:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240531074837.1648501-1-hch@lst.de> <20240531074837.1648501-4-hch@lst.de>
In-Reply-To: <20240531074837.1648501-4-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 31 May 2024 11:08:48 +0200
Message-ID: <CAOi1vP_mY-a7aiWod-eVz8xuhGz4mHBBoZZgr2FoxS5wVUym3w@mail.gmail.com>
Subject: Re: [PATCH 03/14] rbd: increase io_opt again
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	Dongsheng Yang <dongsheng.yang@easystack.cn>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 9:48=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Commit 16d80c54ad42 ("rbd: set io_min, io_opt and discard_granularity to
> alloc_size") lowered the io_opt size for rbd from objset_bytes which is
> 4MB for typical setup to alloc_size which is typically 64KB.
>
> The commit mostly talks about discard behavior and does mention io_min
> in passing.  Reducing io_opt means reducing the readahead size, which
> seems counter-intuitive given that rbd currently abuses the user
> max_sectors setting to actually increase the I/O size.  Switch back
> to the old setting to allow larger reads (the readahead size despite it's
> name actually limits the size of any buffered read) and to prepare
> for using io_opt in the max_sectors calculation and getting drivers out
> of the business of overriding the max_user_sectors value.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index 26ff5cd2bf0abc..46dc487ccc17eb 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -4955,8 +4955,8 @@ static int rbd_init_disk(struct rbd_device *rbd_dev=
)
>         struct queue_limits lim =3D {
>                 .max_hw_sectors         =3D objset_bytes >> SECTOR_SHIFT,
>                 .max_user_sectors       =3D objset_bytes >> SECTOR_SHIFT,
> +               .io_opt                 =3D objset_bytes,
>                 .io_min                 =3D rbd_dev->opts->alloc_size,
> -               .io_opt                 =3D rbd_dev->opts->alloc_size,
>                 .max_segments           =3D USHRT_MAX,
>                 .max_segment_size       =3D UINT_MAX,
>         };
> --
> 2.43.0
>

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

