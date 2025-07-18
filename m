Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2CFB0995F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 03:48:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047763.1418133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucaCw-00025n-ER; Fri, 18 Jul 2025 01:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047763.1418133; Fri, 18 Jul 2025 01:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucaCw-00024N-Bq; Fri, 18 Jul 2025 01:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1047763;
 Fri, 18 Jul 2025 01:48:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uH3I=Z7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucaCu-00024H-Dp
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 01:48:16 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 449adbcd-6379-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 03:48:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 940C26020B;
 Fri, 18 Jul 2025 01:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB51FC4CEE3;
 Fri, 18 Jul 2025 01:48:12 +0000 (UTC)
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
X-Inumbo-ID: 449adbcd-6379-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752803293;
	bh=bbiLry4TZxd1vXk0QT8MPsjLnoeE5MQ1sPhMOvf4SQ8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PY+a/X0S4j04ZqIesOJcu5iNLS+yiZt7EGzkLYsrDv+1OtNHpWMhWjCs8X+pAhHL+
	 6mAU45JiQckBh51D2flWukpUuFGi66ZGldbzmkko3Kw4/i23Qe2QDn0Ly4N883oeqW
	 na813Ak7Sj69mi4VE1gw3w9u4JFob2Ay6fTRAo7bg8aaRwg3Da1M9AOMy13dhIxi3Z
	 QzUlVUeKbnOlihJucBHLmWRPSnTRwt351brEp5iVKRZWz7Zrrz8s/JkdgPShhO7zfG
	 ALeaM+E93vlEA54pUmj6crTOfMd6Ve4lWmMlhxeYhPoVSH/tqygTpjiwWIhuFyDTqL
	 Cto5nv+2CiPeg==
Date: Thu, 17 Jul 2025 18:48:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 06/17] xen/xsm: Expand XSM_XS_PRIV for untargetable
 domains
In-Reply-To: <20250716211504.291104-7-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171847360.15546@ubuntu-linux-20-04-desktop>
References: <20250716211504.291104-1-jason.andryuk@amd.com> <20250716211504.291104-7-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Jul 2025, Jason Andryuk wrote:
> Untargetable domains are currently hidden from the control domain -
> e.g. xl list will not show them.  getdomaininfo fails on the
> !is_hypercall_target() check in XSM_TARGET.  Add control domain to the
> XSM_XS_PRIV check so it can pass.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

XSM_XS_PRIV is only used in XEN_DOMCTL_get_domain_state,
XEN_DOMCTL_getdomaininfo and XEN_SYSCTL_getdomaininfolist, so it makes
sense to me

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/include/xsm/dummy.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index f2205575ed..4d7b1d61eb 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -87,7 +87,8 @@ static always_inline int xsm_default_action(
>          fallthrough;
>      case XSM_XS_PRIV:
>          if ( action == XSM_XS_PRIV &&
> -             evaluate_nospec(is_xenstore_domain(src)) )
> +             (evaluate_nospec(is_xenstore_domain(src)) ||
> +              is_control_domain(src)) )
>              return 0;
>          fallthrough;
>      case XSM_DM_PRIV:
> -- 
> 2.50.0
> 
> 

