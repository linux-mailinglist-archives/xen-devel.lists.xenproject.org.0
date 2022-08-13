Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D0D5919AF
	for <lists+xen-devel@lfdr.de>; Sat, 13 Aug 2022 11:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386248.622165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMneY-0001Jz-7A; Sat, 13 Aug 2022 09:41:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386248.622165; Sat, 13 Aug 2022 09:41:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMneY-0001Hr-48; Sat, 13 Aug 2022 09:41:58 +0000
Received: by outflank-mailman (input) for mailman id 386248;
 Sat, 13 Aug 2022 09:41:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zehi=YR=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oMneW-0001Hl-6K
 for xen-devel@lists.xenproject.org; Sat, 13 Aug 2022 09:41:56 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2843f3ef-1aec-11ed-924f-1f966e50362f;
 Sat, 13 Aug 2022 11:41:55 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id i14so5669867ejg.6
 for <xen-devel@lists.xenproject.org>; Sat, 13 Aug 2022 02:41:51 -0700 (PDT)
Received: from [192.168.1.93] (adsl-45.176.58.225.tellas.gr. [176.58.225.45])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a056402032800b00435651c4a01sm2755507edw.56.2022.08.13.02.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Aug 2022 02:41:50 -0700 (PDT)
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
X-Inumbo-ID: 2843f3ef-1aec-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Qxr3tnM2Fh6diplFHRZawq6WrXcJ0mdZdL0/Xi1HlkQ=;
        b=EUuteCSaqI9hk2fi8IhzZW3wZfWl+kf4vy0v4tC3rilvdZfBq/2+0zVBhbhH8yJVY6
         s0lDWQpDJf00rd61o0YLUOsypqYUlh6fMc3z2GETWz8OIz96rUAYKnO7Naq9k9jujxOc
         VFz8rIzWQoCsq6n14tvsAOHyxqLQHOg4L0ziI4qy5oLGfmHzkSfcqfN8z7gvCgbbEOsl
         z2KN/GpVoE0MEf6uT6sqjjQTHtPNovGkD+FpWsBAG07yGXBmJlD+9ZEVyi+U6KPwcvhz
         xJVJ62qPDMYVm6s+YOTaXoW4OhFF50TO8AKDXM/YhOGXFG8ynD0P6/0VccRdRS7mcUsV
         PBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Qxr3tnM2Fh6diplFHRZawq6WrXcJ0mdZdL0/Xi1HlkQ=;
        b=AQCCbNoAE5av/1+mImDAfrbjSWSpMZ7UqpRPpKaMX6nJuTeVY0OERTsRzL7BOsc+Pu
         9Y7ayWHo6AdaiJCjt6zmV1mCRdVxvkToVKTyj9cBkNdK6o1gJUag+ExHlTZH/sAAA4Jq
         PTml+TvAa9RReRgae+ou8kE0BKh7se/kePdzmb+y7i8UjkaMrGe4xM5QadzmE3Q995gi
         ozPuXsZaqGUbzdIkEyYCndBOA4cpDCUWJXXsdSMvy/6B8N7SlpHs5TwDm6ojqjuZ6Qik
         gT7TAQxCbtQ2nKcMQOuc/GhI/IEHeFkNSWeQTgSksWq8bjM+tTJW/j3k+UaM8wcx8hmB
         iUvA==
X-Gm-Message-State: ACgBeo3RMydU9+qy/n1gPRI0PfKD/mq5k2k5aW5q43vVlk9WKE99SymU
	9EFJqXlIqIh6nYDdbmHB6vau4s4tvws=
X-Google-Smtp-Source: AA6agR6j7pfhr1sYPVZ7tt0Rv7pGsgOSJKWlqzc4L/Z1pyFLjXz8yha2dNwytNL+wNxwozUU6+X40w==
X-Received: by 2002:a17:907:608b:b0:731:8a9d:5a2d with SMTP id ht11-20020a170907608b00b007318a9d5a2dmr5024954ejc.443.1660383710592;
        Sat, 13 Aug 2022 02:41:50 -0700 (PDT)
Message-ID: <92919621-a389-1bc6-9d4b-9285f67b2551@gmail.com>
Date: Sat, 13 Aug 2022 12:41:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm: gic: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220810101539.1909143-1-burzalodowa@gmail.com>
 <8ee01e21-4941-a46d-a5f5-c132c078afa3@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <8ee01e21-4941-a46d-a5f5-c132c078afa3@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

On 8/10/22 13:24, Julien Grall wrote:
> Hi Xenia,
> 
> Thank for your effort to make Xen MISRA compliant. Personally, I find 
> quite difficult to follow what's going on with dozen of single patches.
> 
> It is also makes more difficult for a committer to apply them. For 
> instance, tools like 'b4' can easily apply a series. So there are less 
> effort required.

I understand.

> 
> So would you be able to try to batch your patches in larger series 
> (maybe 10-20 patches)?

Ok. I will group them together and send a patch biweekly.

> 
> Cheers,
> 
> On 10/08/2022 11:15, Xenia Ragiadakou wrote:
>> In GIC_PRI_TO_GUEST(), add parentheses around the macro parameter 
>> 'pri' to
>> prevent against unintended expansions and realign comment.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
>> ---
>>   xen/arch/arm/include/asm/gic.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/gic.h 
>> b/xen/arch/arm/include/asm/gic.h
>> index b3c6c67933..3692fae393 100644
>> --- a/xen/arch/arm/include/asm/gic.h
>> +++ b/xen/arch/arm/include/asm/gic.h
>> @@ -152,8 +152,8 @@
>>   #define GIC_PRI_IPI_ALL    ((GIC_PRI_IPI << 24) | (GIC_PRI_IPI << 
>> 16) |\
>>                               (GIC_PRI_IPI << 8) | GIC_PRI_IPI)
>> -#define GIC_PRI_TO_GUEST(pri) (pri >> 3) /* GICH_LR and GICH_VMCR 
>> only support
>> -                                            5 bits for guest irq 
>> priority */
>> +#define GIC_PRI_TO_GUEST(pri) ((pri) >> 3) /* GICH_LR and GICH_VMCR 
>> only support
>> +                                              5 bits for guest irq 
>> priority */
>>   #define GICH_LR_PENDING         1
>>   #define GICH_LR_ACTIVE          2
> 

-- 
Xenia

