Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B637EA6E
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 00:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126430.238004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgwuE-0004ON-G6; Wed, 12 May 2021 22:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126430.238004; Wed, 12 May 2021 22:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgwuE-0004LF-CM; Wed, 12 May 2021 22:00:38 +0000
Received: by outflank-mailman (input) for mailman id 126430;
 Wed, 12 May 2021 22:00:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgwuC-0004L9-Ro
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 22:00:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0dcb13c4-d187-4310-af71-02e1ea9606a3;
 Wed, 12 May 2021 22:00:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA374613BD;
 Wed, 12 May 2021 22:00:34 +0000 (UTC)
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
X-Inumbo-ID: 0dcb13c4-d187-4310-af71-02e1ea9606a3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620856835;
	bh=uZq6wy4yE4KAlGFRiyHroM4bLsXCaJgs6J2sO/Z2u7I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KxcS5TBxEfCtc2xNmT7JxQF3oDdwUigV4axoiZpuy1phOYJpnG09y7His5vGGCFWb
	 IxMSlbLNyQyzT1Zj3w0CAAup08JsI8anU+ec3zkaCN0JGHzPeGeORFHoMQ7zLLiJO7
	 JzRu5+UDDolVPM21JexGYC/PgOU57SgXM818rGXPpgsy55clelRzbYAZz1kkpXQoKR
	 tb9anNKNZF3t5ig4tfN3G5gvT5pK/GQNfev4t5QKq7yN0KxjjyePrwKrIFpYV/OmHh
	 wtBuWXsXGjaMvgXvtbJ05UXOBsOnGRsY2PvmtmHOH7oxahnKJ1gJzdENVgmjE6t/aw
	 D+HLb5Rp3Ka/Q==
Date: Wed, 12 May 2021 15:00:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH RFCv2 08/15] xen/arm32: mm: Check if the virtual address
 is shared before updating it
In-Reply-To: <20210425201318.15447-9-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105121448090.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-9-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Only the first 2GB of the virtual address space is shared between all
> the page-tables on Arm32.
> 
> There is a long outstanding TODO in xen_pt_update() stating that the
> function is can only work with shared mapping. Nobody has ever called
           ^ remove

> the function with private mapping, however as we add more callers
> there is a risk to mess things up.
> 
> Introduce a new define to mark the ened of the shared mappings and use
                                     ^end

> it in xen_pt_update() to verify if the address is correct.
> 
> Note that on Arm64, all the mappings are shared. Some compiler may
> complain about an always true check, so the new define is not introduced
> for arm64 and the code is protected with an #ifdef.
 
On arm64 we could maybe define SHARED_VIRT_END to an arbitrarely large
value, such as:

#define SHARED_VIRT_END (1UL<<48)

or:

#define SHARED_VIRT_END DIRECTMAP_VIRT_END

?


> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c            | 11 +++++++++--
>  xen/include/asm-arm/config.h |  4 ++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 8fac24d80086..5c17cafff847 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1275,11 +1275,18 @@ static int xen_pt_update(unsigned long virt,
>       * For arm32, page-tables are different on each CPUs. Yet, they share
>       * some common mappings. It is assumed that only common mappings
>       * will be modified with this function.
> -     *
> -     * XXX: Add a check.
>       */
>      const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
>  
> +#ifdef SHARED_VIRT_END
> +    if ( virt > SHARED_VIRT_END ||
> +         (SHARED_VIRT_END - virt) < nr_mfns )

The following would be sufficient, right?

    if ( virt + nr_mfns > SHARED_VIRT_END )


> +    {
> +        mm_printk("Trying to map outside of the shared area.\n");
> +        return -EINVAL;
> +    }
> +#endif
> +
>      /*
>       * The hardware was configured to forbid mapping both writeable and
>       * executable.
> diff --git a/xen/include/asm-arm/config.h b/xen/include/asm-arm/config.h
> index c7b77912013e..85d4a510ce8a 100644
> --- a/xen/include/asm-arm/config.h
> +++ b/xen/include/asm-arm/config.h
> @@ -137,6 +137,10 @@
>  
>  #define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
>  #define XENHEAP_VIRT_END       _AT(vaddr_t,0x7fffffff)
> +
> +/* The first 2GB is always shared between all the page-tables. */
> +#define SHARED_VIRT_END        _AT(vaddr_t, 0x7fffffff)
> +
>  #define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
>  #define DOMHEAP_VIRT_END       _AT(vaddr_t,0xffffffff)
>  
> -- 
> 2.17.1
> 

