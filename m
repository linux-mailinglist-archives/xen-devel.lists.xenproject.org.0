Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C87B1FC10A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 23:34:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlJE7-0001sc-WD; Tue, 16 Jun 2020 21:34:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jlJE6-0001sR-4M
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 21:34:38 +0000
X-Inumbo-ID: 2c23758b-b019-11ea-b956-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c23758b-b019-11ea-b956-12813bfff9fa;
 Tue, 16 Jun 2020 21:34:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 280E42085B;
 Tue, 16 Jun 2020 21:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592343275;
 bh=D+pdHi31E7TsCSVDQt1gYFY7mD0R1ArodcVj97a2D5E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FKCRw6jm+T3Fie7eB/mg5Udp9ikh/s65V+zHlt78VQEaZO/b59SlABN43c9Vyy9Qk
 MvlbbnRGjhfYe/NlLuWzyTkZaKe1pbNJKt9TRsMwjvlr9gVnCI6SspshZycXEa4LKq
 e9MqTMcLRKZaF2q18cvLJfK1Tls1uAFkJeceFUow=
Date: Tue, 16 Jun 2020 14:34:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/2] xen/arm: Mitigate straight-line speculation for SMC
 call
In-Reply-To: <20200616175913.7368-3-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2006161425480.24982@sstabellini-ThinkPad-T480s>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-3-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, paul@xen.org, Andre.Przywara@arm.com,
 Julien Grall <jgrall@amazon.com>, Bertrand.Marquis@arm.com,
 security@xenproject.org, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 16 Jun 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> SMC call will update some of registers (typically only x0) depending on
  ^a SMC call

> the arguments provided.
> 
> Some CPUs can speculate past a SMC instruction and potentially perform
> speculative access to emrmoy using the pre-call values before executing
                        ^ memory

> the SMC.
> 
> There is no known gadget available after the SMC call today. However
> some of the registers may contain values from the guest and are expected
> to be updated by the SMC call.
> 
> In order to harden the code, it would be better to prevent straight-line
> speculation from an SMC. Architecturally executing the speculation
                   ^ a? any?


> barrier after every SMC can be rather expensive (particularly on core
> not SB). Therefore we want to mitigate it diferrently:
       ^ not SB capable?                    ^ differently


> 
>     * For arm_smccc_1_0_smc, we can avoid a speculation barrier right
>     after the SMC instruction and instead rely on the one after eret.
                                                                  ^ ret


>     * For arm_smccc_1_1_smc, we can place a B instruction after the SMC
>     instruction to skip the barrier.
> 
> Note that arm_smccc_1_0_smc version on arm32 is just an alias to
> arm_smccc_1_1_smc.
> 
> Note that no speculation barrier has been added after the SMC
> instruction in arm64/entry.S. This is fine because the call is not
> expected to modify any registers. So straight-line speculation doesn't
> matter.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I couldn't spot any issues with the patch and I compile-tested it.


> ---
> 
> Note this hasn't been vetted by Arm but they are using the same
> sort of mitigation for blr. So I am quite confident this could do the
> trick.

Noted


> ---
>  xen/arch/arm/arm64/smc.S     |  1 +
>  xen/include/asm-arm/smccc.h  | 13 +++++++++++++
>  xen/include/asm-arm/system.h |  8 ++++++++
>  3 files changed, 22 insertions(+)
> 
> diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
> index b0752be57e8f..e0a3106dd7ec 100644
> --- a/xen/arch/arm/arm64/smc.S
> +++ b/xen/arch/arm/arm64/smc.S
> @@ -30,3 +30,4 @@ ENTRY(__arm_smccc_1_0_smc)
>          stp     x2, x3, [x4, #SMCCC_RES_a2]
>  1:
>          ret
> +        sb
> diff --git a/xen/include/asm-arm/smccc.h b/xen/include/asm-arm/smccc.h
> index 9d94beb3df2d..8650224923b1 100644
> --- a/xen/include/asm-arm/smccc.h
> +++ b/xen/include/asm-arm/smccc.h
> @@ -200,11 +200,24 @@ struct arm_smccc_res {
>   * We have an output list that is not necessarily used, and GCC feels
>   * entitled to optimise the whole sequence away. "volatile" is what
>   * makes it stick.
> + *
> + * Some of the SMC callers are passing directly values that are
> + * controlled by the guest. To mitigate against straight-line
> + * speculation, a speculation barrier is required. As it may be
> + * expensive to architecturally execute the speculation barrier, we are
> + * using a B instruction to architecturally skip it.
> + *
> + * Note that the speculation barrier is technically not necessary as the
> + * B instruction should already block straight-line speculation. But
> + * better be safe than sorry ;).

Eh eh indeed :-)

I think this would be one thing to consider removing depending on ARM's
feedback.


>   */
>  #define arm_smccc_1_1_smc(...)                                  \
>      do {                                                        \
>          __declare_args(__count_args(__VA_ARGS__), __VA_ARGS__); \
>          asm volatile("smc #0\n"                                 \
> +                     "b 1f\n"                                   \
> +                     ASM_SB                                     \
> +                     "1:\n"                                     \
>                       __constraints(__count_args(__VA_ARGS__))); \
>          if ( ___res )                                           \
>          *___res = (typeof(*___res)){r0, r1, r2, r3};            \
> diff --git a/xen/include/asm-arm/system.h b/xen/include/asm-arm/system.h
> index 65d5c8e423d7..e33ff4e0fc39 100644
> --- a/xen/include/asm-arm/system.h
> +++ b/xen/include/asm-arm/system.h
> @@ -33,6 +33,14 @@
>  #define smp_mb__before_atomic()    smp_mb()
>  #define smp_mb__after_atomic()     smp_mb()
>  
> +/*
> + * Speculative barrier
> + * XXX: Add support for the 'sb' instruction
> + */
> +#define ASM_SB "dsb nsh \n isb \n"

Why not ';' ? Anyway it doesn't matter.


> +#define sb()    asm volatile(ASM_SB)
> +
>  /*
>   * This is used to ensure the compiler did actually allocate the register we
>   * asked it for some inline assembly sequences.  Apparently we can't trust
> -- 
> 2.17.1
> 

