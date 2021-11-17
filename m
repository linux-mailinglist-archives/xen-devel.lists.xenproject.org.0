Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3188454757
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 14:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226860.392184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnL37-00014e-Gh; Wed, 17 Nov 2021 13:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226860.392184; Wed, 17 Nov 2021 13:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnL37-00011m-Db; Wed, 17 Nov 2021 13:32:29 +0000
Received: by outflank-mailman (input) for mailman id 226860;
 Wed, 17 Nov 2021 13:32:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66jA=QE=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mnL36-00011I-Ey
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 13:32:28 +0000
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce12b810-47aa-11ec-9787-a32c541c8605;
 Wed, 17 Nov 2021 14:32:27 +0100 (CET)
Received: by mail-pj1-x102c.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso2660214pjb.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Nov 2021 05:32:27 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:1a:efea::50b])
 by smtp.gmail.com with ESMTPSA id
 y28sm23237747pfa.208.2021.11.17.05.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 05:32:26 -0800 (PST)
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
X-Inumbo-ID: ce12b810-47aa-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=zR3oNRYhTYJUZxaoak8qMlUuBunZjm5m9hqskt3h3S4=;
        b=ggvPHm4xgldOYNuvLAK0wCZC8fi4QdT92wt9aO0Z1D+A8KeOi+P1P1JWtXkWduE+Ch
         r6ou4FvXsNhepLE8E70VqGkz+/lDwWv7enCCiPmHwIBtd8kf2It6TjK/tqJvLKuShbGK
         0bql4MAv8/pbMx8YyG0cDh/0zTFZMrBCBap5FVuQdaMLz170KD8tA2xrwcyOnV2CGSaU
         XC9McvnV4rtzWcYyCt8336Tl0rj1KT9TWDrtW7oGGCWhI41aW30RYAShzVcOFPieXpQ2
         2szScJ98dW1z6BZ6y4Px5EjFn8WqTBG7cb5V8p7izkymWXTEpGK00GSfEtG9CuZzRkDF
         KZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zR3oNRYhTYJUZxaoak8qMlUuBunZjm5m9hqskt3h3S4=;
        b=y3Op9Pnpuwe+i7e0U/0Wh/imPQqRyA5oAYe8vu0bynXrmIyJnqh5mUp/mU+l+gsfmH
         MmWB6UZ1qBNXH4kIIGsEsfg5pygpxMkGGXqsA7M8lep/4TZ/AvpmxgH/q1uCO6byFA5Z
         pciZ29IAiqQW97wm1VGHkNZcRZrqEpt+NRVwZuQHIeXIH0NqwxgwGO1GId72Ytzmwibv
         bzS/qW6f0ISTeVXXz+bJudJ6LOOH47BiSwn8oTejWu7UpGzlgs3ApS2pNUkXxDUzF8EW
         hGVQRu9GAmRMYALR9IWCuMrexrhWLs8JB7yfvgs3Q7EkpyeaNQwkDCkOLIQExRn78ZUT
         UEaQ==
X-Gm-Message-State: AOAM5321YdCq46OMUfVBe3VMd1Q3I00JkuRM+Se7T66QExO0v1+/5m/j
	VFkOyrJPayIS4WV6aE9t6PI=
X-Google-Smtp-Source: ABdhPJzUpe9LLZVlH0z5E35okJoiJmMYQnfNMpmq8a9kmB7F5FUzY6wGExQKYAIJCpzqgtl9+SISaw==
X-Received: by 2002:a17:90a:ab17:: with SMTP id m23mr9499872pjq.194.1637155946398;
        Wed, 17 Nov 2021 05:32:26 -0800 (PST)
Message-ID: <0ab42ae0-9323-9297-c2c8-1cfc1ebada08@gmail.com>
Date: Wed, 17 Nov 2021 21:32:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/5] x86/Swiotlb: Add Swiotlb bounce buffer remap function
 for HV IVM
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
 <20211116153923.196763-2-ltykernel@gmail.com> <20211117095953.GA10330@lst.de>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <20211117095953.GA10330@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Christoph:
       Thanks for your review.

On 11/17/2021 5:59 PM, Christoph Hellwig wrote:
> The subject is wrong, nothing x86-specific here.  Please use
> "swiotlb: " as the prefix

OK. Will update. Thanks.

> 
>> + * @vaddr:	The vaddr of the swiotlb memory pool. The swiotlb
>> + *		memory pool may be remapped in the memory encrypted case and store
> 
> Please avoid the overly long line. >
>> +	/*
>> +	 * With swiotlb_unencrypted_base setting, swiotlb bounce buffer will
>> +	 * be remapped in the swiotlb_update_mem_attributes() and return here
>> +	 * directly.
>> +	 */
> 
> I'd word this as:
> 
> 	/*
> 	 * If swiotlb_unencrypted_base is set, the bounce buffer memory will
> 	 * be remapped and cleared in swiotlb_update_mem_attributes.
> 	 */

Thanks for suggestion. Will update. Thanks.


>> +	ret = swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
>> +	if (ret) {
>> +		memblock_free(mem->slots, alloc_size);
>> +		return ret;
>> +	}
> 
> With the latest update swiotlb_init_io_tlb_mem will always return 0,
> so no need for the return value change or error handling here.
> 

OK. Will revert the change.

