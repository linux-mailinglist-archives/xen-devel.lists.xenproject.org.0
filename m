Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A368640D80A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 12:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188366.337507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQp5F-0002ng-QF; Thu, 16 Sep 2021 10:57:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188366.337507; Thu, 16 Sep 2021 10:57:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQp5F-0002lt-Mz; Thu, 16 Sep 2021 10:57:37 +0000
Received: by outflank-mailman (input) for mailman id 188366;
 Thu, 16 Sep 2021 10:57:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AVhn=OG=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mQp5E-0002ln-7N
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 10:57:36 +0000
Received: from mail-pf1-x431.google.com (unknown [2607:f8b0:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08f3daf8-3b79-46e6-a20e-bd1c8b913bd2;
 Thu, 16 Sep 2021 10:57:35 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id y8so5495284pfa.7
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 03:57:35 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 n141sm2856237pfd.90.2021.09.16.03.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 03:57:34 -0700 (PDT)
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
X-Inumbo-ID: 08f3daf8-3b79-46e6-a20e-bd1c8b913bd2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zetJ5G0LMyibhhBY6/35VWLw2vAGWh3kCNdD5BxkSZI=;
        b=Iq+3mvGj2jY0H1hK5L2+2LJkiT3nS6liFloV8Frq8+FJ3Y0LxB2A38VNCla7awjuhj
         Q3Cl5qmmvoV1YWOZQweI486bIgofq+t3jwjAQ3GGQ1BTx00wXTwDzZt3wO26vvMZXlEU
         Srw78VlxUG3ClRIenDB9DS9KklBz8Gy2Kt0AIAheRW83PteD9N403WMbpA39HXJuq8IF
         JiYUmg4zDGjeRBVLjEF25+aPcjKe8oOTUL3KuuMaaLo1G4aP3SLUOfZT+6b94AvHMe5Q
         tcf8/9xlWcz7WQzaFSNkMRaXjJszFIpx0K2ojEu+E4bzhBM/xSgQmOnlb5Oz/8Q8cN9d
         Qp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zetJ5G0LMyibhhBY6/35VWLw2vAGWh3kCNdD5BxkSZI=;
        b=WxfeuD+9X0GjDejHmTNoMGqGRZ703w+G0LNIRmNKO2ez6KSfZBtc4tybKZSwXcOyr1
         sov8Di1Ubk/WQk2+84uCkwFyFtGXHgZTENl3dC4SQc2/yn5/2KoXyN4g+bg3tQ56bCEd
         WLmTokYw+4mtCwwyA1bww8N8AHff3czR8gkF+Ku4Y7uHupz/g0e4Gzq7oDQL1i1+MwNl
         dxyUplPXTBoBba5ULW6dFTUNQX/eU5U0X1aCNAQoBW+sk0UgUar9T+Hewc+1QxZb5e66
         mUBAWZafjSEXUBovXsTsRVi9JxSn75WFYgfZrV/N2AzctiS9WJYY5OZrSBtlS8mNc6SZ
         3M4Q==
X-Gm-Message-State: AOAM533OVY4mSYDkft7HRiZMBmZ6sWezgN+itOeLas+xBwj/4vEN4qJw
	U8ftYbjrVdRu+1h0G0YELKU=
X-Google-Smtp-Source: ABdhPJyJnHqPNf+opjGA7LpPgHFY6nzsERWLwilu6XCHi7kaSPNw+MpELyJKztS12zzhPWoDpdap2Q==
X-Received: by 2002:aa7:959a:0:b0:43b:adeb:ef58 with SMTP id z26-20020aa7959a000000b0043badebef58mr4426857pfj.19.1631789854486;
        Thu, 16 Sep 2021 03:57:34 -0700 (PDT)
Subject: Re: [PATCH V5 09/12] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
To: Michael Kelley <mikelley@microsoft.com>, KY Srinivasan
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>, "will@kernel.org" <will@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "hch@lst.de" <hch@lst.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "pgonda@google.com" <pgonda@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>,
 "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
 "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "saravanand@fb.com" <saravanand@fb.com>,
 "krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "tj@kernel.org" <tj@kernel.org>, "rientjes@google.com" <rientjes@google.com>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>
References: <20210914133916.1440931-1-ltykernel@gmail.com>
 <20210914133916.1440931-10-ltykernel@gmail.com>
 <MWHPR21MB159349234C15D0F04F87845CD7DB9@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <3f6a6407-b8fd-803b-e4fe-ea9a873a5840@gmail.com>
Date: Thu, 16 Sep 2021 18:57:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB159349234C15D0F04F87845CD7DB9@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/15/2021 11:42 PM, Michael Kelley wrote:
>> @@ -196,13 +199,34 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
>>   		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
>>   		mem->slots[i].alloc_size = 0;
>>   	}
>> +
>> +	if (set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT))
>> +		return -EFAULT;
>> +
>> +	/*
>> +	 * Map memory in the unencrypted physical address space when requested
>> +	 * (e.g. for Hyper-V AMD SEV-SNP Isolation VMs).
>> +	 */
>> +	if (swiotlb_unencrypted_base) {
>> +		phys_addr_t paddr = __pa(vaddr) + swiotlb_unencrypted_base;
> Nit:  Use "start" instead of "__pa(vaddr)" since "start" is already the needed
> physical address.


Yes, "start" should be used here.

> 
>> @@ -304,7 +332,7 @@ int
>>   swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>>   {
>>   	struct io_tlb_mem *mem = &io_tlb_default_mem;
>> -	unsigned long bytes = nslabs << IO_TLB_SHIFT;
>> +	int ret;
>>
>>   	if (swiotlb_force == SWIOTLB_NO_FORCE)
>>   		return 0;
>> @@ -318,8 +346,9 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
>>   	if (!mem->slots)
>>   		return -ENOMEM;
>>
>> -	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
>> -	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
>> +	ret = swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
>> +	if (ret)
> Before returning the error, free the pages obtained from the earlier call
> to __get_free_pages()?
> 

Yes, will fix.

Thanks.

