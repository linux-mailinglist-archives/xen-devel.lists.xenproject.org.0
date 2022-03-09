Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59E4D3AED
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 21:17:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288083.488523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS2kM-0004sl-3S; Wed, 09 Mar 2022 20:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288083.488523; Wed, 09 Mar 2022 20:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS2kM-0004qb-0M; Wed, 09 Mar 2022 20:17:22 +0000
Received: by outflank-mailman (input) for mailman id 288083;
 Wed, 09 Mar 2022 20:17:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nS2kL-0004qV-C5
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 20:17:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS2kK-0004GI-Ur; Wed, 09 Mar 2022 20:17:20 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.155.231]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS2kK-0002du-P5; Wed, 09 Mar 2022 20:17:20 +0000
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
	bh=DeOcCELI9sG6axh7pTB3g2EfK53JgnjI3EtSfGxe3YA=; b=Yf/O325E0LxEDkqlCjYTtwXJfc
	wrywoaIO4vG0JHQsthtntO+wjuT9R/To4NknkJoNZyNWsjcDLxhZ6dNeXWxv7ocaMYNhvkxiLO3XB
	Y+DmDA0/98HDcrjEQtXbbBfuh8/sFK9hgSrzUOyoq77U62LmKBvstHMQQ/SQmYsZGpdA=;
Message-ID: <55fb729a-c52e-0cca-3fa0-96dbffdee6de@xen.org>
Date: Wed, 9 Mar 2022 20:17:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 10/36] xen/arch: check color selection function
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-11-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-11-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Dom0 color configuration is parsed in the Xen command line. Add an
> helper function to check the user selection. If no configuration is
> provided by the user, all the available colors supported by the
> hardware will be assigned to dom0.

 From the commit message, I was expecting the function to be used. Can 
this be introduced when you introduce its user?

> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   xen/arch/arm/coloring.c             | 17 +++++++++++++++++
>   xen/arch/arm/include/asm/coloring.h |  8 ++++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index f6e6d09477..382d558021 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -179,6 +179,23 @@ uint32_t *setup_default_colors(uint32_t *col_num)
>       return NULL;
>   }
>   
> +bool check_domain_colors(struct domain *d)
> +{
> +    int i;
> +    bool ret = false;
> +
> +    if ( !d )
> +        return ret;
> +
> +    if ( d->max_colors > max_col_num )
> +        return ret;
> +
> +    for ( i = 0; i < d->max_colors; i++ )
> +        ret |= (d->colors[i] > (max_col_num - 1));
> +
> +    return !ret;
> +}
> +
>   bool __init coloring_init(void)
>   {
>       int i;
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index 8f24acf082..fdd46448d7 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -26,8 +26,16 @@
>   #define MAX_COLORS_CELLS 4
>   
>   #ifdef CONFIG_COLORING
> +#include <xen/sched.h>
> +
>   bool __init coloring_init(void);
>   
> +/*
> + * Check colors of a given domain.
> + * Return true if check passed, false otherwise.
> + */
> +bool check_domain_colors(struct domain *d);
> +
>   /*
>    * Return an array with default colors selection and store the number of
>    * colors in @param col_num. The array selection will be equal to the dom0

-- 
Julien Grall

