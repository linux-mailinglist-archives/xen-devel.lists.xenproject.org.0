Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A661C8C6FAC
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:54:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722745.1127034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PO3-0004xz-7R; Thu, 16 May 2024 00:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722745.1127034; Thu, 16 May 2024 00:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7PO3-0004vX-4Q; Thu, 16 May 2024 00:54:23 +0000
Received: by outflank-mailman (input) for mailman id 722745;
 Thu, 16 May 2024 00:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7PO2-0004vR-3n
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:54:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d26cb61b-131e-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:54:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 73601CE1802;
 Thu, 16 May 2024 00:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7AFCC32782;
 Thu, 16 May 2024 00:54:14 +0000 (UTC)
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
X-Inumbo-ID: d26cb61b-131e-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715820855;
	bh=MuE4HQ2FPbsqGcRxJFuoymWVDev/utL3Oe71h6ns99k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GKOIpo1FX331UVAEdSRsOxDFZY/oMHeYlfNgqFcSLKDxCaIW00LeJYcOqd+bnueTU
	 vYtdQum8FsVgcuf6HfEK5lf3jPs1Nd7G9CweVUtDAg5CTxMPlBim96ykubD5JYGK4C
	 UQqmPvSr1GK1NxLXoEo0UPwZsv5JWbRt4GnQhoh1AVQ/I4u/n+Qfj3GDjclxejrT1W
	 eqMV5GqChiPn+qn7FI9Adl8HyqlvAWba+5DI9zF6emaeZBNIIaM9bHYY5Tzfp5Rp7I
	 VWY2nLDGpL+bXeOSkTz7TV+depz1SA8I3ZMWZUu2uPqJSCIpJZj4YNNnBoUaVAWkvj
	 CQwpfRBstSN3g==
Date: Wed, 15 May 2024 17:54:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: Re: [XEN PATCH v2 14/15] iommu/vt-d: guard vmx_pi_hooks_* calls with
 cpu_has_vmx
In-Reply-To: <73072e5b2ec40ad28d4bcfb9bb0870f3838bb726.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151751530.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <73072e5b2ec40ad28d4bcfb9bb0870f3838bb726.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> VMX posted interrupts support can now be excluded from x86 build along with
> VMX code itself, but still we may want to keep the possibility to use
> VT-d IOMMU driver in non-HVM setups.
> So we guard vmx_pi_hooks_{assign/deassign} with some checks for such a case.
> 
> No functional change intended here.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

I know that Andrew was keep on having a separate Kconfig option for
VT-D, separate from VMX. But still, couldn't we make the VT-D Kconfig
option depending on CONFIG_VMX?

To me, VT-D should require VMX, without VMX it should not be possible to
enable VT-D.

This comment goes in the same direction of my previous comment regarding
the vpmu: we are trying to make things more configurable and flexible
and that's good, but we don't necessary need to make all possible
combination work. VT-D without VMX is another one of those combination
that I would only enable after a customer asks.


> ---
>  xen/drivers/passthrough/vtd/iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
> index e13be244c1..ad78282250 100644
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -2772,7 +2772,7 @@ static int cf_check reassign_device_ownership(
>  
>      if ( !QUARANTINE_SKIP(target, pdev->arch.vtd.pgd_maddr) )
>      {
> -        if ( !has_arch_pdevs(target) )
> +        if ( cpu_has_vmx && !has_arch_pdevs(target) )
>              vmx_pi_hooks_assign(target);
>  
>  #ifdef CONFIG_PV
> @@ -2806,7 +2806,7 @@ static int cf_check reassign_device_ownership(
>      }
>      if ( ret )
>      {
> -        if ( !has_arch_pdevs(target) )
> +        if ( cpu_has_vmx && !has_arch_pdevs(target) )
>              vmx_pi_hooks_deassign(target);
>          return ret;
>      }
> @@ -2824,7 +2824,7 @@ static int cf_check reassign_device_ownership(
>          write_unlock(&target->pci_lock);
>      }
>  
> -    if ( !has_arch_pdevs(source) )
> +    if ( cpu_has_vmx && !has_arch_pdevs(source) )
>          vmx_pi_hooks_deassign(source);
>  
>      /*
> -- 
> 2.25.1
> 

