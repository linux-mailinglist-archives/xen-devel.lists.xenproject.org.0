Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006E676029
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 23:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482191.747582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIzsP-0004hN-0k; Fri, 20 Jan 2023 22:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482191.747582; Fri, 20 Jan 2023 22:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIzsO-0004fO-U8; Fri, 20 Jan 2023 22:28:48 +0000
Received: by outflank-mailman (input) for mailman id 482191;
 Fri, 20 Jan 2023 22:28:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wqBo=5R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIzsM-0004fI-Pq
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 22:28:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccf24aac-9911-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 23:28:45 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88BB1B8281D;
 Fri, 20 Jan 2023 22:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0C0C433D2;
 Fri, 20 Jan 2023 22:28:41 +0000 (UTC)
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
X-Inumbo-ID: ccf24aac-9911-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674253723;
	bh=0zA2rPCCHQ259R5K2c/kxHPddRl9N5ci+NTgr6kWmys=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CzTV9BoGqdM9g3GMcTCMI01ve13/PEi1zvuCxGx/cp1dgR6PU+wY4NZmxggP92XI9
	 vwL3Qpm5IW1naj/5TXXFxbr5nUXqiyQSfE+kUCgF7T3ixNMd8k3DAos21bRZWchvmM
	 QZCdABED/w1+pKpf0O578lamoLGDBpvrgFou3vlF1+FQ5mcaicKhf3PU4QcE7lON8v
	 ZdcjJuBSU47lNbd2gctk90F4mG+rzVJcjy6XxkoHHI/bDqzqWEDR2rCRM8Sxlz5ppi
	 4iLudz6RpgAcEg7TufTX2eJ/R60ta6YvqeHdze6O5lYTYq54HLsjmda7jQZontXn+B
	 Rbrp4oAyJGIYA==
Date: Fri, 20 Jan 2023 14:28:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, michal.orzel@amd.com
Subject: Re: [XEN v5] xen/arm: Probe the load/entry point address of an uImage
 correctly
In-Reply-To: <20230113122423.22902-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301201422410.731018@ubuntu-linux-20-04-desktop>
References: <20230113122423.22902-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 13 Jan 2023, Ayan Kumar Halder wrote:
> Currently, kernel_uimage_probe() does not read the load/entry point address
> set in the uImge header. Thus, info->zimage.start is 0 (default value). This
> causes, kernel_zimage_place() to treat the binary (contained within uImage)
> as position independent executable. Thus, it loads it at an incorrect
> address.
> 
> The correct approach would be to read "uimage.load" and set
> info->zimage.start. This will ensure that the binary is loaded at the
> correct address. Also, read "uimage.ep" and set info->entry (ie kernel entry
> address).
> 
> If user provides load address (ie "uimage.load") as 0x0, then the image is
> treated as position independent executable. Xen can load such an image at
> any address it considers appropriate. A position independent executable
> cannot have a fixed entry point address.
> 
> This behavior is applicable for both arm32 and arm64 platforms.
> 
> Earlier for arm32 and arm64 platforms, Xen was ignoring the load and entry
> point address set in the uImage header. With this commit, Xen will use them.
> This makes the behavior of Xen consistent with uboot for uimage headers.
> 
> Users who want to use Xen with statically partitioned domains, can provide
> non zero load address and entry address for the dom0/domU kernel. It is
> required that the load and entry address provided must be within the memory
> region allocated by Xen.
> 
> A deviation from uboot behaviour is that we consider load address == 0x0,
> to denote that the image supports position independent execution. This
> is to make the behavior consistent across uImage and zImage.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from v1 :-
> 1. Added a check to ensure load address and entry address are the same.
> 2. Considered load address == 0x0 as position independent execution.
> 3. Ensured that the uImage header interpretation is consistent across
> arm32 and arm64.
> 
> v2 :-
> 1. Mentioned the change in existing behavior in booting.txt.
> 2. Updated booting.txt with a new section to document "Booting Guests".
> 
> v3 :-
> 1. Removed the constraint that the entry point should be same as the load
> address. Thus, Xen uses both the load address and entry point to determine
> where the image is to be copied and the start address.
> 2. Updated documentation to denote that load address and start address
> should be within the memory region allocated by Xen.
> 3. Added constraint that user cannot provide entry point for a position
> independent executable (PIE) image.
> 
> v4 :-
> 1. Explicitly mentioned the version in booting.txt from when the uImage
> probing behavior has changed.
> 2. Logged the requested load address and entry point parsed from the uImage
> header.
> 3. Some style issues.
> 
>  docs/misc/arm/booting.txt         | 26 ++++++++++++++++
>  xen/arch/arm/include/asm/kernel.h |  2 +-
>  xen/arch/arm/kernel.c             | 49 +++++++++++++++++++++++++++++--
>  3 files changed, 73 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 3e0c03e065..aeb0123e8d 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -23,6 +23,28 @@ The exceptions to this on 32-bit ARM are as follows:
>  
>  There are no exception on 64-bit ARM.
>  
> +Booting Guests
> +--------------
> +
> +Xen supports the legacy image header[3], zImage protocol for 32-bit
> +ARM Linux[1] and Image protocol defined for ARM64[2].
> +
> +Until Xen 4.17, in case of legacy image protocol, Xen ignored the load
> +address and entry point specified in the header. This has now changed.
> +
> +Now, it loads the image at the load address provided in the header.
> +And the entry point is used as the kernel start address.
> +
> +A deviation from uboot is that, Xen treats "load address == 0x0" as
> +position independent execution (PIE). Thus, Xen will load such an image
> +at an address it considers appropriate. Also, user cannot specify the
> +entry point of a PIE image since the start address cennot be
> +predetermined.
> +
> +Users who want to use Xen with statically partitioned domains, can provide
> +the fixed non zero load address and start address for the dom0/domU kernel.
> +The load address and start address specified by the user in the header must
> +be within the memory region allocated by Xen.
>  
>  Firmware/bootloader requirements
>  --------------------------------
> @@ -39,3 +61,7 @@ Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
>  
>  [2] linux/Documentation/arm64/booting.rst
>  Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
> +
> +[3] legacy format header
> +Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
> +https://linux.die.net/man/1/mkimage
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 5bb30c3f2f..4617cdc83b 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -72,7 +72,7 @@ struct kernel_info {
>  #ifdef CONFIG_ARM_64
>              paddr_t text_offset; /* 64-bit Image only */
>  #endif
> -            paddr_t start; /* 32-bit zImage only */
> +            paddr_t start; /* Must be 0 for 64-bit Image */
>          } zimage;
>      };
>  };
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 23b840ea9e..0b7f591857 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>      paddr_t load_addr;
>  
>  #ifdef CONFIG_ARM_64
> -    if ( info->type == DOMAIN_64BIT )
> +    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
>          return info->mem.bank[0].start + info->zimage.text_offset;

This is an issue because if we have a zImage64 kernel binary with a
uimage header, we are not setting zimage.text_offset appropriately, if I
am not mistaken.

The way booting.txt is written in this patch, I think the matching
behavior would be that if there is a uimage header, then the zImage64
header is ignored. If the uimage header has uimage.load == zero, then
we should allocate the load_addr for the kernel (PIE case).

I think it would also be OK if we choose the different behavior that if
there is a uimage header but uimage.load == zero, then we look at
zImage64.text_offset next.

Either way is OK for me as long as it is clearly specified in
booting.txt.




>  #endif
>  
> @@ -162,7 +162,12 @@ static void __init kernel_zimage_load(struct kernel_info *info)
>      void *kernel;
>      int rc;
>  
> -    info->entry = load_addr;
> +    /*
> +     * If the image does not have a fixed entry point, then use the load
> +     * address as the entry point.
> +     */
> +    if ( info->entry == 0 )
> +        info->entry = load_addr;
>  
>      place_modules(info, load_addr, load_addr + len);
>  
> @@ -223,10 +228,38 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>      if ( len > size - sizeof(uimage) )
>          return -EINVAL;
>  
> +    info->zimage.start = be32_to_cpu(uimage.load);
> +    info->entry = be32_to_cpu(uimage.ep);
> +
> +    /*
> +     * While uboot considers 0x0 to be a valid load/start address, for Xen
> +     * to maintain parity with zImage, we consider 0x0 to denote position
> +     * independent image. That means Xen is free to load such an image at
> +     * any valid address.
> +     */
> +    if ( info->zimage.start == 0 )
> +        printk(XENLOG_INFO
> +               "No load address provided. Xen will decide where to load it.\n");
> +    else
> +        printk(XENLOG_INFO
> +               "Provided load address: %"PRIpaddr" and entry address: %"PRIpaddr"\n",
> +               info->zimage.start, info->entry);
> +
> +    /*
> +     * If the image supports position independent execution, then user cannot
> +     * provide an entry point as Xen will load such an image at any appropriate
> +     * memory address. Thus, we need to return error.
> +     */
> +    if ( (info->zimage.start == 0) && (info->entry != 0) )
> +    {
> +        printk(XENLOG_ERR
> +               "Entry point cannot be non zero for PIE image.\n");
> +        return -EINVAL;
> +    }
> +
>      info->zimage.kernel_addr = addr + sizeof(uimage);
>      info->zimage.len = len;
>  
> -    info->entry = info->zimage.start;
>      info->load = kernel_zimage_load;
>  
>  #ifdef CONFIG_ARM_64
> @@ -366,6 +399,7 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
>      info->zimage.kernel_addr = addr;
>      info->zimage.len = end - start;
>      info->zimage.text_offset = zimage.text_offset;
> +    info->zimage.start = 0;
>  
>      info->load = kernel_zimage_load;
>  
> @@ -436,6 +470,15 @@ int __init kernel_probe(struct kernel_info *info,
>      u64 kernel_addr, initrd_addr, dtb_addr, size;
>      int rc;
>  
> +    /*
> +     * We need to initialize start to 0. This field may be populated during
> +     * kernel_xxx_probe() if the image has a fixed entry point (for e.g.
> +     * uimage.ep).
> +     * We will use this to determine if the image has a fixed entry point or
> +     * the load address should be used as the start address.
> +     */
> +    info->entry = 0;
> +
>      /* domain is NULL only for the hardware domain */
>      if ( domain == NULL )
>      {
> -- 
> 2.17.1
> 
> 

