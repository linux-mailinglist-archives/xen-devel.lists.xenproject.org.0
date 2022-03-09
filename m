Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167A74D3B17
	for <lists+xen-devel@lfdr.de>; Wed,  9 Mar 2022 21:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288089.488534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS2wL-0006Pg-89; Wed, 09 Mar 2022 20:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288089.488534; Wed, 09 Mar 2022 20:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nS2wL-0006Mv-4c; Wed, 09 Mar 2022 20:29:45 +0000
Received: by outflank-mailman (input) for mailman id 288089;
 Wed, 09 Mar 2022 20:29:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nS2wK-0006Mp-1k
 for xen-devel@lists.xenproject.org; Wed, 09 Mar 2022 20:29:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS2wJ-0004VV-KN; Wed, 09 Mar 2022 20:29:43 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[10.95.155.231]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nS2wJ-0003Bs-Dg; Wed, 09 Mar 2022 20:29:43 +0000
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
	bh=r2aU9EIQeY9YmLinym1tZ4AHJ4iTxDziuWTVJWSFMJI=; b=au0QTTuFANrTaE0b1wnt4nm83Y
	E6D7gcdJ03GWdhQHqtPFAlnECC7nip90Z8tyQVbvcbk8jvu2DQ57np4TNeY70r63rjd9kzPPOv9rt
	t00Ou4ICUg8tkbQdnaf9wLQ4/pKhzbbQr+ryauR1X2V7UPVWPV7/FQrNwuub4p2bFELE=;
Message-ID: <1ccdd08d-b880-b4d0-30a3-ca7c83eccc70@xen.org>
Date: Wed, 9 Mar 2022 20:29:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 11/36] xen/include: define hypercall parameter for
 coloring
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-12-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-12-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> During domU creation process the colors selection has to be passed to
> the Xen hypercall.
> This is generally done using what Xen calls GUEST_HANDLE_PARAMS. In this
> case a simple bitmask for the coloring configuration suffices.
> Currently the maximum amount of supported colors is 128.
> Add a new parameter that allows us to pass both the colors bitmask
> and the number of elements in it.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/include/asm/coloring.h | 2 --
>   xen/include/public/arch-arm.h       | 8 ++++++++
I would prefer if the structure is defined in the same patch that will 
use it. This would make easier to figure out if the structure is indeed 
suitable.

>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
> index fdd46448d7..1f7e0dde79 100644
> --- a/xen/arch/arm/include/asm/coloring.h
> +++ b/xen/arch/arm/include/asm/coloring.h
> @@ -23,8 +23,6 @@
>   #ifndef __ASM_ARM_COLORING_H__
>   #define __ASM_ARM_COLORING_H__
>   
> -#define MAX_COLORS_CELLS 4
> -

In general, we should avoid moving code that was introduced within the 
same series.

In this case, I am not convinced we should use a static array to 
communicate the information between the toolstack and Xen.

This would make more difficult for the user to tweak update the number 
of colors.

Instead, I think it should be better to expose to the toolstack the 
number of color supported and allocate a dynamic array.

>   #ifdef CONFIG_COLORING
>   #include <xen/sched.h>
>   
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 94b31511dd..627cc42164 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -303,6 +303,12 @@ struct vcpu_guest_context {
>   typedef struct vcpu_guest_context vcpu_guest_context_t;
>   DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   
> +#define MAX_COLORS_CELLS 4
> +struct color_guest_config {
> +    uint32_t max_colors;
> +    uint32_t colors[MAX_COLORS_CELLS];
> +};

This looks like an open-coded version of xenctl_bitmap. Can you have a 
look to use it?

I would expect this will reduce how much code you introduced in the next 
patch.

> +
>   /*
>    * struct xen_arch_domainconfig's ABI is covered by
>    * XEN_DOMCTL_INTERFACE_VERSION.
> @@ -335,6 +341,8 @@ struct xen_arch_domainconfig {
>        *
>        */
>       uint32_t clock_frequency;
> +    /* IN */
> +    struct color_guest_config colors;
>   };
>   #endif /* __XEN__ || __XEN_TOOLS__ */
>   

-- 
Julien Grall

