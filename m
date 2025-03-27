Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C27FA74167
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 00:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929991.1332728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwLy-00004w-Uu; Thu, 27 Mar 2025 23:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929991.1332728; Thu, 27 Mar 2025 23:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwLy-0008V9-RH; Thu, 27 Mar 2025 23:09:38 +0000
Received: by outflank-mailman (input) for mailman id 929991;
 Thu, 27 Mar 2025 23:09:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1txwLx-0008V3-KJ
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 23:09:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a32b6a4-0b60-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 00:09:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 10228446FE;
 Thu, 27 Mar 2025 23:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6369AC4CEDD;
 Thu, 27 Mar 2025 23:09:29 +0000 (UTC)
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
X-Inumbo-ID: 8a32b6a4-0b60-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743116970;
	bh=5FDj7SSFmxP5A6oYm6IjAdDpCKTDfi7cuVGyeDvqGbQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KfAXQEblNnm0ihlrTJ5RYcM6LT3CgPnVj2kZ8h/JLkGkVln5aYMGa95hXWzrPK1D6
	 c5Gu2fq257YoK0WmFCxaPTcrj9xp9ZjUYskg6SVOP3rLBCEe1mi9bu2JBFtAxOVLOi
	 SByyEO6+jgptyvABSUFPOLNRlqyP/ajcYpjV7jDD3IMlFBEEoErxADGdODI0HXB4bN
	 ysDX7lZjGc6OuYn+MBcMJJ8DOTM93Pv4symVHCwxgqQzFOhrL3GdONEO2CvWxrOQ2H
	 xZMZQzTsO3e1P/rxwXPwOEYMXuPdVDg+aezawy2/NddUBvdKfIX8wLstEiT5oEosuy
	 lkiZgkdZSd2LA==
Date: Thu, 27 Mar 2025 16:09:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3] ARM/vgic: Use for_each_set_bit() in vgic-mmio*
In-Reply-To: <20250327134710.399101-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2503271609160.563920@ubuntu-linux-20-04-desktop>
References: <20250327134710.399101-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Mar 2025, Andrew Cooper wrote:
> These are all loops over a scalar value, and don't need to call general bitop
> helpers behind the scenes.
> 
> Clamp data to the width of the access in dispatch_mmio_write(), rather than
> doing so in every handler.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> 
> v3:
>  * Split out of series.
>  * Move clamping to common location.
> 
> Bloat-o-meter analysis.  The negative change in each handler also includes the
> removal of calls to _find_{first,next}_bit_le(), so the improvement is better
> than the summary suggests.
> 
> $ ../scripts/bloat-o-meter xen-syms-arm32-{before,after}
> add/remove: 0/0 grow/shrink: 1/6 up/down: 24/-156 (-132)
> Function                                     old     new   delta
> dispatch_mmio_write                          212     236     +24
> vgic_mmio_write_spending                     392     368     -24
> vgic_mmio_write_senable                      324     300     -24
> vgic_mmio_write_cenable                      320     296     -24
> vgic_mmio_write_sactive                      204     176     -28
> vgic_mmio_write_cpending                     464     436     -28
> vgic_mmio_write_cactive                      204     176     -28
> 
> $ ../scripts/bloat-o-meter xen-syms-arm64-{before,after}
> add/remove: 0/0 grow/shrink: 1/6 up/down: 32/-196 (-164)
> Function                                     old     new   delta
> dispatch_mmio_write                          164     196     +32
> vgic_mmio_write_spending                     320     312      -8
> vgic_mmio_write_cpending                     368     356     -12
> vgic_mmio_write_sactive                      192     156     -36
> vgic_mmio_write_cactive                      192     156     -36
> vgic_mmio_write_cenable                      316     268     -48
> vgic_mmio_write_senable                      320     264     -56
> ---
>  xen/arch/arm/vgic/vgic-mmio.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic/vgic-mmio.c b/xen/arch/arm/vgic/vgic-mmio.c
> index 4ad350c21c8b..b4ba34cfc368 100644
> --- a/xen/arch/arm/vgic/vgic-mmio.c
> +++ b/xen/arch/arm/vgic/vgic-mmio.c
> @@ -70,9 +70,8 @@ void vgic_mmio_write_senable(struct vcpu *vcpu,
>                               unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
>  
> -    bitmap_for_each ( i, &val, len * 8 )
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>          unsigned long flags;
> @@ -115,9 +114,8 @@ void vgic_mmio_write_cenable(struct vcpu *vcpu,
>                               unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
>  
> -    bitmap_for_each ( i, &val, len * 8 )
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq;
>          unsigned long flags;
> @@ -183,11 +181,10 @@ void vgic_mmio_write_spending(struct vcpu *vcpu,
>                                unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
>      unsigned long flags;
>      irq_desc_t *desc;
>  
> -    bitmap_for_each ( i, &val, len * 8 )
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>  
> @@ -231,11 +228,10 @@ void vgic_mmio_write_cpending(struct vcpu *vcpu,
>                                unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
>      unsigned long flags;
>      irq_desc_t *desc;
>  
> -    bitmap_for_each ( i, &val, len * 8 )
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>  
> @@ -327,9 +323,8 @@ void vgic_mmio_write_cactive(struct vcpu *vcpu,
>                               unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
>  
> -    bitmap_for_each ( i, &val, len * 8 )
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>  
> @@ -357,9 +352,8 @@ void vgic_mmio_write_sactive(struct vcpu *vcpu,
>                               unsigned long val)
>  {
>      uint32_t intid = VGIC_ADDR_TO_INTID(addr, 1);
> -    unsigned int i;
>  
> -    bitmap_for_each ( i, &val, len * 8 )
> +    for_each_set_bit ( i, val )
>      {
>          struct vgic_irq *irq = vgic_get_irq(vcpu->domain, vcpu, intid + i);
>  
> @@ -591,6 +585,10 @@ static int dispatch_mmio_write(struct vcpu *vcpu, mmio_info_t *info,
>      if ( !region )
>          return 0;
>  
> +    /* Clamp data to the width of the access. */
> +    if ( len < sizeof(data) )
> +        data &= (1UL << (len * 8)) - 1;
> +
>      switch (iodev->iodev_type)
>      {
>      case IODEV_DIST:
> -- 
> 2.39.5
> 

