Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4124D8C4D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 20:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290435.492549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqIM-0002Ou-EE; Mon, 14 Mar 2022 19:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290435.492549; Mon, 14 Mar 2022 19:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTqIM-0002MZ-Ax; Mon, 14 Mar 2022 19:23:54 +0000
Received: by outflank-mailman (input) for mailman id 290435;
 Mon, 14 Mar 2022 19:23:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nTqIL-0002MT-DU
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 19:23:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTqIK-0003AN-H4; Mon, 14 Mar 2022 19:23:52 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[10.95.108.113]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nTqIK-0005Oi-AR; Mon, 14 Mar 2022 19:23:52 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=Gx1T1YwN8lncQCfM4GtnxhUbRf9XrOEGHRpQ1DFMTTc=; b=xdXJSkReqAN+vf1IQ0+KHb6xBg
	X/nqVuTbPLdzp353tDVSbITM2tmmtY3tLVzpgYGfVv3Ce10PzNM/QKlW2bP8fXGFPa2PWWzrY2ZSJ
	r29jVTyG5c/fWvXN8gxoflvSB+Z/JDx0HIysISnBBlIwFglp5APTprk6AQ76d+Pms3kE=;
Message-ID: <ed3d12df-e616-8dd3-cb0c-e200f83869d8@xen.org>
Date: Mon, 14 Mar 2022 19:23:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 23/36] xen/arch: coloring: manually calculate Xen physical
 addresses
To: Marco Solieri <marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-24-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>
In-Reply-To: <20220304174701.1453977-24-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> During Xen coloring procedure, we need to manually calculate consecutive
> physical addresses that conform to the color selection. Add an helper
> function that does this operation. The latter will return the next
> address that conforms to Xen color selection.
> 
> The next_colored function is architecture dependent and the provided
> implementation is for ARMv8.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   xen/arch/arm/coloring.c             | 43 +++++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/coloring.h | 14 ++++++++++
>   2 files changed, 57 insertions(+)
> 
> diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> index 761414fcd7..aae3c77a7b 100644
> --- a/xen/arch/arm/coloring.c
> +++ b/xen/arch/arm/coloring.c
> @@ -222,6 +222,49 @@ uint32_t get_max_colors(void)
>       return max_col_num;
>   }
>   
> +paddr_t next_xen_colored(paddr_t phys)
> +{
> +    unsigned int i;
> +    unsigned int col_next_number = 0;
> +    unsigned int col_cur_number = (phys & addr_col_mask) >> PAGE_SHIFT;
> +    int overrun = 0;

This only looks to be used as an unsigned value. So please use 'unsigned 
int'.

> +    paddr_t ret;
> +
> +    /*
> +     * Check if address color conforms to Xen selection. If it does, return
> +     * the address as is.
> +     */
> +    for( i = 0; i < xen_col_num; i++)

Coding style: missing space after 'for' and before ')'.

> +        if ( col_cur_number == xen_col_list[i] )
> +            return phys;
> +
> +    /* Find next col */
> +    for( i = xen_col_num -1 ; i >= 0; i--)

i is unsigned. So the 'i >= 0' will always be true as it will wrap to 
2^32 - 1. What did you intend to check?

Coding style: missing space after 'for', '-' and before ')'.

> +    {
> +        if ( col_cur_number > xen_col_list[i])

Coding style: missing space before ')'.

> +        {
> +            /* Need to start to first element and add a way_size */
> +            if ( i == (xen_col_num - 1) )
> +            {
> +                col_next_number = xen_col_list[0];
> +                overrun = 1;
> +            }
> +            else
> +            {
> +                col_next_number = xen_col_list[i+1];

Coding style: Missing space before and after '+'.

> +                overrun = 0;
> +            }
> +            break;
> +        }
> +    }
> +
> +    /* Align phys to way_size */
> +    ret = phys - (PAGE_SIZE * col_cur_number);

I am not sure to understand how the comment is matching with the code. 
 From the comment, I would expect the expression to contain 'way_size'.

> +    /* Add the offset based on color selection*/

Coding style: missing space before '*/'.

> +    ret += (PAGE_SIZE * (col_next_number)) + (way_size*overrun);
Coding style: Missing space before and after '*'.

> +    return ret;
> +}
> +
>   bool __init coloring_init(void)
>   {
>       int i, rc;
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index 22e67dc9d8..8c4525677c 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -28,6 +28,20 @@
>   
>   bool __init coloring_init(void);
>   
> +/*
> + * Return physical page address that conforms to the colors selection
> + * given in col_selection_mask after @param phys.
> + *
> + * @param phys         Physical address start.
> + * @param addr_col_mask        Mask specifying the bits available for coloring.
> + * @param col_selection_mask   Mask asserting the color bits to be used,
> + * must not be 0.

The function belows have only one parameter. Yet, you are description 3 
parameters here.

> + *
> + * @return The lowest physical page address being greater or equal than
> + * 'phys' and belonging to Xen color selection
> + */
> +paddr_t next_xen_colored(paddr_t phys);
> +
>   /*
>    * Check colors of a given domain.
>    * Return true if check passed, false otherwise.

Cheers,

-- 
Julien Grall

