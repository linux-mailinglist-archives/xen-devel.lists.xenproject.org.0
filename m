Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16B150847F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 11:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309034.525030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh6JN-0008F4-6M; Wed, 20 Apr 2022 09:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309034.525030; Wed, 20 Apr 2022 09:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh6JN-0008CS-2j; Wed, 20 Apr 2022 09:07:45 +0000
Received: by outflank-mailman (input) for mailman id 309034;
 Wed, 20 Apr 2022 09:07:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dnl=U6=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nh6JM-0008CM-Db
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 09:07:44 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5662f59f-c089-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 11:07:43 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id q22so1147839ljh.10
 for <xen-devel@lists.xenproject.org>; Wed, 20 Apr 2022 02:07:43 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a198c46000000b0044424910c94sm1769859lfj.113.2022.04.20.02.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 02:07:42 -0700 (PDT)
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
X-Inumbo-ID: 5662f59f-c089-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VXi3a4LAvsCbWNSOmsDTr1lU/ye1czT52j5wCJ6jh0k=;
        b=mLpYNKvwsqkMj/9tqEWtjmDaTRCa4HcpozXSGctELTE3sR7hMg8trnf3KxBfebEcM/
         c61BKLCbnL4g3NAu3hdyr5Lh6Pwu8m5Lf91doQ5z0yUMKWuHP+17WLuSRagVGRuX6pHG
         ooFmSjBMSf2/2Tzg4Moxw4w1DhXlfsKDMu1pou63ZZwlNCuWTcMJLcwJ+z4C5Jzle5Q1
         Sj1cLuvwIZ/IsXQA4mxDHqaTe+W6SKhCu14f8HVPElsJnWULkCOENfhNxpipx00zKiZI
         jdmspV633O7L5xApNxojXTR7yN2h59a7nwq8RHtySwKlSz7seuCKYpZLjIAEb8BhCijN
         Ng7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VXi3a4LAvsCbWNSOmsDTr1lU/ye1czT52j5wCJ6jh0k=;
        b=qABc31IxsOVFGmqt7MUu5+ExKAntumbGD3q23lT7tPCi7d5jtNotb7Mp6R34Vz/vmH
         h8sORdrHnPDchS12TVzxktec4pbLp7WK/tMEtkyI35/Pr9F5FmNddWtGbMfgyoYVTTqe
         0e2ugY7Zt7z8F1XnK+wnm+Jyo4Xfg0bJFnvP7FSC0Z7ahgeB5sw4uQltr9atjmHIWBB8
         VzBh8s6tH+ZDvFE4JIaejDBbwkbdX3hDUs/DmLjInkn4ADLbHM4sjlHUj5244f5/TDTl
         H8G2iDzWsvuxFMtHqMmqevkM1Z4fpWilI+7LCFok1Wrldo3uuoa4Pl75Vnbed8WNyAci
         okFg==
X-Gm-Message-State: AOAM532beMROkuDjtPSUhmUG7J6BNCcqcRKYwBxlzSSkdUtdjRbOGcPk
	ooXQQFqrRP0TfYul3xD6P5I=
X-Google-Smtp-Source: ABdhPJzXJZ/xW4yVeoivvUV+yOQs7loTQxajlY9+N7Kx5LKp8FfwFh63pX7EQY0tVlxQ9n3OawbYFQ==
X-Received: by 2002:a05:651c:54c:b0:249:9d06:24ef with SMTP id q12-20020a05651c054c00b002499d0624efmr12464574ljp.331.1650445662989;
        Wed, 20 Apr 2022 02:07:42 -0700 (PDT)
Subject: Re: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on Arm
To: Henry Wang <Henry.Wang@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <Julien.Grall@arm.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <1649442065-8332-1-git-send-email-olekstysh@gmail.com>
 <1649442065-8332-3-git-send-email-olekstysh@gmail.com>
 <PA4PR08MB6253F275EE7374EA556A076B92F59@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bc5702e9-0476-b141-4039-6dafeadd6386@gmail.com>
Date: Wed, 20 Apr 2022 12:07:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <PA4PR08MB6253F275EE7374EA556A076B92F59@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 20.04.22 08:20, Henry Wang wrote:
> Hi Oleksandr,

Hi Henry


>
>> -----Original Message-----
>> From: Oleksandr Tyshchenko <olekstysh@gmail.com>
>> Subject: [PATCH V7 2/2] libxl: Introduce basic virtio-mmio support on Arm
>>
>> From: Julien Grall <julien.grall@arm.com>
>>
>> This patch introduces helpers to allocate Virtio MMIO params
>> (IRQ and memory region) and create specific device node in
>> the Guest device-tree with allocated params. In order to deal
>> with multiple Virtio devices, reserve corresponding ranges.
>> For now, we reserve 1MB for memory regions and 10 SPIs.
>>
>> As these helpers should be used for every Virtio device attached
>> to the Guest, call them for Virtio disk(s).
>>
>> Please note, with statically allocated Virtio IRQs there is
>> a risk of a clash with a physical IRQs of passthrough devices.
>> For the first version, it's fine, but we should consider allocating
>> the Virtio IRQs automatically. Thankfully, we know in advance which
>> IRQs will be used for passthrough to be able to choose non-clashed
>> ones.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Tested-by: Jiamei Xie <Jiamei.xie@arm.com>
>> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>> ---
>> @Jiamei, @Henry I decided to leave your T-b and R-b tags with the minor
>> change I made, are you still happy with that?
> Sorry for the late response, just checked the code and yes I am happy with
> keeping my Reviewed-by. Thanks for your effort in rebasing the patch!


Thank you for confirming! Note that I will have to drop tags for the 
next version due to non-minor changes I am currently making to address 
review comments.


>
> Kind regards,
> Henry

-- 
Regards,

Oleksandr Tyshchenko


