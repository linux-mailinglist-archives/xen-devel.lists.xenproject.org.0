Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5DA6A2B37
	for <lists+xen-devel@lfdr.de>; Sat, 25 Feb 2023 19:05:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501835.773587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVyvJ-0002NG-A0; Sat, 25 Feb 2023 18:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501835.773587; Sat, 25 Feb 2023 18:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVyvJ-0002Jz-62; Sat, 25 Feb 2023 18:05:29 +0000
Received: by outflank-mailman (input) for mailman id 501835;
 Sat, 25 Feb 2023 18:05:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pVyvI-0002Jt-0U
 for xen-devel@lists.xenproject.org; Sat, 25 Feb 2023 18:05:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVyvH-00066S-Jv; Sat, 25 Feb 2023 18:05:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pVyvH-0002l8-Ch; Sat, 25 Feb 2023 18:05:27 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=G3XbD2sOaausKVXx4uTdHeB8R2lPYFsrZpXbi5D8oz8=; b=139EUDpWnj0uP/e/XlmgH71Ea8
	dw3eSrRPAC7QPTRE49q6MyTQXEv9JbZ9412XwWYDwOfTRrFjr9kbE6cRnGOcM1q/2g7sv8sxNqoin
	ieStXck2Sx4X778PdwtHs2UdIE/6iBjPqBzINlJUmb/+Om1jUjdZDZgPoPKSDjUJcU1o=;
Message-ID: <52072f1b-0cf8-a218-eefc-a8c1b4cecf43@xen.org>
Date: Sat, 25 Feb 2023 18:05:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 2/3] xen/riscv: setup initial pagetables
In-Reply-To: <83444f8f90cf2adf431762d919ba958a25ff8ce4.1677250203.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/02/2023 15:06, Oleksii Kurochko wrote:
> Calculate load and linker linker image addresses and
> setup initial pagetables.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>   xen/arch/riscv/setup.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
> index b7cd438a1d..f69bc278bb 100644
> --- a/xen/arch/riscv/setup.c
> +++ b/xen/arch/riscv/setup.c
> @@ -1,9 +1,11 @@
>   #include <xen/bug.h>
>   #include <xen/compile.h>
>   #include <xen/init.h>
> +#include <xen/kernel.h>
>   
>   #include <asm/csr.h>
>   #include <asm/early_printk.h>
> +#include <asm/mm.h>
>   #include <asm/traps.h>
>   
>   /* Xen stack for bringing up the first CPU. */
> @@ -43,6 +45,11 @@ static void __init disable_fpu(void)
>   
>   void __init noreturn start_xen(void)
>   {
> +    unsigned long load_start    = (unsigned long)start;
> +    unsigned long load_end      = load_start + (unsigned long)(_end - _start);

I am a bit puzzled, on top of load_addr() and linker_addr(), you wrote 
it can't use global variable/function. But here... you are using them. 
So how is this different?

> +    unsigned long linker_start  = (unsigned long)_start;
> +    unsigned long linker_end    = (unsigned long)_end;

I am a bit confused with how you define the start/end for both the 
linker and load. In one you use _start and the other _end.

Both are fixed at compile time, so I assume the values will be a linked 
address rather than the load address. So how is this meant to how?

Furthermore, I would expect linker_start and load_start to point to the 
same symbol (the only different is one store the virtual address whereas 
the other the physical address). But here you are technically using two 
different symbol. Can you explain why?

> +
>       /*
>        * The following things are passed by bootloader:
>        *   a0 -> hart_id
> @@ -65,6 +72,10 @@ void __init noreturn start_xen(void)
>   
>       test_macros_from_bug_h();
>   
> +    setup_initial_pagetables(load_start, load_end, linker_start, linker_end);

Shouldn't this happen earlier in start_xen()?

Cheers,

-- 
Julien Grall

