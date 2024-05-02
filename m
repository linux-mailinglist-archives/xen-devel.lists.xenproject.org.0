Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98A8BA008
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 20:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716102.1118174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2arN-0004Yp-R3; Thu, 02 May 2024 18:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716102.1118174; Thu, 02 May 2024 18:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2arN-0004Vi-Nl; Thu, 02 May 2024 18:08:45 +0000
Received: by outflank-mailman (input) for mailman id 716102;
 Thu, 02 May 2024 18:08:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Qsp=MF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s2arL-0004UP-Kh
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 18:08:43 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffeb29d4-08ae-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 20:08:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7D9F2CE1788;
 Thu,  2 May 2024 18:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E7FC4AF1B;
 Thu,  2 May 2024 18:08:28 +0000 (UTC)
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
X-Inumbo-ID: ffeb29d4-08ae-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714673312;
	bh=KKKjylRbEkEZP4mHEvG+hl/hr/LZ5arERC+XSWzHRSc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OIc7/DeVq3NldQyZVjmB5zS5CNntGJ49i0uOTOuFmy5AWdVp+Nf7SRWMlIunZAukD
	 VqsoTWBc7+M8LJhAIokiM2SvaJm0foazg9Ac56rZLGqAVbi3gXkK/dCO1sCuyIeqzs
	 4+LRdmufApixNJwALsiTige93L+Tne/r305P7P4hL5ZM/tVA1i/yVnnls6rXz/Cze5
	 VpnoeKSdZ3Pr63cgjbPUiR6Vd/iuCxgUPG91sHnB6gMTuEZBF63ZmXYXn0hPy29uZd
	 I/WSy4Rr0XYpfhZIgkKOZSV77/EzP4R+xO6Hh0OAkI6s8iv3gBlq3Z8ekd/KdfcH4X
	 cIdTY9plCvTFA==
Date: Thu, 2 May 2024 11:08:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <xin.wang2@amd.com>
cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Alec Kwapis <alec.kwapis@medtronic.com>
Subject: Re: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN
 key in HVMOP
In-Reply-To: <20240426031455.579637-3-xin.wang2@amd.com>
Message-ID: <alpine.DEB.2.22.394.2405021104390.624854@ubuntu-linux-20-04-desktop>
References: <20240426031455.579637-1-xin.wang2@amd.com> <20240426031455.579637-3-xin.wang2@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Apr 2024, Henry Wang wrote:
> For use cases such as Dom0less PV drivers, a mechanism to communicate
> Dom0less DomU's static data with the runtime control plane (Dom0) is
> needed. Since on Arm HVMOP is already the existing approach to address
> such use cases (for example the allocation of HVM_PARAM_CALLBACK_IRQ),
> add a new HVMOP key HVM_PARAM_MAGIC_BASE_PFN for storing the magic
> page region base PFN. The value will be set at Dom0less DomU
> construction time after Dom0less DomU's magic page region has been
> allocated.
> 
> To keep consistent, also set the value for HVM_PARAM_MAGIC_BASE_PFN
> for libxl guests in alloc_magic_pages().
> 
> Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>  tools/libs/guest/xg_dom_arm.c   | 2 ++
>  xen/arch/arm/dom0less-build.c   | 2 ++
>  xen/arch/arm/hvm.c              | 1 +
>  xen/include/public/hvm/params.h | 1 +
>  4 files changed, 6 insertions(+)
> 
> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
> index 8cc7f27dbb..3c08782d1d 100644
> --- a/tools/libs/guest/xg_dom_arm.c
> +++ b/tools/libs/guest/xg_dom_arm.c
> @@ -74,6 +74,8 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
>      xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_PFN_OFFSET);
>      xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
>  
> +    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_MAGIC_BASE_PFN,
> +            base);
>      xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PFN,
>              dom->console_pfn);
>      xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_PFN,
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 40dc85c759..72187c167d 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -861,6 +861,8 @@ static int __init construct_domU(struct domain *d,
>              free_domheap_pages(magic_pg, get_order_from_pages(NR_MAGIC_PAGES));
>              return rc;
>          }
> +
> +        d->arch.hvm.params[HVM_PARAM_MAGIC_BASE_PFN] = gfn_x(gfn);

I apologize as I have not read the whole email thread in reply to this
patch.

Why do we need to introduce a new hvm param instead of just setting
HVM_PARAM_CONSOLE_PFN and HVM_PARAM_STORE_PFN directly here?


