Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96420AFBD81
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 23:30:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035808.1408182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtPM-0006z2-3I; Mon, 07 Jul 2025 21:29:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035808.1408182; Mon, 07 Jul 2025 21:29:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYtPL-0006wU-W3; Mon, 07 Jul 2025 21:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1035808;
 Mon, 07 Jul 2025 21:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYtPK-0006wH-Gd
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 21:29:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 824d9b20-5b79-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 23:29:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 213E645AC8;
 Mon,  7 Jul 2025 21:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BB2C4CEE3;
 Mon,  7 Jul 2025 21:29:46 +0000 (UTC)
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
X-Inumbo-ID: 824d9b20-5b79-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751923788;
	bh=dzgIRPjO+exLMe2ZmwbjoVCsAz1a6INzoK/0Jdow/F0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z74MCsNBcWamA3g2q7U3wkV6QYg30aW4M1QIePUcaHotu9YNCJT+mwqV3b3frmk8K
	 JvnruXdgx9ESPLINKkEnfzW2U4QfZq9xo/+9yuqVb/XTVyVvBaS+K4CoCDLDWc5Gc4
	 a3cYCH7mPPH/Gth2kb9E1nEpC9PE3likvwBj69v0x0RVb1LdnJsHn+JArAQ1fDP2ep
	 mfmyCg3rCvJrW0iacgDLLtaRkA+JwIeSSUa6GNqhovviglp9MTrZFwDfE4op3UsTJl
	 HrlQs53Dq+rwIn++Vl5bopPTc1IgYbBwOi9rHsdQpHutO10+l4zFKSa07/mRptQz2e
	 AakW0uInt1JGw==
Date: Mon, 7 Jul 2025 14:29:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH 4/5] device-tree: address violation of MISRA C Rule
 5.5
In-Reply-To: <3dc32625a870200e4bae20959a10be6a786a9763.1751659393.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507071429220.605088@ubuntu-linux-20-04-desktop>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com> <3dc32625a870200e4bae20959a10be6a786a9763.1751659393.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Jul 2025, Dmytro Prokopchuk1 wrote:
> Address a violation of MISRA C:2012 Rule 5.5:
> "Identifiers shall be distinct from macro names".
> 
> Reports for service MC3A2.R5.5:
> xen/include/xen/fdt-domain-build.h: non-compliant parameter 'copy_to_guest'
> xen/include/xen/guest_access.h: non-compliant macro 'copy_to_guest'
> 
> Rename 'copy_to_guest' function parameter to 'cb' for compliance.
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Nice!


> ---
>  xen/common/device-tree/domain-build.c | 9 ++++-----
>  xen/include/xen/fdt-domain-build.h    | 4 ++--
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
> index cd01a8b4bc..2b009547d0 100644
> --- a/xen/common/device-tree/domain-build.c
> +++ b/xen/common/device-tree/domain-build.c
> @@ -331,7 +331,7 @@ void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
>  }
>  
>  void __init dtb_load(struct kernel_info *kinfo,
> -                     copy_to_guest_phys_cb copy_to_guest)
> +                     copy_to_guest_phys_cb cb)
>  {
>      unsigned long left;
>  
> @@ -339,7 +339,7 @@ void __init dtb_load(struct kernel_info *kinfo,
>             kinfo->d, kinfo->dtb_paddr,
>             kinfo->dtb_paddr + fdt_totalsize(kinfo->fdt));
>  
> -    left = copy_to_guest(kinfo->d, kinfo->dtb_paddr,
> +    left = cb(kinfo->d, kinfo->dtb_paddr,
>                           kinfo->fdt,
>                           fdt_totalsize(kinfo->fdt));

NIT: code style, alignment

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


>  
> @@ -350,7 +350,7 @@ void __init dtb_load(struct kernel_info *kinfo,
>  }
>  
>  void __init initrd_load(struct kernel_info *kinfo,
> -                        copy_to_guest_phys_cb copy_to_guest)
> +                        copy_to_guest_phys_cb cb)
>  {
>      const struct boot_module *mod = kinfo->initrd;
>      paddr_t load_addr = kinfo->initrd_paddr;
> @@ -393,8 +393,7 @@ void __init initrd_load(struct kernel_info *kinfo,
>      if ( !initrd )
>          panic("Unable to map the %pd initrd\n", kinfo->d);
>  
> -    res = copy_to_guest(kinfo->d, load_addr,
> -                        initrd, len);
> +    res = cb(kinfo->d, load_addr, initrd, len);
>      if ( res != 0 )
>          panic("Unable to copy the initrd in the %pd memory\n", kinfo->d);
>  
> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
> index 45981dbec0..3a20623cf5 100644
> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -50,10 +50,10 @@ typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
>                                                 unsigned int len);
>  
>  void initrd_load(struct kernel_info *kinfo,
> -                 copy_to_guest_phys_cb copy_to_guest);
> +                 copy_to_guest_phys_cb cb);
>  
>  void dtb_load(struct kernel_info *kinfo,
> -              copy_to_guest_phys_cb copy_to_guest);
> +              copy_to_guest_phys_cb cb);
>  
>  int find_unallocated_memory(const struct kernel_info *kinfo,
>                              const struct membanks *mem_banks[],
> -- 
> 2.43.0
> 

