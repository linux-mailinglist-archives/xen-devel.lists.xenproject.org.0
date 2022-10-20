Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB151605EDD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 13:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426623.675184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTkA-0003hd-02; Thu, 20 Oct 2022 11:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426623.675184; Thu, 20 Oct 2022 11:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olTk9-0003fZ-Tb; Thu, 20 Oct 2022 11:29:45 +0000
Received: by outflank-mailman (input) for mailman id 426623;
 Thu, 20 Oct 2022 11:29:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2/78=2V=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1olTk8-0003fT-NQ
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 11:29:44 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e41d256-506a-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 13:29:43 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso1937525wmb.5
 for <xen-devel@lists.xenproject.org>; Thu, 20 Oct 2022 04:29:43 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a05600c310700b003b47b80cec3sm2785009wmo.42.2022.10.20.04.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:29:42 -0700 (PDT)
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
X-Inumbo-ID: 7e41d256-506a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Etn0iO4RaXjrrYAkCfqyH7NEpJhpaiQUoe/1LWlrvsk=;
        b=jgfqFJJA76hBb4Id76/FzlxQzhZxxDZHa/QokD907BllT473Y3XtB0P3wjlP8aRAjs
         A/vImCjO27LjnyjGVqISCkap3TTwwuTXs5yhGvHpTgJLBZNMBXpOAtfltu2/+hcw6/1I
         xAjjnkdZ+8HV9XT75WTa9V72ev87ToTseul173SsfyrvFZrlhKjY3cLigHEOaJ2BSaE9
         ptMKZxlSb1TTkfX8RNWPh0vHuNkQHkhmPovhsuivHoUtfJtu0sEEGm8sF7EvV4i+kDCM
         raaTT/wlNVSLk97Ua0KPfLgLDwwNttcaq0kdF61dFW6Zja5hZ0eFkFBilt0dkA6uBQDb
         U+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Etn0iO4RaXjrrYAkCfqyH7NEpJhpaiQUoe/1LWlrvsk=;
        b=YG49p93xVZAPeaFszyXJEDYoAnXqQeA1U2u8iLGfEr/tbNPAmNnESlqwz/Ib2xfOq9
         Z+NRh+Blr0/m6l7c6bOpiKAxL2lI4AvB732TY4bG4X1LyqhEs/olfCg0Q5pUyFTh2XOg
         BKwtAjRyshTMiuNtD3Whx7tmnVLQ+Nvl65zmn+iQCLLwD28YW4wSSS4hAYqtGC58mztH
         mjfM3nUcUbd8kqgeRlxBNJFEUR4QlEQv2eUqu7paTAlW6k4emppq5gC4YvZkonot6Cy5
         wmQPGZe0hs6aSETk8OJwWmJjuodthMMt+/NHwPXSzksqhswW4CYDtq8ZbkrkTMoZ4TT9
         L5oQ==
X-Gm-Message-State: ACrzQf0CqsfG0d8rO4PhPO+QBZcbBSpAXPhzJhqK46oVlawRbFWsP3WT
	1IvLcqNKJpWIH2UpaWzloLDG2g==
X-Google-Smtp-Source: AMsMyM4ij4BZ7TpeNLVFqunzyg4LLe78a5Dj/HqR1xaY4sjaEQmUcFv30JhQ5Lbs/FiYrzwUlIcU4A==
X-Received: by 2002:a7b:cbce:0:b0:3c6:fb29:6084 with SMTP id n14-20020a7bcbce000000b003c6fb296084mr12340370wmi.131.1666265382916;
        Thu, 20 Oct 2022 04:29:42 -0700 (PDT)
Message-ID: <bec2996a-3ea1-4245-64b6-ff53f9094cbf@linaro.org>
Date: Thu, 20 Oct 2022 13:29:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 09/17] net: stream: add unix socket
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
 <20221020091624.48368-10-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-10-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/10/22 11:16, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> QAPI schema
> Acked-by: Markus Armbruster <armbru@redhat.com>

Eventually:

   Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   net/stream.c    | 107 +++++++++++++++++++++++++++++++++++++++++++++---
>   qapi/net.json   |   2 +-
>   qemu-options.hx |   1 +
>   3 files changed, 104 insertions(+), 6 deletions(-)

