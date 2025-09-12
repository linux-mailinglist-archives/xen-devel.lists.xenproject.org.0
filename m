Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0ABB558C8
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 00:02:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122664.1466212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxBpx-0002jT-6H; Fri, 12 Sep 2025 22:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122664.1466212; Fri, 12 Sep 2025 22:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxBpx-0002ga-2D; Fri, 12 Sep 2025 22:01:45 +0000
Received: by outflank-mailman (input) for mailman id 1122664;
 Fri, 12 Sep 2025 22:01:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxBpw-0002gU-2x
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 22:01:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxBpv-006ejR-2T;
 Fri, 12 Sep 2025 22:01:43 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxBpv-006Cfh-2h;
 Fri, 12 Sep 2025 22:01:43 +0000
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
	bh=wpd03YPoBlgAjURP54w1VIsouT66uZ/1Dd48RQIn0l0=; b=k3m0P1cGtT4kXo/DzlXaUq4cMc
	AiUqj0l3dBS+SgfMD0S02ZOGzaLIb0trFmoOLlclLaE61Edpay+tGPO5kr+937tFbzfzvRrHWhAvx
	JUejEz70gamVWSex2D9ysoz7WRZlgV+PVN4u386cOA3A+uMrMovZekHxQaOONauJzj0Y=;
Message-ID: <0d0f4689-97e2-408f-91e4-dd59f47bdb95@xen.org>
Date: Fri, 12 Sep 2025 23:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: irq: Use appropriate priority for SGIs in
 setup_irq()
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f7475c0083bf4995f2ec4afa3aaf44b9676fd1ab.1756867760.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 03/09/2025 03:55, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Use GIC_PRI_IPI priority for SGI interrupts instead of the generic
> GIC_PRI_IRQ priority in setup_irq().
> 
> This change ensures that SGIs get the correct priority level when
> being set up for Xen's use, maintaining proper interrupt precedence
> in the system.
> 
> The priority assignment now follows ARM GIC best practices:
> - SGIs (0-15): GIC_PRI_IPI (higher priority)
> - PPIs/SPIs (16+): GIC_PRI_IRQ (standard priority)

Please provide a reference to the spec. But I don't follow why we should 
follow exactly what the spec suggest. This is up to us to decide what we 
want. Otherwise what's the point of having more than two priorities?

> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>   xen/arch/arm/irq.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 02ca82c089..17c7ac92b5 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -397,7 +397,13 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
AFAIK, we are not using setup_irq() to handle SGIs because they are all 
static and always enabled. Are you planning to handle dynamic SGIs? If 
yes, then can you provide more details?

>       /* First time the IRQ is setup */
>       if ( disabled )
>       {
> -        gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
> +        unsigned int prio = GIC_PRI_IRQ;
> +
> +        /* Use appropriate priority based on interrupt type */
> +        if (desc->irq < NR_GIC_SGI)
> +            prio = GIC_PRI_IPI;

I am a bit split with this change. I feel static SGI (e.g. EVENT_CHECK, 
CALL_FUNCTION) should have higher priority to the dynamic SGIs because 
they are critical for Xen.

Before making my mind, I would like to understand a bit more the use case.

Cheers,

-- 
Julien Grall


