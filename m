Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A90097E0A8
	for <lists+xen-devel@lfdr.de>; Sun, 22 Sep 2024 11:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801512.1211491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssIZR-0003YA-68; Sun, 22 Sep 2024 09:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801512.1211491; Sun, 22 Sep 2024 09:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssIZR-0003WG-3d; Sun, 22 Sep 2024 09:07:57 +0000
Received: by outflank-mailman (input) for mailman id 801512;
 Sun, 22 Sep 2024 09:07:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ssIZP-0003WA-NJ
 for xen-devel@lists.xenproject.org; Sun, 22 Sep 2024 09:07:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssIZP-00085A-Cb; Sun, 22 Sep 2024 09:07:55 +0000
Received: from 90-181-218-29.rco.o2.cz ([90.181.218.29] helo=[10.5.48.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssIZP-0007kO-5k; Sun, 22 Sep 2024 09:07:55 +0000
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
	bh=veI8H4EtlPyybJt/m3DrQOWzNoER+vmaOXBIZ4I5zN8=; b=fD19bQNL/pRdzQZn60BRCiIWKs
	yXKyA+ATep6sgnitnYhYJYXj7wlid1lH7EvUyoLceOD6DOqLgYTzNxh0ymU3lHBI95ynNAI0tlkfZ
	jJ0NsP5hE3qs9aNWZvaVDE0Lo5LlUp7NhKer+WVOYA8RgE9MvIWt3YqNszM8gy2I/5+E=;
Message-ID: <4f1c91c2-a4ec-4dcf-a5b8-7d0607b1778c@xen.org>
Date: Sun, 22 Sep 2024 11:07:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] xen/arm: ffa: Rework feature discovery
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <6c841c341b7dc9e06eb1c02555e30b29bd400d20.1726676338.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6c841c341b7dc9e06eb1c02555e30b29bd400d20.1726676338.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/09/2024 14:19, Bertrand Marquis wrote:
> Store the list of ABI we need in a list and go through the list instead
> of having a list of conditions inside the code.
> 
> No functional change.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/tee/ffa.c | 61 +++++++++++++++++++++---------------------
>   1 file changed, 30 insertions(+), 31 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 7c84aa6aa43d..7ff2529b2055 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -74,6 +74,24 @@
>   /* Negotiated FF-A version to use with the SPMC, 0 if not there or supported */
>   static uint32_t __ro_after_init ffa_fw_version;
>   
> +/* List of ABI we use from the firmware */
> +static const uint32_t ffa_fw_feat_needed[] = {
> +    FFA_VERSION,
> +    FFA_FEATURES,
> +    FFA_NOTIFICATION_BITMAP_CREATE,
> +    FFA_NOTIFICATION_BITMAP_DESTROY,
> +    FFA_PARTITION_INFO_GET,
> +    FFA_NOTIFICATION_INFO_GET_64,
> +    FFA_NOTIFICATION_GET,
> +    FFA_RX_RELEASE,
> +    FFA_RXTX_MAP_64,
> +    FFA_RXTX_UNMAP,
> +    FFA_MEM_SHARE_32,
> +    FFA_MEM_SHARE_64,
> +    FFA_MEM_RECLAIM,
> +    FFA_MSG_SEND_DIRECT_REQ_32,
> +    FFA_MSG_SEND_DIRECT_REQ_64,
> +};

NIT: As we are creating an array, could be take the opportunity to 
provide a name for each feature (we could use macro for that)? This 
would make easier for the user to know which feature is missing.

>   
>   /*
>    * Our rx/tx buffers shared with the SPMC. FFA_RXTX_PAGE_COUNT is the
> @@ -112,20 +130,9 @@ static bool ffa_get_version(uint32_t *vers)
>       return true;
>   }
>   
> -static int32_t ffa_features(uint32_t id)
> +static bool ffa_feature_supported(uint32_t id)
>   {
> -    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> -}
> -
> -static bool check_mandatory_feature(uint32_t id)
> -{
> -    int32_t ret = ffa_features(id);
> -
> -    if ( ret )
> -        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: error %d\n",
> -               id, ret);
> -
> -    return !ret;
> +    return !ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
>   }
>   
>   static void handle_version(struct cpu_user_regs *regs)
> @@ -529,24 +536,6 @@ static bool ffa_probe(void)
>           goto err_no_fw;
>       }
>   
> -    /*
> -     * At the moment domains must support the same features used by Xen.
> -     * TODO: Rework the code to allow domain to use a subset of the
> -     * features supported.
> -     */

You removed this TODO but I don't think it was addressed. Can you clarify?

> -    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
> -         !check_mandatory_feature(FFA_RX_RELEASE) ||
> -         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> -         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
> -         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> -         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> -         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
> -         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> -    {
> -        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\n");
> -        goto err_no_fw;
> -    }
> -
>       major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT)
>                    & FFA_VERSION_MAJOR_MASK;
>       minor_vers = vers & FFA_VERSION_MINOR_MASK;
> @@ -555,6 +544,16 @@ static bool ffa_probe(void)
>   
>       ffa_fw_version = vers;
>   
> +    for ( int i = 0; i < ARRAY_SIZE(ffa_fw_feat_needed); i++ )

This is an index, so please use unsigned int (even though it should 
technically be size_t).

> +    {
> +        if ( !ffa_feature_supported(ffa_fw_feat_needed[i]) )
> +        {
> +            printk(XENLOG_INFO "ARM FF-A Firmware does not support 0x%08x\n",
> +                   ffa_fw_feat_needed[i]);
> +            goto err_no_fw;
> +        }
> +    }
> +
>       if ( !ffa_rxtx_init() )
>       {
>           printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");

Cheers,

-- 
Julien Grall


