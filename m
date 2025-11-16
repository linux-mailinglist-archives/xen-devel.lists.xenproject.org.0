Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F2C61269
	for <lists+xen-devel@lfdr.de>; Sun, 16 Nov 2025 11:25:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163196.1490386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKZvl-0008Nz-Su; Sun, 16 Nov 2025 10:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163196.1490386; Sun, 16 Nov 2025 10:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKZvl-0008Ly-NK; Sun, 16 Nov 2025 10:24:25 +0000
Received: by outflank-mailman (input) for mailman id 1163196;
 Sun, 16 Nov 2025 10:24:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vKZvk-0008Ls-Q8
 for xen-devel@lists.xenproject.org; Sun, 16 Nov 2025 10:24:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKZvk-00A5Ac-0A;
 Sun, 16 Nov 2025 10:24:24 +0000
Received: from [2a02:8012:3a1:0:850b:33c3:9f1f:5f9a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vKZvj-000Sdk-2I;
 Sun, 16 Nov 2025 10:24:23 +0000
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
	bh=fQgt4eOz0U7ldUZdofvIRxOQcrsJUsOOr3ar1XCThHA=; b=Q9o3hgutmvboN0rcuqNgz9c4dh
	A/GnqHtmdBcKxpMMyIYWXjKFJwn73uDCQjo7gQw+FvAqmFdiYJDxjDSCpDSIgc1M7o7cQ70PfNRMi
	pXmICw41PRCr/hH2O79Y0i4Dj6EfOUKE1p2Ys/7jigHNvu2qmrKdd2YLssa42UcWA5xM=;
Message-ID: <e6fae4b3-85fd-4f9b-8bc9-c243eb02c3ce@xen.org>
Date: Sun, 16 Nov 2025 10:24:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] arm/irq: Keep track of irq affinities
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1762939773.git.mykyta_poturai@epam.com>
 <a467474ba2476ff85c52483f47ac1ba6a67a7a22.1762939773.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a467474ba2476ff85c52483f47ac1ba6a67a7a22.1762939773.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 12/11/2025 10:51, Mykyta Poturai wrote:
> Currently on Arm the desc->affinity mask of an irq is never updated,
> which makes it hard to know the actual affinity of an interrupt.
> 
> Fix this by updating the field in irq_set_affinity.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> v3->v4:
> * patch introduced
> ---
>   xen/arch/arm/irq.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 73e58a5108..28b40331f7 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -219,7 +219,10 @@ static inline struct domain *irq_get_domain(struct irq_desc *desc)
>   void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
>   {
>       if ( desc != NULL )
> +    {
> +        cpumask_copy(desc->affinity, mask);

irq_set_affinity() doesn't always seems to be called with ``desc->lock`` 
taken (see vgic_migrate_irq(), arch_move_irqs()). So I am not sure this 
is safe. You probably need to update the callers as well to always take 
the lock. irq_set_affinity() probably want to gain an 
ASSERT(spin_is_locked()) with some documentation on top of the function.

>           desc->handler->set_affinity(desc, mask);
> +    }

NIT: As there are multiple lines in the ``if``, I would consider 
reworking the logic so we return early when desc is NULL.

>   }
>   
>   int request_irq(unsigned int irq, unsigned int irqflags,

Cheers,

-- 
Julien Grall


