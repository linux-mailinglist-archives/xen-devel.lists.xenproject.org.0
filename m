Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 076363EA7AF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 17:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166526.303931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mECn8-0007jf-Hc; Thu, 12 Aug 2021 15:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166526.303931; Thu, 12 Aug 2021 15:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mECn8-0007hI-Eg; Thu, 12 Aug 2021 15:38:46 +0000
Received: by outflank-mailman (input) for mailman id 166526;
 Thu, 12 Aug 2021 15:38:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L4zR=ND=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mECn6-0007hC-Qc
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 15:38:44 +0000
Received: from mail-pl1-x62a.google.com (unknown [2607:f8b0:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30ef41ca-7bed-4c19-a248-08cce6496e5f;
 Thu, 12 Aug 2021 15:38:44 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id q2so7782013plr.11
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 08:38:44 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::4b1? ([2404:f801:9000:1a:efea::4b1])
 by smtp.gmail.com with ESMTPSA id
 y7sm4139094pfp.102.2021.08.12.08.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 08:38:42 -0700 (PDT)
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
X-Inumbo-ID: 30ef41ca-7bed-4c19-a248-08cce6496e5f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JDlSeWOgXcTARSX0Sb/7iqT+nIM3mRl7e9seVpJTDsQ=;
        b=eKwdoqgzbDwCSyrgnVW4fQAzUSWeoRx/kyQpFmKK+Fp7BDnr2/nHtS2A8lP7dy74pV
         DhjbUbYBUBvR9ptLkWXPFGdb66asLd49SRfdmf9wxKJzWqlZ8T7NSu4mDDdOyr8QYGjC
         0lNFiTw2Utqsdhq+i1tE7yKdLkrhwYJ4GcUjf5y7cP+4awTK44NJV01YV+BxlT3oQexu
         0CRKAKLjxtq43dNgpQlyRzLdedFvCS41p+H+3bYjSaKBrgs7oVUsW9kyJWLlM734zPxy
         UEVzFvb9jP9wMt2dE2D+cHyIUPC4b4v/Fn8lr0Ong2WornEq8pHks9kPtVFyDLYSburS
         y7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JDlSeWOgXcTARSX0Sb/7iqT+nIM3mRl7e9seVpJTDsQ=;
        b=FTZyYKvcuhFdKCHRQ4SWvQ9gDlL/kB2DSnZk9cfiba+GIyMwzFX47o9AfNglXrV3TV
         zZQVlKyJf/ojuXUkDuEhFrn2iZ8ol5Ss6TeXl+/gdFCHV1/Rj3nAMBem2YJp0S5PdjKy
         F4lEMjk75mxYmkdBkm510bO/vzCeFn8Iadj7WUrwTif+nlINpXTVN88Uu6dyDTydEx6e
         vMoAHOnoP2faW59iY6OUh+tCwfVerbNx/9Z9oF2FNObWylVwsmNhvreq2NEWbdhdAnSO
         8OC2pv+2cW5XvVUCkg9yI8YfHt91RdsHnPvyjJBWYPXrHrzxFHz80HcjCHp1h+zKJMAm
         uBMQ==
X-Gm-Message-State: AOAM531+CIZnsq6nH4C6Zj4PFmK32leomBnOlkh/nkL+oVOMcnTyCYi/
	FNf02VFQ+kovC/qJ4W7ffqc=
X-Google-Smtp-Source: ABdhPJzM/sI+FsioyGJB+Q38ExsQyZIIBjJUHCnSB8L/yQaI33b3CkRfajWOppoDj5zZgXKq84mYaQ==
X-Received: by 2002:a17:90a:648b:: with SMTP id h11mr5000375pjj.141.1628782723341;
        Thu, 12 Aug 2021 08:38:43 -0700 (PDT)
Subject: Re: [PATCH V3 09/13] DMA: Add dma_map_decrypted/dma_unmap_encrypted()
 function
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
 <20210809175620.720923-10-ltykernel@gmail.com>
 <20210812122657.GB19050@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <0598906d-9a47-34a9-16bf-4bacff7fa058@gmail.com>
Date: Thu, 12 Aug 2021 23:38:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210812122657.GB19050@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/12/2021 8:26 PM, Christoph Hellwig wrote:
> On Mon, Aug 09, 2021 at 01:56:13PM -0400, Tianyu Lan wrote:
>> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>>
>> In Hyper-V Isolation VM with AMD SEV, swiotlb boucne buffer
>> needs to be mapped into address space above vTOM and so
>> introduce dma_map_decrypted/dma_unmap_encrypted() to map/unmap
>> bounce buffer memory. The platform can populate man/unmap callback
>> in the dma memory decrypted ops.
> 
> Nothing here looks actually DMA related, and the names are horribly
> confusing vs the actual dma_map_* calls.
> 

OK. So this still need to keep in the set_memory.c file.

