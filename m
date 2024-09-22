Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03F97E0A4
	for <lists+xen-devel@lfdr.de>; Sun, 22 Sep 2024 11:02:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801506.1211482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssISe-0002nv-Gd; Sun, 22 Sep 2024 09:00:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801506.1211482; Sun, 22 Sep 2024 09:00:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssISe-0002mA-DP; Sun, 22 Sep 2024 09:00:56 +0000
Received: by outflank-mailman (input) for mailman id 801506;
 Sun, 22 Sep 2024 09:00:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ssISd-0002m4-DP
 for xen-devel@lists.xenproject.org; Sun, 22 Sep 2024 09:00:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssISc-0007xb-Sl; Sun, 22 Sep 2024 09:00:54 +0000
Received: from 90-181-218-29.rco.o2.cz ([90.181.218.29] helo=[10.5.48.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ssISc-0007IP-Jx; Sun, 22 Sep 2024 09:00:54 +0000
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
	bh=EQ00DFiFOQoTwvENcTRUl3UFW/IoQ/hbucvJK4up13o=; b=n+bR0hzCJqjH6XJLvhHBkrfHFp
	RgCtosN0X50aTY1WZ1db8yA4KISY+an0bfs6QcGlNOvB1iIPucsDBD+cpEymlshStdie4JynEkXEA
	e7gxVFZPH81NtG1fJkhV2blnHzML9ezaYBxmB4o+QN8iKLCxt+QEnKpdRQ8tSD+d8t74=;
Message-ID: <00461ab7-1cbd-4b72-9722-293a20ebbe81@xen.org>
Date: Sun, 22 Sep 2024 11:00:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] xen/arm: ffa: Rework firmware discovery
Content-Language: en-GB
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <cover.1726676338.git.bertrand.marquis@arm.com>
 <9931c299450a1e0a2384161eb9b514ead8895ecc.1726676338.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9931c299450a1e0a2384161eb9b514ead8895ecc.1726676338.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 19/09/2024 14:19, Bertrand Marquis wrote:
> Rework firmware discovery during probe:
> - move prints into the probe
> - rename ffa_version to ffa_fw_version as the variable identifies the
>    version of the firmware and not the one we support
> - add error prints when allocation fail during probe
> 
> No functional changes.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/tee/ffa.c | 52 +++++++++++++++++++++++++-----------------
>   1 file changed, 31 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 022089278e1c..7c84aa6aa43d 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -71,8 +71,8 @@
>   
>   #include "ffa_private.h"
>   
> -/* Negotiated FF-A version to use with the SPMC */
> -static uint32_t __ro_after_init ffa_version;
> +/* Negotiated FF-A version to use with the SPMC, 0 if not there or supported */
> +static uint32_t __ro_after_init ffa_fw_version;
>   
>   
>   /*
> @@ -105,10 +105,7 @@ static bool ffa_get_version(uint32_t *vers)
>   
>       arm_smccc_1_2_smc(&arg, &resp);
>       if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
> -    {
> -        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n");
>           return false;
> -    }
>   
>       *vers = resp.a0;
>   
> @@ -372,7 +369,7 @@ static int ffa_domain_init(struct domain *d)
>       struct ffa_ctx *ctx;
>       int ret;
>   
> -    if ( !ffa_version )
> +    if ( !ffa_fw_version )
>           return -ENODEV;
>        /*
>         * We can't use that last possible domain ID or ffa_get_vm_id() would
> @@ -505,6 +502,9 @@ static bool ffa_probe(void)
>        */
>       BUILD_BUG_ON(PAGE_SIZE != FFA_PAGE_SIZE);
>   
> +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> +           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
 > +>       /*
>        * psci_init_smccc() updates this value with what's reported by EL-3
>        * or secure world.
> @@ -514,25 +514,21 @@ static bool ffa_probe(void)
>           printk(XENLOG_ERR
>                  "ffa: unsupported SMCCC version %#x (need at least %#x)\n",
>                  smccc_ver, ARM_SMCCC_VERSION_1_2);
> -        return false;
> +        goto err_no_fw;
>       }
>   
>       if ( !ffa_get_version(&vers) )
> -        return false;
> +    {
> +        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n");

This error message relies on the implementation of ffa_get_version(). It 
made sense in the previous placement, but here, it seems a little bit 
odd. So if you want to move the error message, then I think it should be 
reworded to be more generic.

Maybe: "Cannot retrieve the FFA version".

> +        goto err_no_fw;
> +    }
>   
>       if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
>       {
>           printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers);
> -        return false;
> +        goto err_no_fw;
>       }
>   
> -    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR_MASK;
> -    minor_vers = vers & FFA_VERSION_MINOR_MASK;
> -    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> -           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);

I kind of understand why we are moving the Medatior version early but...

> -    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> -           major_vers, minor_vers);

... I am not sure why we would move this print later. Wouldn't this be 
useful to know if there is a missing feature?
> -
>       /*
>        * At the moment domains must support the same features used by Xen.
>        * TODO: Rework the code to allow domain to use a subset of the
> @@ -546,12 +542,24 @@ static bool ffa_probe(void)
>            !check_mandatory_feature(FFA_MEM_SHARE_32) ||
>            !check_mandatory_feature(FFA_MEM_RECLAIM) ||
>            !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> -        return false;
> +    {
> +        printk(XENLOG_ERR "ffa: Mandatory feature not supported by fw\n");
> +        goto err_no_fw;
> +    }
>   
> -    if ( !ffa_rxtx_init() )
> -        return false;
> +    major_vers = (vers >> FFA_VERSION_MAJOR_SHIFT)
> +                 & FFA_VERSION_MAJOR_MASK;
> +    minor_vers = vers & FFA_VERSION_MINOR_MASK;
> +    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> +           major_vers, minor_vers);
> +
> +    ffa_fw_version = vers;
>   
> -    ffa_version = vers;
> +    if ( !ffa_rxtx_init() )
> +    {
> +        printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
> +        goto err_no_fw;
> +    }
>   
>       if ( !ffa_partinfo_init() )
>           goto err_rxtx_destroy;
> @@ -564,7 +572,9 @@ static bool ffa_probe(void)
>   
>   err_rxtx_destroy:
>       ffa_rxtx_destroy();
> -    ffa_version = 0;
> +err_no_fw:
> +    ffa_fw_version = 0;
> +    printk(XENLOG_INFO "ARM FF-A No firmware support\n");

I am guessing if we are trying to probe FFA, then most likely the user 
expected to use it. So shouldn't this be a XENLOG_WARN?

Cheers,
	
-- 
Julien Grall


