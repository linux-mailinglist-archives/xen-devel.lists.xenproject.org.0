Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B774610588
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 00:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431248.684057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooBBN-0005Y1-E5; Thu, 27 Oct 2022 22:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431248.684057; Thu, 27 Oct 2022 22:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooBBN-0005WU-9h; Thu, 27 Oct 2022 22:17:01 +0000
Received: by outflank-mailman (input) for mailman id 431248;
 Thu, 27 Oct 2022 22:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yXv3=24=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1ooBBL-0005Vd-J6
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 22:16:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 11a7c3d6-5645-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 00:16:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8725E23A;
 Thu, 27 Oct 2022 15:17:02 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAE633F71A;
 Thu, 27 Oct 2022 15:16:54 -0700 (PDT)
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
X-Inumbo-ID: 11a7c3d6-5645-11ed-8fd0-01056ac49cbb
Date: Thu, 27 Oct 2022 23:15:10 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <stefanos@xilinx.com>, <julien@xen.org>, <Volodymyr_Babchuk@epam.com>,
 <bertrand.marquis@arm.com>, <Henry.Wang@arm.com>
Subject: Re: [XEN v5] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
Message-ID: <20221027231510.064975be@slackpad.lan>
In-Reply-To: <20221027185555.46125-1-ayankuma@amd.com>
References: <20221027185555.46125-1-ayankuma@amd.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Oct 2022 19:55:55 +0100
Ayan Kumar Halder <ayankuma@amd.com> wrote:

> If a guest is running in 32 bit mode and it tries to access
> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
> This will be stored in a 64bit cpu register.
> So now we have the top 32 bits of GICR_PENDBASER (a 64 bit MMIO register) stored
> in the lower 32 bits of the 64bit cpu register.
> 
> This 64bit cpu register is then modified bitwise with a mask (ie
> GICR_PENDBASER_PTZ, it clears the 62nd bit). But the PTZ (which is bit 30 in the
> 64 bit cpu register) is not cleared as expected by the specification.
> 
> The correct thing to do here is to store the value of
> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
> vreg_reg64_extract() which will extract 32 bits from the given offset.
> 
> Also, we have removed spin_lock_irqsave()/spin_unlock_irqrestore() to protect
> v->arch.vgic.rdist_pendbase in __vgic_v3_rdistr_rd_mmio_read(). The reason
> being v->arch.vgic.rdist_pendbase is now being read in an atomic manner.
> 
> Similarly in __vgic_v3_rdistr_rd_mmio_write(), we have used read_atomic(),
> write_atomic() to read/write v->arch.vgic.rdist_pendbase.
> 
> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> 
> Changes from:-
> 
> v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
> GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with an
> appropriate commit message.
> 
> v2 - 1. Removed spin_lock_irqsave(). Used read_atomic() to read
> v->arch.vgic.rdist_pendbase in an atomic context.
> 2. Rectified the commit message to state that the cpu register is 64 bit.
> (because currently, GICv3 is supported on Arm64 only). Reworded to make it
> clear.
> 
> v3 - 1. Added read_atomic()/write_atomic() for access to v->arch.vgic.rdist_pendbase
> in __vgic_v3_rdistr_rd_mmio_write().
> 2. Removed spin_lock_irqsave()/spin_unlock_irqrestore() for access to
> v->arch.vgic.rdist_pendbase in __vgic_v3_rdistr_rd_mmio_write().
> 
> v4 - 1. Retained the spin_lock_irqsave()/spin_unlock_irqrestore() for access to
> v->arch.vgic.rdist_pendbase in __vgic_v3_rdistr_rd_mmio_write(). This is because
> there could be a potential race while read-modify-write is performed on
> v->arch.vgic.rdist_pendbase, with another caller performing the same operation.
> 
>  xen/arch/arm/vgic-v3.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 0c23f6df9d..d0e265634e 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -249,16 +249,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>  
>      case VREG64(GICR_PENDBASER):
>      {
> -        unsigned long flags;
> +        uint64_t val;
>  
>          if ( !v->domain->arch.vgic.has_its )
>              goto read_as_zero_64;
>          if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>  
> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
> -        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
> +        val = read_atomic(&v->arch.vgic.rdist_pendbase);
> +        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
> +        *r = vreg_reg64_extract(val, info);
>          return 1;
>      }
>  
> @@ -577,10 +576,10 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
>          /* Writing PENDBASER with LPIs enabled is UNPREDICTABLE. */
>          if ( !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
>          {
> -            reg = v->arch.vgic.rdist_pendbase;
> +            reg = read_atomic(&v->arch.vgic.rdist_pendbase);
>              vreg_reg64_update(&reg, r, info);
>              reg = sanitize_pendbaser(reg);
> -            v->arch.vgic.rdist_pendbase = reg;
> +            write_atomic(&v->arch.vgic.rdist_pendbase, reg);
>          }
>  
>          spin_unlock_irqrestore(&v->arch.vgic.lock, false);


