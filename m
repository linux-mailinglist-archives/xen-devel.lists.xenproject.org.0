Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D396E617
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 01:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791465.1201341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smLaw-0001Hx-Iz; Thu, 05 Sep 2024 23:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791465.1201341; Thu, 05 Sep 2024 23:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smLaw-0001FQ-F6; Thu, 05 Sep 2024 23:08:54 +0000
Received: by outflank-mailman (input) for mailman id 791465;
 Thu, 05 Sep 2024 23:08:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMVQ=QD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1smLav-0001FK-AX
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 23:08:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfd4586c-6bdb-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 01:08:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4812B5C5D16;
 Thu,  5 Sep 2024 23:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2758C4CEC4;
 Thu,  5 Sep 2024 23:08:47 +0000 (UTC)
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
X-Inumbo-ID: cfd4586c-6bdb-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725577729;
	bh=A/m09GN0/k8qQ8iW8w1Z5KJG4SdLMDKCp3UaosBgxFw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IplxKQXiy6bxWBGLiZbjK2xo8lcomkYxbMqZlUyLaNvMPWG/cLipu5AoGCXFTpBIN
	 tvEnNKXzvfTy9kxmBCDSvnuLLlvF9Rz6vLn8dPFQyK6ZYrLolDW4inQwY2kR3Pow6O
	 1/pXFIYATXhH774hDJEc1pRHqYlJ66wwghQCd1wPajY0bNzp9x8YkrOkA9m90T8k7c
	 UjOlbwK1/jUT+6EFxmsUNpLoOqvqO8F9S/zVkC/W0MF5tzpxWkHsOo8UgU12YRhe3w
	 rv3aPweiGArCXyXLZGSkha7YvnqJFRildALdNVAkEobbAuzbxXPcahnh5zQgcC9wYf
	 DnkU9Vz32qbSw==
Date: Thu, 5 Sep 2024 16:08:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v3 3/5] xen/bitops: Implement hweight32() in terms of
 hweightl()
In-Reply-To: <20240904225530.3888315-4-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2409051605330.53815@ubuntu-linux-20-04-desktop>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com> <20240904225530.3888315-4-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-130713875-1725577729=:53815"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-130713875-1725577729=:53815
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 4 Sep 2024, Andrew Cooper wrote:
> ... and drop generic_hweight32().
> 
> As noted previously, the only two users of hweight32() are in __init paths.
> 
> The int-optimised form of generic_hweight() is only two instructions shorter
> than the long-optimised form, and even then only on architectures which lack
> fast multiplication, so there's no point providing an int-optimised form.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

The patch is OK:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


I was looking at docs/misra/C-language-toolchain.rst to make sure
everything is listed there. We have attr_const as "__const__" noted
among "Non-standard tokens".

Looks like we need to add __always_inline__ ?


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> 
> v2:
>  * Reorder with respect to the hweight64() patch
>  * Rerwrite the commit message
>  * s/__pure/attr_const/
> ---
>  xen/arch/arm/include/asm/bitops.h | 1 -
>  xen/arch/ppc/include/asm/bitops.h | 1 -
>  xen/arch/x86/include/asm/bitops.h | 1 -
>  xen/include/xen/bitops.h          | 5 +++++
>  4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
> index 91cd167b6bbb..b28c25b3d52d 100644
> --- a/xen/arch/arm/include/asm/bitops.h
> +++ b/xen/arch/arm/include/asm/bitops.h
> @@ -85,7 +85,6 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
>   * The Hamming Weight of a number is the total number of bits set in it.
>   */
>  #define hweight64(x) generic_hweight64(x)
> -#define hweight32(x) generic_hweight32(x)
>  
>  #endif /* _ARM_BITOPS_H */
>  /*
> diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
> index 64512e949530..f488a7c03425 100644
> --- a/xen/arch/ppc/include/asm/bitops.h
> +++ b/xen/arch/ppc/include/asm/bitops.h
> @@ -133,6 +133,5 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
>   * The Hamming Weight of a number is the total number of bits set in it.
>   */
>  #define hweight64(x) __builtin_popcountll(x)
> -#define hweight32(x) __builtin_popcount(x)
>  
>  #endif /* _ASM_PPC_BITOPS_H */
> diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
> index 4c5b21907a64..507b043b8a86 100644
> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -482,6 +482,5 @@ static always_inline unsigned int arch_flsl(unsigned long x)
>   * The Hamming Weight of a number is the total number of bits set in it.
>   */
>  #define hweight64(x) generic_hweight64(x)
> -#define hweight32(x) generic_hweight32(x)
>  
>  #endif /* _X86_BITOPS_H */
> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> index 58c600155f7e..a462c3065158 100644
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -326,6 +326,11 @@ static always_inline attr_const unsigned int hweightl(unsigned long x)
>  #endif
>  }
>  
> +static always_inline attr_const unsigned int hweight32(uint32_t x)
> +{
> +    return hweightl(x);
> +}
> +
>  /* --------------------- Please tidy below here --------------------- */
>  
>  #ifndef find_next_bit
> -- 
> 2.39.2
> 
--8323329-130713875-1725577729=:53815--

