Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AAFB11589
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 03:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056770.1424778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6tQ-0004R2-B9; Fri, 25 Jul 2025 01:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056770.1424778; Fri, 25 Jul 2025 01:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf6tQ-0004Ov-7W; Fri, 25 Jul 2025 01:06:36 +0000
Received: by outflank-mailman (input) for mailman id 1056770;
 Fri, 25 Jul 2025 01:06:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swpo=2G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uf6tP-0004Op-Gj
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 01:06:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a4e78be-68f3-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 03:06:33 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0B8A15C68B3;
 Fri, 25 Jul 2025 01:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83719C4CEED;
 Fri, 25 Jul 2025 01:06:29 +0000 (UTC)
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
X-Inumbo-ID: 9a4e78be-68f3-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753405590;
	bh=LvpBOaC3zwRIZAbm0ha0Em6XE/UNSpmEP7Qapt/R04M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZarPRKt4Ay2473ZzvfdZxHYFMXvobkXh2B7lk07Crwedie0d33ac4HcCodE7ns1G+
	 bUPHA1tQ4XrUBPDdnhjfEaBwL71KaspCwRHeeAIVQYxR9NWXSuKD7NBXRF8WO3gqB7
	 GqtQuIJDLHlspv2a3lRSr8Ke3zkplMiM6xlpzbQ3AYYHy8NMfT1LD9c3tQlUlvII5G
	 toEsxNYsvr63OIeBrCsyezWG0q2WyBjESc7nw9hBDj9N9ohg1C4hdY5PEfqirFPczG
	 LvrY43Kn8N8flmVe/rCNZoL7AhrW4fcjatrBhaklS9/buK926Gnsh/zzei7YxZGtS4
	 Z+dldBwrEowkA==
Date: Thu, 24 Jul 2025 18:06:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] xen: add missing noreturn attribute
In-Reply-To: <7b2884c6f89a0af671daa26798154b5ac0042a80.1753397522.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507241806210.2549622@ubuntu-linux-20-04-desktop>
References: <7b2884c6f89a0af671daa26798154b5ac0042a80.1753397522.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Jul 2025, Dmytro Prokopchuk1 wrote:
> These functions never return to their caller,
> causing a violation of MISRA C Rule 2.1:
> "A project shall not contain unreachable code".
> Add the `noreturn' attribute to fix this.
> 
> No functional changes.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/domain.c  | 2 +-
>  xen/arch/arm/setup.c   | 2 +-
>  xen/arch/arm/smpboot.c | 2 +-
>  xen/common/efi/boot.c  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 79a144e61b..310c578909 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -298,7 +298,7 @@ static void schedule_tail(struct vcpu *prev)
>  extern void noreturn return_to_new_vcpu32(void);
>  extern void noreturn return_to_new_vcpu64(void);
>  
> -static void continue_new_vcpu(struct vcpu *prev)
> +static void noreturn continue_new_vcpu(struct vcpu *prev)
>  {
>      current->arch.actlr = READ_SYSREG(ACTLR_EL1);
>      processor_vcpu_initialise(current);
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 27bd3f5a6e..bb35afe56c 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -306,7 +306,7 @@ void __init init_pdx(void)
>  size_t __read_mostly dcache_line_bytes;
>  
>  /* C entry point for boot CPU */
> -void asmlinkage __init start_xen(unsigned long fdt_paddr)
> +void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>  {
>      size_t fdt_size;
>      const char *cmdline;
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 73de7503e9..7f3cfa812e 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -315,7 +315,7 @@ smp_prepare_cpus(void)
>  }
>  
>  /* Boot the current CPU */
> -void asmlinkage start_secondary(void)
> +void asmlinkage noreturn start_secondary(void)
>  {
>      unsigned int cpuid = init_data.cpuid;
>  
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index df29444220..4b60bd719e 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -285,7 +285,7 @@ static bool __init match_guid(const EFI_GUID *guid1, const EFI_GUID *guid2)
>  }
>  
>  /* generic routine for printing error messages */
> -static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
> +static void __init noreturn PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
>  {
>      StdOut = StdErr;
>      PrintErr(mesg);
> -- 
> 2.43.0
> 

