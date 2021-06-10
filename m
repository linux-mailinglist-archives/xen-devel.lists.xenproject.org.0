Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263D93A2DCC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 16:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139917.258613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLRN-0004RV-WE; Thu, 10 Jun 2021 14:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139917.258613; Thu, 10 Jun 2021 14:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLRN-0004PG-SE; Thu, 10 Jun 2021 14:13:49 +0000
Received: by outflank-mailman (input) for mailman id 139917;
 Thu, 10 Jun 2021 14:13:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cwq8=LE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lrLRM-0004P7-Tg
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 14:13:48 +0000
Received: from mail-pf1-x42d.google.com (unknown [2607:f8b0:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71edec09-84c6-4be8-85ac-946ad95a7d8e;
 Thu, 10 Jun 2021 14:13:48 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id k15so1731675pfp.6
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jun 2021 07:13:48 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 h12sm3035510pgn.54.2021.06.10.07.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:13:46 -0700 (PDT)
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
X-Inumbo-ID: 71edec09-84c6-4be8-85ac-946ad95a7d8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uVvPHfIwriaeCqaGS4SWF2JfjGEeCNMTseqgcHKL0PY=;
        b=ot0iffXK2/znAlvDWUx0DvEHPs9Hu42jQhvk3aHGx+T2NhWFpnwKA1vIkYGIy+cgYb
         LxEbfgCrbULtFd7nVuJsfQAH+IMqZIL2R35dwiAl9sJZz1GKTswJr7viHRHzd8ec6z9L
         cpBdHTN6hAjfnZCW/MdapYStRdZ2pSAmS2zSYAlKj+wqby1v1sKfa0Z3IJGU1Q2S8YcP
         HqfC/opPsY22Z36tiTPSUNG8yLuAg9Bq77HzKuJDM2mT1cANyfp9SOlXy6wpSwett2B6
         yucBibCk75zJ2NzA/8lMhfuq11vR41IllnpzmIyKLTH/P3wGLWQCIUfWmxQ4zGD/3HTx
         tacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uVvPHfIwriaeCqaGS4SWF2JfjGEeCNMTseqgcHKL0PY=;
        b=iob7/ic0gVDR6PsMSqFr3mZZqe+mzcYj+nuJzEKn8N3n75udjDk3HLlXGnETA548XQ
         9LfqRKbvkLYe+SFLMHVphQE6edexwYwjbr4K5+rLg39KF1UfrXfRL8yqkl4hsPXSO8HO
         /smBhWiqlxAIX8a3ZFBrffH5L6c3yKz4YfTtt9qjkaSf0BjDZM5f3PE8VTt85ZmPStSU
         h8m9Xfq0ayg9dL3CxP76IXW0HJEugLXWljN3ynim+Mf4urb2TfFymOryarM+tBBZZO6L
         7WIcv7s6tZVF2uNiQJl7OEYVqXIpNQQLtxa1mwoLSLJqBtDzOsGjMlRlxI/bXtKLQG66
         wklw==
X-Gm-Message-State: AOAM531MKnzjyqlPOPHTRVpXcpleiAs4DjjIhi3rnr6q4kxEgExngvJp
	PFTUGlc87Z1AfmamJEjpgOU=
X-Google-Smtp-Source: ABdhPJz4FYgWX1XRVYnd1fLznm93BCcmg2/a4wkuQ7x2l90mgEwjIr25Q5mcrDlHBGTMoQXHYCH6CA==
X-Received: by 2002:a05:6a00:2353:b029:2f2:987a:5da2 with SMTP id j19-20020a056a002353b02902f2987a5da2mr3220673pfj.58.1623334427380;
        Thu, 10 Jun 2021 07:13:47 -0700 (PDT)
Subject: Re: [RFC PATCH V3 01/11] x86/HV: Initialize GHCB page in Isolation VM
To: Joerg Roedel <joro@8bytes.org>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-2-ltykernel@gmail.com> <YMC2RSr/J1WYCvtz@8bytes.org>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <c9a7eaa8-a8b3-3ed3-c52c-7a2cea3c95bc@gmail.com>
Date: Thu, 10 Jun 2021 22:13:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMC2RSr/J1WYCvtz@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Joerg：
	Thanks for your review.


On 6/9/2021 8:38 PM, Joerg Roedel wrote:
> On Sun, May 30, 2021 at 11:06:18AM -0400, Tianyu Lan wrote:
>> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>>
>> Hyper-V exposes GHCB page via SEV ES GHCB MSR for SNP guest
>> to communicate with hypervisor. Map GHCB page for all
>> cpus to read/write MSR register and submit hvcall request
>> via GHCB.
>>
>> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
>> ---
>>   arch/x86/hyperv/hv_init.c       | 60 ++++++++++++++++++++++++++++++---
>>   arch/x86/include/asm/mshyperv.h |  2 ++
>>   include/asm-generic/mshyperv.h  |  2 ++
>>   3 files changed, 60 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
>> index bb0ae4b5c00f..dc74d01cb859 100644
>> --- a/arch/x86/hyperv/hv_init.c
>> +++ b/arch/x86/hyperv/hv_init.c
>> @@ -60,6 +60,9 @@ static int hv_cpu_init(unsigned int cpu)
>>   	struct hv_vp_assist_page **hvp = &hv_vp_assist_page[smp_processor_id()];
>>   	void **input_arg;
>>   	struct page *pg;
>> +	u64 ghcb_gpa;
>> +	void *ghcb_va;
>> +	void **ghcb_base;
> 
> Any reason you can't reuse the SEV-ES support code in the Linux kernel?
> It already has code to setup GHCBs for all vCPUs.
> 
> I see that you don't need #VC handling in your SNP VMs because of the
> paravisor running underneath it, but just re-using the GHCB setup code
> shouldn't be too hard.
> 

Thanks for your suggestion. I will have a try to use SEV-ES code.


