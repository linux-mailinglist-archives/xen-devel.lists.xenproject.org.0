Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B33780734
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 10:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585864.917068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWuvB-0000O7-EE; Fri, 18 Aug 2023 08:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585864.917068; Fri, 18 Aug 2023 08:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWuvB-0000LB-BG; Fri, 18 Aug 2023 08:33:29 +0000
Received: by outflank-mailman (input) for mailman id 585864;
 Fri, 18 Aug 2023 08:33:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7XOR=ED=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qWuv9-000854-0Q
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 08:33:27 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5de1da8-3da1-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 10:33:25 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso793548a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 01:33:25 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.114])
 by smtp.gmail.com with ESMTPSA id
 sb25-20020a170906edd900b0098ec690e6d7sm912432ejb.73.2023.08.18.01.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 01:33:24 -0700 (PDT)
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
X-Inumbo-ID: e5de1da8-3da1-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692347605; x=1692952405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6B6reclpzzsqyu3GltKPx/1+vUT6rdQgVTwvqAcIGs=;
        b=mDuI2K73sG7+5NxFPZRZlJXZ5KSoqV9Cs+aW0/5S+yvrD6030fXShHseiMnofJoMMS
         vCBYoy7ZrlIxH7fxS0WV8efXhIiqworCPIWvbz6fZj/aQ5GmoCXGkAZimz8jIH3ECD4q
         LeG8GdaTamQSUypMUwQkpxLGz+dp7nRNmb5eDOSIa+wKPMJuLsoRhFxPlMbOWr1pK3/G
         AIzZC5CLk6D5+A8rB3mPouvE2rpBs4iM9WrKTxtNs3v006SvChx7KDH1EqdwsWHZoxGS
         cBCRar7rkFfqdCbp57eB7HmyAvwqjxcniReuXiTVMIP4TBsScJn5iwKjWrRtvhB6cjO0
         f6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692347605; x=1692952405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6B6reclpzzsqyu3GltKPx/1+vUT6rdQgVTwvqAcIGs=;
        b=TtoTkbLWN25zVyBJHvo5gNBuOZsVg+MgnGlTxE2iSez5oGlIMECBzlSWicXZVfZSe/
         Cf/DuaJ3OPvAYVUoX5b5zcAGFGHK+3bnre6spYPM10lZyqAzrvbJzc5fuyrY1YYYAuLt
         UdEcxCuCcop+fcP8R4x8X8iIKbg8Z1UCOJofr6908BTnVM5Fx40q9fjV1gtn8xHXIBDc
         UrBt645JE+/8BNrfFQ3N8tV11gEGy9sXUFKDA2UYS5wcsN8DWYBmJjIVxaEKEyZsrem6
         9zt9vLF+tXTJc5IXtdYcjUvScUGsliOZy45r4CIFmb3oOPjn3gegPJHWAAFsCbTWoQO7
         x7NQ==
X-Gm-Message-State: AOJu0YxNDMUtMsJKk9b2NBvSskq0Qv8vCwPXa2JOlSbGR+sThKdxAlun
	i8nqZzEx4Zgz/BnYbM1nlc+OBA==
X-Google-Smtp-Source: AGHT+IEVGTXx+aqxF3YAMS/s3iznP3vmLGfMlX8GyLK0NY+uy1m2WAzwUikiXNblzUrGIPKOK+Un6Q==
X-Received: by 2002:a17:907:7886:b0:99d:f34c:7a0f with SMTP id ku6-20020a170907788600b0099df34c7a0fmr1131079ejc.23.1692347604770;
        Fri, 18 Aug 2023 01:33:24 -0700 (PDT)
Message-ID: <8d4d54ae-84c8-d0ba-2a9e-330898a1e4bd@linaro.org>
Date: Fri, 18 Aug 2023 10:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/4] block: rename blk_io_plug_call() API to
 defer_call()
Content-Language: en-US
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
 <20230817155847.3605115-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230817155847.3605115-2-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/8/23 17:58, Stefan Hajnoczi wrote:
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


