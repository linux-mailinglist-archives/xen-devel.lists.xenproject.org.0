Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A71EE547092
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jun 2022 02:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346873.572826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzpC8-0004ht-CR; Sat, 11 Jun 2022 00:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346873.572826; Sat, 11 Jun 2022 00:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzpC8-0004eU-8W; Sat, 11 Jun 2022 00:41:40 +0000
Received: by outflank-mailman (input) for mailman id 346873;
 Sat, 11 Jun 2022 00:41:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXwC=WS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nzpC6-0004eO-Cj
 for xen-devel@lists.xenproject.org; Sat, 11 Jun 2022 00:41:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f36f193-e91f-11ec-bd2c-47488cf2e6aa;
 Sat, 11 Jun 2022 02:41:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E1F161F39;
 Sat, 11 Jun 2022 00:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346B8C34114;
 Sat, 11 Jun 2022 00:41:34 +0000 (UTC)
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
X-Inumbo-ID: 3f36f193-e91f-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654908094;
	bh=8bwDMRcbBGmeqBFM+Fcec2ie1Pqtr9LL2LyK4fTPmMo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uxpentRgK5SxC7MPrX5SSZnDN7gdu1S1TKaaEtvU49n40SHnLgh0GvmVPEmjIfMq0
	 mGb8sQCvaEIkMMOD1K822xVYfDgezoNy8QCORkTCRCxF/8KTAkaRbeHPZ5T88OVT6D
	 UyMyzdh39g4KtyATm73z7S2byluU4Kfd8wf27Yu7Rhz+oyGrKKhR5Nlutw92WD+Lsx
	 Dbxe4cJIDF3uB9xTlPB8H8BlF4a2i0PjMFaoBj7f4+uUC2YDS5hm2kzNcyTDAxtytQ
	 ibjBDwJYlrbQ8+5nudham4gr8On1ouHe8X53T3ssG3Ymhcy4Y4PCnBVvuKcmffwAGz
	 zdzLrtzBS5weg==
Date: Fri, 10 Jun 2022 17:41:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jens Wiklander <jens.wiklander@linaro.org>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
In-Reply-To: <20220609061812.422130-2-jens.wiklander@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop>
References: <20220609061812.422130-1-jens.wiklander@linaro.org> <20220609061812.422130-2-jens.wiklander@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jun 2022, Jens Wiklander wrote:
> SMCCC v1.2 AArch64 allows x0-x17 to be used as both parameter registers
> and result registers for the SMC and HVC instructions.
> 
> Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
> parameter and result registers.
> 
> Let us add new interface to support this extended set of input/output
> registers.
> 
> This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
> extended input/output registers") by Sudeep Holla from the Linux kernel
> 
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>  xen/arch/arm/arm64/smc.S         | 43 ++++++++++++++++++++++++++++++++
>  xen/arch/arm/include/asm/smccc.h | 42 +++++++++++++++++++++++++++++++
>  xen/arch/arm/vsmc.c              |  2 +-
>  3 files changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
> index 91bae62dd4d2..1570bc8eb9d4 100644
> --- a/xen/arch/arm/arm64/smc.S
> +++ b/xen/arch/arm/arm64/smc.S
> @@ -27,3 +27,46 @@ ENTRY(__arm_smccc_1_0_smc)
>          stp     x2, x3, [x4, #SMCCC_RES_a2]
>  1:
>          ret
> +
> +
> +/*
> + * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> + *                        struct arm_smccc_1_2_regs *res)
> + */
> +ENTRY(arm_smccc_1_2_smc)
> +    /* Save `res` and free a GPR that won't be clobbered */
> +    stp     x1, x19, [sp, #-16]!
> +
> +    /* Ensure `args` won't be clobbered while loading regs in next step */
> +    mov	x19, x0
> +
> +    /* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
> +    ldp	x0, x1, [x19, #0]
> +    ldp	x2, x3, [x19, #16]
> +    ldp	x4, x5, [x19, #32]
> +    ldp	x6, x7, [x19, #48]
> +    ldp	x8, x9, [x19, #64]
> +    ldp	x10, x11, [x19, #80]
> +    ldp	x12, x13, [x19, #96]
> +    ldp	x14, x15, [x19, #112]
> +    ldp	x16, x17, [x19, #128]
> +
> +    smc #0
> +
> +    /* Load the `res` from the stack */
> +    ldr	x19, [sp]
> +
> +    /* Store the registers x0 - x17 into the result structure */
> +    stp	x0, x1, [x19, #0]
> +    stp	x2, x3, [x19, #16]
> +    stp	x4, x5, [x19, #32]
> +    stp	x6, x7, [x19, #48]
> +    stp	x8, x9, [x19, #64]
> +    stp	x10, x11, [x19, #80]
> +    stp	x12, x13, [x19, #96]
> +    stp	x14, x15, [x19, #112]
> +    stp	x16, x17, [x19, #128]

I noticed that in the original commit the offsets are declared as
ARM_SMCCC_1_2_REGS_X0_OFFS, etc. In Xen we could add them to
xen/arch/arm/arm64/asm-offsets.c given that they are only used in asm.

That said, there isn't a huge value in declaring them given that they
are always read and written in order and there is nothing else in the
struct, so I am fine either way.

I am also happy to have them declared if other maintainers prefer it
that way.


> +    /* Restore original x19 */
> +    ldp     xzr, x19, [sp], #16
> +    ret
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
> index b3dbeecc90ad..316adf968e74 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -33,6 +33,7 @@
>  
>  #define ARM_SMCCC_VERSION_1_0   SMCCC_VERSION(1, 0)
>  #define ARM_SMCCC_VERSION_1_1   SMCCC_VERSION(1, 1)
> +#define ARM_SMCCC_VERSION_1_2   SMCCC_VERSION(1, 2)
>  
>  /*
>   * This file provides common defines for ARM SMC Calling Convention as
> @@ -217,6 +218,7 @@ struct arm_smccc_res {
>  #ifdef CONFIG_ARM_32
>  #define arm_smccc_1_0_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
>  #define arm_smccc_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
> +
>  #else

Spurious change


>  void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
> @@ -265,8 +267,48 @@ void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
>          else                                                    \
>              arm_smccc_1_0_smc(__VA_ARGS__);                     \
>      } while ( 0 )
> +
> +/**
> + * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
> + * @a0-a17 argument values from registers 0 to 17
> + */
> +struct arm_smccc_1_2_regs {
> +    unsigned long a0;
> +    unsigned long a1;
> +    unsigned long a2;
> +    unsigned long a3;
> +    unsigned long a4;
> +    unsigned long a5;
> +    unsigned long a6;
> +    unsigned long a7;
> +    unsigned long a8;
> +    unsigned long a9;
> +    unsigned long a10;
> +    unsigned long a11;
> +    unsigned long a12;
> +    unsigned long a13;
> +    unsigned long a14;
> +    unsigned long a15;
> +    unsigned long a16;
> +    unsigned long a17;
> +};
>  #endif /* CONFIG_ARM_64 */
>  
> +/**
> + * arm_smccc_1_2_smc() - make SMC calls
> + * @args: arguments passed via struct arm_smccc_1_2_regs
> + * @res: result values via struct arm_smccc_1_2_regs
> + *
> + * This function is used to make SMC calls following SMC Calling Convention
> + * v1.2 or above. The content of the supplied param are copied from the
> + * structure to registers prior to the SMC instruction. The return values
> + * are updated with the content from registers on return from the SMC
> + * instruction.
> + */
> +void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
> +                       struct arm_smccc_1_2_regs *res);
> +

As arm_smccc_1_2_smc is not implemented in ARM32 it is better to place
the declaration inside the #ifdef CONFIG_ARM_64.


>  #endif /* __ASSEMBLY__ */
>  
>  /*
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 676740ef1520..6f90c08a6304 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
>      switch ( fid )
>      {
>      case ARM_SMCCC_VERSION_FID:
> -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
> +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
>          return true;
  
This is going to be a problem for ARM32 given that ARM_SMCCC_VERSION_1_2
is unimplemented on ARM32. If there is an ARM32 implementation in Linux
for ARM_SMCCC_VERSION_1_2 you might as well import it too.

Otherwise we'll have to abstract it away, e.g.:

#ifdef CONFIG_ARM_64
#define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_2
#else
#define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_1
#endif

>      case ARM_SMCCC_ARCH_FEATURES_FID:
> -- 
> 2.31.1
> 

