Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 243FF510945
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 21:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314127.532060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njR68-0008QM-VA; Tue, 26 Apr 2022 19:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314127.532060; Tue, 26 Apr 2022 19:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njR68-0008OE-SC; Tue, 26 Apr 2022 19:43:44 +0000
Received: by outflank-mailman (input) for mailman id 314127;
 Tue, 26 Apr 2022 19:43:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njR67-0008O6-1j
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 19:43:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njR64-0003yL-K3; Tue, 26 Apr 2022 19:43:40 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njR64-0006u2-Ee; Tue, 26 Apr 2022 19:43:40 +0000
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
	bh=Br5U3gJizTxRRDgynqD5Dfbji+NcUWjzCSSQUqnlHbs=; b=cmQfSfIkl1RemHeYo51D+ObHFI
	cRKk0t6tqY9dfryTxmiLVZGshQIlLKzaTY1Pw+s5IDRt9cTl/WYaWcd0O0Cx2kDVsjt1efEuuKrsY
	seNvE9To7JTO/NqMSlX0Gj1B3rjyFdyhsUIPA8/61yTDEdvSSwE4duhsP6NJGZ33eLJM=;
Message-ID: <0028b769-ff2b-cadd-d85c-ec7885304b73@xen.org>
Date: Tue, 26 Apr 2022 20:43:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: Paran Lee <p4ranlee@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: austindh.kim@gmail.com, xen-devel@lists.xenproject.org
References: <20220426154904.GA11482@DESKTOP-NK4TH6S.localdomain>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2] xen/arm: p2m_set_entry reuse mask variables
In-Reply-To: <20220426154904.GA11482@DESKTOP-NK4TH6S.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/04/2022 16:49, Paran Lee wrote:
> Reuse mask variables on order shift duplicated calculation.
> 
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
> ---
>   xen/arch/arm/p2m.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)

It is common to add a changelog after "---". This helps the reviewer to 
know what changed in your patch.

> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 1d1059f7d2..cdb3b56aa1 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1118,11 +1118,12 @@ int p2m_set_entry(struct p2m_domain *p2m,
>           if ( rc )
>               break;
>   
> -        sgfn = gfn_add(sgfn, (1 << order));
> +        mask = 1UL << order;

"1UL << order" refers to the number of pages and not a mask. So I don't 
think re-using the local variable 'mask' is a good idea because the code 
is a lot more confusing.

Instead, I think your other patch is the way to go with a small tweak to 
use 1UL (which BTW should be mentioned in the commit message).

Either Stefano or I can deal with the change on commit.

Cheers,

-- 
Julien Grall

