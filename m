Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657BF94238C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 01:46:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768147.1178907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwXQ-0007QF-GH; Tue, 30 Jul 2024 23:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768147.1178907; Tue, 30 Jul 2024 23:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwXQ-0007Nc-DG; Tue, 30 Jul 2024 23:45:52 +0000
Received: by outflank-mailman (input) for mailman id 768147;
 Tue, 30 Jul 2024 23:45:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYwXO-0006My-Cm
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 23:45:50 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7b2a533-4ecd-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 01:45:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0B33CE1271;
 Tue, 30 Jul 2024 23:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7FFC32782;
 Tue, 30 Jul 2024 23:45:43 +0000 (UTC)
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
X-Inumbo-ID: d7b2a533-4ecd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722383145;
	bh=QCQqh1HC5tqUsvhhd7FdV6HvQWl7j49M/hokcPh+vJE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HADbsH1u0KtHINDVLESCv5LlG5dFGn3lnjs+TAZCxRHe9/2SxjYCT8pCVQL0QNw3l
	 GDSsAVra8tRY4ZZMtDOsEr2IOemi7M48JGpJOavxeJBz9uV9gpHovTpVlYsn7Jd36z
	 X6iha3Qft7m4k8sA1yq7fNzzZhWlV/7SKFKp1lffZzEZ/1N8W2rjpH9J+rcYvo1YsO
	 V9/T9C7qGMSdZgRWl9HsAoYlQPfHQ1lGRUSkVn5cUpzsTDwVsQwKjO6YX3iFuhrjSB
	 LhRsZzb2vZbV6+VdC+QLt2oC7jSwzgNIZt9LVuGy+1aQST3+nq3YogpKLpVecmfQi8
	 DC4uAKaBJZQrA==
Date: Tue, 30 Jul 2024 16:45:42 -0700 (PDT)
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
Subject: Re: [PATCH 4/4] arch/domain: Clean up the idle domain remnants in
 arch_domain_create()
In-Reply-To: <20240718215744.3892072-5-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2407301645130.4857@ubuntu-linux-20-04-desktop>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com> <20240718215744.3892072-5-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2034107233-1722383145=:4857"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2034107233-1722383145=:4857
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 18 Jul 2024, Andrew Cooper wrote:
> With arch_domain_create() no longer being called with the idle domain, drop
> the last remaining logic.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

but one question below


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
>  xen/arch/arm/domain.c |  6 ------
>  xen/arch/x86/domain.c | 17 -----------------
>  2 files changed, 23 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 7cfcefd27944..3ba959f86633 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -706,12 +706,6 @@ int arch_domain_create(struct domain *d,
>  
>      BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>  
> -    /* Idle domains do not need this setup */
> -    if ( is_idle_domain(d) )
> -        return 0;
> -
> -    ASSERT(config != NULL);
> -
>  #ifdef CONFIG_IOREQ_SERVER
>      ioreq_domain_init(d);
>  #endif
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index eff905c6c6e5..c71b9023cb1a 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -791,23 +791,6 @@ int arch_domain_create(struct domain *d,
>  
>      spin_lock_init(&d->arch.e820_lock);
>  
> -    /* Minimal initialisation for the idle domain. */
> -    if ( unlikely(is_idle_domain(d)) )
> -    {
> -        arch_init_idle_domain(d);
> -
> -        d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */

Are you sure you don't want to keep it?


> -        return 0;
> -    }
> -
> -    if ( !config )
> -    {
> -        /* Only IDLE is allowed with no config. */
> -        ASSERT_UNREACHABLE();
> -        return -EINVAL;
> -    }
> -
>      if ( d->domain_id && cpu_has_amd_erratum(&boot_cpu_data, AMD_ERRATUM_121) )
>      {
>          if ( !opt_allow_unsafe )
> -- 
> 2.39.2
> 
--8323329-2034107233-1722383145=:4857--

