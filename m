Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0E04260C9
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 01:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204168.359384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYdCr-0005bM-BD; Thu, 07 Oct 2021 23:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204168.359384; Thu, 07 Oct 2021 23:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYdCr-0005ZZ-7d; Thu, 07 Oct 2021 23:53:45 +0000
Received: by outflank-mailman (input) for mailman id 204168;
 Thu, 07 Oct 2021 23:53:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYdCp-0005ZT-K9
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 23:53:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86304f95-ea39-440d-8e0e-46578c12b461;
 Thu, 07 Oct 2021 23:53:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 085CC60F46;
 Thu,  7 Oct 2021 23:53:42 +0000 (UTC)
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
X-Inumbo-ID: 86304f95-ea39-440d-8e0e-46578c12b461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633650822;
	bh=nYBQUQOE91WGq5wkUx0Lx3qC0i42nHv7E3xGNbYTdN0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=u4CM3i7Op2FaRnZwd7a7cILdaIkGJfl6tWO+OTimIKgtYEZtWTlyYlAueX10MFZY5
	 vLSUe4ABwyP4EBxwaif8vs6ZHf2zeAN3aNexVAkt/cw04aX07yV6I0oD/o+TSJEJiE
	 1fuQCyVzxlhVRMQzK9nv7Qlz6biwdzuLRge+h00bljhVGa4QXTSpXFx4ejBN2xIJQZ
	 2krZ8Gwaz5xbLcrH9JVouMCoF85l5+9owcgzcxI0dbbLiGLATsKYy+2ZYBe8rBO8Y/
	 Qx3HlY0FOoTKHi1KrNIwXAi/ElhG1A+b34cmYgA7dNrr7uPQte4bRMc/eezeNljTI7
	 Gf1XdTrD0VpKQ==
Date: Thu, 7 Oct 2021 16:53:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: optee: fix possible memory leaks
In-Reply-To: <20211007232450.2036087-1-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.21.2110071653300.414@sstabellini-ThinkPad-T480s>
References: <20211007232450.2036087-1-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Oct 2021, Volodymyr Babchuk wrote:
> translate_noncontig() allocates domheap page for translated list
> before calling to allocate_optee_shm_buf(), which can fail for number
> of reason. Anyways, after fail we need to free the allocated page(s).
> 
> Another leak is possible if the same translate_noncontig() function
> fails to get domain page. In this case it should free allocated
> optee_shm_buf prior exit. This will also free allocated domheap page.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/tee/optee.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 6df0d44eb9..131d2f9a8a 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -781,7 +781,10 @@ static int translate_noncontig(struct optee_domain *ctx,
>      optee_shm_buf = allocate_optee_shm_buf(ctx, param->u.tmem.shm_ref,
>                                             pg_count, xen_pgs, order);
>      if ( IS_ERR(optee_shm_buf) )
> +    {
> +        free_domheap_pages(xen_pgs, order);
>          return PTR_ERR(optee_shm_buf);
> +    }
>  
>      gfn = gaddr_to_gfn(param->u.tmem.buf_ptr &
>                         ~(OPTEE_MSG_NONCONTIG_PAGE_SIZE - 1));
> @@ -807,7 +810,7 @@ static int translate_noncontig(struct optee_domain *ctx,
>          {
>              guest_pg = get_domain_ram_page(gfn);
>              if ( !guest_pg )
> -                return -EINVAL;
> +                goto free_shm_buf;
>  
>              guest_data = __map_domain_page(guest_pg);
>              xen_data = __map_domain_page(xen_pgs);
> @@ -854,6 +857,7 @@ err_unmap:
>      unmap_domain_page(guest_data);
>      unmap_domain_page(xen_data);
>      put_page(guest_pg);
> +free_shm_buf:
>      free_optee_shm_buf(ctx, optee_shm_buf->cookie);
>  
>      return -EINVAL;
> -- 
> 2.33.0
> 

