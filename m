Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318CC98B898
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 11:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807895.1219621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZSO-0004Vb-Rx; Tue, 01 Oct 2024 09:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807895.1219621; Tue, 01 Oct 2024 09:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZSO-0004TE-N6; Tue, 01 Oct 2024 09:46:12 +0000
Received: by outflank-mailman (input) for mailman id 807895;
 Tue, 01 Oct 2024 09:46:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1svZSN-0004SB-H6
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 09:46:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZSM-0007d2-Sb; Tue, 01 Oct 2024 09:46:10 +0000
Received: from [15.248.2.236] (helo=[10.24.67.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1svZSM-0006zC-M5; Tue, 01 Oct 2024 09:46:10 +0000
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
	bh=0txoPtOHdRdaSTB+EZ4HbLtXcesaOfu4P6wllQDza0g=; b=J/FOXokXrTjLSTJ1Z3nERJPaYt
	fpoGU8DvBNj6njfNb0bcHkNT9AWYd4C2auLVaLsPvWjqVYTxNb7B0jwB9gF8RFHvKbDWlYACXEJhB
	jRIE9RljHGWsyCMiTlBAapddPLas/Tk9VulxVNgopeKmcDwHYJ+nwW+08f9ILMNDtZYw=;
Message-ID: <7878c251-7b26-47e0-a79c-4e563ee1e9f9@xen.org>
Date: Tue, 1 Oct 2024 10:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] xen/arm: vsmc: Enable handling SiP-owned SCMI SMC
 calls
Content-Language: en-GB
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-5-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240930114715.642978-5-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/09/2024 12:47, Andrei Cherechesu (OSS) wrote:
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

NIT: I would remove the last sentence as this is implementation details. 
But if you want to keep it, then s/Dom0/Hardware domain/

> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> ---
>   xen/arch/arm/vsmc.c | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 7f2f5eb9ce..0de194a132 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -14,6 +14,7 @@
>   #include <asm/cpufeature.h>
>   #include <asm/monitor.h>
>   #include <asm/regs.h>
> +#include <asm/scmi-smc.h>
>   #include <asm/smccc.h>
>   #include <asm/tee/ffa.h>
>   #include <asm/tee/tee.h>
> @@ -224,6 +225,22 @@ static bool handle_sssc(struct cpu_user_regs *regs)
>       }
>   }
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

This comment is likely going to stale. This is up to smci_handle_smc() 
to decide what to do. So I would remove this comment.

With that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


