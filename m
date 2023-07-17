Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF6755B2A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 08:07:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564156.881417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLHNB-0004EB-Ig; Mon, 17 Jul 2023 06:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564156.881417; Mon, 17 Jul 2023 06:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLHNB-0004C8-Fd; Mon, 17 Jul 2023 06:06:17 +0000
Received: by outflank-mailman (input) for mailman id 564156;
 Mon, 17 Jul 2023 06:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cA2O=DD=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qLHN9-0004C0-9c
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 06:06:15 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08153a18-2468-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 08:06:12 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9338e4695so19911751fa.2
 for <xen-devel@lists.xenproject.org>; Sun, 16 Jul 2023 23:06:12 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.144.39])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a5d4e05000000b003143d80d11dsm18078305wrt.112.2023.07.16.23.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jul 2023 23:06:11 -0700 (PDT)
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
X-Inumbo-ID: 08153a18-2468-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689573972; x=1692165972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V9PPbgd68wocT4TvRhmcO/nETjGOz62AhMV/Wt93B7Q=;
        b=ms+Ay07n0lyPm2SMUObQ9GjdsaldYs4VUWpkhI9RsYlip9CudCjC8ofTEhWMxc+gbc
         K0YtVClyOIFxttDZLliNzf3gbsIu835cEAVjrm05LoLwmD+xEpYYmElER6/tTcPAFvd/
         p2lztdzYDwdRIgKoaXXCaQGNTdGxMByqHznLfQzrSXnEnAliyuQIuPJ2DHdt8U8hDVUj
         pIIVhdinE7fn9LMpO4v4GDRrX6wVNxGYi92lYsJ/m30w58uxf/A8pv9pmFF9oslSdX7C
         f8TXdN/IpdnuJOIClc5E5kJaWu5AzB+RIbuDksQjbE4lIlj/YHAncSTpNp/lY1qETdK/
         eyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689573972; x=1692165972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9PPbgd68wocT4TvRhmcO/nETjGOz62AhMV/Wt93B7Q=;
        b=NO/8CSZ+nOSkfxQzYzwn7peHFmXhOQ77eJxHVdxApRljAaMNtLDlILrcJ3/4m1ilUQ
         weYZgdBBxHaBHS5tnGoRNJodNlccs5ZpUbr5XUoUUbKjVFD39Fa7S6lomTKlHJ36I4RI
         Ws+G3Dqu9KV6sh3yZ/Y8hUVFB+ypHIqIcK8qANf8R/td9EP07xdtbIFTZd3F0kkT7AUb
         tiE2xIydVH+8mJH4kWqzEjOQJpqyepewM5VMpm2ux6JnEsSpr2RGK1ZAaYebK1yYvft0
         j7R/KTTYsZBf6w+Pve0iQkA9Bw8wtmKCCPkb2WyDXkKpX3AtIBWtLDbXsvJKTLmLD8dd
         RTMA==
X-Gm-Message-State: ABy/qLazzePH2L62wsZhZ1BQSk/XW3jdR5Le2wjHk9AFmxY5Z9vCYToX
	sRbaAsdG3WEFrRY+aM/2ZVtTYQ==
X-Google-Smtp-Source: APBJJlHW/NFDKdvFhoq+y8xrvjg5fcDRitDcC29a/QX354QST/fiAOhwToFZQukWGxzIAoA8z/fnRA==
X-Received: by 2002:a05:6512:1181:b0:4fb:7d73:d097 with SMTP id g1-20020a056512118100b004fb7d73d097mr6674575lfr.39.1689573972086;
        Sun, 16 Jul 2023 23:06:12 -0700 (PDT)
Message-ID: <45f89fee-6825-3f5d-9dfb-aad5d47c8c36@linaro.org>
Date: Mon, 17 Jul 2023 08:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/8] swiotlb: make io_tlb_default_mem local to
 swiotlb.c
Content-Language: en-US
To: Petr Tesarik <petrtesarik@huaweicloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Juergen Gross <jgross@suse.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Petr Tesarik <petr.tesarik.ext@huawei.com>, Jonathan Corbet
 <corbet@lwn.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, James Seo <james@equiv.tech>,
 James Clark <james.clark@arm.com>, Kees Cook <keescook@chromium.org>,
 "moderated list:XEN HYPERVISOR ARM" <xen-devel@lists.xenproject.org>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list:XEN SWIOTLB SUBSYSTEM" <iommu@lists.linux.dev>
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, petr@tesarici.cz
References: <cover.1689261692.git.petr.tesarik.ext@huawei.com>
 <7f64111986f4f361a2deb4a1a1b6f588e63a851b.1689261692.git.petr.tesarik.ext@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <7f64111986f4f361a2deb4a1a1b6f588e63a851b.1689261692.git.petr.tesarik.ext@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Petr,

On 13/7/23 17:23, Petr Tesarik wrote:
> From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> 
> SWIOTLB implementation details should not be exposed to the rest of the
> kernel. This will allow to make changes to the implementation without
> modifying non-swiotlb code.
> 
> To avoid breaking existing users, provide helper functions for the few
> required fields.
> 
> As a bonus, using a helper function to initialize struct device allows to
> get rid of an #ifdef in driver core.
> 
> Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
> ---
>   arch/arm/xen/mm.c          |  2 +-
>   arch/mips/pci/pci-octeon.c |  2 +-
>   arch/x86/kernel/pci-dma.c  |  2 +-
>   drivers/base/core.c        |  4 +---
>   drivers/xen/swiotlb-xen.c  |  2 +-
>   include/linux/swiotlb.h    | 25 +++++++++++++++++++++++-
>   kernel/dma/swiotlb.c       | 39 +++++++++++++++++++++++++++++++++++++-
>   7 files changed, 67 insertions(+), 9 deletions(-)


> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 4e52cd5e0bdc..07216af59e93 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -110,7 +110,6 @@ struct io_tlb_mem {
>   	atomic_long_t used_hiwater;
>   #endif
>   };
> -extern struct io_tlb_mem io_tlb_default_mem;
>   
>   static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
>   {
> @@ -128,13 +127,22 @@ static inline bool is_swiotlb_force_bounce(struct device *dev)
>   
>   void swiotlb_init(bool addressing_limited, unsigned int flags);
>   void __init swiotlb_exit(void);
> +void swiotlb_dev_init(struct device *dev);
>   size_t swiotlb_max_mapping_size(struct device *dev);
> +bool is_swiotlb_allocated(void);
>   bool is_swiotlb_active(struct device *dev);
>   void __init swiotlb_adjust_size(unsigned long size);
> +phys_addr_t default_swiotlb_start(void);
> +phys_addr_t default_swiotlb_limit(void);

Usually we use start/end, base/limit, low[est]/high[est] tuples.

Possibly clearer to rename, regardless:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 2b83e3ad9dca..873b077d7e37 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c


> @@ -958,6 +975,26 @@ bool is_swiotlb_active(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(is_swiotlb_active);
>   
> +/**
> + * default_swiotlb_start() - get the start of the default SWIOTLB
> + *
> + * Get the lowest physical address used by the default software IO TLB pool.
> + */
> +phys_addr_t default_swiotlb_start(void)
> +{
> +	return io_tlb_default_mem.start;
> +}
> +
> +/**
> + * default_swiotlb_limit() - get the highest address in the default SWIOTLB
> + *
> + * Get the highest physical address used by the default software IO TLB pool.

(note you describe lowest/highest).

> + */
> +phys_addr_t default_swiotlb_limit(void)
> +{
> +	return io_tlb_default_mem.end - 1;
> +}
> +
>   #ifdef CONFIG_DEBUG_FS
>   
>   static int io_tlb_used_get(void *data, u64 *val)


