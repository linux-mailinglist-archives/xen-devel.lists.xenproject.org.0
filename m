Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004B88B4276
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2024 01:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713143.1114159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0UYv-0000oE-Dg; Fri, 26 Apr 2024 23:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713143.1114159; Fri, 26 Apr 2024 23:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0UYv-0000mg-Au; Fri, 26 Apr 2024 23:01:01 +0000
Received: by outflank-mailman (input) for mailman id 713143;
 Fri, 26 Apr 2024 23:00:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0UYt-0000mX-3h
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 23:00:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6d2471e-0420-11ef-909a-e314d9c70b13;
 Sat, 27 Apr 2024 01:00:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B5FBC6207A;
 Fri, 26 Apr 2024 23:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88267C113CD;
 Fri, 26 Apr 2024 23:00:54 +0000 (UTC)
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
X-Inumbo-ID: d6d2471e-0420-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714172455;
	bh=kDRn0hbz3SMgL6J0v6KOpNck2BsVm5JUjMBcEU2uhfs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tB1BD12ODwbv+1oYq6eoGtuR7fDWld++XVrqFrqVZqyZ2XiceB7CnCzmWdLNgZ2JV
	 rT1EyyHeQ6BEFD7Cex8HwcBTFF/4i2QwHH77pEuGJP65GCe11sivUUh9sxhci1FrKf
	 /Cp8TDhkPWRrLaqw7yNEEON+N4eGYH1IM6Z9E5REDb21kho/wmaxVRqQaZjOcozkcq
	 H3Pu31V8qDYPWu4gtz3PljRiD0g1oyhBauOJYlRdyf29oPMqrLJ7k8cR8fZi4qNqJz
	 4nt/0fEuf5xRcQMvBd4GgEcJIzWzyE4w5pRPOxwsecxDNw0cAZDDAJOtO2KExVuA/a
	 xZ21SrogpMkxA==
Date: Fri, 26 Apr 2024 16:00:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 1/7] x86/vpmu: separate amd/intel vPMU code
In-Reply-To: <a708db7fe06d131256ed2c75f518efce3d078fbb.1713860310.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404261600460.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com> <a708db7fe06d131256ed2c75f518efce3d078fbb.1713860310.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
> Build AMD vPMU when CONFIG_AMD is on, and Intel vPMU when CONFIG_INTEL
> is on respectively, allowing for a plaftorm-specific build. Also separate
> arch_vpmu_ops initializers using these options and static inline stubs.
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> 
> ---
> changes in v1:
>  - switch to CONFIG_{AMD,INTEL} instead of CONFIG_{SVM,VMX}
> 
> 
>  xen/arch/x86/cpu/Makefile       |  4 +++-
>  xen/arch/x86/include/asm/vpmu.h | 19 +++++++++++++++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
> index 35561fe51d..eafce5f204 100644
> --- a/xen/arch/x86/cpu/Makefile
> +++ b/xen/arch/x86/cpu/Makefile
> @@ -10,4 +10,6 @@ obj-y += intel.o
>  obj-y += intel_cacheinfo.o
>  obj-y += mwait-idle.o
>  obj-y += shanghai.o
> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
> +obj-y += vpmu.o
> +obj-$(CONFIG_AMD) += vpmu_amd.o
> +obj-$(CONFIG_INTEL) += vpmu_intel.o
> diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
> index dae9b43dac..e7a8f211f8 100644
> --- a/xen/arch/x86/include/asm/vpmu.h
> +++ b/xen/arch/x86/include/asm/vpmu.h
> @@ -11,6 +11,7 @@
>  #define __ASM_X86_HVM_VPMU_H_
>  
>  #include <public/pmu.h>
> +#include <xen/err.h>
>  
>  #define vcpu_vpmu(vcpu)   (&(vcpu)->arch.vpmu)
>  #define vpmu_vcpu(vpmu)   container_of((vpmu), struct vcpu, arch.vpmu)
> @@ -42,9 +43,27 @@ struct arch_vpmu_ops {
>  #endif
>  };
>  
> +#ifdef CONFIG_INTEL
>  const struct arch_vpmu_ops *core2_vpmu_init(void);
> +#else
> +static inline const struct arch_vpmu_ops *core2_vpmu_init(void)
> +{
> +    return ERR_PTR(-ENODEV);
> +}
> +#endif
> +#ifdef CONFIG_AMD
>  const struct arch_vpmu_ops *amd_vpmu_init(void);
>  const struct arch_vpmu_ops *hygon_vpmu_init(void);
> +#else
> +static inline const struct arch_vpmu_ops *amd_vpmu_init(void)
> +{
> +    return ERR_PTR(-ENODEV);
> +}
> +static inline const struct arch_vpmu_ops *hygon_vpmu_init(void)
> +{
> +    return ERR_PTR(-ENODEV);
> +}
> +#endif

At some point we'll need to discuss how to separate out hygon as well.
But for now:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

