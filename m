Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94BE1C11CC
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 14:03:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUUNa-0002q0-V1; Fri, 01 May 2020 12:02:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQub=6P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jUUNY-0002pv-ND
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 12:02:52 +0000
X-Inumbo-ID: aeb0f260-8ba3-11ea-9b00-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aeb0f260-8ba3-11ea-9b00-12813bfff9fa;
 Fri, 01 May 2020 12:02:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g12so6106310wmh.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 May 2020 05:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g8BdGaK3T4ewPDAvcqcX4aOkqblz2cj6sMht5XmYlIg=;
 b=STZidTBjy3wOraNnG/zyvqsdwfW3BgSDlkwpCMr4U4Zz7bMxyrYu7Y3H7blTrmEwSG
 wopG418fiUA9G8DXxMNXQXIhbfTn1/LSjTGKzO486lCkAUqoCSQTWS2cGuHqD/42LUbH
 /sqqEqfxL6tIXIBFYflVOYsOl2t8i/ZMYs54dFoQBDfW5zbiat/SkBnFGc5uHxl6ZQGX
 XZcQNNx3K7/RJy1mSuE/8VH3Agx6ofP/rmLOc9yBcof2Ms/u5t+EDEYK/QpOjM5r87kS
 nvhYS4AGZebSNS6K8nLuip/Rxfv8nFdavpLhjxKsPHvrH7dfsK19xWMcJ/IkjWTW2+w1
 5C7A==
X-Gm-Message-State: AGi0PubD4evoLdMWrRVXbwEdp16JGyrhuBThOoyUHbtjYM+FQfSMSg7I
 D2UVuxAphwGcVu9PccPrTtQ=
X-Google-Smtp-Source: APiQypI6FOwjwFUFoxCqiVkExJmPNqtNHhxS4j3S4de2+aPiykkhZf4ltYXR0BbSXlIwgXxO+G3Tlw==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr3990339wml.189.1588334571169; 
 Fri, 01 May 2020 05:02:51 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q8sm3650021wmg.22.2020.05.01.05.02.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 05:02:50 -0700 (PDT)
Date: Fri, 1 May 2020 12:02:49 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hx242@xen.org>
Subject: Re: [PATCH 02/16] acpi: vmap pages in acpi_os_alloc_memory
Message-ID: <20200501120249.bd2w6ksgii4tkrai@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1588278317.git.hongyxia@amazon.com>
 <a71d1903267b84afdb0e54fa2ac55540ab2f9357.1588278317.git.hongyxia@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a71d1903267b84afdb0e54fa2ac55540ab2f9357.1588278317.git.hongyxia@amazon.com>
User-Agent: NeoMutt/20180716
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 30, 2020 at 09:44:11PM +0100, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Also, introduce a wrapper around vmap that maps a contiguous range for
> boot allocations.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> ---
>  xen/drivers/acpi/osl.c | 9 ++++++++-
>  xen/include/xen/vmap.h | 5 +++++
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/acpi/osl.c b/xen/drivers/acpi/osl.c
> index 4c8bb7839e..d0762dad4e 100644
> --- a/xen/drivers/acpi/osl.c
> +++ b/xen/drivers/acpi/osl.c
> @@ -219,7 +219,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
>  	void *ptr;
>  
>  	if (system_state == SYS_STATE_early_boot)
> -		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
> +	{
> +		mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
> +
> +		return vmap_boot_pages(mfn, PFN_UP(sz));
> +	}
>  
>  	ptr = xmalloc_bytes(sz);
>  	ASSERT(!ptr || is_xmalloc_memory(ptr));
> @@ -244,5 +248,8 @@ void __init acpi_os_free_memory(void *ptr)
>  	if (is_xmalloc_memory(ptr))
>  		xfree(ptr);
>  	else if (ptr && system_state == SYS_STATE_early_boot)
> +	{
> +		vunmap(ptr);
>  		init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);
> +	}
>  }
> diff --git a/xen/include/xen/vmap.h b/xen/include/xen/vmap.h
> index 369560e620..c70801e195 100644
> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -23,6 +23,11 @@ void *vmalloc_xen(size_t size);
>  void *vzalloc(size_t size);
>  void vfree(void *va);
>  
> +static inline void *vmap_boot_pages(mfn_t mfn, unsigned int nr_pages)

Nothing seems to tie this to boot pages only. Maybe it is better to name
it after what it does, like vmap_mfns?

> +{
> +    return __vmap(&mfn, nr_pages, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
> +}
> +
>  void __iomem *ioremap(paddr_t, size_t);
>  
>  static inline void iounmap(void __iomem *va)
> -- 
> 2.24.1.AMZN
> 

