Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0294EF905
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 19:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297524.506877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLCG-0005Va-Qp; Fri, 01 Apr 2022 17:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297524.506877; Fri, 01 Apr 2022 17:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naLCG-0005TB-Nx; Fri, 01 Apr 2022 17:36:28 +0000
Received: by outflank-mailman (input) for mailman id 297524;
 Fri, 01 Apr 2022 17:36:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naLCF-0005T5-QU
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 17:36:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLCF-0002Iy-F6; Fri, 01 Apr 2022 17:36:27 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naLCF-0008HY-9F; Fri, 01 Apr 2022 17:36:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=YSBiLUeQsxFk/gSWE7D7F17hwcOAVb0byVQKts+4Xwk=; b=UI0ZRs+D7S4Shav0Q9JvLFMFBU
	RVM9z81n1/knPZHMv5CuvDXZQPLeZ7wU7emS8LUgp2rEhfMWGutW1GoSHzFYJHJENi/bg0BAgX6Bg
	ur7mHV5USGbfiX4+cNTfhdiCUoBb6uFb9hwTvHGzlQ/OC0S1DXg31n5VygLxzJWMoTpY=;
Message-ID: <ce203dce-bb00-4eeb-d0ab-5c407c070a79@xen.org>
Date: Fri, 1 Apr 2022 18:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 3/9] xen/arm: temporarily elevate idle_domain
 privileged during create_domUs
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-3-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220401003847.38393-3-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/04/2022 01:38, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> create_domUs might call functions that perform XSM checks on the current
> domain, which is idle_domain at this time. Temporarily elevate
> idle_domain privileges in create_domUs.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/domain_build.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index b6189b935d..100a4959a8 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -27,6 +27,7 @@
>   #include <asm/setup.h>
>   #include <asm/cpufeature.h>
>   #include <asm/domain_build.h>
> +#include <xsm/xsm.h>
>   
>   #include <xen/irq.h>
>   #include <xen/grant_table.h>
> @@ -3210,6 +3211,8 @@ void __init create_domUs(void)
>       struct dt_device_node *node;
>       const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
>   
> +    xsm_elevate_priv(current->domain);

Please check the return of this function and...

> +
>       BUG_ON(chosen == NULL);
>       dt_for_each_child_node(chosen, node)
>       {
> @@ -3291,6 +3294,8 @@ void __init create_domUs(void)
>           if ( construct_domU(d, node) != 0 )
>               panic("Could not set up domain %s\n", dt_node_name(node));
>       }
> +
> +    xsm_demote_priv(current->domain);

... this. For us, it should hopefully be 0. But it is a good practice to 
confirm.

Cheers,

-- 
Julien Grall

