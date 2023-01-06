Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF266019B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472641.732938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnAw-0006Oe-N0; Fri, 06 Jan 2023 13:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472641.732938; Fri, 06 Jan 2023 13:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnAw-0006MS-KL; Fri, 06 Jan 2023 13:54:26 +0000
Received: by outflank-mailman (input) for mailman id 472641;
 Fri, 06 Jan 2023 13:54:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pDnAw-0006MM-6o
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:54:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDnAt-0008Rs-7L; Fri, 06 Jan 2023 13:54:23 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.4.240]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pDnAt-0001fh-1D; Fri, 06 Jan 2023 13:54:23 +0000
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
	bh=UUiwMOZIAOAV5xDV4JldE8+o4vqZBnXwxrWhXML++K4=; b=fK94T02u7bRcydLdw/R/jOy8+0
	Xxb7BdpiA9pYRq10fKuoGa48mddIRdT1VzXJRop9KsconihYakVbfRu6b6SnZRxsxxm+R+3elnhDk
	xC7umJ3LZu/4f7ZmuvdMSObiZMya+wBTrAda8uI0MD4Q0At9PQrU4EP3gCz0by0mqKbY=;
Message-ID: <4e577d78-ff2f-3258-99d6-712af3b6330d@xen.org>
Date: Fri, 6 Jan 2023 13:54:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 3/8] xen/riscv: introduce stack stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
 <e8f65c43d20ebdaba61738200360b14152531321.1673009740.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e8f65c43d20ebdaba61738200360b14152531321.1673009740.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/01/2023 13:14, Oleksii Kurochko wrote:
> The patch introduces and sets up a stack in order to go to C environment
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/riscv/Makefile       | 1 +
>   xen/arch/riscv/riscv64/head.S | 8 +++++++-
>   xen/arch/riscv/setup.c        | 6 ++++++
>   3 files changed, 14 insertions(+), 1 deletion(-)
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
> diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
> index 990edb70a0..ddc7104701 100644
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,4 +1,10 @@
>           .section .text.header, "ax", %progbits
>   
>   ENTRY(start)
> -        j  start
> +        la      sp, cpu0_boot_stack
> +        li      t0, PAGE_SIZE

I would recommend to a define STACK_SIZE. So you don't make assumption 
on the size in the code and it is easier to update.

> +        add     sp, sp, t0
> +
> +_start_hang:
> +        wfi
> +        j  _start_hang
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> new file mode 100644
> index 0000000000..2c7dca1daa
> --- /dev/null
> +++ b/xen/arch/riscv/setup.c
> @@ -0,0 +1,6 @@
> +#include <xen/init.h>
> +#include <xen/compile.h>
> +
> +/* Xen stack for bringing up the first CPU. */
> +unsigned char __initdata cpu0_boot_stack[PAGE_SIZE]
> +    __aligned(PAGE_SIZE);

Cheers,

-- 
Julien Grall

