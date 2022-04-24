Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366850D33A
	for <lists+xen-devel@lfdr.de>; Sun, 24 Apr 2022 18:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312180.529378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nievA-0000ZF-5x; Sun, 24 Apr 2022 16:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312180.529378; Sun, 24 Apr 2022 16:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nievA-0000WV-2j; Sun, 24 Apr 2022 16:17:12 +0000
Received: by outflank-mailman (input) for mailman id 312180;
 Sun, 24 Apr 2022 16:17:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1niev8-0000WP-U2
 for xen-devel@lists.xenproject.org; Sun, 24 Apr 2022 16:17:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1niev6-00061a-8t; Sun, 24 Apr 2022 16:17:08 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1niev6-0004Kj-2o; Sun, 24 Apr 2022 16:17:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=+rzU2IaBKnlaamdubPg4kZon4zbw8RHOvuTtxWLYQwY=; b=HFShPMGOY63baVdPKwVne4UsyP
	XXtRBR9vT8ycu9uU4MomAMW3V+NJWfoRq+gw0V5hON1p41i33mpUcrzUDis5IABl6nstJuGBezNK/
	QQu78PrDwF/KYfuEuw5lPOMKRu4TOMltwJtfomh048t/dqF62f8luJgbLsJESZvrPjT4=;
Message-ID: <a160a77a-1cb2-c7cb-7d93-7334772620fe@xen.org>
Date: Sun, 24 Apr 2022 17:17:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: Paran Lee <p4ranlee@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: austindh.kim@gmail.com, xen-devel@lists.xenproject.org
References: <20220421151755.GA4718@DESKTOP-NK4TH6S.localdomain>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: p2m_set_entry duplicate calculation.
In-Reply-To: <20220421151755.GA4718@DESKTOP-NK4TH6S.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/04/2022 16:17, Paran Lee wrote:
> It doesn't seem necessary to do that calculation of order shift again.

I think we need to weight that against increasing the number of local 
variables that do pretty much the same.

This is pretty much done to a matter of taste here. IMHO, the original 
version is better but I see Stefano reviewed it so I will not argue 
against it.

That said, given you already sent a few patches, can you explain why you 
are doing this? Is this optimization purpose? Is it clean-up?

> 
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
> ---
>   xen/arch/arm/p2m.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 1d1059f7d2..533afc830a 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1092,7 +1092,7 @@ int p2m_set_entry(struct p2m_domain *p2m,
>       while ( nr )
>       {
>           unsigned long mask;
> -        unsigned long order;
> +        unsigned long order, pages;
>   
>           /*
>            * Don't take into account the MFN when removing mapping (i.e
> @@ -1118,11 +1118,12 @@ int p2m_set_entry(struct p2m_domain *p2m,
>           if ( rc )
>               break;
>   
> -        sgfn = gfn_add(sgfn, (1 << order));
> +        pages = 1 << order;

Please take the opportunity to switch to 1UL.

> +        sgfn = gfn_add(sgfn, pages);
>           if ( !mfn_eq(smfn, INVALID_MFN) )
> -           smfn = mfn_add(smfn, (1 << order));
> +           smfn = mfn_add(smfn, pages);
>   
> -        nr -= (1 << order);
> +        nr -= pages;
>       }
>   
>       return rc;

Cheers,

-- 
Julien Grall

