Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D4F31A222
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 16:56:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84352.158186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAanW-000396-Mn; Fri, 12 Feb 2021 15:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84352.158186; Fri, 12 Feb 2021 15:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAanW-00038h-JI; Fri, 12 Feb 2021 15:55:58 +0000
Received: by outflank-mailman (input) for mailman id 84352;
 Fri, 12 Feb 2021 15:55:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lAanV-00038a-IW
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 15:55:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lAanU-0000z3-C4; Fri, 12 Feb 2021 15:55:56 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lAanU-0004j9-61; Fri, 12 Feb 2021 15:55:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=QAwqRGeNVcQ/ggu7wEF3m0P68VKWsSn976OQ/azoyeI=; b=aEf1n+WhcJ3B1Pbrk+r+Jj7sDZ
	rVybiQauOZh0gZZe8k0r+Qa3lDDbGeZzUwDRQCxzi3UzcLvj1CK8tTE+5bOrjWt0cTe5D/qERVBfA
	G0GNzOltJYkzPc93VkX2ubuEnJh7DObMpzTAUHO/SNhcjAzwj2SCllPn31yppJ4S2m38=;
Subject: Re: [PATCH 03/10] tools/libxg: Fix uninitialised variable in
 meminit()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-4-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2437c26c-2bb6-ec43-37bd-3051b97eff56@xen.org>
Date: Fri, 12 Feb 2021 15:55:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210212153953.4582-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 12/02/2021 15:39, Andrew Cooper wrote:
> Various version of gcc, when compiling with -Og, complain:
> 
>    xg_dom_arm.c: In function 'meminit':
>    xg_dom_arm.c:420:19: error: 'p2m_size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>      420 |     dom->p2m_size = p2m_size;
>          |     ~~~~~~~~~~~~~~^~~~~~~~~~
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This was reported nearly 3 years ago (see [1]) and it is pretty sad this 
was never merged :(.

> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> 
> Julien/Stefano: I can't work out how this variable is supposed to work, and
> the fact that it isn't a straight accumulation across the RAM banks looks
> suspect.

It looks buggy, but the P2M is never used on Arm. In fact, you sent a 
patch a year ago to drop it (see [2]). It would be nice to revive it.

> ---
>   tools/libs/guest/xg_dom_arm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
> index 94948d2b20..f1b8d06f75 100644
> --- a/tools/libs/guest/xg_dom_arm.c
> +++ b/tools/libs/guest/xg_dom_arm.c
> @@ -373,7 +373,7 @@ static int meminit(struct xc_dom_image *dom)
>       const uint64_t modsize = dtb_size + ramdisk_size;
>       const uint64_t ram128mb = bankbase[0] + (128<<20);
>   
> -    xen_pfn_t p2m_size;
> +    xen_pfn_t p2m_size = 0;
>       uint64_t bank0end;
>   
>       assert(dom->rambase_pfn << XC_PAGE_SHIFT == bankbase[0]);
>

If your original series is too risky for 4.15, I would consider to 
remote p2m_size completely and always 0 dom->p2m_size.

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20180314123203.30646-1-wei.liu2@citrix.com/
[2] 
https://patchwork.kernel.org/project/xen-devel/patch/20191217201550.15864-3-andrew.cooper3@citrix.com/

-- 
Julien Grall

