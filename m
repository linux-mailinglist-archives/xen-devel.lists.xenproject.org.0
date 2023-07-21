Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 067DD75C3F1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 12:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567449.886509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMmxW-0002GE-CD; Fri, 21 Jul 2023 10:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567449.886509; Fri, 21 Jul 2023 10:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMmxW-0002EG-8t; Fri, 21 Jul 2023 10:02:02 +0000
Received: by outflank-mailman (input) for mailman id 567449;
 Fri, 21 Jul 2023 10:02:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMmxV-0002EA-Gk
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 10:02:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMmxU-0001Ek-Rk; Fri, 21 Jul 2023 10:02:00 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMmxU-0007Xa-M2; Fri, 21 Jul 2023 10:02:00 +0000
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
	bh=ZDO5Nsb0PpfP+K3tpdK4x4UWrHWyTBVKaMLkPJnbiKY=; b=UninlnJFvxcZCjKXxObA6/0kjo
	rdHmSrcTAZBoZFImjniTm1Hd34sdFO0+1RTsPVABLBIzcoxUdQYxhUfCYCZ3f/8cs4Nyny210/Tnh
	cRHNx+NxfTSRd5+7YK06IARe71lstmwkpfjSDW64LUs0k5KoCVE9vaH8ocRLzlS1xhEI=;
Message-ID: <9c1b7c53-f8da-76a2-cc02-7c72a3030be4@xen.org>
Date: Fri, 21 Jul 2023 11:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/arm: p2m: refactor 'p2m_get_entry'
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <118566cd8b9ebbcedd2b610f5f602cc31c12fd55.1689922099.git.nicola.vetrini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <118566cd8b9ebbcedd2b610f5f602cc31c12fd55.1689922099.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

I would add "to please ECLAIR" in the commit title.

On 21/07/2023 07:49, Nicola Vetrini wrote:
> This function is refactored to avoid using a
> local dummy variable that served as a fallback
> if the parameter 't' is NULL.
> 
> Storing the address of that variable into 't' caused
> static analysis tools not to be able to recognize the

Can you mention which static analysis tools is not happy and the 
version? This could help us in the future if we decided to revert the patch.

> validity of the initialization, and to help with automatic
> checking the two usages of 't' have been slightly refactored.
> 
> No functional changes.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Suggested-by: Julien Grall <julien@xen.org>
> ---
>   xen/arch/arm/p2m.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index de32a2d638..05d65db01b 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -496,16 +496,13 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>       lpae_t entry, *table;
>       int rc;
>       mfn_t mfn = INVALID_MFN;
> -    p2m_type_t _t;
>       DECLARE_OFFSETS(offsets, addr);
>   
>       ASSERT(p2m_is_locked(p2m));
>       BUILD_BUG_ON(THIRD_MASK != PAGE_MASK);
>   
> -    /* Allow t to be NULL */
> -    t = t ?: &_t;
> -
> -    *t = p2m_invalid;
> +    if ( t )
> +        *t = p2m_invalid;
>   
>       if ( valid )
>           *valid = false;
> @@ -549,7 +546,8 @@ mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn,
>   
>       if ( p2m_is_valid(entry) )
>       {
> -        *t = entry.p2m.type;
> +        if ( t )
> +            *t = entry.p2m.type;
>   
>           if ( a )
>               *a = p2m_mem_access_radix_get(p2m, gfn);

Cheers,

-- 
Julien Grall

