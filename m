Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F76602958
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 12:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424834.672559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okjsy-0004An-An; Tue, 18 Oct 2022 10:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424834.672559; Tue, 18 Oct 2022 10:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okjsy-00048P-6w; Tue, 18 Oct 2022 10:31:48 +0000
Received: by outflank-mailman (input) for mailman id 424834;
 Tue, 18 Oct 2022 10:31:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okjsx-00048J-1w
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 10:31:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okjsw-0006ui-Ns; Tue, 18 Oct 2022 10:31:46 +0000
Received: from [15.248.2.52] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okjsw-0003lH-FX; Tue, 18 Oct 2022 10:31:46 +0000
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
	bh=cAjyBr40IBDLi78Yf9k9FTGxZ1/hLIyOZYAS0CCYdpE=; b=Q53ecbAv2TR2vpRqaFBYSoD1Kk
	fKxW46KamT689f7LgK32qhLI6hXn6lp11VTAGDURc98294dKHDL1xyoBwG94mPbe1/RQvwCr1gYJj
	KBSQ+oisoBfzu4GSytCKJVLvlMWaszdBqJD0mCRlbSu170hE+QcOIquCCCsR0pMZgTCM=;
Message-ID: <42ad10fb-0d77-2f5f-ff34-dbdcb42523fd@xen.org>
Date: Tue, 18 Oct 2022 11:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH] xen/arm: p2m: fix pa_range_info for 52-bit pa range
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221017173209.236781-1-burzalodowa@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221017173209.236781-1-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Xenia,

On 17/10/2022 18:32, Xenia Ragiadakou wrote:
> Currently the pa_range_info for the 52-bit pa range advertizes that the
> p2m root table consists of 8 concatenated tables at level 3, which does
> not make much sense.
> In order to support the 52-bit pa size with 4KB granule, the p2m root
> table needs to be configured either as a single table at level -1 or
> as 16 concatenated tables at level 0.
> Since, currently there is not support for level -1, set the
> root_order and sl0 fields of the corresponding pa_range_info according
> to the second approach.
> 

Please add a Fixes tag. Also, it would be good to provide a reference to 
the Arm Arm (paragraph + version) so it is easier to find where your 
values come from.

Cheers,

> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
>   xen/arch/arm/p2m.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index f17500ddf3..c824d62806 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -2251,7 +2251,7 @@ void __init setup_virt_paging(void)
>           [3] = { 42,      22/*22*/,  3,          1 },
>           [4] = { 44,      20/*20*/,  0,          2 },
>           [5] = { 48,      16/*16*/,  0,          2 },
> -        [6] = { 52,      12/*12*/,  3,          3 },
> +        [6] = { 52,      12/*12*/,  4,          2 },
>           [7] = { 0 }  /* Invalid */
>       };
>   

-- 
Julien Grall

