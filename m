Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C425A98B021
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 00:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807642.1219209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svP58-0004mL-Ny; Mon, 30 Sep 2024 22:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807642.1219209; Mon, 30 Sep 2024 22:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svP58-0004kZ-LJ; Mon, 30 Sep 2024 22:41:30 +0000
Received: by outflank-mailman (input) for mailman id 807642;
 Mon, 30 Sep 2024 22:41:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJxO=Q4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1svP57-0004kT-BD
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 22:41:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2057ebbc-7f7d-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 00:41:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 26F7E5C069A;
 Mon, 30 Sep 2024 22:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BE2C4CED2;
 Mon, 30 Sep 2024 22:41:14 +0000 (UTC)
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
X-Inumbo-ID: 2057ebbc-7f7d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727736075;
	bh=NuQ4tiv3kApTQah1aCO7nnZfM85Q9cKA9jrPdNlfmgI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XAPvs68hnQmIa07WD2wlefTf5EzLTql4QrLiTBLq2KLd63z3wcY22oSFU9Sh7SbKB
	 m0moJeE+r4LsrAVlPJFxYcr0w/aekefNaoR4c3gxf3UullnszlW/thO88uir9kTQUJ
	 pbgRhFbkSsWjpeK1F6eftW/ZwcP0ZE/MouuVShPHIFJ2gDZL1tvGA86TmM+2+oJQts
	 m2EpR78EWY6aUrveSOlDm5HUlEIqKv5XVNNo28CCkBq4gx+Dfe33O45EhYBPt/sqFI
	 YMUHtnLpioLg44Myfs+ClqT5H3M0Np57AE3CkcuBY1qt2E5oeibyZQdZy5mTyDfQdx
	 4ngI9FLjwhmwg==
Date: Mon, 30 Sep 2024 15:41:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, S32@nxp.com, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 4/8] xen/arm: vsmc: Enable handling SiP-owned SCMI
 SMC calls
In-Reply-To: <20240930114715.642978-5-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2409301539470.451631@ubuntu-linux-20-04-desktop>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com> <20240930114715.642978-5-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Change the handling of SiP SMC calls to be more generic,
> instead of directly relying on the `platform_smc()` callback
> implementation.
> 
> Try to handle the SiP SMC first through the `platform_smc()`
> callback (if implemented). If not handled, check if the
> SCMI layer is available and that the SMC is a valid SCMI
> message. Handle it then within the SCMI layer which forwards
> it to EL3 FW, only if the SMC comes from Dom0.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/vsmc.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 7f2f5eb9ce..0de194a132 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -14,6 +14,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/monitor.h>
>  #include <asm/regs.h>
> +#include <asm/scmi-smc.h>
>  #include <asm/smccc.h>
>  #include <asm/tee/ffa.h>
>  #include <asm/tee/tee.h>
> @@ -224,6 +225,22 @@ static bool handle_sssc(struct cpu_user_regs *regs)
>      }
>  }
>  
> +/* Secure Calls defined by the Silicon Provider (SiP) */
> +static bool handle_sip(struct cpu_user_regs *regs)
> +{
> +    uint32_t fid = (uint32_t)get_user_reg(regs, 0);
> +
> +    /* Firstly, let each platform define custom handling for these SMCs */
> +    if ( platform_smc(regs) )
> +        return true;
> +
> +    /* Otherwise, if valid SCMI SMC, forward the call to EL3 */
> +    if ( scmi_is_enabled() && scmi_is_valid_smc_id(fid) )
> +        return scmi_handle_smc(regs);
> +
> +    return false;
> +}
> +
>  /*
>   * vsmccc_handle_call() - handle SMC/HVC call according to ARM SMCCC.
>   * returns true if that was valid SMCCC call (even if function number
> @@ -288,7 +305,7 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
>              handled = handle_sssc(regs);
>              break;
>          case ARM_SMCCC_OWNER_SIP:
> -            handled = platform_smc(regs);
> +            handled = handle_sip(regs);
>              break;
>          case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
>          case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
> -- 
> 2.45.2
> 

