Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23F13C26C0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 17:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153760.284086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sKC-00036J-Jz; Fri, 09 Jul 2021 15:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153760.284086; Fri, 09 Jul 2021 15:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sKC-00033r-FY; Fri, 09 Jul 2021 15:21:56 +0000
Received: by outflank-mailman (input) for mailman id 153760;
 Fri, 09 Jul 2021 15:21:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m1sKA-0002mo-9t
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 15:21:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1sK9-00036i-6Z; Fri, 09 Jul 2021 15:21:53 +0000
Received: from [54.239.6.180] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m1sK9-0006zO-0e; Fri, 09 Jul 2021 15:21:53 +0000
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
	bh=8TWwdOhogmWcktj/If7KTHO0YXBNsrc5h20i6FqZuY0=; b=OtrtfiCFNjmC2Oycyu/+bje5o9
	5z4OlQHHk8dH3h4iC/B0m+GVQkc+TvA+5mysI6zkIGAsi6HNFdK6mKwn9FwCql620tztVtRB4d6TL
	xRQsN9zfzSfd5a2L1EO6WsBjBfEAEHDs1TOe9UkTfhLDsDr3EzzMof6gyol2OkJvrkFM=;
Subject: Re: [PATCH v2] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210709124035.5520-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <24141b99-a4a2-80f2-1cca-4f86ebc90d94@xen.org>
Date: Fri, 9 Jul 2021 16:21:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709124035.5520-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 09/07/2021 13:40, Michal Orzel wrote:
> AArch64 system registers are 64bit whereas AArch32 ones
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> 
> The last place in code making use of READ/WRITE_SYSREG32
> on arm64 is in TVM_REG macro defining functions vreg_emulate_<register>.
> Implement a macro WRITE_SYSREG_SZ which expands as follows:
> -on arm64: WRITE_SYSREG
> -on arm32: WRITE_SYSREG{32/64}
> 
> As there are no other places in the code using these helpers
> on arm64 - remove them.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Changes since v1:
> -implement WRITE_SYSREG_SZ instead of duplicating the TVM_REG
> ---
>   xen/arch/arm/vcpreg.c               | 12 +++++++++++-
>   xen/include/asm-arm/arm64/sysregs.h |  4 ----
>   2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index f0cdcc8a54..10c4846954 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -47,6 +47,16 @@
>    *
>    */
>   
> +#ifdef CONFIG_ARM_64
> +#define WRITE_SYSREG_SZ(sz, val, sysreg)     WRITE_SYSREG(val, sysreg)

I think you want to cast to (uint##sz##_t) to avoid any surprise. I think...

> +#else
> +/*
> + * WRITE_SYSREG{32/64} on arm32 is defined as variadic macro which imposes
> + * on the below macro to be defined like that as well.
> + */
> +#define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg)
> +#endif
> +
>   /* The name is passed from the upper macro to workaround macro expansion. */
>   #define TVM_REG(sz, func, reg...)                                           \
>   static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
> @@ -55,7 +65,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>       bool cache_enabled = vcpu_has_cache_enabled(v);                         \
>                                                                               \
>       GUEST_BUG_ON(read);                                                     \
> -    WRITE_SYSREG##sz(*r, reg);                                              \
> +    WRITE_SYSREG_SZ(sz, *r, reg);                                           \
>                                                                               \
>       p2m_toggle_cache(v, cache_enabled);                                     \
>                                                                               \
> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
> index 077fd95fb7..795901e1ba 100644
> --- a/xen/include/asm-arm/arm64/sysregs.h
> +++ b/xen/include/asm-arm/arm64/sysregs.h
> @@ -87,10 +87,6 @@
>   
>   /* Access to system registers */
>   
> -#define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
> -
> -#define WRITE_SYSREG32(v, name) WRITE_SYSREG64((uint64_t)v, name)

... this was intended behavior but I used the wrong cast here.

> -
>   #define WRITE_SYSREG64(v, name) do {                    \
>       uint64_t _r = v;                                    \
>       asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
> 

-- 
Julien Grall

