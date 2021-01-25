Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5D302A46
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 19:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74266.133454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46ez-0005A8-NZ; Mon, 25 Jan 2021 18:32:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74266.133454; Mon, 25 Jan 2021 18:32:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l46ez-00059j-KB; Mon, 25 Jan 2021 18:32:21 +0000
Received: by outflank-mailman (input) for mailman id 74266;
 Mon, 25 Jan 2021 18:32:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9fV7=G4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l46ex-00059e-Ot
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 18:32:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4dfde71-4439-4ef5-a418-879ea5061064;
 Mon, 25 Jan 2021 18:32:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 942C222D04;
 Mon, 25 Jan 2021 18:32:17 +0000 (UTC)
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
X-Inumbo-ID: e4dfde71-4439-4ef5-a418-879ea5061064
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611599538;
	bh=smP1SLfopJpH8Jlc5AtNMgMGyzmjAlBnO8tPcYxVfDw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U+La9yqW00ht7lcfd38uYwT5qTnZI7wNxPcz01TeAO5YSX7ScE7kzTmedGB5B3iBj
	 6udM4UlfCPMgCLtwpBDp3/lAgwR37y+ebvH3J+TMjlQvMZAnxwUMZ+ZqivWRz7BnwL
	 JzdSvsx/CrdiOpDWQAs0GIXUC986RZEgUS9ey+RoGDr62EG0/GsziPhJ0r6vcGGmJM
	 VqjneU3QhwLU48Jbn09sbaIGdzJ9OpTjvt8P2boaC57BtUni1p7K1rDDxcPNjpLHN4
	 OImVkk+httqp0pMvH1Oh4KX/TyWu10hyAD29J+dYWMh3VqR1IYqSz+4qg2zP6zautP
	 WimYOinYCHtYg==
Date: Mon, 25 Jan 2021 10:32:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Paul Durrant <paul@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 10/10] xen/arm: smmuv3: Add support for SMMUv3
 driver
In-Reply-To: <4C31618C-8EBA-40D7-B1B5-48037511D8AE@arm.com>
Message-ID: <alpine.DEB.2.21.2101251031560.20638@sstabellini-ThinkPad-T480s>
References: <388adde9a060eb9fc685cc743a354361fcdf0374.1611314782.git.rahul.singh@arm.com> <df3a76bc971a09daf4e61361bbc635e82cf9b59e.1611314782.git.rahul.singh@arm.com> <1a7e0989-29c6-7c7e-43a1-0caa11caad61@xen.org>
 <4C31618C-8EBA-40D7-B1B5-48037511D8AE@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Jan 2021, Rahul Singh wrote:
> Hello Julien,
> 
> > On 23 Jan 2021, at 11:55 am, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Rahul
> > 
> > On 22/01/2021 11:37, Rahul Singh wrote:
> >> Add support for ARM architected SMMUv3 implementation. It is based on
> >> the Linux SMMUv3 driver.
> >> Driver is currently supported as Tech Preview.
> >> Major differences with regard to Linux driver are as follows:
> >> 2. Only Stage-2 translation is supported as compared to the Linux driver
> >>    that supports both Stage-1 and Stage-2 translations.
> >> 3. Use P2M  page table instead of creating one as SMMUv3 has the
> >>    capability to share the page tables with the CPU.
> >> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
> >>    and priority queue IRQ handling.
> >> 5. Latest version of the Linux SMMUv3 code implements the commands queue
> >>    access functions based on atomic operations implemented in Linux.
> >>    Atomic functions used by the commands queue access functions are not
> >>    implemented in XEN therefore we decided to port the earlier version
> >>    of the code. Atomic operations are introduced to fix the bottleneck
> >>    of the SMMU command queue insertion operation. A new algorithm for
> >>    inserting commands into the queue is introduced, which is lock-free
> >>    on the fast-path.
> >>    Consequence of reverting the patch is that the command queue
> >>    insertion will be slow for large systems as spinlock will be used to
> >>    serializes accesses from all CPUs to the single queue supported by
> >>    the hardware. Once the proper atomic operations will be available in
> >>    XEN the driver can be updated.
> >> 6. Spin lock is used in place of mutex when attaching a device to the
> >>    SMMU, as there is no blocking locks implementation available in XEN.
> >>    This might introduce latency in XEN. Need to investigate before
> >>    driver is out for tech preview.
> >> 7. PCI ATS functionality is not supported, as there is no support
> >>    available in XEN to test the functionality. Code is not tested and
> >>    compiled. Code is guarded by the flag CONFIG_PCI_ATS.
> >> 8. MSI interrupts are not supported as there is no support available in
> >>    XEN to request MSI interrupts. Code is not tested and compiled. Code
> >>    is guarded by the flag CONFIG_MSI.
> >> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Thank you for sending a new version. I have commited the series now.
> > 
> 
> Thank you for committing the series.

Well done, Rahul!

