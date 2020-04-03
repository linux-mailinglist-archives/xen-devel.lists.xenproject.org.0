Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7132F19DEA1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 21:42:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKSC8-0000Ik-Fv; Fri, 03 Apr 2020 19:41:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NL/P=5T=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jKSC6-0000If-K9
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 19:41:34 +0000
X-Inumbo-ID: 1f8c777e-75e3-11ea-b4f4-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f8c777e-75e3-11ea-b4f4-bc764e2007e4;
 Fri, 03 Apr 2020 19:41:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F243B2077D;
 Fri,  3 Apr 2020 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585942893;
 bh=eY/OtdelM/0Qj6FVPdtLOXVwNQhOstG4zubd5Negbek=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=JBhtv8ZL0JxBLxxOLC3O0eDG185G0pHgpd53y291Y0UoEKTRokwypzCT5f25dEVRM
 +Y7N2mPidrfXEt+lrIcHitNgw/Z0vDadMXLoMt+b4iIKoX/xfR76vDOG5if3krL6Oj
 VoNKydW7YNiYUlkX4B8TOJOo7zf4DR5u9W3b4yEU=
Date: Fri, 3 Apr 2020 12:41:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
In-Reply-To: <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
Message-ID: <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 maz@kernel.org, George.Dunlap@citrix.com, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 2 Apr 2020, Julien Grall wrote:
> As we discussed on Tuesday, the cost for other vCPUs is only going to be a
> trap to the hypervisor and then back again. The cost is likely smaller than
> receiving and forwarding an interrupt.
> 
> You actually agreed on this analysis. So can you enlighten me as to why
> receiving an interrupt is a not problem for latency but this is?

My answer was that the difference is that an operating system can
disable interrupts, but it cannot disable receiving this special IPI.

 
> The crash only happened when using vGICv3 not vGICv2. But did you look at Xen
> recently? Particularly at the following patch:
> 
> xen/arm: Handle unimplemented VGICv3 registers as RAZ/WI
> 
> Per the ARM Generic Interrupt Controller Architecture Specification (ARM
> IHI 0069E), reserved registers should generally be treated as RAZ/WI.
> To simplify the VGICv3 design and improve guest compatibility, treat the
> default case for GICD and GICR registers as read_as_zero/write_ignore.
> 
> Signed-off-by: Jeff Kubascik <jeff.kubascik@dornerworks.com>
> Acked-by: Julien Grall <julien@xen.org>
> 
> I actually pointed the patch to you during one of our weekly calls. Yet we
> agreed it would still be good to implement the register properly and you said
> you will write a patch.

As you know I cannot reproduce the crash myself, I asked Peng and Wei
for help in that. I cannot be certain Jeff's patch makes a difference,
but looking at the code, if you open
xen/arch/arm/vgic-v3.c:__vgic_v3_distr_common_mmio_read you can see that
the range mistake is still there:


    /* Read the active status of an IRQ via GICD/GICR is not supported */
    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVER):
    case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
        goto read_as_zero;


So a GICD_ISACTIVER of any register but the first should end up hitting
the default case:

    default:
        printk(XENLOG_G_ERR
               "%pv: %s: unhandled read r%d offset %#08x\n",
               v, name, dabt.reg, reg);
        return 0;
    }

Which returns 0 (IO_ABORT).

Would you be happy to have the range fixed to be:

    case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):

instead?

