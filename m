Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7FD3ED93A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 16:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167374.305509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFdws-0006XP-36; Mon, 16 Aug 2021 14:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167374.305509; Mon, 16 Aug 2021 14:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFdwr-0006Ub-W3; Mon, 16 Aug 2021 14:50:45 +0000
Received: by outflank-mailman (input) for mailman id 167374;
 Mon, 16 Aug 2021 14:50:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A//C=NH=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mFdwq-0006UV-4g
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 14:50:44 +0000
Received: from mail-pj1-x102c.google.com (unknown [2607:f8b0:4864:20::102c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e832a7e2-0f12-4a21-b720-5f2eb6752c42;
 Mon, 16 Aug 2021 14:50:43 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id j1so26907623pjv.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Aug 2021 07:50:43 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 z2sm6264141pgb.33.2021.08.16.07.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 07:50:41 -0700 (PDT)
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
X-Inumbo-ID: e832a7e2-0f12-4a21-b720-5f2eb6752c42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WJWFiW1tNTGnEXAY83sW/96pfLutJ+nc92p/dxWLkZg=;
        b=NXbT1zLrDuMqskh2PkrXNK2vbCTKyrRJCbfTY5Bly9fYQ/XU0SfRcVq5Opg7hJuYPq
         WAHFOfTPq1K1gGqDqCEl7LfXOVRnVK+Trx+MMYCG7OPlcmQ484293t+hm2eNoNgWwPWn
         FMa4FwwJpv6nh2ij8bhxvHhBGoaIurIFplj7wnpKTSuRMnyldRdPcAWWcSmd+W7oZuoa
         90O5BmPR7Iyg7k9vnQyRNKKQWgQWCvIDkqkqBKagNtE87pOxDe8b9ZAS8kRj2RhhMem8
         RcODv8S8rQQKapLBdjj/yipP4YK2d1vrMKq6Wk4vAH1jeB7D9R7aSg32dzMV4dgTGHNn
         cHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WJWFiW1tNTGnEXAY83sW/96pfLutJ+nc92p/dxWLkZg=;
        b=dI6ceklrMV/1G6CTROJyU2q3pAe9i4fTl4ZRQTgfDhRkDHBt0s1kx9fwrNFflK22Kq
         irXDa7PntpNr3jipsuDWWwKF+Tl9uN9PuqBcH/cgGd3YGx4wLhebPoBIv81BXtPcU36I
         5C3rErQ/gubNb04EOTZNucMOD1Y/cKZEOVmx/REkKxOIWa9eyLNI1kUZ1y+8fBpckvto
         jYrEsU/8bVasicMxzk9jg7g1ZU+7YF7b4yqeH8kwvwp/2qAhrUwVLKMaTWpEfcOicaoU
         eGxX2EnKjGqjd6cj5veEiOMGYU0KywKf6yXIhorsbmykhYlIM2KfKlzblNnKd9nvTkT8
         tkdQ==
X-Gm-Message-State: AOAM531s9yVllHjhrDkWz6HCKDWO3WcvtiewB0c9hq0EcMEwZvNinPMR
	l3UrzIH3ZgMT48Jc4IXHa6Y=
X-Google-Smtp-Source: ABdhPJwwGaWbF5lMH7zWG8CjOdMFhlJFveeUXJRyURV3wu36AAVQm0z4EMghAqWltWQj3nIzdJtriw==
X-Received: by 2002:a17:90b:3014:: with SMTP id hg20mr17976900pjb.140.1629125442297;
        Mon, 16 Aug 2021 07:50:42 -0700 (PDT)
Subject: Re: [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
From: Tianyu Lan <ltykernel@gmail.com>
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
Message-ID: <890e5e21-714a-2db6-f68a-6211a69bebb9@gmail.com>
Date: Mon, 16 Aug 2021 22:50:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d18ae061-6fc2-e69e-fc2c-2e1a1114c4b4@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 8/14/2021 1:58 AM, Tianyu Lan wrote:
> On 8/12/2021 8:27 PM, Christoph Hellwig wrote:
>> This is still broken.  You need to make sure the actual DMA allocations
>> do have struct page backing.
>>
> 
> Hi Christoph:
>       swiotlb_tbl_map_single() still returns PA below vTOM/share_gpa_ > boundary. These PAs has backing pages and belong to system memory.
> In other word, all PAs passed to DMA API have backing pages and these is 
> no difference between Isolation guest and traditional guest for DMA API.
> The new mapped VA for PA above vTOM here is just to access the bounce 
> buffer in the swiotlb code and isn't exposed to outside.

Hi Christoph:
       Sorry to bother you.Please double check with these two patches
" [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap function 
for HV IVM" and "[PATCH V3 09/13] DMA: Add dma_map_decrypted/dma_
unmap_encrypted() function".
       The swiotlb bounce buffer in the isolation VM are allocated in the
low end memory and these memory has struct page backing. All dma address
returned by swiotlb/DMA API are low end memory and this is as same as 
what happen in the traditional VM.So this means all PAs passed to DMA 
API have struct page backing. The difference in Isolation VM is to 
access bounce buffer via address space above vTOM/shared_guest_memory
_boundary. To access bounce buffer shared with host, the guest needs to
mark the memory visible to host via hypercall and map bounce buffer in 
the extra address space(PA + shared_guest_memory_boundary). The vstart
introduced in this patch is to store va of extra address space and it's 
only used to access bounce buffer in the swiotlb_bounce(). The PA in 
extra space is only in the Hyper-V map function and won't be passed to 
DMA API or other components.
       The API dma_map_decrypted() introduced in the patch 9 is to map 
the bounce buffer in the extra space and these memory in the low end 
space are used as DMA memory in the driver. Do you prefer these APIs
still in the set_memory.c? I move the API to dma/mapping.c due to the
suggested name arch_dma_map_decrypted() in the previous mail
(https://lore.kernel.org/netdev/20210720135437.GA13554@lst.de/).
       If there are something unclear, please let me know. Hope this
still can catch the merge window.

Thanks.





