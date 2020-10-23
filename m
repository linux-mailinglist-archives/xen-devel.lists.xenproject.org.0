Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15A4297568
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11279.29897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kW0O1-0005o7-6U; Fri, 23 Oct 2020 16:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11279.29897; Fri, 23 Oct 2020 16:57:53 +0000
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
	id 1kW0O1-0005nh-22; Fri, 23 Oct 2020 16:57:53 +0000
Received: by outflank-mailman (input) for mailman id 11279;
 Fri, 23 Oct 2020 16:57:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3H45=D6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kW0Nz-0005nW-Q1
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:57:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f96c451-6ded-46c5-96ed-a52c0cedb92f;
 Fri, 23 Oct 2020 16:57:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10F0B206BE;
 Fri, 23 Oct 2020 16:57:50 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3H45=D6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kW0Nz-0005nW-Q1
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:57:51 +0000
X-Inumbo-ID: 8f96c451-6ded-46c5-96ed-a52c0cedb92f
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8f96c451-6ded-46c5-96ed-a52c0cedb92f;
	Fri, 23 Oct 2020 16:57:51 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 10F0B206BE;
	Fri, 23 Oct 2020 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603472270;
	bh=55TAokNzigc1BthbDU5lS/ZjrUxZPxLZrR7sApqcjMo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IydVByRQ0vPzagjArWQYUvVH8XMylhiaXZFwIYpsA9F6j5S+F7lTmHqMJuYwqZ+R7
	 ScqYnkIDHhAw4X76A7TTlzdmuugG1UaGo24hM49Wgz0gERkSU2C7yz92TgQCmUsOPV
	 yon930UNOTd5Pv1d9v+hNZQWhqsf1m/QPY70UkrY=
Date: Fri, 23 Oct 2020 09:57:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Elliott Mitchell <ehem+xen@m5p.com>, xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Remove EXPERT dependancy
In-Reply-To: <b4ec906d-ebb6-add9-1bc0-39ab8d588026@xen.org>
Message-ID: <alpine.DEB.2.21.2010230944090.12247@sstabellini-ThinkPad-T480s>
References: <20201022014310.GA70872@mattapan.m5p.com> <7bf92deb-b1ba-31b2-0357-2639cd2a1bca@xen.org> <alpine.DEB.2.21.2010221403570.12247@sstabellini-ThinkPad-T480s> <b4ec906d-ebb6-add9-1bc0-39ab8d588026@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 23 Oct 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 22/10/2020 22:17, Stefano Stabellini wrote:
> > On Thu, 22 Oct 2020, Julien Grall wrote:
> > > On 22/10/2020 02:43, Elliott Mitchell wrote:
> > > > Linux requires UEFI support to be enabled on ARM64 devices.  While many
> > > > ARM64 devices lack ACPI, the writing seems to be on the wall of
> > > > UEFI/ACPI
> > > > potentially taking over.  Some common devices may need ACPI table
> > > > support.
> > > > 
> > > > Presently I think it is worth removing the dependancy on CONFIG_EXPERT.
> > > 
> > > The idea behind EXPERT is to gate any feature that is not considered to be
> > > stable/complete enough to be used in production.
> > 
> > Yes, and from that point of view I don't think we want to remove EXPERT
> > from ACPI yet. However, the idea of hiding things behind EXPERT works
> > very well for new esoteric features, something like memory introspection
> > or memory overcommit.
> 
> Memaccess is not very new ;).
> 
> > It does not work well for things that are actually
> > required to boot on the platform.
> 
> I am not sure where is the problem. It is easy to select EXPERT from the
> menuconfig. It also hints the user that the feature may not fully work.
> 
> > 
> > Typically ACPI systems don't come with device tree at all (RPi4 being an
> > exception), so users don't really have much of a choice in the matter.
> 
> And they typically have IOMMUs.
> 
> > 
> >  From that point of view, it would be better to remove EXPERT from ACPI,
> > maybe even build ACPI by default, *but* to add a warning at boot saying
> > something like:
> > 
> > "ACPI support is experimental. Boot using Device Tree if you can."
> > 
> > 
> > That would better convey the risks of using ACPI, while at the same time
> > making it a bit easier for users to boot on their ACPI-only platforms.
> 
> Right, I agree that this make easier for users to boot Xen on ACPI-only
> platform. However, based on above, it is easy enough for a developper to
> rebuild Xen with ACPI and EXPERT enabled.
> 
> So what sort of users are you targeting?

Somebody trying Xen for the first time, they might know how to build it
but they might not know that ACPI is not available by default, and they
might not know that they need to enable EXPERT in order to get the ACPI
option in the menu. It is easy to do once you know it is there,
otherwise one might not know where to look in the menu.


> I am sort of okay to remove EXPERT. 

OK. This would help (even without building it by default) because as you
go and look at the menu the first time, you'll find ACPI among the
options right away.


> But I still think building ACPI by default
> is still wrong because our default .config is meant to be (security)
> supported. I don't think ACPI can earn this qualification today.

Certainly we don't want to imply ACPI is security supported. I was
looking at SUPPORT.md and it is only says:

"""
EXPERT and DEBUG Kconfig options are not security supported. Other
Kconfig options are supported, if the related features are marked as
supported in this document.
"""

So technically we could enable ACPI in the build by default as ACPI for
ARM is marked as experimental. However, I can see that it is not a
great idea to enable by default an unsupported option in the kconfig, so
from that point of view it might be best to leave ACPI disabled by
default. Probably the best compromise at this time.



> In order to remove EXPERT, there are a few things to needs to be done (or
> checked):
>     1) SUPPORT.MD has a statement about ACPI on Arm

### Host ACPI (via Domain 0)

    Status, x86 PV: Supported
    Status, ARM: Experimental



>     2) DT is favored over ACPI if the two firmware tables are present.

Good idea. xen/arch/arm/acpi/boot.c:acpi_boot_table_init has:

    /*
     * Enable ACPI instead of device tree unless
     * - ACPI has been disabled explicitly (acpi=off), or
     * - the device tree is not empty (it has more than just a /chosen node)
     *   and ACPI has not been force enabled (acpi=force)
     */
    if ( param_acpi_off)
        goto disable;
    if ( !param_acpi_force &&
         device_tree_for_each_node(device_tree_flattened, 0,
                                   dt_scan_depth1_nodes, NULL) )
        goto disable;

We should be fine.

