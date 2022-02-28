Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C2C4C6D63
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 14:04:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280519.478483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfhV-0001is-US; Mon, 28 Feb 2022 13:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280519.478483; Mon, 28 Feb 2022 13:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOfhV-0001g4-QI; Mon, 28 Feb 2022 13:04:29 +0000
Received: by outflank-mailman (input) for mailman id 280519;
 Mon, 28 Feb 2022 13:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=py4b=TL=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nOfhU-0001fy-BX
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 13:04:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f505851d-9896-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 14:04:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 086801042;
 Mon, 28 Feb 2022 05:04:26 -0800 (PST)
Received: from [10.57.19.230] (unknown [10.57.19.230])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DB893F73D;
 Mon, 28 Feb 2022 05:04:24 -0800 (PST)
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
X-Inumbo-ID: f505851d-9896-11ec-8eba-a37418f5ba1a
Subject: Re: [PATCH] xen/arm32: head: Update the documentation for register
 r12
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220228101150.63816-1-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <e9397250-3d68-d6e6-d95f-93d239fc2ef5@arm.com>
Date: Mon, 28 Feb 2022 14:04:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220228101150.63816-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 28.02.2022 11:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 54c4ae18d158 ("xen/arm32: head: Rework and document
> launch()"), the boot code is not using the register r12.
> 
> So update the documentation to show r12 has no specific purpose.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/arm32/head.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 13cfc837d39c..78274a1c034f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -79,7 +79,7 @@
>   *   r9  - paddr(start)
>   *   r10 - phys offset
>   *   r11 - UART address
> - *   r12 - is_secondary_cpu
> + *   r12 -
>   *   r13 - SP
>   *   r14 - LR
>   *   r15 - PC
> 

FWICS, there are still 2 instructions in this file assigning #0 or #1 to r12 and each of them
has a comment "/* r12 := is_secondary_cpu */". 

So I have 2 questions:
1. Do we even need these instructions? (I do not think so)
2. If we need these instructions, do we need these comments?

Cheers,
Michal

