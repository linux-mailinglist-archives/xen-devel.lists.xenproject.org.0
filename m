Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB4085BC4F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 13:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683516.1063073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcPL7-00084W-Lx; Tue, 20 Feb 2024 12:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683516.1063073; Tue, 20 Feb 2024 12:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcPL7-00081m-IQ; Tue, 20 Feb 2024 12:35:13 +0000
Received: by outflank-mailman (input) for mailman id 683516;
 Tue, 20 Feb 2024 12:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qAG8=J5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rcPL5-00080D-I3
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 12:35:11 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c415af0-cfec-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 13:35:10 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512bd533be0so2150617e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 04:35:10 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 c14-20020ac8110e000000b0042be1092915sm3362420qtj.10.2024.02.20.04.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 04:35:09 -0800 (PST)
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
X-Inumbo-ID: 7c415af0-cfec-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708432509; x=1709037309; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SqpBys1GZlBb1wU68c/Qfm1otX0q/1l9PzfK4bmChbs=;
        b=S7GR/lY162ErsTLEN1yiT1+4ENZ3QpEmsgduzFHdIv1LvjEZMmw61ltOrKsyiYlSnc
         YNtK6r8nzHB/hnNJmOpvGAnGUcQE+lharbN3ExAbezHXt2B6eetjVoOQNVmOQH72NVv0
         MlJ5CAjoAFexjVayGCvhL4rWVnKWfvoWP0w1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708432509; x=1709037309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SqpBys1GZlBb1wU68c/Qfm1otX0q/1l9PzfK4bmChbs=;
        b=vxVb3ESsx97JYKQO8tT6aFaNOONDlfm/BwcdoFmPpifkcnt+r/IVy2BbH3xT4z7gJX
         3Q4JHyq2M1C+M/mUcQVKTLb+ebYPtFQAm2CMNm8Bi4AMDLHD/JlxZ8MCylDpoaFDT1/m
         bVGSLHFk2c5o3DU2crHmaZpHnrrp3RZsRFJLbi20CK3RpdwGhcYtO/tpsrvnb3TAYAuk
         gg3PNH73feqq38qn4Zdz8dA0oOiosc+9q/QaWaDdEsg3DgsrDHWktX8U6waGexdmXyJj
         ClRNM1X6NybnEqezs0DWYuiy3ml0Qm06dYWLmJ2aOC37fqV0i3foXjbJLlXXV7lU0OpN
         1Waw==
X-Forwarded-Encrypted: i=1; AJvYcCVLI48BmU9KmwpGs+NCmRs+DRRRICZk98dBcTCSnjqzD/xuaM6VGRBhCxYlGQSEqYOyfswR2lJJk6stl0DCtmex2MTNiOqvqlf9/8cSd+8=
X-Gm-Message-State: AOJu0Yz9o9kSAHcaWI6/4B59P6fRcwbcHZHku6n7lILWf1zFI+ESjnxA
	nt2JUiiCd4lGp1FTTFgL2rA5TB123r0QavD1sJYt2liEofYGIQ0p1HvTBwJRYWo=
X-Google-Smtp-Source: AGHT+IHCfgVrtMYa0fp+z+iiNFStJsXuBsufUna6l982EcnnfOw5X+iFOo070cXM6N0JdfXwfRyDiA==
X-Received: by 2002:a05:6512:3d16:b0:512:c1e7:185 with SMTP id d22-20020a0565123d1600b00512c1e70185mr1640093lfv.61.1708432509503;
        Tue, 20 Feb 2024 04:35:09 -0800 (PST)
Date: Tue, 20 Feb 2024 13:35:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH 4/4] xen-blkfront: atomically update queue limits
Message-ID: <ZdScey8AJvBykWa8@macbook>
References: <20240220084935.3282351-1-hch@lst.de>
 <20240220084935.3282351-5-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220084935.3282351-5-hch@lst.de>

On Tue, Feb 20, 2024 at 09:49:35AM +0100, Christoph Hellwig wrote:
> Pass the initial queue limits to blk_mq_alloc_disk and use the
> blkif_set_queue_limits API to update the limits on reconnect.

Allocating queue_limits on the stack might be a bit risky, as I fear
this struct is likely to grow?

> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Just one addition while you are already modifying a line.

> ---
>  drivers/block/xen-blkfront.c | 41 ++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfront.c
> index 7664638a0abbfa..b77707ca2c5aa6 100644
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@ -941,37 +941,35 @@ static const struct blk_mq_ops blkfront_mq_ops = {
>  	.complete = blkif_complete_rq,
>  };
>  
> -static void blkif_set_queue_limits(struct blkfront_info *info)
> +static void blkif_set_queue_limits(struct blkfront_info *info,

While there, could you also constify info?

Thanks, Roger.

