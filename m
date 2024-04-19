Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D6D8AAD9F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 13:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709031.1108311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxmJ7-0007Q7-M8; Fri, 19 Apr 2024 11:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709031.1108311; Fri, 19 Apr 2024 11:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxmJ7-0007O4-JD; Fri, 19 Apr 2024 11:21:29 +0000
Received: by outflank-mailman (input) for mailman id 709031;
 Fri, 19 Apr 2024 11:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N8I7=LY=gmail.com=asml.silence@srs-se1.protection.inumbo.net>)
 id 1rxmJ5-0007Ny-R9
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 11:21:27 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f58f1250-fe3e-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 13:21:25 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so25268071fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 04:21:25 -0700 (PDT)
Received: from [192.168.42.27] ([163.114.131.193])
 by smtp.gmail.com with ESMTPSA id
 hx11-20020a170906846b00b00a46d2e9fd73sm2076372ejc.222.2024.04.19.04.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Apr 2024 04:21:24 -0700 (PDT)
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
X-Inumbo-ID: f58f1250-fe3e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713525685; x=1714130485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oo5xMgK7A43edaSEKnYiqm0AuchtwStkZ/R1A6SoZFQ=;
        b=VF4+0jRosIbPPeSTqzRtCG1e4qtj9/vBI44uaCnAfPu7rvaKpJFSPnmbdLLonl04dc
         ekxRWd069n29CNyRLSf1c5OOzQuHIEWZhsaYy3ff3SNmW6qx5BOp16IgSRPuO83PZu8f
         SQe+NdheW7HfvZtb92aMmrvQPUXVffHthSH5itql3K97t8sU+94U6LG7KHvnyUI5LEa1
         /HBZGEWcXX65yezMwLRvrIBywBxZYJ6tgdBBEUB4Rrb60nPzQNBMnuwWv/X/rOr/u8JQ
         tTsaUISAyBBH8AM/noECjn6qfDFd14CO79s+FMoOX0LTZiF0GaOA3FoPtnA+fIuFlMMy
         rA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713525685; x=1714130485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oo5xMgK7A43edaSEKnYiqm0AuchtwStkZ/R1A6SoZFQ=;
        b=eYqhNn4G/SLW09Sazk4JyWzhSW9sOVzpY04aJcJReKv+Kd05zeQ2v5vdB2ONFYYkG9
         9+xIe/efOy09xwW3hQDScUukxYYXTk63ji8Okf4WNjZRktkRM+6mq0Zt2E2CounkyiGl
         24q1t//+j96mYjWxiEYDhv2pD8BxljTmGwkWPLMpWk5QsN6jo8jVFbtwx1kTZEf6ncga
         XonPW3ckbb5Kzd+6rTPspw3i3nYR4JYoTnxrt4E2KDKNQIROiBvdeJW2eqzhzIKHgdR3
         7BYq5ojVLsKbsmrWrwAzZZz9WaA7N9tAMS3hEBO8ruYliFg2z/gmixON5h77rW5sByID
         7rfw==
X-Forwarded-Encrypted: i=1; AJvYcCUEbP0JLSTCafu2u4Idjo2SXPGIZjJP0+8HFEo2lcmzAhBjZiSsAKaax4audBbjLvZlQv9PoG3P/9JQ5lLE4tzz7hWP55++R0yqfmrNSoY=
X-Gm-Message-State: AOJu0YzyvtJsSQKOzK2XECdtMVxQ91p11IsApxrcx7EAyl6CWnUWJlep
	LLDNkPeoau0zrCcYftI/duEzGR4ZznrZE5GI+pBjVBumLI0hTAJN
X-Google-Smtp-Source: AGHT+IEFY1gjmCiW7j8xVLYIyr8i8P2p4D1KfDmvOJjtfOhFv2qZUrBCLs8x/0cxV2+TI3RJGn8Yug==
X-Received: by 2002:a05:6512:ba0:b0:51a:b955:4014 with SMTP id b32-20020a0565120ba000b0051ab9554014mr1557073lfv.18.1713525685086;
        Fri, 19 Apr 2024 04:21:25 -0700 (PDT)
Message-ID: <0f6355d6-b563-458e-9671-ea7e047073e1@gmail.com>
Date: Fri, 19 Apr 2024 12:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH io_uring-next/net-next v2 0/4] implement io_uring
 notification (ubuf_info) stacking
To: io-uring@vger.kernel.org, netdev@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 "Michael S . Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev,
 kvm@vger.kernel.org
References: <cover.1713369317.git.asml.silence@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <cover.1713369317.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/19/24 12:08, Pavel Begunkov wrote:
> Please, don't take directly, conflicts with io_uring.

When everyone is happy with the patches, Jens and Jakub will hopefully
help to merge them. E.g. first staging net/ specific changes [1] and then
handling all conflicts on the io_uring side.

[1] https://github.com/isilence/linux.git iou-sendzc/notif-stacking-v2-netonly


> To have per request buffer notifications each zerocopy io_uring send
> request allocates a new ubuf_info. However, as an skb can carry only
> one uarg, it may force the stack to create many small skbs hurting
> performance in many ways.
> 
> The patchset implements notification, i.e. an io_uring's ubuf_info
> extension, stacking. It attempts to link ubuf_info's into a list,
> allowing to have multiple of them per skb.
> 
> liburing/examples/send-zerocopy shows up 6 times performance improvement
> for TCP with 4KB bytes per send, and levels it with MSG_ZEROCOPY. Without
> the patchset it requires much larger sends to utilise all potential.
> 
> bytes  | before | after (Kqps)
> 1200   | 195    | 1023
> 4000   | 193    | 1386
> 8000   | 154    | 1058
> 
> The patches are on top of net-next + io_uring-next:
> 
> https://github.com/isilence/linux.git iou-sendzc/notif-stacking-v2
> 
> First two patches based on net-next:
> 
> https://github.com/isilence/linux.git iou-sendzc/notif-stacking-v2-netonly
> 
> v2: convert xen-netback to ubuf_info_ops (patch 1)
>      drop two separately merged io_uring patches
> 
> Pavel Begunkov (4):
>    net: extend ubuf_info callback to ops structure
>    net: add callback for setting a ubuf_info to skb
>    io_uring/notif: simplify io_notif_flush()
>    io_uring/notif: implement notification stacking
> 
>   drivers/net/tap.c                   |  2 +-
>   drivers/net/tun.c                   |  2 +-
>   drivers/net/xen-netback/common.h    |  5 +-
>   drivers/net/xen-netback/interface.c |  2 +-
>   drivers/net/xen-netback/netback.c   | 11 ++--
>   drivers/vhost/net.c                 |  8 ++-
>   include/linux/skbuff.h              | 21 +++++---
>   io_uring/notif.c                    | 83 +++++++++++++++++++++++++----
>   io_uring/notif.h                    | 12 ++---
>   net/core/skbuff.c                   | 36 ++++++++-----
>   10 files changed, 134 insertions(+), 48 deletions(-)
> 

-- 
Pavel Begunkov

