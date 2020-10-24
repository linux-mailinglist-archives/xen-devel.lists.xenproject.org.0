Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC3D297A17
	for <lists+xen-devel@lfdr.de>; Sat, 24 Oct 2020 02:46:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11390.30197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW7gt-0002pS-4t; Sat, 24 Oct 2020 00:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11390.30197; Sat, 24 Oct 2020 00:45:51 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW7gt-0002p3-1m; Sat, 24 Oct 2020 00:45:51 +0000
Received: by outflank-mailman (input) for mailman id 11390;
 Sat, 24 Oct 2020 00:45:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BKCc=D7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kW7gr-0002oy-Dc
 for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 00:45:49 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bad57da-951a-40ec-a1f9-30c668982c6c;
 Sat, 24 Oct 2020 00:45:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4081F2087D;
 Sat, 24 Oct 2020 00:45:47 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BKCc=D7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kW7gr-0002oy-Dc
	for xen-devel@lists.xenproject.org; Sat, 24 Oct 2020 00:45:49 +0000
X-Inumbo-ID: 9bad57da-951a-40ec-a1f9-30c668982c6c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 9bad57da-951a-40ec-a1f9-30c668982c6c;
	Sat, 24 Oct 2020 00:45:48 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4081F2087D;
	Sat, 24 Oct 2020 00:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603500347;
	bh=XyS8hRmjqJFKbI66U4BCw5giO+6os719277xBozoTBk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WRRIbYP1ZWEhzQ8yP/+qW1Te+eYPbQIjC4poBKwsj27DyJ7yccRsbBRg0WN1bg9BJ
	 Q1gzjnszAE2dId8KKtXRhqj5h1Bp67o8YmfVA3yptIbjvRrOXmbT7U2J2Up/6k2nS6
	 fZ8mPy70lbXiyL7c9Xc5x+IIXRQBQsEwjGoP+Rlk=
Date: Fri, 23 Oct 2020 17:45:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
    alex.bennee@linaro.org, masami.hiramatsu@linaro.org, ehem+xen@m5p.com, 
    bertrand.marquis@arm.com, andre.przywara@arm.com, Rahul.Singh@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v2 6/7] xen/arm: gic-v2: acpi: Use the correct length
 for the GICC structure
In-Reply-To: <alpine.DEB.2.21.2010231731010.12247@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2010231735000.12247@sstabellini-ThinkPad-T480s>
References: <20201023154156.6593-1-julien@xen.org> <20201023154156.6593-7-julien@xen.org> <alpine.DEB.2.21.2010231731010.12247@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Oct 2020, Stefano Stabellini wrote:
> On Fri, 23 Oct 2020, Julien Grall wrote:
> > From: Julien Grall <julien.grall@arm.com>
> > 
> > The length of the GICC structure in the MADT ACPI table differs between
> > version 5.1 and 6.0, although there are no other relevant differences.
> > 
> > Use the BAD_MADT_GICC_ENTRY macro, which was specifically designed to
> > overcome this issue.
> > 
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Actually it looks we need to do substitutions in a couple of other places:

- xen/arch/arm/gic-v3.c:gicv3_make_hwdom_madt
- xen/arch/arm/gic-v3.c:gic_acpi_get_madt_cpu_num
- xen/arch/arm/gic.c:gic_get_hwdom_madt_size





> >     Changes in v2:
> >         - Patch added
> > ---
> >  xen/arch/arm/acpi/boot.c | 2 +-
> >  xen/arch/arm/gic-v2.c    | 5 +++--
> >  xen/arch/arm/gic-v3.c    | 2 +-
> >  3 files changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
> > index 30e4bd1bc5a7..55c3e5cbc834 100644
> > --- a/xen/arch/arm/acpi/boot.c
> > +++ b/xen/arch/arm/acpi/boot.c
> > @@ -131,7 +131,7 @@ acpi_parse_gic_cpu_interface(struct acpi_subtable_header *header,
> >      struct acpi_madt_generic_interrupt *processor =
> >                 container_of(header, struct acpi_madt_generic_interrupt, header);
> >  
> > -    if ( BAD_MADT_ENTRY(processor, end) )
> > +    if ( BAD_MADT_GICC_ENTRY(processor, end) )
> >          return -EINVAL;
> >  
> >      acpi_table_print_madt_entry(header);
> > diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> > index 0f747538dbcd..0e5f23201974 100644
> > --- a/xen/arch/arm/gic-v2.c
> > +++ b/xen/arch/arm/gic-v2.c
> > @@ -1136,7 +1136,8 @@ static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
> >  
> >      host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
> >                               header);
> > -    size = sizeof(struct acpi_madt_generic_interrupt);
> > +
> > +    size = ACPI_MADT_GICC_LENGTH;
> >      /* Add Generic Interrupt */
> >      for ( i = 0; i < d->max_vcpus; i++ )
> >      {
> > @@ -1165,7 +1166,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
> >      struct acpi_madt_generic_interrupt *processor =
> >                 container_of(header, struct acpi_madt_generic_interrupt, header);
> >  
> > -    if ( BAD_MADT_ENTRY(processor, end) )
> > +    if ( BAD_MADT_GICC_ENTRY(processor, end) )
> >          return -EINVAL;
> >  
> >      /* Read from APIC table and fill up the GIC variables */
> > diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> > index 0f6cbf6224e9..ce202402c0ed 100644
> > --- a/xen/arch/arm/gic-v3.c
> > +++ b/xen/arch/arm/gic-v3.c
> > @@ -1558,7 +1558,7 @@ gic_acpi_parse_madt_cpu(struct acpi_subtable_header *header,
> >      struct acpi_madt_generic_interrupt *processor =
> >                 container_of(header, struct acpi_madt_generic_interrupt, header);
> >  
> > -    if ( BAD_MADT_ENTRY(processor, end) )
> > +    if ( BAD_MADT_GICC_ENTRY(processor, end) )
> >          return -EINVAL;
> >  
> >      /* Read from APIC table and fill up the GIC variables */
> > -- 
> > 2.17.1
> > 
> 

