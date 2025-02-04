Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D1A27FC1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 00:42:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881912.1292082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfSXz-0008IZ-Sw; Tue, 04 Feb 2025 23:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881912.1292082; Tue, 04 Feb 2025 23:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfSXz-0008Gn-Pr; Tue, 04 Feb 2025 23:41:39 +0000
Received: by outflank-mailman (input) for mailman id 881912;
 Tue, 04 Feb 2025 23:41:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=84UU=U3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tfSXy-0008Gh-8G
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 23:41:38 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90d72f09-e351-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 00:41:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C7350A420A2;
 Tue,  4 Feb 2025 23:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F34FC4CEDF;
 Tue,  4 Feb 2025 23:41:30 +0000 (UTC)
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
X-Inumbo-ID: 90d72f09-e351-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738712492;
	bh=J5azUgl5Kb0K4fci+mEceLBvniQZIxv9LM7EERGATE0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sacyHI9RADXPBZXtVZJiSXGPblfXBrh0sbdBI0spYuM+a3cNCFBaKs3izPTHG46IR
	 kKxFlXzan/jrE/P7722jPO0XFkghwUBelY4pv34N/8qWQawsXwy0PuuLM02KIBEcsH
	 sw+5S/Vgdb1BLCTk2bTWUUUHP251NhWdw6q3lngHfxqXi8rfNpStu46TVQi3nctWGx
	 RCFgFhGJLAtYV6Af56fQ5/zDTNJYKY2x+Pbq7f8RniANzffgJEJYUC2355UWqNOF3u
	 83U8jD/hu7xgBryryWMTjNhMXIp/RqLMIJSCCjb1eSaOc3qSBufs8rKHqoWXxVOvOh
	 3s8V75GhoMTew==
Date: Tue, 4 Feb 2025 15:41:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Teddy Astie <teddy.astie@vates.tech>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Yi.Wang2@amd.com, lizhi.hou@amd.com, AnuragKumar.Vulisha@amd.com
Subject: Re: [XEN RFC PATCH v5 3/5] xen/public: Introduce PV-IOMMU hypercall
 interface
In-Reply-To: <07423892-7f23-4e57-b1e9-4ef0fe45d6bc@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2502041538070.9756@ubuntu-linux-20-04-desktop>
References: <cover.1737470269.git.teddy.astie@vates.tech> <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech> <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com> <c4351594-e394-4949-8dd1-20cce54ec192@vates.tech>
 <alpine.DEB.2.22.394.2502030939470.11632@ubuntu-linux-20-04-desktop> <07423892-7f23-4e57-b1e9-4ef0fe45d6bc@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1773829799-1738712454=:9756"
Content-ID: <alpine.DEB.2.22.394.2502041541100.9756@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1773829799-1738712454=:9756
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2502041541101.9756@ubuntu-linux-20-04-desktop>

On Tue, 4 Feb 2025, Teddy Astie wrote:
> Hello Stefano,
> 
> Le 03/02/2025 à 18:47, Stefano Stabellini a écrit :
> > On Mon, 3 Feb 2025, Teddy Astie wrote:
> >> Hello Jason,
> >>
> >> Le 30/01/2025 à 21:17, Jason Andryuk a écrit :
> >>> Hi Teddy,
> >>>
> >>> Thanks for working on this.  I'm curious about your plans for this:
> >>>
> >>> On 2025-01-21 11:13, Teddy Astie wrote:
> >>>> +/**
> >>>> + * IOMMU_alloc_nested
> >>>> + * Create a nested IOMMU context (needs IOMMUCAP_nested).
> >>>> + *
> >>>> + * This context uses a platform-specific page table from domain
> >>>> address space
> >>>> + * specified in pgtable_gfn and use it for nested translations.
> >>>> + *
> >>>> + * Explicit flushes needs to be submited with IOMMU_flush_nested on
> >>>> + * modification of the nested pagetable to ensure coherency between
> >>>> IOTLB and
> >>>> + * nested page table.
> >>>> + *
> >>>> + * This context can be destroyed using IOMMU_free_context.
> >>>> + * This context cannot be modified using map_pages, unmap_pages.
> >>>> + */
> >>>> +struct pv_iommu_alloc_nested {
> >>>> +    /* OUT: allocated IOMMU context number */
> >>>> +    uint16_t ctx_no;
> >>>> +
> >>>> +    /* IN: guest frame number of the nested page table */
> >>>> +    uint64_aligned_t pgtable_gfn;
> >>>> +
> >>>> +    /* IN: nested mode flags */
> >>>> +    uint64_aligned_t nested_flags;
> >>>> +};
> >>>> +typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
> >>>> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
> >>>
> >>> Is this command intended to be used for GVA -> GPA translation?  Would
> >>> you need some way to associate with another iommu context for GPA -> HPA
> >>> translation?
> >>>
> >>
> >> It's intended to be used for accelerating IOMMU emulation for the guest.
> >> So in this case the other GPA->HPA translation is domain's p2m
> >> page-table (or something similar) such as the translations made from
> >> this nested context is meaningful from guest point of view.
> >>
> >> The idea to use it is to use the "remote_op" sub-command to let the
> >> device model (e.g QEMU) alter the IOMMU behavior for the affected domain
> >> (e.g by reattaching devices, making new IOMMU contexts, ...).
> >>
> >> I think it can also be used for virtio-iommu pagetable.
> >>
> >>> Maybe more broadly, what are your goals for enabling PV-IOMMU?  The
> >>> examples on your blog post cover a domain restrict device access to
> >>> specific portions of the the GPA space.  Are you also interested in GVA
> >>> -> GPA?  Does VFIO required GVA -> GPA?
> >>>
> >>
> >> The current way of enabling and using PV-IOMMU is with the dedicated
> >> Linux IOMMU driver [1] that implements Linux's IOMMU subsystem with this
> >> proposed interface.
> >> This in practice in the PV case replaces the xen-swiotlb with dma-iommu
> >> and do all DMA through the paravirtualized IOMMU (e.g creating DMA
> >> domains, moving devices to it).
> >>
> >> Regarding GVA->GPA, this is what this interface provides, and
> >> restricting device access to memory is one way of using it. This is a
> >> requirement for VFIO (as it is also one for Linux IOMMU), and I managed
> >> to make SPDK and DPDK work in Dom0 using VFIO and these patches [2].
> >
> > Thanks for the explanation, Teddy. It certainly seems that this work is
> > moving in the right direction. However, I have a couple of questions on
> > this point, as I admit that I have not fully understood it.
> >
> > Modern IOMMUs support two stages of translation. Using ARM terminology,
> > these are referred to as stage2 and stage1. The stage2 translation is
> > used by Xen for the domain's GPA->PA (p2m) mapping. The pagetable used
> > for stage2 could potentially be shared with the pagetable used by Xen
> > for the p2m. Stage1 is typically controlled by the guest for its own
> > address translations, mapping guest virtual addresses (GVA) to guest
> > physical addresses (GPA).
> >
> > I can see that this patch series introduces an interface that allows
> > Dom0 to modify its own stage2 mappings.
> >
> > My question is: how do we allow the domain to also set up stage1
> > mappings? I would assume that the interface would take the form of a
> > hypercall that allows a domain to pass a stage1 pagetable pointer, which
> > Xen would then use to configure the IOMMU stage1. However, I do not see
> > such a hypercall in your series. I was under the impression that
> > GVA-to-GPA translation was left as future work, so I am confused by your
> > statement that this patch series already provides it.
> >
> 
> There are 2 interfaces for the guest (and device model) to configure its
> GVA-to-GPA mappings. There are map/unmap subcommands and (depending on
> hardware support) nested iommu contexts where the guest/device model
> provides the GPA of the stage1 pagetable (this is meant to be a way of
> accelerating IOMMU emulation through QEMU).
> 
> Here is the hypercall subcommands for map/unmap where you can map and
> unmap pages to the "paravirtualized IOMMU context" (making the mapped
> region visible to devices of the context attached through reattach_device).
> 
> /**
>   * IOMMU_map_pages
>   * Map pages on a IOMMU context.
>   *
>   * pgsize must be supported by pgsize_mask.
>   * Fails with -EINVAL if mapping on top of another mapping.
>   * Report actually mapped page count in mapped field (regardless of
> failure).
>   */
> struct pv_iommu_map_pages {
>      /* IN: IOMMU context number */
>      uint16_t ctx_no;
> 
>      /* IN: Guest frame number */
>      uint64_aligned_t gfn;
> 
>      /* IN: Device frame number */
>      uint64_aligned_t dfn;
> 
>      /* IN: Map flags */
>      uint32_t map_flags;
> 
>      /* IN: Size of pages to map */
>      uint32_t pgsize;
> 
>      /* IN: Number of pages to map */
>      uint32_t nr_pages;
> 
>      /* OUT: Number of pages actually mapped */
>      uint32_t mapped;
> };
> typedef struct pv_iommu_map_pages pv_iommu_map_pages_t;
> DEFINE_XEN_GUEST_HANDLE(pv_iommu_map_pages_t);
> 
> /**
>   * IOMMU_unmap_pages
>   * Unmap pages on a IOMMU context.
>   *
>   * pgsize must be supported by pgsize_mask.
>   * Report actually unmapped page count in mapped field (regardless of
> failure).
>   * Fails with -ENOENT when attempting to unmap a page without any mapping
>   */
> struct pv_iommu_unmap_pages {
>      /* IN: IOMMU context number */
>      uint16_t ctx_no;
> 
>      /* IN: Device frame number */
>      uint64_aligned_t dfn;
> 
>      /* IN: Size of pages to unmap */
>      uint32_t pgsize;
> 
>      /* IN: Number of pages to unmap */
>      uint32_t nr_pages;
> 
>      /* OUT: Number of pages actually unmapped */
>      uint32_t unmapped;
> };
> typedef struct pv_iommu_unmap_pages pv_iommu_unmap_pages_t;
> DEFINE_XEN_GUEST_HANDLE(pv_iommu_unmap_pages_t);
> 
> If the hardware supports it, there is a alternative (still being
> drafted) interface to allow the guest to directly provide native pagetables.

OK, this is the important one. I am glad you already thought about it.
If possible, I would suggest to have a rough PoC in place just to prove
that the interface would work for the intended usecase.

For interfaces, sometimes it is hard to spot if there are any issues
during review, so having a barebone PoC to validate the concept would be
ideal.

Thanks for your work on this.



> This is exposed through the "_nested" subcommands, there is no
> implementation of this feature in this patch series yet.
> 
> /**
>   * IOMMU_alloc_nested
>   * Create a nested IOMMU context (needs IOMMUCAP_nested).
>   *
>   * This context uses a platform-specific page table from domain address
> space
>   * specified in pgtable_gfn and use it for nested translations.
>   *
>   * Explicit flushes needs to be submited with IOMMU_flush_nested on
>   * modification of the nested pagetable to ensure coherency between
> IOTLB and
>   * nested page table.
>   *
>   * This context can be destroyed using IOMMU_free_context.
>   * This context cannot be modified using map_pages, unmap_pages.
>   */
> struct pv_iommu_alloc_nested {
>      /* OUT: allocated IOMMU context number */
>      uint16_t ctx_no;
> 
>      /* IN: guest frame number of the nested page table */
>      uint64_aligned_t pgtable_gfn;
> 
>      /* IN: nested mode flags */
>      uint64_aligned_t nested_flags;
> };
> typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
> DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
> 
> /**
>   * IOMMU_flush_nested (needs IOMMUCAP_nested)
>   * Flush the IOTLB for nested translation.
>   */
> struct pv_iommu_flush_nested {
>      /* TODO */
> };
> typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;
> DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_nested_t);
> 
> 
> >
> >
> >
> >> [1] Originally
> >> https://lists.xen.org/archives/html/xen-devel/2024-06/msg01145.html but
> >> this patch got quite old and probably doesn't work anymore with this new
> >> Xen patch series.
> >> I have a updated patch in my xen-pviommu branch
> >> https://gitlab.com/xen-project/people/tsnake41/linux/-/commit/125d67a09fa9f66a32f9175641cfccca22dbbdb6
> >>
> >> [2] You also need to set "vfio_iommu_type1.allow_unsafe_interrupts=1" to
> >> make VFIO work for now.
> 
> Thanks
> Teddy
> 
> 
> 
> Teddy Astie | Vates XCP-ng Developer
> 
> XCP-ng & Xen Orchestra - Vates solutions
> 
> web: https://vates.tech
> 
--8323329-1773829799-1738712454=:9756--

