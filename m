Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9101979BBF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799218.1209105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5jw-0003H9-Am; Mon, 16 Sep 2024 07:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799218.1209105; Mon, 16 Sep 2024 07:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5jw-0003FO-89; Mon, 16 Sep 2024 07:01:40 +0000
Received: by outflank-mailman (input) for mailman id 799218;
 Mon, 16 Sep 2024 07:01:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq5jv-0003EC-6K
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:01:39 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 843bdeef-73f9-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 09:01:37 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d51a7d6f5so520256066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 00:01:37 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061321568sm268978266b.191.2024.09.16.00.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Sep 2024 00:01:36 -0700 (PDT)
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
X-Inumbo-ID: 843bdeef-73f9-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726470097; x=1727074897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CFjCBoKriiG3bsVxWjcbX/7DjM3PloTt4D8ntNKj6ak=;
        b=NQ0oCu3l4YKJpWb4M1qkzIIYKLm6dRfLYML3Uqied6y5+FH2pwE1XYWZ34RnzYxetm
         BynmgT9qWVMKS6l7cKYG+KTNDT91SBbPIwXAY8iQw7ui7siDzi8aoZx37Q2XUCw+vGpg
         Zq/7Q1Dbb3V1MfaCsIfl+FbZ6s0MyrxCUy0F/s2D3wsgF3wVkz1yJFKtnCyzqRcCPdcH
         jS7Crgap/irlnUC/iIjDAdadZHtZMbNY/XimhP+V8G7xUGt8VsawFsf6LwNGIlUI1Nai
         uIf2VJCLfwW26WkkLLIUUp9MxGavGgxYB1gY2KAs8rko+Uz7ZWgb6ud01pYy+/dYj81W
         x2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726470097; x=1727074897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CFjCBoKriiG3bsVxWjcbX/7DjM3PloTt4D8ntNKj6ak=;
        b=a94oYg57idaXaIaO9+HrmJIiF1iNrzhEYdSEiB0X2MZ8LX8mSTYg7DBtDzZWOnSynB
         JnegLMjO2LJ4PyJsotKyC33D6Sqfhie5EGjIMMkV0Z6Nl77yG4cJIotDaglwHCClq/bS
         2XezJsKnLpyn+uMaeW38MpuwyvNROoyBsnIBW7I1zaXmU8WtxSSgYwimLbf//qToh6xd
         cQm5jQ3EPR+GRA3NjRyg1VeK2nftqT7GWhfYhQtzbDqBSw9r3HJTin9dgCNKujVpuVdU
         37ZjkFoZLL8PneQxn3mg9icPibGBAKxz4a4+DDWRTYLZ6oib2yRksc1VMnWHTatLgsPC
         TDrg==
X-Forwarded-Encrypted: i=1; AJvYcCVdsrDa85VWua6gJsfRR566uYvWGyQW+jvHp+rnPl9u60gP7i4wqLHustTsXoi8byTrQh1KDlkHcA8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZDlhWQ8K2P4Mjy0qaZfBHZV56OLeKSdKP2fa37yHl71VC0hPs
	jxP2RG8R17cpeEguLJT6eB0c+QBnkmV8VUYAhz5+BRcse3YOtOSS6blFqnurQA==
X-Google-Smtp-Source: AGHT+IG2H8XqbpT8Q3ZMJfToOCB+0WLbtHpvn+Re7pOlLnWqXMfVhKg8+cfsUhl+CFlcLBPYX2i4zg==
X-Received: by 2002:a17:907:e26a:b0:a8d:6329:d8cc with SMTP id a640c23a62f3a-a902943b52fmr1392161066b.25.1726470096749;
        Mon, 16 Sep 2024 00:01:36 -0700 (PDT)
Message-ID: <c3a52494-7ced-42ec-8839-11bd18a7c3d9@suse.com>
Date: Mon, 16 Sep 2024 09:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/swiotlb: add alignment check for dma buffers
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20240916064748.18071-1-jgross@suse.com>
 <20240916064748.18071-2-jgross@suse.com>
 <d23c9af4-4a79-4300-891a-fba3ea9cbb1c@suse.com>
 <c2dd89b4-46c7-4a0a-a47b-70862294176b@suse.com>
 <8866f8a6-e42c-47d2-af6f-c4bdda5a358f@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8866f8a6-e42c-47d2-af6f-c4bdda5a358f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2024 08:59, Juergen Gross wrote:
> On 16.09.24 08:56, Juergen Gross wrote:
>> On 16.09.24 08:50, Jan Beulich wrote:
>>> On 16.09.2024 08:47, Juergen Gross wrote:
>>>> --- a/drivers/xen/swiotlb-xen.c
>>>> +++ b/drivers/xen/swiotlb-xen.c
>>>> @@ -78,9 +78,15 @@ static inline int 
>>>> range_straddles_page_boundary(phys_addr_t p, size_t size)
>>>>   {
>>>>       unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
>>>>       unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
>>>> +    phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
>>>>       next_bfn = pfn_to_bfn(xen_pfn);
>>>> +    /* If buffer is physically aligned, ensure DMA alignment. */
>>>> +    if (IS_ALIGNED(p, algn) &&
>>>> +        !IS_ALIGNED(next_bfn << XEN_PAGE_SHIFT, algn))
>>>
>>> And this shift is not at risk of losing bits on Arm LPAE?
>>
>> For alignment check this just doesn't matter (assuming XEN_PAGE_SIZE is
>> smaller than 4G).
> 
> Wait, that was nonsense.

I think it was quite reasonable, as long as also algn (and hence size)
isn't absurdly large.

Jan

