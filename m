Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 432D461E567
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438675.692761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orknZ-0005nC-Hb; Sun, 06 Nov 2022 18:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438675.692761; Sun, 06 Nov 2022 18:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orknZ-0005kx-Ep; Sun, 06 Nov 2022 18:55:13 +0000
Received: by outflank-mailman (input) for mailman id 438675;
 Sun, 06 Nov 2022 18:55:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orknX-0005kb-Ng
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:55:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orknX-0006Jl-B2; Sun, 06 Nov 2022 18:55:11 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orknX-00027w-4f; Sun, 06 Nov 2022 18:55:11 +0000
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
	bh=MpeTcE9GW2bBEQ5mJW3VAHRwMPM8OSVW6IKCRow1rSM=; b=cGq2H1xfFsz92xPEz0d+aF2pHj
	vKroEn9aHx5lccBb4OSxQzvcHvwXBO8Ol9X85OoubxwOmkbePJrsWGofvv0K51e62Gn+QpVcIAqeS
	MQf/L8LfWPGc4I/pxuFLZUg4Wc1nNdls7jiQTE5AkPyHNpxXc+nh8oHL2SMLtyzGz3qQ=;
Message-ID: <a3b0c695-3e2f-7529-39c6-2e4c23ee9b78@xen.org>
Date: Sun, 6 Nov 2022 18:55:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-3-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 02/11] xen/arm: add iounmap after initrd has been
 loaded in domain_build
In-Reply-To: <20221104100741.2176307-3-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+ Henry)

Hi,

On 04/11/2022 10:07, Wei Chen wrote:
> domain_build use ioremap_wc to map a new non-cacheable virtual

s/use/uses/

> address for initrd. After Xen copy initrd from this address to
> guest, this new allocated virtual address has not been unmapped.
> 
> So in this patch, we add an iounmap to the end of domain_build,
> after Xen loaded initrd to guest memory.
> 

Please a fixes tag. The issue was introduced by commit bb7e6d565d92.

> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 4fb5c20b13..bd30d3798c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3418,6 +3418,8 @@ static void __init initrd_load(struct kernel_info *kinfo)
>                                             initrd, len);
>       if ( res != 0 )
>           panic("Unable to copy the initrd in the hwdom memory\n");
> +
> +    iounmap(initrd);

This looks good to me. But I am wondering whether using ioremap_wc() is 
actually correct because we are reading the region. So it seems strang 
to map it with write-combine.

So I would consider to use ioremap_cache(). That said, this would be a 
separate patch.

I think this wants to be in 4.17. This will avoid Xen to have two 
mappings with different caching attribute (initrd is part of the RAM and 
therefore directmap).

Cheers,

-- 
Julien Grall

