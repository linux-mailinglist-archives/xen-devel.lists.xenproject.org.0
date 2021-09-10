Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E5E407143
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 20:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184738.333461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOlU0-0000bZ-AN; Fri, 10 Sep 2021 18:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184738.333461; Fri, 10 Sep 2021 18:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOlU0-0000ZW-73; Fri, 10 Sep 2021 18:42:40 +0000
Received: by outflank-mailman (input) for mailman id 184738;
 Fri, 10 Sep 2021 18:42:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ConJ=OA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mOlTz-0000ZQ-Dj
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 18:42:39 +0000
Received: from mail-lf1-x131.google.com (unknown [2a00:1450:4864:20::131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9318662-e837-45c7-8ad4-8ab76cf1901b;
 Fri, 10 Sep 2021 18:42:38 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id n2so6006981lfk.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Sep 2021 11:42:38 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n25sm664708ljj.42.2021.09.10.11.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 11:42:37 -0700 (PDT)
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
X-Inumbo-ID: b9318662-e837-45c7-8ad4-8ab76cf1901b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=QPygq3zscXFjX5u+NyrwQkEwCIrdjjmY8mMP7XiNmpY=;
        b=kHXJh8mfEcsLIcEtHnsLDcwFbrCZqle/rOf6MJGepSmxnTOCzlajt7QSKHXc8JRznW
         0EHNv5gHKZpB2Y87OCs2yLgYPNxV3052YAC2mLoiQzxfM3HUl+0imYpQQCdRg0siaq2W
         hG0ZojrWSrgmmmPtivXNaV2bp5eCAZt2OiaHlQhyZqFRVoRx6u8qgrdbohn1PJ6lyNrv
         FuXI9WFLLmQKj9jp+19IPBGtS4FL5uXf5UpEMZ56FLyBZVOfgkX6DGzzdrxNvLIW1fFS
         L9Tr2KG49kfpVU503VL/Fx54y6XzRt5jG4oWzMPjkVOfp1K/tfKGBW+W0UmYqXK9nzEg
         8rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=QPygq3zscXFjX5u+NyrwQkEwCIrdjjmY8mMP7XiNmpY=;
        b=jm7Kn2qppWE/D+iVyONuVfh+HvuJFbo5hHFsebe6IlzFceqYw40tXPoR0u4bspRwzJ
         2LOFKBknoLi2kNGQLTf8xp3W/LmBDmo6DJpbm0yFhInoEaWCs7TLDZ1wLxn5fdDHjDTc
         mUy4+PCZZzUArXMGwlQPfQvu0ysD1aWsYY8BkuJDIJfr99/hQqcOt1XDmSMgISIRkguU
         jLixrzy7GQ1Q0I73XDgVr5FwOX+LEpR1Q4Sn2x0ADkpaamflGAcQ2p+zWEv2VwTbJMMw
         pXJWZJt7gGEIx/YtytmNJHAdLUPnL2Gl52XF3J+9Zs+wHV/XY+mEC66ZZU3241k6ygi+
         Y0hg==
X-Gm-Message-State: AOAM533zsouZ8OAJxhZothSUuJ1iKKyU49RxRSJ2BtpNmXbNdGt+aVee
	spELBV92w8JAzaPQpYU7BfM=
X-Google-Smtp-Source: ABdhPJz0c3VoBzA6YMfDF3kRSx9Np/OicfnbcQbSHkKpf+somS1PAKHXJ8ORqrIs8jU6fV2m8fklSA==
X-Received: by 2002:a05:6512:c3:: with SMTP id c3mr5107029lfp.364.1631299357388;
        Fri, 10 Sep 2021 11:42:37 -0700 (PDT)
Subject: Re: [RFC PATCH 0/3] Add handling of extended regions (safe ranges) on
 Arm (Was "xen/memory: Introduce a hypercall to provide unallocated space")
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
 <6b2bea7a-63dc-bb42-9e0b-fb49b05e310a@gmail.com>
Message-ID: <530cc82a-9727-71ea-536a-4d4824de83fd@gmail.com>
Date: Fri, 10 Sep 2021 21:42:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6b2bea7a-63dc-bb42-9e0b-fb49b05e310a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hello all


On 10.09.21 02:20, Oleksandr wrote:
>
> Hello all
>
> On 07.09.21 20:09, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> You can find an initial discussion at [1].
>>
>> The extended region (safe range) is a region of guest physical
>> address space which is unused and could be safely used to create
>> grant/foreign mappings instead of wasting real RAM pages from
>> the domain memory for establishing these mappings.
>>
>> The extended regions are chosen at the domain creation time and
>> advertised to it via "reg" property under hypervisor node in
>> the guest device-tree.
>>
>> The extended regions are calculated differently for direct mapped
>> Dom0 (with and without IOMMU) and non-direct mapped DomUs.
>>
>> Please note the following limitations:
>> - The extended region feature is only supported for 64-bit domain.
>> - The ACPI case is not covered.
>>
>> Also please note that we haven't figured out yet how to properly
>> extend the Xen hypervisor device-tree bindings on Arm (either via new
>> compatible or via new property). I decided to go with new property
>> for now, but this can be changed. This uncertainty is the main reason
>> why this series is marked as RFC.
>
> Sorry, I messed up the device tree binding's purpose here.
>
> New DT property "extended-region" (to inform guest about the presence 
> of additional regions in "reg" property) is not really needed. Guest 
> can simply infer that from the number of regions
> in "reg" property (region 0 - reserved for grant table space, regions 
> 1...n - extended regions).
> Instead, new compatible/property will be needed (but only after this 
> patch [1] or alternative goes in) to indicate that "region 0 is safe 
> to use". Until this patch is merged it is
> not safe to use extended regions for the grant table space.
>
> Thanks to Julien for clarifying these bits.
>
> I am going to remove the advertisement of unneeded "extended-region" 
> property in the code and send new version soon.

I have just pushed new version [1]. Please ignore this one. Sorry for 
the inconvenience.

[1] 
https://lore.kernel.org/xen-devel/1631297924-8658-1-git-send-email-olekstysh@gmail.com/


-- 
Regards,

Oleksandr Tyshchenko


