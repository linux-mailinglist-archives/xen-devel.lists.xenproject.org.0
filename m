Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D0A8CAE53
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 14:31:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726883.1131276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9OdE-0008G5-Am; Tue, 21 May 2024 12:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726883.1131276; Tue, 21 May 2024 12:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9OdE-0008DT-8H; Tue, 21 May 2024 12:30:16 +0000
Received: by outflank-mailman (input) for mailman id 726883;
 Tue, 21 May 2024 12:30:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s9OdC-0008DN-IN
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 12:30:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9OdC-0003j9-7I; Tue, 21 May 2024 12:30:14 +0000
Received: from [15.248.2.238] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s9OdB-0004VN-WC; Tue, 21 May 2024 12:30:14 +0000
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
	bh=W3U6witmGjEe3b9StaN0T26uzhn81FhZugRqwJNnlyU=; b=gKV8aTNr/56t0OrLSIixd0s408
	HxH/nnfhYAa66Fk8tnad5q4pzLLmD4gkbZdMY3F7+FKbN4xLu6Q27gAXkgtvClW+d3eEjQoGR+cCj
	dNi+0PHIezwIHTowscuJy1XEvY/0b7TebkuaF3+DScU2H9pV2/brABitGFXpre8I3ouo=;
Message-ID: <3f6fa7e7-c02c-4fa5-b4aa-5e4c2efed65f@xen.org>
Date: Tue, 21 May 2024 13:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] xen/arm/gic: Allow routing/removing interrupt to
 running VMs
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
 <20240521043557.1580753-6-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240521043557.1580753-6-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/05/2024 05:35, Henry Wang wrote:
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
> 
> Currently, routing/removing physical interrupts are only allowed at
> the domain creation/destroy time. For use cases such as dynamic device
> tree overlay adding/removing, the routing/removing of physical IRQ to
> running domains should be allowed.
> 
> Removing the above-mentioned domain creation/dying check. Since this
> will introduce interrupt state unsync issues for cases when the
> interrupt is active or pending in the guest, therefore for these cases
> we simply reject the operation. Do it for both new and old vGIC
> implementations.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v3:
> - Update in-code comments.
> - Correct the if conditions.
> - Add taking/releasing the vgic lock of the vcpu.
> v2:
> - Reject the case where the IRQ is active or pending in guest.
> ---
>   xen/arch/arm/gic-vgic.c  | 15 ++++++++++++---
>   xen/arch/arm/gic.c       | 15 ---------------
>   xen/arch/arm/vgic/vgic.c | 10 +++++++---
>   3 files changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index 56490dbc43..956c11ba13 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -439,24 +439,33 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v, unsigned int virq,
>   
>       /* We are taking to rank lock to prevent parallel connections. */
>       vgic_lock_rank(v_target, rank, flags);
> +    spin_lock(&v_target->arch.vgic.lock);

I know this is what Stefano suggested, but v_target would point to the 
current affinity whereas the interrupt may be pending/active on the 
"previous" vCPU. So it is a little unclear whether v_target is the 
correct lock. Do you have more pointer to show this is correct?

Also, while looking at the locking, I noticed that we are not doing 
anything with GIC_IRQ_GUEST_MIGRATING. In gic_update_one_lr(), we seem 
to assume that if the flag is set, then p->desc cannot be NULL.

Can we reach vgic_connect_hw_irq() with the flag set?

What about the other flags? Is this going to be a concern if we don't 
reset them?

Cheers,

-- 
Julien Grall

