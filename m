Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7978A261B0
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 18:48:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880971.1291076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf0Y0-0004tc-1n; Mon, 03 Feb 2025 17:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880971.1291076; Mon, 03 Feb 2025 17:47:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf0Xz-0004rl-Uv; Mon, 03 Feb 2025 17:47:47 +0000
Received: by outflank-mailman (input) for mailman id 880971;
 Mon, 03 Feb 2025 17:47:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ijIa=U2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tf0Xy-0004rf-Ax
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 17:47:46 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f88b3080-e256-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 18:47:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C04CFA41092;
 Mon,  3 Feb 2025 17:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9D2C4CED2;
 Mon,  3 Feb 2025 17:47:41 +0000 (UTC)
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
X-Inumbo-ID: f88b3080-e256-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738604862;
	bh=7WL8nIF4vdrs4UDYyXCC1xRqNBjsZui1qVr2yii5UTY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IZ6UO6hTN3NOrRNUlExS2ACuSVo+TzEWVHm0EMCaMKC3BYc11cgOII0hRcZ5YwuGE
	 q7Av/Gvm1neS/nHl8ALmYg21FDXI0KMY71jZ+0Dn4ZS8J3MgtRFt8erqR819evJNCf
	 dSR3pY0ryPgtrtmQpaLTBY6P1UEPpWaGv67TNiXKXcf3xUQkfHo/caWHLIxi+liYzo
	 +4ct+Ryc+nBg6tWAuCvewfSuodpkCNZwss4OsR2EOE8eQhJKAqKMr7jNIxI0paWIJ8
	 BdH5BDkewtzHLU3GLhIW/74QpT+tHSe6tR4bxkzHPCdA3CMQPw7LUfIhEJUtywUBWu
	 8x7xn9Uw/uuhA==
Date: Mon, 3 Feb 2025 09:47:40 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Teddy Astie <teddy.astie@vates.tech>
cc: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [XEN RFC PATCH v5 3/5] xen/public: Introduce PV-IOMMU hypercall
 interface
In-Reply-To: <c4351594-e394-4949-8dd1-20cce54ec192@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2502030939470.11632@ubuntu-linux-20-04-desktop>
References: <cover.1737470269.git.teddy.astie@vates.tech> <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech> <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com> <c4351594-e394-4949-8dd1-20cce54ec192@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-33913578-1738604862=:11632"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-33913578-1738604862=:11632
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 3 Feb 2025, Teddy Astie wrote:
> Hello Jason,
> 
> Le 30/01/2025 à 21:17, Jason Andryuk a écrit :
> > Hi Teddy,
> >
> > Thanks for working on this.  I'm curious about your plans for this:
> >
> > On 2025-01-21 11:13, Teddy Astie wrote:
> >> +/**
> >> + * IOMMU_alloc_nested
> >> + * Create a nested IOMMU context (needs IOMMUCAP_nested).
> >> + *
> >> + * This context uses a platform-specific page table from domain
> >> address space
> >> + * specified in pgtable_gfn and use it for nested translations.
> >> + *
> >> + * Explicit flushes needs to be submited with IOMMU_flush_nested on
> >> + * modification of the nested pagetable to ensure coherency between
> >> IOTLB and
> >> + * nested page table.
> >> + *
> >> + * This context can be destroyed using IOMMU_free_context.
> >> + * This context cannot be modified using map_pages, unmap_pages.
> >> + */
> >> +struct pv_iommu_alloc_nested {
> >> +    /* OUT: allocated IOMMU context number */
> >> +    uint16_t ctx_no;
> >> +
> >> +    /* IN: guest frame number of the nested page table */
> >> +    uint64_aligned_t pgtable_gfn;
> >> +
> >> +    /* IN: nested mode flags */
> >> +    uint64_aligned_t nested_flags;
> >> +};
> >> +typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
> >> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
> >
> > Is this command intended to be used for GVA -> GPA translation?  Would
> > you need some way to associate with another iommu context for GPA -> HPA
> > translation?
> >
> 
> It's intended to be used for accelerating IOMMU emulation for the guest.
> So in this case the other GPA->HPA translation is domain's p2m
> page-table (or something similar) such as the translations made from
> this nested context is meaningful from guest point of view.
> 
> The idea to use it is to use the "remote_op" sub-command to let the
> device model (e.g QEMU) alter the IOMMU behavior for the affected domain
> (e.g by reattaching devices, making new IOMMU contexts, ...).
> 
> I think it can also be used for virtio-iommu pagetable.
> 
> > Maybe more broadly, what are your goals for enabling PV-IOMMU?  The
> > examples on your blog post cover a domain restrict device access to
> > specific portions of the the GPA space.  Are you also interested in GVA
> > -> GPA?  Does VFIO required GVA -> GPA?
> >
> 
> The current way of enabling and using PV-IOMMU is with the dedicated
> Linux IOMMU driver [1] that implements Linux's IOMMU subsystem with this
> proposed interface.
> This in practice in the PV case replaces the xen-swiotlb with dma-iommu
> and do all DMA through the paravirtualized IOMMU (e.g creating DMA
> domains, moving devices to it).
> 
> Regarding GVA->GPA, this is what this interface provides, and
> restricting device access to memory is one way of using it. This is a
> requirement for VFIO (as it is also one for Linux IOMMU), and I managed
> to make SPDK and DPDK work in Dom0 using VFIO and these patches [2].

Thanks for the explanation, Teddy. It certainly seems that this work is
moving in the right direction. However, I have a couple of questions on
this point, as I admit that I have not fully understood it.  

Modern IOMMUs support two stages of translation. Using ARM terminology,
these are referred to as stage2 and stage1. The stage2 translation is
used by Xen for the domain's GPA->PA (p2m) mapping. The pagetable used
for stage2 could potentially be shared with the pagetable used by Xen
for the p2m. Stage1 is typically controlled by the guest for its own
address translations, mapping guest virtual addresses (GVA) to guest
physical addresses (GPA).  

I can see that this patch series introduces an interface that allows
Dom0 to modify its own stage2 mappings.  

My question is: how do we allow the domain to also set up stage1
mappings? I would assume that the interface would take the form of a
hypercall that allows a domain to pass a stage1 pagetable pointer, which
Xen would then use to configure the IOMMU stage1. However, I do not see
such a hypercall in your series. I was under the impression that
GVA-to-GPA translation was left as future work, so I am confused by your
statement that this patch series already provides it.  




> [1] Originally
> https://lists.xen.org/archives/html/xen-devel/2024-06/msg01145.html but
> this patch got quite old and probably doesn't work anymore with this new
> Xen patch series.
> I have a updated patch in my xen-pviommu branch
> https://gitlab.com/xen-project/people/tsnake41/linux/-/commit/125d67a09fa9f66a32f9175641cfccca22dbbdb6
> 
> [2] You also need to set "vfio_iommu_type1.allow_unsafe_interrupts=1" to
> make VFIO work for now.
--8323329-33913578-1738604862=:11632--

