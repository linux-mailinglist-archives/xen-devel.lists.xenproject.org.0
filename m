Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED138A56292
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 09:32:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904685.1312527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqT7I-00078v-JA; Fri, 07 Mar 2025 08:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904685.1312527; Fri, 07 Mar 2025 08:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqT7I-00077J-GY; Fri, 07 Mar 2025 08:31:36 +0000
Received: by outflank-mailman (input) for mailman id 904685;
 Fri, 07 Mar 2025 08:31:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqT7H-00077D-3d
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 08:31:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqT7G-006tKL-2a;
 Fri, 07 Mar 2025 08:31:34 +0000
Received: from [2a02:8012:3a1:0:9517:10f4:44fb:20af]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqT7G-00C5op-19;
 Fri, 07 Mar 2025 08:31:34 +0000
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
	bh=h19r5AIA3nZOO5CuFfijzYmocGFVLxFl0Bdn5FndP5Y=; b=nLJ+5zGvlOcXaXY6lG8Ku4pihw
	dm78tEm5I/3TLvKKe66GOnUji9RJyEEX8d7u0nhDYObsf9JdSb6jrINDo2Ee94+8Nuw7neNc+gg3A
	15NGeMYC8jMjOt8aC5sRgXAfSSLDgkTY1w2AEmScdX9jVnKMGd4jYuemyxgF8gGVv738=;
Message-ID: <4ee02463-c413-4afc-add6-d7bf3915dd5a@xen.org>
Date: Fri, 7 Mar 2025 08:31:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
Content-Language: en-GB
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-5-jason.andryuk@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250306220343.203047-5-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/03/2025 22:03, Jason Andryuk wrote:
> Assign domid 0 to the hwdom.  Normally, dom0less does not use domid 0.

A few years ago, we went to great length to avoid making the assumption 
that the hardware domain is domid 0. See all the calls to 
"is_hardware_domain()". So I am reluctant to force the domain ID to 0.

> 
> This fixes using the Xen console which assumes domid 0 to use the
> hypercall interface.

I had a brief look at drivers/char/console.c and I can't find any place 
assuming "domid 0". Do you have any pointer?

> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>   xen/arch/arm/dom0less-build.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index e539bcc762..5a7871939b 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -969,6 +969,7 @@ void __init create_domUs(void)
>       dt_for_each_child_node(chosen, node)
>       {
>           struct domain *d;
> +        domid_t domid;
>           struct xen_domctl_createdomain d_cfg = {
>               .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>               .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> @@ -1121,7 +1122,12 @@ void __init create_domUs(void)
>            * very important to use the pre-increment operator to call
>            * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
>            */
> -        d = domain_create(++max_init_domid, &d_cfg, flags);
> +        if ( flags & CDF_hardware )
> +            domid = 0;
> +        else
> +            domid = ++max_init_domid;
> +
> +        d = domain_create(domid, &d_cfg, flags);
>           if ( IS_ERR(d) )
>               panic("Error creating domain %s (rc = %ld)\n",
>                     dt_node_name(node), PTR_ERR(d));

Cheers,

-- 
Julien Grall


