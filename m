Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA8E979B8C
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 08:51:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799186.1209066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5Zf-0007mN-Mk; Mon, 16 Sep 2024 06:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799186.1209066; Mon, 16 Sep 2024 06:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5Zf-0007kD-Jy; Mon, 16 Sep 2024 06:51:03 +0000
Received: by outflank-mailman (input) for mailman id 799186;
 Mon, 16 Sep 2024 06:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq5Ze-0007k7-2h
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:51:02 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 084e1de5-73f8-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 08:51:00 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f761461150so36232901fa.0
 for <xen-devel@lists.xenproject.org>; Sun, 15 Sep 2024 23:51:00 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f3883sm271634266b.50.2024.09.15.23.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 23:50:59 -0700 (PDT)
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
X-Inumbo-ID: 084e1de5-73f8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726469459; x=1727074259; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPgpIAwUtRjyGXaz2UWsyQSvP3nVeWuucx2LpeEpAfE=;
        b=ULV5Iad3FFZlOWontzD8w+9k96rF2Ub3CqR1D8VB/uqOwLxg7Jhc26lEsclrK83Si0
         Ccq/605Sj1ssqMIu7l5F8rhoiaRB8EsY3pUTVNvzJE0XbTMZS1Q18fS3fzQ2nHQY0YgA
         o84+KNWvUij8G1vFURF07y09pdTDZ0s/gCKm6SWfLeerMnqswZ72EhLlf9rzs2YkyCS6
         s3HGQbHU5ET5DXntKsKlOOp54/DPJfbxzjxHkzwmsAoL1LdMTIQ5p1NGHViZOtrD9bJp
         j47zWPS6tzJOArGG4JvjPVzrNxTZuk5OWMaVw0XeWNU8arhyJ3farAmfMas3bFZAK+Lg
         ATww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726469459; x=1727074259;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPgpIAwUtRjyGXaz2UWsyQSvP3nVeWuucx2LpeEpAfE=;
        b=IaiOKGycW56SdjseEQvvz5suvHvvV3cHUyU+Xaj/eN+nSK8bLY9uQ71/N1sE9P5Yk+
         UL32F8Mc3cOWv0/yHvt/ks3ZvXo5jf49XvayAcCggSYH0DYpMXYpDaamIJQgWFoJFF9V
         qUZxxNDv8+nnbyDi9CnSSzmVApaSxN/ugXkxWbyg4rJsqekhcXKKW6Swawi7aOnpZCv1
         cuHvWJytTZx4p7GCjoRHvOf5yIdIR8Z0KKSVobzkglTBEzG2+WAbzJNSpLOr5twa3lPE
         YHfvkDgjKg+Lh03/mdNTJoxPm3byuntJrBIvfoQhaMdJ7FFikD3wvCeOA+RVM2Cx1flU
         Hhag==
X-Forwarded-Encrypted: i=1; AJvYcCUoUAX8cPoBUMKrCdZI2HnkyLqTZd5LTEFVdmO3LUeaZoXn+jvDVIv+XOb81tLU+N8yhg3PFu+A3nk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIaIWh/oImoegEkJvSjZMGzs7pLTCYBp4mJu5Agzdh751CaZew
	OtVFjeHGjk/f4dwO+rahtj8CugP11MpANvYtIp5xaNlE43M9Qr29RHLF7rM5+w==
X-Google-Smtp-Source: AGHT+IHdV1TNRmBScApbJF/19sNrIq7EW1xqWRb7LFjySq6rhBb9plTuYbfalnfxPg2RJC3tI6SHDQ==
X-Received: by 2002:a2e:bd12:0:b0:2f1:67de:b536 with SMTP id 38308e7fff4ca-2f791a04b9fmr61395021fa.24.1726469459276;
        Sun, 15 Sep 2024 23:50:59 -0700 (PDT)
Message-ID: <d23c9af4-4a79-4300-891a-fba3ea9cbb1c@suse.com>
Date: Mon, 16 Sep 2024 08:50:58 +0200
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240916064748.18071-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2024 08:47, Juergen Gross wrote:
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -78,9 +78,15 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
>  {
>  	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
>  	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
> +	phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
>  
>  	next_bfn = pfn_to_bfn(xen_pfn);
>  
> +	/* If buffer is physically aligned, ensure DMA alignment. */
> +	if (IS_ALIGNED(p, algn) &&
> +	    !IS_ALIGNED(next_bfn << XEN_PAGE_SHIFT, algn))

And this shift is not at risk of losing bits on Arm LPAE?

Jan

