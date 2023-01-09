Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC02662ABE
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 17:03:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473810.734599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuch-0001AK-Af; Mon, 09 Jan 2023 16:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473810.734599; Mon, 09 Jan 2023 16:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuch-00017m-7R; Mon, 09 Jan 2023 16:03:43 +0000
Received: by outflank-mailman (input) for mailman id 473810;
 Mon, 09 Jan 2023 16:03:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEucg-00017g-0L
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 16:03:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEucf-00026D-JK; Mon, 09 Jan 2023 16:03:41 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.1.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEucf-0000hu-CG; Mon, 09 Jan 2023 16:03:41 +0000
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
	bh=r0hI2Lg1QMOkm1f5XcDf81indRAxlLTDU1kH8NhnuHc=; b=Eo4/j+cuX2ypI1r2XrbvSsfnBs
	s/ytfU3ft5EfOTpfO7usvNc+8m6n2A2HxYSHGbIPDAwyP/IHoPbO5CeTz6QAcO8XauYZy/2nXZCIE
	LKADJrTPaO5wBvsC5VXJ3tVZTxu/nA9gfUj0TqFz6SuObydnTNqTDAO+TYWwbGoTXth4=;
Message-ID: <7990322c-639b-38d4-ff6c-221988532c33@xen.org>
Date: Mon, 9 Jan 2023 16:03:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] xen/riscv: introduce sbi call to putchar to
 console
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
 <9b85a963db538e4735a9f99fc9090ad79508cb2c.1673278109.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9b85a963db538e4735a9f99fc9090ad79508cb2c.1673278109.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/01/2023 15:46, Oleksii Kurochko wrote:
> The patch introduce sbi_putchar() SBI call which is necessary
> to implement initial early_printk
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>      - add an explanatory comment about sbi_console_putchar() function.
>      - order the files alphabetically in Makefile
> ---
>   xen/arch/riscv/Makefile          |  1 +
>   xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
>   xen/arch/riscv/sbi.c             | 44 ++++++++++++++++++++++++++++++++
>   3 files changed, 79 insertions(+)
>   create mode 100644 xen/arch/riscv/include/asm/sbi.h
>   create mode 100644 xen/arch/riscv/sbi.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 5a67a3f493..fd916e1004 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,4 +1,5 @@
>   obj-$(CONFIG_RISCV_64) += riscv64/
> +obj-y += sbi.o
>   obj-y += setup.o
>   
>   $(TARGET): $(TARGET)-syms
> diff --git a/xen/arch/riscv/include/asm/sbi.h b/xen/arch/riscv/include/asm/sbi.h
> new file mode 100644
> index 0000000000..34b53f8eaf
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later) */
> +/*
> + * Copyright (c) 2021 Vates SAS.
> + *
> + * Taken from xvisor, modified by Bobby Eshleman (bobby.eshleman@gmail.com).
Hmmm... I missed this one in v1. Is this mostly code from Bobby? If so, 
please update the commit message accordingly.

FAOD, this comment applies for any future code you take from anyone. I 
will try to remember to mention it but please take pro-active action to 
check/mention where the code is coming from.

Cheers,

-- 
Julien Grall

