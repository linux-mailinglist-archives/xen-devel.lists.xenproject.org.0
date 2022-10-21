Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362946075DD
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 13:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427618.676874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpyc-0007Ig-Uo; Fri, 21 Oct 2022 11:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427618.676874; Fri, 21 Oct 2022 11:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olpyc-0007Fv-RF; Fri, 21 Oct 2022 11:14:10 +0000
Received: by outflank-mailman (input) for mailman id 427618;
 Fri, 21 Oct 2022 11:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RYXF=2W=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olpyb-0007Fp-AD
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 11:14:09 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7add9bc5-5131-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 13:14:07 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id v11so1958502wmd.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 04:14:07 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a05600c4ed300b003c409244bb0sm2597555wmq.6.2022.10.21.04.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 04:14:06 -0700 (PDT)
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
X-Inumbo-ID: 7add9bc5-5131-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4SKfLPpIAxLCKbWZj1rohu1DCFOrNb7lblpLi8/L+LI=;
        b=xInPVt1c+V3/2r7ppFz23gNCyv9l9uxiAA/nY4vxJt5CERGzduWZJF/3PrQ29nVZll
         PDrtPg7TuYjMZjvkKVP3pP7dziw6pIWExNRQ74Dk9TgI/ov/OS7+VtJJMhTKvHT0TS9z
         c684zAdgZR+NrzMZs71Afit3RbNtRSvT7tt/I90SBGWP5R4E8VfkgKx6+/tXwfbYU8EN
         vmM59MdGPtkRjOYJNi0iaDr+MjnbG/TV4VGjEsqYLxIVIj23m3j3NqY7Y0v8xG0v5EEo
         m9jDPdBWDWsh65sQvn7Z4b0iqtGnVJCaOk/jNEsugrX3zOR2H1Y3sCxz5Z8su3jdr2E9
         1ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SKfLPpIAxLCKbWZj1rohu1DCFOrNb7lblpLi8/L+LI=;
        b=3j41+xZ0F8qUmyg4n5ZxSjB5DHykOrAq2Y9HVdInjTE1ZVKRWXsfM4L/LLUWjl6RQG
         LXTflQeQYGBFz6kggZhvpi3iA1cW3DI9kLKLsEMd7F5QIWAmgXoXxWQBLYAwHi/QQrwE
         QGwqX1eHPAwXeR0x548n23tNJN95/AtgA8NRWctUh7RhFVmSi4mWxEncEukIba/vLKbk
         A+AFO483RH+asDwsgFsn5wAuM6Czgqx1c3DLTNfhS4gQawxmB4TkXtOdx+TYoHk/8GpZ
         Dkd6LA8+LUa5Phul7RnB35S7mZsSt3O1xsg0fY03xholIgQ2VKLbanmmhgUXfP2SqH++
         woZQ==
X-Gm-Message-State: ACrzQf0btLkNJnYCXK0glNAnD5COQyDJtKfM9+JFjbmGlX26xA0zM3aT
	ZGgTvzhlhNvKoXaGMEISTXkyDQ==
X-Google-Smtp-Source: AMsMyM4eRM31QS1cseB+pg9IudfD59DN0nTBURKobOBUuxodf107u7nF7oHkKhfEXtf+lQ+njTfv0Q==
X-Received: by 2002:a05:600c:1c24:b0:3c6:c206:9ac0 with SMTP id j36-20020a05600c1c2400b003c6c2069ac0mr33363005wms.172.1666350847231;
        Fri, 21 Oct 2022 04:14:07 -0700 (PDT)
Message-ID: <92533e71-500d-b816-1d06-0740d50e3ec8@linaro.org>
Date: Fri, 21 Oct 2022 13:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v14 12/17] net: dgram: add unix socket
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-13-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021090922.170074-13-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/22 11:09, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)
> ---
>   net/dgram.c     | 55 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   qapi/net.json   |  2 +-
>   qemu-options.hx |  1 +
>   3 files changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/net/dgram.c b/net/dgram.c
> index e581cc62f39f..9f7bf3837653 100644
> --- a/net/dgram.c
> +++ b/net/dgram.c
> @@ -426,6 +426,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
>       SocketAddress *remote, *local;
>       struct sockaddr *dest_addr;
>       struct sockaddr_in laddr_in, raddr_in;
> +    struct sockaddr_un laddr_un, raddr_un;
>       socklen_t dest_len;
>   
>       assert(netdev->type == NET_CLIENT_DRIVER_DGRAM);
> @@ -465,7 +466,8 @@ int net_init_dgram(const Netdev *netdev, const char *name,
>           }
>       } else {
>           if (local->type != SOCKET_ADDRESS_TYPE_FD) {
> -            error_setg(errp, "type=inet requires remote parameter");
> +            error_setg(errp,
> +                       "type=inet or type=unix requires remote parameter");

Thanks for updating.

> @@ -546,6 +595,10 @@ int net_init_dgram(const Netdev *netdev, const char *name,
>                             inet_ntoa(raddr_in.sin_addr),
>                             ntohs(raddr_in.sin_port));
>           break;
> +    case SOCKET_ADDRESS_TYPE_UNIX:
> +        qemu_set_info_str(&s->nc, "udp=%s:%s",
> +                          laddr_un.sun_path, raddr_un.sun_path);
> +        break;

"udp"?

