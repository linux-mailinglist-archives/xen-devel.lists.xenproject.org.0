Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EAE67A818
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 01:58:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483821.750212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKU6e-0006V2-CX; Wed, 25 Jan 2023 00:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483821.750212; Wed, 25 Jan 2023 00:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKU6e-0006S2-95; Wed, 25 Jan 2023 00:57:40 +0000
Received: by outflank-mailman (input) for mailman id 483821;
 Wed, 25 Jan 2023 00:57:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a83O=5W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKU6d-0006BH-2e
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 00:57:39 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41f67389-9c4b-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 01:57:36 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6A6F613CA;
 Wed, 25 Jan 2023 00:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A68CC433EF;
 Wed, 25 Jan 2023 00:57:34 +0000 (UTC)
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
X-Inumbo-ID: 41f67389-9c4b-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674608255;
	bh=uR4rLCUDe+6STB91mcRK4XdS3Se6/BvvlfNg+xzjRXU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Odv7VUCMqbwpXGCyPVTVkSSUCEmP9ljkS1FeJbgGG4DRUpKU651Wdz0BIsi8a/u+t
	 rErf/dSnvfTgnlmJJAz+R+uvsOc9PND4pPdt7E8fx0HdSyaA+fgIEQxowYZnoQAvrB
	 CGRMcMF6b/wskiYJKQTU4ZU5CB9d2rugRBrrd+YrYs3pNE/a1xAPMzam+ghcwgrIri
	 P3zPPYtJJ3IfDo4XuyRsBzo7M8mGRAE9f1pD7ry7owsydYDShR5lpw/moqgdEnj52W
	 xtTkHiQlRH58Q3KspWpKmzaB4S02Qxo38118u1aMeeiXNTGsK3AObXiJN/kmyyC3Ev
	 hWNTkruN0y0tg==
Date: Tue, 24 Jan 2023 16:57:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/3] xen/arm: Extend the memory overlap check to
 include bootmodules
In-Reply-To: <20221214031654.2815589-3-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2301241657240.1978264@ubuntu-linux-20-04-desktop>
References: <20221214031654.2815589-1-Henry.Wang@arm.com> <20221214031654.2815589-3-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Dec 2022, Henry Wang wrote:
> Similarly as the static regions defined in bootinfo.reserved_mem,
> the bootmodule regions defined in bootinfo.modules should also not
> be overlapping with memory regions in either bootinfo.reserved_mem
> or bootinfo.modules.
> 
> Therefore, this commit introduces a helper `bootmodules_overlap_check()`
> and uses this helper to extend the check in function
> `check_reserved_regions_overlap()` so that memory regions in
> bootinfo.modules are included. Use `check_reserved_regions_overlap()`
> in `add_boot_module()` to return early if any error occurs.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v1 -> v2:
> 1. Split original `overlap_check()` to `bootmodules_overlap_check()`.
> 2. Rework commit message.
> ---
>  xen/arch/arm/setup.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index e6eeb3a306..ba0152f868 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -286,6 +286,31 @@ static int __init meminfo_overlap_check(struct meminfo *meminfo,
>      return 0;
>  }
>  
> +static int __init bootmodules_overlap_check(struct bootmodules *bootmodules,
> +                                            paddr_t region_start,
> +                                            paddr_t region_end)
> +{
> +    paddr_t mod_start = INVALID_PADDR, mod_end = 0;
> +    unsigned int i, mod_num = bootmodules->nr_mods;
> +
> +    for ( i = 0; i < mod_num; i++ )
> +    {
> +        mod_start = bootmodules->module[i].start;
> +        mod_end = mod_start + bootmodules->module[i].size;
> +
> +        if ( region_end <= mod_start || region_start >= mod_end )
> +            continue;
> +        else
> +        {
> +            printk("Region %#"PRIpaddr" - %#"PRIpaddr" overlapping with mod[%u] %#"PRIpaddr" - %#"PRIpaddr"\n",
> +                   region_start, region_end, i, mod_start, mod_end);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  void __init fw_unreserved_regions(paddr_t s, paddr_t e,
>                                    void (*cb)(paddr_t, paddr_t),
>                                    unsigned int first)
> @@ -312,6 +337,11 @@ int __init check_reserved_regions_overlap(paddr_t region_start,
>                                 region_start, region_end) )
>          return -EINVAL;
>  
> +    /* Check if input region is overlapping with bootmodules */
> +    if ( bootmodules_overlap_check(&bootinfo.modules,
> +                                   region_start, region_end) )
> +        return -EINVAL;
> +
>      return 0;
>  }
>  
> @@ -329,6 +359,10 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
>                 boot_module_kind_as_string(kind), start, start + size);
>          return NULL;
>      }
> +
> +    if ( check_reserved_regions_overlap(start, size) )
> +        return NULL;
> +
>      for ( i = 0 ; i < mods->nr_mods ; i++ )
>      {
>          mod = &mods->module[i];
> -- 
> 2.25.1
> 

