Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4047244B8
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 15:44:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544081.849598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Wyt-0008Ec-Fz; Tue, 06 Jun 2023 13:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544081.849598; Tue, 06 Jun 2023 13:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6Wyt-0008BJ-Cj; Tue, 06 Jun 2023 13:44:15 +0000
Received: by outflank-mailman (input) for mailman id 544081;
 Tue, 06 Jun 2023 13:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JLJd=B2=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1q6Wyr-0008BD-Nw
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 13:44:13 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37bc6445-0470-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 15:44:11 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30c5e5226bdso4162425f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jun 2023 06:44:11 -0700 (PDT)
Received: from [192.168.69.115] (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr.
 [176.184.50.104]) by smtp.gmail.com with ESMTPSA id
 c3-20020a056000104300b003062ad45243sm12679591wrx.14.2023.06.06.06.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 06:44:10 -0700 (PDT)
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
X-Inumbo-ID: 37bc6445-0470-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686059051; x=1688651051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQdFu6b/jDjxN2nQZX5SuNrLlA9gaiWhPjSxV1m/+HA=;
        b=IO8MoLe/0UvDbXayvbGVlgeFbrvfUN7YbaQqMzIMM+SU6Lmqc7XJAuieGVezh1XSdk
         qaJ+3nFlFReKBURrS2yJrLWw2EkjVr1RLRPb4NYah6hN84P7wb0etvtq46Xb1mDU9Yi1
         Dq3GF7K28UJYuRrEF7aNZClYPbthe/yNxVTjDoMQGSjFP7d3i4H/NE5eKWsV2R/mcVfm
         OvK3WiaQI4wKPi4h2fJdOy20DaVs/xASIP5f0VhWmkOkY4PD2rUuTGOkC9CiGJ5Pzfz0
         C2ZTsWsOQOrAqQ4OxOgawLfh0pRpoK8B6YWHavpMh1h/Tufmj7VEk7tXiyBc5AW0L1xS
         XNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686059051; x=1688651051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQdFu6b/jDjxN2nQZX5SuNrLlA9gaiWhPjSxV1m/+HA=;
        b=hBC1/ddP0BE1uRWIYc5sBvYU7ybq3KoDZIT6Kd363GR4EKORIPBM1UtkJhj3CfLOwZ
         zBTBoP49p/BM9m+xGVSrnLefVs/NHyLTVPe/Ni/ZFzrXWZjRCcx2RWFKIxrqCJXFUpIA
         dUhMCzskK7Kk72XjYlCdcMcA/Ujc9YQSdWsjMxBNpRZwnT+/xVEsrgg+r9m/NPe+UrJZ
         6Q1bAhg6u4j4yrg3CPuMYjR+CGldEDf2JLeURqvSr39SK/HB7DHoD2Q4GoKksWgxhi1n
         9IrxVKSLHQWGDfb/GbnJ9bt7A5iRD6sL+Zspt9VRyI+eqpTKsgIdbyw4cn9q9u7iMkBX
         lr5w==
X-Gm-Message-State: AC+VfDzgHa+pTUO3fwtAUz0x81WWDeZ6gCPOMW1YYSCOaAusBWP91uXx
	5tU6vL6vaKMLco89+2fdcjwxdA==
X-Google-Smtp-Source: ACHHUZ4qAsVLyfseV5ayDNQnEpTumF7HiKXBqps/ojJ7uTlHXeJZH0Wi2PkDvs5pa0VH73OscP5Iiw==
X-Received: by 2002:a5d:4a92:0:b0:30a:9c8c:161b with SMTP id o18-20020a5d4a92000000b0030a9c8c161bmr1837835wrq.65.1686059050948;
        Tue, 06 Jun 2023 06:44:10 -0700 (PDT)
Message-ID: <0f7dd8c6-afa1-db05-f98c-7c5d35fd590a@linaro.org>
Date: Tue, 6 Jun 2023 15:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH] xen-block: fix segv on unrealize
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, qemu-devel@nongnu.org,
 qemu-block <qemu-block@nongnu.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Kevin Wolf <kwolf@redhat.com>
References: <20230606131605.55596-1-anthony.perard@citrix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230606131605.55596-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/6/23 15:16, Anthony PERARD via wrote:
> From: Anthony PERARD <anthony.perard@citrix.com>
> 
> Backtrace:
>    qemu_lockcnt_lock (lockcnt=0xb4) at ../util/lockcnt.c:238
>    aio_set_fd_handler (ctx=0x0, fd=51, is_external=true, io_read=0x0, io_write=0x0, io_poll=0x0, io_poll_ready=0x0, opaque=0x0) at ../util/aio-posix.c:119
>    xen_device_unbind_event_channel (xendev=0x55c6da5b5000, channel=0x55c6da6c4c80, errp=0x7fff641ac608) at ../hw/xen/xen-bus.c:926
>    xen_block_dataplane_stop (dataplane=0x55c6da6ddbe0) at ../hw/block/dataplane/xen-block.c:719
>    xen_block_disconnect (xendev=0x55c6da5b5000, errp=0x0) at ../hw/block/xen-block.c:48
>    xen_block_unrealize (xendev=0x55c6da5b5000) at ../hw/block/xen-block.c:154
>    xen_device_unrealize (dev=0x55c6da5b5000) at ../hw/xen/xen-bus.c:956
>    xen_device_exit (n=0x55c6da5b50d0, data=0x0) at ../hw/xen/xen-bus.c:985
>    notifier_list_notify (list=0x55c6d91f9820 <exit_notifiers>, data=0x0) at ../util/notify.c:39
>    qemu_run_exit_notifiers () at ../softmmu/runstate.c:760
> 
> Fixes: f6eac904f682 ("xen-block: implement BlockDevOps->drained_begin()")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> --
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/xen/xen-bus.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/xen/xen-bus.c b/hw/xen/xen-bus.c
> index 1e08cf027a..ece8ec40cd 100644
> --- a/hw/xen/xen-bus.c
> +++ b/hw/xen/xen-bus.c
> @@ -923,8 +923,10 @@ void xen_device_unbind_event_channel(XenDevice *xendev,
>   
>       QLIST_REMOVE(channel, list);
>   
> -    aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
> -                       NULL, NULL, NULL, NULL, NULL);
> +    if (channel->ctx) {
> +        aio_set_fd_handler(channel->ctx, qemu_xen_evtchn_fd(channel->xeh),
> +                           NULL, NULL, NULL, NULL, NULL);
> +    }
>   
>       if (qemu_xen_evtchn_unbind(channel->xeh, channel->local_port) < 0) {
>           error_setg_errno(errp, errno, "xenevtchn_unbind failed");

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


