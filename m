Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C06E3A6E
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 19:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521617.810438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po5xB-00028D-2A; Sun, 16 Apr 2023 17:14:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521617.810438; Sun, 16 Apr 2023 17:14:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po5xA-00026V-VR; Sun, 16 Apr 2023 17:14:16 +0000
Received: by outflank-mailman (input) for mailman id 521617;
 Sun, 16 Apr 2023 17:14:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po5xA-00026P-BG
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 17:14:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po5x9-0000aB-EN; Sun, 16 Apr 2023 17:14:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po5x9-0003x8-9E; Sun, 16 Apr 2023 17:14:15 +0000
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
	bh=N1+ZRfJS+TAIGVKceDPviNXUeXjeeAYAbDV2RmP++cI=; b=SWDBBb2FZIXdxrkWTfIMV8fhdh
	l6qd4+OTIYeZWhR6Jw2z2Y6AijQ+Jd+uWqdoJD0vNRURPxcgoBUUdtygpgA6D3ZZr2MH1tOBmU+6d
	LVIX3vWSL6NotCUmVRdScxyT7+xD66cu39qyiiYjswLT/j1XcmKeQMrQY/rxIV3yFHbU=;
Message-ID: <bee7fc62-d1e0-1dff-c1ad-289ef12ae8da@xen.org>
Date: Sun, 16 Apr 2023 18:14:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] ARM+RISC-V: BSS handling improvements
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20230324222451.3295023-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230324222451.3295023-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/03/2023 22:24, Andrew Cooper wrote:
>   * Correct comments in arm{32,64}/head.S
>   * Provide Linker assertions to check the safety of the zeroing loops
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

It is now fully acked. So I have committed the patch.

Cheers,

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Pulled out of the very start of my work to try and unify the handling of
> xen_phys_addr across architectures.
> ---
>   xen/arch/arm/arm32/head.S | 2 +-
>   xen/arch/arm/arm64/head.S | 2 +-
>   xen/arch/arm/xen.lds.S    | 2 ++
>   xen/arch/riscv/xen.lds.S  | 4 ++++
>   4 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index df51550baa8a..f9f7be9588b1 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -301,7 +301,7 @@ ENDPROC(check_cpu_mode)
>   zero_bss:
>           PRINT("- Zero BSS -\r\n")
>           mov_w r0, __bss_start        /* r0 := vaddr(__bss_start) */
> -        mov_w r1, __bss_end          /* r1 := vaddr(__bss_start) */
> +        mov_w r1, __bss_end          /* r1 := vaddr(__bss_end)   */
>   
>           mov   r2, #0
>   1:      str   r2, [r0], #4
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 4a3f87117c83..8a4dd64c99ad 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -437,7 +437,7 @@ zero_bss:
>   
>           PRINT("- Zero BSS -\r\n")
>           ldr   x0, =__bss_start       /* x0 := vaddr(__bss_start) */
> -        ldr   x1, =__bss_end         /* x1 := vaddr(__bss_start) */
> +        ldr   x1, =__bss_end         /* x1 := vaddr(__bss_end)   */
>   
>   1:      str   xzr, [x0], #8
>           cmp   x0, x1
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 1b392345bc3b..6ca3caefe607 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -240,3 +240,5 @@ ASSERT(_idmap_end - _idmap_start <= PAGE_SIZE, "Identity mapped code is larger t
>    */
>   ASSERT(IS_ALIGNED(__init_begin,     4), "__init_begin is misaligned")
>   ASSERT(IS_ALIGNED(__init_end,       4), "__init_end is misaligned")
> +ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
> +ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
> diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
> index ca57cce75cba..2ed70eccc62a 100644
> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -1,3 +1,4 @@
> +#include <xen/lib.h>
>   #include <xen/xen.lds.h>
>   
>   #undef ENTRY
> @@ -156,3 +157,6 @@ SECTIONS
>   
>       ELF_DETAILS_SECTIONS
>   }
> +
> +ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
> +ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")

-- 
Julien Grall

