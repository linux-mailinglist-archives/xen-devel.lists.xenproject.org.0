Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49A97884C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 20:59:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798424.1208662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spBUs-0006Hl-Iv; Fri, 13 Sep 2024 18:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798424.1208662; Fri, 13 Sep 2024 18:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spBUs-0006GG-Fv; Fri, 13 Sep 2024 18:58:22 +0000
Received: by outflank-mailman (input) for mailman id 798424;
 Fri, 13 Sep 2024 18:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spBUr-0006GA-Ca
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 18:58:21 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24a09666-7202-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 20:58:20 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53655b9bbcdso3174959e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 11:58:20 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835abbsm899355366b.9.2024.09.13.11.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 11:58:19 -0700 (PDT)
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
X-Inumbo-ID: 24a09666-7202-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726253900; x=1726858700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T3J4NFIOs0+/FX7PgSd9/Ty6QD31sDeKjmeTpTdP0F8=;
        b=bjYreaa0QEpIdsVZYPY55owCQXOcTP1OIT4rw+kVz4mWs1/jFt7mc7TczugccvVTiz
         Z7NK+76V45gUpwjtkV+/PTaLlQzZX34YmFWknDHGbl9DHceOa2C4DmC+nEATt+owigO+
         t6gyNWzF5ytQn0n4Tpeg2x0g9XuJXHjbu7do0Tmvz6R2oTxa0bK+KZNml7pSknjcaIUb
         tonBfK93Et6asA4cKAw0UJMyicmMbA/u2VeTNZr7Wup9iq+QvkcN79LKjr45QznAVtKC
         WL8q//eIJ4ITWxOIPBPtPvm+cA61R8c/G40N5+jGjLiZEiniGxRLKQ44aWr4aKNlFMfQ
         iv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726253900; x=1726858700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T3J4NFIOs0+/FX7PgSd9/Ty6QD31sDeKjmeTpTdP0F8=;
        b=ttxcjaEAz7BbPVir28zvi4GNqd6NrbfEmoBgbUGur5zgDsthOMufus12IvrqM0KvGj
         lTsf/eKUK0UepHXEEk4IyEBOJPYmGG4/PRHWoVXsaVObVzJKWMkel/b07hj7T5GHwmpU
         XjxpNJLgsKJFhA6ZjEgjCveWw+LR7mralIFOjuXpp5tsLkzBJadyOQIEt5865UA2ND5O
         zzEpfCgwZaIHlseMgq1VgYxLmkgGNW4QQwkN5Gb6h6gjVjNFg7UhtY+gSIqXBA+8OKL3
         0Bt+OU3maVx0LPMGIiQR8Ualq1FDmuMEU4azl/IywxXeE2tOqk5BGdpgnuycZJ0iC4AX
         Bnyw==
X-Forwarded-Encrypted: i=1; AJvYcCUXgFSenjmjTnps2SjwY5beJzXmfW/kC2H+Flo1LAWpSi43BT9VcVM166g2kYBZBa/VQoHXGlWqlZk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybCJMXYM2/brbO378qsXXMBmdNShtHmrpc2BoBt08y7FfQkRNO
	w6bFRyaZI1nJU3c3ol8fJhoSFRCUQAFgWUBOlUM8cRRc7MsSHbWnXZNZi+b2zAFPZRS0WLFGWss
	bxg==
X-Google-Smtp-Source: AGHT+IF5N3upnOExA4ETmw6SPMAW1YtxHaD4AcLqU3pOspc/IzZqS/Fny+Rg32WkLJRydanP7pzleQ==
X-Received: by 2002:a05:6512:220c:b0:52f:df:db40 with SMTP id 2adb3069b0e04-53678fec496mr4582246e87.56.1726253899415;
        Fri, 13 Sep 2024 11:58:19 -0700 (PDT)
Message-ID: <a0b0dec5-03c1-4b69-aa0e-65771251d859@suse.com>
Date: Fri, 13 Sep 2024 20:58:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/swiotlb: add alignment check for dma buffers
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20240913145655.10076-1-jgross@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240913145655.10076-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 16:56, Juergen Gross wrote:
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -78,9 +78,15 @@ static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
>  {
>  	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
>  	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
> +	unsigned int order = get_order(size);
>  
>  	next_bfn = pfn_to_bfn(xen_pfn);
>  
> +	/* If buffer is physically aligned, ensure DMA alignment. */
> +	if (IS_ALIGNED(p, 1UL << (order + PAGE_SHIFT)) &&

Why this check? xen_swiotlb_alloc_coherent() guarantees it, while
xen_swiotlb_free_coherent() only checks properties of the original
allocation. And for xen_swiotlb_map_page() this looks actively
wrong to me, in case that function was called with offset non-zero.

Unrelated to this, but in related code: xen_swiotlb_alloc_coherent()
can't validly use XEN_PAGE_SHIFT, can it (in the way it does at
least)? If XEN_PAGE_SHIFT < PAGE_SHIFT, and with order calculated
from the latter, the used size will be too small afaict.

Jan

