Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72456AA9AC8
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 19:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976195.1363404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBzjI-0000v4-CS; Mon, 05 May 2025 17:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976195.1363404; Mon, 05 May 2025 17:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBzjI-0000ss-9I; Mon, 05 May 2025 17:35:48 +0000
Received: by outflank-mailman (input) for mailman id 976195;
 Mon, 05 May 2025 17:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uBzjG-0000sm-SS
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 17:35:46 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f28ded2-29d7-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 19:35:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EBEA8A4C5AB;
 Mon,  5 May 2025 17:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11D3C4CEE4;
 Mon,  5 May 2025 17:35:40 +0000 (UTC)
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
X-Inumbo-ID: 5f28ded2-29d7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746466543;
	bh=w57YziwY5ywU3p0r/3ZcUL0HAETzSk5/VSiQUFBwBIM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IbcFOjVVXzKHbdSCgJ/ESLUeyKuR093yUX+bXJjgj+4DYW4NX34OfIp8GCWzo6fYx
	 b6oKl6KXNWX4KRYXdDR3EFKuNw9s1amlbwUMPv+2btTvWBWMFBEklI/WYZ2l8NJAyf
	 6E4ySEJhEPgqvkZyw6+KZ+yoDHadNOW5TElcFppujgTSb/kGF7v1oWAKq+dtaX04Va
	 JAnM/teHjkjNWochAJElEs0XJNdeUFEuVw4sz20bubboYD0r+kmmUcO3IuR8lRstNb
	 rqxZ/XfqMn7Icy8sWfI3lXbcQRNIopLKJrkB27moqOWkZHeXFIb0gOIYiDBT4DB6l6
	 L9K39SSR+B79A==
Date: Mon, 5 May 2025 10:35:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 8/8] xen/common: dom0less: introduce common
 dom0less-build.c
In-Reply-To: <5523bf0d-a94e-444d-a1fa-035ecccb4448@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2505051023110.3879245@ubuntu-linux-20-04-desktop>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com> <76390ef52f108b580e1c397ed178ceadf1ae53c4.1746199009.git.oleksii.kurochko@gmail.com> <alpine.DEB.2.22.394.2505021321060.3879245@ubuntu-linux-20-04-desktop>
 <5523bf0d-a94e-444d-a1fa-035ecccb4448@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Oleksii,

FYI I know you might not be able to disable HTML in your email client
replies, but just as a heads up, my email client doesn't support HTML at
all so my replies will have your text and my older text mixed up.


On Mon, 5 May 2025, Oleksii Kurochko wrote:
> On 5/2/25 10:53 PM, Stefano Stabellini wrote:
> 
> On Fri, 2 May 2025, Oleksii Kurochko wrote:
> 
> Part of Arm's dom0less-build.c could be common between architectures which are
> using device tree files to create guest domains. Thereby move some parts of
> Arm's dom0less-build.c to common code with minor changes.
> 
> As a part of theses changes the following changes are introduced:
> - Introduce make_arch_nodes() to cover arch-specific nodes. For example, in
>   case of Arm, it is PSCI and vpl011 nodes.
> - Introduce set_domain_type() to abstract a way how setting of domain type
>   happens. For example, RISC-V won't have this member of arch_domain structure
>   as vCPUs will always have the same bitness as hypervisor. In case of Arm, it
>   is possible that Arm64 could create 32-bit and 64-bit domains.
> - Introduce init_vuart() to cover details of virtual uart initialization.
> - Introduce init_intc_phandle() to cover some details of interrupt controller
>   phandle initialization. As an example, RISC-V could have different name for
>   interrupt controller node ( APLIC, PLIC, IMSIC, etc ) but the code in
>   domain_handle_dtb_bootmodule() could handle only one interrupt controller
>   node name.
> - s/make_gic_domU_node/make_intc_domU_node as GIC is Arm specific naming and
>   add prototype of make_intc_domU_node() to dom0less-build.h
> 
> The following functions are moved to xen/common/device-tree:
> - Functions which are moved as is:
>   - domain_p2m_pages().
>   - handle_passthrough_prop().
>   - handle_prop_pfdt().
>   - scan_pfdt_node().
>   - check_partial_fdt().
> - Functions which are moved with some minor changes:
>   - alloc_xenstore_evtchn():
>     - ifdef-ing by CONFIG_HVM accesses to hvm.params.
>   - prepare_dtb_domU():
>     - ifdef-ing access to gnttab_{start,size} by CONFIG_GRANT_TABLE.
>     - s/make_gic_domU_node/make_intc_domU_node.
>     - Add call of make_arch_nodes().
> - domain_handle_dtb_bootmodule():
>   - hide details of interrupt controller phandle initialization by calling
>     init_intc_phandle().
>   - Update the comment above init_intc_phandle(): s/gic/interrupt controller.
> - construct_domU():
>   - ifdef-ing by CONFIG_HVM accesses to hvm.params.
>   - Call init_vuart() to hide Arm's vpl011_init() details there.
>   - Add call of set_domain_type() instead of setting kinfo->arch.type explicitly.
> 
> Some parts of dom0less-build.c are wraped by #ifdef CONFIG_STATIC_{SHMEM,MEMORY}
> as not all archs support these configs.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

[...]


> +    ret = make_memory_node(kinfo, addrcells, sizecells,
> +                           kernel_info_get_mem(kinfo));
> +    if ( ret )
> +        goto err;
> +
> +#ifdef CONFIG_STATIC_SHM
> 
> This should not be necessary because there is a stub implementation of
> make_resv_memory_node available in static-shmem.h for the
> !CONFIG_STATIC_SHM case.
> 
> But static-shmem.h isn't available on all architectures. Until static-shmem.h isn't moved to
> asm-generic or xen folders and then re-used by an architecture we have to have #ifdef.
 
OK let's keep it as is so that we don't need to move static-shmem.h

 
> +    ret = make_resv_memory_node(kinfo, addrcells, sizecells);
> +    if ( ret )
> +        goto err;
> +#endif

[...]


> +    if ( !dt_find_property(node, "xen,static-mem", NULL) )
> +        allocate_memory(d, &kinfo);
> +#ifdef CONFIG_STATIC_MEMORY
> 
> Also this should not be needed thanks to the stub implementation of
> allocate_static_memory and assign_static_memory_11
> 
> 
> +    else if ( !is_domain_direct_mapped(d) )
> +        allocate_static_memory(d, &kinfo, node);
> +    else
> +        assign_static_memory_11(d, &kinfo, node);
> +#endif
> +
> +#ifdef CONFIG_STATIC_SHM
> 
> There is a stub for process_shm too
> 
> The same as with make_resv_memory_node(), static-shmem.h header isn't available for
> all archs.
> I can return my patches which move static-shmem.h to asm-generic and then drop all the ifdef-s connect to it:
> https://lore.kernel.org/xen-devel/0203b98aa6a42aa69e22e7c973320add3ff4bb5d.1736334615.git.oleksii.kurochko@gmail.com/
> https://lore.kernel.org/xen-devel/0203b98aa6a42aa69e22e7c973320add3ff4bb5d.1736334615.git.oleksii.kurochko@gmail.com/
> 
> Let me know if it is better to do now or should it be better to drop #ifdef-ing when an architrecture will require
> static-shmem or static-mem features?

I see Jan's point that they are advanced features probably not needed
initially. So maybe it is better to start with something simpler. I
think it is OK to keep the patch as is.

