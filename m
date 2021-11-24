Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEC745CBE5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 19:12:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230507.398474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwkS-0005bN-Ue; Wed, 24 Nov 2021 18:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230507.398474; Wed, 24 Nov 2021 18:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpwkS-0005Za-RS; Wed, 24 Nov 2021 18:12:00 +0000
Received: by outflank-mailman (input) for mailman id 230507;
 Wed, 24 Nov 2021 18:11:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpwkR-0005ZU-Bm
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 18:11:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwkR-0004bG-8F; Wed, 24 Nov 2021 18:11:59 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.24.101]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpwkR-0007cQ-20; Wed, 24 Nov 2021 18:11:59 +0000
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
	bh=/BFADbUzzb80bEpwOUCbJBP8dtiIgUifDtL9gVSTO2Q=; b=CYiGgakQNI/pELCJJZBlOtWE4W
	LPt2xzNtzNdLVeFn8z0GAG/ad8Dpdv155s9vesLOS3CJsjNMUIlmIMjCiGBqwTzEUZqMbUEfcBX2h
	xtM7MS3v0MYYu+A4KCuMA7m6B23yFi69raL2JLUXYETwsuZvKQz/hgUAaAWSyWZ2vu84=;
Message-ID: <11418149-7136-45bd-b3aa-bccbde91eda3@xen.org>
Date: Wed, 24 Nov 2021 18:11:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3 07/10] xen/arm: gate make_gicv3_domU_node with
 CONFIG_GICV3
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-8-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211116063155.901183-8-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 16/11/2021 06:31, Penny Zheng wrote:
> This commit gates function make_gicv3_domU_node with CONFIG_GICV3, and
> also adds ASSERT_UNREACHABLE to catch any misuse.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v3 changes:
> - new commit
> ---
>   xen/arch/arm/domain_build.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c419a4b2cc..24f3edf069 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2279,6 +2279,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>       return res;
>   }
>   
> +#ifdef CONFIG_GICV3
>   static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>   {
>       void *fdt = kinfo->fdt;
> @@ -2328,6 +2329,12 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>   
>       return res;
>   }
> +#else
> +static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
> +{
> +    ASSERT_UNREACHABLE();

This will break compilation on at least prod build with CONFIG_GICV3=n. 
However...

> +}
> +#endif

... I would prefer to #ifdef the case (as you did in the previous 
version). That said, if you strongly prefer this approach then I am OK 
with it.

>   
>   static int __init make_gic_domU_node(struct kernel_info *kinfo)
>   {
> 

Cheers,

-- 
Julien Grall

