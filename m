Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B73A82ED
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 16:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142232.262505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltA6W-0005Xa-Lv; Tue, 15 Jun 2021 14:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142232.262505; Tue, 15 Jun 2021 14:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltA6W-0005Uk-Hu; Tue, 15 Jun 2021 14:31:48 +0000
Received: by outflank-mailman (input) for mailman id 142232;
 Tue, 15 Jun 2021 14:31:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZqV=LJ=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1ltA6U-0005Ue-QJ
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 14:31:46 +0000
Received: from mail-pf1-x435.google.com (unknown [2607:f8b0:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87f78395-1978-4cdd-b3f0-dd56133b5ec4;
 Tue, 15 Jun 2021 14:31:45 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id z26so13400531pfj.5
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jun 2021 07:31:45 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 fy16sm2711030pjb.49.2021.06.15.07.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 07:31:44 -0700 (PDT)
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
X-Inumbo-ID: 87f78395-1978-4cdd-b3f0-dd56133b5ec4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=09f7flVgvhf5eQwpZCIbvOGTARFj7yeM2HilMpzlWLk=;
        b=jk2oxSkqx62fHfzZ2Td3CQMKVDfVLX5soiM/JukpALSNJHJr6bPDtlz3KWKAxXo94O
         s/hllSh2es9DhRUKAKUitklZDcf/EnVOKXhkOj9PYfOCpVShjA/ALCwL9qmhEU6/Uawa
         XK557NRD7ifNeZzvRQOvgq1OjZVLzX0tIkT8t770jqHE0cKYFvqhPHbZNRgnhaDUZKFF
         qX9q9wmOAxzVgsgD1wpLoriKUlqy7RCPkNZ1jG4aLxQucHRt8DEitzL0SOUV96Pc1UDE
         2mXJY2Jw/0wFzqk5I0o9iVdLMmeZJJ8WeATZpVLS5cPgmlZCB/DeT8DlSYdBw+t/FiNV
         Ts4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=09f7flVgvhf5eQwpZCIbvOGTARFj7yeM2HilMpzlWLk=;
        b=pXsCkUgjkzWcP3pRRVwhcPQPvNPRMZC1Vkp5+OTYzo1IEBXV+UCwhcIA5E8fjg4Jdy
         Y412bDgn6MxV6OkTRmlrcsvSrCfq2hcXJFceAmT4fFjXBdSX0i8mKApJYa5p8foGS83c
         A/8HHMFMKCy8hgIz8E+978g2g2qDWl3i1G04v+vG0nGeMwfcG6GT+xN2lqk8QGMF/T29
         JAd3amJz4dbE6gKnnezlxovL1smFmL1Ns2NPlM2Q1ckDksXyDt/D/Ebj9NNSDZn8wa6z
         27SXZuQAX8qt5OlhtajCm7YUwWsT+++KpT/Op4N9HnkYOli2uzaaN0/7yRXOxqejAnLT
         UbuQ==
X-Gm-Message-State: AOAM533euti232PgBv3o/TyFdM3EP4EEa0pEtuvW3IfoJ+gRsRtI5Ob8
	7YUB5eT1hlNY/jU3j+bC4vc=
X-Google-Smtp-Source: ABdhPJyHvlYi58GrVtZOOV1UUSDfdDdKTtRA2DlWTeNf7j5KzC+iOROVnZire7W4JyUnDsrG1dvTzA==
X-Received: by 2002:a65:550e:: with SMTP id f14mr22678348pgr.160.1623767504841;
        Tue, 15 Jun 2021 07:31:44 -0700 (PDT)
Subject: Re: [RFC PATCH V3 10/11] HV/Netvsc: Add Isolation VM support for
 netvsc driver
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
 <20210530150628.2063957-11-ltykernel@gmail.com>
 <20210607065007.GE24478@lst.de>
 <279cb4bf-c5b6-6db9-0f1e-9238e902c8f2@gmail.com>
 <20210614070903.GA29976@lst.de>
 <e10c2696-23c3-befe-4f4d-25e18918132f@gmail.com>
 <20210614153339.GB1741@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <7d86307f-83ff-03ad-c6e9-87b455c559b8@gmail.com>
Date: Tue, 15 Jun 2021 22:31:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614153339.GB1741@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/14/2021 11:33 PM, Christoph Hellwig wrote:
> On Mon, Jun 14, 2021 at 10:04:06PM +0800, Tianyu Lan wrote:
>> The pages in the hv_page_buffer array here are in the kernel linear
>> mapping. The packet sent to host will contain an array which contains
>> transaction data. In the isolation VM, data in the these pages needs to be
>> copied to bounce buffer and so call dma_map_single() here to map these data
>> pages with bounce buffer. The vmbus has ring buffer where the send/receive
>> packets are copied to/from. The ring buffer has been remapped to the extra
>> space above shared gpa boundary/vTom during probing Netvsc driver and so
>> not call dma map function for vmbus ring
>> buffer.
> 
> So why do we have all that PFN magic instead of using struct page or
> the usual kernel I/O buffers that contain a page pointer?
> 

These PFNs originally is part of Hyper-V protocol data and will be sent
to host. Host accepts these GFN and copy data from/to guest memory. The 
translation from va to pa is done by caller that populates the 
hv_page_buffer array. I will try calling dma map function before 
populating struct hv_page_buffer and this can avoid redundant 
translation between PA and VA.

