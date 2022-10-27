Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E55761037E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 22:55:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431203.683914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo9tw-00021U-Ei; Thu, 27 Oct 2022 20:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431203.683914; Thu, 27 Oct 2022 20:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo9tw-0001yp-Bq; Thu, 27 Oct 2022 20:54:56 +0000
Received: by outflank-mailman (input) for mailman id 431203;
 Thu, 27 Oct 2022 20:54:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yXv3=24=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1oo9tv-0001yj-4x
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 20:54:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9ae00ab3-5639-11ed-8fd0-01056ac49cbb;
 Thu, 27 Oct 2022 22:54:53 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CED5F23A;
 Thu, 27 Oct 2022 13:54:58 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF8573F7B4;
 Thu, 27 Oct 2022 13:54:49 -0700 (PDT)
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
X-Inumbo-ID: 9ae00ab3-5639-11ed-8fd0-01056ac49cbb
Date: Thu, 27 Oct 2022 21:53:16 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <stefanos@xilinx.com>, <julien@xen.org>, <Volodymyr_Babchuk@epam.com>,
 <bertrand.marquis@arm.com>, <Henry.Wang@arm.com>
Subject: Re: [XEN v1] xen/arm: vGICv3: Restore the interrupt state correctly
Message-ID: <20221027215316.768881c9@slackpad.lan>
In-Reply-To: <20221027190913.65413-1-ayankuma@amd.com>
References: <20221027190913.65413-1-ayankuma@amd.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Oct 2022 20:09:13 +0100
Ayan Kumar Halder <ayankuma@amd.com> wrote:

Hi,

> As "spin_lock_irqsave(&v->arch.vgic.lock, flags)" saves the current interrupt
> state in "flags", "spin_unlock_irqrestore(&v->arch.vgic.lock, flags)" should be
> used to restore the saved interrupt state.
> 
> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>

Thanks for fixing this!

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  xen/arch/arm/vgic-v3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index d0e265634e..015446be17 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -582,7 +582,7 @@ static int __vgic_v3_rdistr_rd_mmio_write(struct vcpu *v, mmio_info_t *info,
>              write_atomic(&v->arch.vgic.rdist_pendbase, reg);
>          }
>  
> -        spin_unlock_irqrestore(&v->arch.vgic.lock, false);
> +        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>  
>          return 1;
>      }


