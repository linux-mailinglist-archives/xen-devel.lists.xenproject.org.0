Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786AAA5E87D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 00:37:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911043.1317606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVdU-0002O3-7v; Wed, 12 Mar 2025 23:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911043.1317606; Wed, 12 Mar 2025 23:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsVdU-0002M2-5A; Wed, 12 Mar 2025 23:37:16 +0000
Received: by outflank-mailman (input) for mailman id 911043;
 Wed, 12 Mar 2025 23:37:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K94u=V7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tsVdS-0002Lu-T2
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 23:37:14 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec208b49-ff9a-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 00:37:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22C54A44E3A;
 Wed, 12 Mar 2025 23:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633FFC4CEDD;
 Wed, 12 Mar 2025 23:37:10 +0000 (UTC)
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
X-Inumbo-ID: ec208b49-ff9a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741822631;
	bh=zjXyfOS9vvbaRU96cq2Q4ht4XwOh41Qzp2pDER2KM+M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HVW8BJxYjReC62XR0aHAzd0JGGXevHBj+PN9OHIhsq9zaoT5U20NLzIb4MiyUfISl
	 3PjdlqCX5C1J5ufM7F4+/PQKjhxb5E91ufl0tP2Pmb8QPN9VpJRNFuussWgpq8riHr
	 gDTHQaIbpiBPbyKDObp980VPt3MpD4xf7fRcShNO3JIz1pcun5pZc1CtFJ/j1f4/id
	 8/I3AtspW1qh1GWo1ouksRCZuX+4ekt/1U1VBhyfN9jT9zkbhhzZjFs3rOyjGbWuHL
	 eImUkbNxV0Ae06tlM+tydkRDodIEA+Z574ebcQGLe1gD7SDBJfao67yDCJi8GoDyc4
	 7q0ESeGyQqxVA==
Date: Wed, 12 Mar 2025 16:37:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1 16/19] xen/sysctl: wrap around
 XEN_SYSCTL_coverage_op
In-Reply-To: <20250312040632.2853485-17-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503121636370.3477110@ubuntu-linux-20-04-desktop>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com> <20250312040632.2853485-17-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Mar 2025, Penny Zheng wrote:
> All coverage-related op shall be wrapped around with CONFIG_SYSCTL,
> so this commit makes CONFIG_COVERAGE depend on CONFIG_SYSCTL.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index c4a8d86912..b226ca9b6e 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -37,7 +37,7 @@ config SELF_TESTS
>  
>  config COVERAGE
>  	bool "Code coverage support"
> -	depends on !LIVEPATCH
> +	depends on !LIVEPATCH && SYSCTL
>  	select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if !ENFORCE_UNIQUE_SYMBOLS
>  	help
>  	  Enable code coverage support.
> -- 
> 2.34.1
> 

