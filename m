Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63390511C8C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 19:19:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315326.533822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlJm-0008Ks-Eq; Wed, 27 Apr 2022 17:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315326.533822; Wed, 27 Apr 2022 17:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlJm-0008IL-Ai; Wed, 27 Apr 2022 17:19:10 +0000
Received: by outflank-mailman (input) for mailman id 315326;
 Wed, 27 Apr 2022 17:19:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njlJk-0008I9-V3
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 17:19:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlJk-0002ol-Pf; Wed, 27 Apr 2022 17:19:08 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlJk-0000Ts-Jx; Wed, 27 Apr 2022 17:19:08 +0000
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
	bh=k+6a+z6IqYqkH03u6mNqqrKzgFosx49vDXG5+Q+pI7w=; b=QM6cEM8fkOAi4hPQ8CPzj6M8++
	T863d4PYw5W23VS56OqrKr3IbwdOHAeu5oGpRJZp0h/q2GA9jql2bb3wQ5Fczut7qMRoxNEmu5sJB
	+Hkz2uPlgje+SICTMX5J6079Gv1x54PxV4eovsiEN4morHuKFVHF/N4i0SxH2aVWLS+8=;
Message-ID: <e5f20ce6-ff7b-0877-c607-965abb68fbd2@xen.org>
Date: Wed, 27 Apr 2022 18:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 6/8] platforms/xgene: Make use of dt_device_get_address
 return value
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-7-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220427094941.291554-7-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/04/2022 10:49, Michal Orzel wrote:
> Currently function xgene_check_pirq_eoi assignes a return value of
Typo: s/assignes/assigns/ also I think s/a return/the return/

> dt_device_get_address to a variable res but does not make use of it.
> Fix it by making use of res in a condition checking the result of a

Typo: s/a condition/the condition/ I think.

> call to dt_device_get_address instead of checking the address
> stored in dbase.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/arch/arm/platforms/xgene-storm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/platforms/xgene-storm.c b/xen/arch/arm/platforms/xgene-storm.c
> index fced4d7c2c..befd0c3c2d 100644
> --- a/xen/arch/arm/platforms/xgene-storm.c
> +++ b/xen/arch/arm/platforms/xgene-storm.c
> @@ -51,7 +51,7 @@ static void __init xgene_check_pirq_eoi(void)
>           panic("%s: Can not find interrupt controller node\n", __func__);
>   
>       res = dt_device_get_address(node, 0, &dbase, NULL);
> -    if ( !dbase )
> +    if ( res )
>           panic("%s: Cannot find a valid address for the distributor\n", __func__);
>   
>       /*

-- 
Julien Grall

