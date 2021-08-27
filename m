Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEB93FA0A3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 22:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174019.317461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiYn-0000di-7y; Fri, 27 Aug 2021 20:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174019.317461; Fri, 27 Aug 2021 20:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiYn-0000bB-4u; Fri, 27 Aug 2021 20:34:45 +0000
Received: by outflank-mailman (input) for mailman id 174019;
 Fri, 27 Aug 2021 20:34:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u0mk=NS=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mJiYm-0000b5-B2
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 20:34:44 +0000
Received: from mail-lf1-x136.google.com (unknown [2a00:1450:4864:20::136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c49fe0b7-ae3d-4464-be01-5f3c64d55405;
 Fri, 27 Aug 2021 20:34:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id c8so4263436lfi.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 13:34:42 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u3sm773100lju.107.2021.08.27.13.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 13:34:41 -0700 (PDT)
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
X-Inumbo-ID: c49fe0b7-ae3d-4464-be01-5f3c64d55405
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=GR1VzIgI95C7s5Zv9cazg0liNSpLP3B2iPo5pLuIroU=;
        b=veEVVCOJY+GKb6lNkdiXPgjrnDxjcRDj6PgfYHXUkzdgw01M81ZrpaH1k9b8kEhXgz
         B4rLqze2g/IFroZ1pwE9XvmvJ+l2WHCBH/8uoBHyk+jSuO/gU+lIq0C2RjWgwb2qyBRc
         s232LOynhbZTCUUypi+fpqp8BKAZwXZ9pk2flU9Uvgl+vRa7c4r+vTBGAO5aRWc8SJmM
         sCvx4C+jVBXQDOXj2wEZcNDsRF6WmRBiEp0aN3tM+pgkr9hpz25Lvq2QuPugakjOEzWP
         dNAvE5KVjIZcBYTUqYSBOVMKqV8Sgbz/IqC41PJpLwOBhRa6IUwAmCD1eTtric/y0vIP
         hhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=GR1VzIgI95C7s5Zv9cazg0liNSpLP3B2iPo5pLuIroU=;
        b=SJz6aT5/msvG5xpc+cw9gYKfvI843pz6eIe8p6jZS/CB5CYMM4SRNcdr2IOcBySnto
         HV074D9KFtPYgGHs4uZBK+C/L7143cWu5YLDlE43SJuv4XGNL1mVuDKAJ6bxhYdH3NQB
         iXXTqvRP1nFLXmepAPznqFx7eRx86ZqZWG5grAkV4rLd832P2OZK2OZy5Qi1mhUbpzuC
         u3O3LhI7J7GZU3QoNbnPMt+y0G6MRzglMBYr59N8zSN8Eo4+ZgWmw4NcwNluxMKdMGe6
         a9nz2DADz2iCQ477bZicJV2M9up0KTLt7rtZT6Y3wp6qBy2Ph2S4NAkQtzQuJ+GXFIAi
         k9mw==
X-Gm-Message-State: AOAM530OBCmhIW3/sKJdFzdlOZIIM5FAbw/Bei8AdD4TObZFfxqBxZiz
	mLyT6+OhdMyNChb3cmfInRc=
X-Google-Smtp-Source: ABdhPJytf/Vko32+7asLHaC5dXR9RoijSvb1oyh8EGC4vsBsPZlKPH873/l+2PnGK74Ouf65kFERjA==
X-Received: by 2002:a19:c794:: with SMTP id x142mr8162813lff.134.1630096481847;
        Fri, 27 Aug 2021 13:34:41 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <alpine.DEB.2.21.2108051720210.18743@sstabellini-ThinkPad-T480s>
 <6596ad08-8398-64dd-ef62-cd7bc6f7333e@gmail.com>
 <bc576a23-d107-c67d-8dca-62691e5eea1a@xen.org>
 <1d0ea55d-2e5a-daa7-9c60-c7a1c4b48fa1@gmail.com>
 <6947db7a-44d3-eb5f-c93e-1c1b88c62f29@xen.org>
 <736c38b3-0dfa-ccbf-6a6a-6da871f8aca0@gmail.com>
 <4f5be55d-062b-06d2-1e41-bac3ade0cc3a@xen.org>
 <f046eaba-d073-7fbb-4f4d-405f34d8ee9c@gmail.com>
 <e136dc8e-de64-56fa-8353-300b947db3aa@xen.org>
 <92268dd6-04b7-38e9-86d4-949702971f4b@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <610c474b-9590-2f52-b61e-ab4bb0fc1ec9@gmail.com>
Date: Fri, 27 Aug 2021 23:34:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <92268dd6-04b7-38e9-86d4-949702971f4b@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 17.08.21 20:54, Julien Grall wrote:

Hi Julien


> On 17/08/2021 18:53, Julien Grall wrote:
>> Hi Oleksandr,
>>
>> On 10/08/2021 18:03, Oleksandr wrote:
>>>
>>> On 10.08.21 19:28, Julien Grall wrote:
>>>
>>> Hi Julien.
>>>
>>>>
>>>>
>>>> On 09/08/2021 22:18, Oleksandr wrote:
>>>>>
>>>>> On 09.08.21 23:45, Julien Grall wrote:
>>>>>
>>>>>
>>>>> Hi Julien
>>>>
>>>>
>>>> Hi Oleksandr,
>>>>
>>>>>> On 09/08/2021 19:24, Oleksandr wrote:
>>>>>>>
>>>>>>> On 09.08.21 18:42, Julien Grall wrote:
>>>>>>> 1. If IOMMU is enabled for Dom0 -> provide holes found in Host 
>>>>>>> DT as safe ranges
>>>>>>>
>>>>>>> I would take into the account holes >= 1MB.
>>>>>>
>>>>>> May I ask why 1MB?
>>>>>
>>>>> Nothing special, just thinking to not bother with small regions 
>>>>> which would not be too useful overall, but could bloat resulting 
>>>>> reg property.
>>>>>
>>>>> Anyway, I would be ok with any sizes.
>>>>
>>>> I was more interesting with the reasoning behind your choice rather 
>>>> than saying we want more.
>>>>
>>>> I agree that we may want to skip smaller region. I am guess that an 
>>>> high number of small regions will also increase the bookeeping in 
>>>> Linux.
>>>>
>>>> But I would probably suggest to align the safe region to a 2MB 
>>>> (superpage for 4KB page granularity) just because the backend (or 
>>>> even Xen) may be able to do some optimization there.
>>>
>>> OK, agree regarding the alignment. But, what about the size? I 
>>> assume, it should be a multiple of 2MB.
>>
>> I would say yes. In the documentation for the guest, I would just 
>> write "64KB" to give us some flexibility to reduce the alignment/size 
>> if we encounter platform where we can meet those limits (hopefully 
>> there is none...).
>
> Whoops, I meant cannot rather than can.

ok, makes sense, thank you for the clarification.



>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


