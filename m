Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8D60BC46
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 23:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429405.680367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on54a-0000uU-Dx; Mon, 24 Oct 2022 21:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429405.680367; Mon, 24 Oct 2022 21:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on54a-0000sJ-Aw; Mon, 24 Oct 2022 21:33:28 +0000
Received: by outflank-mailman (input) for mailman id 429405;
 Mon, 24 Oct 2022 21:33:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvXY=2Z=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1on54Y-0000sD-Ms
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 21:33:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7cebd552-53e3-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 23:33:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76D69D6E;
 Mon, 24 Oct 2022 14:33:29 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 201963F7B4;
 Mon, 24 Oct 2022 14:33:21 -0700 (PDT)
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
X-Inumbo-ID: 7cebd552-53e3-11ed-91b5-6bf2151ebd3b
Date: Mon, 24 Oct 2022 22:31:56 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <stefanos@xilinx.com>, <julien@xen.org>, <Volodymyr_Babchuk@epam.com>,
 <bertrand.marquis@arm.com>
Subject: Re: [XEN v2] GICv3: Emulate GICR_PENDBASER correctly for 32 bit
 guests
Message-ID: <20221024223156.0ccb1074@slackpad.lan>
In-Reply-To: <20221024193002.57888-1-ayankuma@amd.com>
References: <20221024193002.57888-1-ayankuma@amd.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Oct 2022 20:30:02 +0100
Ayan Kumar Halder <ayankuma@amd.com> wrote:

Hi,

> If a guest is running in 32 bit mode and it tries to access
> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
> This will be stored in a 32bit register.
> 
> The 32bit register is then modified bitwise with a mask (ie GICR_PENDBASER_PTZ,
> it clears the 62nd bit) which is greater than 32 bits. This will give an
> incorrect result.
> 
> The correct thing to do here is to store the value of
> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
> vreg_reg64_extract() which will extract 32 bits from the given offset.
> 
> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>

Indeed, the patch looks good to me. Also checked the other users of
vreg_reg64_extract(), they seem to be all correct, by first building
the value, then running the extract function on the final result.

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
>  xen/arch/arm/vgic-v3.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 0c23f6df9d..7930ab6330 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -250,14 +250,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>      case VREG64(GICR_PENDBASER):
>      {
>          unsigned long flags;
> +        uint64_t val;
>  
>          if ( !v->domain->arch.vgic.has_its )
>              goto read_as_zero_64;
>          if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>  
>          spin_lock_irqsave(&v->arch.vgic.lock, flags);
> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
> +        val = v->arch.vgic.rdist_pendbase;
> +        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
> +        *r = vreg_reg64_extract(val, info);
>          spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>          return 1;
>      }


