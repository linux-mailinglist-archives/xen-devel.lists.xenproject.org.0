Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182E980FB4B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 00:25:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653674.1020097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDC7a-0000QM-89; Tue, 12 Dec 2023 23:25:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653674.1020097; Tue, 12 Dec 2023 23:25:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDC7a-0000Ok-5H; Tue, 12 Dec 2023 23:25:02 +0000
Received: by outflank-mailman (input) for mailman id 653674;
 Tue, 12 Dec 2023 23:25:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDC7Y-0000Oe-Q7
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 23:25:00 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9c63c5d-9945-11ee-9b0f-b553b5be7939;
 Wed, 13 Dec 2023 00:24:58 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7959619E2;
 Tue, 12 Dec 2023 23:24:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3217C433C7;
 Tue, 12 Dec 2023 23:24:54 +0000 (UTC)
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
X-Inumbo-ID: a9c63c5d-9945-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702423496;
	bh=3aiFuz7enl3k/NkUSUqU4KPZRQahJAgE2vrUJIvYHyg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O+NBod/7UKbVMn3Gpi1COYwfpSY3DX4/KKdEzDBnhEEH16hOCvAicAz5m4ShNA4m2
	 E9FUaVI58zE5agam0DKhBLQIBtPgs16NCWehdkqFsIILgjFTSFgn9Lf+S0wOWYAc0K
	 cXpQR5yqDs6p7mBi3rIB0qiMAsIKxBquyhx/7bJlsSh/X+YICENl6YwWnNu1dcoqeR
	 VHo3uUUThFTUWlwviSmoL6YycqTfR6bDcUk4qotOfMAs445JO9y0IISEsRdNxPk2hu
	 zzWSrT7Gjj99o4pX797bzp5AgAs3ckXR6R1L+dTW6vxpcLh+uxya5s8gfaZMOAzg3j
	 NpJacpSFjaTVw==
Date: Tue, 12 Dec 2023 15:24:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
In-Reply-To: <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312121516490.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com> <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Nicola Vetrini wrote:
> Such declaration is needed because a compatible declaration
> is not visible in xen/common/page_alloc.c, where the variable
> is defined. That variable can't yet be static because of the lack of
> support from ARM and PPC for NUMA.
> 
> On the occasion, use drop a use of u8.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Having this declaration essentially sidesteps the current impossibility
> of having a static variable, as described in the comments in
> ARM and PCC's asm/numa.h.
> 
> Changes in v3:
> - Drop redundant declarations of first_valid_mfn in asm/numa.h for Arm and PPC.
> ---
>  xen/arch/arm/include/asm/numa.h | 8 ++++----
>  xen/arch/ppc/include/asm/numa.h | 7 +++----
>  xen/include/xen/mm.h            | 2 ++
>  3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
> index e2bee2bd8223..44b689f67db8 100644
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/arch/arm/include/asm/numa.h
> @@ -2,8 +2,9 @@
>  #define __ARCH_ARM_NUMA_H
>  
>  #include <xen/mm.h>
> +#include <xen/types.h>

Why the addition of types.h? It doesn't seem to be necessary. Also on
PPC below doesn't seem to be necessary.

Everything else looks fine.



> -typedef u8 nodeid_t;
> +typedef uint8_t nodeid_t;
>  
>  #ifndef CONFIG_NUMA
>  
> @@ -12,10 +13,9 @@ typedef u8 nodeid_t;
>  #define node_to_cpumask(node)   (cpu_online_map)
>  
>  /*
> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> - * is required because the dummy helpers are using it.
> + * TODO: define here first_valid_mfn as static when NUMA is supported on Arm,
> + * this is required because the dummy helpers are using it.
>   */
> -extern mfn_t first_valid_mfn;
>  
>  /* XXX: implement NUMA support */
>  #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> diff --git a/xen/arch/ppc/include/asm/numa.h b/xen/arch/ppc/include/asm/numa.h
> index 7fdf66c3da74..152305ebe446 100644
> --- a/xen/arch/ppc/include/asm/numa.h
> +++ b/xen/arch/ppc/include/asm/numa.h
> @@ -1,8 +1,8 @@
>  #ifndef __ASM_PPC_NUMA_H__
>  #define __ASM_PPC_NUMA_H__
>  
> -#include <xen/types.h>
>  #include <xen/mm.h>
> +#include <xen/types.h>
>  
>  typedef uint8_t nodeid_t;
>  
> @@ -11,10 +11,9 @@ typedef uint8_t nodeid_t;
>  #define node_to_cpumask(node)   (cpu_online_map)
>  
>  /*
> - * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
> - * is required because the dummy helpers are using it.
> + * TODO: define here first_valid_mfn as static when NUMA is supported on PPC,
> + * this is required because the dummy helpers are using it.
>   */
> -extern mfn_t first_valid_mfn;
>  
>  /* XXX: implement NUMA support */
>  #define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 3d9b2d05a5c8..a13a9a46ced7 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -118,6 +118,8 @@ int destroy_xen_mappings(unsigned long s, unsigned long e);
>  /* Retrieve the MFN mapped by VA in Xen virtual address space. */
>  mfn_t xen_map_to_mfn(unsigned long va);
>  
> +extern mfn_t first_valid_mfn;
> +
>  /*
>   * Create only non-leaf page table entries for the
>   * page range in Xen virtual address space.
> -- 
> 2.34.1
> 

