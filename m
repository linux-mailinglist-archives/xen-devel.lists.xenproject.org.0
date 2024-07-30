Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCB4942388
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 01:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768134.1178888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwWS-0006Q1-Vb; Tue, 30 Jul 2024 23:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768134.1178888; Tue, 30 Jul 2024 23:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwWS-0006N4-Sb; Tue, 30 Jul 2024 23:44:52 +0000
Received: by outflank-mailman (input) for mailman id 768134;
 Tue, 30 Jul 2024 23:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYwWR-0006My-LR
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 23:44:51 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4665d58-4ecd-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 01:44:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 19294CE1253;
 Tue, 30 Jul 2024 23:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB6AC32782;
 Tue, 30 Jul 2024 23:44:42 +0000 (UTC)
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
X-Inumbo-ID: b4665d58-4ecd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722383083;
	bh=OMHNSgZBtWBrQop4ouE3v2EtFpYm+SwSdtozfRcIG2c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a5TMHzTLGm+84uJEV6T8dbLvO9ADdMlsyprlJG2mKjV75VSIpa3FnAl/K0MPV3gYS
	 DEJq1roMPb9AcbejVCn8ZGQlFhlJVo15J5uI0+TdCaVmDB0IvkmjqOv81ooDwEkGQw
	 ePOalJIP//7TUcLRbeFXeSuhFYfKqsRo4jxucvrBM8+j5Xktnj6ynT8zc2h4+Mk013
	 pkipQSFgPCfUXIEa7ceMms8u3z4zLHZ+RAEqG+2lyorPufw40LcEZHWBv0KCvIQU07
	 db3qgnIXH/fqoBdakRCUrsR3rQZFE+zOowLsuA0xiwPP4VYtF9XkwOHIR+8ketLsDC
	 MYKzb0D0JXqBw==
Date: Tue, 30 Jul 2024 16:44:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 2/4] x86/domain: Implement arch_init_idle_domain()
In-Reply-To: <20240718215744.3892072-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2407301639090.4857@ubuntu-linux-20-04-desktop>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com> <20240718215744.3892072-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-714823234-1722382791=:4857"
Content-ID: <alpine.DEB.2.22.394.2407301643220.4857@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-714823234-1722382791=:4857
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2407301643221.4857@ubuntu-linux-20-04-desktop>

On Thu, 18 Jul 2024, Andrew Cooper wrote:
> The idle domain needs d->arch.ctxt_switch initialised on x86.  Implement the
> new arch_init_idle_domain() in order to do this.
> 
> Right now this double-initalises the ctxt_switch pointer, but it's safe and
> will stop happening when domain_create() is cleaned up as a consequence.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/x86/domain.c             | 19 ++++++++++++-------
>  xen/arch/x86/include/asm/domain.h |  3 +++
>  2 files changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index ccadfe0c9e70..eff905c6c6e5 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -768,6 +768,17 @@ static bool emulation_flags_ok(const struct domain *d, uint32_t emflags)
>      return true;
>  }
>  
> +void __init arch_init_idle_domain(struct domain *d)
> +{
> +    static const struct arch_csw idle_csw = {
> +        .from = paravirt_ctxt_switch_from,
> +        .to   = paravirt_ctxt_switch_to,
> +        .tail = idle_loop,
> +    };
> +
> +    d->arch.ctxt_switch = &idle_csw;
> +}
> +
>  int arch_domain_create(struct domain *d,
>                         struct xen_domctl_createdomain *config,
>                         unsigned int flags)
> @@ -783,13 +794,7 @@ int arch_domain_create(struct domain *d,
>      /* Minimal initialisation for the idle domain. */
>      if ( unlikely(is_idle_domain(d)) )
>      {
> -        static const struct arch_csw idle_csw = {
> -            .from = paravirt_ctxt_switch_from,
> -            .to   = paravirt_ctxt_switch_to,
> -            .tail = idle_loop,
> -        };
> -
> -        d->arch.ctxt_switch = &idle_csw;
> +        arch_init_idle_domain(d);

I don't understand why you need this call to arch_init_idle_domain(d)
here given the other call to arch_init_idle_domain added by patch #1.

Also I am not sure why you didn't move the line below (cpu_policy =
ZERO_BLOCK_PTR) to arch_init_idle_domain as well but I admit I don't
know this code

I realize you are removing all this code in patch #4... but still why
the line below is not needed anymore? And why do we need to add an extra
call to arch_init_idle_domain temporarily in this patch?


>          d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
>  
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index f5daeb182baa..bca3258d69ac 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -779,6 +779,9 @@ struct arch_vcpu_io {
>  /* Maxphysaddr supportable by the paging infrastructure. */
>  unsigned int domain_max_paddr_bits(const struct domain *d);
>  
> +#define arch_init_idle_domain arch_init_idle_domain
> +void arch_init_idle_domain(struct domain *d);
> +
>  #endif /* __ASM_DOMAIN_H__ */
>  
>  /*
> -- 
> 2.39.2
> 
--8323329-714823234-1722382791=:4857--

