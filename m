Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3FF3F16E9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 11:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168489.307627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGepU-0004hc-Sc; Thu, 19 Aug 2021 09:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168489.307627; Thu, 19 Aug 2021 09:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGepU-0004fS-PB; Thu, 19 Aug 2021 09:59:20 +0000
Received: by outflank-mailman (input) for mailman id 168489;
 Thu, 19 Aug 2021 09:59:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM9U=NK=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mGepS-0004fM-TL
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 09:59:18 +0000
Received: from mail-pj1-x1035.google.com (unknown [2607:f8b0:4864:20::1035])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b97f455f-909c-44c5-be40-10289af22179;
 Thu, 19 Aug 2021 09:59:18 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso10954588pjb.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Aug 2021 02:59:18 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 p24sm2697989pff.161.2021.08.19.02.59.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 02:59:16 -0700 (PDT)
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
X-Inumbo-ID: b97f455f-909c-44c5-be40-10289af22179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DtRnMoZnz8ASe+6YEYHxKI9ebqeYiuiGyG8rZ+bU7W8=;
        b=e343ePw9FQBl3OmT4CjV4LRITbC1d6hYo+qRgo8O4g8DDiM0SXgUjKDzINrKBOdPuD
         16no3rFQBxZjEOjFpmVKbvGS3ZfHA34iGMzVP0GUuGwXxQcavGar4tq9NUO4BYQKL/fr
         +IcuileX2Ofw9lJAzZQDVNiSgg1ae4c7il80Ygl7Z/hArsq9NmfC57xbUCxKi+8x3zUf
         +2HPq01a+R9VEwnfGBnJGrLBlpiAjunOOPLv4ZoA/DAFfCnCqMOcoGxM88wGuVAJptCS
         RhIs91rvHPz+nEa9mRAXOsXqj+K3ODhUvtqP1kKQfDBVLC2qUMGw6g7AIb4+VxGalL4b
         xg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DtRnMoZnz8ASe+6YEYHxKI9ebqeYiuiGyG8rZ+bU7W8=;
        b=Nh7a2lzH74Ff5eGwU8gH4VJs2Or90c65DUAl1zkzJizg2gF/VXWAq1vGrW5w/tIM0Q
         cJQPU4Gv8k1vVcZPTlf3W9N/NaRstjnGCXByi+d56FWdByXFYoWNg/kesMe4VhXaQb5q
         VidZdkE68mAVL4IsqcwwO0T3rpcr4UH+n3Zqv+I60MrH0Oz4s6j3iCE4/xH3YLbitJbU
         fo1RTQa6gUeM2hrlAFY0kK5wd3nnViYf8cEsLL5bDmakco9AsIpSlUrN4rH+oyzs1uCL
         0cMMYi7F3JM9n6cUhU3h4H4wvSX5aqemtZYO0v54/yI012iaQ8av9ca5wLXTorCM87P3
         b3YQ==
X-Gm-Message-State: AOAM531V80yTT2uxvE5ehEbYUYqUsCR//P5NVOhPV4W3zoKmx142Jroo
	sJjCfP9htRwy7zxNXLxjto4=
X-Google-Smtp-Source: ABdhPJxqSXdosZ9pc3k976d6RTkMk29F0RsgVn3Hn0/Mju7aILj/ApNHDMVBQRT0TOZLXDLJbYbMUw==
X-Received: by 2002:a17:90a:8905:: with SMTP id u5mr13892030pjn.95.1629367157291;
        Thu, 19 Aug 2021 02:59:17 -0700 (PDT)
Subject: Re: [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, thomas.lendacky@amd.com, brijesh.singh@amd.com,
 ardb@kernel.org, Tianyu.Lan@microsoft.com, pgonda@google.com,
 martin.b.radev@gmail.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, sfr@canb.auug.org.au,
 saravanand@fb.com, krish.sadhukhan@oracle.com, aneesh.kumar@linux.ibm.com,
 xen-devel@lists.xenproject.org, rientjes@google.com, hannes@cmpxchg.org,
 tj@kernel.org, michael.h.kelley@microsoft.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 parri.andrea@gmail.com, dave.hansen@intel.com
References: <20210809175620.720923-1-ltykernel@gmail.com>
 <20210809175620.720923-11-ltykernel@gmail.com>
 <20210812122741.GC19050@lst.de>
 <d18ae061-6fc2-e69e-fc2c-2e1a1114c4b4@gmail.com>
 <890e5e21-714a-2db6-f68a-6211a69bebb9@gmail.com>
 <20210819084951.GA10461@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <1c5ae861-2c35-2ef5-e764-db45bbcb88a9@gmail.com>
Date: Thu, 19 Aug 2021 17:59:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210819084951.GA10461@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/19/2021 4:49 PM, Christoph Hellwig wrote:
> On Mon, Aug 16, 2021 at 10:50:26PM +0800, Tianyu Lan wrote:
>> Hi Christoph:
>>        Sorry to bother you.Please double check with these two patches
>> " [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap function
>> for HV IVM" and "[PATCH V3 09/13] DMA: Add dma_map_decrypted/dma_
>> unmap_encrypted() function".
> 
> Do you have a git tree somewhere to look at the whole tree?

Yes, here is my github link for these two patches.

https://github.com/lantianyu/linux/commit/462f7e4e44644fe7e182f7a5fb043a75acb90ee5

https://github.com/lantianyu/linux/commit/c8de236bf4366d39e8b98e5a091c39df29b03e0b

> 
>>        The swiotlb bounce buffer in the isolation VM are allocated in the
>> low end memory and these memory has struct page backing. All dma address
>> returned by swiotlb/DMA API are low end memory and this is as same as what
>> happen in the traditional VM.
> 
> Indeed.
> 
>>        The API dma_map_decrypted() introduced in the patch 9 is to map the
>> bounce buffer in the extra space and these memory in the low end space are
>> used as DMA memory in the driver. Do you prefer these APIs
>> still in the set_memory.c? I move the API to dma/mapping.c due to the
>> suggested name arch_dma_map_decrypted() in the previous mail
>> (https://lore.kernel.org/netdev/20210720135437.GA13554@lst.de/).
> 
> Well, what would help is a clear description of the semantics.
> 

Yes, I will improve description.


