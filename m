Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD79B3FA1BA
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 01:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174032.317487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJkzV-000282-Kv; Fri, 27 Aug 2021 23:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174032.317487; Fri, 27 Aug 2021 23:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJkzV-00025Y-Gz; Fri, 27 Aug 2021 23:10:29 +0000
Received: by outflank-mailman (input) for mailman id 174032;
 Fri, 27 Aug 2021 23:10:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT99=NS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mJkzT-00025S-Ly
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 23:10:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f673ddaa-078b-11ec-ab1d-12813bfff9fa;
 Fri, 27 Aug 2021 23:10:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F8C660EE9;
 Fri, 27 Aug 2021 23:10:25 +0000 (UTC)
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
X-Inumbo-ID: f673ddaa-078b-11ec-ab1d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630105825;
	bh=qBIzVCXW6dE91JPiI96+7v9J4d5Jr0TmiZgo6hbNdrg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qOClHbv066amRY7T5rmGAwDkj1jwEfjh5hoUiP02knjH4Uyw3yh4p8TUe3wV9obrf
	 D8msJkOPrV6B79RxEnCkq06NxQqXq8WF60CCtICTFQtw8EH+qKZD0CUFo+4fxhqO9E
	 ceKxXw0JzwkBCgK+QjEno1/xRCGBvaz1RZPRi03UWBX15/Mg5Ve5WTLJOpcEmCiCTJ
	 LEPgs0vh+lPC/a6Fon18vWuwvClhcJiWUD4iFud/rw9xTh4moIm/L4Q9rKhWUTKiRu
	 W3u3HZ/D3N0rI3vA4mirmrd3Urc73Wa0mtnzHv4jN9KW2ysYTx/HNk5wEZ/2uEIY4N
	 NeAP38l9LH4fA==
Date: Fri, 27 Aug 2021 16:10:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <wei.chen@arm.com>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 18/40] xen/arm: Keep memory nodes in dtb for NUMA
 when boot from EFI
In-Reply-To: <77a7126c-3874-5643-38fc-dba8130826ec@xen.org>
Message-ID: <alpine.DEB.2.21.2108271609480.17851@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-19-wei.chen@arm.com> <alpine.DEB.2.21.2108261622500.24433@sstabellini-ThinkPad-T480s> <77a7126c-3874-5643-38fc-dba8130826ec@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Aug 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 27/08/2021 00:24, Stefano Stabellini wrote:
> > On Wed, 11 Aug 2021, Wei Chen wrote:
> > > EFI can get memory map from EFI system table. But EFI system
> > > table doesn't contain memory NUMA information, EFI depends on
> > > ACPI SRAT or device tree memory node to parse memory blocks'
> > > NUMA mapping.
> > > 
> > > But in current code, when Xen is booting from EFI, it will
> > > delete all memory nodes in device tree. So in UEFI + DTB
> > > boot, we don't have numa-node-id for memory blocks any more.
> > > 
> > > So in this patch, we will keep memory nodes in device tree for
> > > NUMA code to parse memory numa-node-id later.
> > > 
> > > As a side effect, if we still parse boot memory information in
> > > early_scan_node, bootmem.info will calculate memory ranges in
> > > memory nodes twice. So we have to prvent early_scan_node to
> > > parse memory nodes in EFI boot.
> > > 
> > > As EFI APIs only can be used in Arm64, so we introduced a wrapper
> > > in header file to prevent #ifdef CONFIG_ARM_64/32 in code block.
> > > 
> > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > ---
> > >   xen/arch/arm/bootfdt.c      |  8 +++++++-
> > >   xen/arch/arm/efi/efi-boot.h | 25 -------------------------
> > >   xen/include/asm-arm/setup.h |  6 ++++++
> > >   3 files changed, 13 insertions(+), 26 deletions(-)
> > > 
> > > diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> > > index 476e32e0f5..7df149dbca 100644
> > > --- a/xen/arch/arm/bootfdt.c
> > > +++ b/xen/arch/arm/bootfdt.c
> > > @@ -11,6 +11,7 @@
> > >   #include <xen/lib.h>
> > >   #include <xen/kernel.h>
> > >   #include <xen/init.h>
> > > +#include <xen/efi.h>
> > >   #include <xen/device_tree.h>
> > >   #include <xen/libfdt/libfdt.h>
> > >   #include <xen/sort.h>
> > > @@ -335,7 +336,12 @@ static int __init early_scan_node(const void *fdt,
> > >   {
> > >       int rc = 0;
> > >   -    if ( device_tree_node_matches(fdt, node, "memory") )
> > > +    /*
> > > +     * If system boot from EFI, bootinfo.mem has been set by EFI,
> > > +     * so we don't need to parse memory node from DTB.
> > > +     */
> > > +    if ( device_tree_node_matches(fdt, node, "memory") &&
> > > +         !arch_efi_enabled(EFI_BOOT) )
> > >           rc = process_memory_node(fdt, node, name, depth,
> > >                                    address_cells, size_cells,
> > > &bootinfo.mem);
> > >       else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
> > 
> > 
> > If we are going to use the device tree info for the numa nodes (and
> > related memory) does it make sense to still rely on the EFI tables for
> > the memory map?
> 
> Yes. AFAIK, when booting using EFI, the Device-Tree may not contain all the
> reserved regions. Furthermore, we are still too early to know whether we boot
> using ACPI and DT.
> 
> > 
> > I wonder if we should just use device tree for memory and ignore EFI
> > instead. Do you know what Linux does in this regard?
> I looked at Linux when I first reviewed this patch because I was wondering
> what happens if the DT and UEFI map disagrees.
> 
> Linux and Xen are the same after this patch:
>   1) The memory map is coming from UEFI map
>   2) NUMA ID is coming from the DT
> 
> The commit that introduced the change in Linux is:
[...]

Thanks both you and Wei for the investigation :-)

