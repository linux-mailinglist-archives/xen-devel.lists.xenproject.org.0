Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA2D602BF7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 14:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424989.672705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oklwp-00006V-3X; Tue, 18 Oct 2022 12:43:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424989.672705; Tue, 18 Oct 2022 12:43:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oklwp-0008V7-0J; Tue, 18 Oct 2022 12:43:55 +0000
Received: by outflank-mailman (input) for mailman id 424989;
 Tue, 18 Oct 2022 12:43:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oklwn-0008V1-OJ
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 12:43:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oklwn-0000sy-E6; Tue, 18 Oct 2022 12:43:53 +0000
Received: from [15.248.2.52] (helo=[10.24.69.11])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oklwn-00026v-5u; Tue, 18 Oct 2022 12:43:53 +0000
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
	bh=Nid0cBE9bk9DN2UFY29/rFqOgdZoiNjfGtNkaR9NiRQ=; b=lrO8bRFnSFf/SbmnCYqLR/lljS
	6wCDnybdh5cFn9IYjl7B10KUWvKMpJUFsfxuxaOY4SN53U1srFrtAglR+G+4fBOtaQA9SBAcQbqZH
	nYHMFaafe3Tg3Od9j6pFYAY4j2tIDo/hJXurIpHky8JvyaKbVXy7OmX4XeWtkVIvN1O8=;
Message-ID: <9da32b0b-7e3c-ad38-01c6-9ae78bf92702@xen.org>
Date: Tue, 18 Oct 2022 13:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v4] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221017165133.17066-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221017165133.17066-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 17/10/2022 17:51, Henry Wang wrote:
> @@ -1736,7 +1739,20 @@ void p2m_final_teardown(struct domain *d)
>       if ( !p2m->domain )
>           return;
>   
> +    /*
> +     * No need to call relinquish_p2m_mapping() here because
> +     * p2m_final_teardown() is called either after domain_relinquish_resources()
> +     * where relinquish_p2m_mapping() has been called, or from failure path of
> +     * domain_create()/arch_domain_create() where mappings that require
> +     * p2m_put_l3_page() should never be created. For the latter case, also see
> +     * comment on top of the p2m_set_entry() for more info.
> +     */
> +
> +    BUG_ON(p2m_teardown(d, false));
>       ASSERT(page_list_empty(&p2m->pages));
> +
> +    while ( p2m_teardown_allocation(d) == -ERESTART )
> +        continue; /* No preemption support here */
>       ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
>   
>       if ( p2m->root )
> @@ -1784,6 +1800,8 @@ int p2m_init(struct domain *d)

As Andrew pointed out the change in p2m_init() will end up leaking 
either the VMID or the root table.

Andrew's patch #1 [1] should help to solve the problem. So I would 
suggest to rebase on top of it.

Other than that, the logic looks good to me. This is even knowning that 
Andrew said the code is buggy. I spent some time starring at the code 
and can't figure out where the issue lies because p2m_teardown() will do 
nothing when the list is empty. If it is not empty, then it is 
guaranteed that the VMID and root table is allocated. So the code looks 
functional but just not efficient.

We already discussed the latter point earlier in the review and agreed 
to look at improve it post 4.17.

For the former, I am happy to be proven wrong. But this is going to 
require more substantial explanations.

Cheers,

-- 
Julien Grall

