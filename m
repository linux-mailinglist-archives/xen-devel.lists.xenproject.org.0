Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32469C7E5B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 23:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835985.1251862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBM3o-0004H7-Bq; Wed, 13 Nov 2024 22:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835985.1251862; Wed, 13 Nov 2024 22:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBM3o-0004Ej-8S; Wed, 13 Nov 2024 22:42:04 +0000
Received: by outflank-mailman (input) for mailman id 835985;
 Wed, 13 Nov 2024 22:42:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ZXe=SI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tBM3m-0004Ed-PO
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 22:42:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d1a2c86-a210-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 23:41:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8063A5C596B;
 Wed, 13 Nov 2024 22:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583EFC4CEC3;
 Wed, 13 Nov 2024 22:41:55 +0000 (UTC)
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
X-Inumbo-ID: 7d1a2c86-a210-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjdkMWEyYzg2LWEyMTAtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTM3NzE4LjcwNTYzNiwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731537716;
	bh=zjYC+z3o5mXPHmk6pnlhdmGr8OD46koxrvTOfx7ihdQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ieWpQHBcrSNX/4x4QK8DfnPUTS2oK2cdEADKgWRIFIB8wQYiKBlr4V4ozFc9vaIsT
	 SicwS9DJAKtOpw99GuuVgnvL61btfiAqis5Hio7qSiFxn7hsNXzKY8U5pj4OdLTzR3
	 h7cCXemqPx1GgsYMuwjhBDLQfBCU6KqWnS6BVRJ+cBwDlsfuU23UHWzqgNbsnytwAm
	 f0JB2FHUEwdS7OJRYhuuWNk0lsLXdqqxraomaAvuz0ngu5up/1451bTgYUDDbAH5C0
	 qm2iLnzae1WhXrAcNNVy3/krP7QL6PpbDjrv08ZWjGIiNqmf7a1wmxR8A8sK725Bd4
	 jreCM6EtDIh1A==
Date: Wed, 13 Nov 2024 14:41:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu <luca.fancellu@arm.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
In-Reply-To: <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
Message-ID: <alpine.DEB.2.22.394.2411131410240.222505@ubuntu-linux-20-04-desktop>
References: <20241106134132.2185492-1-luca.fancellu@arm.com> <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com> <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org> <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com> <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com> <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Nov 2024, Julien Grall wrote:
> On 13/11/2024 15:40, Michal Orzel wrote:
> > On 13/11/2024 15:40, Julien Grall wrote:
> > > On 13/11/2024 14:19, Michal Orzel wrote:
> > > > On 13/11/2024 14:50, Julien Grall wrote:
> > > > > On 06/11/2024 15:07, Michal Orzel wrote:
> > > > > > On 06/11/2024 14:41, Luca Fancellu wrote:
> > > > > > > There are some cases where the device tree exposes a memory range
> > > > > > > in both /memreserve/ and reserved-memory node, in this case the
> > > > > > > current code will stop Xen to boot since it will find that the
> > > > > > > latter range is clashing with the already recorded /memreserve/
> > > > > > > ranges.
> > > > > > > 
> > > > > > > Furthermore, u-boot lists boot modules ranges, such as ramdisk,
> > > > > > > in the /memreserve/ part and even in this case this will prevent
> > > > > > > Xen to boot since it will see that the module memory range that
> > > > > > > it is going to add in 'add_boot_module' clashes with a
> > > > > > > /memreserve/
> > > > > > > range.
> > > > > > > 
> > > > > > > When Xen populate the data structure that tracks the memory
> > > > > > > ranges,
> > > > > > > it also adds a memory type described in 'enum membank_type', so
> > > > > > > in order to fix this behavior, allow the
> > > > > > > 'check_reserved_regions_overlap'
> > > > > > > function to check for exact memory range match given a specific
> > > > > > > memory
> > > > > > > type; allowing reserved-memory node ranges and boot modules to
> > > > > > > have an
> > > > > > > exact match with ranges from /memreserve/.
> > > > > > > 
> > > > > > > While there, set a type for the memory recorded during ACPI boot.
> > > > > > > 
> > > > > > > Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to
> > > > > > > bootinfo.reserved_mem")
> > > > > > > Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> > > > > > > Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
> > > > > > > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > > > > > > ---
> > > > > > > I tested this patch adding the same range in a /memreserve/ entry
> > > > > > > and
> > > > > > > /reserved-memory node, and by letting u-boot pass a ramdisk.
> > > > > > > I've also tested that a configuration running static shared memory
> > > > > > > still works
> > > > > > > fine.
> > > > > > > ---
> > > > > > So we have 2 separate issues. I don't particularly like the concept
> > > > > > of introducing MEMBANK_NONE
> > > > > > and the changes below look a bit too much for me, given that for
> > > > > > boot modules we can only have
> > > > > > /memreserve/ matching initrd.
> > > > > 
> > > > > How so? Is this an observation or part of a specification?
> > > > Not sure what specification you would want to see.
> > > 
> > > Anything that you bake your observation. My concern with observation is
> > > ...
> > > 
> > >    It's all part of U-Boot and Linux behavior that is not documented
> > > (except for code comments).
> > > > My statement is based on the U-Boot and Linux behavior. U-Boot part only
> > > > present for initrd:
> > > > https://github.com/u-boot/u-boot/blob/master/boot/fdt_support.c#L249
> > > 
> > > ... a user is not forced to use U-boot. So this is not a good reason to
> > I thought that this behavior is solely down to u-boot playing tricks with
> > memreserve.
> 
> Sure we noticed that U-boot is doing some we didn't expect. But this really
> doesn't mean there are not other interesting behavior happening.
> 
> > 
> > > rely on it. If Linux starts to rely on it, then it is probably a better
> > > argument, but first I would need to see the code. Can you paste a link?
> > Not sure how I would do that given that it is all scattered. 
> 
> There are no requirements to be all scattered.
> 
> > But if it means sth, here is kexec code> to create fdt. It is clear they do
> the same trick as u-boot.
> > https://github.com/torvalds/linux/blob/master/drivers/of/kexec.c#L355
> 
> Yet this doesn't provide any information why this only has to be an exact
> region... It only tells me the current behavior.
> 
> > 
> > > 
> > > > 
> > > > For things that Xen can be interested in, only region for ramdisk for
> > > > dom0 can match the /memreserve/ region.
> > > > Providing a generic solution (like Luca did) would want providing an
> > > > example of sth else that can match which I'm not aware of.
> > > 
> > > I would argue this is the other way around. If we are not certain that
> > > /memreserve/ will not be used for any other boot module, then we should
> > > have a generic solution. Otherwise, we will end up with similar weird
> > > issue in the future.
> > We have 3 possible modules for bootloader->kernel workflow: kernel, dtb and
> > ramdisk. The first 2 are not described in DT so I'm not sure
> > what are your examples of bootmodules for which you want kernel know about
> > memory reservation other than ramdisk.
> 
> The DTB is not described but the kernel is. We also have XSM modules. All of
> which could in theory be in memreserve if for some reasons the bootloader
> wanted to preserve the modules for future use (think Live-Update)...
> 
> Anyway, to be honest, I don't understand why you are pushing back at a more
> generic solution... Yes this may be what we just notice today, but I haven't
> seen any evidence that it never happen.
> 
> So I would rather go with the generic solution.

I looked into the question: "Is this an observation or part of a
specification?"

Looking at the device tree specification
source/chapter5-flattened-format.rst:"Memory Reservation Block"

It says:

"It is used to protect vital data structures from being overwritten by
the client program." [...] "More specifically, a client program shall
not access memory in a reserved region unless other information provided
by the boot program explicitly indicates that it shall do so."


I think it is better to stay on the safe side and implement in Xen a
more generic behavior to support /memreserve/. It is possible that in a
future board more information could be residing in a /memreserve/
region. For instance, I could imagine EFI runtime services residing in a
/memreserve/ region.

I am a bit confused by ranges that are both in /memreserve/ and
/reserved-memory. Ranges under /memreserve/ should not be accessed at
all (unless otherwise specified), ranges under /reserved-memory are
reserved for specific drivers.

I guess ranges that are both in /memreserve/ and /reserved-memory are
exactly the type of ranges that fall under this statement in the spec:
"unless other information provided by the boot program explicitly
indicates that it shall do so".

The way I see it from the device tree spec, I think Xen should not map
/memreserve/ ranges to Dom0, and it should avoid accessing them itself.
But if a range is both in /memreserve/ and also in /reserved-memory,
then basically /reserved-memory takes precedence, so Xen should map it
to Dom0.

Please have a look at the spec, and let me know if you come to the same
conclusion.

