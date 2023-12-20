Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E281A042
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 14:50:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657842.1026975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFwxL-0007gm-Lb; Wed, 20 Dec 2023 13:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657842.1026975; Wed, 20 Dec 2023 13:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFwxL-0007cl-I9; Wed, 20 Dec 2023 13:49:51 +0000
Received: by outflank-mailman (input) for mailman id 657842;
 Wed, 20 Dec 2023 13:49:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFwxJ-0007cf-Si
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 13:49:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFwxJ-00062b-DY; Wed, 20 Dec 2023 13:49:49 +0000
Received: from [15.248.2.151] (helo=[10.6.7.47])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFwxJ-0008Iy-8I; Wed, 20 Dec 2023 13:49:49 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=/1x/NDKNqz3TR74xpq3Bj8QFAwEDItGFgwBm5fRxrj4=; b=x96gHZNauznohK46n1lgy1UqOl
	ToyY5vCs5A6zyahu87zTy5g2SPsba62M0/jYSPsJtpX+zzsyd+n8kHhES59eD38yO7AElOwbnwFi0
	eA7oHrC5CHZijbIsD5YMm467yEC2YTmUU7bcDrz+P8p3Gz+w9AWTdpFsVFenrduaBoDs=;
Message-ID: <0b9c3c86-2fa2-47f1-aa7f-4d833ff86430@xen.org>
Date: Wed, 20 Dec 2023 13:49:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] xen/ppc: Enable bootfdt and boot allocator
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
 <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aa67a0dacab0e3f39dabeb30e31732d617cadde1.1702607884.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2023 02:44, Shawn Anastasio wrote:
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 796ac01c18..7ddfcc7e2a 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -543,12 +543,33 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>       if ( ret < 0 )
>           panic("No valid device tree\n");
>   
> -    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
> -
>       ret = device_tree_for_each_node((void *)fdt, 0, early_scan_node, NULL);
>       if ( ret )
>           panic("Early FDT parsing failed (%d)\n", ret);
>   
> +    /*
> +     * Add module for the FDT itself after the device tree has been parsed. This
> +     * is required on ppc64le where the device tree passed to Xen may have been
> +     * allocated by skiboot, in which case it will exist within a reserved
> +     * region and this call will fail. This is fine, however, since either way
> +     * the allocator will know not to step on the device tree.
> +     */
> +    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);

The consequence is BOOTMOD_FDT will not be added. AFAICT, Arm doesn't 
try to access BOOTMOD_FDT, but I think it would be worth to print message.

> +
> +    /*
> +     * Xen relocates itself at the ppc64 entrypoint, so we need to manually mark
> +     * the kernel module.
> +     */
> +    if ( IS_ENABLED(CONFIG_PPC64) ) {
> +        paddr_t xen_start, xen_end;
> +
> +        xen_start = __pa(_start);
> +        xen_end = PAGE_ALIGN(__pa(_end));
> +        if ( !add_boot_module(BOOTMOD_XEN, xen_start, xen_end, false) )
> +            panic("Xen overlaps reserved memory! %016lx - %016lx\n", xen_start,
> +                xen_end);
> +    }

Can you explain why this is added here rather than in the caller of 
boot_fdt_info()? Either before or after?

If after, I guess it is because of early_print_info(). In which case, I 
would suggest to move off early_print_info() to caller on each architecture.

Cheers,

-- 
Julien Grall

