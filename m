Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B894AB0E739
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 01:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053085.1421843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMQw-0003Ed-Pb; Tue, 22 Jul 2025 23:30:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053085.1421843; Tue, 22 Jul 2025 23:30:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueMQw-0003B1-Mq; Tue, 22 Jul 2025 23:30:06 +0000
Received: by outflank-mailman (input) for mailman id 1053085;
 Tue, 22 Jul 2025 23:30:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0Ar=2D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ueMQv-0002tj-1t
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 23:30:05 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id caa1b7ff-6753-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 01:30:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 322D4668B0;
 Tue, 22 Jul 2025 23:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F389FC4CEEB;
 Tue, 22 Jul 2025 23:30:00 +0000 (UTC)
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
X-Inumbo-ID: caa1b7ff-6753-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753227001;
	bh=7dgNBnhMHcRob017T7suK+xCfns2ClqoxGOCPXPA07Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YE5OkEOLnrBOw/xIHV/PmqTAk5m8j5ypVfFlHCy8XEHWHX3LvLOUY4Xn4uDZ8ADzW
	 O0piYWLNgvIxnK59lhr54FYbuNSBO3kYAMt3TPV8Rz6ysTuWE9Okir+hFAlAVwsKcP
	 D7JLmRWQpfseYamca51K7zWVqzmyCPRGLPNecmgV+TuN9xLAQUZHxwoZpy0tyvHBC4
	 cRcjp8YLiWfSJPD/GqTJ4P3/IPnCHVmVii6bjctwmnjDEuvdTn65HcrP/W2MO4n8m+
	 97w+3O9Zc6gmaO2i5O6+rOgdnCX0GnGezHjMti7EPFIrEhXmVs4oPFBJGIo2t0NJCQ
	 KRlwE1T5Fi83g==
Date: Tue, 22 Jul 2025 16:29:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 06/10] dom0less: Create llc_color_str field in
 boot_domain
In-Reply-To: <20250722115955.57167-7-alejandro.garciavallejo@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507221629150.7043@ubuntu-linux-20-04-desktop>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com> <20250722115955.57167-7-alejandro.garciavallejo@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Alejandro Vallejo wrote:
> Later patches move the bindings to a separate function and expect the
> outputs to land in fields of a boot_domain. Adjust llc_color_str to
> live inside boot_domain so it can be parsed later on.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/device-tree/dom0less-build.c | 12 ++++++++----
>  xen/include/xen/bootfdt.h               |  5 +++++
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index cee666786e..e1d723c796 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -834,7 +834,6 @@ void __init create_domUs(void)
>      BUG_ON(chosen == NULL);
>      dt_for_each_child_node(chosen, node)
>      {
> -        const char *llc_colors_str = NULL;
>          struct kernel_info ki = KERNEL_INFO_INIT;
>          struct xen_domctl_createdomain *d_cfg = &ki.bd.create_cfg;
>          unsigned int *flags = &ki.bd.create_flags;
> @@ -955,9 +954,11 @@ void __init create_domUs(void)
>              d_cfg->max_maptrack_frames = val;
>          }
>  
> -        dt_property_read_string(node, "llc-colors", &llc_colors_str);
> -        if ( !llc_coloring_enabled && llc_colors_str )
> +#ifdef CONFIG_HAS_LLC_COLORING
> +        dt_property_read_string(node, "llc-colors", &ki.bd.llc_colors_str);
> +        if ( !llc_coloring_enabled && ki.bd.llc_colors_str )
>              panic("'llc-colors' found, but LLC coloring is disabled\n");
> +#endif
>  
>          arch_create_domUs(node, d_cfg, *flags);
>  
> @@ -972,10 +973,13 @@ void __init create_domUs(void)
>              panic("Error creating domain %s (rc = %ld)\n",
>                    dt_node_name(node), PTR_ERR(ki.bd.d));
>  
> +#ifdef CONFIG_HAS_LLC_COLORING
>          if ( llc_coloring_enabled &&
> -             (rc = domain_set_llc_colors_from_str(ki.bd.d, llc_colors_str)) )
> +             (rc = domain_set_llc_colors_from_str(ki.bd.d,
> +                                                  ki.bd.llc_colors_str)) )
>              panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
>                    dt_node_name(node), rc);
> +#endif /* CONFIG_HAS_LLC_COLORING */
>  
>          ki.bd.d->is_console = true;
>          dt_device_set_used_by(node, ki.bd.d->domain_id);
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index f107099263..0e82ccea2f 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -125,6 +125,11 @@ struct boot_domain {
>      /* Input arguments to create_domain() */
>      struct xen_domctl_createdomain create_cfg;
>      unsigned int create_flags;
> +
> +#ifdef CONFIG_HAS_LLC_COLORING
> +    /* LLC color selection string */
> +    const char *llc_colors_str;
> +#endif
>  };
>  
>  #define BOOTMOD_MAX_CMDLINE 1024
> -- 
> 2.43.0
> 

