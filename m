Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A972B3F19F1
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168759.308116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhjH-0007E3-AM; Thu, 19 Aug 2021 13:05:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168759.308116; Thu, 19 Aug 2021 13:05:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhjH-0007C0-7I; Thu, 19 Aug 2021 13:05:07 +0000
Received: by outflank-mailman (input) for mailman id 168759;
 Thu, 19 Aug 2021 13:05:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGhjE-0007Bu-R9
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:05:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGhjD-0007y2-S8; Thu, 19 Aug 2021 13:05:03 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGhjD-0006Wk-ML; Thu, 19 Aug 2021 13:05:03 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=T+y76dBxf7zSkrLvn7F3PzcOwV9xoryzjShDkuTFOdI=; b=bjZEsGoy0uU5TUm2nhZ71ymaQF
	fGfPpW57YZ+u12rTLUYO/GBOi6AXgpPyuvSTc6tGJFAQ/VmX243QSkCKFJqCw3v17WGCm3sXaNwGf
	ASv5ruqpPukgX2Uynp7tBEO5DaYCl7uO/kLADNMjvMg30C9ad/O81BHc7UWCG+dsymPc=;
Subject: Re: [XEN RFC PATCH 02/40] xen/arm: Print a 64-bit number in hex from
 early uart
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-3-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a795ae7c-d280-6c51-2606-4305463697cd@xen.org>
Date: Thu, 19 Aug 2021 14:05:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-3-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> Current putn function that is using for early print
> only can print low 32-bit of AArch64 register. This
> will lose some important messages while debugging
> with early console. For example:
> (XEN) Bringing up CPU5
> - CPU 0000000100000100 booting -
> Will be truncated to
> (XEN) Bringing up CPU5
> - CPU 00000100 booting -
> 
> In this patch, we increased the print loops and shift
> bits to make putn print 64-bit number.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/arch/arm/arm64/head.S | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index aa1f88c764..b32639d7d6 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -862,17 +862,18 @@ puts:
>           ret
>   ENDPROC(puts)
>   
> -/* Print a 32-bit number in hex.  Specific to the PL011 UART.
> +/* Print a 64-bit number in hex.  Specific to the PL011 UART.

As you modify the line, can you take the opportunity to write:

/*
  * Print a 64-bit...

And also drop the second sentence as it the code has not been PL011 
specific for quite a while now.

>    * x0: Number to print.
>    * x23: Early UART base address
>    * Clobbers x0-x3 */
> +#define PRINT_MASK 0xf000000000000000
>   putn:
>           adr   x1, hex
> -        mov   x3, #8
> +        mov   x3, #16
>   1:
>           early_uart_ready x23, 2
> -        and   x2, x0, #0xf0000000    /* Mask off the top nybble */
> -        lsr   x2, x2, #28
> +        and   x2, x0, #PRINT_MASK    /* Mask off the top nybble */
> +        lsr   x2, x2, #60
>           ldrb  w2, [x1, x2]           /* Convert to a char */
>           early_uart_transmit x23, w2
>           lsl   x0, x0, #4             /* Roll it through one nybble at a time */
> 

Cheers,

-- 
Julien Grall

