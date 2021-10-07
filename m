Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 277FF425A22
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 19:58:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203909.359062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYXdr-0006gH-KQ; Thu, 07 Oct 2021 17:57:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203909.359062; Thu, 07 Oct 2021 17:57:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYXdr-0006dJ-Gw; Thu, 07 Oct 2021 17:57:15 +0000
Received: by outflank-mailman (input) for mailman id 203909;
 Thu, 07 Oct 2021 17:57:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4W4d=O3=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mYXdp-0006dD-DD
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 17:57:13 +0000
Received: from mail-ed1-x52b.google.com (unknown [2a00:1450:4864:20::52b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d4650e9-ca79-4c1b-bdc8-9b7313dfe0e1;
 Thu, 07 Oct 2021 17:57:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y12so12944568eda.4
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 10:57:12 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r3sm47502edo.59.2021.10.07.10.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:57:11 -0700 (PDT)
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
X-Inumbo-ID: 8d4650e9-ca79-4c1b-bdc8-9b7313dfe0e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=g/dLkRjoDMfXYeQubimdoTjxmnGAx8Yx9fUp1f0SmjI=;
        b=bDWMVi6RjeNrzLV6Fav9tlhdqIgvBXk3Xtu6AkzzUDd+GjmrH75STljzrMBmesMrIQ
         t/DOJeypfJ+xPPjfLHI6U/iEKbT26eott7/ZA3Q3LpioGAoLmp8+MYCx6K5nwPDzBkgW
         0jJxUcUB+BU84rqZLaFpXRmC2+ILPoXnYBjJDCFQeJrA6bE0EgJmzbtsHGOCXCIOf2/I
         B61EAVFc1VEig7Vi866+9VY80Hpx4tnctpbzI9b3Poaf1amCzjUTi/oqmCP1nahAkAlm
         llj5V5OHqS7u297QJEPW53xdwAjtMCaoyijs2gQaet9VqCFxofwewivbipr4E9Xz9Qt/
         /pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=g/dLkRjoDMfXYeQubimdoTjxmnGAx8Yx9fUp1f0SmjI=;
        b=NnKGnu3VcX68Qxql+EbbNrodhEOJmeRp4JWFn7mnFih6ltIhunvD609d+hivdDYqDU
         wVLcaftF6+Vtwr06wnSAjKHqlY2MYj7PBQOs0d1CqGlNMAMfsGZ57zyBGtGidqIberZc
         XvpEm6WY1Vf7qHdqGITdOtKx2n35lXevESk+1IWdfSn7QTrJVn4cdPi1zs05kzFiutOi
         jDVMUlWe1e6z1/He3AVIXODdCSFr8YXjfYR8XKUGh9Jei4IqJSgYAx7bGupfK2u0dJGj
         BaK16021cNFgyOD8MvrP9oE/E26u19Ei0F5LsgnZiwag3YoIKP2EySKHhCMwW3/h1pwP
         ezuw==
X-Gm-Message-State: AOAM531lzuQelCVnEtYjf5bzCaqCd1WrEvl8YwAVZulXnufwrF0z8Fei
	SwDB3cESCdfUkvuYUfVyqbY=
X-Google-Smtp-Source: ABdhPJwwfOMxbdiOfF9vnzvOEVC+j7eeB2qOA4J85UXZV6tv0ZER+xYam8lvPZBrXmbPFD8EPR6UtQ==
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr8058582edt.237.1633629431382;
        Thu, 07 Oct 2021 10:57:11 -0700 (PDT)
Subject: Re: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, tee-dev@lists.linaro.org
References: <1632750850-28600-1-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2109272151260.5022@sstabellini-ThinkPad-T480s>
 <e612c225-cda6-2c41-bf20-73314ebceb02@xen.org>
 <alpine.DEB.2.21.2110061537310.3209@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <29e1696a-5664-25f4-b679-1f73020ecf97@gmail.com>
Date: Thu, 7 Oct 2021 20:57:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110061537310.3209@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.10.21 01:42, Stefano Stabellini wrote:

Hi Stefano, Julien.

> On Wed, 6 Oct 2021, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 28/09/2021 06:52, Stefano Stabellini wrote:
>>> On Mon, 27 Sep 2021, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> Fix a possible copy-paste error in arm_smccc_smc's first argument (a0)
>>>> for OPTEE_SMC_DISABLE_SHM_CACHE case.
>>>>
>>>> This error causes Linux > v5.14-rc5
>>>> (b5c10dd04b7418793517e3286cde5c04759a86de
>>>> optee: Clear stale cache entries during initialization) to stuck
>>>> repeatedly issuing OPTEE_SMC_DISABLE_SHM_CACHE call and waiting for
>>>> the result to be OPTEE_SMC_RETURN_ENOTAVAIL which will never happen.
>>>>
>>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>>
>>> I added Fixes: and Backport: tags to the commit
>> Per SUPPORT.MD, OP-TEE is still a technical preview. So I would argue that we
>> should not do any backport because the feature itself is not officially
>> considered supported.
> Good point!
>
>
>> That said, what's missing to make the feature officially supported?
> If Oleksandr is also happy to make OP-TEE support in Xen "Supported" in
> SUPPORT.md I'd be happy with that too. Specifically I suggest to change
> it to:
>
> Status: Supported, not security supported
>
> Security Support is a bit of a heavy process and I am thinking that
> "Supported, not security supported" would be an excellent next step.

I would be happy, and can send a formal patch. But I am not an expert in 
this code.

As a user I can say that OP-TEE mediator works perfectly fine, but let's 
wait for the input from Volodymyr,

(looks like there are some TODO left in the code and I have no idea what 
are the implications)


-- 
Regards,

Oleksandr Tyshchenko


