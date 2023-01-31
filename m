Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEF768375B
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 21:21:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487830.755538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMx77-0000De-Rs; Tue, 31 Jan 2023 20:20:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487830.755538; Tue, 31 Jan 2023 20:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMx77-0000Al-OP; Tue, 31 Jan 2023 20:20:21 +0000
Received: by outflank-mailman (input) for mailman id 487830;
 Tue, 31 Jan 2023 20:20:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMx76-0000Af-Ae
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 20:20:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMx75-0004j3-QQ; Tue, 31 Jan 2023 20:20:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMx75-0002uj-Kf; Tue, 31 Jan 2023 20:20:19 +0000
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
	bh=F67LMJB+JfmwgmqBSyKzNJtd9PQ9rnK3eySxGXwv7tQ=; b=L+ju8Erk0PI1XsWTZOZ5S9HuEY
	J1c0mTW5gRVnlsOF/3PzREub+nb18XdoI8On78kS/1GPaiDf4ubgvh9+sb8hsmzZPZGil21WZ3/3U
	YelBv1SUCP4O0WgdntJ+FlRq6bHK4WLZYAN4KMzh5CYWopb/9cfxonA1xhjVFGBOsXuE=;
Message-ID: <653d05c1-a860-052c-4ce2-55998c77db42@xen.org>
Date: Tue, 31 Jan 2023 20:20:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, ayankuma@amd.com
References: <20230131151354.25943-1-michal.orzel@amd.com>
 <20230131151354.25943-3-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/2] xen/arm: Add support for booting gzip compressed
 uImages
In-Reply-To: <20230131151354.25943-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 31/01/2023 15:13, Michal Orzel wrote:
> At the moment, Xen does not support booting gzip compressed uImages.
> This is because we are trying to decompress the kernel before probing
> the u-boot header. This leads to a failure as the header always appears
> at the top of the image (and therefore obscuring the gzip header).
> 
> Move the call to kernel_uimage_probe before kernel_decompress and make
> the function self-containing by taking the following actions:
>   - take a pointer to struct bootmodule as a parameter,
>   - check the comp field of a u-boot header to determine compression type,
>   - in case of compressed image, modify boot module start address and size
>     by taking the header size into account and call kernel_decompress,
>   - set up zimage.{kernel_addr,len} accordingly,
>   - return -ENOENT in case of a u-boot header not found to distinguish it
>     amongst other return values and make it the only case for falling
>     through to try to probe other image types.
> 
> This is done to avoid splitting the uImage probing into 2 stages (executed
> before and after decompression) which otherwise would be necessary to
> properly update boot module start and size before decompression and
> zimage.{kernel_addr,len} afterwards.

AFAIU, it would be possible to have a zImage/Image header embedded in 
the uImage. So any reason to only handle a compressed binary?

> 
> Remove the limitation from the booting.txt documentation.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
>   docs/misc/arm/booting.txt |  3 ---
>   xen/arch/arm/kernel.c     | 51 ++++++++++++++++++++++++++++++++++-----
>   2 files changed, 45 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index bd7bfe7f284a..02f7bb65ec6d 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -50,9 +50,6 @@ Also, it is to be noted that if user provides the legacy image header on
>   top of zImage or Image header, then Xen uses the attributes of legacy
>   image header to determine the load address, entry point, etc.
>   
> -Known limitation: compressed kernels with a uboot headers are not
> -working.
> -
>   
>   Firmware/bootloader requirements
>   --------------------------------
> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
> index 068fbf88e492..ea5f9618169e 100644
> --- a/xen/arch/arm/kernel.c
> +++ b/xen/arch/arm/kernel.c
> @@ -265,11 +265,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
>   #define IH_ARCH_ARM             2       /* ARM          */
>   #define IH_ARCH_ARM64           22      /* ARM64        */
>   
> +/* uImage Compression Types */
> +#define IH_COMP_GZIP            1
> +
>   /*
>    * Check if the image is a uImage and setup kernel_info
>    */
>   static int __init kernel_uimage_probe(struct kernel_info *info,
> -                                      paddr_t addr, paddr_t size)
> +                                      struct bootmodule *mod)
>   {
>       struct {
>           __be32 magic;   /* Image Header Magic Number */
> @@ -287,6 +290,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>       } uimage;
>   
>       uint32_t len;
> +    paddr_t addr = mod->start;
> +    paddr_t size = mod->size;
>   
>       if ( size < sizeof(uimage) )
>           return -EINVAL;
> @@ -294,13 +299,21 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>       copy_from_paddr(&uimage, addr, sizeof(uimage));
>   
>       if ( be32_to_cpu(uimage.magic) != UIMAGE_MAGIC )
> -        return -EINVAL;
> +        return -ENOENT;
>   
>       len = be32_to_cpu(uimage.size);
>   
>       if ( len > size - sizeof(uimage) )
>           return -EINVAL;
>   
> +    /* Only gzip compression is supported. */
> +    if ( uimage.comp && uimage.comp != IH_COMP_GZIP )
> +    {
> +        printk(XENLOG_ERR
> +               "Unsupported uImage compression type %"PRIu8"\n", uimage.comp);
> +        return -EOPNOTSUPP;
> +    }
> +
>       info->zimage.start = be32_to_cpu(uimage.load);
>       info->entry = be32_to_cpu(uimage.ep);
>   
> @@ -330,8 +343,26 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
>           return -EINVAL;
>       }
>   
> -    info->zimage.kernel_addr = addr + sizeof(uimage);
> -    info->zimage.len = len;
> +    if ( uimage.comp )
> +    {
> +        int rc;
> +
> +        /* Prepare start and size for decompression. */
> +        mod->start += sizeof(uimage);
> +        mod->size -= sizeof(uimage);

kernel_decompress() will free the compressed module once it is 
decompressed. By updating the region it means the free page will be not 
be freed (assuming start was previously page-aligned).

> +
> +        rc = kernel_decompress(mod);
> +        if ( rc )
> +            return rc;
> +
> +        info->zimage.kernel_addr = mod->start;
> +        info->zimage.len = mod->size;
> +    }
> +    else
> +    {
> +        info->zimage.kernel_addr = addr + sizeof(uimage);
> +        info->zimage.len = len;
> +    }
>   
>       info->load = kernel_zimage_load;
>   
> @@ -561,6 +592,16 @@ int __init kernel_probe(struct kernel_info *info,
>           printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
>                  info->initrd_bootmodule->start);
>   
> +    /*
> +     * uImage header always appears at the top of the image (even compressed),
> +     * so it needs to be probed first. Note that in case of compressed uImage,
> +     * kernel_decompress is called from kernel_uimage_probe making the function
> +     * self-containing (i.e. fall through only in case of a header not found).
> +    */
> +    rc = kernel_uimage_probe(info, mod);
> +    if ( rc != -ENOENT )
> +        return rc;
> +
>       /* if it is a gzip'ed image, 32bit or 64bit, uncompress it */
>       rc = kernel_decompress(mod);
>       if ( rc && rc != -EINVAL )
> @@ -570,8 +611,6 @@ int __init kernel_probe(struct kernel_info *info,
>       rc = kernel_zimage64_probe(info, mod->start, mod->size);
>       if (rc < 0)
>   #endif
> -        rc = kernel_uimage_probe(info, mod->start, mod->size);
> -    if (rc < 0)
>           rc = kernel_zimage32_probe(info, mod->start, mod->size);
>   
>       return rc;
Cheers,

-- 
Julien Grall

