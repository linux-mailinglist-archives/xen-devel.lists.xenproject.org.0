Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F0C8B4290
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2024 01:16:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713164.1114220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Unf-00064Q-OK; Fri, 26 Apr 2024 23:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713164.1114220; Fri, 26 Apr 2024 23:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Unf-000612-Kw; Fri, 26 Apr 2024 23:16:15 +0000
Received: by outflank-mailman (input) for mailman id 713164;
 Fri, 26 Apr 2024 23:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0Une-00060u-Vu
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 23:16:14 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f931d0e3-0422-11ef-909a-e314d9c70b13;
 Sat, 27 Apr 2024 01:16:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 08EA0620DE;
 Fri, 26 Apr 2024 23:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA429C113CD;
 Fri, 26 Apr 2024 23:16:10 +0000 (UTC)
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
X-Inumbo-ID: f931d0e3-0422-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714173371;
	bh=kVqyvQJVeQ8A8MTa8QG8mJDMn2FQMcL2iJAmirzaQw0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FHngelhi6Agfr2OMrpP5iZTiL8870AdwPrL0IifvBc9LJpQU3IC25ZFdqyDZa0lbY
	 lf65QVVyjo+kfADBCUixnvpUJPUnirtOf9NAdSjYc9f1t70j5MA8DJJ9MJLB6C8MCh
	 O353mQBd258jnUza9gO4ZnV84ot+FAx8Zt0NYzdTG7m6raoFzr35yO4TtC/kQHyS3s
	 1bFwRjuZBEtbdVeUUb1F30jUK1H8VRZSqHuHieX4njf/CPj7EAcx/yBA67qijk2iLJ
	 eGQ84ZE10sKzt7e68cd4c5Y7EWUCabv0t8WoEnyPGppcnCCm3NFPIHf3w5HpTm9vyA
	 krkexBe5WO7kg==
Date: Fri, 26 Apr 2024 16:16:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 7/7] x86/MCE: optional build of AMD/Intel MCE
 code
In-Reply-To: <82df6ef350a2b4f42ec7adf12a90ebeae1d133f6.1713860310.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404261615250.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com> <82df6ef350a2b4f42ec7adf12a90ebeae1d133f6.1713860310.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
> Separate Intel/AMD-specific MCE code using CONFIG_{INTEL,AMD} config options.
> Now we can avoid build of mcheck code if support for specific platform is
> intentionally disabled by configuration.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> ---
>  xen/arch/x86/cpu/mcheck/Makefile    | 6 ++----
>  xen/arch/x86/cpu/mcheck/non-fatal.c | 6 ++++++
>  xen/arch/x86/cpu/mcheck/vmce.h      | 1 +
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/mcheck/Makefile b/xen/arch/x86/cpu/mcheck/Makefile
> index f927f10b4d..5b3f6d875c 100644
> --- a/xen/arch/x86/cpu/mcheck/Makefile
> +++ b/xen/arch/x86/cpu/mcheck/Makefile
> @@ -1,12 +1,10 @@
> -obj-y += amd_nonfatal.o
> -obj-y += mce_amd.o
>  obj-y += mcaction.o
>  obj-y += barrier.o
> -obj-y += intel-nonfatal.o
>  obj-y += mctelem.o
>  obj-y += mce.o
>  obj-y += mce-apei.o
> -obj-y += mce_intel.o
> +obj-$(CONFIG_AMD) += mce_amd.o amd_nonfatal.o
> +obj-$(CONFIG_INTEL) += mce_intel.o intel-nonfatal.o
>  obj-y += non-fatal.o
>  obj-y += util.o
>  obj-y += vmce.o

Awesome!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
> index 33cacd15c2..2d91a3b1e0 100644
> --- a/xen/arch/x86/cpu/mcheck/non-fatal.c
> +++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
> @@ -24,14 +24,20 @@ static int __init cf_check init_nonfatal_mce_checker(void)
>  	 * Check for non-fatal errors every MCE_RATE s
>  	 */
>  	switch (c->x86_vendor) {
> +#ifdef CONFIG_AMD
>  	case X86_VENDOR_AMD:
>  	case X86_VENDOR_HYGON:
>  		/* Assume we are on K8 or newer AMD or Hygon CPU here */
>  		amd_nonfatal_mcheck_init(c);
>  		break;
> +#endif
> +#ifdef CONFIG_INTEL
>  	case X86_VENDOR_INTEL:
>  		intel_nonfatal_mcheck_init(c);
>  		break;
> +#endif
> +	default:
> +		return -ENODEV;
>  	}
>  	printk(KERN_INFO "mcheck_poll: Machine check polling timer started.\n");
>  	return 0;

For consistency in all other cases this patch series uses IS_ENABLED
checks. They could be used here as well.

