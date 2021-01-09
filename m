Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 597A22EFCCE
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 02:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63970.113424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3Jk-0000El-Op; Sat, 09 Jan 2021 01:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63970.113424; Sat, 09 Jan 2021 01:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3Jk-0000EB-JP; Sat, 09 Jan 2021 01:45:24 +0000
Received: by outflank-mailman (input) for mailman id 63970;
 Sat, 09 Jan 2021 01:45:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky3Ji-0000Dc-Ne
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 01:45:22 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7ace8f5-8a85-4a68-9713-b2da59090742;
 Sat, 09 Jan 2021 01:45:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 163C82399A;
 Sat,  9 Jan 2021 01:45:21 +0000 (UTC)
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
X-Inumbo-ID: c7ace8f5-8a85-4a68-9713-b2da59090742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610156721;
	bh=F4tBeZeAPMwHL2mBV5h01bcpPe3yTC/18o2il2pW/Zg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Rqs8BsFyjDhsAkpNC4gSkLTC8GvxcmJwKgVfh6AiScJtedaUZfSricI1J31L2g1yF
	 Unbc1I8Vy9F9rJmXGrNzBqd+67ql7lxIb2f1wtFSz5sQpt/qV6lzvgWX8uqDD/C2n0
	 MeVdLAslya3fCm6xuove5QuRdTVyp3KQoJIsYgPOjmc37T3IFwV9zEWUMaLlR3rUsu
	 MhVk9ato3LXyw/TCHip49+o+Blx3LSZoBBWjdxunvXZ5ekExT+aToVKMVlrluFcXdt
	 D3/qbNUUiu0tfG0ksAS90alhYCQjIP0tWYLlobIFLJnlXiEY9n43Ldisar4eAcSMD4
	 8aBbiH2kBMY7A==
Date: Fri, 8 Jan 2021 17:45:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3
 driver
In-Reply-To: <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081743520.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
> Add support for ARM architected SMMUv3 implementation. It is based on
> the Linux SMMUv3 driver.
> 
> Driver is currently supported as Tech Preview.
> 
> Major differences with regard to Linux driver are as follows:
> 2. Only Stage-2 translation is supported as compared to the Linux driver
>    that supports both Stage-1 and Stage-2 translations.
> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>    capability to share the page tables with the CPU.
> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>    and priority queue IRQ handling.
> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>    access functions based on atomic operations implemented in Linux.
>    Atomic functions used by the commands queue access functions are not
>    implemented in XEN therefore we decided to port the earlier version
>    of the code. Atomic operations are introduced to fix the bottleneck
>    of the SMMU command queue insertion operation. A new algorithm for
>    inserting commands into the queue is introduced, which is lock-free
>    on the fast-path.
>    Consequence of reverting the patch is that the command queue
>    insertion will be slow for large systems as spinlock will be used to
>    serializes accesses from all CPUs to the single queue supported by
>    the hardware. Once the proper atomic operations will be available in
>    XEN the driver can be updated.
> 6. Spin lock is used in place of mutex when attaching a device to the
>    SMMU, as there is no blocking locks implementation available in XEN.
>    This might introduce latency in XEN. Need to investigate before
>    driver is out for tech preview.
> 7. PCI ATS functionality is not supported, as there is no support
>    available in XEN to test the functionality. Code is not tested and
>    compiled. Code is guarded by the flag CONFIG_PCI_ATS.
> 8. MSI interrupts are not supported as there is no support available in
>    XEN to request MSI interrupts. Code is not tested and compiled. Code
>    is guarded by the flag CONFIG_MSI.
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Going through the code you addressed all my previous comments and I
don't have any to add, so:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

