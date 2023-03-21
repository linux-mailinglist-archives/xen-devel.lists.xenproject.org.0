Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE36C3873
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:42:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512948.793393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefzu-0007vP-DG; Tue, 21 Mar 2023 17:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512948.793393; Tue, 21 Mar 2023 17:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefzu-0007so-A1; Tue, 21 Mar 2023 17:42:10 +0000
Received: by outflank-mailman (input) for mailman id 512948;
 Tue, 21 Mar 2023 17:42:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pefzs-0007si-5A
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:42:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefzr-0003Tr-NI; Tue, 21 Mar 2023 17:42:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefzr-0006NJ-Fp; Tue, 21 Mar 2023 17:42:07 +0000
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
	bh=DzqWankbKixyR4LXDjKKPfrHuj/UCIASiyO+mR7/tn8=; b=Qxr5t8B4vHI/lJ1auL8Zgx5t0E
	alDgSUKN6cyXRyayK/GIho/S2PKu6YA5OajaE3V0mKOrJVsU4uop2sdtxXNZyfASY/wapReCMBhyD
	wNz6lHqbiAQco4UJXGNCkZX12zFqi9ZkOQ065AeLBcpGCFRqfCY+JQ7nkFY1TPUNJEkM=;
Message-ID: <5a2c6f35-373a-de3c-1db2-aeeb1b39635f@xen.org>
Date: Tue, 21 Mar 2023 17:42:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v5 5/7] xen/riscv: introduce trap_init()
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <91b0284d20f530f2795a119ccb7436ee0b800256.1678976127.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <91b0284d20f530f2795a119ccb7436ee0b800256.1678976127.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 16/03/2023 14:39, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> Changes in V5:
>    - Nothing changed
> ---
> Changes in V4:
>    - Nothing changed
> ---
> Changes in V3:
>    - Nothing changed
> ---
> Changes in V2:
>    - Rename setup_trap_handler() to trap_init().
>    - Add Reviewed-by to the commit message.
> ---
>   xen/arch/riscv/include/asm/traps.h | 1 +
>   xen/arch/riscv/setup.c             | 5 +++++
>   xen/arch/riscv/traps.c             | 7 +++++++
>   3 files changed, 13 insertions(+)
> 
> diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
> index f3fb6b25d1..f1879294ef 100644
> --- a/xen/arch/riscv/include/asm/traps.h
> +++ b/xen/arch/riscv/include/asm/traps.h
> @@ -7,6 +7,7 @@
>   
>   void do_trap(struct cpu_user_regs *cpu_regs);
>   void handle_trap(void);
> +void trap_init(void);
>   
>   #endif /* __ASSEMBLY__ */
>   
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index 36556eb779..b44d105b5f 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -3,7 +3,9 @@
>   #include <xen/kernel.h>
>   
>   #include <asm/boot-info.h>
> +#include <asm/csr.h>
>   #include <asm/early_printk.h>
> +#include <asm/traps.h>
>   
>   /* Xen stack for bringing up the first CPU. */
>   unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
> @@ -32,7 +34,10 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>   
>       fill_boot_info();
>   
> +    trap_init();
> +
>       early_printk("All set up\n");
> +
>       for ( ;; )
>           asm volatile ("wfi");
>   
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index 8a1529e0c5..581f34efbc 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -13,6 +13,13 @@
>   #include <asm/processor.h>
>   #include <asm/traps.h>
>   
> +void trap_init(void)
> +{
> +    unsigned long addr = (unsigned long)&handle_trap;

It is not super clear to me whether this is going to store the virtual 
or physical address.

Depending on the answer, the next would be whether the value would still 
be valid after the MMU is turned on?

> +
> +    csr_write(CSR_STVEC, addr);
> +}
> +
>   static const char *decode_trap_cause(unsigned long cause)
>   {
>       static const char *const trap_causes[] = {

Cheers,

-- 
Julien Grall

