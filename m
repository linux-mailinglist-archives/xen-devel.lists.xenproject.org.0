Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8E4B099D0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 04:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047792.1418163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucatg-0001uo-1I; Fri, 18 Jul 2025 02:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047792.1418163; Fri, 18 Jul 2025 02:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucatf-0001t7-U3; Fri, 18 Jul 2025 02:32:27 +0000
Received: by outflank-mailman (input) for mailman id 1047792;
 Fri, 18 Jul 2025 02:32:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucate-0001qz-RZ
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 02:32:26 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7077ffa3-637f-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 04:32:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3482343FFA;
 Fri, 18 Jul 2025 02:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6942C4CEE3;
 Fri, 18 Jul 2025 02:32:23 +0000 (UTC)
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
X-Inumbo-ID: 7077ffa3-637f-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752805944;
	bh=8B3UiiUlyaliI1ROkWnGUn/Huls9dbahlHkBrk278F0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KNDA1QfGDp4pPVSaw5XOxmZ6HpCvsWUBAhjicBWByWXnnvMpVqm01iAUWRoVtwrle
	 d8jOdvL9+I8vvNIwi24LCcYK36rCpVyKUPzpXvKnCdSU6IQUGh6dIh/13r2PZElg/p
	 dA4Oswy6pybtcLgOXJyCzHsxhFDM93GqK7cn2qjGKP4AWaU1v1Jnj7NDX0k7A1KCb5
	 PYE7yRvtbWs6J+97MkuV0yEV79h5TdUEKLW7SIYOnIUatjareAeQxTI/aAretuGZst
	 oXlSNUBc8GtzvevWBIpK7GOOq01vNPeCEb7WjJkyVLcZD/2nUKrLjyBaNvcYrpeFTJ
	 +hW2QiGdz8KOA==
Date: Thu, 17 Jul 2025 19:32:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 07/17] xsm/dummy: Allow HVMOP_get_param for control
 domain
In-Reply-To: <20250716211504.291104-8-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171925170.15546@ubuntu-linux-20-04-desktop>
References: <20250716211504.291104-1-jason.andryuk@amd.com> <20250716211504.291104-8-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Jason Andryuk wrote:
> The Control domain is denied access to an untargetable domain.  However
> init-dom0less wants to read the xenstore event channel HVM param to
> determine if xenstore should be set up.

This could be done differently, for instance if xs_is_domain_introduced
returns true, we can assume that xenstore doesn't need to be setup. Then
we don't need to call xc_hvm_param_get. At that point we don't need this
patch?





> This is a read operation, so it is not modifying the domain.  Special
> case the HVMOP_get_param operation for is_control_domain().  It is done
> in xsm_hvm_param() because xsm_default_action() is too complicated.
> HVMOP_get_param should be allowed for a domain itself (XSM_TARGET) and
> its device model - src->target or is_dm_domain().  It should otherwise
> be denied for untargetable domains.  xsm_default_action() doesn't have
> sufficient information to identify the particular operation, so put it
> in xsm_hvm_param().
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> It's messy, but I couldn't think of a better way.
> ---
>  xen/include/xsm/dummy.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index 4d7b1d61eb..896ebee631 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -621,7 +621,10 @@ static XSM_INLINE int cf_check xsm_hvm_param(
>      XSM_DEFAULT_ARG struct domain *d, unsigned long op)
>  {
>      XSM_ASSERT_ACTION(XSM_TARGET);
> -    return xsm_default_action(action, current->domain, d);
> +    /* Special case to allow init-dom0less to read HVM params. */
> +    if ( op == HVMOP_get_param && is_control_domain(current->domain) )
> +        return 0;
> +    return xsm_default_action(XSM_TARGET, current->domain, d);
>  }
>  
>  static XSM_INLINE int cf_check xsm_hvm_param_altp2mhvm(
> -- 
> 2.50.0
> 
> 

