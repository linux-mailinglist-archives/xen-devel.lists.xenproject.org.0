Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C6A72829
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 02:35:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928408.1331123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txc8g-00084V-2d; Thu, 27 Mar 2025 01:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928408.1331123; Thu, 27 Mar 2025 01:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txc8f-00082y-W2; Thu, 27 Mar 2025 01:34:33 +0000
Received: by outflank-mailman (input) for mailman id 928408;
 Thu, 27 Mar 2025 01:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxjK=WO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1txc8e-00082s-R2
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 01:34:32 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0f28b26-0aab-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 02:34:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 06115A401B4;
 Thu, 27 Mar 2025 01:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB246C4CEE2;
 Thu, 27 Mar 2025 01:34:28 +0000 (UTC)
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
X-Inumbo-ID: a0f28b26-0aab-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743039269;
	bh=4evYnni4ymNnLfjOMXkEzYt8QlQ++HFdDFluQzw0Sfs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NSSmxMD3vvK/qGUqw0SCIy5Q1nhkzoE4bj3OXU1bxckCpIyLaVDyX3pfQvxhBxbho
	 JNKcpDW0kHBqqFwCBdA/tp38eDPgwu9Ke5VI39CQSZck4qPp1T8k5u8CKSaTAnFLWH
	 NHwTXKiqzaosPnVbqwxY70rx/1TFaP6l1v8ZLP4jqTESlHgR2Nf9LQyzdxOCqRzSX/
	 oj7bs8BkZwErHz6zaP/2qQbZMywBUH+xVyqxbaJ6+gcz2PigQmT2+tholM7KOJz4zV
	 FQ64RCOONSo8INVmjJHmewr2p50/vpTQC4MkXaFFtZor6JUQWxpK6A8nyfFEg99LNY
	 QREyHMiSo8EkA==
Date: Wed, 26 Mar 2025 18:34:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] ARM/vgic: Fix out-of-bounds accesses in
 vgic_mmio_write_sgir()
In-Reply-To: <875xjvi952.fsf@epam.com>
Message-ID: <alpine.DEB.2.22.394.2503261834160.563920@ubuntu-linux-20-04-desktop>
References: <20250326155121.364658-1-andrew.cooper3@citrix.com> <875xjvi952.fsf@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Mar 2025, Volodymyr Babchuk wrote:
> Hi Andrew,
> 
> Andrew Cooper <andrew.cooper3@citrix.com> writes:
> 
> > The switch() statement is over bits 24:25 (unshifted) of the guest provided
> > value.  This makes case 0x3: dead, and not an implementation of the 4th
> > possible state.
> >
> > A guest which writes (3<<24)|(ff<<16) to this register will skip the early
> > exit, then enter bitmap_for_each() with targets not bound by nr_vcpus.
> >
> > If the guest has fewer than 8 vCPUs, bitmap_for_each() will read off the end
> > of d->vcpu[] and use the resulting vcpu pointer to ultimately derive irq, and
> > perform an out-of-bounds write.
> >
> > Fix this by changing case 0x3 to default.
> >
> > Fixes: 08c688ca6422 ("ARM: new VGIC: Add SGIR register handler")
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Julien Grall <julien@xen.org>
> > CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > CC: Bertrand Marquis <bertrand.marquis@arm.com>
> > CC: Michal Orzel <michal.orzel@amd.com>
> >
> > This vgic driver is explicity not security supported, hence no XSA.
> > ---
> >  xen/arch/arm/vgic/vgic-mmio-v2.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/vgic/vgic-mmio-v2.c b/xen/arch/arm/vgic/vgic-mmio-v2.c
> > index 670b335db2c3..7d1391ac9b48 100644
> > --- a/xen/arch/arm/vgic/vgic-mmio-v2.c
> > +++ b/xen/arch/arm/vgic/vgic-mmio-v2.c
> > @@ -104,7 +104,8 @@ static void vgic_mmio_write_sgir(struct vcpu *source_vcpu,
> >      case GICD_SGI_TARGET_SELF:                    /* this very vCPU only */
> >          targets = (1U << source_vcpu->vcpu_id);
> >          break;
> > -    case 0x3:                                     /* reserved */
> > +
> > +    default:
> >          return;
> >      }
> 
> -- 
> WBR, Volodymyr

