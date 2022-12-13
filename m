Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F6464ACFA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 02:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460076.717881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4u2T-0007Ay-P2; Tue, 13 Dec 2022 01:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460076.717881; Tue, 13 Dec 2022 01:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4u2T-00078I-Ls; Tue, 13 Dec 2022 01:24:57 +0000
Received: by outflank-mailman (input) for mailman id 460076;
 Tue, 13 Dec 2022 01:24:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p4u2R-0006yx-TS
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 01:24:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f28c31b7-7a84-11ed-91b6-6bf2151ebd3b;
 Tue, 13 Dec 2022 02:24:55 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6377612E7;
 Tue, 13 Dec 2022 01:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D940C433D2;
 Tue, 13 Dec 2022 01:24:52 +0000 (UTC)
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
X-Inumbo-ID: f28c31b7-7a84-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670894693;
	bh=EWENDyto2y3A0RxsHp88bWp5KnnuE7d/iF+EzVr010g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T92w5uCcll+HWL6YOq1emGygjcajGZY9rIcHAkoNotQezmYPql9aWGOFrwS+Z2MHM
	 sH80Xitm3QW+rRudg45sdNxfDpMkK1ZYBiTVotewxDHnsEfUTzz3TY7IKG10JE5ekB
	 OAmz1qYJALSe6lis6qk+0vaoNV/+8Y2ZEysAuWGDD37sFczM5h/mFIx1DWVqOMXpeK
	 Sk0uAd1BKG//1lEv1wwyS98ujePmUrJ0ciIMrXfaP+n2EQoqX4oBK0jUDF0R0Nn7N3
	 13JYTYj8Xz0bvEpKaadWUhM+DSlHh+UJemAAxrsvdexja59fmVHkx8gsRNfNK4c3/0
	 LJ8RxyHVWFBag==
Date: Mon, 12 Dec 2022 17:24:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 14/18] xen/arm: mm: Allow dump_hyp_walk() to work on
 the current root table
In-Reply-To: <20221212095523.52683-15-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212121724420.3075842@ubuntu-linux-20-04-desktop>
References: <20221212095523.52683-1-julien@xen.org> <20221212095523.52683-15-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> dump_hyp_walk() is used to print the tables walk in case of the data or
> instruction abort.
> 
> Those abort are not limited to the runtime and could happen at early
> boot. However, the current implementation of dump_hyp_walk() check
> that the TTBR matches the runtime page tables.
> 
> Therefore, early abort will result to a secondary abort and not
> print the table walks.
> 
> Given that the function is called in the abort path, there is no
> reason for us to keep the BUG_ON() in any form. So drop it.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - Patch added
> ---
>  xen/arch/arm/mm.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 26d6b70410c5..0cf7ad4f0e8c 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -280,13 +280,11 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>  void dump_hyp_walk(vaddr_t addr)
>  {
>      uint64_t ttbr = READ_SYSREG64(TTBR0_EL2);
> -    lpae_t *pgtable = THIS_CPU_PGTABLE;
>  
>      printk("Walking Hypervisor VA 0x%"PRIvaddr" "
>             "on CPU%d via TTBR 0x%016"PRIx64"\n",
>             addr, smp_processor_id(), ttbr);
>  
> -    BUG_ON( virt_to_maddr(pgtable) != ttbr );
>      dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
>  }
>  
> -- 
> 2.38.1
> 

