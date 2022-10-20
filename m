Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBA1605E6B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:05:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426585.675119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTMH-0006eP-Nz; Thu, 20 Oct 2022 11:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426585.675119; Thu, 20 Oct 2022 11:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTMH-0006bq-KL; Thu, 20 Oct 2022 11:05:05 +0000
Received: by outflank-mailman (input) for mailman id 426585;
 Thu, 20 Oct 2022 11:04:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2/78=2V=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olTLh-0006ab-Iy
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:04:29 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5ec8ec7-5066-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 13:04:27 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id b4so33740193wrs.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 04:04:26 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 b27-20020a05600c4a9b00b003c6b874a0dfsm2878294wmp.14.2022.10.20.04.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:04:25 -0700 (PDT)
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
X-Inumbo-ID: f5ec8ec7-5066-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKgokySAbSDocqAoeooaDVOHdyffvNbsXeaqlsl0F6Q=;
        b=YuyG979IjH/omPZt2SGnYnru0cV909zoMvrCX3HL8PlAQdcIyioHPGUmIe8W7VRBSv
         d2WnsvRMEK9yG7HTRtQWCf9RmSq9IbNSIhnsLVc2PCjx2Gm680bspMWPyW1lTeBwXRuv
         xuMNES+nRwqUtt4PO6rfyf/9Fw2sP1qA7syP1NgiwDQTJlpmK2BMtT2+57Gcbs7vYsJn
         yYio/2h/fsm9Fc9mw9t+Z4mkyDsXkIDwdnDXlUWjvpl7NtagwnivDivGU9ObtDvXMLYa
         ZprzBgE8PHy04ffFEu2X2AHiYCKwPWAQQq8rs5rQHIAb2gFw+Pg6UZ6B9tqRap+rMoGj
         pGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKgokySAbSDocqAoeooaDVOHdyffvNbsXeaqlsl0F6Q=;
        b=wd4F7z0bhjOzVx2pmRv5bp3gkz28PJtLYe52IqaMS9JZJzz+NzIsWBoGWbWfFuvjZa
         i2FwOWcIvXPulMhrLK2J7Ld/B+nN0Hb6cSLmUnUVBtf1SGeFp4QaLL3FVU5km1M98i3X
         k4ZUXFXNPCG4mTtQcy0z8nqiXa9Mxo3dhoVAVKqOs6X2ZtPPHVn6IwaLeA3hXNu7x3A3
         yjWDs2Qdf722NaGr17c1UIol8NHnsSbi4qDEgEtMEFVHYOOMF1gFIrg12Cvkr0FOPCbz
         TY1CU5D4aUfdYvjA1eNkXqxNfXvK4TdEup1h7g/zQZHzE6VrHG788Qj7D/94QpxkA53e
         BiwQ==
X-Gm-Message-State: ACrzQf3tFFFXCsnwsMO4bscax9jCPpI/FBswpvU9ruDUW1SLQVtRlhoi
	V0mfDKZd+XMAXGWazkrrmQ25/w==
X-Google-Smtp-Source: AMsMyM6fAcbMc6B7n6thzH2AP9CJAGCgb2F1dro5nYnmNF/EItcvTfq7llVzApvdJ80okI4kHx48fQ==
X-Received: by 2002:a5d:6d0d:0:b0:230:1b65:a378 with SMTP id e13-20020a5d6d0d000000b002301b65a378mr8393523wrq.406.1666263865964;
        Thu, 20 Oct 2022 04:04:25 -0700 (PDT)
Message-ID: <644e55ec-1040-09ad-0d1b-1ac80b70b58c@linaro.org>
Date: Thu, 20 Oct 2022 13:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 12/17] net: dgram: add unix socket
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-13-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-13-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/22 11:16, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>

Eventually:

   Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)

> ---
>   net/dgram.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++++-
>   qapi/net.json   |  2 +-
>   qemu-options.hx |  1 +
>   3 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/net/dgram.c b/net/dgram.c
> index e581cc62f39f..02a189e36358 100644
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
> @@ -465,7 +466,7 @@ int net_init_dgram(const Netdev *netdev, const char *name,
>           }
>       } else {
>           if (local->type != SOCKET_ADDRESS_TYPE_FD) {
> -            error_setg(errp, "type=inet requires remote parameter");
> +            error_setg(errp, "type=inet or unix require remote parameter");

Maybe clearer reworded as:

   "type=inet or type=unix requires remote parameter"

>               return -1;
>           }
>       }


