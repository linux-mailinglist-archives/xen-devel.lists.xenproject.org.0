Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B96E8780ABD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 13:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586056.917267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxJj-0002jt-RG; Fri, 18 Aug 2023 11:06:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586056.917267; Fri, 18 Aug 2023 11:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxJj-0002hq-OW; Fri, 18 Aug 2023 11:06:59 +0000
Received: by outflank-mailman (input) for mailman id 586056;
 Fri, 18 Aug 2023 11:06:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we2c=ED=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qWxJi-0002hX-Ft
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 11:06:58 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58c68876-3db7-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 13:06:57 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bb97f2c99cso11697001fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 04:06:57 -0700 (PDT)
Received: from [192.168.1.129] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a1ce903000000b003fba2734f1esm5974019wmc.1.2023.08.18.04.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 04:06:56 -0700 (PDT)
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
X-Inumbo-ID: 58c68876-3db7-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692356817; x=1692961617;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WZBHM3ZPHOXrt2Kg8F5DanNH251f9ZlA+yD5gXeg1jw=;
        b=GLDo5PrTMlha+bMA3Jj9Ln9iNVqxkRSEPpwDsmcwZhEpwm+LCua0NB00JMd94oT40j
         bt5WjU7MCFicwAKcr3k8d7tiUtID7+UewTzDTWMA0pnKnlodVPSYbrm3K+gMy1mq5+CF
         u1Aki8b+KdSlhrg1w+57DRA/lO9vbJjJeeeMxkfUoQoV7vpO3MXOZKpLbh8/9TQPhM3U
         RaFAz/aqKjyE93YZl5FxT2YtRngADOMMIK+mB+GkrxI4yyuQYFn8oL76bfHJp/NnQQcF
         pC9t4mLaNTtT4j6dCudAcDyYJImrwF19l2dyC+xlRyhUsPR6nSedw2JDBg8Tpj4Q8Tqe
         H5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692356817; x=1692961617;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZBHM3ZPHOXrt2Kg8F5DanNH251f9ZlA+yD5gXeg1jw=;
        b=T6P1LRa3Q6vmacTnKZGMz9fQNmfqkGQar1Fj5ATCmi2gQ43xwmTuzJOlMSkVgrkRGp
         rvoUD9b2WZtPPDSpf+VMKEcnMEogTKfNuHPwV/FGoLTmGcYEPgHLh8rgNWvPmW1xRpIt
         OvzpGHnA/6ZNuUW9ByKwJvvGpCy+nAFkJ648f7RNwV6tgfW+Cp3kWTAGgqLZsZ1immUX
         enLLEEEz+R4GvLtftT7ZT323gTfSoEb6wmkPfYXR3G4o8x7ts46WsQxJ9ZWnnZ6WljJH
         5X1u0hhgIKDxfJ8zOdn22asaYbQSZfA1F6XCEo6DUy1qF+7cuFxhtlFyc/2nmfFR8PT/
         at8w==
X-Gm-Message-State: AOJu0YyV4hVAYA1aKfiNJECOycVHutvk82UP3Gom1gxLyfpdyhHnr5/H
	V8jL/LssU7CqyvusPhob0nk=
X-Google-Smtp-Source: AGHT+IGF2cZZNcLBwVNpBISgkNNyUKCmy3tLMvh2CfeK1p2uuHCgThyPzQvYNkaOBUzBtGrPYuhIFg==
X-Received: by 2002:a05:651c:210:b0:2bb:9894:c3dc with SMTP id y16-20020a05651c021000b002bb9894c3dcmr1542018ljn.4.1692356816485;
        Fri, 18 Aug 2023 04:06:56 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <099418aa-fdce-9d5e-bbd7-429ed815897c@xen.org>
Date: Fri, 18 Aug 2023 12:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 1/4] block: rename blk_io_plug_call() API to
 defer_call()
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ilya Maximets <i.maximets@ovn.org>
References: <20230817155847.3605115-1-stefanha@redhat.com>
 <20230817155847.3605115-2-stefanha@redhat.com>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20230817155847.3605115-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/08/2023 16:58, Stefan Hajnoczi wrote:
> Prepare to move the blk_io_plug_call() API out of the block layer so
> that other subsystems call use this deferred call mechanism. Rename it
> to defer_call() but leave the code in block/plug.c.
> 
> The next commit will move the code out of the block layer.
> 
> Suggested-by: Ilya Maximets <i.maximets@ovn.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   include/sysemu/block-backend-io.h |   6 +-
>   block/blkio.c                     |   8 +--
>   block/io_uring.c                  |   4 +-
>   block/linux-aio.c                 |   4 +-
>   block/nvme.c                      |   4 +-
>   block/plug.c                      | 109 +++++++++++++++---------------
>   hw/block/dataplane/xen-block.c    |  10 +--
>   hw/block/virtio-blk.c             |   4 +-
>   hw/scsi/virtio-scsi.c             |   6 +-
>   9 files changed, 76 insertions(+), 79 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


