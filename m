Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C14EB593378
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 18:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387711.624076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdGC-0005hk-1d; Mon, 15 Aug 2022 16:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387711.624076; Mon, 15 Aug 2022 16:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNdGB-0005fI-Uo; Mon, 15 Aug 2022 16:48:15 +0000
Received: by outflank-mailman (input) for mailman id 387711;
 Mon, 15 Aug 2022 16:48:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oNdGA-0005ey-88
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 16:48:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdGA-0001Ky-0d; Mon, 15 Aug 2022 16:48:14 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.149.129]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNdG9-0000Sj-RK; Mon, 15 Aug 2022 16:48:13 +0000
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
	bh=+V+FuDXV/gSOo8Gram/eMaXWICV1mM9KlRH2TwsJbTc=; b=S7n1m78Y5PjrDx1Fk+q7CAiY2A
	fjynFQhASrSUgNES5XxZPqivO2+WimDwGnli9H9y05ou6UIOJjrtOCJQ/5hEyaJVGDnZ5CEPojQ+0
	LRpduW9s/uDvjhHLzVUgzlkItpv7bqNe7kuUIwdxAUp2bmZiiqGMZN+2XdLnxuXQZA5M=;
Message-ID: <f4cfb2df-12f4-763c-ebb7-8c04036aed68@xen.org>
Date: Mon, 15 Aug 2022 17:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 8/8] xen/arm32: traps: Dump more information for
 hypervisor data abort
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-10-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220812192448.43016-10-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Please ignore this patch. This is a duplication of patch #7.

Cheers,

On 12/08/2022 20:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Unlike arm64, on arm32 there are no extra information dumped (e.g.
> page table walk) for hypervisor data abort.
> 
> For data abort, the HSR will be set properly and so replace the call
> to do_unexpected_trap() with do_trap_hyp_sync() to dispatch the error.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   xen/arch/arm/arm32/traps.c       | 2 +-
>   xen/arch/arm/include/asm/traps.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
> index a4ce2b92d904..a2fc1c22cbc9 100644
> --- a/xen/arch/arm/arm32/traps.c
> +++ b/xen/arch/arm/arm32/traps.c
> @@ -81,7 +81,7 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
>       if ( VABORT_GEN_BY_GUEST(regs) )
>           do_trap_guest_serror(regs);
>       else
> -        do_unexpected_trap("Data Abort", regs);
> +        do_trap_hyp_sync(regs);
>   }
>   
>   void finalize_instr_emulation(const struct instr_details *instr)
> diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
> index 08bc0b484c75..883dae368eac 100644
> --- a/xen/arch/arm/include/asm/traps.h
> +++ b/xen/arch/arm/include/asm/traps.h
> @@ -73,6 +73,7 @@ int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc);
>   
>   void noreturn do_unexpected_trap(const char *msg,
>                                    const struct cpu_user_regs *regs);
> +void do_trap_hyp_sync(struct cpu_user_regs *regs);
>   
>   /* Functions for pending virtual abort checking window. */
>   void abort_guest_exit_start(void);

-- 
Julien Grall

