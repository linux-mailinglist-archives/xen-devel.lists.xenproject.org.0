Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61940B1A8
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 16:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186831.335576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9d8-0003Ge-Tg; Tue, 14 Sep 2021 14:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186831.335576; Tue, 14 Sep 2021 14:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ9d8-0003EB-Qb; Tue, 14 Sep 2021 14:41:50 +0000
Received: by outflank-mailman (input) for mailman id 186831;
 Tue, 14 Sep 2021 14:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2lzK=OE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mQ9d7-0003E5-J5
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 14:41:49 +0000
Received: from mail-pg1-x531.google.com (unknown [2607:f8b0:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe03bd0f-9439-4bae-ab97-c32904d42fbb;
 Tue, 14 Sep 2021 14:41:48 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id n18so12903714pgm.12
 for <xen-devel@lists.xenproject.org>; Tue, 14 Sep 2021 07:41:48 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 w5sm10372503pfu.160.2021.09.14.07.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 07:41:47 -0700 (PDT)
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
X-Inumbo-ID: fe03bd0f-9439-4bae-ab97-c32904d42fbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0tFcS0bgrni7T/UyH5tgM3kB2fvxQVZyvDvr4x9Nn0E=;
        b=UcCCLIQhvZq8Ncnr+BAJoJFu9Ixa/D+XUjmhbU7HIvc+hRj87USaT6BE1yy+iBq9Dg
         QGiVMbGMV+1FXGsEkdF095w1rXTPmXSBy/GzNBUQxpd9dOzN44hTusQVw+uvgN3pUog6
         vEZMdKSx10jM/eMjPmLE/1HA0l7wWv8mmMdUGuhqsKvWo5d9FFKvEl6dUqe0Cmi7wFvc
         IqUUL7XX9h+4FMxeygEw4BAnE8Jjme2tf0Xn3pAOyegWOofflTw3yvlM5BEDZhc2M9rn
         c1s9RDJ0MDor9d8Ut53EaH5xQoqBopBFHh0ewA7REHTL2u6atXEGxwqc8AvAaeBreZaC
         OxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0tFcS0bgrni7T/UyH5tgM3kB2fvxQVZyvDvr4x9Nn0E=;
        b=wM6aL/HKGjipaeiKXnuCRdHNCIG+lf1VacjycBrKNTH6c2B5stQZXhwWcBZM92EOzl
         2OwqBqr1mn8z6Cjpmjyg/CnCEABP0YQnH3fQ1Ajaq7pVcYTnixOJc8GhZ7J4RWFiL3L+
         C/evOOXnLbYJSP5j0WERwYDaypRf8DGwVxATnshrJkng1Sw71fZoj+s6lTXHwbnU9q7O
         OM63kDnZwS2yuAzDfEjAZdy5gHbPNrNXgDtpG95/aHhPVrcmJzctX39JlYnTtW6vmhn7
         PL8uPYx1jgl9nhgEHIrSAUyZoXf++tsB7JQ9I8B0DdMErBgTyvauu4hCnD27M4P353eu
         ff3w==
X-Gm-Message-State: AOAM530S8C5MkKf/D0alXIGU4gSAC7dwykRN1qYq8E3gkzSTvKuy3BHC
	OYZ0Dg0QugwJErKg72QIxnU=
X-Google-Smtp-Source: ABdhPJylfNPyIQEAHW7Jn9/cFbcvLCTICR8qzXoHOEsrI/lcIc/0eSlT+n5cpDvBA5GlFRMw2tbP5w==
X-Received: by 2002:a05:6a00:2405:b0:3e1:9f65:9703 with SMTP id z5-20020a056a00240500b003e19f659703mr5132461pfh.6.1631630507544;
        Tue, 14 Sep 2021 07:41:47 -0700 (PDT)
Subject: Re: [PATCH V4 00/13] x86/Hyper-V: Add Hyper-V Isolation VM support
To: Michael Kelley <mikelley@microsoft.com>, Christoph Hellwig <hch@lst.de>
Cc: KY Srinivasan <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "luto@kernel.org" <luto@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "brijesh.singh@amd.com" <brijesh.singh@amd.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, "pgonda@google.com"
 <pgonda@google.com>, "martin.b.radev@gmail.com" <martin.b.radev@gmail.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 "rppt@kernel.org" <rppt@kernel.org>, "hannes@cmpxchg.org"
 <hannes@cmpxchg.org>, "aneesh.kumar@linux.ibm.com"
 <aneesh.kumar@linux.ibm.com>,
 "krish.sadhukhan@oracle.com" <krish.sadhukhan@oracle.com>,
 "saravanand@fb.com" <saravanand@fb.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "rientjes@google.com" <rientjes@google.com>,
 "ardb@kernel.org" <ardb@kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 vkuznets <vkuznets@redhat.com>,
 "parri.andrea@gmail.com" <parri.andrea@gmail.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
 <20210830120036.GA22005@lst.de>
 <MWHPR21MB15933503E7C324167CB4132CD7CC9@MWHPR21MB1593.namprd21.prod.outlook.com>
 <20210902075939.GB14986@lst.de>
 <MWHPR21MB1593060DCFD854FDA14604D3D7CE9@MWHPR21MB1593.namprd21.prod.outlook.com>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <9b2f6372-3173-cc5c-81d2-365c8f09ef6f@gmail.com>
Date: Tue, 14 Sep 2021 22:41:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <MWHPR21MB1593060DCFD854FDA14604D3D7CE9@MWHPR21MB1593.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Michael and Christoph:
       I just sent out V5 patchset. I use alloc_pages() to allocate rx/tx
ring buffer in Isolation VM and use vmap() to map rx/tx buffer first
because the vmbus_establish_gpadl() still needs to va of low end memory
to initialize gpadl buffer. After calling vmbus_establish_gpadl(), the
va returned by vmap will be unmapped to release virtual address space 
which will not be used in the following code and then map these pages in 
the extra address space above shared_gpa_boundary via vmap_pfn(). Please
have a look.

https://lkml.org/lkml/2021/9/14/672

Thanks.

On 9/2/2021 11:57 PM, Michael Kelley wrote:
> From: Christoph Hellwig <hch@lst.de> Sent: Thursday, September 2, 2021 1:00 AM
>>
>> On Tue, Aug 31, 2021 at 05:16:19PM +0000, Michael Kelley wrote:
>>> As a quick overview, I think there are four places where the
>>> shared_gpa_boundary must be applied to adjust the guest physical
>>> address that is used.  Each requires mapping a corresponding
>>> virtual address range.  Here are the four places:
>>>
>>> 1)  The so-called "monitor pages" that are a core communication
>>> mechanism between the guest and Hyper-V.  These are two single
>>> pages, and the mapping is handled by calling memremap() for
>>> each of the two pages.  See Patch 7 of Tianyu's series.
>>
>> Ah, interesting.
>>
>>> 3)  The network driver send and receive buffers.  vmap_phys_range()
>>> should work here.
>>
>> Actually it won't.  The problem with these buffers is that they are
>> physically non-contiguous allocations.
> 
> Indeed you are right.  These buffers are allocated with vzalloc().
> 
>> We really have two sensible options:
>>
>>   1) use vmap_pfn as in the current series.  But in that case I think
>>      we should get rid of the other mapping created by vmalloc.  I
>>      though a bit about finding a way to apply the offset in vmalloc
>>      itself, but I think it would be too invasive to the normal fast
>>      path.  So the other sub-option would be to allocate the pages
>>      manually (maybe even using high order allocations to reduce TLB
>>      pressure) and then remap them
> 
> What's the benefit of getting rid of the other mapping created by
> vmalloc if it isn't referenced?  Just page table space?  The default sizes
> are a 16 Meg receive buffer and a 1 Meg send buffer for each VMbus
> channel used by netvsc, and usually the max number of channels
> is 8.  So there's 128 Meg of virtual space to be saved on the receive
> buffers,  which could be worth it.
> 
> Allocating the pages manually is also an option, but we have to
> be careful about high order allocations.  While typically these buffers
> are allocated during system boot, these synthetic NICs can be hot
> added and removed while the VM is running.   The channel count
> can also be changed while the VM is running.  So multiple 16 Meg
> receive buffer allocations may need to be done after the system has
> been running a long time.
> 
>>   2) do away with the contiguous kernel mapping entirely.  This means
>>      the simple memcpy calls become loops over kmap_local_pfn.  As
>>      I just found out for the send side that would be pretty easy,
>>      but the receive side would be more work.  We'd also need to check
>>      the performance implications.
> 
> Doing away with the contiguous kernel mapping entirely seems like
> it would result in fairly messy code to access the buffer.  What's the
> benefit of doing away with the mapping?  I'm not an expert on the
> netvsc driver, but decoding the incoming packets is already fraught
> with complexities because of the nature of the protocol with Hyper-V.
> The contiguous kernel mapping at least keeps the basics sane.
> 
>>
>>> 4) The swiotlb memory used for bounce buffers.  vmap_phys_range()
>>> should work here as well.
>>
>> Or memremap if it works for 1.
>>
>>> Case #2 above does unusual mapping.  The ring buffer consists of a ring
>>> buffer header page, followed by one or more pages that are the actual
>>> ring buffer.  The pages making up the actual ring buffer are mapped
>>> twice in succession.  For example, if the ring buffer has 4 pages
>>> (one header page and three ring buffer pages), the contiguous
>>> virtual mapping must cover these seven pages:  0, 1, 2, 3, 1, 2, 3.
>>> The duplicate contiguous mapping allows the code that is reading
>>> or writing the actual ring buffer to not be concerned about wrap-around
>>> because writing off the end of the ring buffer is automatically
>>> wrapped-around by the mapping.  The amount of data read or
>>> written in one batch never exceeds the size of the ring buffer, and
>>> after a batch is read or written, the read or write indices are adjusted
>>> to put them back into the range of the first mapping of the actual
>>> ring buffer pages.  So there's method to the madness, and the
>>> technique works pretty well.  But this kind of mapping is not
>>> amenable to using vmap_phys_range().
>>
>> Hmm.  Can you point me to where this is mapped?  Especially for the
>> classic non-isolated case where no vmap/vmalloc mapping is involved
>> at all?
> 
> The existing code is in hv_ringbuffer_init() in drivers/hv/ring_buffer.c.
> The code hasn't changed in a while, so any recent upstream code tree
> is valid to look at.  The memory pages are typically allocated
> in vmbus_alloc_ring() in drivers/hv/channel.c.
> 
> Michael
> 

