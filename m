Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422D275F74
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 20:09:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL9CT-0002gR-Ta; Wed, 23 Sep 2020 18:09:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Zf1=DA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kL9CS-0002gM-EL
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 18:09:04 +0000
X-Inumbo-ID: 9f5b4e54-3563-429f-866e-4d515dcef07e
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f5b4e54-3563-429f-866e-4d515dcef07e;
 Wed, 23 Sep 2020 18:09:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 77so959030lfj.0
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2020 11:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TRu6eOkNWgQ42XDLq3LhOuSAviWnsuLYyZgNaLFkSDI=;
 b=aS+3TvCqteTMFqEgKdbbRHCtLVhJD3p8pJUzeOYqs9NvqgtLLDZDFX+nsj0Q367r0u
 Bs3ffKAWWzLVmKXYH2zjRO6Fphxq79iACSEp29/YhCiSpFoYLdVfElpCmTBBjrKz8p8C
 pQNUS1gfHtCB1UJnepvDd0WUkbH9yrFUQRGRj8mActYiSu33iOE6HTzr40C6hS+3q7f8
 VYwhsWbzEhzOjqx6/ciVa05caSLKVvm/vacJh8tiRVzp778N575tBY5zeO8s61YIVuPF
 CwqpHmRGD6JVg+hI1s2qJkPpegny030DDVUOWmNpbMnPDn7iQeSs4tg7It8gKjmpFyG0
 Do7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TRu6eOkNWgQ42XDLq3LhOuSAviWnsuLYyZgNaLFkSDI=;
 b=iQAqypS7IOrZz1iCBUloLk8AVQbFmM/hl3d3pLlW2tJq/5CPks1RLG0quFrP1HiUZH
 tcj0uzHwyyDDJWMl7M7YBaOfY87Qrr5gOPXcrST7Qk7RVBObjNXOcouL6wpIX9aw1nk+
 ZjcwFIoIidqb0/c9O0AoluxgMQ10lpVEtQ+kl4qau+B7hU1Mywq0agMPZ/UAjl+DTe7+
 i5jOiHOobMZPjZT9M0f8aOjbuXTBAmnYfDYx/1oJ+KP8n8aQDE+zOynfFdm/Z3gVWbN/
 aLtXGA+UcQdCy94Tkh0XkcmMT6nNDoPJvxiGaEijZckO0/mBvtCZrY9xTySSQNxLc1mY
 6pow==
X-Gm-Message-State: AOAM533WVBVhxe8DosI2XMVVuhSuD4Pmkp/M4pa+dnb8jtn6flfqL1Rp
 iExMojBsGeEY7X8r+ne+aFc=
X-Google-Smtp-Source: ABdhPJzIihRAVoZK8niWDYKSB251FWB8WaIs0AQ35sSbX26zTLnh2hYZl7fFiegTAIy1u6P7NSDqlQ==
X-Received: by 2002:a05:6512:50c:: with SMTP id
 o12mr372879lfb.192.1600884541708; 
 Wed, 23 Sep 2020 11:09:01 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id j8sm5523714lji.91.2020.09.23.11.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 11:09:01 -0700 (PDT)
Subject: Re: [PATCH V1 01/16] x86/ioreq: Prepare IOREQ feature for making it
 common
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-2-git-send-email-olekstysh@gmail.com>
 <1e1bfa02-9de0-b3ba-d0c7-5796c942f737@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <26e2904c-cd84-d8c3-a055-f399eae25a43@gmail.com>
Date: Wed, 23 Sep 2020 21:08:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1e1bfa02-9de0-b3ba-d0c7-5796c942f737@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 23.09.20 20:22, Julien Grall wrote:
> Hi,

Hi Julien


>
> On 10/09/2020 21:21, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> As a lot of x86 code can be re-used on Arm later on, this patch
>> prepares IOREQ support before moving to the common code. This way
>> we will get almost a verbatim copy for a code movement.
>
> FWIW, I agree with Jan that we need more details what and why you are 
> going it. It would be worth considering to split in smaller patch.

ok


>
>
>>
>> This support is going to be used on Arm to be able run device
>> emulator outside of Xen hypervisor.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>
> Usually the first signed-off is the author of the patch. However, this 
> patch look quite far off from what I originally wrote.
>
> So I don't feel my signed-off-by is actually warrant here. If you want 
> to credit me, then you can mention it in the commit message.
This is related to all patches is this series. This patch series is the 
second attempt (the first was RFC) to make IOREQ support common and it 
became quite different from the initial commit.
I am sorry, I got completely lost whether the particular patch in this 
series is close to what you originally wrote or far from, I mean whether 
I should retain your SoB and whether I should drop it. So in order *not 
to make a mistake* is such an important question, I decided to add your 
SoB to each patch in this series and also add a note to each patch 
describing where this series came from.


>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


