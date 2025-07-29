Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51206B14EDB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 15:56:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062741.1428467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkoY-0002Xe-70; Tue, 29 Jul 2025 13:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062741.1428467; Tue, 29 Jul 2025 13:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugkoY-0002WD-4Q; Tue, 29 Jul 2025 13:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1062741;
 Tue, 29 Jul 2025 13:56:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ugkoW-0002W7-RV
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 13:56:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkoW-007UaU-13;
 Tue, 29 Jul 2025 13:56:20 +0000
Received: from [15.248.3.91] (helo=[10.24.66.55])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ugkoW-00FquD-0N;
 Tue, 29 Jul 2025 13:56:20 +0000
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
	bh=N+cUlrkcSSFHYsgGGRlZHoYdmIPvwC55keg1KG76BMk=; b=RXMfgOxoHDO0POPf1rgWOoCfb/
	vvTI/Ip91u9LTkAC1Kk5IpVK0OBPIQcS77+929dVP2FVtw6Q/btiAy83dajDK/PBuYPV5/mq3oMWA
	JbirJ0roMGa/DRAFKkVQqkQ7FpWH46tPKmtPzbO2ndiO/xQ+kPHvBlplY+eG3yCn1BUE=;
Message-ID: <052831de-84da-431f-b910-4426ed87fb63@xen.org>
Date: Tue, 29 Jul 2025 14:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] xen/arm/irq: allow assignment/releasing of eSPI
 interrupts
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1753367178.git.leonid_komarianskyi@epam.com>
 <126f762aba8b0f6a4eb322c27593f574f877738c.1753367178.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <126f762aba8b0f6a4eb322c27593f574f877738c.1753367178.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/07/2025 15:57, Leonid Komarianskyi wrote:
> The current checks don't allow us to assign or release interrupts
> with INTID greater than 1024. This patch adds an additional condition
> to check whether the IRQ number is in the eSPI range and allows it to
> be assigned to Xen and domains if it is.
 > > Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> ---
>   xen/arch/arm/irq.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 3f68257fde..8c47eeb7c3 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -444,8 +444,8 @@ err:
>   
>   bool is_assignable_irq(unsigned int irq)
>   {
> -    /* For now, we can only route SPIs to the guest */
> -    return (irq >= NR_LOCAL_IRQS) && (irq < gic_number_lines());
> +    /* For now, we can only route SPIs and eSPIs to the guest */
> +    return (((irq >= NR_LOCAL_IRQS) && (irq < gic_number_lines())) || is_espi(irq));
>   }

is_assignable_irq() is called by route_irq_to_guest() which first check 
'virq >= vgic_num_irqs()'. AFAICT, if we apply only up to this patch, 
'virq' would still require to < 1024. So ...


>   be
>   /*
> @@ -589,8 +589,8 @@ int release_guest_irq(struct domain *d, unsigned int virq)
>       unsigned long flags;
>       int ret;
>   
> -    /* Only SPIs are supported */
> -    if ( virq < NR_LOCAL_IRQS || virq >= vgic_num_irqs(d) )
> +    /* Only SPIs and eSPIs are supported */
> +    if ( (virq < NR_LOCAL_IRQS || virq >= vgic_num_irqs(d)) && !is_espi(virq) )

... I don't quite understand why this (yet?) need a change. Can you clarify?

>           return -EINVAL;
>   
>       desc = vgic_get_hw_irq_desc(d, NULL, virq);

Cheers,

-- 
Julien Grall


