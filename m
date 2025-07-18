Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1FB09911
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 03:12:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047727.1418084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucZd6-0003ye-RZ; Fri, 18 Jul 2025 01:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047727.1418084; Fri, 18 Jul 2025 01:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucZd6-0003wL-OF; Fri, 18 Jul 2025 01:11:16 +0000
Received: by outflank-mailman (input) for mailman id 1047727;
 Fri, 18 Jul 2025 01:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucZd5-0003vu-3p
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 01:11:15 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 138b74f9-6374-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 03:11:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A24E744E7E;
 Fri, 18 Jul 2025 01:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114F6C4CEE3;
 Fri, 18 Jul 2025 01:11:02 +0000 (UTC)
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
X-Inumbo-ID: 138b74f9-6374-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752801063;
	bh=Ke/X8+AV2Ug3hJKK2RJaJ8T9Kf6xAWt5C4/Dr6YwyxU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hxWyDJ6Jn4CqWiIRLZ1GM12/cUSPZGj153vMbp/5KDgZb6j8xE7itRxEBML8DM2Yr
	 gqruWgQtHhAY/74iNa25Z83/RB3dtBAPnOv3rQOVrCXTpvGpkOqNTUfBi664VEKtcw
	 v9VFDDQqFhvcttHqXCoHuXyAt79hRK4PgGhkRND/h+GB9apo9v3ycHLBZJudyxWyQW
	 LjY0TE0O5dgZ4c9/EmonzcHJ+y9QSfvzYXiftyeTTIfEKK1wo/yjFDl2gCyLvbTYIm
	 yIQvlIWdExv2lpPE9Y36St5NFBF4nrbL36opSuPC2UsLEbIWU7r40AlqA4AWp3PSQH
	 zrmMmA/P+QyMg==
Date: Thu, 17 Jul 2025 18:11:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 02/17] xsm/silo: Support hardware & xenstore domains
In-Reply-To: <20250716211504.291104-3-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171809370.15546@ubuntu-linux-20-04-desktop>
References: <20250716211504.291104-1-jason.andryuk@amd.com> <20250716211504.291104-3-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Jason Andryuk wrote:
> In a disaggregated environment, dom0 is split into Control, Hardware,
> and Xenstore domains, along with domUs.  The is_control_domain() check
> is not sufficient to handle all these cases.  Add is_priv_domain() to
> support allowing for the various domains.
> 
> The purpose of SILO mode is to prevent domUs from interacting with each
> other.  But dom0 was allowed to communicate with domUs to provide
> services.
> 
> To provide xenstore connections, the Xenstore domain must be allowed to
> connect via grants and event channels.  Xenstore domain must also be
> allowed to connect to Control and Hardware to provide xenstore to them.
> 
> Hardware domain will provide PV devices to domains, so it must be
> allowed to connect to domains.
> 
> That leaves Control.  Xenstore and Hardware would already allow access
> to Control, so it can obtain services that way.  Control should be
> "privileged", which would mean it can make the connections.  But with
> Xenstore and Hardware providing their services to domUs, there may not
> be a reason to allow Control to use grants or event channels with domUs.
> 
> This silo check is for grants, event channels and argo.  The dummy
> policy handles other calls, so Hardware is prevented from foreign
> mapping Control's memory with that.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v2:
> Use single evaluate_nospec() for checks.
> Remove Control
> Add xenstore domain
> Expand commit message
> Remove always_inline
> ---
>  xen/xsm/silo.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
> index b89b364287..b392f32507 100644
> --- a/xen/xsm/silo.c
> +++ b/xen/xsm/silo.c
> @@ -20,6 +20,17 @@
>  #define XSM_NO_WRAPPERS
>  #include <xsm/dummy.h>
>  
> +static bool is_priv_domain(const struct domain *d)
> +{
> +    /*
> +     * Open coding of:
> +     *    is_xenstore_domain(d) || is_hardware_domain(d)
> +     * to place all within one speculative barrier.

Please add a comment on why Control Domain, while privileged, is not
part of this list


> +     */
> +    return evaluate_nospec((d->options & XEN_DOMCTL_CDF_xs_domain) ||
> +                           d == hardware_domain);
> +}
> +
>  /*
>   * Check if inter-domain communication is allowed.
>   * Return true when pass check.
> @@ -29,8 +40,8 @@ static bool silo_mode_dom_check(const struct domain *ldom,
>  {
>      const struct domain *currd = current->domain;
>  
> -    return (is_control_domain(currd) || is_control_domain(ldom) ||
> -            is_control_domain(rdom) || ldom == rdom);
> +    return (is_priv_domain(currd) || is_priv_domain(ldom) ||
> +            is_priv_domain(rdom) || ldom == rdom);
>  }
>  
>  static int cf_check silo_evtchn_unbound(
> -- 
> 2.50.0
> 
> 

