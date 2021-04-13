Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B161635E481
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 19:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109995.209938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMPO-0008M6-F4; Tue, 13 Apr 2021 17:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109995.209938; Tue, 13 Apr 2021 17:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWMPO-0008Lh-C9; Tue, 13 Apr 2021 17:01:02 +0000
Received: by outflank-mailman (input) for mailman id 109995;
 Tue, 13 Apr 2021 17:01:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lWMPM-0008Lc-An
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 17:01:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWMPL-0008Au-AJ; Tue, 13 Apr 2021 17:00:59 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lWMPL-0006ME-2B; Tue, 13 Apr 2021 17:00:59 +0000
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
	bh=ZKaAx2rVBDfFMgQG0yrLUc0McqH4VHph3Ridw7RwOYA=; b=pvSyyQlLW+AuvNOi7wR1h5pKxS
	fW1dECYO7cG2vXcyMOjJSMEDU1NjSLJxmuIJZiE3GTSIYM3Pc2SOgaxk43rUyzW7s/bSEUARnYCb4
	LwLQjVMMpUZk5FcvB9eBwPkOLj9wfuOeYwhv4s2PQsQvsXiXtVisVDK7tP45HgVSCUco=;
Subject: Re: [PATCH v3 3/4] xen/arm: Reserve domid 0 for Dom0
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-4-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <db54612f-e237-2084-f11e-ffd5e045c3dc@xen.org>
Date: Tue, 13 Apr 2021 18:00:57 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210412105243.23354-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

The title probably wants to be updated as you don't really reserve domid 
0. How about:

xen/arm: Clarify how the domid is decided in create_domUs()

On 12/04/2021 11:52, Luca Fancellu wrote:
> This patch adds a comment in create_domUs() right before
> domain_create() to explain the importance of the pre-increment
> operator on the variable max_init_domid, to ensure that the
> domid 0 is allocated only during start_xen() function by the
> create_dom0() and not on any other possible code path to the
> domain_create() function.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
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

