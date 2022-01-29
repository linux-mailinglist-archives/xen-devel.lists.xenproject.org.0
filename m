Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B24A3141
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jan 2022 18:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262284.454463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDrzo-0006z2-R0; Sat, 29 Jan 2022 17:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262284.454463; Sat, 29 Jan 2022 17:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDrzo-0006w2-NF; Sat, 29 Jan 2022 17:58:44 +0000
Received: by outflank-mailman (input) for mailman id 262284;
 Sat, 29 Jan 2022 17:58:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nDrzm-0006vv-MZ
 for xen-devel@lists.xenproject.org; Sat, 29 Jan 2022 17:58:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDrzm-00076c-1J; Sat, 29 Jan 2022 17:58:42 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.0.221]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDrzl-0003te-Qx; Sat, 29 Jan 2022 17:58:41 +0000
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
	bh=n6P/mQrSqC2/4lSsLdSczpRfHwIcz5mqvEMc3OuQWbo=; b=de7i7ERDBbO3NRlvXoL8Wm98NK
	0KN8oYOwfKdM8s3JP5AOTGswbJ6tBsAytavZVcPhpzmy95613exF9FUFztvPGE6ScJvleOT0hXwBq
	w3Pl67y8rM6naqJGXWieYLfW0Nx3/8QSBuTxoBSXsuVME/NUrQ4TYEFs1XkZ8aDGRWzg=;
Message-ID: <3a00dff8-c213-616e-48b0-6e2b6f30dbce@xen.org>
Date: Sat, 29 Jan 2022 17:58:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 1/5] xen: introduce xen,enhanced dom0less property
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220128213307.2822078-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 28/01/2022 21:33, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Introduce a new "xen,enhanced" dom0less property to enable/disable PV
> driver interfaces for dom0less guests. Currently only "enabled" and
> "disabled" are supported property values (and empty). Leave the option
> open to implement further possible values in the future (e.g.
> "xenstore" to enable only xenstore.)
> 
> The configurable option is for domUs only. For dom0 we always set the
> corresponding property in the Xen code to true (PV interfaces enabled.)
> 
> This patch only parses the property. Next patches will make use of it.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v3:
> - improve commit message
> 
> Changes in v2:
> - rename kinfo.enhanced to kinfo.dom0less_enhanced
> - set kinfo.dom0less_enhanced to true for dom0
> - handle -ENODATA in addition to -EILSEQ
> ---
>   docs/misc/arm/device-tree/booting.txt | 18 ++++++++++++++++++
>   xen/arch/arm/domain_build.c           |  8 ++++++++
>   xen/arch/arm/include/asm/kernel.h     |  3 +++
>   3 files changed, 29 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 71895663a4..38c29fb3d8 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -169,6 +169,24 @@ with the following properties:
>       Please note that the SPI used for the virtual pl011 could clash with the
>       physical SPI of a physical device assigned to the guest.
>   
> +- xen,enhanced

NIT: I find a bit strange this is added in the middle of the property. 
Can you either sort the property alphabtically or move this one to the end?

> +
> +    A string property. Possible property values are:
> +
> +    - "enabled" (or missing property value)
> +    Xen PV interfaces, including grant-table and xenstore, will be
> +    enabled for the VM.
> +
> +    - "disabled"
> +    Xen PV interfaces are disabled.
> +
> +    If the xen,enhanced property is present with no value, it defaults
> +    to "enabled". If the xen,enhanced property is not present, PV
> +    interfaces are disabled.
> +
> +    In the future other possible property values might be added to
> +    enable only selected interfaces.
> +
>   - nr_spis
>   
>       Optional. A 32-bit integer specifying the number of SPIs (Shared
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6931c022a2..9144d6c0b6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
>                                    const struct dt_device_node *node)
>   {
>       struct kernel_info kinfo = {};
> +    const char *dom0less_enhanced;
>       int rc;
>       u64 mem;
>   
> @@ -2978,6 +2979,12 @@ static int __init construct_domU(struct domain *d,
>   
>       kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>   
> +    rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
> +    if ( rc == -EILSEQ ||

I think the use an -EILSEQ wants an explanation. In a previous version, 
you wrote that the value would be returned when:

fdt set /chosen/domU0 xen,enhanced

But it is not clear why. Can you print pp->value, pp->length, 
strnlen(..) when this happens?


> +         rc == -ENODATA ||
> +         (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
> +        kinfo.dom0less_enhanced = true;
> +
>       if ( vcpu_create(d, 0) == NULL )
>           return -ENOMEM;
>   
> @@ -3095,6 +3102,7 @@ static int __init construct_dom0(struct domain *d)
>   
>       kinfo.unassigned_mem = dom0_mem;
>       kinfo.d = d;
> +    kinfo.dom0less_enhanced = true;

This is a bit odd. The name suggests that this is a dom0less specific 
option. But then you are setting it to dom0.

Given that this variable is about enable PV drivers, I think this should 
be false for dom0.

>   
>       rc = kernel_probe(&kinfo, NULL);
>       if ( rc < 0 )
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 874aa108a7..c4dc039b54 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -36,6 +36,9 @@ struct kernel_info {
>       /* Enable pl011 emulation */
>       bool vpl011;
>   
> +    /* Enable PV drivers */
> +    bool dom0less_enhanced;
> +
>       /* GIC phandle */
>       uint32_t phandle_gic;
>   

Cheers,

-- 
Julien Grall

