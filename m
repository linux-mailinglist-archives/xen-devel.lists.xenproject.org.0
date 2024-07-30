Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B77B942384
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 01:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768127.1178878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwV1-0005sh-Le; Tue, 30 Jul 2024 23:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768127.1178878; Tue, 30 Jul 2024 23:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYwV1-0005qc-I9; Tue, 30 Jul 2024 23:43:23 +0000
Received: by outflank-mailman (input) for mailman id 768127;
 Tue, 30 Jul 2024 23:43:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0AIz=O6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sYwV0-0005qW-SJ
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 23:43:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 807df673-4ecd-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 01:43:21 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B6D2262073;
 Tue, 30 Jul 2024 23:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F689C32782;
 Tue, 30 Jul 2024 23:43:18 +0000 (UTC)
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
X-Inumbo-ID: 807df673-4ecd-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722382999;
	bh=3U99pWFxGmrkh10YKk6+a7HEtgs3LnIGuf4tdxvVCFc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ghL7eAq2uZDtGUM6zFU0SXAyG5YW0HJj/5869U8n2T49tgr3uQ+x+HDVhMp0pFY/X
	 BXyQjy9x3B6v1C2LmusA3Fu2BXYTbqW9w5aGtDf24XBWBA2biAEaaRsh5b11Vl7AVw
	 yzk9c1ZvvlpQEsXaw+oxQxYC0APVHyML0hyN+qx1vM/uLM+S2zPVOWJ2bjnMcRvnsj
	 YYWmoMiY1+X3EK2JdLNyQwajLN7wEImrSdokjhCdTQRnZ9wXIVWNPhVyXBOOLjuB5A
	 TWKahBvJTwuYTCU8HeE4I76iyPZ2KiM+HRl+uT+m0Mrhs4I2uaSJBbl5KChCFlnZ0h
	 tXqbuBe5x5Dfg==
Date: Tue, 30 Jul 2024 16:43:17 -0700 (PDT)
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
Subject: Re: [PATCH 1/4] xen/domain: Introduce arch_init_idle_domain()
In-Reply-To: <20240718215744.3892072-2-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2407301638580.4857@ubuntu-linux-20-04-desktop>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com> <20240718215744.3892072-2-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1256561900-1722382746=:4857"
Content-ID: <alpine.DEB.2.22.394.2407301643160.4857@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1256561900-1722382746=:4857
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2407301643161.4857@ubuntu-linux-20-04-desktop>

On Thu, 18 Jul 2024, Andrew Cooper wrote:
> The idle domain causes a large amount of complexity in domain_create() because
> of x86's need to initialise d->arch.ctxt_switch in arch_domain_create().
> 
> In order to address this, introduce an optional hook to perform extra
> initialisation of the idle domain.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


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
>  xen/common/domain.c     | 3 +++
>  xen/include/xen/sched.h | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index fb262dcec919..e312c820d641 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -685,6 +685,9 @@ struct domain *domain_create(domid_t domid,
>  
>      rangeset_domain_initialise(d);
>  
> +    if ( is_idle_domain(d) )
> +        arch_init_idle_domain(d);
> +
>      /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently constructed. */
>      if ( is_system_domain(d) && !is_idle_domain(d) )
>          return d;
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 2dcd1d1a4f8a..90666576c2f8 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -728,6 +728,11 @@ struct domain *domain_create(domid_t domid,
>                               struct xen_domctl_createdomain *config,
>                               unsigned int flags);
>  
> +#ifndef arch_init_idle_domain
> +/* Optional, if there's any construction necessary for DOMID_IDLE */
> +static inline void arch_init_idle_domain(struct domain *d) {}
> +#endif
> +
>  /*
>   * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
>   * This is the preferred function if the returned domain reference
> -- 
> 2.39.2
> 
--8323329-1256561900-1722382746=:4857--

