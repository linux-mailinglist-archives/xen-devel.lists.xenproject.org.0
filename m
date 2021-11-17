Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DFC4547EE
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 15:00:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226873.392212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnLU8-0004sJ-9A; Wed, 17 Nov 2021 14:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226873.392212; Wed, 17 Nov 2021 14:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnLU8-0004pY-5p; Wed, 17 Nov 2021 14:00:24 +0000
Received: by outflank-mailman (input) for mailman id 226873;
 Wed, 17 Nov 2021 14:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66jA=QE=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mnLU6-0003pW-FP
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 14:00:22 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3750eda-47ae-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 15:00:21 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id b11so2213666pld.12
 for <xen-devel@lists.xenproject.org>; Wed, 17 Nov 2021 06:00:21 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 95sm5490056pjo.2.2021.11.17.06.00.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 06:00:19 -0800 (PST)
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
X-Inumbo-ID: b3750eda-47ae-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pfKT7vWJtxV2smk9CnW5qMlXjmk0IHKeJrqLf4YFRis=;
        b=Rjj9c6AtN53lwjrZL6EQMTK4S9B6EyjLDiTKAEZtG92IG/z5eW4MmmZjuNMEaPPtjf
         LSOJT/vIwEcxXU1K7Ca+hnK+LznG3PkqsB9P36idDXcWR6yBZ0TKu/gYYNIynsfa6uwl
         wwXh4cR3P9Fphh3Ru4IOABiaCcVVd3dR/Z+YDRN5tiFV3q6iF+hOXqmMcg2FfSxJRFzw
         2zMMFPxbuq+GlPyeaD3MgQIipxxSO7TRApycEHsiuMj7dn5MGNWFoo8smcQRSoTJRhJs
         ZsXAJgdRa8E0sMFr5/frJselNGMJAjuNu9fCWyvPs//KwOW3T6zPAQdpgf+k/6JRtRmA
         Pl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pfKT7vWJtxV2smk9CnW5qMlXjmk0IHKeJrqLf4YFRis=;
        b=ymM927ed27qwqsHIKu47y4aKdnKwtPTMB2C3rvTGTNOpl0gR6xtjE9TECQ7NZz+aKU
         Jf5rU55sKfb6VCY/6kMyxkWkBRM0mf6fUPgYTfpcRAXk6RMW6i6V8UVgp3uLUl59jT7e
         npR9Q50d/jGWAiSEeg3rXcCnu0eBV0naErYfnGUpsf8yH59sD1Bjmcy8erAqqDpgd9Tf
         MxYlkQs5/0iVWHqfKNLhKytP3Xso3j8QMmVVsjR2Gq+HaFBmLQJfdze7ATbHJkagCyGf
         /i01eNT/S1zMkumKuXj1Wpl2G9h4BszkBqxscSqsVhpZ5+Wo3mcX1kXE//XxwBZMZ8xY
         5a3A==
X-Gm-Message-State: AOAM531irz0l/Tn59I7a+hbucGuZbjJL+uy2gkRAmR6+0FokQ+yqC/RN
	jNpxwMcwEHIageUWDw709Ns=
X-Google-Smtp-Source: ABdhPJz045G1qOXv6u71zRNaxnc6W77FjMF/vz0ksg1+BccDMfhcBoN3nBp5JPhXQCiAcID15bfAZg==
X-Received: by 2002:a17:903:32c2:b0:141:eed4:ec1c with SMTP id i2-20020a17090332c200b00141eed4ec1cmr56123455plr.33.1637157619685;
        Wed, 17 Nov 2021 06:00:19 -0800 (PST)
Message-ID: <c93bf3d4-75c1-bc3d-2789-1d65e7c19158@gmail.com>
Date: Wed, 17 Nov 2021 22:00:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Content-Language: en-US
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
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <20211117100142.GB10330@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/2021 6:01 PM, Christoph Hellwig wrote:
> This doesn't really have much to do with normal DMA mapping,
> so why does this direct through the dma ops?
> 

According to the previous discussion, dma_alloc_noncontigous()
and dma_vmap_noncontiguous() may be used to handle the noncontigous
memory alloc/map in the netvsc driver. So add alloc/free and vmap/vunmap
callbacks here to handle the case. The previous patch v4 & v5 handles
the allocation and map in the netvsc driver. If this should not go 
though dma ops, We also may make it as vmbus specific function and keep
the function in the vmbus driver.

https://lkml.org/lkml/2021/9/28/51



