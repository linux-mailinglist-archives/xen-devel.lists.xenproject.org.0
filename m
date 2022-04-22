Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC1150ACD5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 02:37:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310583.527481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhhI8-0004WG-SG; Fri, 22 Apr 2022 00:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310583.527481; Fri, 22 Apr 2022 00:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhhI8-0004UE-OW; Fri, 22 Apr 2022 00:36:56 +0000
Received: by outflank-mailman (input) for mailman id 310583;
 Fri, 22 Apr 2022 00:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0EE=VA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhhI7-0004U8-5m
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 00:36:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e8b1515-c1d4-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 02:36:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2FFF5B829CF;
 Fri, 22 Apr 2022 00:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623EDC385A5;
 Fri, 22 Apr 2022 00:36:51 +0000 (UTC)
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
X-Inumbo-ID: 4e8b1515-c1d4-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650587812;
	bh=q77UrqyhbHNMDbtjl23QSlBQJqBW2qP/oerjc/apOe0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O8K3b3ix/Aoq1gJHNVNPUCqoWFQCq5larOk4rtjfKjmMzsI3R228DrK0i5oZVxhnB
	 xMu4yAbbvCnQMv+SNmGHPNiWBehcWGZ/7PwvzIHEWMmbyhRYfJGCfUQ7XMXhNptv3Y
	 Ik1QPXzlX3MVQZhtndW7G0GzqkRrfZlnO6XIotP3waUhFWTeEYl8qJYnSZHK6RmPPJ
	 63zDZGVx+kWkl9j3jmADIPqrSZPP04Yi0rHW2X8RyGjDPlsaD62ZmLE0Ep4nwKBQ1l
	 N0qjuXKWN9v+PpLfp1PDZWXyOSYbQD1cpPaKDlB8HA14Fgmk0BLSPI2qbtB2xGsa73
	 zy0oqZI4WmJSQ==
Date: Thu, 21 Apr 2022 17:36:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Miaoqian Lin <linmq006@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Shannon Zhao <shannon.zhao@linaro.org>, 
    Catalin Marinas <catalin.marinas@arm.com>, 
    Julien Grall <julien.grall@arm.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm/xen: Fix some refcount leaks
In-Reply-To: <20220420014913.2586-1-linmq006@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2204211727060.915916@ubuntu-linux-20-04-desktop>
References: <20220406021905.GA30436@8345e2a12d0c> <20220420014913.2586-1-linmq006@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Apr 2022, Miaoqian Lin wrote:
> The of_find_compatible_node() function returns a node pointer with
> refcount incremented, We should use of_node_put() on it when done
> Add the missing of_node_put() to release the refcount.
> 
> Fixes: 9b08aaa3199a ("ARM: XEN: Move xen_early_init() before efi_init()")
> Fixes: b2371587fe0c ("arm/xen: Read extended regions from DT and init Xen resource")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Juergen,  Boris,
I applied the patch to for-linus-5.18


> ---
> changes in v2:
> - call of_node_put in non-error path in xen_dt_guest_init
> - fix same refcount leak error in arch_xen_unpopulated_init
> ---
>  arch/arm/xen/enlighten.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
> index ec5b082f3de6..07eb69f9e7df 100644
> --- a/arch/arm/xen/enlighten.c
> +++ b/arch/arm/xen/enlighten.c
> @@ -337,12 +337,15 @@ int __init arch_xen_unpopulated_init(struct resource **res)
>  
>  	if (!nr_reg) {
>  		pr_err("No extended regions are found\n");
> +		of_node_put(np);
>  		return -EINVAL;
>  	}
>  
>  	regs = kcalloc(nr_reg, sizeof(*regs), GFP_KERNEL);
> -	if (!regs)
> +	if (!regs) {
> +		of_node_put(np);
>  		return -ENOMEM;
> +	}
>  
>  	/*
>  	 * Create resource from extended regions provided by the hypervisor to be
> @@ -403,8 +406,8 @@ int __init arch_xen_unpopulated_init(struct resource **res)
>  	*res = &xen_resource;
>  
>  err:
> +	of_node_put(np);
>  	kfree(regs);
> -
>  	return rc;
>  }
>  #endif
> @@ -424,8 +427,10 @@ static void __init xen_dt_guest_init(void)
>  
>  	if (of_address_to_resource(xen_node, GRANT_TABLE_INDEX, &res)) {
>  		pr_err("Xen grant table region is not found\n");
> +		of_node_put(xen_node);
>  		return;
>  	}
> +	of_node_put(xen_node);
>  	xen_grant_frames = res.start;
>  }
>  
> -- 
> 2.17.1
> 

