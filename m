Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E8343AC29
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 08:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216121.375737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfFkc-0004kQ-FA; Tue, 26 Oct 2021 06:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216121.375737; Tue, 26 Oct 2021 06:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfFkc-0004iX-7E; Tue, 26 Oct 2021 06:15:58 +0000
Received: by outflank-mailman (input) for mailman id 216121;
 Mon, 25 Oct 2021 23:55:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GUz9=PN=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mf9o0-0003kg-Cd
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 23:55:04 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f781176-7262-406e-858a-b0be2e992a69;
 Mon, 25 Oct 2021 23:55:03 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id p16so16083309lfa.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Oct 2021 16:55:03 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.googlemail.com with ESMTPSA id j12sm553517lfu.7.2021.10.25.16.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 16:55:01 -0700 (PDT)
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
X-Inumbo-ID: 0f781176-7262-406e-858a-b0be2e992a69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=aT3DJ36JdJHVIWZZjofTeLnbp7vhz92UJVeAX8pVSy0=;
        b=G40vs8yJV/u6paBEE7EhpNHsEvuPlrNfVIsKD3phU07bzJRZqUgNZo/0sLky8snNVg
         4/0jumZEmJTuXX2HXbTFxZdlKJhd130yq0rNzjvqnVnETDOjPkp/nH0zeLA9I1JTTg4i
         dOErtVJzid6/8NPURYcaeARc7gbWOnLZqo1Jjo+fEkIQ0O5iTqGzj+EHwiH6TZdE+ASk
         T3a3On9ETPMF0RaueEYF++g4MGMNpNFXDHfTAThxDmIVhvMiAwbpxAECXzljxPqboJ+r
         vFaaN6/ZWMY6BlSgYsQTdlfY/9F7NePghy3DXSOVpN2al3BJaCZuWvGjd3IZTD6TiLlr
         ljaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aT3DJ36JdJHVIWZZjofTeLnbp7vhz92UJVeAX8pVSy0=;
        b=Y95M71MxXaLqdAwfmdqK31h1c0GDFqqJHCQA/usXUvyds2tn2KOBEQZ2KUrXAL5DIi
         CNQBJ0ys7cqUvNL7UV270Dhkl89wsd4+BUQqtjF5p7am4VQte93DVrpfDeLc6VHdaxbs
         53vWitzmhcICha35btOAlFk7tGChEVkvVTmayEdoxb+Vyh77dUCZCFa6hESmKTa3277x
         ZcU6bmM1dJ5kmXgaEQ4GsUrv4pTbqyGi9drdJX3Ac21/wFZkys9zRnrelToNFSvtlsd2
         ATnv7P96rdB2lVHT3MTZXPwPkkAFw3Rc7dq+cy05RIi9/eSZBy7Q98GZBXXVCINoD6jb
         lHlA==
X-Gm-Message-State: AOAM5309giDwSH4ThOT3X7SwQZe8CtCYKmiNxeKfy6xH4CyoRauYCcKV
	SvLhRUiJVq0TT4E74YkSm7Y=
X-Google-Smtp-Source: ABdhPJyFeyXJF+fk76OPZg46jraLMHXkxk7h8aK1t6+wPg8gTB1N4ldWUfXWhhdT2N+tukeHFo3pTQ==
X-Received: by 2002:a05:6512:2292:: with SMTP id f18mr19177414lfu.619.1635206102278;
        Mon, 25 Oct 2021 16:55:02 -0700 (PDT)
Subject: Re: [RESEND 0/5] ARM/arm64: arm_pm_restart removal
To: Florian Fainelli <f.fainelli@gmail.com>, Lee Jones
 <lee.jones@linaro.org>, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, lorenzo.pieralisi@arm.com,
 sstabellini@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, linux@roeck-us.net, treding@nvidia.com,
 arnd@arndb.de, xen-devel@lists.xenproject.org, patches@armlinux.org.uk
References: <20210604140357.2602028-1-lee.jones@linaro.org>
 <526fe66f-df08-c873-2a20-f1295e30a855@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a4fe088f-0f13-f80f-5011-4eee2d44ef63@gmail.com>
Date: Tue, 26 Oct 2021 02:55:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <526fe66f-df08-c873-2a20-f1295e30a855@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

26.10.2021 02:29, Florian Fainelli пишет:
> On 6/4/21 7:03 AM, Lee Jones wrote:
>> This is a rebase/refresh of a set sent out, reviewed,
>> then forgotten about.  It's still considered useful.
>>
>> Here is an excerpt from the previous attempt:
>>
>>  "Hi Russell, ARM SoC maintainers,
>>
>>  here's the full set of patches that remove arm_pm_restart as discussed
>>  earlier. There's some background on the series in this thread:
>>
>> 	https://lore.kernel.org/linux-arm-kernel/20170130110512.6943-1-thierry.reding@gmail.com/
>>
>>  I also have a set of patches that build on top of this and try to add
>>  something slightly more formal by adding a power/reset framework that
>>  driver can register with. If we can get this series merged, I'll find
>>  some time to refresh those patches and send out for review again.
> 
> What happened to this patch series? Is there any chance we will get it
> included at some point? It is included in the Android13-5.10 tree AFAICT
> 

It's in mainline since v5.14, AFAICS.

