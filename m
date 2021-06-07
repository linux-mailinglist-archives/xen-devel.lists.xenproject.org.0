Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D53439DFC7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 16:57:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138019.255599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGga-0002FT-LS; Mon, 07 Jun 2021 14:57:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138019.255599; Mon, 07 Jun 2021 14:57:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGga-0002CY-IC; Mon, 07 Jun 2021 14:57:04 +0000
Received: by outflank-mailman (input) for mailman id 138019;
 Mon, 07 Jun 2021 14:57:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b+N/=LB=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1lqGgY-0002CS-QZ
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 14:57:02 +0000
Received: from mail-pg1-x536.google.com (unknown [2607:f8b0:4864:20::536])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbdd5224-2642-4307-9b44-54896c0b2a61;
 Mon, 07 Jun 2021 14:57:01 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id r1so13986639pgk.8
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jun 2021 07:57:01 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 p14sm9148073pgk.6.2021.06.07.07.56.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 07:57:00 -0700 (PDT)
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
X-Inumbo-ID: bbdd5224-2642-4307-9b44-54896c0b2a61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mkL4psSj+prMNO7AohBJyTx+Q189qdo7fgANRpB5e+4=;
        b=lhaKoBcNOuAsXD3pTAmPwsFop0hqZ7JU5MLd+d9L1no2Uoec0Qyp3qHl7oh02shWeI
         Jes/SZ8q3U+KfCNoq9c1Xrlmq8EXws4qXzfcpkEnMBLnTwTeOLVn57/5lNMv0IIQu936
         eZ7O1rSFr9fTp5zpfxPADKjK5NrHWx5QoMUdi6NsRSJlWsZAOZ1xE13fUHg60coHCGz9
         L8KTelBvvQsClf1NodL6YCelq4Ol69U2fD2Jwlp+Qg82jWdc6cKvPRG+8Dfwd10h1GXK
         eJIB1Vu38FzkxJlUAMfqjcOa76EjkPTv6FXCcrF7OHioGvvqCsPHt0hXWXzpcsKlznTI
         Ov6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mkL4psSj+prMNO7AohBJyTx+Q189qdo7fgANRpB5e+4=;
        b=F7Pv0CiTY2DAHzUbMo0z8YaY/qESPjVDyhO8zJjd1kx1GZ4RnyPOLmBQESwymmBVBx
         UPGFfUnFiv5RY5Vxu58KU7EGb1ETtgFnsKzfg/ZCF5e4iM8vQypm5W4z/y7UIbCpII1d
         saymRCVVRLNw/z5SLHl/lerRzZR9X60tjvDJgWdQSaZhuT+gJcj4Pb8GlLCUtX9kH9ut
         /Wiu9WQrkrJkCfOSaHxMsTo6eEqagLAN9uELuM6zdhx9aDhrBUYPWDkeW7HUacg5vEhK
         JJ+mm8DtOSOZBBFpuixGDSAHn1wva8oZ+Zl54aCcgrhk7uZHmYI//KzJ97aTYPeZzsHr
         rydA==
X-Gm-Message-State: AOAM5310E5VfMVvflZfbENVW8F1XCWUgnrEt5TPTgQ7hA4v8C4bo9LVr
	M+tBf3EIIx+9/rPNGs8Gc7Q=
X-Google-Smtp-Source: ABdhPJyAa6AVd7SFvf1Ep4fkh59q91v76tY7vbke901CKM7Z5XY+dbd7TJGFiS7g5cKGjx+7iiHgJA==
X-Received: by 2002:a65:6a51:: with SMTP id o17mr18093661pgu.170.1623077821197;
        Mon, 07 Jun 2021 07:57:01 -0700 (PDT)
Subject: Re: [RFC PATCH V3 08/11] swiotlb: Add bounce buffer remap address
 setting function
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
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <48516ce3-564c-419e-b355-0ce53794dcb1@gmail.com>
Date: Mon, 7 Jun 2021 22:56:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607064312.GB24478@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 6/7/2021 2:43 PM, Christoph Hellwig wrote:
> On Sun, May 30, 2021 at 11:06:25AM -0400, Tianyu Lan wrote:
>> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>>
>> For Hyper-V isolation VM with AMD SEV SNP, the bounce buffer(shared memory)
>> needs to be accessed via extra address space(e.g address above bit39).
>> Hyper-V code may remap extra address space outside of swiotlb. swiotlb_
>> bounce() needs to use remap virtual address to copy data from/to bounce
>> buffer. Add new interface swiotlb_set_bounce_remap() to do that.
> 
> Why can't you use the bus_dma_region ranges to remap to your preferred
> address?
> 

Thanks for your suggestion.

These addresses in extra address space works as system memory mirror. 
The shared memory with host in Isolation VM needs to be accessed via 
extra address space which is above shared gpa boundary. During 
initializing swiotlb bounce buffer pool, only address bellow shared gpa 
boundary can be accepted by swiotlb API because it is treated as system 
memory and managed by memory management. This is why Hyper-V swiotlb 
bounce buffer pool needs to be allocated in Hyper-V code and map
associated physical address in extra address space. The patch target is
to add the new interface to set start virtual address of bounce buffer
pool and let swiotlb boucne buffer copy function to use right virtual 
address for extra address space.

bus_dma_region is to translate cpu physical address to dma address.
It can't modify the virtual address of bounce buffer pool and let
swiotlb code to copy data with right address. If some thing missed,
please correct me.

Thanks.

