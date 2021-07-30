Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A3E3DB218
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 06:12:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162274.297655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Jrd-0003hB-Jo; Fri, 30 Jul 2021 04:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162274.297655; Fri, 30 Jul 2021 04:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9Jrd-0003dr-G4; Fri, 30 Jul 2021 04:11:13 +0000
Received: by outflank-mailman (input) for mailman id 162274;
 Fri, 30 Jul 2021 04:11:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cAuf=MW=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m9Jrc-0003dl-EL
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 04:11:12 +0000
Received: from mail-pl1-x634.google.com (unknown [2607:f8b0:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14905161-5a1c-4c93-bb7f-1d79a741d9fc;
 Fri, 30 Jul 2021 04:11:11 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id e21so9528002pla.5
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jul 2021 21:11:11 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:18:efec::4b1])
 by smtp.gmail.com with ESMTPSA id
 s7sm418969pfk.12.2021.07.29.21.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 21:11:10 -0700 (PDT)
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
X-Inumbo-ID: 14905161-5a1c-4c93-bb7f-1d79a741d9fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qJu6CB2LN4QTrxCEOBdOuFEubSp0osjxUw486lmLCCE=;
        b=ZDBlqPk7rrZwfBnBjR5AX1bDAs/03F78a8y9TTalCyS6aeo4BVkIxfh1ObzxANaAgE
         HW8wbFpOlmHwbaCPm5cRL/enrnPzB27Dnubwd4H3F+8zFrVlyM1Smb2LawbtRzGY3LRC
         Gb93dNjedTrLXFAZ6ab+LBvUZZSxiYikb+dLVy6ty9M5d/daHgOsw8Q+y0rAzywv5rJ1
         9vUlTT3Rv5WnELmp/i+W4sb7zRlI3Awvh+AERZBSYUZe0JKeGzcixyqH3H8gStqkO4Ji
         /TjYveizM/zetfPUG8Kk34aKNf2XAzZdOlHSD7bm+KS1YwZA/iLQszfwSj+JpCnElXrL
         5VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qJu6CB2LN4QTrxCEOBdOuFEubSp0osjxUw486lmLCCE=;
        b=dwbLIPFjjtwZxNBpFkr6OFAMEjr+MCj8InYrnSUSR1gLnTzGlNY6MDHzelhUrJkQ34
         qFzjpa7mnwV0UOZj6FsmqZzy3XWFmaJpTH/wXquGR3mNCSm9upoP+XRqJy8o+DpzT421
         yVvg4Gh6mJD6iOVnJVIWcCCUnPV8sOsra6wfP8tRaiM6azJPo2qsnA1715DvldH6jiGN
         qeciBH7LSwzmPokmmDGZmHcDFqurkNTkgxuqCqlyyB+W5ZNeMzam2cbY+Ne4tNC+HfiS
         ILA2eOdVxsxkddNRd8R9rtRl2oe2aEgn4Et6Zxx8/LgPprq7UDs8H8nUQTHeNNwR1gn0
         i4Fw==
X-Gm-Message-State: AOAM530jKr3N1hsG0gn/ZIrYlMnZXLue02vRcPDTU+PRiaYB3jvNt467
	e0IofyKFUv9BO3ocyARIu38=
X-Google-Smtp-Source: ABdhPJz3KIEE78AyymdsWAIZFHiwRfrHYC57wifeuRqjNg3M8sSkO4co7S92ZJfiJ7qm9o4/XVu3Vw==
X-Received: by 2002:a17:90a:b795:: with SMTP id m21mr872416pjr.143.1627618270672;
        Thu, 29 Jul 2021 21:11:10 -0700 (PDT)
Subject: Re: [PATCH 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 joro@8bytes.org, will@kernel.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
 rientjes@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
 linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, anparri@microsoft.com
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-11-ltykernel@gmail.com> <YQLXYVaWWdBfF7Sm@fedora>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <7afbbc7f-8f02-ca6c-0c8c-bbf01fae70ea@gmail.com>
Date: Fri, 30 Jul 2021 12:10:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQLXYVaWWdBfF7Sm@fedora>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Konrad:
      Thanks for your review.

On 7/30/2021 12:29 AM, Konrad Rzeszutek Wilk wrote:
>> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
>> index 1fa81c096c1d..6866e5784b53 100644
>> --- a/kernel/dma/swiotlb.c
>> +++ b/kernel/dma/swiotlb.c
>> @@ -194,8 +194,13 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
>>   		mem->slots[i].alloc_size = 0;
>>   	}
>>   
>> -	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
>> -	memset(vaddr, 0, bytes);
>> +	mem->vaddr = dma_map_decrypted(vaddr, bytes);
>> +	if (!mem->vaddr) {
>> +		pr_err("Failed to decrypt memory.\n");
> I am wondering if it would be worth returning an error code in this
> function instead of just printing an error?

Yes, this is good idea and will update in the next version.

> 
> For this patch I think it is Ok, but perhaps going forward this would be
> better done as I am thinking - is there some global guest->hyperv
> reporting mechanism so that if this fails - it ends up being bubbled up
> to the HyperV console-ish?

Hyper-V has such panic page report mechanism. Guest can pass one page 
log to host during crash.


