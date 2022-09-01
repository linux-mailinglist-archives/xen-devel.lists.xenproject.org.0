Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9275A9DD7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 19:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396864.637224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTnkK-000589-RE; Thu, 01 Sep 2022 17:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396864.637224; Thu, 01 Sep 2022 17:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTnkK-00055D-NI; Thu, 01 Sep 2022 17:12:52 +0000
Received: by outflank-mailman (input) for mailman id 396864;
 Thu, 01 Sep 2022 17:12:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oTnkJ-000557-AD
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 17:12:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTnkJ-0000S3-0T; Thu, 01 Sep 2022 17:12:51 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.12.167]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oTnkI-0001WB-Pd; Thu, 01 Sep 2022 17:12:50 +0000
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
	bh=lsqUYYSRF6jOmbFLfp3LWn7c6Qiy5nQCpNZjqBdj4eU=; b=DfXlhcgUkMNFUKxfwqSVxa5NxV
	wBmv2z4UkItlAlq1CIltPCDuXzGy882G2tNahl+7hUSdpc0IDBRv84lkuNqzxg/6Ioc/Jc3FGJ6uc
	DmuYaFcAncYbUob0r3U5kfItc3r4hxBIiOervL6NhJXuKrxaLg8fbkBOwG7WbXhTr4YA=;
Message-ID: <781b03df-5f0d-109c-6253-2b7c4a079ce1@xen.org>
Date: Thu, 1 Sep 2022 18:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v6 5/9] xen/arm: Add additional reference to owner domain
 when the owner is allocated
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-6-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220721132115.3015761-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 21/07/2022 14:21, Penny Zheng wrote:
> Borrower domain will fail to get a page ref using the owner domain
> during allocation, when the owner is created after borrower.
> 
> So here, we decide to get and add the right amount of reference, which
> is the number of borrowers, when the owner is allocated.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

IMHO, this tag should not have been kept given...

> ---
> v6 change:
> - adapt to the change of "nr_shm_borrowers"

... this change. 'reviewed-by' means that the person reviewed the code 
and therefore agree with the logic. So I would only keep the tag if the 
change is trivial (including typo, coding style) and would drop it (or 
confirm with the person) otherwise.

Stefano, can you confirm you are happy that your reviewed-by tag is kept?

> - add in-code comment to explain if the borrower is created first, we intend to
> add pages in the P2M without reference.
> ---
> v5 change:
> - no change
> ---
> v4 changes:
> - no change
> ---
> v3 change:
> - printk rather than dprintk since it is a serious error
> ---
> v2 change:
> - new commit
> ---
>   xen/arch/arm/domain_build.c | 60 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index a7e95c34a7..e891e800a7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -761,6 +761,30 @@ static void __init assign_static_memory_11(struct domain *d,
>   }
>   
>   #ifdef CONFIG_STATIC_SHM
> +static int __init acquire_nr_borrower_domain(struct domain *d,
> +                                             paddr_t pbase, paddr_t psize,
> +                                             unsigned long *nr_borrowers)
> +{
> +    unsigned long bank;

NIT: AFAICT nr_banks is an "unsigned int".

Other than that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

