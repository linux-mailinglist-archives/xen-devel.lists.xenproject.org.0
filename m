Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7109C4D3B29
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 21:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288094.488544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS31J-0007oV-Rt; Wed, 09 Mar 2022 20:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288094.488544; Wed, 09 Mar 2022 20:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS31J-0007li-O3; Wed, 09 Mar 2022 20:34:53 +0000
Received: by outflank-mailman (input) for mailman id 288094;
 Wed, 09 Mar 2022 20:34:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nS31I-0007lc-9G
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 20:34:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS31H-0004b5-86; Wed, 09 Mar 2022 20:34:51 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.155.231]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS31H-0003cm-1L; Wed, 09 Mar 2022 20:34:51 +0000
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
	bh=LZ+OQ+X5ZGTkR1tvH3KNAQ7UtKhCZs7tVYOAweZqzLA=; b=7ON+4gzC3VdkKfVjnbnLEIgfVU
	J6rI1bWtvpGEljL2xEge4NaHFDXZGIkGN3GrZA68tcrDxGTSvdia+4dJRdLM7R+MBjOeX0kmvdDfU
	uCeQoPas3s+S9tBNbrBG/RMwBwFpWvKLozSy38FqIi1paXVwatSJvHmcHrs6fJJQrG98=;
Message-ID: <e35c84cc-3bb0-9301-9610-376a18c69af4@xen.org>
Date: Wed, 9 Mar 2022 20:34:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 13/36] xen/arm: A domain is not direct mapped when
 coloring is enabled
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-14-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-14-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Based on the intrinsic nature of cache coloring, it is trivial to state
> that each domain that is colored is also not direct mapped.
> Set the directmap variable to false when coloring is enabled.

This is basically fixing a bug that was introduced in the previous 
patch. Please fold it.

> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   xen/arch/arm/domain.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 33471b3c58..80a6f39464 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -785,6 +785,8 @@ int arch_domain_create(struct domain *d,
>   
>       d->max_colors = 0;
>   #ifdef CONFIG_COLORING
> +    d->arch.directmap = false;

We should avoid silently overwriting what the user requested. Instead, 
we should add a check in arch_sanitise_domain_config() to forbid case 
where CDF_directmap is set *and* the number of colors is > 0.

> +
>       /* Setup domain colors */
>       if ( !config->arch.colors.max_colors )
>       {

Cheers,

-- 
Julien Grall

