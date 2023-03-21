Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC16C363C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:50:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512820.793077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeFw-0002db-9e; Tue, 21 Mar 2023 15:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512820.793077; Tue, 21 Mar 2023 15:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peeFw-0002b6-6d; Tue, 21 Mar 2023 15:50:36 +0000
Received: by outflank-mailman (input) for mailman id 512820;
 Tue, 21 Mar 2023 15:50:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1peeFu-0002ay-Eq
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:50:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peeFt-00008m-VM; Tue, 21 Mar 2023 15:50:33 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peeFt-0004SQ-N8; Tue, 21 Mar 2023 15:50:33 +0000
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
	bh=7qcG3vGboJGyIVkf/yyaD3BX1m9CaJ6xngUC2gsd1gw=; b=uK6pZkHoITLbHH4nVknyLf8huL
	N474WbBprSa0Gi9bqrSnJI1Hoy5bI7cBmCA7KFh9a7lcT5zwGdqzql9jPtwAGTcF9cca7aHjNEa3q
	yHJznmNgtt+m4us9T0FnXWwwbt0gR5jJB/HFXh5IT7dsOgEna5vfCp9pycz+hQK4r2nk=;
Message-ID: <a2287b5b-40b1-aeab-8f07-413853d2484d@xen.org>
Date: Tue, 21 Mar 2023 15:50:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 4/4] xen/arm: Clean-up in p2m_init() and
 p2m_final_teardown()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-5-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230130040614.188296-5-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 30/01/2023 04:06, Henry Wang wrote:
> With the change in previous patch, the initial 16 pages in the P2M
> pool is not necessary anymore. Drop them for code simplification.
> 
> Also the call to p2m_teardown() from arch_domain_destroy() is not
> necessary anymore since the movement of the P2M allocation out of
> arch_domain_create(). Drop the code and the above in-code comment
> mentioning it.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> ---
> I am not entirely sure if I should also drop the "TODO" on top of
> the p2m_set_entry(). Because although we are sure there is no
> p2m pages populated in domain_create() stage now, but we are not
> sure if anyone will add more in the future...Any comments?

I would keep it.

> v1 -> v2:
> 1. Add Reviewed-by tag from Michal.
> ---
>   xen/arch/arm/include/asm/p2m.h |  4 ----
>   xen/arch/arm/p2m.c             | 20 +-------------------
>   2 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index bf5183e53a..cf06d3cc21 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -200,10 +200,6 @@ int p2m_init(struct domain *d);
>    *  - p2m_final_teardown() will be called when domain struct is been
>    *    freed. This *cannot* be preempted and therefore one small

NIT: As you are touching the comment, would you mind to fix the typo 
s/one/only/.

>    *    resources should be freed here.
> - *  Note that p2m_final_teardown() will also call p2m_teardown(), to properly
> - *  free the P2M when failures happen in the domain creation with P2M pages
> - *  already in use. In this case p2m_teardown() is called non-preemptively and
> - *  p2m_teardown() will always return 0.
>    */
>   int p2m_teardown(struct domain *d, bool allow_preemption);
>   void p2m_final_teardown(struct domain *d);
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index f1ccd7efbd..46406a9eb1 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1750,13 +1750,9 @@ void p2m_final_teardown(struct domain *d)
>       /*
>        * No need to call relinquish_p2m_mapping() here because
>        * p2m_final_teardown() is called either after domain_relinquish_resources()
> -     * where relinquish_p2m_mapping() has been called, or from failure path of
> -     * domain_create()/arch_domain_create() where mappings that require
> -     * p2m_put_l3_page() should never be created. For the latter case, also see
> -     * comment on top of the p2m_set_entry() for more info.
> +     * where relinquish_p2m_mapping() has been called.
>        */
>   
> -    BUG_ON(p2m_teardown(d, false));

With this change, I think we can also drop the second parameter of 
p2m_teardown(). Preferably with this change in the patch:

Acked-by: Julien Grall <jgrall@amazon.com>

Preferably, I would like this to happen in this patch.

Cheers,

-- 
Julien Grall

