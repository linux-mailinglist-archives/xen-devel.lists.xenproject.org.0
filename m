Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62078CB55CC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 10:33:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183743.1506339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTd3J-0007Mm-48; Thu, 11 Dec 2025 09:33:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183743.1506339; Thu, 11 Dec 2025 09:33:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTd3J-0007Jw-0z; Thu, 11 Dec 2025 09:33:37 +0000
Received: by outflank-mailman (input) for mailman id 1183743;
 Thu, 11 Dec 2025 09:33:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vTd3H-0007Jn-Up
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 09:33:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vTd3G-004kbT-2o;
 Thu, 11 Dec 2025 09:33:35 +0000
Received: from [2a02:8012:3a1:0:cd49:6fb:8176:d6c5]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vTd3G-004XNp-30;
 Thu, 11 Dec 2025 09:33:35 +0000
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
	bh=BLj6GGfJoQYtuwDrHxhZHhZYstAtW5qrttBQogdMlaA=; b=1ZHTlvoIhV88LXyYJqrd3bDTKS
	bK4lJNPNuYJ0zJ7+bwzahmii4DE+GoLF81jiUszK0zTrXWRICF26Z8M4jO4ueaXkFX5n02hFElbq/
	0Z9n8qLH9QTdsqPYDE+rk3+zoJqoJTD9XIW/+6v1/pG3hlmIsROTzATvtO2iUHs6nsLM=;
Message-ID: <ff441352-ee38-4357-9479-9398c7df356d@xen.org>
Date: Thu, 11 Dec 2025 09:33:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm64: Add support Clang build on arm64
To: Saman Dehghan <samaan.dehghan@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
 <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Saman,

A bit of process first. Usually, when sending a v2, a new thread is 
started (IOW, this is not sent in reply to v1).

On 11/12/2025 02:39, Saman Dehghan wrote:
> This patch enables building Xen on arm64 architecture using the Clang compiler.
> Changes include:
> - Add explicit -march=armv8 flag for arm64 builds.
> - Add `__attribute__((target("fp-armv8")))` to `vfp_save_state` and
>    `vfp_restore_state` functions when building with Clang to allow
>    FP instructions despite `-mgeneral-regs-only`.
> 
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> ---
>   README                   | 2 ++
>   xen/arch/arm/arch.mk     | 1 +
>   xen/arch/arm/arm64/vfp.c | 6 ++++++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/README b/README
> index 889a4ea906..67c1aa7fe6 100644
> --- a/README
> +++ b/README
> @@ -45,6 +45,8 @@ provided by your OS distributor:
>         - For ARM:
>           - GCC 5.1 or later
>           - GNU Binutils 2.25 or later
> +        or
> +        - Clang/LLVM 11 or later
>         - For RISC-V 64-bit:
>           - GCC 12.2 or later
>           - GNU Binutils 2.39 or later
> diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
> index 9c4bedfb3b..bcf548069b 100644
> --- a/xen/arch/arm/arch.mk
> +++ b/xen/arch/arm/arch.mk
> @@ -13,6 +13,7 @@ ifeq ($(CONFIG_MPU),y)
>   CFLAGS-$(CONFIG_ARM_64) += -march=armv8-r
>   else
>   CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
> +CFLAGS-$(CONFIG_ARM_64) += -march=armv8
>   endif
>   CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
>   $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)
> diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
> index c4f89c7b0e..51fd2ddc54 100644
> --- a/xen/arch/arm/arm64/vfp.c
> +++ b/xen/arch/arm/arm64/vfp.c
> @@ -46,6 +46,9 @@ static inline void restore_state(const uint64_t *fpregs)
>                    : : "Q" (*fpregs), "r" (fpregs));
>   }
>   
> +#if defined(CONFIG_CC_IS_CLANG)
> +__attribute__((target("fp-armv8")))
> +#endif

Based on Jan's comment, I am a bit puzzled why adding #ifdef is 
sufficient. In fact, I do agree with Jan, my understanding of 
target(...) is this will impact the ABI.

I haven't experienced any issue with the C side yet. But I know in the 
Rust world (they also have an LLVM backend), they decided to prevent 
enabling fp/neon [1] at the function level.

Did you find any documentation that would suggest this is safe?

Now regarding the issue you mentioned in v1:

 > On top of those, `READ_SYSREG(FPSR)`, `READ_SYSREG(FPCR)`,
 > `WRITE_SYSREG(v->arch.vfp.fpsr, FPSR)`and
 > `WRITE_SYSREG(v->arch.vfp.fpcr, FPCR)` using FP.
 > I think I cannot apply __attribute__ on statements.

Do you mean the compiler will complain that you are trying to access 
FPCR/FPSR if you don't add the __atribute__ at the function level?

If so, what you could possibly do is either rewriting the functions in 
assembly or open-code the "{WRITE, READ}_SYSREG()" and add a line 
".arch_extension fp".

Cheers,

[1] https://github.com/llvm/llvm-project/issues/110632

-- 
Julien Grall


