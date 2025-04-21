Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C966A9579C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 22:56:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961481.1352885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yAb-0001oD-NC; Mon, 21 Apr 2025 20:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961481.1352885; Mon, 21 Apr 2025 20:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6yAb-0001ld-KE; Mon, 21 Apr 2025 20:55:13 +0000
Received: by outflank-mailman (input) for mailman id 961481;
 Mon, 21 Apr 2025 20:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u6yAa-0001lX-MU
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 20:55:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4fc0fd5-1ef2-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 22:55:03 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4F1825C5844;
 Mon, 21 Apr 2025 20:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3E8C4CEE4;
 Mon, 21 Apr 2025 20:54:59 +0000 (UTC)
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
X-Inumbo-ID: e4fc0fd5-1ef2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745268901;
	bh=BVbkA8k/6Gw/DKOJPmwEaGiYujMyEDeKrZ0qw9jWziM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rkOHoUBWR35D316Nv90zERlWkQ4WCoaBgQy32PbZZD9glAthkeXE1GYxliEaUrIfA
	 Ab7PbtZObdUVI1+4Qs8ziS1xf5Ow3f6SVo7Cb1uoN+9n9jfLk2eihcisPlLS5YTOfI
	 3UfQM6EmenFlLEzEDYT6uP18Op+i60B0kxmo9CRn+GVoh2VBVaZzuO/iFCtc3B/iEK
	 OmwLYs2M40f6gzpr1uNIG7jMXBMsSgmCPrLdXF0fxyHLxxh9K+nlwQ2bVcVZisBiNk
	 u+AI9BVC2rmP53vj+Ke7rXfKQF9o9zEQpO16La5FFQ/oM21/KfMCjzuQ4Awq9aaJlB
	 XdShKBJnx98KA==
Date: Mon, 21 Apr 2025 13:54:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Subject: Re: [PATCH v3 02/20] xen: introduce CONFIG_SYSCTL
In-Reply-To: <20250421073723.3863060-3-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504211354290.785180@ubuntu-linux-20-04-desktop>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com> <20250421073723.3863060-3-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Apr 2025, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> We introduce a new Kconfig CONFIG_SYSCTL, which shall only be disabled
> on some dom0less systems, to reduce Xen footprint.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2 -> v3:
> - remove "intend to" in commit message
> ---
>  xen/common/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index be28060716..d89e9ede77 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -581,4 +581,15 @@ config BUDDY_ALLOCATOR_SIZE
>  	  Amount of memory reserved for the buddy allocator to serve Xen heap,
>  	  working alongside the colored one.
>  
> +menu "Supported hypercall interfaces"
> +	visible if EXPERT
> +
> +config SYSCTL
> +	bool "Enable sysctl hypercall"
> +	default y
> +	help
> +	  This option shall only be disabled on some dom0less systems,
> +	  to reduce Xen footprint.
> +endmenu
> +
>  endmenu
> -- 
> 2.34.1
> 

