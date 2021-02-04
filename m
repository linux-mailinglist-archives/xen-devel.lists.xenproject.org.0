Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA330F877
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 17:51:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81375.150323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hpy-000087-Qj; Thu, 04 Feb 2021 16:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81375.150323; Thu, 04 Feb 2021 16:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hpy-00007l-Mn; Thu, 04 Feb 2021 16:50:34 +0000
Received: by outflank-mailman (input) for mailman id 81375;
 Thu, 04 Feb 2021 16:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gi2U=HG=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l7hpx-00007g-2w
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 16:50:33 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c3b4f79-4f3c-4491-b05f-96ae66483007;
 Thu, 04 Feb 2021 16:50:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c12so4305559wrc.7
 for <xen-devel@lists.xenproject.org>; Thu, 04 Feb 2021 08:50:31 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b13sm8591583wrt.31.2021.02.04.08.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 08:50:30 -0800 (PST)
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
X-Inumbo-ID: 5c3b4f79-4f3c-4491-b05f-96ae66483007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NPYYoEJ2y4To9yU1YphsNj2ELmwlaAi1v4jUFPLF1ng=;
        b=UU+iv8XpGC88TJk/bTu3Tk1dGxDAgqcO6tIPxtQ6WZPpTLTbH9LvHHZ9EkLuvDaQnh
         UDWrcRx59hySLm8OgsrDEuLE26gE8fWV2SH57C+QBnYQH0+/bvA/VGqWg8i1lQyYlB5u
         pXHrs26jt5Pf7bFIo6tESivBBSllTJVMnPJzIhZwDM2ynlCJiJlgMrF168UBhl23cJV+
         /HFfYDL7eLpwcpFk2dkn8rGWYfqpx1n0d5TOFJ5s04bGJlDjY3zygZSdWZit/ZE/0kcq
         GmUxTSU0/Gc6nCwkSSj7CAtSTSE6B01xwbLCMDXKMe69e5nRu40lFaw5XB4Ir5ZPYXnb
         xjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NPYYoEJ2y4To9yU1YphsNj2ELmwlaAi1v4jUFPLF1ng=;
        b=sa0nJKsYvR/6KI4vT0wPCo4apCl0VDozzxOZUk3wC+fxEUkEmoiC2Km/53he87mGwX
         OUSP5oor61L+OlJd9VM/v0wS0HREg1/ggjbJEOg1JuDLoNCZ8WWO9E/C92Zi+Q0Glkb3
         wI5w8zmEmIAJDArm72qJ4AXMcSuhelwVS4qPoyDO0wER9PPoQAuVepqvdMrPwgVGVG8I
         XVvR7raVvfpYBs1maJ8p5NkHX4hzsOfRwcsiquuAw+8r8y2z2THxn7uRad32kJFOsjQ7
         rc3BSkzeEFMMbxOFrNoamdIqmbeu3RV4zkH5K9/W3RYUImEM11hnoqEqzA9gaGdyBMQU
         7znw==
X-Gm-Message-State: AOAM533HZp+OP9TUSSHJr/GRL3CA7a/7yN+ffTl7ETejYAPRHXGACgHM
	LSq72+opbG04McPDVcubPN0=
X-Google-Smtp-Source: ABdhPJymnvfLVdgw+iV/qERwrnMeWyVEy9prShAi/NjRsF8PECCJUdeHBzjScVAAh/vYskRKduijIQ==
X-Received: by 2002:adf:f009:: with SMTP id j9mr232372wro.35.1612457430698;
        Thu, 04 Feb 2021 08:50:30 -0800 (PST)
Subject: Re: [PATCH for-4.15] libs/devicemodel: Fix ABI breakage from
 xendevicemodel_set_irq_level()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>
References: <20210204155850.23649-1-andrew.cooper3@citrix.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <eee99c85-4581-87d0-a48d-06619624c8b5@gmail.com>
Date: Thu, 4 Feb 2021 18:50:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210204155850.23649-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 04.02.21 17:58, Andrew Cooper wrote:

Hi Andrew

> It is not permitted to edit the VERS clause for a version in a release of Xen.
>
> Revert xendevicemodel_set_irq_level()'s inclusion in .so.1.2 and bump the the
> library minor version to .so.1.4 instead.
>
> Fixes: 5d752df85f ("xen/dm: Introduce xendevicemodel_set_irq_level DM op")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien.grall@arm.com>
> CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Chen <Wei.Chen@arm.com>
>
> Critical to include in 4.15, as this is an ABI breakage.
I am sorry for the breakage, I admit I didn't know that
"It is not permitted to edit the VERS clause for a version in a release 
of Xen."


>    Reverting the broken
> change doesn't look to be a practical option.
> ---
>   tools/libs/devicemodel/Makefile              | 2 +-
>   tools/libs/devicemodel/libxendevicemodel.map | 6 +++++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tools/libs/devicemodel/Makefile b/tools/libs/devicemodel/Makefile
> index 500de7adc5..3e50ff6d90 100644
> --- a/tools/libs/devicemodel/Makefile
> +++ b/tools/libs/devicemodel/Makefile
> @@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
>   include $(XEN_ROOT)/tools/Rules.mk
>   
>   MAJOR    = 1
> -MINOR    = 3
> +MINOR    = 4
>   
>   SRCS-y                 += core.c
>   SRCS-$(CONFIG_Linux)   += common.c
> diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devicemodel/libxendevicemodel.map
> index a0c30125de..733549327b 100644
> --- a/tools/libs/devicemodel/libxendevicemodel.map
> +++ b/tools/libs/devicemodel/libxendevicemodel.map
> @@ -32,10 +32,14 @@ VERS_1.2 {
>   	global:
>   		xendevicemodel_relocate_memory;
>   		xendevicemodel_pin_memory_cacheattr;
> -		xendevicemodel_set_irq_level;
>   } VERS_1.1;
>   
>   VERS_1.3 {
>   	global:
>   		xendevicemodel_modified_memory_bulk;
>   } VERS_1.2;
> +
> +VERS_1.4 {
> +	global:
> +		xendevicemodel_set_irq_level;
> +} VERS_1.3;

-- 
Regards,

Oleksandr Tyshchenko


