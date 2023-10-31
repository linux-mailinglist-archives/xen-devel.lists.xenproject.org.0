Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEFE7DD5B1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 18:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625993.975847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxt0e-0007Gu-Pw; Tue, 31 Oct 2023 17:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625993.975847; Tue, 31 Oct 2023 17:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxt0e-0007ER-NK; Tue, 31 Oct 2023 17:58:36 +0000
Received: by outflank-mailman (input) for mailman id 625993;
 Tue, 31 Oct 2023 17:58:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxt0d-0007EL-TS
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 17:58:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxt0c-0002Zq-A2; Tue, 31 Oct 2023 17:58:34 +0000
Received: from [15.248.3.3] (helo=[10.24.67.35])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxt0b-00019u-RY; Tue, 31 Oct 2023 17:58:34 +0000
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
	bh=1LZoyg8NMGTTiGhlElcOXDyEmLOGdSpNM0rk0Qkxolw=; b=qIh+7GKcEzVFhCkFIJbdp6FBh6
	xfPPGjC9YXJvdV7/c7lHdZY8mrH4Z0Kyl8cVF4/O7WqpMmlWAX4AG0HT0h2hg7pfoY9RoTPXyNqSs
	9YjxUAmUJf+8gs9qQrOqGrZE5csQn5ZAD57CiPPDR1OnUlpXg2y4Bj/MELZ33gnGhXDQ=;
Message-ID: <a4f3dd98-440e-44d6-9120-5949a04d59f4@xen.org>
Date: Tue, 31 Oct 2023 17:58:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: remove <asm/delay.h>
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/10/2023 14:28, Oleksii Kurochko wrote:
> <asm/delay.h> only declares udelay() function so udelay()
> declaration was moved to xen/delay.h.
> 
> For x86, __udelay() was renamed to udelay() and removed
> inclusion of <asm/delay.h> in x86 code.
> 
> For ppc, udelay() stub definition was moved to ppc/stubs.c.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

For Arm:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Changes in v2:
>   - rebase on top of the latest staging.
>   - add Suggested-by:/Reviewed-by: Jan Beulich <jbeulich@suse.com>.
>   - remove <asm/delay.h> for PPC.
>   - remove changes related to RISC-V's <asm/delay.h> as they've not
>     introduced in staging branch yet.
> ---
>   xen/arch/arm/include/asm/delay.h  | 14 --------------
>   xen/arch/ppc/include/asm/delay.h  | 12 ------------
>   xen/arch/ppc/stubs.c              |  7 +++++++
>   xen/arch/x86/cpu/microcode/core.c |  2 +-
>   xen/arch/x86/delay.c              |  2 +-
>   xen/arch/x86/include/asm/delay.h  | 13 -------------
>   xen/include/xen/delay.h           |  2 +-
>   7 files changed, 10 insertions(+), 42 deletions(-)
>   delete mode 100644 xen/arch/arm/include/asm/delay.h
>   delete mode 100644 xen/arch/ppc/include/asm/delay.h
>   delete mode 100644 xen/arch/x86/include/asm/delay.h
> 
> diff --git a/xen/arch/arm/include/asm/delay.h b/xen/arch/arm/include/asm/delay.h
> deleted file mode 100644
> index 042907d9d5..0000000000
> --- a/xen/arch/arm/include/asm/delay.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#ifndef _ARM_DELAY_H
> -#define _ARM_DELAY_H
> -
> -extern void udelay(unsigned long usecs);
> -
> -#endif /* defined(_ARM_DELAY_H) */
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/ppc/include/asm/delay.h b/xen/arch/ppc/include/asm/delay.h
> deleted file mode 100644
> index da6635888b..0000000000
> --- a/xen/arch/ppc/include/asm/delay.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef __ASM_PPC_DELAY_H__
> -#define __ASM_PPC_DELAY_H__
> -
> -#include <xen/lib.h>
> -
> -static inline void udelay(unsigned long usecs)
> -{
> -    BUG_ON("unimplemented");
> -}
> -
> -#endif /* __ASM_PPC_DELAY_H__ */
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index 4c276b0e39..a96e45626d 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -337,3 +337,10 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
>   {
>       BUG_ON("unimplemented");
>   }
> +
> +/* delay.c */
> +
> +void udelay(unsigned long usecs)
> +{
> +    BUG_ON("unimplemented");
> +}
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index 65ebeb50de..22d5e04552 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -23,6 +23,7 @@
>   
>   #include <xen/alternative-call.h>
>   #include <xen/cpu.h>
> +#include <xen/delay.h>
>   #include <xen/earlycpio.h>
>   #include <xen/err.h>
>   #include <xen/guest_access.h>
> @@ -35,7 +36,6 @@
>   
>   #include <asm/apic.h>
>   #include <asm/cpu-policy.h>
> -#include <asm/delay.h>
>   #include <asm/nmi.h>
>   #include <asm/processor.h>
>   #include <asm/setup.h>
> diff --git a/xen/arch/x86/delay.c b/xen/arch/x86/delay.c
> index 2662c26272..b3a41881a1 100644
> --- a/xen/arch/x86/delay.c
> +++ b/xen/arch/x86/delay.c
> @@ -15,7 +15,7 @@
>   #include <asm/msr.h>
>   #include <asm/processor.h>
>   
> -void __udelay(unsigned long usecs)
> +void udelay(unsigned long usecs)
>   {
>       unsigned long ticks = usecs * (cpu_khz / 1000);
>       unsigned long s, e;
> diff --git a/xen/arch/x86/include/asm/delay.h b/xen/arch/x86/include/asm/delay.h
> deleted file mode 100644
> index 9be2f46590..0000000000
> --- a/xen/arch/x86/include/asm/delay.h
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -#ifndef _X86_DELAY_H
> -#define _X86_DELAY_H
> -
> -/*
> - * Copyright (C) 1993 Linus Torvalds
> - *
> - * Delay routines calling functions in arch/i386/lib/delay.c
> - */
> -
> -extern void __udelay(unsigned long usecs);
> -#define udelay(n) __udelay(n)
> -
> -#endif /* defined(_X86_DELAY_H) */
> diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
> index 9150226271..8fd3b8f99f 100644
> --- a/xen/include/xen/delay.h
> +++ b/xen/include/xen/delay.h
> @@ -3,7 +3,7 @@
>   
>   /* Copyright (C) 1993 Linus Torvalds */
>   
> -#include <asm/delay.h>
> +void udelay(unsigned long usecs);
>   
>   static inline void mdelay(unsigned long msec)
>   {

-- 
Julien Grall

