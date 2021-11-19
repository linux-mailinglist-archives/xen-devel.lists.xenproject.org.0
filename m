Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456BC457094
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 15:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228050.394541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4o3-0002xT-FL; Fri, 19 Nov 2021 14:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228050.394541; Fri, 19 Nov 2021 14:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo4o3-0002uY-BO; Fri, 19 Nov 2021 14:23:59 +0000
Received: by outflank-mailman (input) for mailman id 228050;
 Fri, 19 Nov 2021 14:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oyXj=QG=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mo4o2-0002Vm-H3
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 14:23:58 +0000
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54ae7daf-4944-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 15:23:57 +0100 (CET)
Received: by mail-pg1-x52a.google.com with SMTP id r5so8789149pgi.6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Nov 2021 06:23:57 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 l12sm3181520pfu.100.2021.11.19.06.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 06:23:55 -0800 (PST)
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
X-Inumbo-ID: 54ae7daf-4944-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=dvjMlZBI3ldb1jXqYwhDV7AWs1lj5LCSS81ZY56RgHg=;
        b=lD29CjzOk03sgDLP+GNvSpxJtgVkW5rJkK+91U6AQudAzMZxrwkaky9OEq6jf27Gw7
         +El3go4e6gBFGCWthIzBWcaH6MtynoVd2Asx0s8lF4AHh9KTCrYFWAivyI8ee0X1Vv36
         V2FQuAVabQQBAbOL0fIquaORLXE6V2pQuWoxP4p8Bdmk66ffMTRypmvZJws3ZQPoiG7R
         xBnlvWtgNAT1CZU5CVKw8D3+cafHZ/lwicgnA/RP75ZpQaa+0T4cnXOpdWgAZYBmS+Ds
         D+JWFTqNXrZl80kk+n0WgCyZhptSAvKOJXiZ1wT44+Ikfkw7mB3QMLEop9ypqPjQJy3c
         M8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=dvjMlZBI3ldb1jXqYwhDV7AWs1lj5LCSS81ZY56RgHg=;
        b=2csoTpcW3m/j66KpisCBNio7OFfTXZiqOch34DHcrIQ+SlwlzO9OIGI5QWT3YvcfxP
         8eudQwGFj76gkrWDztTWhnSC3DtOh/wtcsHK/HcmpY2aDSHbSloroc+DgfDMNfNs0Zb5
         syo9HP5h4KB+wSTZTrMMa7udqpBeA8K/egnxhsnDp7EOIWLYPsgmYNrX7xaGrm2vzbhp
         1x1FUFnYHQvSE0FjnwzLh8+aQsweN+CZGiGAGvvmd95TN6La4vH2jSlmNPsNmxcSH6N8
         yvvcf37/EAJYBAa2IJ4IzncBiqIKKF8C7ptOt2Pkv3cTuHSbtecpnn1t9WF+QpT7LQwS
         N+/Q==
X-Gm-Message-State: AOAM530ZiSk08MjlZLzIupjY4KqaMJpcYPnBw3Sl2JIWZ+XrdVhjq5vs
	TN3Wymu5m4gbP3zhHDnx5HY=
X-Google-Smtp-Source: ABdhPJzKRBXlcGt3waRWzaH9R47/6SD0/IgoWcAgajHv/fxOJufbEPJI6hNEQ9SuwB+/pum/5oX3UA==
X-Received: by 2002:a63:b54a:: with SMTP id u10mr17506905pgo.69.1637331836308;
        Fri, 19 Nov 2021 06:23:56 -0800 (PST)
Message-ID: <f7fcb4d5-fcdd-0d24-60ed-62c27ed8e2d9@gmail.com>
Date: Fri, 19 Nov 2021 22:23:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Content-Language: en-US
From: Tianyu Lan <ltykernel@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, jgross@suse.com, sstabellini@kernel.org,
 boris.ostrovsky@oracle.com, kys@microsoft.com, haiyangz@microsoft.com,
 sthemmin@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 joro@8bytes.org, will@kernel.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com, m.szyprowski@samsung.com,
 robin.murphy@arm.com, xen-devel@lists.xenproject.org,
 michael.h.kelley@microsoft.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, vkuznets@redhat.com, brijesh.singh@amd.com,
 konrad.wilk@oracle.com, parri.andrea@gmail.com, thomas.lendacky@amd.com,
 dave.hansen@intel.com
References: <20211116153923.196763-1-ltykernel@gmail.com>
 <20211116153923.196763-4-ltykernel@gmail.com> <20211117100142.GB10330@lst.de>
 <c93bf3d4-75c1-bc3d-2789-1d65e7c19158@gmail.com>
In-Reply-To: <c93bf3d4-75c1-bc3d-2789-1d65e7c19158@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2021 10:00 PM, Tianyu Lan wrote:
> On 11/17/2021 6:01 PM, Christoph Hellwig wrote:
>> This doesn't really have much to do with normal DMA mapping,
>> so why does this direct through the dma ops?
>>
> 
> According to the previous discussion, dma_alloc_noncontigous()
> and dma_vmap_noncontiguous() may be used to handle the noncontigous
> memory alloc/map in the netvsc driver. So add alloc/free and vmap/vunmap
> callbacks here to handle the case. The previous patch v4 & v5 handles
> the allocation and map in the netvsc driver. If this should not go 
> though dma ops, We also may make it as vmbus specific function and keep
> the function in the vmbus driver.
> 
> https://lkml.org/lkml/2021/9/28/51


Hi Christoph:
       Sorry to bother you. Could you have a look? Which solution do you
prefer? If we need to call dma_alloc/map_noncontigous() function in the
netvsc driver what patch 4 does. The Hyper-V specific implementation
needs to be hided in some callbacks and call these callback in the
dma_alloc/map_noncontigous(). I used dma ops here. If the allocation and
map operation should be Hyper-V specific function, we may put these
functions in the vmbus driver and other vmbus device drivers also may
reuse these functions if necessary.

Thanks.

