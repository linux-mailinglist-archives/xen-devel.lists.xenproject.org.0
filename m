Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D63AF76C1C2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574653.900137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR0BI-0003yF-Gq; Wed, 02 Aug 2023 00:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574653.900137; Wed, 02 Aug 2023 00:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR0BI-0003v5-DS; Wed, 02 Aug 2023 00:57:40 +0000
Received: by outflank-mailman (input) for mailman id 574653;
 Wed, 02 Aug 2023 00:57:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pqe9=DT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qR0BG-0003ux-6N
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:57:38 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9217e946-30cf-11ee-b25d-6b7b168915f2;
 Wed, 02 Aug 2023 02:57:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECCED6176D;
 Wed,  2 Aug 2023 00:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2607AC433C8;
 Wed,  2 Aug 2023 00:57:34 +0000 (UTC)
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
X-Inumbo-ID: 9217e946-30cf-11ee-b25d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690937855;
	bh=BfGIuwpRCN4qhBSwEVz0f3fnhIPy1Gr2sJI264ojiNE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ofNyJD9I3d+T3Ng/0MZYU3mcPbRvx8rNXtFv7k9gErQ4LmNHM8PqdQJcZX+kKYTbs
	 53RBLMWKWTML+v3Cu2ZxYpdKnx8XQR8p/yyo4/3LJJIE/q20kq26vK5Fsr+A5ok6xa
	 yWjKs864IStLwjBHFMrksn9eQhNoxk9ptRlFv1DrfPGCz/0pG5MuYjGj0XTUaAYZQ4
	 qODZ+yet4Sb1vH2Yb3Ef41ddsRyW4wE9nEs3qjr1RuocNXAlhl8oVpBZIpJADBT3Vn
	 USDvJZEsfRnH1barv2YGcP0uv6YAmDT3CrTkKHq35mXS/n2Et/ucdsUyyr/81nFNpD
	 3yG3x2vYT175A==
Date: Tue, 1 Aug 2023 17:57:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [RFC 3/6] roles: add a role for xenstore domain
In-Reply-To: <20230801202006.20322-4-dpsmith@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2308011757190.2127516@ubuntu-linux-20-04-desktop>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com> <20230801202006.20322-4-dpsmith@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Aug 2023, Daniel P. Smith wrote:
> Expand the possible roles for a domain to include a role for the Xenstore
> domain.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/domain.c     | 3 +++
>  xen/include/xen/sched.h | 3 ++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 0ff1d52e3d..dbf055c559 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -633,6 +633,9 @@ struct domain *domain_create(domid_t domid,
>          d->role |= ROLE_HARDWARE_DOMAIN;
>      }
>  
> +    if ( d->options & XEN_DOMCTL_CDF_xs_domain )
> +        d->role |= ROLE_XENSTORE_DOMAIN;
> +
>      TRACE_1D(TRC_DOM0_DOM_ADD, d->domain_id);
>  
>      lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 695f240326..ec0f9baff6 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -470,6 +470,7 @@ struct domain
>  #define ROLE_UNBOUNDED_DOMAIN  (1U<<0)
>  #define ROLE_CONTROL_DOMAIN    (1U<<1)
>  #define ROLE_HARDWARE_DOMAIN   (1U<<2)
> +#define ROLE_XENSTORE_DOMAIN   (1U<<3)
>      uint8_t          role;
>      /* Can this guest access the Xen console? */
>      bool             is_console;
> @@ -1165,7 +1166,7 @@ static inline bool is_vcpu_online(const struct vcpu *v)
>  
>  static inline bool is_xenstore_domain(const struct domain *d)
>  {
> -    return d->options & XEN_DOMCTL_CDF_xs_domain;
> +    return d->role & ROLE_XENSTORE_DOMAIN;
>  }
>  
>  static always_inline bool is_iommu_enabled(const struct domain *d)
> -- 
> 2.20.1
> 

