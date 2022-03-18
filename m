Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35344DD2AE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 03:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291821.495596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1uQ-0002EF-CX; Fri, 18 Mar 2022 02:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291821.495596; Fri, 18 Mar 2022 02:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nV1uQ-0002AV-8D; Fri, 18 Mar 2022 02:00:06 +0000
Received: by outflank-mailman (input) for mailman id 291821;
 Fri, 18 Mar 2022 02:00:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3xU5=T5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nV1uO-0000eL-R8
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 02:00:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ff284df-a65f-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 03:00:03 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABB056164E;
 Fri, 18 Mar 2022 02:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD9AC340ED;
 Fri, 18 Mar 2022 02:00:01 +0000 (UTC)
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
X-Inumbo-ID: 1ff284df-a65f-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647568802;
	bh=nA25/a6hABX/rOZXsG2/WB5PE0E3mmmUKWVvAw21SK8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=q+/xppMb3Di/ovB2NYPT5q5GTohOoYG2Ys/3gZNwzIK0gk5RfLt/rjSGMLEJO/Mey
	 ZZhrxROX+vqLFPuGFB1zOWNqBgnWtxigF2eYn9/1UW8UdI++J47H17cAwK1oYgnW4o
	 g4mneUUrJEbqsIrKBJvtgljlaNpYS45tkfi0Hs1KhnC5uQaZ9POQwmM9/9IKvvRiMK
	 Ja2RB8yMSd7R6cm9Aow8E83uuEkQAfwlzebfbc2tdGa20At/mOaMkQWjiLJa1rwxT8
	 9ygPoPopX9NWsztE2ArZdxXqwKRc4Rz7w7dqtSVfkirar7MVlETpBDEz6uv4dFEWW3
	 bVG1g6z7VDwoA==
Date: Thu, 17 Mar 2022 19:00:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
In-Reply-To: <20220311061123.1883189-7-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203171744190.3497@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-7-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Mar 2022, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> This commits introduces a new helper guest_physmap_add_shm to set up shared
> memory foreign mapping for borrower domain.
> 
> Firstly it should get and take reference of statically shared pages from
> owner dom_shared. Then it will setup P2M foreign memory map of these statically
> shared pages for borrower domain.
> 
> This commits only considers owner domain is the default dom_shared, the
> other scenario will be covered in the following patches.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>  xen/arch/arm/domain_build.c | 52 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 984e70e5fc..8cee5ffbd1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -798,6 +798,48 @@ static int __init allocate_shared_memory(struct domain *d,
>      return ret;
>  }
>  
> +static int __init guest_physmap_add_shm(struct domain *od, struct domain *bd,
> +                                        unsigned long o_gfn,
> +                                        unsigned long b_gfn,
> +                                        unsigned long nr_gfns)

They should probably be gfn_t type


> +{
> +    struct page_info **pages = NULL;
> +    p2m_type_t p2mt, t;
> +    int ret = 0;
> +
> +    pages = xmalloc_array(struct page_info *, nr_gfns);
> +    if ( !pages )
> +        return -ENOMEM;
> +
> +    /*
> +     * Take reference of statically shared pages from owner domain.
> +     * Reference will be released when destroying shared memory region.
> +     */
> +    ret = get_pages_from_gfn(od, o_gfn, nr_gfns, pages, &p2mt, P2M_ALLOC);
> +    if ( ret )
> +    {
> +        ret = -EINVAL;
> +        goto fail_pages;
> +    }
> +
> +    if ( p2m_is_ram(p2mt) )
> +        t = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw : p2m_map_foreign_ro;
> +    else
> +    {
> +        ret = -EINVAL;
> +        goto fail_pages;
> +    }

One idea is to initialize p2mt = p2m_ram_rw and pass it to
get_pages_from_gfn. Then get_pages_from_gfn can return error immediately
if any of the pages are of different type.

This way there is no need for checking again here.


> +    /* Set up guest foreign map. */
> +    ret = guest_physmap_add_pages(bd, _gfn(b_gfn), page_to_mfn(pages[0]),
> +                                  nr_gfns, t);
> +
> + fail_pages:
> +        xfree(pages);
> +
> +    return ret;
> +}
> +
>  static int __init process_shm(struct domain *d,
>                                const struct dt_device_node *node)
>  {
> @@ -855,6 +897,16 @@ static int __init process_shm(struct domain *d,
>  
>              set_bit(shm_id, shm_mask);
>          }
> +
> +        /*
> +         * All domains are borrower domains when owner domain is the
> +         * default dom_shared, so here we could just set up P2M foreign
> +         * mapping for borrower domain immediately.
> +         */
> +        ret = guest_physmap_add_shm(dom_shared, d, PFN_DOWN(pbase),
> +                                    PFN_DOWN(gbase), PFN_DOWN(psize));
> +        if ( ret )
> +            return ret;
>      }
>  
>      return 0;
> -- 
> 2.25.1
> 

