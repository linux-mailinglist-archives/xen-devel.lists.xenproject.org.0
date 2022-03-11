Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32AD4D68FA
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 20:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289228.490732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSkeE-00022V-Ke; Fri, 11 Mar 2022 19:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289228.490732; Fri, 11 Mar 2022 19:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSkeE-0001zW-Gu; Fri, 11 Mar 2022 19:09:58 +0000
Received: by outflank-mailman (input) for mailman id 289228;
 Fri, 11 Mar 2022 19:09:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSkeC-0001zO-Sm
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 19:09:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSkeC-0007Wp-J4; Fri, 11 Mar 2022 19:09:56 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.95.172.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSkeC-0000pD-D1; Fri, 11 Mar 2022 19:09:56 +0000
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
	bh=z1zYnJ3HEqZ7g0dsuskkQBjmFYjRXMdFNpn2Ra5Rvig=; b=iDdKzhiWtMLV5G9MOjdRWJgwFR
	HytUVQVJiKjthFij2khyVZpFEF1PTKhBtfSW4BIj8l2eLxpP5p7B/xo0CdRfI7sPezQL6i+RtF881
	UmFQz4h5j8WUlvosBoLdLQ1xW7CLPCl9z8QV/p33RNTp93UdBwJkyx2hFB7kaP/jWoXk=;
Message-ID: <f29461ce-981f-a600-d5df-04c66e73f6e4@xen.org>
Date: Fri, 11 Mar 2022 19:09:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 17/36] xen/arm: add get_max_color function
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-18-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-18-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marco,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> In order to initialize the colored allocator data structure, the maximum
> amount of colors defined by the hardware has to be know.
> Add a helper function that returns this information.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> ---
>   xen/arch/arm/coloring.c             | 5 +++++
>   xen/arch/arm/include/asm/coloring.h | 8 ++++++++

This helper is simple enough that I think it would be better to fold in 
the first patch using it.

>   2 files changed, 13 insertions(+)
> 
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index 4748d717d6..d1ac193a80 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -209,6 +209,11 @@ unsigned long color_from_page(struct page_info *pg)
>     return ((addr_col_mask & page_to_maddr(pg)) >> PAGE_SHIFT);
>   }
>   
> +uint32_t get_max_colors(void)
> +{
> +    return max_col_num;
> +}
> +
>   bool __init coloring_init(void)
>   {
>       int i;
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index 318e2a4521..22e67dc9d8 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -49,6 +49,9 @@ void coloring_dump_info(struct domain *d);
>    * specifications.
>    */
>   unsigned long color_from_page(struct page_info *pg);
> +
> +/* Return the maximum available number of colors supported by the hardware */
> +uint32_t get_max_colors(void);
>   #else /* !CONFIG_COLORING */
>   static inline bool __init coloring_init(void)
>   {
> @@ -59,5 +62,10 @@ static inline void coloring_dump_info(struct domain *d)
>   {
>       return;
>   }
> +
> +static inline uint32_t get_max_colors(void)
> +{
> +    return 0;
> +}
>   #endif /* CONFIG_COLORING */
>   #endif /* !__ASM_ARM_COLORING_H__ */

Cheers,

-- 
Julien Grall

