Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71BFB1B763
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070589.1434199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSg-0001GG-J5; Tue, 05 Aug 2025 15:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070589.1434199; Tue, 05 Aug 2025 15:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJSg-0001ET-DA; Tue, 05 Aug 2025 15:20:22 +0000
Received: by outflank-mailman (input) for mailman id 1070589;
 Tue, 05 Aug 2025 15:06:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jti+=2R=arm.com=ada.coupriediaz@srs-se1.protection.inumbo.net>)
 id 1ujJF8-0007Ji-DN
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:06:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bc4bc230-720d-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 17:06:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42E052BC2;
 Tue,  5 Aug 2025 08:06:08 -0700 (PDT)
Received: from [10.1.29.177] (e137867.arm.com [10.1.29.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 226143F673;
 Tue,  5 Aug 2025 08:06:11 -0700 (PDT)
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
X-Inumbo-ID: bc4bc230-720d-11f0-b898-0df219b8e170
Message-ID: <df50cc99-027e-4182-ba4c-9837b354a062@arm.com>
Date: Tue, 5 Aug 2025 16:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 2/7] arm64: entry: Refactor the entry and exit
 for exceptions from EL1
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20250729015456.3411143-1-ruanjinjie@huawei.com>
 <20250729015456.3411143-3-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, sstabellini@kernel.org,
 mark.rutland@arm.com, puranjay@kernel.org, broonie@kernel.org,
 mbenes@suse.cz, ryan.roberts@arm.com, akpm@linux-foundation.org,
 chenl311@chinatelecom.cn, anshuman.khandual@arm.com,
 kristina.martsenko@arm.com, liaochang1@huawei.com, ardb@kernel.org,
 leitao@debian.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <20250729015456.3411143-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/07/2025 02:54, Jinjie Ruan wrote:

> The generic entry code uses irqentry_state_t to track lockdep and RCU
> state across exception entry and return. For historical reasons, arm64
> embeds similar fields within its pt_regs structure.
>
> In preparation for moving arm64 over to the generic entry code, pull
> these fields out of arm64's pt_regs, and use a separate structure,
> matching the style of the generic entry code.
>
> No functional changes.
As far as I understand and checked, we used the two fields
in an exclusive fashion, so there is indeed no functional change.
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> [...]
> diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
> index 8e798f46ad28..97e0741abde1 100644
> --- a/arch/arm64/kernel/entry-common.c
> +++ b/arch/arm64/kernel/entry-common.c
> [...]
> @@ -475,73 +497,81 @@ UNHANDLED(el1t, 64, error)
>   static void noinstr el1_abort(struct pt_regs *regs, unsigned long esr)
>   {
>   	unsigned long far = read_sysreg(far_el1);
> +	arm64_irqentry_state_t state;
>   
> -	enter_from_kernel_mode(regs);
> +	state = enter_from_kernel_mode(regs);
Nit: There is some inconsistencies with some functions splitting state's 
definition
and declaration (like el1_abort here), while some others do it on the 
same line
(el1_undef() below for example).
In some cases it is welcome as the entry function is called after some 
other work,
but here for example it doesn't seem to be beneficial ?
>   	local_daif_inherit(regs);
>   	do_mem_abort(far, esr, regs);
>   	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>   }
>   
>   static void noinstr el1_pc(struct pt_regs *regs, unsigned long esr)
>   {
>   	unsigned long far = read_sysreg(far_el1);
> +	arm64_irqentry_state_t state;
>   
> -	enter_from_kernel_mode(regs);
> +	state = enter_from_kernel_mode(regs);
>   	local_daif_inherit(regs);
>   	do_sp_pc_abort(far, esr, regs);
>   	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>   }
>   
>   static void noinstr el1_undef(struct pt_regs *regs, unsigned long esr)
>   {
> -	enter_from_kernel_mode(regs);
> +	arm64_irqentry_state_t state = enter_from_kernel_mode(regs);
> +
>   	local_daif_inherit(regs);
>   	do_el1_undef(regs, esr);
>   	local_daif_mask();
> -	exit_to_kernel_mode(regs);
> +	exit_to_kernel_mode(regs, state);
>   }
>
> [...]
Other than the small nit:
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>


