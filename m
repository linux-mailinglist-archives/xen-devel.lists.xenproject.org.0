Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB96A726A1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 23:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928283.1331012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txZZ0-0000D7-Ja; Wed, 26 Mar 2025 22:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928283.1331012; Wed, 26 Mar 2025 22:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txZZ0-0000Au-H1; Wed, 26 Mar 2025 22:49:34 +0000
Received: by outflank-mailman (input) for mailman id 928283;
 Wed, 26 Mar 2025 22:49:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1txZYy-0000Ao-W6
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 22:49:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txZYy-009zVZ-1k;
 Wed, 26 Mar 2025 22:49:32 +0000
Received: from [2a02:8012:3a1:0:ede3:7fd5:aa96:e2db]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1txZYy-000cIK-0F;
 Wed, 26 Mar 2025 22:49:32 +0000
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
	bh=Y3axjFbkFMBdP6EfUjj8ZqI+ZDQjV1q+N1BGZJOQvEQ=; b=ZSZou2FmWu4yASSlFpTroKRlVC
	j3B0Wmb8TAtYuraRaOUi7+5x4ToN1Ssw6GjNq22/hZzNVFDw8fYtYd9aytC02viJqDxhclW9lzYzW
	FqIb/T9yoAyrLEhnXnOmmT0L0s2OPJ3YFBydmmFn4kL+hd6skIEtb2XVjb8Ul+zprowY=;
Message-ID: <4dc98a8b-ea82-41a7-9a10-1184208884fc@xen.org>
Date: Wed, 26 Mar 2025 22:49:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] xen/arm: Create tee command line parameter
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <cover.1742824138.git.bertrand.marquis@arm.com>
 <a22e5375df48d16cb4c0b3d80dde8593522b3ddd.1742824138.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a22e5375df48d16cb4c0b3d80dde8593522b3ddd.1742824138.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 24/03/2025 13:52, Bertrand Marquis wrote:
> Add a new command line parameter "tee=" to be used to explicitly select
> what tee mediator is to be used by Xen and fail if it does not exist
> or the probe function for it failed.
> 
> Without specifying which tee is to be used, Xen will use the first one
> for which the probe function succeeds which depends on the order of the
> mediator list which depends on the compiler.
> Using the command line argument, it is now possible to explicit request
> a specific TEE mediator and panic on boot if it is not available.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v4:
> - None
> Changes in v3:
> - Properly classify tee as arm specific (Jan)
> Changes in v2:
> - Patch introduced to add a command line selection of the TEE
> ---
>   docs/misc/xen-command-line.pandoc  | 14 ++++++++++++++
>   xen/arch/arm/include/asm/tee/tee.h |  4 ++++
>   xen/arch/arm/tee/tee.c             | 31 ++++++++++++++++++++++++++++++
>   3 files changed, 49 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 89db6e83be66..0c2ff542a138 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2651,6 +2651,20 @@ Specify the per-cpu trace buffer size in pages.
>   
>   Flag to enable TSC deadline as the APIC timer mode.
>   
> +### tee (arm)
> +> `= <string>`
> +
> +Specify the TEE mediator to be probed and use.
> +
> +The default behaviour is to probe all supported TEEs supported by Xen and use


typo: I think there is one too many "supported". Maybe keep the one 
after TEEs?

> +the first one successfully probed. When this parameter is passed, Xen will
> +probe only the TEE mediator passed as argument and boot will fail if this
> +mediator is not properly probed or if the requested TEE is not supported by
> +Xen.
> +
> +This parameter can be set to `optee` of `ffa` if the corresponding mediators

typo: s/of/or/

> +are compiled in.
> +
>   ### tevt_mask
>   > `= <integer>`
>   
> diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
> index 0169fd746bcd..15d664e28dce 100644
> --- a/xen/arch/arm/include/asm/tee/tee.h
> +++ b/xen/arch/arm/include/asm/tee/tee.h
> @@ -55,6 +55,9 @@ struct tee_mediator_desc {
>       /* Printable name of the TEE. */
>       const char *name;
>   
> +    /* Command line name of the TEE (to be used with tee= cmdline option) */
> +    const char *cmdline_name;
> +
>       /* Mediator callbacks as described above. */
>       const struct tee_mediator_ops *ops;
>   
> @@ -77,6 +80,7 @@ void tee_free_domain_ctx(struct domain *d);
>   static const struct tee_mediator_desc __tee_desc_##_name __used     \
>   __section(".teemediator.info") = {                                  \
>       .name = _namestr,                                               \
> +    .cmdline_name = #_name,                                         \
>       .ops = _ops,                                                    \
>       .tee_type = _type                                               \
>   }
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index 3f65e45a7892..066b5ba40f9d 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -19,12 +19,17 @@
>   #include <xen/errno.h>
>   #include <xen/init.h>
>   #include <xen/types.h>
> +#include <xen/param.h>

Coding style: The includes are order. So this wants to be moved before 
xen/types.h

>   
>   #include <asm/tee/tee.h>
>   
>   extern const struct tee_mediator_desc _steemediator[], _eteemediator[];
>   static const struct tee_mediator_desc __read_mostly *cur_mediator;
>   
> +/* Select the TEE mediator using a name on command line. */
> +static char __initdata opt_mediator[16] = "";
> +string_param("tee", opt_mediator);
> +
>   /*
>    * TODO: Add function to alter Dom0 DTB, so we can properly describe
>    * present TEE.
> @@ -81,14 +86,40 @@ static int __init tee_init(void)
>   {
>       const struct tee_mediator_desc *desc;
>   
> +    if ( strcmp(opt_mediator, "") )

You are using 'strcmp(opt_mediator, "")' several time in the code. This 
should never changed, so can we introduce a boolean within the function 
to indicate whether opt_mediator is set?

> +        printk(XENLOG_INFO "TEE Mediator %s selected from command line\n",
> +               opt_mediator);
> +
> +    /*
> +     * When a specific TEE is selected using the 'tee=' command line
> +     * argument, we panic if the probe fails or if the requested TEE is not
> +     * supported.
> +     */
>       for ( desc = _steemediator; desc != _eteemediator; desc++ )
>       {
> +        if ( strcmp(opt_mediator, "") &&
> +             strncmp(opt_mediator, desc->cmdline_name, sizeof(opt_mediator)) )
 > +            continue;> +
>           if ( desc->ops->probe() )
>           {
>               printk(XENLOG_INFO "Using TEE mediator for %s\n", desc->name);
>               cur_mediator = desc;
>               return 0;
>           }
> +        else if ( strcmp(opt_mediator, "") )
> +        {
> +            panic("TEE mediator %s from command line probe failed\n",
> +                  opt_mediator);
> +            return -EFAULT;
> +        }
> +    }
> +
> +    if ( strcmp(opt_mediator, "") )
> +    {
> +        panic("TEE Mediator %s from command line not supported\n",
> +              opt_mediator);
> +        return -EINVAL;
>       }
>   
>       return 0;

Cheers,

-- 
Julien Grall


