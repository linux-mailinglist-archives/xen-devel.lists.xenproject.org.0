Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E0BA23514
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 21:28:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879753.1289969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdb8y-0002uE-GQ; Thu, 30 Jan 2025 20:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879753.1289969; Thu, 30 Jan 2025 20:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdb8y-0002sA-Cg; Thu, 30 Jan 2025 20:28:08 +0000
Received: by outflank-mailman (input) for mailman id 879753;
 Thu, 30 Jan 2025 20:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URkf=UW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tdb8w-0002s4-Lv
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 20:28:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5331243-df48-11ef-a0e6-8be0dac302b0;
 Thu, 30 Jan 2025 21:28:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 76A905C501F;
 Thu, 30 Jan 2025 20:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64CCC4CEE4;
 Thu, 30 Jan 2025 20:28:01 +0000 (UTC)
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
X-Inumbo-ID: b5331243-df48-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738268883;
	bh=p9nVrigsDYKicwkfzbW1Xes5NHnGUH3hN9svLzouh8Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HWZH8ahgB9vx8+j2xBmxLOgm/lRsFpULHlwwbuM3e7CmaCIy6OtCK9mfeiRlax8p0
	 fw0S/FZLbB6ohnL9+Yvw/7Ib9hEq6T2dT07pBk6yBFfZ9JerJ1AapMsYmswZqYJ1Td
	 8LBPM30TI7oU059pdPqOwq3pQKPbtjojjD78VNoQsKbs0WTf6LNsS8I42R5CSAulpf
	 RRSihr6ry39uarymYt9lNPj0OimRKczyTUqUuhYoBL17i5gTyFN4+MszolUtxw/cnx
	 jj94tHlLOGcpaIIuGpIz2MeQvZYbjlnBz40SnmVZZK1kLyFmdKCrn4iZeTg/G4Hv3z
	 CNrbsI1C57kew==
Date: Thu, 30 Jan 2025 12:28:00 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>
cc: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>, 
    Greg KH <gregkh@linuxfoundation.org>, Konrad Wilk <konrad.wilk@oracle.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    "sstabellini@kernel.org" <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
    stable@vger.kernel.org
Subject: Re: v5.4.289 failed to boot with error megasas_build_io_fusion 3219
 sge_count (-12) is out of range
In-Reply-To: <5a7d969b-b2ab-4fac-b95e-4a536e2c8d5c@suse.com>
Message-ID: <alpine.DEB.2.22.394.2501301226330.11632@ubuntu-linux-20-04-desktop>
References: <7dc143fa-4a48-440b-b624-ac57a361ac74@oracle.com> <9dd91f6e-1c66-4961-994e-dbda87d69dad@oracle.com> <2025012919-series-chaps-856e@gregkh> <8eb33b38-23e1-4e43-8952-3f2b05660236@oracle.com> <2025012936-finalize-ducktail-c524@gregkh>
 <1f017284-1a29-49d8-b0d9-92409561990e@oracle.com> <2025012956-jiffy-condone-3137@gregkh> <1f225b8d-d958-4304-829e-8798884d9b6b@oracle.com> <83bd90c7-8879-4462-9548-bb5b69cac39e@suse.com> <b4ab0246-3846-41d1-8e84-64bd7fefc089@oracle.com>
 <de6912ad-3dba-4d66-8ca2-71a0aa09172c@suse.com> <686986a0-c981-4aa3-ae88-92a34368129e@oracle.com> <5a7d969b-b2ab-4fac-b95e-4a536e2c8d5c@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-717441065-1738268883=:11632"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-717441065-1738268883=:11632
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 30 Jan 2025, Jürgen Groß wrote:
> Can you try the attached patch, please? I don't have a system at hand
> showing the problem.
>
> From cff43e997f79a95dc44e02debaeafe5f127f40bb Mon Sep 17 00:00:00 2001
> From: Juergen Gross <jgross@suse.com>
> Date: Thu, 30 Jan 2025 09:56:57 +0100
> Subject: [PATCH] x86/xen: allow larger contiguous memory regions in PV guests
> 
> Today a PV guest (including dom0) can create 2MB contiguous memory
> regions for DMA buffers at max. This has led to problems at least
> with the megaraid_sas driver, which wants to allocate a 2.3MB DMA
> buffer.
> 
> The limiting factor is the frame array used to do the hypercall for
> making the memory contiguous, which has 512 entries and is just a
> static array in mmu_pv.c.
> 
> In case a contiguous memory area larger than the initially supported
> 2MB is requested, allocate a larger buffer for the frame list. Note
> that such an allocation is tried only after memory management has been
> initialized properly, which is tested via the early_boot_irqs_disabled
> flag.
> 
> Fixes: 9f40ec84a797 ("xen/swiotlb: add alignment check for dma buffers")
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> Note that the "Fixes:" tag is not really correct, as that patch didn't
> introduce the problem, but rather made it visible. OTOH it is the best
> indicator we have to identify kernel versions this patch should be
> backported to.
> ---
>  arch/x86/xen/mmu_pv.c | 44 ++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index 55a4996d0c04..62aec29b8174 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -2200,8 +2200,10 @@ void __init xen_init_mmu_ops(void)
>  }
>  
>  /* Protected by xen_reservation_lock. */
> -#define MAX_CONTIG_ORDER 9 /* 2MB */
> -static unsigned long discontig_frames[1<<MAX_CONTIG_ORDER];
> +#define MIN_CONTIG_ORDER 9 /* 2MB */
> +static unsigned int discontig_frames_order = MIN_CONTIG_ORDER;
> +static unsigned long discontig_frames_early[1UL << MIN_CONTIG_ORDER];
> +static unsigned long *discontig_frames = discontig_frames_early;
>  
>  #define VOID_PTE (mfn_pte(0, __pgprot(0)))
>  static void xen_zap_pfn_range(unsigned long vaddr, unsigned int order,
> @@ -2319,18 +2321,44 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
>  				 unsigned int address_bits,
>  				 dma_addr_t *dma_handle)
>  {
> -	unsigned long *in_frames = discontig_frames, out_frame;
> +	unsigned long *in_frames, out_frame;
> +	unsigned long *new_array, *old_array;
>  	unsigned long  flags;
>  	int            success;
>  	unsigned long vstart = (unsigned long)phys_to_virt(pstart);
>  
> -	if (unlikely(order > MAX_CONTIG_ORDER))
> -		return -ENOMEM;
> +	if (unlikely(order > discontig_frames_order)) {
> +		if (early_boot_irqs_disabled)
> +			return -ENOMEM;
> +
> +		new_array = vmalloc(sizeof(unsigned long) * (1UL << order));
> +
> +		if (!new_array)
> +			return -ENOMEM;
> +
> +		spin_lock_irqsave(&xen_reservation_lock, flags);
> +
> +		if (order > discontig_frames_order) {


This second if check should not be needed because it is the same as the
outer if check.



> +			if (discontig_frames == discontig_frames_early)
> +				old_array = NULL;
> +			else
> +				old_array = discontig_frames;
> +			discontig_frames = new_array;
> +			discontig_frames_order = order;
> +		} else
> +			old_array = new_array;
> +
> +		spin_unlock_irqrestore(&xen_reservation_lock, flags);
> +
> +		vfree(old_array);
> +	}
>  
>  	memset((void *) vstart, 0, PAGE_SIZE << order);
>  
>  	spin_lock_irqsave(&xen_reservation_lock, flags);
>  
> +	in_frames = discontig_frames;
> +
>  	/* 1. Zap current PTEs, remembering MFNs. */
>  	xen_zap_pfn_range(vstart, order, in_frames, NULL);
>  
> @@ -2354,12 +2382,12 @@ int xen_create_contiguous_region(phys_addr_t pstart, unsigned int order,
>  
>  void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
>  {
> -	unsigned long *out_frames = discontig_frames, in_frame;
> +	unsigned long *out_frames, in_frame;
>  	unsigned long  flags;
>  	int success;
>  	unsigned long vstart;
>  
> -	if (unlikely(order > MAX_CONTIG_ORDER))
> +	if (unlikely(order > discontig_frames_order))
>  		return;
>  
>  	vstart = (unsigned long)phys_to_virt(pstart);
> @@ -2367,6 +2395,8 @@ void xen_destroy_contiguous_region(phys_addr_t pstart, unsigned int order)
>  
>  	spin_lock_irqsave(&xen_reservation_lock, flags);
>  
> +	out_frames = discontig_frames;
> +
>  	/* 1. Find start MFN of contiguous extent. */
>  	in_frame = virt_to_mfn((void *)vstart);
>  
> -- 
> 2.43.0
> 
--8323329-717441065-1738268883=:11632--

