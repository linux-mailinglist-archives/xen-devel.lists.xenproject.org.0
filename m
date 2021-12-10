Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA8A46FDCE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:33:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243652.421529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcHF-0006Oe-Fg; Fri, 10 Dec 2021 09:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243652.421529; Fri, 10 Dec 2021 09:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcHF-0006Ls-AO; Fri, 10 Dec 2021 09:33:17 +0000
Received: by outflank-mailman (input) for mailman id 243652;
 Fri, 10 Dec 2021 09:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dYg4=Q3=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mvcHD-0006Fk-2C
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:33:15 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 328c840b-599c-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 10:33:14 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id k37so17012947lfv.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 01:33:14 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id c13sm254687lfv.293.2021.12.10.01.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 01:33:13 -0800 (PST)
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
X-Inumbo-ID: 328c840b-599c-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1sKsqu13f1fJ8ZVjtTiFIs7M6/v2yiKCto4Y2goIhtY=;
        b=gegr37rT1wvk5/wIHoT3HG7CbFisDJJ4qe7XzDTdtRmUZejW6aDzDd79UpHl8InFNC
         Aav2ZhWN7fwu3X0v/aE89Aw3XSuHOBWjTUXuS08G6a53BhERGxk+ge/9uOOtbkqHNmgb
         MoJZlh7AwjhHDayjdbsuG/3Q0h1neeOtb+eNY+EgK6GT9rHBwt8YAyq6IvVCDr3pO26l
         HAnOi+dsKwsTag1DeO8AbaabSQ2CLSMuvxJeKT04xZCkvOu+Z3PXKa6G9dWDMSK8DId3
         4B3MJliyAYL16Dmvpz/AGxNLYDhl40rwyQIQcyt7MD1w5vB8GcKk1scbGe0WZI0ZOvzP
         XpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1sKsqu13f1fJ8ZVjtTiFIs7M6/v2yiKCto4Y2goIhtY=;
        b=w+0fmlsE7AZeVSIM+NECfumoMcz3B5DeJK1iD22n2QGgWEicbgjg5CHClEr7LbeLif
         SSsn79HaP7ktCgj3dlPQavPRk4JQGZPUTR3KClwf3kOIT1Z/lkT9GTRikKUr6eZU3Aa6
         kmYFawGi4++YwWeBuktcA6NPG8rtxkKQmH/HY6iGpT7H5PISeaBB9DC4Lpv/KJ7Yuvqs
         HCGIenSrrbbXj8u4CygJf5e0k/x94qzEFQ8r1HpJP+b58X5qPgLmrCGnnCiH3HaImZsJ
         s6eoPc6VIaNhxWL0FkTTX0nmkIGmYo0aTZLRtgfGsngyAEUDQi9KkRQiuF/+fzxAyMGT
         8ZtA==
X-Gm-Message-State: AOAM53354qkiE2UGx9SLK+UPiGIjBgmNsV9826i41jzzFVrrAcXfK3mJ
	+WkSuMtkID1F/CMWCpJgnFY=
X-Google-Smtp-Source: ABdhPJy0jBvkn2hW116jh/1FKkNOWkwWVSWrraWcHOTZPFv9s8mfwd+5sJqH2upmSWbUncVjhxEwpQ==
X-Received: by 2002:a05:6512:1047:: with SMTP id c7mr11615784lfb.26.1639128794039;
        Fri, 10 Dec 2021 01:33:14 -0800 (PST)
Subject: Re: [PATCH V4 6/6] dt-bindings: xen: Clarify "reg" purpose
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1639080336-26573-1-git-send-email-olekstysh@gmail.com>
 <1639080336-26573-7-git-send-email-olekstysh@gmail.com>
 <669d3f56-13b8-f159-2053-b39f1ba4222f@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <35ee3534-9e24-5a11-0bf1-a5dd0b640186@gmail.com>
Date: Fri, 10 Dec 2021 11:33:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <669d3f56-13b8-f159-2053-b39f1ba4222f@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10.12.21 11:09, Julien Grall wrote:
> Hi Oleksandr,


Hi Julien


>
> On 09/12/2021 20:05, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> Xen on Arm has gained new support recently to calculate and report
>> extended regions (unused address space) safe to use for external
>> mappings. These regions are reported via "reg" property under
>> "hypervisor" node in the guest device-tree. As region 0 is reserved
>> for grant table space (always present), the indexes for extended
>> regions are 1...N.
>>
>> No device-tree bindings update is needed (except clarifying the text)
>> as guest infers the presence of extended regions from the number
>> of regions in "reg" property.
>>
>> While at it, remove the following sentence:
>> "This property is unnecessary when booting Dom0 using ACPI."
>> for "reg" and "interrupts" properties as the initialization is not
>> done via device-tree "hypervisor" node in that case anyway.
> You sent a similar patch for Xen and have already commented there [1] 
> . In short, the OS will be using the node to discover whether it is 
> running on Xen for both ACPI and DT. The hypervisor node also contain 
> the UEFI information for dom0.

I agree with your comments. The sentence should remain in this case. 
Thank you for pointing this out.


>
>
> Cheers,
>
> [1] 
> https://lore.kernel.org/xen-devel/9602b019-6c20-cdc7-23f3-9e4f8fd720f6@xen.org/T/#t
>
-- 
Regards,

Oleksandr Tyshchenko


