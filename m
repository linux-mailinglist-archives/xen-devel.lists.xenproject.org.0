Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE48D57A9
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 03:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733193.1139326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqrC-0008Nb-Le; Fri, 31 May 2024 01:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733193.1139326; Fri, 31 May 2024 01:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCqrC-0008KW-Is; Fri, 31 May 2024 01:14:58 +0000
Received: by outflank-mailman (input) for mailman id 733193;
 Fri, 31 May 2024 01:14:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h8zp=NC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sCqrB-0008KP-Jc
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 01:14:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ff8389a-1eeb-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 03:14:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9956F62A69;
 Fri, 31 May 2024 01:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE78C32786;
 Fri, 31 May 2024 01:14:51 +0000 (UTC)
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
X-Inumbo-ID: 2ff8389a-1eeb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717118093;
	bh=G9ICLlFDLIkdzXmV0iXMa+kIxih68zobAVPFmpeXTEo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bwh6WucFJvkGXMNapVCspS/zI2wGgAk20gOFb/+cJ6hxj1bupX8gXEwqtTw+Fjus1
	 InQD2SdcP04duwNNvVMAr0nDMJhcxzZ2J0DY896aUjdb0d++ZVJmkucaMsb8bl/tvq
	 Pa1XNTrNDlZKsW/laEK85aTO7LolkluzS9AS6KAb26IC2ZmfYiWl0GgxWza6B4Gd9i
	 vR5gwNINkAuy8LxICbZAzak1Iy6WaJRopqe3/uStfnzFbpAqHPdsle9pVsMUOPD6bq
	 JUN0n1BAE9qC1/jdWsUDYVn/Jgc6C0j+s261eXvaXpwtNNOrNjhxSihqCTIO7jqFnn
	 ispWlatpkbU6w==
Date: Thu, 30 May 2024 18:14:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Federico Serafini <federico.serafini@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH v2 06/13] xen/bitops: Implement ffs() in common logic
In-Reply-To: <20240524200338.1232391-7-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2405301809170.2557291@ubuntu-linux-20-04-desktop>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com> <20240524200338.1232391-7-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-254836557-1717118093=:2557291"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-254836557-1717118093=:2557291
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 24 May 2024, Andrew Cooper wrote:
> Perform constant-folding unconditionally, rather than having it implemented
> inconsistency between architectures.
> 
> Confirm the expected behaviour with compile time and boot time tests.
> 
> For non-constant inputs, use arch_ffs() if provided but fall back to
> generic_ffsl() if not.  In particular, RISC-V doesn't have a builtin that
> works in all configurations.
> 
> For x86, rename ffs() to arch_ffs() and adjust the prototype.
> 
> For PPC, __builtin_ctz() is 1/3 of the size of size of the transform to
> generic_fls().  Drop the definition entirely.  ARM too benefits in the general
> case by using __builtin_ctz(), but less dramatically because it using
> optimised asm().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This patch made me realize that we should add __builtin_ctz,
__builtin_constant_p and always_inline to
docs/misra/C-language-toolchain.rst as they don't seem to be currently
documented and they are not part of the C standard

Patch welcome :-)

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Simone Ballarin <simone.ballarin@bugseng.com>
> CC: Federico Serafini <federico.serafini@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> v2:
>  * Fall back to generic, not builtin.
>  * Extend the testing with multi-bit values.
>  * Use always_inline for x86
>  * Defer x86 optimisation to a later change
> ---
>  xen/arch/arm/include/asm/bitops.h |  2 +-
>  xen/arch/ppc/include/asm/bitops.h |  2 +-
>  xen/arch/x86/include/asm/bitops.h |  3 ++-
>  xen/common/Makefile               |  1 +
>  xen/common/bitops.c               | 19 +++++++++++++++++++
>  xen/include/xen/bitops.h          | 17 +++++++++++++++++
>  6 files changed, 41 insertions(+), 3 deletions(-)
>  create mode 100644 xen/common/bitops.c
> 
> diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
> index ec1cf7b9b323..a88ec2612e16 100644
> --- a/xen/arch/arm/include/asm/bitops.h
> +++ b/xen/arch/arm/include/asm/bitops.h
> @@ -157,7 +157,7 @@ static inline int fls(unsigned int x)
>  }
>  
>  
> -#define ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
> +#define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
>  #define ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
>  
>  /**
> diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
> index ab692d01717b..5c36a6cc0ce3 100644
> --- a/xen/arch/ppc/include/asm/bitops.h
> +++ b/xen/arch/ppc/include/asm/bitops.h
> @@ -173,7 +173,7 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
>  
>  #define flsl(x) generic_flsl(x)
>  #define fls(x) generic_flsl(x)
> -#define ffs(x) ({ unsigned int t_ = (x); fls(t_ & -t_); })
> +#define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
>  #define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & -t_); })
>  
>  /**
> diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
> index 5a71afbc89d5..122767fc0d10 100644
> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -430,7 +430,7 @@ static inline int ffsl(unsigned long x)
>      return (int)r+1;
>  }
>  
> -static inline int ffs(unsigned int x)
> +static always_inline unsigned int arch_ffs(unsigned int x)
>  {
>      int r;
>  
> @@ -440,6 +440,7 @@ static inline int ffs(unsigned int x)
>            "1:" : "=r" (r) : "rm" (x));
>      return r + 1;
>  }
> +#define arch_ffs arch_ffs
>  
>  /**
>   * fls - find last bit set
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index d512cad5243f..21a4fb4c7166 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_ARGO) += argo.o
>  obj-y += bitmap.o
> +obj-bin-$(CONFIG_DEBUG) += bitops.init.o
>  obj-$(CONFIG_GENERIC_BUG_FRAME) += bug.o
>  obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
> diff --git a/xen/common/bitops.c b/xen/common/bitops.c
> new file mode 100644
> index 000000000000..8c161b8ea7fa
> --- /dev/null
> +++ b/xen/common/bitops.c
> @@ -0,0 +1,19 @@
> +#include <xen/bitops.h>
> +#include <xen/boot-check.h>
> +#include <xen/init.h>
> +
> +static void __init test_ffs(void)
> +{
> +    /* unsigned int ffs(unsigned int) */
> +    CHECK(ffs, 0, 0);
> +    CHECK(ffs, 1, 1);
> +    CHECK(ffs, 3, 1);
> +    CHECK(ffs, 7, 1);
> +    CHECK(ffs, 6, 2);
> +    CHECK(ffs, 0x80000000U, 32);
> +}
> +
> +static void __init __constructor test_bitops(void)
> +{
> +    test_ffs();
> +}
> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> index cd405df96180..f7e90a2893a5 100644
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -31,6 +31,23 @@ unsigned int __pure generic_flsl(unsigned long x);
>  
>  #include <asm/bitops.h>
>  
> +/*
> + * Find First/Last Set bit (all forms).
> + *
> + * Bits are labelled from 1.  Returns 0 if given 0.
> + */
> +static always_inline __pure unsigned int ffs(unsigned int x)
> +{
> +    if ( __builtin_constant_p(x) )
> +        return __builtin_ffs(x);
> +
> +#ifdef arch_ffs
> +    return arch_ffs(x);
> +#else
> +    return generic_ffsl(x);
> +#endif
> +}
> +
>  /* --------------------- Please tidy below here --------------------- */
>  
>  #ifndef find_next_bit
> -- 
> 2.30.2
> 
--8323329-254836557-1717118093=:2557291--

