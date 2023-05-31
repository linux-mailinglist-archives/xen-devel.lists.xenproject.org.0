Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27634717850
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 09:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541621.844563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GLC-0005a4-CY; Wed, 31 May 2023 07:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541621.844563; Wed, 31 May 2023 07:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4GLC-0005Y0-9Z; Wed, 31 May 2023 07:33:54 +0000
Received: by outflank-mailman (input) for mailman id 541621;
 Wed, 31 May 2023 07:33:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqU/=BU=redhat.com=sgarzare@srs-se1.protection.inumbo.net>)
 id 1q4GLA-0005Xu-Mp
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 07:33:52 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c30baf7-ff85-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 09:33:50 +0200 (CEST)
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-JBw-ZGEjOcihmvaln_Xh7w-1; Wed, 31 May 2023 03:33:45 -0400
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b05714a774so29388341fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 00:33:45 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-16.business.telecomitalia.it.
 [87.12.25.16]) by smtp.gmail.com with ESMTPSA id
 i13-20020a17090685cd00b0096f83b16ab1sm8499433ejy.136.2023.05.31.00.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 00:33:43 -0700 (PDT)
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
X-Inumbo-ID: 7c30baf7-ff85-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685518429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jvYQlhKuHyKtL4mNj/znMLADcf3tcavTDhI4smE8dw=;
	b=XsNxPhP/8MBxxQyXBXzhG681qCuVcjMEiE5HzTG4zJ3zQVnHZfq4wr4G3Y5EpRi/4kHdlO
	z8iT9E/Dh9LpWsn2YTjU5Fg54tydZBrvg43qGtE/bk7u5xjhdZSEHYgFa3hrPIMNgv+Akh
	y2byYSKQPMeew0R+A/UJlI9r3ikeq4U=
X-MC-Unique: JBw-ZGEjOcihmvaln_Xh7w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685518424; x=1688110424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jvYQlhKuHyKtL4mNj/znMLADcf3tcavTDhI4smE8dw=;
        b=f/uPZ7zrZSJRo99Qi2PrInts5OAANRzfMo8WH0UuzBu6k2jYBNae+Rn5G6JaXaeUX6
         chbCkr+0vRaTbTRCWWyYV5r+HpHpJ0A6KnCAWVOOcea1Zp0wLou9iIowKRtoQmzVqDDv
         xPS6gPwJsSLKK4kEhGE1h6Oa0XU6Id8jwM2TTeKjMRGU/TRixP3M8rY81X8IpW6vPh6x
         mdMC3BPMEScRSwoBEKN5UcFVYZ2NqXd54QrtEgFykmHRXD+2OnWGxE8xzznM1NTxR4b9
         Rld+RXYT3F1dr1jGl+KPr5NDKJ9QGLQo6ry3Fs4G7A07nf/IwT5LvQSTHINtnNpXtCjw
         XOww==
X-Gm-Message-State: AC+VfDzl9Xp4NX9Qzlm6UIesj8N45IxgLBvfBdUZ09JF3bKRXy2xBaYz
	LgMfJ9QmJR3P0k0+jY476NCIgOWEciz8f/vOFrcAsCt3fQjmDpN6HXC2ddIszHfDOGjxPgtFYsT
	sIYPaAn4lFFD2S+Qm0IQn3A7MBFs=
X-Received: by 2002:a2e:9e47:0:b0:2af:a696:3691 with SMTP id g7-20020a2e9e47000000b002afa6963691mr2125459ljk.40.1685518424311;
        Wed, 31 May 2023 00:33:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ551RIeF9bnzkTrz/lia8+/hteNl9cJtKk1XRyhXQesUA8vv9D1oOPKoklfR2VDrpxdBxuWZw==
X-Received: by 2002:a2e:9e47:0:b0:2af:a696:3691 with SMTP id g7-20020a2e9e47000000b002afa6963691mr2125438ljk.40.1685518423940;
        Wed, 31 May 2023 00:33:43 -0700 (PDT)
Date: Wed, 31 May 2023 09:33:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	eblake@redhat.com, Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>, 
	qemu-block@nongnu.org, xen-devel@lists.xenproject.org, 
	Julia Suvorova <jusual@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Aarushi Mehta <mehta.aaru20@gmail.com>
Subject: Re: [PATCH v3 5/6] block/linux-aio: convert to blk_io_plug_call() API
Message-ID: <olpmomsccllt6s5yuzzznwoaf6mpx3vmcex5bt477uviettgra@owpdleplwg36>
References: <20230530180959.1108766-1-stefanha@redhat.com>
 <20230530180959.1108766-6-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230530180959.1108766-6-stefanha@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 30, 2023 at 02:09:58PM -0400, Stefan Hajnoczi wrote:
>Stop using the .bdrv_co_io_plug() API because it is not multi-queue
>block layer friendly. Use the new blk_io_plug_call() API to batch I/O
>submission instead.
>
>Note that a dev_max_batch check is dropped in laio_io_unplug() because
>the semantics of unplug_fn() are different from .bdrv_co_unplug():
>1. unplug_fn() is only called when the last blk_io_unplug() call occurs,
>   not every time blk_io_unplug() is called.
>2. unplug_fn() is per-thread, not per-BlockDriverState, so there is no
>   way to get per-BlockDriverState fields like dev_max_batch.
>
>Therefore this condition cannot be moved to laio_unplug_fn(). It is not
>obvious that this condition affects performance in practice, so I am
>removing it instead of trying to come up with a more complex mechanism
>to preserve the condition.
>
>Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>Reviewed-by: Eric Blake <eblake@redhat.com>
>---
> include/block/raw-aio.h |  7 -------
> block/file-posix.c      | 28 ----------------------------
> block/linux-aio.c       | 41 +++++++++++------------------------------
> 3 files changed, 11 insertions(+), 65 deletions(-)

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


