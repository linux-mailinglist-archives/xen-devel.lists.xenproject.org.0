Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5454F2EF869
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 20:52:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63825.113192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxxnW-0008Kv-Js; Fri, 08 Jan 2021 19:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63825.113192; Fri, 08 Jan 2021 19:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxxnW-0008KX-GV; Fri, 08 Jan 2021 19:51:46 +0000
Received: by outflank-mailman (input) for mailman id 63825;
 Fri, 08 Jan 2021 19:51:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkaL=GL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kxxnV-0008KS-2B
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 19:51:45 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 049c9cbb-f712-420f-ab2a-5fc4498de8a3;
 Fri, 08 Jan 2021 19:51:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0405A23AA7;
 Fri,  8 Jan 2021 19:51:42 +0000 (UTC)
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
X-Inumbo-ID: 049c9cbb-f712-420f-ab2a-5fc4498de8a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610135503;
	bh=4c6fh7lZc92PxOsVQovQ99QbEYuL/Pimu/e2lx29ug8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uQKSu6khPDDgrBIuzH7/frXNPXYf4PYl4JFrZGaH2CDVIdBMj7WpE94gy7/sXpDj6
	 9WTFDCIPQGbw4BQ+x1plqZWSEPXDZR0fmLYOf2+P6NW1QM+/3PX7ASIr0ZSp65vpbz
	 SJI1pffR6TnJWMfteRLPxMVRltsVha6icbb+cWTxpO2qt1M90gqwKfb7gR9r3HjN4f
	 4qeeyYj0UNcly9jZeYQy16admRkT4uPnRaJPP+hZYvGLqAVW+nAX73XMsb+VEvSHmt
	 55axcR72acSf4HUAWh5iboaj1QSNr8oBAVPTFeCp3QZhq/DfDiq4UB/uHP+M45VI4N
	 w0AusSc2Z3dDg==
Date: Fri, 8 Jan 2021 11:51:33 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: do not read MVFR2 when is not defined
In-Reply-To: <39db01ff-4e05-d8fd-5fef-3c85f4292b2f@xen.org>
Message-ID: <alpine.DEB.2.21.2101081134080.26153@sstabellini-ThinkPad-T480s>
References: <20210108192243.25889-1-sstabellini@kernel.org> <39db01ff-4e05-d8fd-5fef-3c85f4292b2f@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 08/01/2021 19:22, Stefano Stabellini wrote:
> > MVFR2 is not available on ARMv7. It is available on ARMv8 aarch32 and
> > aarch64. If Xen reads MVFR2 on ARMv7 it could crash.
> > 
> > Avoid the issue by doing the following:
> > 
> > - define MVFR2_MAYBE_UNDEFINED on arm32
> > - if MVFR2_MAYBE_UNDEFINED, do not attempt to read MVFR2 in Xen
> > - keep the 3rd register_t in struct cpuinfo_arm.mvfr on arm32 so that a
> >    guest read to the register returns '0' instead of crashing the guest.
> > 
> > '0' is an appropriate value to return to the guest because it is defined
> > as "no support for miscellaneous features".
> > 
> > Aarch64 Xen is not affected by this patch.
> > 
> > Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> With one question below:

Thanks!


> >   xen/arch/arm/cpufeature.c           | 2 ++
> >   xen/include/asm-arm/arm32/sysregs.h | 3 +++
> >   2 files changed, 5 insertions(+)
> > 
> > diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> > index 1f6a85aafe..698bfa0201 100644
> > --- a/xen/arch/arm/cpufeature.c
> > +++ b/xen/arch/arm/cpufeature.c
> > @@ -150,7 +150,9 @@ void identify_cpu(struct cpuinfo_arm *c)
> >             c->mvfr.bits[0] = READ_SYSREG(MVFR0_EL1);
> >           c->mvfr.bits[1] = READ_SYSREG(MVFR1_EL1);
> > +#ifndef MVFR2_MAYBE_UNDEFINED
> >           c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
> > +#endif
> 
> Is there any guarantee that c->mvfr.bits[2] will be zeroed by default?

It is coming from one of the following:

- xen/arch/arm/setup.c: struct cpuinfo_arm __read_mostly boot_cpu_data;
- xen/arch/arm/smpboot.c: struct cpuinfo_arm cpu_data[NR_CPUS];

Both are global variables so they should be both zeroed.

