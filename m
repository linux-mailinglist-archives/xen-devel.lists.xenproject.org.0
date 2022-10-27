Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D49260FCEC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 18:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431112.683684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo5bK-0003sR-Nx; Thu, 27 Oct 2022 16:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431112.683684; Thu, 27 Oct 2022 16:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo5bK-0003oy-Jw; Thu, 27 Oct 2022 16:19:26 +0000
Received: by outflank-mailman (input) for mailman id 431112;
 Thu, 27 Oct 2022 16:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yXv3=24=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1oo5bI-0003os-Jj
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 16:19:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1dffe430-5613-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 18:19:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67ACF23A;
 Thu, 27 Oct 2022 09:19:28 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BEA43F7B4;
 Thu, 27 Oct 2022 09:19:20 -0700 (PDT)
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
X-Inumbo-ID: 1dffe430-5613-11ed-8fd0-01056ac49cbb
Date: Thu, 27 Oct 2022 17:19:18 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 stefanos@xilinx.com, julien@xen.org, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Henry.Wang@arm.com
Subject: Re: [XEN v4] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
Message-ID: <20221027171918.30b2b61b@donnerap.cambridge.arm.com>
In-Reply-To: <da52b703-5de7-1673-f6a1-d6541f59f5cd@amd.com>
References: <20221026183004.7293-1-ayankuma@amd.com>
	<20221027104231.77c5cd28@donnerap.cambridge.arm.com>
	<da52b703-5de7-1673-f6a1-d6541f59f5cd@amd.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Oct 2022 16:40:01 +0100
Ayan Kumar Halder <ayankuma@amd.com> wrote:

Hi Ayan,

> On 27/10/2022 10:44, Andre Przywara wrote:
> > On Wed, 26 Oct 2022 19:30:04 +0100
> > Ayan Kumar Halder <ayankuma@amd.com> wrote:
> >
> > Hi,  
> 
> Hi Andre,
> 
> I need a clarification.
> 
> >  
> >> If a guest is running in 32 bit mode and it tries to access
> >> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
> >> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
> >> This will be stored in a 64bit cpu register.
> >> So now we have the top 32 bits of GICR_PENDBASER (a 64 bit MMIO register) stored
> >> in the lower 32 bits of the 64bit cpu register.
> >>
> >> This 64bit cpu register is then modified bitwise with a mask (ie
> >> GICR_PENDBASER_PTZ, it clears the 62nd bit). But the PTZ (which is bit 30 in the
> >> 64 bit cpu register) is not cleared as expected by the specification.
> >>
> >> The correct thing to do here is to store the value of
> >> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
> >> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
> >> vreg_reg64_extract() which will extract 32 bits from the given offset.
> >>
> >> Also, we have removed spin_lock_irqsave()/spin_unlock_irqrestore() to protect
> >> v->arch.vgic.rdist_pendbase. The reason being v->arch.vgic.rdist_pendbase is
> >> now being read/written in an atomic manner (using read_atomic()/write_atomic()).
> >>
> >> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> >> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> >> ---
> >>
> >> Changes from:-
> >>
> >> v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
> >> GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with an
> >> appropriate commit message.
> >>
> >> v2 - 1. Removed spin_lock_irqsave(). Used read_atomic() to read
> >> v->arch.vgic.rdist_pendbase in an atomic context.
> >> 2. Rectified the commit message to state that the cpu register is 64 bit.
> >> (because currently, GICv3 is supported on Arm64 only). Reworded to make it
> >> clear.
> >>
> >> v3 - 1. Added read_atomic()/write_atomic() for access to v->arch.vgic.rdist_pendbase
> >> in __vgic_v3_rdistr_rd_mmio_write().
> >>
> >>   xen/arch/arm/vgic-v3.c | 19 ++++++-------------
> >>   1 file changed, 6 insertions(+), 13 deletions(-)
> >>
> >> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> >> index 0c23f6df9d..1adbdc0e54 100644
> >> --- a/xen/arch/arm/vgic-v3.c
> >> +++ b/xen/arch/arm/vgic-v3.c
> >> @@ -249,16 +249,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
> >>   
> >>       case VREG64(GICR_PENDBASER):
> >>       {
> >> -        unsigned long flags;
> >> +        uint64_t val;
> >>   
> >>           if ( !v->domain->arch.vgic.has_its )
> >>               goto read_as_zero_64;
> >>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> >>   
> >> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
> >> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
> >> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
> >> -        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
> >> +        val = read_atomic(&v->arch.vgic.rdist_pendbase);
> >> +        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
> >> +        *r = vreg_reg64_extract(val, info);  
> > That part looks fine now.
> >  
> >>           return 1;
> >>       }
> >>   
> >> @@ -566,25 +565,19 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
> >>   
> >>       case VREG64(GICR_PENDBASER):
> >>       {
> >> -        unsigned long flags;
> >> -
> >>           if ( !v->domain->arch.vgic.has_its )
> >>               goto write_ignore_64;
> >>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> >>   
> >> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
> >> -  
> > I don't think you can drop the lock here easily. If it would be just for
> > the LPIs enabled check, that'd be fine, because you can never turn LPIs off
> > again (but that would deserve an explicit comment then).
> >
> > But down below you do a read-modify-write operation of rdist_pendbase, and
> > need to make sure no one else is attempting that at the same time.
> >
> > Cheers,
> > Andre
> >  
> >>           /* Writing PENDBASER with LPIs enabled is UNPREDICTABLE. */
> >>           if ( !(v->arch.vgic.flags & VGIC_V3_LPIS_ENABLED) )
> >>           {
> >> -            reg = v->arch.vgic.rdist_pendbase;
> >> +            reg = read_atomic(&v->arch.vgic.rdist_pendbase);
> >>               vreg_reg64_update(&reg, r, info);
> >>               reg = sanitize_pendbaser(reg);
> >> -            v->arch.vgic.rdist_pendbase = reg;
> >> +            write_atomic(&v->arch.vgic.rdist_pendbase, reg);
> >>           }
> >>   
> >> -        spin_unlock_irqrestore(&v->arch.vgic.lock, false);  
> 
> Shouldn't this be "spin_unlock_irqrestore(&v->arch.vgic.lock, flags)" ?

Ouch, indeed, looks like a typo!
There is a some type check in spin_lock_irqsave() and local_irq_restore(),
but not in spin_unlock_irqrestore(), so we missed that.

Cheers,
Andre

> 
> - Ayan
> 
> >> -
> >>           return 1;
> >>       }
> >>     


