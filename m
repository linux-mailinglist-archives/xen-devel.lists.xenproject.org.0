Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C933E4AA3
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 19:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165092.301715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD8rW-0002qR-U8; Mon, 09 Aug 2021 17:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165092.301715; Mon, 09 Aug 2021 17:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mD8rW-0002nZ-QL; Mon, 09 Aug 2021 17:14:54 +0000
Received: by outflank-mailman (input) for mailman id 165092;
 Mon, 09 Aug 2021 17:14:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQI5=NA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mD8rV-0002nT-6E
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 17:14:53 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a5dc5f2-2738-48f0-9b5a-69584f359c5e;
 Mon, 09 Aug 2021 17:14:51 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id g13so35420564lfj.12
 for <xen-devel@lists.xenproject.org>; Mon, 09 Aug 2021 10:14:51 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m14sm1950746lfb.170.2021.08.09.10.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 10:14:50 -0700 (PDT)
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
X-Inumbo-ID: 0a5dc5f2-2738-48f0-9b5a-69584f359c5e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=EnygNeVVjNQ9G15UXriyNKV5C8Lv4zWGhvlP9mGvEaQ=;
        b=PRcmMqqFgKnuf6wSWMZO0Z9Pn2879esxLdYTFXcLdjpYU4w51nAmdwObBxrVUlCJ4J
         FqCWKi40UckH/BpzSdw4fv2ajfEqDULmRA6Sz/XMSLgE6YRBUiWEgdiiicZZznPcyEtH
         sV+iCPBq8T1+XhQ7k+kVeQ5Akor4pcfQzKqm8SOdykxlwQYdtO6o+4W/SA2pFOfl9fSA
         BA6wppojTcK4rYI7tZyv7wUMi4lOzvd34OhEXBmjgqVCF/VW6LUqe+6OPtTiYZQxYfyq
         h/ryrkUwR3rqoBRbqgUegNra4JpZ1EcipZxYVj7iKLeE5DLjIn1BItonlamM5TmWY8xH
         H0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=EnygNeVVjNQ9G15UXriyNKV5C8Lv4zWGhvlP9mGvEaQ=;
        b=nDPP6lelkNgsyy6yUg633f/tf+qnecVAzfRJF5ONf5Ya4e527VVcqCFXzjUgEvgyH7
         UiOZaF+jQ4wA0eKwIRJvQOSxz55QuHvwmzuux4cris33qSNmTqP1nobZHxnnVO/YjIZJ
         lXfbxunT2Rof/H8smWjDRhNmR/Mf2QvEVu8MXQpLn3otYAGPSjPlekXsSC3JrrbQoE/0
         7umDp984vCTdwOI7tJIxq0TTh6h5me7QVQo8tB0N86W8T30GhdMf1dFEr1iUI8kQJGQf
         Jn253KOV99IaYz8/LoBBpuaNrg0McpOl15gnhGp6zoK706DHHxITdAE89WKZbEHQmHSH
         ErvQ==
X-Gm-Message-State: AOAM530VfRnT/6hy+Ez+KCaxupbrG1Lb2M/poj0FsdyVXWJwsOEIyDSF
	gkNDmm3fdEZITc+zO8fv2vk=
X-Google-Smtp-Source: ABdhPJz+GVTGh9FWbNxPN6a8aKXAzMFLKSaS+LTqTwARmvXuITO64wYsa1GgnnPJJIEUZ7PejbRFMg==
X-Received: by 2002:a05:6512:3692:: with SMTP id d18mr19229821lfs.494.1628529290617;
        Mon, 09 Aug 2021 10:14:50 -0700 (PDT)
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
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <50aa5487-efa7-a2c4-d793-4dde56d0aec8@gmail.com>
Date: Mon, 9 Aug 2021 20:14:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <93d0df14-2c8a-c2e3-8c51-54412190171c@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 09.08.21 17:51, Julien Grall wrote:
> Hi,


Hi Julien.


>
> I am writing down here what we discussed on another thread and on IRC. 
> This will be easier to track in a single thread.
>
> On 04/08/2021 23:00, Julien Grall wrote:
>> On 04/08/2021 21:56, Oleksandr wrote:
>>> Now, I am wondering, would it be possible to update/clarify the 
>>> current "reg" purpose and use it to pass a safe unallocated space 
>>> for any Xen specific mappings (grant, foreign, whatever) instead of 
>>> just for the grant table region. In case, it is not allowed for any 
>>> reason (compatibility PoV, etc), would it be possible to extend a 
>>> property by passing an extra range separately, something similar to 
>>> how I described above?
>>
>> I think it should be fine to re-use the same region so long the size 
>> of the first bank is at least the size of the original region.
>
> While answering to the DT binding question on the DT ML, I realized 
> that this is probably not going to be fine because there is a bug in 
> Xen when mapping grant-table frame.
>
> The function gnttab_map_frame() is used to map the grant table frame. 
> If there is an old mapping, it will first remove it.
>
> The function is using the helper gnttab_map_frame() to find the 
> corresponding GFN or return INVALID_GFN if not mapped.
>
> On Arm, gnttab_map_frame() is implementing using an array index by the 
> grant table frame number. The trouble is we don't update the array 
> when the page is unmapped. So if the GFN is re-used before the 
> grant-table is remapped, then we will end up to remove whatever was 
> mapped there (this could be a foreign page...).
>
> This behavior already happens today as the toolstack will use the 
> first GFN of the region if Linux doesn't support the acquire resource 
> interface. We are getting away in the Linux because the toolstack only 
> map the first grant table frame and:
>  - Newer Linux will not used the region provided by the DT and nothing 
> will be mapped there.
>  - Older Linux will use the region but still map the grant table frame 
> 0 to the same GFN.
>
> I am not sure about U-boot and other OSes here.
>
> This is not new but it is going to be become a bigger source of 
> problem (read more chance to hit it) as we try to re-use the first 
> region.
>
> This means the first region should exclusively used for the 
> grant-table (in a specific order) until the issue is properly fixed.

Thank you for the explanation, it is clear now.


>
>
> A potential fix is to update the array in p2m_put_l3_page(). The 
> default max size of the array is 1024, so it might be fine to just 
> walk it (it would be simply a comparison).

I think, this would work. Looks like we don't need to walk for each gfn 
which is being freed, we could just filter it by p2m_is_ram() ...


>
>
> Note that this is not a problem on x86 because the is using the M2P. 
> So when a mapping is removed, the mapping MFN -> GFN will also be 
> removed.
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


