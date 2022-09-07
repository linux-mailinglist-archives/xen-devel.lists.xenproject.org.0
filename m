Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB0E5B04BF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401665.643556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVuns-0002w7-0f; Wed, 07 Sep 2022 13:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401665.643556; Wed, 07 Sep 2022 13:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVunr-0002tI-UD; Wed, 07 Sep 2022 13:09:15 +0000
Received: by outflank-mailman (input) for mailman id 401665;
 Wed, 07 Sep 2022 13:09:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVunq-0002tC-1P
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:09:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVunp-00062E-NH; Wed, 07 Sep 2022 13:09:13 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVunp-0002ho-HR; Wed, 07 Sep 2022 13:09:13 +0000
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
	bh=nEgytAqoIrDwIJUb1uAV841ZpJnJnGzO+XSBQUOD1X0=; b=qB38DkG7g5caWm6YDOvgdIR9dS
	JSz2OwUga8h1Kc9y9Io6vdQOlFc6CNC0wwehykp3162eSey1IX00FoJarv9IXKrHz4dqR78N6v910
	YAEuUEJUlMSh8zE5kFx7Ri5UFhHJy01Bsq9zs/0BI4f0e/Dyn3ZiGIST1FuKLBst9n7Q=;
Message-ID: <a94d42dc-eebc-ae9f-26b0-2553398195ff@xen.org>
Date: Wed, 7 Sep 2022 14:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v4 6/7] xen/arm: introduce new xen,enhanced property value
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662462034.git.rahul.singh@arm.com>
 <667059a3bc6ed9a8b993f64f2b1176a2a131f41e.1662462034.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <667059a3bc6ed9a8b993f64f2b1176a2a131f41e.1662462034.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul

On 06/09/2022 14:40, Rahul Singh wrote:
> Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
> disable xenstore interface for dom0less guests.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v4:
>   - Implement defines for dom0less features
> Changes in v3:
>   - new patch in this version
> ---
>   docs/misc/arm/device-tree/booting.txt |  4 ++++
>   xen/arch/arm/domain_build.c           | 10 ++++++----
>   xen/arch/arm/include/asm/kernel.h     | 23 +++++++++++++++++++++--
>   3 files changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 98253414b8..1b0dca1454 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -204,6 +204,10 @@ with the following properties:
>       - "disabled"
>       Xen PV interfaces are disabled.
>   
> +    - no-xenstore
> +    Xen PV interfaces, including grant-table will be enabled but xenstore

Please use "All default" in front. So it is clear that everything is 
enabled but xenstore.

> +    will be disabled for the VM.
> +
>       If the xen,enhanced property is present with no value, it defaults
>       to "enabled". If the xen,enhanced property is not present, PV
>       interfaces are disabled.
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 707e247f6a..0b164ef595 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2891,7 +2891,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>               goto err;
>       }
>   
> -    if ( kinfo->dom0less_enhanced )
> +    if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
>       {
>           ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
>           if ( ret )
> @@ -3209,10 +3209,12 @@ static int __init construct_domU(struct domain *d,
>            (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
>       {
>           if ( hardware_domain )
> -            kinfo.dom0less_enhanced = true;
> +            kinfo.dom0less_feature = DOM0LESS_ENHANCED;
>           else
> -            panic("Tried to use xen,enhanced without dom0\n");
> +            panic("At the moment, Xenstore support requires dom0 to be present\n");
>       }
> +    else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
> +        kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>   
>       if ( vcpu_create(d, 0) == NULL )
>           return -ENOMEM;
> @@ -3252,7 +3254,7 @@ static int __init construct_domU(struct domain *d,
>       if ( rc < 0 )
>           return rc;
>   
> -    if ( kinfo.dom0less_enhanced )
> +    if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
>       {
>           ASSERT(hardware_domain);
>           rc = alloc_xenstore_evtchn(d);
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index c4dc039b54..ad240494ea 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -9,6 +9,25 @@
>   #include <xen/device_tree.h>
>   #include <asm/setup.h>
>   
> +/*
> + * List of possible features for dom0less domUs
> + *
> + * DOM0LESS_ENHANCED_NO_XS: Notify the OS it is running on top of Xen. All the
> + *                          default features (excluding Xenstore) will be
> + *                          available. Note that an OS *must* not rely on the
> + *                          availability of Xen features if this is not set.
> + * DOM0LESS_XENSTORE:       Xenstore will be enabled for the VM. This feature
> + *                          can't be enabled without the
> + *                          DOM0LESS_ENHANCED_NO_XS.
> + * DOM0LESS_ENHANCED:       Notify the OS it is running on top of Xen. All the
> + *                          default features (including Xenstore) will be
> + *                          available. Note that an OS *must* not rely on the
> + *                          availability of Xen features if this is not set.
> + */
> +#define DOM0LESS_ENHANCED_NO_XS  BIT(0, U)
> +#define DOM0LESS_XENSTORE        BIT(1, U)
> +#define DOM0LESS_ENHANCED        (DOM0LESS_ENHANCED_NO_XS | DOM0LESS_XENSTORE)
> +
>   struct kernel_info {
>   #ifdef CONFIG_ARM_64
>       enum domain_type type;
> @@ -36,8 +55,8 @@ struct kernel_info {
>       /* Enable pl011 emulation */
>       bool vpl011;
>   
> -    /* Enable PV drivers */
> -    bool dom0less_enhanced;
> +    /* Enable/Disable PV drivers interface,grant table, evtchn or xenstore */

The part after "," is technically wrong because it also affects other 
interfaces. But I would drop it to avoid any stale comment (we may add 
new one in the futures).

Cheers,

-- 
Julien Grall

