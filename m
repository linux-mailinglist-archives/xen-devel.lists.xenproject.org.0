Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE5A3A2E17
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 16:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139948.258663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLcd-0007ql-To; Thu, 10 Jun 2021 14:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139948.258663; Thu, 10 Jun 2021 14:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrLcd-0007oU-Qe; Thu, 10 Jun 2021 14:25:27 +0000
Received: by outflank-mailman (input) for mailman id 139948;
 Thu, 10 Jun 2021 14:25:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cwq8=LE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lrLcb-0007oO-LN
 for xen-devel@lists.xenproject.org; Thu, 10 Jun 2021 14:25:25 +0000
Received: from mail-pj1-x1030.google.com (unknown [2607:f8b0:4864:20::1030])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57183a0a-bf32-43d7-a106-7200f7f0f2de;
 Thu, 10 Jun 2021 14:25:24 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id g24so3744925pji.4
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jun 2021 07:25:24 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id 1sm8338487pjm.8.2021.06.10.07.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 07:25:23 -0700 (PDT)
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
X-Inumbo-ID: 57183a0a-bf32-43d7-a106-7200f7f0f2de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9LfruKTSmGsaKr3T0KtsgMI2g1V5D5r+FfKoliRoTY8=;
        b=c3W9IY55kAGRSZQMUKIse7CYjATOc/WNsezUixaF5fWDkVciqS0+iWaZcHtL2rFFUw
         q6Af9zyVo5zJyfySRvKv8k+huR+szVR1Xb8GDyTonmbkQ3V0MoPt+EBqk/fvrUpoIhu0
         FpoCg5T+vTYyaf/IELWrWdHqeg6MOtolC1d7jn3ifj33bWYJ1rAiXRMyOW50J2wlpwFG
         OzCk7HbGROQ8oMztcbHmPooQ1M2yg6rOw9Gp0rsVbF3wVqRpT60yIqJM59aQu50FPywK
         5PKEXQwlOBjWNljf/CAPll8LJKaf8zXSJtCqfJmCU42oGpqB5i4sk/wWojxWFZDHy/Ps
         2toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9LfruKTSmGsaKr3T0KtsgMI2g1V5D5r+FfKoliRoTY8=;
        b=uNn2diLrEr2Zp4nSysO98SLXQXd1JhcnRIotIpIzb7mNAf1aW/EKcElQdFfAoT+Bbr
         kSrVG0Tpdh/ivTjMLcHo5PpkEpVlDv21tngQMJLXshGxU5XoirhJsU7wV4evH1UmziJ1
         GCzY84oF+KvuujpGIminnEXPFKxPtjXbI5hYOVlzQGPI4FJVTWTiiO8Jbx7qb//7NROV
         lUg6IXSOtU1Quwz4MkFFjJbvHsal3xU1OOGvVv0u3qWLMv6rMqV92BfhD3dNzhZeP2u0
         wBSK6FyluUwXsyBAzLrLdX+73NvWvuS09cVqwDol/pn6m4W6stUx2rmsdaI6HSqAhivo
         ufMg==
X-Gm-Message-State: AOAM533VG0PbZRyTqBKuAZ4gKayoCMUTVRymiN8BlTHuzsUP/0Mx5aaS
	eImptwgCSrnkuaFgTJYm1l8=
X-Google-Smtp-Source: ABdhPJzdwp2MX3HMzPasMcsmUlDqisDdNAsXcZ2anZ9ouahX31714ETLaZ+TtT/Nrt8h3xRgpVym6w==
X-Received: by 2002:a17:90a:7bce:: with SMTP id d14mr3702065pjl.38.1623335123951;
        Thu, 10 Jun 2021 07:25:23 -0700 (PDT)
Subject: Re: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address
 setting function
From: Tianyu Lan <ltykernel@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, m.szyprowski@samsung.com,
 robin.murphy@arm.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 thomas.lendacky@amd.com, brijesh.singh@amd.com, sunilmut@microsoft.com
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-9-ltykernel@gmail.com>
 <20210607064312.GB24478@lst.de>
 <48516ce3-564c-419e-b355-0ce53794dcb1@gmail.com>
Message-ID: <9c05f7fd-6460-5d4a-aa83-08626839d18e@gmail.com>
Date: Thu, 10 Jun 2021 22:25:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <48516ce3-564c-419e-b355-0ce53794dcb1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/7/2021 10:56 PM, Tianyu Lan wrote:
> 
> On 6/7/2021 2:43 PM, Christoph Hellwig wrote:
>> On Sun, May 30, 2021 at 11:06:25AM -0400, Tianyu Lan wrote:
>>> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>>>
>>> For Hyper-V isolation VM with AMD SEV SNP, the bounce buffer(shared 
>>> memory)
>>> needs to be accessed via extra address space(e.g address above bit39).
>>> Hyper-V code may remap extra address space outside of swiotlb. swiotlb_
>>> bounce() needs to use remap virtual address to copy data from/to bounce
>>> buffer. Add new interface swiotlb_set_bounce_remap() to do that.
>>
>> Why can't you use the bus_dma_region ranges to remap to your preferred
>> address?
>>
> 
> Thanks for your suggestion.
> 
> These addresses in extra address space works as system memory mirror. 
> The shared memory with host in Isolation VM needs to be accessed via 
> extra address space which is above shared gpa boundary. During 
> initializing swiotlb bounce buffer pool, only address bellow shared gpa 
> boundary can be accepted by swiotlb API because it is treated as system 
> memory and managed by memory management. This is why Hyper-V swiotlb 
> bounce buffer pool needs to be allocated in Hyper-V code and map
> associated physical address in extra address space. The patch target is
> to add the new interface to set start virtual address of bounce buffer
> pool and let swiotlb boucne buffer copy function to use right virtual 
> address for extra address space.
> 
> bus_dma_region is to translate cpu physical address to dma address.
> It can't modify the virtual address of bounce buffer pool and let
> swiotlb code to copy data with right address. If some thing missed,
> please correct me.
> 

Hi Christoph:
	Sorry to bother you. Could you have a look at my previous reply?
I try figuring out the right way.

Thanks.

