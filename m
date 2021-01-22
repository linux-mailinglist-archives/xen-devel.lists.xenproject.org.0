Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A1D300F59
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 22:55:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73120.131830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l34O6-0001bY-Qa; Fri, 22 Jan 2021 21:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73120.131830; Fri, 22 Jan 2021 21:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l34O6-0001b9-NU; Fri, 22 Jan 2021 21:54:38 +0000
Received: by outflank-mailman (input) for mailman id 73120;
 Fri, 22 Jan 2021 21:54:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1bT=GZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l34O5-0001b4-FF
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 21:54:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 890cfb5a-f710-4248-8caa-9fa197f9d043;
 Fri, 22 Jan 2021 21:54:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82A3023B04;
 Fri, 22 Jan 2021 21:54:35 +0000 (UTC)
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
X-Inumbo-ID: 890cfb5a-f710-4248-8caa-9fa197f9d043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611352476;
	bh=rasEpiSqqevoppodfCoPMWemMMgb0kzYtVoAc/908CA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hUGP5+z3jpAbrvGrGU74SND9uGGO9OW0UQ5KDaOmj72jzotf7wWaQjGUxat2/GR7d
	 VBvhDLveAdqRIuOBmu1EI9NDs+/pazWZZ+9gz24AJZlzoxx2Us4000huYXvqlHm+YC
	 hOMfUPBoC0c/bKckm+GxzYuBgAoE4O3/VPASeLxkc6gtkJI9EnhXUy8IVxRlfpRGVM
	 ahSat1arpyWJthGIzJO8n4U0FIs0D4T+cYbPSonEwV6LHWZev731y4wijSKvy1uAUS
	 2m7g0tv2jzhQJNCjK2Gbnz0OtnGXQEKss7jXA3FhDmWSAO+uyhep7vvkorzzj2/o2p
	 Pm5QEwCDx7Unw==
Date: Fri, 22 Jan 2021 13:54:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 10/10] xen/arm: smmuv3: Add support for SMMUv3
 driver
In-Reply-To: <2d8efa67-a78a-c69a-2635-a10d78017b9a@gmail.com>
Message-ID: <alpine.DEB.2.21.2101221351100.14612@sstabellini-ThinkPad-T480s>
References: <388adde9a060eb9fc685cc743a354361fcdf0374.1611314782.git.rahul.singh@arm.com> <df3a76bc971a09daf4e61361bbc635e82cf9b59e.1611314782.git.rahul.singh@arm.com> <2d8efa67-a78a-c69a-2635-a10d78017b9a@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 22 Jan 2021, Oleksandr wrote:
> On 22.01.21 13:37, Rahul Singh wrote:
> 
> Hi Rahul
> 
> > Add support for ARM architected SMMUv3 implementation. It is based on
> > the Linux SMMUv3 driver.
> > 
> > Driver is currently supported as Tech Preview.
> > 
> > Major differences with regard to Linux driver are as follows:
> > 2. Only Stage-2 translation is supported as compared to the Linux driver
> >     that supports both Stage-1 and Stage-2 translations.
> > 3. Use P2M  page table instead of creating one as SMMUv3 has the
> >     capability to share the page tables with the CPU.
> > 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
> >     and priority queue IRQ handling.
> > 5. Latest version of the Linux SMMUv3 code implements the commands queue
> >     access functions based on atomic operations implemented in Linux.
> >     Atomic functions used by the commands queue access functions are not
> >     implemented in XEN therefore we decided to port the earlier version
> >     of the code. Atomic operations are introduced to fix the bottleneck
> >     of the SMMU command queue insertion operation. A new algorithm for
> >     inserting commands into the queue is introduced, which is lock-free
> >     on the fast-path.
> >     Consequence of reverting the patch is that the command queue
> >     insertion will be slow for large systems as spinlock will be used to
> >     serializes accesses from all CPUs to the single queue supported by
> >     the hardware. Once the proper atomic operations will be available in
> >     XEN the driver can be updated.
> > 6. Spin lock is used in place of mutex when attaching a device to the
> >     SMMU, as there is no blocking locks implementation available in XEN.
> >     This might introduce latency in XEN. Need to investigate before
> >     driver is out for tech preview.
> > 7. PCI ATS functionality is not supported, as there is no support
> >     available in XEN to test the functionality. Code is not tested and
> >     compiled. Code is guarded by the flag CONFIG_PCI_ATS.
> > 8. MSI interrupts are not supported as there is no support available in
> >     XEN to request MSI interrupts. Code is not tested and compiled. Code
> >     is guarded by the flag CONFIG_MSI.
> > 
> > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> > Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> > Changes since v2:
> > - added return statement for readx_poll_timeout function.
> > - remove iommu_get_dma_cookie and iommu_put_dma_cookie.
> > - remove struct arm_smmu_xen_device as not required.
> > - move dt_property_match_string to device_tree.c file.
> > - replace arm_smmu_*_thread to arm_smmu_*_tasklet to avoid confusion.
> > - use ARM_SMMU_REG_SZ as size when map memory to XEN.
> > - remove bypass keyword to make sure when device-tree probe is failed we
> >    are reporting error and not continuing to configure SMMU in bypass
> >    mode.
> > - fixed minor comments.
> > Changes since v3:
> > - Fixed typo for CONFIG_MSI
> > - Added back the mutex code
> > - Rebase the patch on top of newly added WARN_ON().
> > - Remove the direct read of register VTCR_EL2.
> > - Fixed minor comments.
> > Changes since v4:
> > - Replace the ffsll() with ffs64() function.
> > - Add code to free resources when probe failed.
> > Changes since v5:
> > - Add code for arm_smmu_iommu_hwdom_init().
> > - fixed minor comments.
> 
> You can add my (if this is really needed):
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

