Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD2511C88
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 19:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315315.533800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlGO-00079r-Ms; Wed, 27 Apr 2022 17:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315315.533800; Wed, 27 Apr 2022 17:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlGO-00076n-JL; Wed, 27 Apr 2022 17:15:40 +0000
Received: by outflank-mailman (input) for mailman id 315315;
 Wed, 27 Apr 2022 17:15:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njlGM-00076h-Ru
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 17:15:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlGM-0002kD-JC; Wed, 27 Apr 2022 17:15:38 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlGM-0000Lp-DB; Wed, 27 Apr 2022 17:15:38 +0000
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
	bh=dz4dbn3T1sjWaVu8fskGr2ocgzGZwh7MGqqS7N9SFmQ=; b=3ol0dSyOx8VQcCGrjx5zEOk3C1
	9afMnMgTzzHyBY60sE6SFfGenLV82LVKCmtKltFZkqk0WwJ13wFeEOJcPqVRv4bvDHs/yRPHQXBaU
	Md3xQwde/ZRXpn+2qGQmAcVRce5TCzmu9xvhoaQ3pNFahmiWSCn2TUQl4b7XF+w8pMC8=;
Message-ID: <2e348a81-08e0-0616-5a50-554a36704df6@xen.org>
Date: Wed, 27 Apr 2022 18:15:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 1/8] xen/arm: bootfdt.c: Remove unused-but-set variable
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
 <20220427094941.291554-2-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220427094941.291554-2-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 27/04/2022 10:49, Michal Orzel wrote:
> Function device_tree_node_compatible defines and sets a variable
> mlen but does not make use of it. Remove this variable.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
>   xen/arch/arm/bootfdt.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index e318ef9603..29671c8df0 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -36,11 +36,8 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
>                                                  const char *match)
>   {
>       int len, l;
> -    int mlen;
>       const void *prop;
>   
> -    mlen = strlen(match);
> -
>       prop = fdt_getprop(fdt, node, "compatible", &len);
>       if ( prop == NULL )
>           return false;

Cheers,

-- 
Julien Grall

