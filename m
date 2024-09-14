Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87B978E23
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2024 07:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798564.1208771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spLn0-0005dc-Hi; Sat, 14 Sep 2024 05:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798564.1208771; Sat, 14 Sep 2024 05:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spLn0-0005bJ-F2; Sat, 14 Sep 2024 05:57:46 +0000
Received: by outflank-mailman (input) for mailman id 798564;
 Sat, 14 Sep 2024 05:57:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spLmz-0005bD-TT
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2024 05:57:45 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41f908e4-725e-11ef-99a2-01e77a169b0f;
 Sat, 14 Sep 2024 07:57:43 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a90349aa7e5so303469066b.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 22:57:43 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610966ccsm37044366b.45.2024.09.13.22.57.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 22:57:42 -0700 (PDT)
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
X-Inumbo-ID: 41f908e4-725e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726293463; x=1726898263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jj7BI1d/P05L4yR+fUrwV54+pcNt/eQNbd1AyE1f2W0=;
        b=b3phsrHOnnVAiAOtQ80kgeeVPN6UdpaIiCccwoSr6/SlPH4Qte2ujod7PXODeyIxbF
         iq50Q1jwNCJdSlvxh51ihqU/V8RiZeuNZYM+OPyCxu8mszMdCKabuhZeCx9zSCzIfTH+
         nzbg1osDAzjkn4xmG6FVK82aDxRKVcsiB+Nehe1aOzC64lfTU7RbqcQx6ycWJBFqqoxW
         6d/2NYAwq9RuQQ9jn1lVctgu+6kpTCu6ETaHy3l9vtXVB8ttRg169/mLaA7ijjvTfU18
         nmpePZadu0g5XceoyYufsv7i88EsGDHYpemZaTbVp/UcCDdRWrNIpndTSZ7XTJHjGPMU
         dscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726293463; x=1726898263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jj7BI1d/P05L4yR+fUrwV54+pcNt/eQNbd1AyE1f2W0=;
        b=WO1QFCI922zanJfYyL9onPvhECNFh7+XKJrzd7mm7YhOIMzIkQ9mSbR1J4D9kKuuUb
         qORsrK4B93RH6EqmkqVCexu9JtWnZyIVzLuPgZ8zp31s/0xZgvqPhK5gBaX6yRZi2ALw
         HlxfpDFR6Moa8K/5K/xNs+BIBKD/IkHe/qezod7Q8yZHL5OfqeNnzlA4u2KYd903/NRf
         QxhqKw+XV8DTW8gWe/1kQzevjK7AelYVKNHg9YMBCu7vNpLHzBn/u7+l/lp/l83a2cpc
         MGdqHvnRgTJ0rmaIIFUZAY6muWntJ5XUGfweLvcmsLjyTHvQyOaGe8urw+YhlBnjueg6
         Tdig==
X-Forwarded-Encrypted: i=1; AJvYcCVoqqOAbTSZx3hIesxgvK3p7Aw5PusVfeB8mxG1jOe+hT7EaB7fFTGp8JMSqdfbtTjdZXbJU9VZRuU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXGr4Kfm2oLH/2DtVFZPkkq9Dn4qPoHhugDITmBomy0YyyX4KH
	hq6FuWIGd91uEeloxzD5n2lWoXhPLvgIM0PsWBnRFZHCNxLpBglyxQpZ8egdyg==
X-Google-Smtp-Source: AGHT+IHQRdOpdMJ4Y1cJj+samNp4BzlrRh+uCRWFfdK6L+8JVEJRsNx51Bj2WAtb1ztXOUZFBjsz3w==
X-Received: by 2002:a17:907:94d4:b0:a90:34e8:780f with SMTP id a640c23a62f3a-a9034e87ae4mr673589866b.63.1726293462430;
        Fri, 13 Sep 2024 22:57:42 -0700 (PDT)
Message-ID: <e5a05e0a-ce58-4779-ae7e-c3803af82d3a@suse.com>
Date: Sat, 14 Sep 2024 07:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/swiotlb: add alignment check for dma buffers
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20240913145655.10076-1-jgross@suse.com>
 <a0b0dec5-03c1-4b69-aa0e-65771251d859@suse.com>
 <alpine.DEB.2.22.394.2409131728420.1417852@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2409131728420.1417852@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.09.2024 02:38, Stefano Stabellini wrote:
> On Fri, 13 Sep 2024, Jan Beulich wrote:
>> On 13.09.2024 16:56, Juergen Gross wrote:
>>> --- a/drivers/xen/swiotlb-xen.c
>>> +++ b/drivers/xen/swiotlb-xen.c
>>> @@ -78,9 +78,15 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
>>>  {
>>>  	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
>>>  	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
>>> +	unsigned int order = get_order(size);
>>>  
>>>  	next_bfn = pfn_to_bfn(xen_pfn);
>>>  
>>> +	/* If buffer is physically aligned, ensure DMA alignment. */
>>> +	if (IS_ALIGNED(p, 1UL << (order + PAGE_SHIFT)) &&
>>
>> Why this check? xen_swiotlb_alloc_coherent() guarantees it, while
>> xen_swiotlb_free_coherent() only checks properties of the original
>> allocation. And for xen_swiotlb_map_page() this looks actively
>> wrong to me, in case that function was called with offset non-zero.
> 
> I understand xen_swiotlb_alloc_coherent and xen_swiotlb_free_coherent
> not needing the check, but I think we might need the check for
> xen_swiotlb_map_page. At that point, I would keep the check for all
> callers.

Whereas I would be inclined to suggest to put it in the one place it's
needed, not the least to avoid the abuse of the function (going just
from its name).

> Unless there is another way to detect whether the mapping needs
> alignment specifically for map_page?
> 
> For the offset, in theory if the device needs alignment, the offset
> should be zero? If the offset is not zero, then there should be no
> alignment requirement. The way Juergen wrote the check, we would take
> the fast path if offset != zero, which makes sense to me.

Hmm, right.

Jan

