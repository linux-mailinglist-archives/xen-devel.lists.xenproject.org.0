Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F395445C6C2
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 15:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230446.398346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpswG-000266-H6; Wed, 24 Nov 2021 14:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230446.398346; Wed, 24 Nov 2021 14:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpswG-000247-Dz; Wed, 24 Nov 2021 14:07:56 +0000
Received: by outflank-mailman (input) for mailman id 230446;
 Wed, 24 Nov 2021 14:07:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GIsr=QL=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mpswE-000241-BH
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 14:07:54 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9e3f156-4d2f-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 15:07:53 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so5165468pjb.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 06:07:53 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 g5sm4694513pjt.15.2021.11.24.06.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 06:07:51 -0800 (PST)
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
X-Inumbo-ID: e9e3f156-4d2f-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=syp/sAx1WBqbnIsfqrbBbnU7pLQsZBgXpQdqrXqrl38=;
        b=iecLeo1CCg8zt+sCXUOh364DhRhAV/Ar/v0CTPnIw92trVIyH4qvDLyLNdAiBMXH4T
         y+0BfWQ61+rOjIQbdKy9swqEYsMOae4eIFV1313ZNnDT1Lbv+aQO2IbYTdrbWOvmPEQu
         KlSl5yD8YP31w1z8kq/HaASDcSvcnIEnzDtL5YgUuswZfXpPxYfhz71mw789p88NP4MI
         rs74u4gMJh8nMwRq/chOwPKzLo9eH4bM7b5lm+1o85GlnoBeIlU+U2qG0z31u0KruJlF
         tO4ST89te9GQQvoWvoAHX2ms15JvNlQ1QJuyCl7nZWEUc1aTjDEBcKPhZNHdIMGNmbVg
         pbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=syp/sAx1WBqbnIsfqrbBbnU7pLQsZBgXpQdqrXqrl38=;
        b=u3urqOlgbpz11IeFi9rX5Mtf8H6LuTwPQNgCO4wNFlyTBLabGHNqolzgTkJJWaxiQs
         /4OkZk0ONVC08J85ss8fDgiLkj6RxCyxJk9q8NuBDHYEfwTmEI210qhLdgU1XYR2RAEz
         5z+N5LDMGDhfGQw45boLJGcmpaoxDoh9XpaFCBgR6jVDQXSS2P+Bok9Q7hISaimjzoKu
         PA1HSSHfILoEkpehiUR0c9ZyK/d6/sk4x/GpLDiN0LWTyVVbS9GDHLO+cekhAaCjrfH2
         suEa4FRGeFhcBn8jJ3Jj7KE7XTgXuAnY4HDeLlg2TqeO8aZpj2DOBBPTlbIBJoRzj+cE
         7dFw==
X-Gm-Message-State: AOAM532/q9rPXUKpIqAX4HbA0hUSNg5+J8wwul+isudW4wewYU6Oncbm
	Zjv35Aoi7us1jKNTZs6lhRU=
X-Google-Smtp-Source: ABdhPJxcvy1hEASS+ae7P9Zr40fMPVIge5ooMequB2zH2fg19BpSdiMXmZRAmprhgB5OLHpbaYCO2A==
X-Received: by 2002:a17:902:b581:b0:144:e601:de7 with SMTP id a1-20020a170902b58100b00144e6010de7mr19054433pls.71.1637762871786;
        Wed, 24 Nov 2021 06:07:51 -0800 (PST)
Message-ID: <887d57bc-8b1a-48ab-be72-17144791334a@gmail.com>
Date: Wed, 24 Nov 2021 22:07:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH V2 1/6] Swiotlb: Add Swiotlb bounce buffer remap function
 for HV IVM
Content-Language: en-US
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Christoph Hellwig <hch@lst.de>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>, "brijesh.singh@amd.com"
 <brijesh.singh@amd.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 KY Srinivasan <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211123143039.331929-1-ltykernel@gmail.com>
 <20211123143039.331929-2-ltykernel@gmail.com>
 <MWHPR21MB1593169593AD833A91DF553FD7609@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <MWHPR21MB1593169593AD833A91DF553FD7609@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michael:
	Thanks for your review.

On 11/24/2021 1:15 AM, Michael Kelley (LINUX) wrote:
>> @@ -172,7 +200,14 @@ void __init swiotlb_update_mem_attributes(void)
>>   	vaddr = phys_to_virt(mem->start);
>>   	bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
>>   	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
>> -	memset(vaddr, 0, bytes);
>> +
>> +	mem->vaddr = swiotlb_mem_remap(mem, bytes);
>> +	if (!mem->vaddr) {
>> +		pr_err("Fail to remap swiotlb mem.\n");
>> +		return;
>> +	}
>> +
>> +	memset(mem->vaddr, 0, bytes);
>>   }


> In the error case, do you want to leave mem->vaddr as NULL?  Or is it
> better to leave it as the virtual address of mem-start?  Your code leaves it
> as NULL.
> 
> The interaction between swiotlb_update_mem_attributes() and the helper
> function swiotlb_memo_remap() seems kind of clunky.  phys_to_virt() gets called
> twice, for example, and two error messages are printed.  The code would be
> more straightforward by just putting the helper function inline:
> 
> mem->vaddr = phys_to_virt(mem->start);
> bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
> set_memory_decrypted((unsigned long)(mem->vaddr), bytes >> PAGE_SHIFT);
> 
> if (swiotlb_unencrypted_base) {
> 	phys_addr_t paddr = mem->start + swiotlb_unencrypted_base;
> 
> 	mem->vaddr = memremap(paddr, bytes, MEMREMAP_WB);
> 	if (!mem->vaddr) {
> 		pr_err("Failed to map the unencrypted memory %llx size %lx.\n",
> 			       paddr, bytes);
> 		return;
> 	}
> }
> 
> memset(mem->vaddr, 0, bytes);
> 
> (This version also leaves mem->vaddr as NULL in the error case.)

 From Christoph's previous suggestion, there should be a well-documented 
wrapper to explain the remap option and so I split the code. leaving the 
virtual address of mem-start is better.

https://lkml.org/lkml/2021/9/28/51

> 
>>   static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
>> @@ -196,7 +231,18 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
>>   		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
>>   		mem->slots[i].alloc_size = 0;
>>   	}
>> +
>> +	/*
>> +	 * If swiotlb_unencrypted_base is set, the bounce buffer memory will
>> +	 * be remapped and cleared in swiotlb_update_mem_attributes.
>> +	 */
>> +	if (swiotlb_unencrypted_base)
>> +		return;
>> +
>> +	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
> Prior to this patch, and here in the new version as well, the return value from
> set_memory_decrypted() is ignored in several places in this file.  As previously
> discussed, swiotlb_init_io_tlb_mem() is a void function, so there's no place to
> return an error. Is that OK?

Yes, the original code doesn't check the return value and so keep the 
rule。

Christoph, Could you help to check which way do you prefer?



