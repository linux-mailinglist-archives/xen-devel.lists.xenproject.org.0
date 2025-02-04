Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58699A27CF6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 21:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881864.1292031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfPzH-0002uQ-0I; Tue, 04 Feb 2025 20:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881864.1292031; Tue, 04 Feb 2025 20:57:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfPzG-0002sJ-Ty; Tue, 04 Feb 2025 20:57:38 +0000
Received: by outflank-mailman (input) for mailman id 881864;
 Tue, 04 Feb 2025 20:57:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=84UU=U3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tfPzF-0002sB-9I
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 20:57:37 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8651530-e33a-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 21:57:35 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DEF975C6A7B;
 Tue,  4 Feb 2025 20:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E00C4CEDF;
 Tue,  4 Feb 2025 20:57:32 +0000 (UTC)
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
X-Inumbo-ID: a8651530-e33a-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738702653;
	bh=le3d9xqWZqvbh0JlZJTPd6ReV8htkYjz699I+f8UycA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F02Bv6WJJFdw6qngjbbY3qbgwt2DCZk1ORPGJc6WC98FAv47SZLtEQJu60XL/BUnA
	 QrJDqnyVs8xYSJCywhJplWcdjhxDvEkEcV7ZAHei0oAKJiiXuBAX9X+BfXCC4cVX/e
	 YZunJvDB57oPX4KAcrus8QV0MsHbG5LCXWOpeH4L4xyZqbZuadq3MdUpJVPFnxj+PD
	 5X8TuDTBM0do4LWQuYfAjd3YSIuQzT+5DLdqCthNvGfj6xWfC5nFEeWf5bQEYoZNiQ
	 lNoQY/hNqsTtH8FOUMl/ztLDmpsmwoc++4JnBtXvKdTEZxKCtDkQJExKojhUM61SZ4
	 datBk6wNgZfzQ==
Date: Tue, 4 Feb 2025 12:57:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Teddy Astie <teddy.astie@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [XEN RFC PATCH v5 3/5] xen/public: Introduce PV-IOMMU hypercall
 interface
In-Reply-To: <CAJ=z9a0DxkmeQU4U1sHnqCohrgVBjSOzs=u-x0E_QWAB36yV7w@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2502041252550.9756@ubuntu-linux-20-04-desktop>
References: <cover.1737470269.git.teddy.astie@vates.tech> <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech> <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com> <c4351594-e394-4949-8dd1-20cce54ec192@vates.tech>
 <alpine.DEB.2.22.394.2502030939470.11632@ubuntu-linux-20-04-desktop> <07423892-7f23-4e57-b1e9-4ef0fe45d6bc@vates.tech> <CAJ=z9a0DxkmeQU4U1sHnqCohrgVBjSOzs=u-x0E_QWAB36yV7w@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-222317454-1738702653=:9756"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-222317454-1738702653=:9756
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 4 Feb 2025, Julien Grall wrote:
> On Tue, 4 Feb 2025 at 11:46, Teddy Astie <teddy.astie@vates.tech> wrote:
>       If the hardware supports it, there is a alternative (still being
>       drafted) interface to allow the guest to directly provide native pagetables.
> 
>       This is exposed through the "_nested" subcommands, there is no
>       implementation of this feature in this patch series yet.
> 
> 
> Out of interest, if the HW support two stage translations, then why do we need a PV interface? Wouldn’t it be better to exposed an emulated
> iommu? This would reduce the amount of enlightenment required in the guest OS. In the long run, this would provide some better performance
>  because some IOMMU HW can now accelerate TLB flush commands (among other things). For instance, see the NVIDIA vIOMMU.

Hi Julien, I am not Teddy, but I have been considering the same
question, and here are the conclusions I reached.  

A virtual IOMMU of the same type as the underlying IOMMU provides better
operating system compatibility, particularly for running non-Linux OSes
such as Windows.  

On the other hand, a PV IOMMU should be faster to develop because there
is no need to emulate a hardware interface. Additionally, a single PV
IOMMU implementation could support multiple underlying hardware IOMMUs.
Specifically, it could be used for both Intel and AMD platforms.



> 
>       /**
>         * IOMMU_alloc_nested
>         * Create a nested IOMMU context (needs IOMMUCAP_nested).
>         *
>         * This context uses a platform-specific page table from domain address
>       space
>         * specified in pgtable_gfn and use it for nested translations.
>         *
>         * Explicit flushes needs to be submited with IOMMU_flush_nested on
>         * modification of the nested pagetable to ensure coherency between
>       IOTLB and
>         * nested page table.
>         *
>         * This context can be destroyed using IOMMU_free_context.
>         * This context cannot be modified using map_pages, unmap_pages.
>         */
>       struct pv_iommu_alloc_nested {
>            /* OUT: allocated IOMMU context number */
>            uint16_t ctx_no;
> 
>            /* IN: guest frame number of the nested page table */
>            uint64_aligned_t pgtable_gfn;
> 
>            /* IN: nested mode flags */
>            uint64_aligned_t nested_flags;
>       };
>       typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
>       DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
> 
>       /**
>         * IOMMU_flush_nested (needs IOMMUCAP_nested)
>         * Flush the IOTLB for nested translation.
>         */
>       struct pv_iommu_flush_nested {
>            /* TODO */
>       };
>       typedef struct pv_iommu_flush_nested pv_iommu_flush_nested_t;
>       DEFINE_XEN_GUEST_HANDLE(pv_iommu_flush_nested_t);
> 
> 
>       >
>       >
>       >
>       >> [1] Originally
>       >> https://lists.xen.org/archives/html/xen-devel/2024-06/msg01145.html but
>       >> this patch got quite old and probably doesn't work anymore with this new
>       >> Xen patch series.
>       >> I have a updated patch in my xen-pviommu branch
>       >> https://gitlab.com/xen-project/people/tsnake41/linux/-/commit/125d67a09fa9f66a32f9175641cfccca22dbbdb6
>       >>
>       >> [2] You also need to set "vfio_iommu_type1.allow_unsafe_interrupts=1" to
>       >> make VFIO work for now.
> 
>       Thanks
>       Teddy
> 
> 
> 
>       Teddy Astie | Vates XCP-ng Developer
> 
>       XCP-ng & Xen Orchestra - Vates solutions
> 
>       web: https://vates.tech
> 
> 
> 
--8323329-222317454-1738702653=:9756--

