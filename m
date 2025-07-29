Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4261DB14EEF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062749.1428477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkrO-00035L-KZ; Tue, 29 Jul 2025 13:59:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062749.1428477; Tue, 29 Jul 2025 13:59:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkrO-00032u-I4; Tue, 29 Jul 2025 13:59:18 +0000
Received: by outflank-mailman (input) for mailman id 1062749;
 Tue, 29 Jul 2025 13:59:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ugkrN-00032o-Na
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:59:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkrN-007Ucj-1R;
 Tue, 29 Jul 2025 13:59:17 +0000
Received: from [15.248.3.91] (helo=[10.24.66.55])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkrN-00Fqxj-0p;
 Tue, 29 Jul 2025 13:59:17 +0000
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
	bh=C8Xd9HZLDDxV7aJX1ZcCw2pDsW3xIhjobdtp7S99V3w=; b=T/FGHOAkz2iNvrfW0H6R6H2lUd
	LCBVEOT9MaIp76SDFz1AkaaIAqUcWlUNQQiWVuNnQFSlRQ+f2ZIJqoYsVRnEEgxy4LS3r0yu9c7Uk
	YmP/w695WFfCb17bmzjrY9BxWAr6J/5kvtag5Yo+boSSzGcl48DGOr0jKNL63jSKdD+I=;
Message-ID: <8381b52d-855f-403d-a1f3-d55427bf7d7f@xen.org>
Date: Tue, 29 Jul 2025 14:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] xen/arm/irq: allow eSPI processing in the do_IRQ
 function
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
 <6f7e5b23852d4791c81db75ebaaccc2dc7151c22.1753367178.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6f7e5b23852d4791c81db75ebaaccc2dc7151c22.1753367178.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/07/2025 15:57, Leonid Komarianskyi wrote:
> The do_IRQ() function is the main handler for processing IRQs.
> Currently, due to restrictive checks, it does not process interrupt
> numbers greater than 1024. This patch updates the condition to allow
> the handling of interrupts from the eSPI range.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> ---
>   xen/arch/arm/gic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index d5f2addf9f..b4a185fcc5 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -342,7 +342,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
>           /* Reading IRQ will ACK it */
>           irq = gic_hw_ops->read_irq();
>   
> -        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) )
> +        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(irq) )

Looking at the series, we seem to have a common pattern which is "check 
if an SPI or an eSPI". AFAIU, pretty much everywhere we use an SPI, we 
want to be able to use an eSPI.

So rather than open-coding everywhere, can we create a new helper to 
check whether we have an (e)SPI? This would make easier to read the code.

Cheers,

-- 
Julien Grall


