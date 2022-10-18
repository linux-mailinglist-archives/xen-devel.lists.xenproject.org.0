Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCDC601F93
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 02:29:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424657.672251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okaSv-0007Pl-EJ; Tue, 18 Oct 2022 00:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424657.672251; Tue, 18 Oct 2022 00:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okaSv-0007Mv-Ae; Tue, 18 Oct 2022 00:28:17 +0000
Received: by outflank-mailman (input) for mailman id 424657;
 Tue, 18 Oct 2022 00:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9K0G=2T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1okaSt-0007Mp-0x
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 00:28:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id beafca98-4e7b-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 02:28:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2028E611EB;
 Tue, 18 Oct 2022 00:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979B1C433B5;
 Tue, 18 Oct 2022 00:28:08 +0000 (UTC)
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
X-Inumbo-ID: beafca98-4e7b-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666052889;
	bh=64+ZmKFNnh5ijUTvPl/3DoDnfk2wOm0SWdujOej0lZk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KreqRGzzndTizzKF2t/8EzxTWTmjOfeccgDxKTiMeMRqvt6Lqdhx+Xh9+t1sF7gmO
	 hbVwvxWH6WV/FJjt/rqVZpbFuJOegQc2wuN46ckDlkFJVWpx64Nr4sniBtxtBl9RBO
	 6NiP3QcKbyYQKvEcaCH7VOybdDrTnzI//AFsJOUnslwP6q59ghw2t9a0XDGekignTL
	 ve9DMZOBtGWRylkL8e9BPxQnTHqL/+W3GkhS7sw3OAihHuuo/pul2hyr+R0cLxTX3T
	 YuAJueHEWZAxkuflEeMF+AL6+N5XZJCzfGJMLzZagPUxrANbZIKa06ZQoeWHsa0ny7
	 FiXL4ZK2HX1bg==
Date: Mon, 17 Oct 2022 17:28:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, 
    jbeulich@suse.com, xen-devel@lists.xenproject.org, 
    JESHWANTHKUMAR.NK@amd.com
Subject: Re: privcmd.c not calling set_phys_to_machine
In-Reply-To: <4907e079-0001-dbc6-dbfc-ee737882fc4c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2210171701460.4587@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2210141341120.3690179@ubuntu-linux-20-04-desktop> <4907e079-0001-dbc6-dbfc-ee737882fc4c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Oct 2022, Juergen Gross wrote:
> On 14.10.22 23:04, Stefano Stabellini wrote:
> > Hi Juergen and all,
> > 
> > I am writing again to ask a question about privcmd.c in PV dom0 x86.
> > This is related to the previous pin_user_pages_fast issue:
> > 
> > https://marc.info/?l=xen-devel&m=166268914727630
> > https://marc.info/?l=xen-devel&m=166322385912052
> > 
> > 
> > In summary this is the situation:
> > 
> > 1. domU (HVM) kernel space:
> >      a. pages allocation with get_free_pages()
> >      b. get dma_handle by calling dma_map_page() on the pages allocated in
> > (1.a)
> >      c. send dma_handle to dom0 (PV) using virtio queue
> > 
> > 2. dom0 userspace (QEMU):
> >          a. read dma_handle from virtio queue
> >          b. map dma_handle using QEMU dma_memory_map(), which calls
> >             xenforeignmemory_map2, which is IOCTL_PRIVCMD_MMAPBATCH_V2,
> >             which ends up calling
> > drivers/xen/privcmd.c:privcmd_ioctl_mmap_batch
> >             [this is verified to work correctly, the mapping works]
> >          c. open /dev/tee node and make an ioctl call to register the
> >             virtual address (from step 2.b) with TEE.
> > 
> > 3. dom0 kernel space:
> >          a. AMD TEE driver get the virtual address passed by userspace
> >          b. AMD TEE driver get the list of pages corresponding to the
> >             virtual address (3.a) and calls dma_map_page() on them
> 
> I'm rather sure "AMD TEE driver get the list of pages corresponding to the
> virtual address" is the problem. The PTEs should have the "special" flag
> set, meaning that there is no struct page associated with this virtual area.
> 
> > The last step (3.b) misbehaves as dev_addr at the beginning of
> > xen_swiotlb_map_page (which implements dma_map_page() in dom)) is 0.
> > 
> >    dma_addr_t dev_addr = xen_phys_to_dma(dev, phys);
> >    /* dev_addr here is zero */
> > 
> > 
> > Could it be that the original mapping of the foreign pages in Dom0, done
> > by step 2.b, is not complete? Looking into
> > privcmd_ioctl_mmap_batch, for PV guests, it is calling mmap_batch_fn:
> > 
> > 	BUG_ON(traverse_pages_block(m.num, sizeof(xen_pfn_t),
> > 				    &pagelist, mmap_batch_fn, &state));
> > 
> > mmap_batch_fn calls xen_remap_domain_gfn_array, which calls
> > xen_remap_pfn.
> > 
> > xen_remap_pfn only changes the VA->PA mapping and does nothing else.
> > Specifically, nobody seems to call set_phys_to_machine in this code
> > path. Isn't set_phys_to_machine required?
> 
> Not for special memory pages.
> 
> > Don't we need a call to set_phys_to_machine so that the next time a
> > driver tries to call:
> > 
> >    /* address is the virtual address passed by QEMU userspace */
> >    dma_map_page(virt_to_page(address))
> > 
> > it will behave correctly? Or am I missing something?
> > 
> > 
> > How is xen_phys_to_dma expected to work correctly for:
> > 
> >    /* address is the virtual address passed by QEMU userspace and mapped
> >     * in 2.b */
> >    phys_addr = virt_to_phys(address);
> >    xen_phys_to_dma(dev, phys_addr);
> > 
> > 
> > My guess would be that we need to add:
> > 
> >    set_phys_to_machine(pfn, FOREIGN_FRAME(mfn));
> > 
> > in mmap_batch_fn or xen_remap_pfn?
> 
> I think this might be a little bit more complicated.
> 
> This could work, if there is really a struct page available for the PFN.
> OTOH this might be not the case quite often, as we are using zone device
> memory for foreign mappings per default for some time now.
> 
> Solving this might require something like dma_map_pfn() instead of
> dma_map_page(), which sounds a little bit like dma_direct_mmap().

It is actually dma_mmap_attrs and looking at its description it would
have to be step 2.b to call dma_mmap_attrs instead of
xen_remap_domain_gfn_array? Also, we would need an implementation of
.mmap in xen_swiotlb_dma_ops.


I think that's fine but I am not clear on how to implement
xen_swiotlb_dma_ops.mmap for PV guests. I can imagine that on HVM/PVH it
would just be similar to xen_xlate_remap_gfn_array. How do you see it
implemented for PV?


