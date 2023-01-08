Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E20566166B
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 17:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473183.733680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEYCM-0006Qr-Pz; Sun, 08 Jan 2023 16:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473183.733680; Sun, 08 Jan 2023 16:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEYCM-0006Oq-MN; Sun, 08 Jan 2023 16:07:02 +0000
Received: by outflank-mailman (input) for mailman id 473183;
 Sun, 08 Jan 2023 16:07:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEYCL-0006Ok-MQ
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 16:07:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEYCL-0002oi-AO; Sun, 08 Jan 2023 16:07:01 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEYCL-0003go-42; Sun, 08 Jan 2023 16:07:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=lLRsBB8Nv9xfhlmusdMdDlR0vRlqvO+R9Os1teUNfd0=; b=5wgzVLwFES9dTOFu3lJnIuiKzG
	LXRpr0o5mf228VhcGUiIpChjRph8QpFsvZf30LCPs0csfPdxIA544AKUl2NXD3xZ6eUzoMXduKxLQ
	pK2k+BzvpqTXB8+uWqG475hSiB6bPV8A8qHIqNfjISyJMEt/nTvws6H5E3DTwoD0A0Cs=;
Message-ID: <e26768b7-99f7-f4e4-6ae5-094d17e1594a@xen.org>
Date: Sun, 8 Jan 2023 16:06:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
References: <20221221185300.5309-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v4] xen/arm: Probe the load/entry point address of an uImage
 correctly
In-Reply-To: <20221221185300.5309-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/12/2022 18:53, Ayan Kumar Halder wrote:
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

The changes look good to me (with a few of comments below). That said, 
before acking the code, I would like an existing user of uImage (maybe 
EPAM or Arm?) to confirm they are happy with the change.

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
>   docs/misc/arm/booting.txt         | 26 ++++++++++++++++++
>   xen/arch/arm/include/asm/kernel.h |  2 +-
>   xen/arch/arm/kernel.c             | 45 ++++++++++++++++++++++++++++---
>   3 files changed, 69 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 3e0c03e065..12339dfecb 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -23,6 +23,28 @@ The exceptions to this on 32-bit ARM are as follows:
>   
>   There are no exception on 64-bit ARM.
>   
> +Booting Guests
> +--------------
> +
> +Xen supports the legacy image header[3], zImage protocol for 32-bit
> +ARM Linux[1] and Image protocol defined for ARM64[2].
> +
> +Earlier for legacy image protocol, Xen ignored the load address and

We should explicitly say when the change was introduced. So please 
replace "Earlier" with "Until Xen 4.17...". The rest of the sentence may 
be reworded.

> +entry point specified in the header. This has now changed.
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
>   Firmware/bootloader requirements
>   --------------------------------
> @@ -39,3 +61,7 @@ Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
>   
>   [2] linux/Documentation/arm64/booting.rst
>   Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
> +
> +[3] legacy format header
> +Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
> +https://linux.die.net/man/1/mkimage
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 5bb30c3f2f..4617cdc83b 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -72,7 +72,7 @@ struct kernel_info {
>   #ifdef CONFIG_ARM_64
>               paddr_t text_offset; /* 64-bit Image only */
>   #endif
> -            paddr_t start; /* 32-bit zImage only */
> +            paddr_t start; /* Must be 0 for 64-bit Image */
>           } zimage;
>       };
>   };
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 23b840ea9e..58b3db0aa4 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
>       paddr_t load_addr;
>   
>   #ifdef CONFIG_ARM_64
> -    if ( info->type == DOMAIN_64BIT )
> +    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
>           return info->mem.bank[0].start + info->zimage.text_offset;
>   #endif
>   
> @@ -162,7 +162,12 @@ static void __init kernel_zimage_load(struct kernel_info *info)
>       void *kernel;
>       int rc;
>   
> -    info->entry = load_addr;
> +    /*
> +     * If the image does not have a fixed entry point, then use the load
> +     * address as the entry point.
> +     */
> +    if ( info->entry == 0 )
> +        info->entry = load_addr;
>   
>       place_modules(info, load_addr, load_addr + len);
>   
> @@ -223,10 +228,35 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>       if ( len > size - sizeof(uimage) )
>           return -EINVAL;
>   
> +    info->zimage.start = be32_to_cpu(uimage.load);
> +    info->entry = be32_to_cpu(uimage.ep);
> +
> +    /*
> +     * While uboot considers 0x0 to be a valid load/start address, for Xen
> +     * to mantain parity with zimage, we consider 0x0 to denote position

s/mantain/maintain/
s/zimage/zImage/

> +     * independent image. That means Xen is free to load such an image at
> +     * any valid address.
> +     * Thus, we will print an appropriate message.

NIT: No need to say you will print a message.

> +     */
> +    if ( info->zimage.start == 0 )
> +        printk(XENLOG_INFO
> +               "No load address provided. Xen will decide where to load it.\n");

NIT: I would consider to add a else and printing the requested load 
address and entry point.

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
>       info->zimage.kernel_addr = addr + sizeof(uimage);
>       info->zimage.len = len;
>   
> -    info->entry = info->zimage.start;
>       info->load = kernel_zimage_load;
>   
>   #ifdef CONFIG_ARM_64
> @@ -366,6 +396,7 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
>       info->zimage.kernel_addr = addr;
>       info->zimage.len = end - start;
>       info->zimage.text_offset = zimage.text_offset;
> +    info->zimage.start = 0;
>   
>       info->load = kernel_zimage_load;
>   
> @@ -436,6 +467,14 @@ int __init kernel_probe(struct kernel_info *info,
>       u64 kernel_addr, initrd_addr, dtb_addr, size;
>       int rc;
>   
> +    /* We need to initialize start to 0. This field may be populated during

Coding style:

/*
  * Foo
  * Bar
  */

> +     * kernel_xxx_probe() if the image has a fixed entry point (for eg

s/eg/e.g./

> +     * uimage.ep).
> +     * We will use this to determine if the image has a fixed entry point or
> +     * the load address should be used as the start address.
> +     */
> +    info->entry = 0;
> +
>       /* domain is NULL only for the hardware domain */
>       if ( domain == NULL )
>       {

Cheers,

-- 
Julien Grall

