Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4B035F210
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 13:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110519.210959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdWM-00060N-LG; Wed, 14 Apr 2021 11:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110519.210959; Wed, 14 Apr 2021 11:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWdWM-0005zw-Hr; Wed, 14 Apr 2021 11:17:22 +0000
Received: by outflank-mailman (input) for mailman id 110519;
 Wed, 14 Apr 2021 11:17:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWdWL-0005zm-Ee
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 11:17:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWdWK-00006G-Ft; Wed, 14 Apr 2021 11:17:20 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWdWK-00025j-AC; Wed, 14 Apr 2021 11:17:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=D5c/8o/eZLfGAZLoFP9EC7oaRs5hZaKezvClkIul5a0=; b=rwgXCg1qOUEMMB9hFRk5wt1gaD
	Z+tk0wxhk2zZQ8OHsEWnZqZ7CcfVwSjE0pjAqP6yY8Dq0CFhT6vXcVLy3KcI6/+7JICoOV/zKDK/k
	zH+7kl6U29VfjU7SO+IEZfYn913PCEQjIvCFRWlFvh/fxq3UfGs9IqYbBA03kPQS8f0k=;
Subject: Re: [PATCH v4 3/4] xen/arm: Clarify how the domid is decided in
 create_domUs()
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210414091404.14215-1-luca.fancellu@arm.com>
 <20210414091404.14215-4-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <658c2c00-1caa-38ce-9d10-751a8caf09da@xen.org>
Date: Wed, 14 Apr 2021 12:17:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414091404.14215-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 14/04/2021 10:14, Luca Fancellu wrote:
> This patch adds a comment in create_domUs() right before
> domain_create() to explain the importance of the pre-increment
> operator on the variable max_init_domid, to ensure that the
> domid 0 is allocated only during start_xen() function by the
> create_dom0() and not on any other possible code path to the
> domain_create() function.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Changes in v4:
> - Change to the commit title
> Changes in v3:
> - removed check introduced in v2.
> ---
>   xen/arch/arm/domain_build.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 359957dc1b..b1d7b9849f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2508,6 +2508,11 @@ void __init create_domUs(void)
>                                            GUEST_VPL011_SPI - 32 + 1);
>           }
>   
> +        /*
> +         * The variable max_init_domid is initialized with zero, so here it's
> +         * very important to use the pre-increment operator to call
> +         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
> +         */
>           d = domain_create(++max_init_domid, &d_cfg, false);
>           if ( IS_ERR(d) )
>               panic("Error creating domain %s\n", dt_node_name(node));
> 

-- 
Julien Grall

