Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ED836C23C
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118240.224291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKUq-0001j4-LY; Tue, 27 Apr 2021 09:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118240.224291; Tue, 27 Apr 2021 09:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKUq-0001if-IH; Tue, 27 Apr 2021 09:59:12 +0000
Received: by outflank-mailman (input) for mailman id 118240;
 Tue, 27 Apr 2021 09:59:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbKUo-0001iZ-J6
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:59:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKUn-0004L4-F8; Tue, 27 Apr 2021 09:59:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKUn-0004Rb-76; Tue, 27 Apr 2021 09:59:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Ue+9v2gwlNVwuhNATN+1E8U73dWgRMwYYjw379jVXgc=; b=Z/M8HInnohrQDYBWX8XpfAsq+A
	ZAC4a3Q0x5YPiqk1ZFkZE6mJaFIqVQpN9LYm/P3DfqTqXDPNCj9HKu6Bh3jsqplk/lu/kiRlJW/Dc
	BkvU8WsYwqKoQ3EBOG7rNZZMXKX/uOpAsFmucWekbjlyBQ0pe/OsXMMSeZUXZCUTQvUk=;
Subject: Re: [PATCH v2 07/10] arm/mm: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210427093546.30703-1-michal.orzel@arm.com>
 <20210427093546.30703-8-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <04adaf9b-e2fe-460e-35e4-09e5e5ff7b6f@xen.org>
Date: Tue, 27 Apr 2021 10:59:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427093546.30703-8-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 27/04/2021 10:35, Michal Orzel wrote:
> AArch64 registers are 64bit whereas AArch32 registers
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 registers have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify SCTLR_EL2 accesses to use READ/WRITE_SYSREG.
> 
> SCTLR_EL2 already has bits defined in the range [32:63].
> The ARM ARM defines them as unknown if implemented.

This is a bit ambiguous.

> By writing in head.S SCTLR_EL2_SET we are zeroing the upper
> 32bit half which is correct but referring to this sysreg
> as 32bit is a latent bug because the top 32bit was not used
> by Xen.

This seems to suggest the patch below will call SCTLR_EL2_SET whereas 
this is already existing code.

> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Changes since v1:
> -Update commit message with SCTLR_EL2 analysis
> ---
>   xen/arch/arm/mm.c    | 2 +-
>   xen/arch/arm/traps.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 59f8a3f15f..0e07335291 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -613,7 +613,7 @@ void __init remove_early_mappings(void)
>    */
>   static void xen_pt_enforce_wnx(void)
>   {
> -    WRITE_SYSREG32(READ_SYSREG32(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
> +    WRITE_SYSREG(READ_SYSREG(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
>       /*
>        * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
>        * before flushing the TLBs.
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index c7acdb2087..e7384381cc 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -915,7 +915,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
>       printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
>       printk("\n");
>   
> -    printk(" SCTLR_EL2: %08"PRIx32"\n", READ_SYSREG32(SCTLR_EL2));
> +    printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));

Your commit title suggests that you will modify mm.c but you are also 
modifying traps.c. So how about the following commit message:

"
xen/arm: Always access SCTLR_EL2 using {READ, WRITE}_SYSREG()

The Armv8 specification describes the system register as a 64-bit value 
on AArch64 and 32-bit value on AArch32 (same as Armv7).

Unfortunately, Xen is accessing the system registers using {READ, 
WRITE}_SYSREG32() which means the top 32-bit are clobbered.

This is only a latent bug so far because Xen will not yet use the top 
32-bit.

There is also no change in behavior because arch/arm/arm64/head.S will 
initialize SCTLR_EL2 to a sane value with the top 32-bit zeroed.
"

Cheers,

-- 
Julien Grall

