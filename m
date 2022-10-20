Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4634605E6E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426589.675130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTMj-00079r-01; Thu, 20 Oct 2022 11:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426589.675130; Thu, 20 Oct 2022 11:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTMi-00077D-TS; Thu, 20 Oct 2022 11:05:32 +0000
Received: by outflank-mailman (input) for mailman id 426589;
 Thu, 20 Oct 2022 11:05:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2/78=2V=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olTMh-00074M-Jq
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:05:31 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c4b14fd-5067-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 13:05:30 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id w18so33791525wro.7
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 04:05:30 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 s9-20020adfdb09000000b0022cc6b8df5esm2545875wri.7.2022.10.20.04.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:05:29 -0700 (PDT)
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
X-Inumbo-ID: 1c4b14fd-5067-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k5OMfOF+gS3nVw6PJtVCPK8dnzLUIJZIwge4jOXVGaY=;
        b=Q3uI8GXwyKyIP/hJ8ICeZ90o8G5KP1HxNrbJKqV4bZijJ9NAYQLz5Has63oHv/UY0F
         TPgIPIu9gMaj0LwIjn47ASRYx/5Ijuz/woJVxhwg6Kk0WQSWfdrgWDFj+jE4nIaltvwZ
         F1PVBCaizepN29HktXcKcuUddH/DLLChsqmkQ+eF1PvRA6RAwKuifOo3bQ0ky3UF/j6P
         K/o4h+bgwux1xZNXunciRNvmAm0U5fD787zpFYclAugl4w00MRKQJ8+1z5NMFz6ebaX6
         8MYrphl+jyUh4Crsr53ot53E3wKsktc/hBqoUKtTQwEnN7U9CO64gShtDjrPnvXZrVVa
         Y7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k5OMfOF+gS3nVw6PJtVCPK8dnzLUIJZIwge4jOXVGaY=;
        b=vzjBaUesqRhQHt7gSx0GAgxyaq9ywP6h/6zlDteQ6PJwmA//clWi73OS8hYgUCka37
         QdURTSUe2K3SBeg/ixq7RoMz77nTcx328Y/9jJXx8fV33OzQBh010thRcxwUCgUtGD0g
         mpMMgwSBZCSGklSAwZql/xByP8mqqDn/ZM6GV4FoTVnaHtkLJFLu66TlLpN/566QIGNr
         E8B8fq0O/or6rhQ4qb/WsZmlXN6JbpXm1dBd0GHPl86befW6ttVyXIrhOqyvv4t6153E
         zBmt47UrAUVjD9rPbZdI1t//Jk9KrsLJdA5IUA1PHgOX2tZ6BAWdN1trFJU5tUReCA8z
         CShQ==
X-Gm-Message-State: ACrzQf2iXzcrWFIKFQbg4sYQqRa6jmfm7gtiON9MdBuAw1wEaXV0FYMo
	JPVK01JU/vlO0nsXqjKNB2PnNA==
X-Google-Smtp-Source: AMsMyM7gylTucNUFEga3J9dhpDrprY9hwVzIWXDjPCT/TC8wr/MH8Kg0yCzIyLZ5QQ9FJN6bsVX6Vg==
X-Received: by 2002:a05:6000:1565:b0:22f:1407:9bfd with SMTP id 5-20020a056000156500b0022f14079bfdmr8099685wrz.620.1666263930079;
        Thu, 20 Oct 2022 04:05:30 -0700 (PDT)
Message-ID: <86d3bbf2-375c-801c-1576-60eeddad6178@linaro.org>
Date: Thu, 20 Oct 2022 13:05:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 15/17] net: stream: move to QIO to enable additional
 parameters
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
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-16-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-16-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/10/22 11:16, Laurent Vivier wrote:
> Use QIOChannel, QIOChannelSocket and QIONetListener.
> This allows net/stream to use all the available parameters provided by
> SocketAddress.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   meson           |   2 +-
>   net/stream.c    | 493 +++++++++++++++++-------------------------------
>   qemu-options.hx |   4 +-
>   3 files changed, 180 insertions(+), 319 deletions(-)
> 
> diff --git a/meson b/meson
> index 3a9b285a55b9..12f9f04ba0de 160000
> --- a/meson
> +++ b/meson
> @@ -1 +1 @@
> -Subproject commit 3a9b285a55b91b53b2acda987192274352ecb5be
> +Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18

Probably unrelated submodule update?

