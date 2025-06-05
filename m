Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A81ACF97F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 00:06:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007636.1386910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNIiR-00080D-U0; Thu, 05 Jun 2025 22:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007636.1386910; Thu, 05 Jun 2025 22:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNIiR-0007xl-Qp; Thu, 05 Jun 2025 22:05:39 +0000
Received: by outflank-mailman (input) for mailman id 1007636;
 Thu, 05 Jun 2025 22:05:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uNIiQ-0007xf-6u
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 22:05:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNIiP-003luZ-1F;
 Thu, 05 Jun 2025 22:05:37 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uNIiP-0080sf-1s;
 Thu, 05 Jun 2025 22:05:37 +0000
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
	bh=G3DEaH/aPg1f1xdeQjwQocPfTfFGy3VvbeZYsCW/q9U=; b=kVBqH/w0gqUVv452qZCjeyMHHt
	a2Hk+4W57GmfsNNOEq5ZAWoPvkJlMksGvcUhF0YhcU4ov6VfccTZG39GxjVqYr2PER0MA+ydjqPiV
	qaNY5MymHQKrA8K5orGeQNz01z2/XUVwmM6hKH/zyynuf5HPY3Px7y5RNnUAHayy1XeY=;
Message-ID: <63087c42-d709-4e53-a2c3-8b812f13190a@xen.org>
Date: Thu, 5 Jun 2025 23:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] xen/domain: adjust domain ID allocation for Arm
Content-Language: en-GB
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech,
 dmukhin@ford.com
References: <20250528225030.2652166-1-dmukhin@ford.com>
 <20250528225030.2652166-3-dmukhin@ford.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250528225030.2652166-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denis,

On 28/05/2025 23:50, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmkhn@proton.me>
> 
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Remove the hardcoded domain ID 0 allocation for hardware domain and replace it
> with a call to get_initial_domain_id() (returns the value of hardware_domid on
> Arm).

I am not entirely why this is done. Are you intending to pass a 
different domain ID? If so...

> 
> Update domid_alloc(DOMID_INVALID) case to ensure that get_initial_domain_id()
> ID is skipped during domain ID allocation to cover domU case in dom0less
> configuration. That also fixes a potential issue with re-using ID#0 for domUs
> when get_initial_domain_id() returns non-zero.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v8:
> - rebased
> ---
>   xen/arch/arm/domain_build.c             | 4 ++--
>   xen/common/device-tree/dom0less-build.c | 9 +++------
>   xen/common/domain.c                     | 4 ++--
>   3 files changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index e9d563c269..0ad80b020a 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2035,9 +2035,9 @@ void __init create_dom0(void)

... naming like create_dom0() probably wants to be renamed.

That said, I am not convinced a domain other than 0 should have full 
privilege by default. So I would argue it should stay as ...

>       if ( !llc_coloring_enabled )
>           flags |= CDF_directmap;
>   
> -    domid = domid_alloc(0);
> +    domid = domid_alloc(get_initial_domain_id());

... 0.

>       if ( domid == DOMID_INVALID )
> -        panic("Error allocating domain ID 0\n");
> +        panic("Error allocating domain ID %d\n", get_initial_domain_id());
>   
>       dom0 = domain_create(domid, &dom0_cfg, flags);
>       if ( IS_ERR(dom0) )
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index a509f8fecd..9a6015f4ce 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -974,14 +974,11 @@ void __init create_domUs(void)
>   
>           arch_create_domUs(node, &d_cfg, flags);
>   
> -        /*
> -         * The variable max_init_domid is initialized with zero, so here it's
> -         * very important to use the pre-increment operator to call
> -         * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
> -         */
> -        domid = domid_alloc(++max_init_domid);
> +        domid = domid_alloc(DOMID_INVALID);
>           if ( domid == DOMID_INVALID )
>               panic("Error allocating ID for domain %s\n", dt_node_name(node));
> +        if ( max_init_domid < domid )
> +            max_init_domid = domid;
>   
>           d = domain_create(domid, &d_cfg, flags);
>           if ( IS_ERR(d) )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index ae0c44fcbb..129b4fcb37 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -2423,8 +2423,8 @@ domid_t domid_alloc(domid_t domid)
>       else
>       {
>           static domid_t domid_last;
> -        /* NB: account for late hwdom case, skip ID#0 */
> -        const domid_t reserved_domid = 0;
> +        /* NB: account for late hwdom case */
> +        const domid_t reserved_domid = get_initial_domain_id();

This is somewhat confusing to modify domid_alloc() in a patch that is 
meant to modify only the Arm allocation. Can you clarify why this can't 
be done earlier?

>           const bool reserved = __test_and_set_bit(reserved_domid, domid_bitmap);
>   
>           domid = find_next_zero_bit(domid_bitmap, DOMID_FIRST_RESERVED,

Cheers,

-- 
Julien Grall


