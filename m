Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50940524ADC
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 12:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327616.550437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np6SX-0007y7-Qe; Thu, 12 May 2022 10:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327616.550437; Thu, 12 May 2022 10:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np6SX-0007wE-NG; Thu, 12 May 2022 10:54:17 +0000
Received: by outflank-mailman (input) for mailman id 327616;
 Thu, 12 May 2022 10:54:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1np6SW-0007w2-BR
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 10:54:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1np6SW-0005Ju-3K; Thu, 12 May 2022 10:54:16 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.236.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1np6SV-0002yY-T8; Thu, 12 May 2022 10:54:16 +0000
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
	bh=kx3kPTfdWRPEzaBDmKa7YK3Q8JqgZjy2Mdn5f4+lTTo=; b=E2TobDW/pvK+0pj2K2GmudIQrW
	iljcTx84WDQMzarplVR3VTLkBmas2By+nqDm9VwEWJMe2I/wp7gsTsjiYWIaBHiZ+gQTNdvaKWQFg
	gTLV7X/rEQgUXkq9hRaxumnvhLTkeyHaSzG6ppxoblLognA7EpWakGGZZ4VasFBzPppI=;
Message-ID: <32b425e9-2430-8525-913e-6626efbec415@xen.org>
Date: Thu, 12 May 2022 11:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v3 5/8] xen/arm: Add additional reference to owner domain
 when the owner is allocated
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220512091129.2802997-1-Penny.Zheng@arm.com>
 <20220512091129.2802997-6-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220512091129.2802997-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/05/2022 10:11, Penny Zheng wrote:
> @@ -827,6 +858,37 @@ static int __init allocate_shared_memory(struct domain *d,
>           }
>       }
>   
> +    /*
> +     * Get the right amount of references per page, which is the number of
> +     * borrow domains.
> +     */
> +    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
> +    if ( ret )
> +        return ret;
> +
> +    /*
> +     * Instead of let borrower domain get a page ref, we add as many
> +     * additional reference as the number of borrowers when the owner
> +     * is allocated, since there is a chance that owner is created
> +     * after borrower.
> +     */
> +    page = mfn_to_page(smfn);
Where do you check that the range [smfn, smfn + nr_pages] is actual RAM? 
If there are none, then you should use mfn_valid() for each mfn to 
ensure there will be a struct page for it.

Cheers,

-- 
Julien Grall

