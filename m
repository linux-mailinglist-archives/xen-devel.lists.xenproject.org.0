Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4E14CDDBD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 21:14:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284889.484127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQEJ0-0007k8-AJ; Fri, 04 Mar 2022 20:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284889.484127; Fri, 04 Mar 2022 20:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQEJ0-0007hE-7A; Fri, 04 Mar 2022 20:13:38 +0000
Received: by outflank-mailman (input) for mailman id 284889;
 Fri, 04 Mar 2022 20:13:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nQEIy-0007h8-Ga
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 20:13:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQEIx-0002Ep-Dr; Fri, 04 Mar 2022 20:13:35 +0000
Received: from [54.239.6.187] (helo=[192.168.25.28])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nQEIx-0007sl-7H; Fri, 04 Mar 2022 20:13:35 +0000
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
	bh=tJj7v32esvWemNFcgx8xD0UHoLBoAcpPBekeDO/8w2k=; b=rMpEbutJ16/MpRIkoE2AhwRcYB
	8KWuaIYIobjavZW+D8qMZarIk5GbtwL+cQEqJhKLmpumGFoHm0Tb9x/v8oD9H57mmNKfAwaYrL1vh
	iPeUBx3qXzv8hPKdVLi4qZzB4nG/AWsXqwY0/Xbww1Ikidi0cqCrdT81W/wxMV+6CQ28=;
Message-ID: <584d1043-5085-7dc1-228f-ce1338759753@xen.org>
Date: Fri, 4 Mar 2022 20:13:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 08/36] xen/arm: add colored flag to page struct
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-9-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-9-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> A new allocator enforcing a cache-coloring configuration is going to be
> introduced.  We thus need to distinguish the memory pages assigned to,
> and managed by, such colored allocator from the ordinary buddy
> allocator's ones.  Add a color flag to the page structure.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   xen/arch/arm/include/asm/mm.h | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 487be7cf59..9ac1767595 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -88,6 +88,10 @@ struct page_info
>            */
>           u32 tlbflush_timestamp;
>       };
> +
> +    /* Is page managed by the cache-colored allocator? */
> +    bool colored;

struct page_info is going to be used quite a lot. In fact, there is one 
per RAM page. So we need to avoid growing the structure.

For Arm64, there is a 4 bytes padding here. But for arm32, there are 
none. So the size will increase by another 8 bytes.

In this case, I would use a bit in count_info.

Cheers,

-- 
Julien Grall

