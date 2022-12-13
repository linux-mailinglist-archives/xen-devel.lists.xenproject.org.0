Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943C864ACF9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 02:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460070.717871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4u1v-0006e1-Gx; Tue, 13 Dec 2022 01:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460070.717871; Tue, 13 Dec 2022 01:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4u1v-0006aa-DN; Tue, 13 Dec 2022 01:24:23 +0000
Received: by outflank-mailman (input) for mailman id 460070;
 Tue, 13 Dec 2022 01:24:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p4u1t-0006aU-9P
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 01:24:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dde1c089-7a84-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 02:24:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3432B6125F;
 Tue, 13 Dec 2022 01:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926E3C433D2;
 Tue, 13 Dec 2022 01:24:17 +0000 (UTC)
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
X-Inumbo-ID: dde1c089-7a84-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670894658;
	bh=X5Qvdz06lUt1Lo6ljZBy+pu6GcGpD34stk9oC8voeWw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MWzYYfZ5dW5nEbZNsyysUXz1ApgH8k7Jrcgy4SE7KxIn3T1RZdYrVtHMLOhRtFw5v
	 4y6yUySUayO5jPXNJvpBbbAwsbb+kaCKvgICRUVjLVaut9qx66ud8JXlavhfGJrRVh
	 bAM3uD9pTRVzQkuCQlKfG8WGlfVuoKBQVBoZkTCJCdsx1VOpNhyW4qLif1wNT4U5+d
	 OuLkQTE39Vq2Qj72Qq+bdEY8+NPfTyLw3TN8O3ub/TSUC4KIUbtBvl46gn8t0qlOA/
	 3kkywUQ5dTXN5SCwQgglJNjcVIkrOV7z+ulckpUse91NkIr4FLOARUiRhvvkEyL2CL
	 bhZ6Z3uo2BbuQ==
Date: Mon, 12 Dec 2022 17:24:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 13/18] xen/arm: mm: Allow xen_pt_update() to work with
 the current root table
In-Reply-To: <20221212095523.52683-14-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212121724070.3075842@ubuntu-linux-20-04-desktop>
References: <20221212095523.52683-1-julien@xen.org> <20221212095523.52683-14-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, xen_pt_update() will only work on the runtime page tables.
> In follow-up patches, we will also want to use the helper to update
> the boot page tables.
> 
> All the existing callers of xen_pt_update() expects to modify the
> current page-tables. Therefore, we can read the root physical address
> directly from TTBR0_EL2.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> 
>     Changes in v2:
>         - Patch added
> ---
>  xen/arch/arm/mm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index cc11f5c639e6..26d6b70410c5 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1114,7 +1114,7 @@ static int xen_pt_update(unsigned long virt,
>       *
>       * XXX: Add a check.
>       */
> -    const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
> +    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
>  
>      /*
>       * The hardware was configured to forbid mapping both writeable and
> -- 
> 2.38.1
> 

