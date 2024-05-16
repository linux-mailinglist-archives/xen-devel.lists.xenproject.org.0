Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E28C6F9D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 02:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722718.1126965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P8Q-0005sc-Ix; Thu, 16 May 2024 00:38:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722718.1126965; Thu, 16 May 2024 00:38:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7P8Q-0005qb-GB; Thu, 16 May 2024 00:38:14 +0000
Received: by outflank-mailman (input) for mailman id 722718;
 Thu, 16 May 2024 00:38:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcFO=MT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7P8O-0005qV-Tx
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 00:38:12 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9154ebae-131c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 02:38:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0F9BDCE1777;
 Thu, 16 May 2024 00:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAC0C116B1;
 Thu, 16 May 2024 00:38:05 +0000 (UTC)
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
X-Inumbo-ID: 9154ebae-131c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715819887;
	bh=4g34A0o9035cOxa64wo1nxAwIGq6I4tY15eiVmR9ZFk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OBPm5VI7Mo00yMGrPN3Uryq2ssiCVZkvThihTJ/Es7c+B/aErEok2MkPTt18kqRWK
	 4EwIGpMS5ONVx0KWhWhjHGU1M3hQxE/bNxI/P3xD71dq68mOsPgcewHwbJ0eKjHdr/
	 5eIusoKK/8GB6cpB3gWRI58cuBotr4i/DeKRD76Ly4iWJYqV6kJ0pSdmzh9YFWzUXv
	 gTeWYb1TcCXvINFXQgdSmO1pbgv/3FyzZMyKUnjoQAjWxJ+iNL6naJwpYVeX4eocfy
	 Zai1ZLruAK6szPM6T0ZbNebEjJC7IT1lZ3Mmk3OFlrli651PZ8/NCWVO5+j4bw1oiR
	 jpQdLsEBTpSJQ==
Date: Wed, 15 May 2024 17:38:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [XEN PATCH v2 06/15] x86/p2m: guard altp2m code with CONFIG_ALTP2M
 option
In-Reply-To: <7a6980b1c67dedb306985f73afb23db359771e8f.1715761386.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2405151737150.2544314@ubuntu-linux-20-04-desktop>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com> <7a6980b1c67dedb306985f73afb23db359771e8f.1715761386.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Sergiy Kibrik wrote:
> Instead of using generic CONFIG_HVM option switch to a bit more specific
> CONFIG_ALTP2M option for altp2m support. Also guard altp2m routines, so that
> they can be disabled completely in the build -- when target platform does not
> actually support altp2m (AMD-V & ARM as of now).
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> ---
> changes in v2:
>  - use separate CONFIG_ALTP2M option instead of CONFIG_VMX
> ---
>  xen/arch/x86/include/asm/altp2m.h  |  5 ++++-
>  xen/arch/x86/include/asm/hvm/hvm.h |  2 +-
>  xen/arch/x86/include/asm/p2m.h     | 17 ++++++++++++++++-
>  xen/arch/x86/mm/Makefile           |  2 +-
>  4 files changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
> index e5e59cbd68..092b13e231 100644
> --- a/xen/arch/x86/include/asm/altp2m.h
> +++ b/xen/arch/x86/include/asm/altp2m.h
> @@ -7,7 +7,7 @@
>  #ifndef __ASM_X86_ALTP2M_H
>  #define __ASM_X86_ALTP2M_H
>  
> -#ifdef CONFIG_HVM
> +#ifdef CONFIG_ALTP2M
>  
>  #include <xen/types.h>
>  #include <xen/sched.h>         /* for struct vcpu, struct domain */
> @@ -38,7 +38,10 @@ static inline bool altp2m_active(const struct domain *d)
>  }
>  
>  /* Only declaration is needed. DCE will optimise it out when linking. */
> +void altp2m_vcpu_initialise(struct vcpu *v);
> +void altp2m_vcpu_destroy(struct vcpu *v);
>  uint16_t altp2m_vcpu_idx(const struct vcpu *v);
> +int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
>  void altp2m_vcpu_disable_ve(struct vcpu *v);
>  
>  #endif
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 0c9e6f1564..4f03dd7af8 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -670,7 +670,7 @@ static inline bool hvm_hap_supported(void)
>  /* returns true if hardware supports alternate p2m's */
>  static inline bool hvm_altp2m_supported(void)
>  {
> -    return hvm_funcs.caps.altp2m;
> +    return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
>  }
>  
>  /* Returns true if we have the minimum hardware requirements for nested virt */
> diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
> index 111badf89a..855e69d24a 100644
> --- a/xen/arch/x86/include/asm/p2m.h
> +++ b/xen/arch/x86/include/asm/p2m.h
> @@ -581,9 +581,9 @@ static inline gfn_t mfn_to_gfn(const struct domain *d, mfn_t mfn)
>          return _gfn(mfn_x(mfn));
>  }
>  
> -#ifdef CONFIG_HVM
>  #define AP2MGET_prepopulate true
>  #define AP2MGET_query false
> +#ifdef CONFIG_ALTP2M

Is it necessary? Can't we just replace CONFIG_HVM with CONFIG_ALTP2M on
the same line


