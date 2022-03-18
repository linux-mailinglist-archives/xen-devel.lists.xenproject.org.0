Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5094DE107
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 19:26:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292187.496268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVHIf-0003sX-Tr; Fri, 18 Mar 2022 18:26:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292187.496268; Fri, 18 Mar 2022 18:26:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVHIf-0003pX-Q3; Fri, 18 Mar 2022 18:26:09 +0000
Received: by outflank-mailman (input) for mailman id 292187;
 Fri, 18 Mar 2022 18:26:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVHIe-0003pR-1h
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 18:26:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVHId-000846-Ch; Fri, 18 Mar 2022 18:26:07 +0000
Received: from [54.239.6.185] (helo=[192.168.15.239])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVHId-0006uJ-62; Fri, 18 Mar 2022 18:26:07 +0000
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
	bh=3ZRF7t26NrGP+GW64wh2UokE+/JRdlMaC2UXQAW8bhY=; b=GAcsg59QQO7La24Q6i3l0UTAOp
	5xliFSZrHibl36fJZQnd+HyzIRvgmFgGzSoZ+AXtk6l1dFQJN2btnIK28SCnamV3cUAv32Ef/wxs3
	eyib42oIPtWDc9HlbTToMTdt7v+k4IopH7StKgSQcBvGpXPggiin27NJOuE5qjY4g4wA=;
Message-ID: <3d6a341d-712d-8701-caf2-49301ae1e01b@xen.org>
Date: Fri, 18 Mar 2022 18:26:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v11 3/3] xen/arm64: io: Handle data abort due to cache
 maintenance instructions
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, paul@xen.org,
 roger.pau@citrix.com, Ayan Kumar Halder <ayankuma@xilinx.com>
References: <20220317140046.64563-1-ayankuma@xilinx.com>
 <20220317140046.64563-4-ayankuma@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220317140046.64563-4-ayankuma@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 17/03/2022 14:00, Ayan Kumar Halder wrote:
> diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
> index ca259a79c2..79e64d9af8 100644
> --- a/xen/arch/arm/include/asm/mmio.h
> +++ b/xen/arch/arm/include/asm/mmio.h
> @@ -35,6 +35,7 @@ enum instr_decode_state
>        * instruction.
>        */
>       INSTR_LDR_STR_POSTINDEXING,
> +    INSTR_CACHE,                    /* Cache Maintenance instr */
>   };
>   
>   typedef struct
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 6f458ee7fd..26c716b4a5 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -139,6 +139,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
>           return;
>       }
>   
> +    /*
> +     * When the data abort is caused due to cache maintenance, Xen should check
> +     * if the address belongs to an emulated MMIO region or not. The behavior
> +     * will differ accordingly.
> +     */
> +    if ( info->dabt.cache )
> +    {
> +        info->dabt_instr.state = INSTR_CACHE;
> +        return;
> +    }
> +
>       /*
>        * Armv8 processor does not provide a valid syndrome for decoding some
>        * instructions. So in order to process these instructions, Xen must
> @@ -177,6 +188,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
>           return rc;
>       }
>   
> +    /*
> +     * When the data abort is caused due to cache maintenance and the address
> +     * belongs to an emulated region, Xen should ignore this instruction.
> +     */
> +    if ( info->dabt_instr.state == INSTR_CACHE )

Reading the Arm Arm, the ISS should be invalid for cache instructions. 
So, I think the check at the beginning of try_handle_mmio() would 
prevent us to reach this check.

Can you check that cache instructions on emulated region will 
effectively be ignored?

Cheers,

-- 
Julien Grall

