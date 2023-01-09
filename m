Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B0E662AEB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473830.734634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEukR-0003pG-Kt; Mon, 09 Jan 2023 16:11:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473830.734634; Mon, 09 Jan 2023 16:11:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEukR-0003lq-Hz; Mon, 09 Jan 2023 16:11:43 +0000
Received: by outflank-mailman (input) for mailman id 473830;
 Mon, 09 Jan 2023 16:11:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEukQ-0003li-AJ
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:11:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEukO-0002GF-KN; Mon, 09 Jan 2023 16:11:40 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.1.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEukO-0001C3-Du; Mon, 09 Jan 2023 16:11:40 +0000
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
	bh=ZOnG/ZtCnORamGdA/bymsKSaCteFH1kKCRTB4TBz6Fc=; b=2iQODrpyy6jueEd77l8+s2TNcT
	DPoHF57QnXVobTXb9OQcl5VWpjvL9OGKadgsjrethnUXZOpUn2OjmdfPfTNws3Z3gY4oOcVZidYPN
	70k90J5qLSOT3WplbB+6+Buf3CtC1Xpz1yDuzyNmJK3m9IM4dw1T8U4OScRGTGbJUAvw=;
Message-ID: <e5ecc23f-4d4b-fa21-bd71-68cefcde644f@xen.org>
Date: Mon, 9 Jan 2023 16:11:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/8] xen/riscv: introduce stack stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
 <b253e61bebbc029c94b89389d81643f9587200b7.1673278109.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b253e61bebbc029c94b89389d81643f9587200b7.1673278109.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/01/2023 15:46, Oleksii Kurochko wrote:
> The patch introduces and sets up a stack in order to go to C environment
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

It looks like the comments from Andrew were missed.

> ---
> Changes in V2:
>      - introduce STACK_SIZE define.
>      - use consistent padding between instruction mnemonic and operand(s)
> ---
>   xen/arch/riscv/Makefile             | 1 +
>   xen/arch/riscv/include/asm/config.h | 2 ++
>   xen/arch/riscv/riscv64/head.S       | 8 +++++++-
>   xen/arch/riscv/setup.c              | 6 ++++++
>   4 files changed, 16 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/riscv/setup.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 248f2cbb3e..5a67a3f493 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,4 +1,5 @@
>   obj-$(CONFIG_RISCV_64) += riscv64/
> +obj-y += setup.o
>   
>   $(TARGET): $(TARGET)-syms
>   	$(OBJCOPY) -O binary -S $< $@
> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
> index 0370f865f3..bdd2237f01 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -43,6 +43,8 @@
>   
>   #define SMP_CACHE_BYTES (1 << 6)
>   
> +#define STACK_SIZE (PAGE_SIZE)
> +
>   #endif /* __RISCV_CONFIG_H__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 990edb70a0..c1f33a1934 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,4 +1,10 @@
>           .section .text.header, "ax", %progbits
>   
>   ENTRY(start)
> -        j  start
> +        la      sp, cpu0_boot_stack
> +        li      t0, STACK_SIZE
> +        add     sp, sp, t0
> +
> +_start_hang:
> +        wfi
> +        j       _start_hang
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> new file mode 100644
> index 0000000000..41ef4912bd
> --- /dev/null
> +++ b/xen/arch/riscv/setup.c
> @@ -0,0 +1,6 @@
> +#include <xen/init.h>
> +#include <xen/compile.h>

Why do you need to include <xen/compile.h>?

In any case, please order the include alphabetically. I haven't look at 
the rest of the series. But please go through the series and check that 
generic comments (like this one) are addressed everywhere.

Cheers,

-- 
Julien Grall

