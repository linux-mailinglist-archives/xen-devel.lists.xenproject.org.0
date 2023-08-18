Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862A378072E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 10:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585852.917049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWutf-0007lQ-SZ; Fri, 18 Aug 2023 08:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585852.917049; Fri, 18 Aug 2023 08:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWutf-0007i5-P0; Fri, 18 Aug 2023 08:31:55 +0000
Received: by outflank-mailman (input) for mailman id 585852;
 Fri, 18 Aug 2023 08:31:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7XOR=ED=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qWute-0007hw-3W
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 08:31:54 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae7febe9-3da1-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 10:31:52 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so77490466b.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 01:31:52 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.114])
 by smtp.gmail.com with ESMTPSA id
 rv6-20020a17090710c600b0099cc3c7ace2sm922405ejb.140.2023.08.18.01.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 01:31:51 -0700 (PDT)
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
X-Inumbo-ID: ae7febe9-3da1-11ee-877e-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692347512; x=1692952312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNMX0AnjJjzsQQCysR3g14AmYaJFpG1hGnEYkiSti3s=;
        b=wsjaOFNYZsvnPUlxyO4J0luZmIS4HffIgkerVxk//FE3CU8RIuNwbL2xD+Htc3X9Vr
         CmFUZsZDUdp3HM4oskEO8zC/QtGO4IMF/lqVs3O6dGvgcljkJ+venMd1PXgIKfstWjfK
         vk76l9DHVBaqKu6vynBmGNRfzFaxNErzORA610KaxQTLq4eT/gXP/a7TvTBh42fIEFni
         UbbELPjXLP67GYJBZzIDGokbOqXaCrJqLdUNJkrnp7ltNMYAgwq+G2A05MR3qfza2r8y
         Vro2NBLIyjiSEm1lZpfjdg/BPP7kmKsLf3gqMzAaMCbbq50P3wPZVpyzDgLKz5nrC/nK
         QiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692347512; x=1692952312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNMX0AnjJjzsQQCysR3g14AmYaJFpG1hGnEYkiSti3s=;
        b=Xz2Wep3sTuU7glA29Witbd9K3lRSLwyu4GM97HPduoxVNwpEe5Sia2HjTjvj7n4wBC
         At4UKOXvk8osB39ZEXZhCGsHE6lNZZhP71vZSxuOtYv82OS7LpFTw1JYStXoh6N6YOEi
         2lN18GgPKi/QF/U5OMtqXph1CBs3tM/o40h0DEuYyeGJqL17zzw7cmYEuvyXj6rTl5DZ
         lsCl8s/pFAuyvdt5Apd5Z70Rpp9ClPSTyol5hXw7rByN0JRFw+NY+AaIA1nPC8U4cKOH
         TND9/hZ6Uukm15uPD5HKfoIZTWVKcQRUo5ecqPiG+l2UQwPskOP1uLGFXsryRIHfCb29
         hmUQ==
X-Gm-Message-State: AOJu0Yz+T3+PckLZ++Kq6JCr2nOP4+j/LWLXNDsAbDEJdRypEoFOrGab
	pu+T4E7JaJg2tefxYJ1ttFbsgQ==
X-Google-Smtp-Source: AGHT+IFPo9l+IULqXhDyve/DOzEDEYbjGx8jyY3mN2byf1pfWXuUa31VFsXgK9ukWLtmU/I6rYMgkQ==
X-Received: by 2002:a17:907:75fa:b0:99e:7a2:a8f6 with SMTP id jz26-20020a17090775fa00b0099e07a2a8f6mr1264012ejc.45.1692347512342;
        Fri, 18 Aug 2023 01:31:52 -0700 (PDT)
Message-ID: <5ad95579-f8f3-2926-dd37-bd84151f10ac@linaro.org>
Date: Fri, 18 Aug 2023 10:31:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/4] util/defer-call: move defer_call() to util/
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Julia Suvorova <jusual@redhat.com>, Stefano Garzarella
 <sgarzare@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Ilya Maximets <i.maximets@ovn.org>
References: <20230817155847.3605115-1-stefanha@redhat.com>
 <20230817155847.3605115-3-stefanha@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230817155847.3605115-3-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 17/8/23 17:58, Stefan Hajnoczi wrote:
> The networking subsystem may wish to use defer_call(), so move the code
> to util/ where it can be reused.
> 
> As a reminder of what defer_call() does:
> 
> This API defers a function call within a defer_call_begin()/defer_call_end()
> section, allowing multiple calls to batch up. This is a performance
> optimization that is used in the block layer to submit several I/O requests
> at once instead of individually:
> 
>    defer_call_begin(); <-- start of section
>    ...
>    defer_call(my_func, my_obj); <-- deferred my_func(my_obj) call
>    defer_call(my_func, my_obj); <-- another
>    defer_call(my_func, my_obj); <-- another
>    ...
>    defer_call_end(); <-- end of section, my_func(my_obj) is called once
> 
> Suggested-by: Ilya Maximets <i.maximets@ovn.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   MAINTAINERS                       |  3 ++-
>   include/qemu/defer-call.h         | 15 +++++++++++++++
>   include/sysemu/block-backend-io.h |  4 ----
>   block/blkio.c                     |  1 +
>   block/io_uring.c                  |  1 +
>   block/linux-aio.c                 |  1 +
>   block/nvme.c                      |  1 +
>   hw/block/dataplane/xen-block.c    |  1 +
>   hw/block/virtio-blk.c             |  1 +
>   hw/scsi/virtio-scsi.c             |  1 +
>   block/plug.c => util/defer-call.c |  2 +-
>   block/meson.build                 |  1 -
>   util/meson.build                  |  1 +
>   13 files changed, 26 insertions(+), 7 deletions(-)
>   create mode 100644 include/qemu/defer-call.h
>   rename block/plug.c => util/defer-call.c (99%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6111b6b4d9..7cd7132ffc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2676,12 +2676,13 @@ S: Supported
>   F: util/async.c
>   F: util/aio-*.c
>   F: util/aio-*.h
> +F: util/defer-call.c

If used by network/other backends, maybe worth adding a
brand new section instead, rather than "Block I/O path".

>   F: util/fdmon-*.c
>   F: block/io.c
> -F: block/plug.c
>   F: migration/block*
>   F: include/block/aio.h
>   F: include/block/aio-wait.h
> +F: include/qemu/defer-call.h
>   F: scripts/qemugdb/aio.py
>   F: tests/unit/test-fdmon-epoll.c
>   T: git https://github.com/stefanha/qemu.git block
> diff --git a/include/qemu/defer-call.h b/include/qemu/defer-call.h
> new file mode 100644
> index 0000000000..291f86c987
> --- /dev/null
> +++ b/include/qemu/defer-call.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Deferred calls
> + *
> + * Copyright Red Hat.
> + */
> +
> +#ifndef QEMU_DEFER_CALL_H
> +#define QEMU_DEFER_CALL_H
> +

Please add smth like:

    /* See documentation in util/defer-call.c */

> +void defer_call_begin(void);
> +void defer_call_end(void);
> +void defer_call(void (*fn)(void *), void *opaque);
> +
> +#endif /* QEMU_DEFER_CALL_H */

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


