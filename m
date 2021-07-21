Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD13D120F
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 17:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159429.293271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Dsv-0006xZ-FE; Wed, 21 Jul 2021 15:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159429.293271; Wed, 21 Jul 2021 15:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Dsv-0006vJ-C9; Wed, 21 Jul 2021 15:11:45 +0000
Received: by outflank-mailman (input) for mailman id 159429;
 Wed, 21 Jul 2021 15:11:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcFV=MN=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1m6Dsu-0006vD-36
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 15:11:44 +0000
Received: from mail-pl1-x62b.google.com (unknown [2607:f8b0:4864:20::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92d7610d-58fd-441c-ac4c-3f7402d3799d;
 Wed, 21 Jul 2021 15:11:43 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id u3so1103279plf.5
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jul 2021 08:11:42 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 j6sm23210086pji.23.2021.07.21.08.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 08:11:41 -0700 (PDT)
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
X-Inumbo-ID: 92d7610d-58fd-441c-ac4c-3f7402d3799d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=D1h2d+g+iMU4/jGzVM3W4ntrau1j74+yLE1tV8PoAic=;
        b=JudKBwJXYhQRbS+X/S9haoQpA4vJDhCumYWHOc7uZasKxl1Q15/54S3UgtA5DU2MnM
         lzw3uMGa0951XioyMj3JRFDtKLLdbQZHKtkmzd142ej6G99ZpSQbf4pbYKJMHmvy2Mvg
         n+IsgH/Gi14qKpxeEr/tuJjCd3FpmXh2SNA8p3U4jEKfIwjxFSccYMGg+ONArMU/Wu6E
         XfXZg/05bIatm0Sic/3vAKBQLh3YqfKOOK2+BKsvSUdJLbF0e9ivPdg52QOQvmKU+WWe
         jjv9l41sek6SngfQtz7UvvRRFhkx72h8LHByGOFdzs8RI71z4WB014t9ZJNaOfnnb+nh
         5peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D1h2d+g+iMU4/jGzVM3W4ntrau1j74+yLE1tV8PoAic=;
        b=XPmFnmVz+738vWqc9T8qfE+RE42tIrM8jGD3jJsm24fWzud8afRQWgcob5aoVCkecn
         4HKaYk+IYbd3fZG6lUY2rpCD8TtJQXWOAmyDmEe+ZsKlrwQXIjeEY3vlZQmXikrbp59i
         g1Jk5NDu/lWznnepnt/YLm2TT9X5lKXvJcwX2Yxw1+O2kRtSQX/Aj2f+6Y9K9OY39lal
         98sBKik+Zs6OeFfTDu3+tiQzaFifOOOPPKNA6XlOaHa+0PH3Fkkoug32gqzxK29PyT0c
         gULUGS+eQl/Bonnb9S6iPc/sUWHUYpwtv33/YhLeLfBRNK1UPAnpSvLaHlLm2CAzN46e
         Z2mA==
X-Gm-Message-State: AOAM530jQ5XNy7FQ8vnasxGO6BLPYTUQdBEtkBldnJCLRX5A/agBNkPz
	RyRmYi5GTVaFu6+BACjTmqc=
X-Google-Smtp-Source: ABdhPJx35AxUVV6O398anppLcbEKI32dfRaLuLVMxOpRJ+rodbbxxyqhUxP+qwoyGdOJ7uanWVT8yQ==
X-Received: by 2002:a17:902:db11:b029:12b:4a2e:7ec4 with SMTP id m17-20020a170902db11b029012b4a2e7ec4mr28239454plx.71.1626880302118;
        Wed, 21 Jul 2021 08:11:42 -0700 (PDT)
Subject: Re: [Resend RFC PATCH V4 09/13] x86/Swiotlb/HV: Add Swiotlb bounce
 buffer remap function for HV IVM
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, kirill.shutemov@linux.intel.com,
 akpm@linux-foundation.org, rppt@kernel.org, Tianyu.Lan@microsoft.com,
 thomas.lendacky@amd.com, ardb@kernel.org, robh@kernel.org,
 nramas@linux.microsoft.com, pgonda@google.com, martin.b.radev@gmail.com,
 david@redhat.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, keescook@chromium.org, rientjes@google.com,
 hannes@cmpxchg.org, michael.h.kelley@microsoft.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 brijesh.singh@amd.com, anparri@microsoft.com
References: <20210707154629.3977369-1-ltykernel@gmail.com>
 <20210707154629.3977369-10-ltykernel@gmail.com>
 <20210720135437.GA13554@lst.de>
 <8f1a285d-4b67-8041-d326-af565b2756c0@gmail.com>
 <20210721143355.GA10848@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <0e2ca0e2-201d-68d4-5dc0-7341f8e9106a@gmail.com>
Date: Wed, 21 Jul 2021 23:11:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721143355.GA10848@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/21/2021 10:33 PM, Christoph Hellwig wrote:
> On Wed, Jul 21, 2021 at 06:28:48PM +0800, Tianyu Lan wrote:
>> dma_mmap_attrs() and dma_get_sgtable_attrs() get input virtual address
>> belonging to backing memory with struct page and returns bounce buffer
>> dma physical address which is below shared_gpa_boundary(vTOM) and passed
>> to Hyper-V via vmbus protocol.
>>
>> The new map virtual address is only to access bounce buffer in swiotlb
>> code and will not be used other places. It's stored in the mem->vstart.
>> So the new API set_memory_decrypted_map() in this series is only called
>> in the swiotlb code. Other platforms may replace set_memory_decrypted()
>> with set_memory_decrypted_map() as requested.
> 
> It seems like you are indeed not using these new helpers in
> dma_direct_alloc.  How is dma_alloc_attrs/dma_alloc_coherent going to
> work on these systems?
> 

Current vmbus device drivers don't use dma_alloc_attrs/dma_alloc
_coherent() because vmbus driver allocates ring buffer for all devices. 
Ring buffer has been marked decrypted and remapped in vmbus driver. 
Netvsc and storvsc drivers just need to use  dma_map_single/dma_map_page().




