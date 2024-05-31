Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA058D5DD9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733500.1139792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyI8-0007fJ-JG; Fri, 31 May 2024 09:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733500.1139792; Fri, 31 May 2024 09:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyI8-0007d1-GT; Fri, 31 May 2024 09:11:16 +0000
Received: by outflank-mailman (input) for mailman id 733500;
 Fri, 31 May 2024 09:11:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOju=NC=gmail.com=idryomov@srs-se1.protection.inumbo.net>)
 id 1sCyI7-00073w-Ar
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:11:15 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba31fc09-1f2d-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 11:11:13 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6f8d0a1e500so1357430a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:11:13 -0700 (PDT)
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
X-Inumbo-ID: ba31fc09-1f2d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146672; x=1717751472; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHySJ52Pl0hABImbEf8CzUryCpcO6Vzdug5aWyPJAWM=;
        b=MVbCRikAHGVs7UB3vplpRi6p55OJ4HfwYY+ATDZQKDXUj+66DJHLlspJI86wjJFFrs
         v6mVgT4tPih85ggRVTMSflTnQqnLkxrTUnKVRtaS7quxPJQ3ZdhWj1Lj3QxHSqgnklGy
         YkanKcD+05weuzE3y+Kfo4RFWorMD0Wo5nCSkXwsCuKYst9xVCpOwAbHtPEiOwHZXMSK
         WfSEMxYGEmNHORa+KjkSA5YtK+D4/i10qgedJYX8qGHSVqqxMrQOfCs7zcNtvXHwux8D
         7hPWzkCOX/wirv+UdOED87Hlte1PZOFdOqXubC9MgSj7uf0uzhKgw4FvJs/TtlwHGRIX
         XZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146672; x=1717751472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHySJ52Pl0hABImbEf8CzUryCpcO6Vzdug5aWyPJAWM=;
        b=toe+lYLWN1i21H2dDNK0xT1Vl2gSGQBVbyZ+mYc+vKm67kilgUQ2muHtRdjUv8RWj8
         D7Waczu4eeBOAA1w8vpJFQAvpyVfdWve85obvkVHzvaztK0AE9oWeccIkKlSWuMqF3CQ
         W3b6rF1esuRfJipujWGCZuIZhkTEvnJJwFtX5jc+6dtytsTc1X8G0PuMMLsEUxIOyy+Y
         R+csfJ4SaWxARBkUwNppEq020eZToHo8Q9tnaXp2aiEUCFWwE039z/GpLfezYQDwFEbx
         XnMjEyzgzO85JMbnSj4fL5vsYtpJeG+FGactkW3sZxAhk3toKaQFq+/wZhIoVELMrzE1
         y9YA==
X-Forwarded-Encrypted: i=1; AJvYcCU2w7EPDXoI6r4QdsrLeaijZJNnAUNFIJ5AK/E1bd2mVYA2I/SAJZk58WvqqA29E5fdoviJHE/MjiVpBJJgUdcGWuWOhsgiAlGI3frrDjQ=
X-Gm-Message-State: AOJu0YxjjwpqunxzkN0xfCIs/7q/UwkqcgbEpYlrDa1Pz7wJc8MA3kL5
	WmVv98McIWtXUC5ZJwo1gCVIOSqUUgP693KNOTW4G733GbwfZFlUl7cS6/FsgS4kYZ0xbpx1Km3
	Qk/DqoxgqhwilktVAFPIIneyKIEU=
X-Google-Smtp-Source: AGHT+IGvsAs1mcJwvgWnNqWcEhu7b6x8mgHTIAZ0GzBV17r0EcNcgsUewUXES03iA8vPcRMr9oo8aonYpNodLH6h808=
X-Received: by 2002:a05:6871:339a:b0:250:75cd:34f2 with SMTP id
 586e51a60fabf-2508b99ababmr1494585fac.22.1717146672346; Fri, 31 May 2024
 02:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240531074837.1648501-1-hch@lst.de> <20240531074837.1648501-5-hch@lst.de>
In-Reply-To: <20240531074837.1648501-5-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Fri, 31 May 2024 11:11:00 +0200
Message-ID: <CAOi1vP-+j-RHLmnDLpsZREnYb_f7QGGhRC9YOgctsFNuE7yM3Q@mail.gmail.com>
Subject: Re: [PATCH 04/14] block: take io_opt and io_min into account for max_sectors
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Josef Bacik <josef@toxicpanda.com>, 
	Dongsheng Yang <dongsheng.yang@easystack.cn>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	nbd@other.debian.org, ceph-devel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, 
	Bart Van Assche <bvanassche@acm.org>, Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 9:48=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> The soft max_sectors limit is normally capped by the hardware limits and
> an arbitrary upper limit enforced by the kernel, but can be modified by
> the user.  A few drivers want to increase this limit (nbd, rbd) or
> adjust it up or down based on hardware capabilities (sd).
>
> Change blk_validate_limits to default max_sectors to the optimal I/O
> size, or upgrade it to the preferred minimal I/O size if that is
> larger than the kernel default if no optimal I/O size is provided based
> on the logic in the SD driver.
>
> This keeps the existing kernel default for drivers that do not provide
> an io_opt or very big io_min value, but picks a much more useful
> default for those who provide these hints, and allows to remove the
> hacks to set the user max_sectors limit in nbd, rbd and sd.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  block/blk-settings.c |  7 +++++++
>  drivers/block/nbd.c  |  2 +-

For rbd

>  drivers/block/rbd.c  |  1 -

Acked-by: Ilya Dryomov <idryomov@gmail.com>

Thanks,

                Ilya

