Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A343D026F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jul 2021 22:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.158960.292483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5vuV-0002dc-M0; Tue, 20 Jul 2021 20:00:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 158960.292483; Tue, 20 Jul 2021 20:00:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m5vuV-0002bl-I4; Tue, 20 Jul 2021 20:00:11 +0000
Received: by outflank-mailman (input) for mailman id 158960;
 Tue, 20 Jul 2021 20:00:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr4l=MM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m5vuU-0002bf-Cx
 for xen-devel@lists.xenproject.org; Tue, 20 Jul 2021 20:00:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 377ee854-89d5-4d3c-96b7-35c34055799f;
 Tue, 20 Jul 2021 20:00:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7D566100C;
 Tue, 20 Jul 2021 20:00:08 +0000 (UTC)
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
X-Inumbo-ID: 377ee854-89d5-4d3c-96b7-35c34055799f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626811209;
	bh=d00NCUUryhuhmoyZU2VJmu7RuhImHk00M6zHo2ogGYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=is7FKOE97MNxjpwKurr7ssRBh9MJcJFbtDsXz2rDIEjzrhP++qmIcoLY9m/jXArNA
	 4qMygikqxYW6/2yTj1YAoD+SXAkgcf548EyjIQ/00r7dz2leCr+TszBTmkDP5HC/WX
	 ND7IHsDQfN/MUca8oyEGoWtm/zLP4cjkGG1KDcEIfxy12lVaqxNo4oNTDVaAuCwOyw
	 TamycrQBSWAkRK4HUhe2e0zTHbdBZGngUigV5QFht7v8qqd51vOOjLn6omtu6LY+RR
	 cR1mjasS83k/0uVpQbRQDd6lAjm8+2Fgecq/FCyi/rKgmO7PxHxa7klQ/dGA7p+U+v
	 Fd9xGrPrBNprw==
Date: Tue, 20 Jul 2021 13:00:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Michal Orzel <michal.orzel@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
Subject: Re: [PATCH v3] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
In-Reply-To: <20210712085329.16613-1-michal.orzel@arm.com>
Message-ID: <alpine.DEB.2.21.2107201259300.3916@sstabellini-ThinkPad-T480s>
References: <20210712085329.16613-1-michal.orzel@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Jul 2021, Michal Orzel wrote:
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
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

The patch looks OK to me and you addressed Julien's concerns from v2. So
I am going to commit it.

Thanks!

Cheers,

Stefano

> ---
> Changes since v2:
> -add uint##sz##_t casting
> Changes since v1:
> -implement WRITE_SYSREG_SZ instead of duplicating the TVM_REG
> ---
>  xen/arch/arm/vcpreg.c               | 12 +++++++++++-
>  xen/include/asm-arm/arm64/sysregs.h |  4 ----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index f0cdcc8a54..e3ce56d875 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -47,6 +47,16 @@
>   *
>   */
>  
> +#ifdef CONFIG_ARM_64
> +#define WRITE_SYSREG_SZ(sz, val, sysreg) WRITE_SYSREG((uint##sz##_t)val, sysreg)
> +#else
> +/*
> + * WRITE_SYSREG{32/64} on arm32 is defined as variadic macro which imposes
> + * on the below macro to be defined like that as well.
> + */
> +#define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg)
> +#endif
> +
>  /* The name is passed from the upper macro to workaround macro expansion. */
>  #define TVM_REG(sz, func, reg...)                                           \
>  static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
> @@ -55,7 +65,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)    \
>      bool cache_enabled = vcpu_has_cache_enabled(v);                         \
>                                                                              \
>      GUEST_BUG_ON(read);                                                     \
> -    WRITE_SYSREG##sz(*r, reg);                                              \
> +    WRITE_SYSREG_SZ(sz, *r, reg);                                           \
>                                                                              \
>      p2m_toggle_cache(v, cache_enabled);                                     \
>                                                                              \
> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
> index 077fd95fb7..795901e1ba 100644
> --- a/xen/include/asm-arm/arm64/sysregs.h
> +++ b/xen/include/asm-arm/arm64/sysregs.h
> @@ -87,10 +87,6 @@
>  
>  /* Access to system registers */
>  
> -#define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
> -
> -#define WRITE_SYSREG32(v, name) WRITE_SYSREG64((uint64_t)v, name)
> -
>  #define WRITE_SYSREG64(v, name) do {                    \
>      uint64_t _r = v;                                    \
>      asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
> -- 
> 2.29.0
> 

