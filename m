Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279583EBA4E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 18:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166849.304564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEaHP-0001PB-HQ; Fri, 13 Aug 2021 16:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166849.304564; Fri, 13 Aug 2021 16:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEaHP-0001Mp-EQ; Fri, 13 Aug 2021 16:43:35 +0000
Received: by outflank-mailman (input) for mailman id 166849;
 Fri, 13 Aug 2021 16:43:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=reJ5=NE=gmail.com=ltykernel@srs-us1.protection.inumbo.net>)
 id 1mEaHO-0001Mj-2k
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 16:43:34 +0000
Received: from mail-pl1-x62f.google.com (unknown [2607:f8b0:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18c5388d-a597-4fda-8866-ff387186b4fc;
 Fri, 13 Aug 2021 16:43:33 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id a5so12715017plh.5
 for <xen-devel@lists.xenproject.org>; Fri, 13 Aug 2021 09:43:33 -0700 (PDT)
Received: from ?IPv6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 q5sm2573972pfu.185.2021.08.13.09.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Aug 2021 09:43:32 -0700 (PDT)
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
X-Inumbo-ID: 18c5388d-a597-4fda-8866-ff387186b4fc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Br8kWTJBYxAsDNXsgBmQPMZlHU8mozxNfYo/9WDsR4I=;
        b=aoTndkeVaHx+xBp7rqX3zmRgkXAUaeWNU6g1W5l6j2h14KXWDt/4KR1/vs8KQLuFc+
         34iHxz0QkWtvArbfHie0V+3SpbV3Etyaux0TSLQVrp+6lyKitKxYLcmpKDuBa3hKgs1Q
         L+HBlJsf1N4PmA7Lhrcv6XYigXfGievs/en9zESUnFG4qu4IHQbnz7Fh+vazW6arL56N
         dGeRpy35Kd27RqG5JRWguH9nICCCpQJez7lwxLr0P4Fr+rJHgUPVJfNeUcfFFOMN0Pib
         ad4dksepULIsumOQAu+X2SAOKzn90wqArATLcQxfXs2NZOHu8wo377ndiUdyqLv8zpwd
         Rq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Br8kWTJBYxAsDNXsgBmQPMZlHU8mozxNfYo/9WDsR4I=;
        b=eKLmMHkmYz39bixgXrXLswSODuhF2kPsFAuj6+QDTL44UJWYKVFCk89vdkx1x6+Smi
         pmWA26dZ9iY2gs5OpVv0mASB+pQrpqNu41FabR3ds8+rcmYrz19QDQyZXJHI+PeWyGcU
         cDma8DtefaT4Bt09BTlW9RD2HsHrgxGer1GiTei3tA+Duo36Pt8kExwlUDBA4EJi+lo2
         6clARI1/Y9ojFh6QTOivx+qon5IiZ7iMms6d2zUKh06cVucHaHIVAldFiWG0wRUI1sw+
         0xCpJXD30XKK6NTOpDVlv2YO1bv8nNSCHbbrRMyOyKUSdstI1J31lBVsBAxyAU+aBi6N
         AT6Q==
X-Gm-Message-State: AOAM531pa4hr8YCtMWD6QYWGaQUOjQcMz1WQ+PMIUkJ8pnY4mDhv/Q41
	fzqLOOARIg3iDvLf6hjq9JU=
X-Google-Smtp-Source: ABdhPJzF5OxYFo7ub8a8o5Dc0QIjyn2ULZzeCAc9wcqXWRPO4wbeX7mR+yOK6dhKrmTMKf5MwdVa8w==
X-Received: by 2002:a17:90a:c2:: with SMTP id v2mr3374490pjd.96.1628873012452;
        Fri, 13 Aug 2021 09:43:32 -0700 (PDT)
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
From: Tianyu Lan <ltykernel@gmail.com>
Message-ID: <20926467-6f67-9549-1c34-1841f597b977@gmail.com>
Date: Sat, 14 Aug 2021 00:43:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210720135437.GA13554@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Christoph:
       I followed your this suggestion to rework the latest
version(https://lkml.org/lkml/2021/8/9/805). I just remove the arch
prefix from your suggested name arch_dma_map_decrypted because the 
platform may populate their map/umap callback in the ops. But from your 
latest comment(https://lkml.org/lkml/2021/8/12/149), these names confuse 
vs the actual dma_map_* calls... Could you help to give the right 
function name? The new map function is to map bounce buffer in the 
trust/Isolation VM and these buffers are DMA memory.



On 7/20/2021 9:54 PM, Christoph Hellwig wrote:
>> -	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
>> -	memset(vaddr, 0, bytes);
>> +	mem->vstart = (void *)set_memory_decrypted_map((unsigned long)vaddr, bytes);
> Please always pass kernel virtual addresses as pointers.
> 
> And I think these APIs might need better names, e.g.
> 
> arch_dma_map_decrypted and arch_dma_unmap_decrypted.
> 
> Also these will need fallback versions for non-x86 architectures that
> currently use memory encryption.

