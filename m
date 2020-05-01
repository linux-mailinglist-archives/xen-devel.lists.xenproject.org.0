Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0828F1C0FDC
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 10:43:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jURGs-0002kB-9o; Fri, 01 May 2020 08:43:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7FD=6P=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jURGr-0002k6-27
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 08:43:45 +0000
X-Inumbo-ID: dd3b0c40-8b87-11ea-9af3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd3b0c40-8b87-11ea-9af3-12813bfff9fa;
 Fri, 01 May 2020 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b+53yu1rnlYHaiiQO100tmKyI0+mZyB8g8q6Jmwu8To=; b=V9sPWVIaProBwpyhJH/YqEL7cn
 I7/xMi+HdlvFazzpD3YomuC3HhRo4RdOzYS5i5PkyJnuTZ7Z2kXiDCfP+o+x/I4xhuoF4N9lZ0pCu
 WxVzGMuObs7yfejwTby5R5SBb2jgkp5IRlYLP02Ykforj8kr0/Us1TIZyaRRfyxIp6sw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jURGl-00058C-NK; Fri, 01 May 2020 08:43:39 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jURGl-0002jv-Gb; Fri, 01 May 2020 08:43:39 +0000
Subject: Re: [PATCH 11/16] x86: add a boot option to enable and disable the
 direct map
To: Hongyan Xia <hx242@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1588278317.git.hongyxia@amazon.com>
 <7360b59e8fd39796fee56430a437b20c948d08c2.1588278317.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <91d65dd4-ef38-9d42-c4ac-275831acdb61@xen.org>
Date: Fri, 1 May 2020 09:43:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7360b59e8fd39796fee56430a437b20c948d08c2.1588278317.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Hongyan,

On 30/04/2020 21:44, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Also add a helper function to retrieve it. Change arch_mfn_in_direct_map
> to check this option before returning.
> 
> This is added as a boot command line option, not a Kconfig. We do not
> produce different builds for EC2 so this is not introduced as a
> compile-time configuration.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> ---
>   docs/misc/xen-command-line.pandoc | 12 ++++++++++++
>   xen/arch/x86/mm.c                 |  3 +++
>   xen/arch/x86/setup.c              |  2 ++
>   xen/include/asm-arm/mm.h          |  5 +++++
>   xen/include/asm-x86/mm.h          | 17 ++++++++++++++++-
>   5 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index ee12b0f53f..7027e3a15c 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -652,6 +652,18 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
>   additionally a trace buffer of the specified size is allocated per cpu.
>   The debug trace feature is only enabled in debugging builds of Xen.
>   
> +### directmap (x86)
> +> `= <boolean>`
> +
> +> Default: `true`
> +
> +Enable or disable the direct map region in Xen.
> +
> +By default, Xen creates the direct map region which maps physical memory
> +in that region. Setting this to no will remove the direct map, blocking
> +exploits that leak secrets via speculative memory access in the direct
> +map.
> +
>   ### dma_bits
>   > `= <integer>`
>   
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index b3530d2763..64da997764 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -162,6 +162,9 @@ l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>   l1_pgentry_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
>       l1_fixmap_x[L1_PAGETABLE_ENTRIES];
>   
> +bool __read_mostly opt_directmap = true;
> +boolean_param("directmap", opt_directmap);
> +
>   paddr_t __read_mostly mem_hotplug;
>   
>   /* Frame table size in pages. */
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index faca8c9758..60fc4038be 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1282,6 +1282,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>       if ( highmem_start )
>           xenheap_max_mfn(PFN_DOWN(highmem_start - 1));
>   
> +    printk("Booting with directmap %s\n", arch_has_directmap() ? "on" : "off");
> +
>       /*
>        * Walk every RAM region and map it in its entirety (on x86/64, at least)
>        * and notify it to the boot allocator.
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index 7df91280bc..e6fd934113 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -366,6 +366,11 @@ int arch_acquire_resource(struct domain *d, unsigned int type, unsigned int id,
>       return -EOPNOTSUPP;
>   }
>   
> +static inline bool arch_has_directmap(void)
> +{
> +    return true;

arm32 doesn't have a directmap, so this needs to be false for arm32 and 
true for arm64.

I would also like the implementation of the helper close to 
arch_mfn_in_directmap() in asm-arm/arm*/mm.h.

Cheers,

-- 
Julien Grall

