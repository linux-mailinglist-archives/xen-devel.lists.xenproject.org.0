Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3775FF4FA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 23:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423142.669634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojRqx-0004lx-8m; Fri, 14 Oct 2022 21:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423142.669634; Fri, 14 Oct 2022 21:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojRqx-0004ib-5f; Fri, 14 Oct 2022 21:04:23 +0000
Received: by outflank-mailman (input) for mailman id 423142;
 Fri, 14 Oct 2022 21:04:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cdf0=2P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ojRqu-0004iV-Pk
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 21:04:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c479d68c-4c03-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 23:04:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF82A61C4E;
 Fri, 14 Oct 2022 21:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD77C433C1;
 Fri, 14 Oct 2022 21:04:16 +0000 (UTC)
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
X-Inumbo-ID: c479d68c-4c03-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665781457;
	bh=1ZrwVK602de+t7ntxwWXDkV4lHPteu8Ep7nu8tc5WHg=;
	h=Date:From:To:cc:Subject:From;
	b=Fze4aERgwE32h5auE1NygK3vuEGxYTRGPJ0w51tDhxgooqN1qLddmZcf5WCRVh+V7
	 QE71eljzumYdpyT1uzaf6gEG4M0fNkMtMMPT4EicrlT7CwPUo6McODBETDjL062MTm
	 6iUCgoePFcDeTdR0v4kgjutuiPp9NKool4WQckdvqcPOElFWNsbV7ghjv1/iv0/hO4
	 5qxrCOqpv9IAqxcUstqwysb3nUfpO5yilFsfmZn68BaftKdTrkMS/NveiGlYBmsmlH
	 bQoILR8fv8ce5/XtPrzb78GtPm+aNoImIoiLxlKZ51afD6Y3qhXxToxiLrI27u3F85
	 IrOUwGuS0gRNA==
Date: Fri, 14 Oct 2022 14:04:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jgross@suse.com, boris.ostrovsky@oracle.com
cc: sstabellini@kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, 
    JESHWANTHKUMAR.NK@amd.com
Subject: privcmd.c not calling set_phys_to_machine
Message-ID: <alpine.DEB.2.22.394.2210141341120.3690179@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Juergen and all,

I am writing again to ask a question about privcmd.c in PV dom0 x86.
This is related to the previous pin_user_pages_fast issue:

https://marc.info/?l=xen-devel&m=166268914727630
https://marc.info/?l=xen-devel&m=166322385912052


In summary this is the situation:

1. domU (HVM) kernel space:
    a. pages allocation with get_free_pages()
    b. get dma_handle by calling dma_map_page() on the pages allocated in (1.a)
    c. send dma_handle to dom0 (PV) using virtio queue

2. dom0 userspace (QEMU):
        a. read dma_handle from virtio queue
        b. map dma_handle using QEMU dma_memory_map(), which calls
           xenforeignmemory_map2, which is IOCTL_PRIVCMD_MMAPBATCH_V2,
           which ends up calling drivers/xen/privcmd.c:privcmd_ioctl_mmap_batch
           [this is verified to work correctly, the mapping works]
        c. open /dev/tee node and make an ioctl call to register the
           virtual address (from step 2.b) with TEE.

3. dom0 kernel space:
        a. AMD TEE driver get the virtual address passed by userspace
        b. AMD TEE driver get the list of pages corresponding to the
           virtual address (3.a) and calls dma_map_page() on them

The last step (3.b) misbehaves as dev_addr at the beginning of
xen_swiotlb_map_page (which implements dma_map_page() in dom)) is 0.

  dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
  /* dev_addr here is zero */


Could it be that the original mapping of the foreign pages in Dom0, done
by step 2.b, is not complete? Looking into
privcmd_ioctl_mmap_batch, for PV guests, it is calling mmap_batch_fn:

	BUG_ON(traverse_pages_block(m.num, sizeof(xen_pfn_t),
				    &pagelist, mmap_batch_fn, &state));

mmap_batch_fn calls xen_remap_domain_gfn_array, which calls
xen_remap_pfn.

xen_remap_pfn only changes the VA->PA mapping and does nothing else.
Specifically, nobody seems to call set_phys_to_machine in this code
path. Isn't set_phys_to_machine required?

Don't we need a call to set_phys_to_machine so that the next time a
driver tries to call:

  /* address is the virtual address passed by QEMU userspace */
  dma_map_page(virt_to_page(address))

it will behave correctly? Or am I missing something?


How is xen_phys_to_dma expected to work correctly for:

  /* address is the virtual address passed by QEMU userspace and mapped
   * in 2.b */
  phys_addr = virt_to_phys(address);
  xen_phys_to_dma(dev, phys_addr);


My guess would be that we need to add:

  set_phys_to_machine(pfn, FOREIGN_FRAME(mfn));

in mmap_batch_fn or xen_remap_pfn?

Thanks for any help or suggestions.

Cheers,

Stefano

