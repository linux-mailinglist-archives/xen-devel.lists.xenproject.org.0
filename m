Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F16E15AE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 22:14:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520953.809128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn3K4-00038t-2Z; Thu, 13 Apr 2023 20:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520953.809128; Thu, 13 Apr 2023 20:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn3K3-000366-VS; Thu, 13 Apr 2023 20:13:35 +0000
Received: by outflank-mailman (input) for mailman id 520953;
 Thu, 13 Apr 2023 20:13:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pn3K3-000360-9B
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 20:13:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn3K3-0004i0-10; Thu, 13 Apr 2023 20:13:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn3K2-0004pH-S4; Thu, 13 Apr 2023 20:13:34 +0000
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
	bh=oSq02aCdIW2vhjwtNEB7aKRGk3ADSa7uIvd++Ul2Ca4=; b=UBkUOsckgh80kXjV3FIZLezLfT
	ak+xyeWNfR9lE0f/zSF8E2nJiNl2vGZEs7d60E5jzvlQ/LzyYoK/OlEriQ6M/3gqR5JkGI78z3Byo
	y7AN2zVNbeGkGJAFnKb8LjgYu6dkPHP7lCK8GOFEksrRHjM3Slbn1WGmpZI0Ar46nVfo=;
Message-ID: <bd8f0ed2-586f-02f6-1f16-dc3b3b9c82a8@xen.org>
Date: Thu, 13 Apr 2023 21:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413192201.3255984-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen: Fold exit paths in find_text_region()
In-Reply-To: <20230413192201.3255984-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

You may want to update your runes to find the maintainers as you are 
CCing the x86 folks but not the REST (the patch modifies common/ after all).

On 13/04/2023 20:22, Andrew Cooper wrote:
> Despite rcu_read_unlock() being fully inlineable, the optimiser cannot fold
> these exit paths, because of the various compiler barriers providing RCU
> safety.  Help the compiler out.

Please mention which compiler(s) (including version) you used.

> 
> This compiles to marginally better code in all cases.
So the code itself is fine with me. But this raises a few questions. If 
this is marginal, then why are you doing it? What's your end goal?

Lastly what do you mean by "all cases"? Is it all arch? All compilers?

Anyway, if this pattern is important (TBD why), then I think we should 
update the CODING_STYLE with some guidance. Otherwise, we may introduce 
similar patterns (we already have some).

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>   xen/common/virtual_region.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
> index 30b0b4ab9c85..5ecdba9c08ed 100644
> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -40,20 +40,20 @@ static DEFINE_RCU_READ_LOCK(rcu_virtual_region_lock);
>   
>   const struct virtual_region *find_text_region(unsigned long addr)
>   {
> -    const struct virtual_region *region;
> +    const struct virtual_region *iter, *region = NULL;
>   
>       rcu_read_lock(&rcu_virtual_region_lock);
> -    list_for_each_entry_rcu( region, &virtual_region_list, list )
> +    list_for_each_entry_rcu ( iter, &virtual_region_list, list )
>       {
> -        if ( (void *)addr >= region->start && (void *)addr < region->end )
> +        if ( (void *)addr >= iter->start && (void *)addr < iter->end )
>           {
> -            rcu_read_unlock(&rcu_virtual_region_lock);
> -            return region;
> +            region = iter;
> +            break;
>           }
>       }
>       rcu_read_unlock(&rcu_virtual_region_lock);
>   
> -    return NULL;
> +    return region;
>   }
>   
>   void register_virtual_region(struct virtual_region *r)

Cheers,

-- 
Julien Grall

