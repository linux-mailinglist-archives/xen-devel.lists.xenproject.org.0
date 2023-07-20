Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D094275BB1F
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 01:26:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566796.886128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMd1k-0006Xb-PV; Thu, 20 Jul 2023 23:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566796.886128; Thu, 20 Jul 2023 23:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMd1k-0006VL-Mj; Thu, 20 Jul 2023 23:25:44 +0000
Received: by outflank-mailman (input) for mailman id 566796;
 Thu, 20 Jul 2023 23:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1UDO=DG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMd1j-0006VF-Fu
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 23:25:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc31e3b7-2754-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 01:25:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8A8061CBA;
 Thu, 20 Jul 2023 23:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7684DC433C7;
 Thu, 20 Jul 2023 23:25:36 +0000 (UTC)
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
X-Inumbo-ID: bc31e3b7-2754-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689895537;
	bh=pltAmrO30goYJZGPg3bwSoQ75w1SmPjLZB9e58iNaKw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T4zr3aJiZaw7S5pFLvpEQcP5xYvN/o8Eg05dTjxG5SHeF/WDNcsgp7YPG6NbvX08c
	 +UxZDN+UZXyA58KsRWv+/9sPFNKN6uJXrwY2XTftscrQqvZF3I1SzH0aBIClmNu/kX
	 F3Vn3ASrIeWP5ODR1/XTVnWggl07/M2Ln4vwYQS1cM5xpv5ZnUJahovrjWIm/m1lwt
	 PiKiWEjGgA45rdqsOkxQKyZtQEgE0cyu5SakpOFY0vA4hhsTJEDLWe0clb6cV+L783
	 iclD75mhKZ+G7tkxr6lasn5oE7jtfZL90bIulO9P1OOhkUOmJfScVCJ26kGSHiWhVS
	 ic+2d6bJzHvuQ==
Date: Thu, 20 Jul 2023 16:25:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, george.mocanu@nxp.com, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [ARM][xencons] PV Console hangs due to illegal ring buffer
 accesses
In-Reply-To: <048266d6-a32f-5f4e-984a-8b74de01a1fc@xen.org>
Message-ID: <alpine.DEB.2.22.394.2307201609030.3118466@ubuntu-linux-20-04-desktop>
References: <62eeff72-c1fb-6932-6797-1b0058c97b03@oss.nxp.com> <048266d6-a32f-5f4e-984a-8b74de01a1fc@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Jul 2023, Julien Grall wrote:
> (+ Juergen)
> 
> On 19/07/2023 17:13, Andrei Cherechesu (OSS) wrote:
> > Hello,
> 
> Hi Andrei,
> 
> > As we're running Xen 4.17 (with platform-related support added) on NXP S32G
> > SoCs (ARMv8), with a custom Linux distribution built through Yocto, and
> > we've set some Xen-based demos up, we encountered some issues which we think
> > might not be related to our hardware. For additional context, the Linux
> > kernel version we're running is 5.15.96-rt (with platform-related support
> > added as well).
> > 
> > The setup to reproduce the problem is fairly simple: after booting a Dom0
> > (can provide configuration details if needed), we're booting a normal PV
> > DomU with PV Networking. Additionally, the VMs have k3s (Lightweight
> > Kubernetes - version v1.25.8+k3s1:
> > https://github.com/k3s-io/k3s/releases/tag/v1.25.8%2Bk3s1) installed in
> > their rootfs'es.
> > 
> > The problem is that the DomU console hangs (no new output is shown, no input
> > can be sent) some time (non-deterministic, sometimes 5 seconds, other times
> > like 15-20 seconds) after we run the `k3s server` command. We have this
> > command running as part of a sysvinit service, and the same behavior can be
> > observed in that case as well. The k3s version we use is the one mentioned
> > in the paragraph above, but this can be reproduced with other versions as
> > well (i.e., v1.21.11, v1.22.6). If the `k3s server` command is ran in the
> > Dom0 VM, everything works fine. Using DomU as an agent node is also working
> > fine, only when it is run as a server the console problem occurs.
> > 
> > Immediately after the serial console hangs, we can still log in on DomU
> > using SSH, and we can observe the following messages its dmesg:
> > [   57.905806] xencons: Illegal ring page indices
> 
> Looking at Linux code, this message is printed in a couple of place in the
> xenconsole driver.
> 
> I would assume that this is printed when reading from the buffer (otherwise
> you would not see any message). Can you confirm it?
> 
> Also, can you provide the indices that Linux considers buggy?
> 
> Lastly, it seems like the barrier used are incorrect. It should be the
> virt_*() version rather than a plain mb()/wmb(). I don't think it matter for
> arm64 though (I am assuming you are not running 32-bit).
> 
> > [   59.399620] xenbus: error -5 while reading message
> 
> So this message is coming from the xenbus driver (used to read the xenstore
> ring). This is -EIO, and AFAICT returned when the indices are also incorrect.
> 
> For this driver, I think there is also a TOCTOU because a compiler is free to
> reload intf->rsp_cons after the check. Moving virt_mb() is probably not
> sufficient. You would also want to use ACCESS_ONCE().
> 
> What I find odd is you have two distinct rings (xenconsole and xenbus) with
> similar issues. Above, you said you are using Linux RT. I wonder if this has a
> play into the issue because if I am not mistaken, the two functions would now
> be fully preemptible.
> 
> This could expose some races. For instance, there are some missing
> ACCESS_ONCE() (as mentioned above).
> 
> In particular, Xenstored (I haven't checked xenconsoled) is using += to update
> intf->rsp_cons. There is no guarantee that the update will be atomic.
> 
> Overall, I am not 100% sure what I wrote is related. But that's probably a
> good start of things that can be exacerbated with Linux RT.
> 
> > [   59.399649] xenbus: error -5 while writing message
> 
> This is in xenbus as well. But this time in the write part. The analysis I
> wrote above for the read part can be applied here.

This is really strange. What is also strange is that somehow the indexes
recover after 10-15 seconds? How is that even possible. Let's say there
is a memory corruption of some sort, maybe due to missing barriers like
Julien suggested, how can it go back to normal after a while?

I am really confused. I would try with regular Linux instead of Linux RT
and also would try to replace all the barriers in
drivers/tty/hvc/hvc_xen.c with their virt_* version to see if we can
narrow down the problem a bit.


Keep in mind that during PV network operations grants are used, which
involve mapping pages at the backend and changing the MMU/IOMMU
pagetables to introduce the new mapping. After the DMA operation,
typically the page is unmapped and removed from the pagetable.

Is it possible that the pagetable change is causing the problem, and
when the mapping is removed everything goes back to normal?

I don't know how that could happen, but the mapping and unmapping of the
page is something ongoing which could break things then go back to
normal. One thing you could try is to force all DMA operations to go via
swiotlb-xen in Linux:

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 3d826c0b5fee..f78d86f1bb9c 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -112,8 +112,7 @@ bool xen_arch_need_swiotlb(struct device *dev,
         * require a bounce buffer because the device doesn't support coherent
         * memory and we are not able to flush the cache.
         */
-       return (!hypercall_cflush && (xen_pfn != bfn) &&
-               !dev_is_dma_coherent(dev));
+       return true;
 }
 
 static int __init xen_mm_init(void)


Then you can remove any iommu pagetable flushes in Xen:


diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index d3c518a926..b72f8391bd 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -74,7 +74,7 @@ int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
     page_get_xenheap_gfn(gnttab_status_page(t, i))
 
 #define gnttab_need_iommu_mapping(d)                    \
-    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
+    (0)
 
 #endif /* __ASM_GRANT_TABLE_H__ */
 /*


I don't know how this could be related but it might help narrow down the
problem.

