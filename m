Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE86843A9FE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 03:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216187.375703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBgK-0005cK-1d; Tue, 26 Oct 2021 01:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216187.375703; Tue, 26 Oct 2021 01:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfBgJ-0005Zo-Uy; Tue, 26 Oct 2021 01:55:15 +0000
Received: by outflank-mailman (input) for mailman id 216187;
 Tue, 26 Oct 2021 01:55:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=izNm=PO=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1mfBgI-0005Zi-G5
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 01:55:14 +0000
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f2621b8-1156-4327-a1db-ae0b33138e89;
 Tue, 26 Oct 2021 01:55:13 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id h20so13574813qko.13
 for <xen-devel@lists.xenproject.org>; Mon, 25 Oct 2021 18:55:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:f0b4:bed7:bbf6:a2b1?
 ([2600:1700:dfe0:49f0:f0b4:bed7:bbf6:a2b1])
 by smtp.gmail.com with ESMTPSA id b2sm9291563qtg.88.2021.10.25.18.55.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 18:55:12 -0700 (PDT)
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
X-Inumbo-ID: 9f2621b8-1156-4327-a1db-ae0b33138e89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mCnwnbPbhYcrF9QBa5LUo8e7y29tVyuzmG2cawteQCA=;
        b=olTS1hbEonbFLujA4x2P8XYUAvZ7BmbseWok6MxtRkkecckkwKz0CEcHcKTIFXqAD1
         HysBjR0qkBfUHxMdYr2Xq5WICeG/B9+27ROdTcp0AvFcS0g4Panq/rOvWzZ2TmhkTOXG
         lSJNmzpWOQeUmYVpALraWJDQWLuUknFeO6s2pGwmj3D2HA6DehAJ7vias+zNbYSCewk1
         t7w4J7gvXmEP+Bv2hY6sasrL+NEZ/KwUlrLQqJNmU9pfR9B8LF4M7no6jIPjIBosEvfP
         akouqDz9bsBhAcLG0UbstP7ZEIAFG1yuS2OO+gWrMUchRrdLVCvwNZPt4kSFnpe7FKZl
         vh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mCnwnbPbhYcrF9QBa5LUo8e7y29tVyuzmG2cawteQCA=;
        b=NGQ+cJx4EtJvG9JsZOEvBEda9brsrYr+0E8WChuTbFbETxjW9ofBeMnFgwdNuJKYYo
         BQD9juRrDDdoKLxwrKfLkh8svDYLxJMxAT3/WUh8/w/S4fC1YKZt4XNiJ1dDwhm2jSTT
         UKXe0LiShP2d4eVcLHGk8HQJ1Lh49L+9Z8YEWIl3I/8bkBXx21OfTDawED680pCDApGM
         l721qDet6r0Q+zy78ZGwazxpnYDeBser0q8lASfBoV28eBjDB7p2oJa0bpznmbWP3KTt
         ykaQQmDxfHklOXq7F8aZSDh6C4puQezgSxAbYnyF/FaD8++gCs2cK8NMz2AWXDTLAnOq
         Tx0w==
X-Gm-Message-State: AOAM531feOc3sBQ33VDB4SEwlYSW4Aq+WyIvOhK2zOhrgzBHvNELFz8k
	5s5bWUpDbzb3q+tobdL32u8=
X-Google-Smtp-Source: ABdhPJwolSe/hyU6zweo2PfHcxsIbYIwTjHsxR3G5XrXvY2VF2DpbOrilwEvBsvaMiIxs6LTirOehA==
X-Received: by 2002:a05:620a:25ce:: with SMTP id y14mr4685253qko.66.1635213313158;
        Mon, 25 Oct 2021 18:55:13 -0700 (PDT)
Message-ID: <f0b28cb6-be34-9b78-844c-0913592fe5f9@gmail.com>
Date: Mon, 25 Oct 2021 18:55:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [RESEND 0/5] ARM/arm64: arm_pm_restart removal
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Dmitry Osipenko <digetx@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 lorenzo.pieralisi@arm.com, sstabellini@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, treding@nvidia.com, arnd@arndb.de,
 xen-devel@lists.xenproject.org, patches@armlinux.org.uk
References: <20210604140357.2602028-1-lee.jones@linaro.org>
 <526fe66f-df08-c873-2a20-f1295e30a855@gmail.com>
 <a4fe088f-0f13-f80f-5011-4eee2d44ef63@gmail.com>
 <321b167f-8744-9ca8-58b0-e09ff39dfa02@roeck-us.net>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <321b167f-8744-9ca8-58b0-e09ff39dfa02@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/25/2021 6:02 PM, Guenter Roeck wrote:
> On 10/25/21 4:55 PM, Dmitry Osipenko wrote:
>> 26.10.2021 02:29, Florian Fainelli пишет:
>>> On 6/4/21 7:03 AM, Lee Jones wrote:
>>>> This is a rebase/refresh of a set sent out, reviewed,
>>>> then forgotten about.  It's still considered useful.
>>>>
>>>> Here is an excerpt from the previous attempt:
>>>>
>>>>   "Hi Russell, ARM SoC maintainers,
>>>>
>>>>   here's the full set of patches that remove arm_pm_restart as 
>>>> discussed
>>>>   earlier. There's some background on the series in this thread:
>>>>
>>>>     https://lore.kernel.org/linux-arm-kernel/20170130110512.6943-1-thierry.reding@gmail.com/ 
>>>>
>>>>
>>>>   I also have a set of patches that build on top of this and try to add
>>>>   something slightly more formal by adding a power/reset framework that
>>>>   driver can register with. If we can get this series merged, I'll find
>>>>   some time to refresh those patches and send out for review again.
>>>
>>> What happened to this patch series? Is there any chance we will get it
>>> included at some point? It is included in the Android13-5.10 tree AFAICT
>>>
>>
>> It's in mainline since v5.14, AFAICS.
>>
> 
> Yes, indeed.

Great, thanks!
-- 
Florian

