Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B02367344
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 21:16:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114922.219068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZIKx-000224-Ae; Wed, 21 Apr 2021 19:16:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114922.219068; Wed, 21 Apr 2021 19:16:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZIKx-00021f-7d; Wed, 21 Apr 2021 19:16:35 +0000
Received: by outflank-mailman (input) for mailman id 114922;
 Wed, 21 Apr 2021 19:16:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lZIKv-00021a-Uq
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 19:16:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZIKu-0006hA-UZ; Wed, 21 Apr 2021 19:16:32 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lZIKu-0006w9-No; Wed, 21 Apr 2021 19:16:32 +0000
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
	bh=32BVbG/QJhMWsZgHe2umlugE0bG0/Ew2dQKNY/udD68=; b=sIQkNfdZFzPxvonDuCYUFreZ32
	WFC5Yg2xnmc9yJwh4GLEy4psWwikMry94wnWrFRbjYCDzvc7X2AZqP0oGRmQj071xU/TNpLppGJ7t
	EwsCtMhyXUJzWGGVz9qGvH0bSIgryds+D2K5GuZGb5TV/OsdWCZlNJCMEcRP4aI59xaA=;
Subject: Re: [PATCH 9/9] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210420070853.8918-1-michal.orzel@arm.com>
 <20210420070853.8918-10-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c318c303-1187-3a64-833b-0684a2dc4312@xen.org>
Date: Wed, 21 Apr 2021 20:16:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210420070853.8918-10-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 20/04/2021 08:08, Michal Orzel wrote:
> AArch64 system registers are 64bit whereas AArch32 ones
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 sysregs have upper 32bit reserved
> it does not mean that they can't be widen in the future.

As a general comment, all your commit message contains information about 
the goal (which is great). But they don't go much in details about the 
actual changes. I have tried to point out where I think those details 
would be helpful.

> 
> As there are no other places in the code using READ/WRITE_SYSREG32,
> remove the helper macros.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
>   xen/arch/arm/vcpreg.c               | 16 ++++++++++++++++
>   xen/include/asm-arm/arm64/sysregs.h |  5 -----
>   2 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index c7f516ee0a..6cb7f3108c 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -48,6 +48,7 @@
>    */
>   
>   /* The name is passed from the upper macro to workaround macro expansion. */
> +#ifdef CONFIG_ARM_32
>   #define TVM_REG(sz, func, reg...)                                           \
>   static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>   {                                                                           \
> @@ -61,6 +62,21 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>                                                                               \
>       return true;                                                            \
>   }
> +#else /* CONFIG_ARM_64 */
> +#define TVM_REG(sz, func, reg...)                                           \
> +static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
> +{                                                                           \
> +    struct vcpu *v = current;                                               \
> +    bool cache_enabled = vcpu_has_cache_enabled(v);                         \
> +                                                                            \
> +    GUEST_BUG_ON(read);                                                     \
> +    WRITE_SYSREG(*r, reg);                                                  \
> +                                                                            \
> +    p2m_toggle_cache(v, cache_enabled);                                     \
> +                                                                            \
> +    return true;                                                            \
> +}
> +#endif

It would be nice if this change can be explained in the commit message. 
However, I think we can avoid the duplication by aliasing TVM_REG32() to 
TVM_REG64() on Arm64.

>   
>   #define TVM_REG32(regname, xreg) TVM_REG(32, vreg_emulate_##regname, xreg)
>   #define TVM_REG64(regname, xreg) TVM_REG(64, vreg_emulate_##regname, xreg)
> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
> index 077fd95fb7..83a1157ac4 100644
> --- a/xen/include/asm-arm/arm64/sysregs.h
> +++ b/xen/include/asm-arm/arm64/sysregs.h
> @@ -86,11 +86,6 @@
>   #endif
>   
>   /* Access to system registers */
> -
> -#define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
> -
> -#define WRITE_SYSREG32(v, name) WRITE_SYSREG64((uint64_t)v, name)
> -
>   #define WRITE_SYSREG64(v, name) do {                    \
>       uint64_t _r = v;                                    \
>       asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
> 

Cheers,

-- 
Julien Grall

