Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB913EBBC5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 19:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166861.304589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEbSF-00008S-4l; Fri, 13 Aug 2021 17:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166861.304589; Fri, 13 Aug 2021 17:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEbSF-00006L-1H; Fri, 13 Aug 2021 17:58:51 +0000
Received: by outflank-mailman (input) for mailman id 166861;
 Fri, 13 Aug 2021 17:58:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=reJ5=NE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mEbSD-00006F-Eq
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 17:58:49 +0000
Received: from mail-pj1-x1029.google.com (unknown [2607:f8b0:4864:20::1029])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cfb4bf0-67aa-4d52-90f0-0d928a09dfb3;
 Fri, 13 Aug 2021 17:58:48 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so21752263pjn.4
 for <xen-devel@lists.xenproject.org>; Fri, 13 Aug 2021 10:58:48 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 19sm2945794pfw.203.2021.08.13.10.58.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 10:58:47 -0700 (PDT)
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
X-Inumbo-ID: 6cfb4bf0-67aa-4d52-90f0-0d928a09dfb3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=di7QngSrp4FnsSGO3LSu9eV65mIJNW5jKf6yiG0+RuU=;
        b=dQXLqc5X8fIsHbzymW3PLJOTOjlQdK8tcmZqLFzG352erBCZhuDdyQp5dJjpAxQs4B
         JeaS1pyddkxqdfr1t8ujRcY12W0PqS0hXNNOXZ0wFZF2oaeKK3/1DVpmWTSnCW6zOWzY
         gqsqTLjc9I8480wq1q6uBW3m6zMSJpXzGOBUxY9waV/oC7JaNorcF8JKXWehHZRJ5RUq
         g7RNoWhlraHMPVn4DI6/rTvyrmiPeXKT3mG72JAOtuEM7ufjtq62UA9Nz9UYy2mJkzEG
         NpAl0ATS3TPxm1KRHOuuzcztGTWzT/f9vfWyWDsL/FUIc3fxfMILeA2ztqpuFTME9rw+
         80RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=di7QngSrp4FnsSGO3LSu9eV65mIJNW5jKf6yiG0+RuU=;
        b=OLbc0KBUJf0BWagBCVKPBMSz3gcxKR61MoY1kRl2o8fzeQ8vpNM7YNySeUJUZY312Z
         YduP6le9DLmV0DvcEvAHLx6PX2PoaHekYnTC1JfD5AuP7qhQqxsGICnqxOM9qq85TpLH
         0YUKGIx0qr9a6rlkUNqJ0EFXtBZqvuvtqiAuZcZ1hm+aGgAoB7dbseN6YCZ/JX8/nMPT
         eqsw3HXI5U0lTlKrNwXvheKRfLN2oVBCO6qQXw6f7JGg/LD9NE0NZGRG+T6Pgs89M0jS
         UszpnhiMV3bpZel47KyXpRnIGXP45O39yeS+i3UuJdMA3dEGgWYC1Mmm+PD5Lcf+rguT
         zvYw==
X-Gm-Message-State: AOAM533iIlOrIAv/Jb5JscwtYYfHEnqSfiDjFLwm826hTDOu5/RGvnhg
	dQADvOeqGqFhSwFD+RemCmA=
X-Google-Smtp-Source: ABdhPJwzwumzRBi1BCTF3AFHLjIkjk9cXsbjw6TqqLX1fdRzbRFo7tzsATIv9gSPcOccSh8E3bFC/Q==
X-Received: by 2002:a63:f749:: with SMTP id f9mr3387048pgk.77.1628877527474;
        Fri, 13 Aug 2021 10:58:47 -0700 (PDT)
Subject: Re: [PATCH V3 10/13] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
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
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <d18ae061-6fc2-e69e-fc2c-2e1a1114c4b4@gmail.com>
Date: Sat, 14 Aug 2021 01:58:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210812122741.GC19050@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/12/2021 8:27 PM, Christoph Hellwig wrote:
> This is still broken.  You need to make sure the actual DMA allocations
> do have struct page backing.
> 

Hi Christoph:
      swiotlb_tbl_map_single() still returns PA below vTOM/share_gpa_
boundary. These PAs has backing pages and belong to system memory.
In other word, all PAs passed to DMA API have backing pages and these is 
no difference between Isolation guest and traditional guest for DMA API.
The new mapped VA for PA above vTOM here is just to access the bounce 
buffer in the swiotlb code and isn't exposed to outside.

