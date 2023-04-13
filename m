Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1376E1624
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 22:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520967.809158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn3wP-00007o-Je; Thu, 13 Apr 2023 20:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520967.809158; Thu, 13 Apr 2023 20:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn3wP-00004w-Gt; Thu, 13 Apr 2023 20:53:13 +0000
Received: by outflank-mailman (input) for mailman id 520967;
 Thu, 13 Apr 2023 20:53:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pn3wN-0008WT-Qq
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 20:53:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn3wN-0005Wj-GH; Thu, 13 Apr 2023 20:53:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn3wN-0005xj-B0; Thu, 13 Apr 2023 20:53:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=mtaoGJepRxHbMpQyow6E7Am+G+hQC599jwvUs8hGIwE=; b=XVNDIs8ymNEXYcWjlN+4ySOdRC
	ZJ5vb/yUAZJaIAS6PDc/8r/UWd6WyeBwt2FtUDAvaKb0OlCZPD2GiDwSce2OUJkDtwlBlhZ6wtL0k
	mg+bcTsGZO+cYeHmXwaC/+QU5KgGT0zit35tp7T88R1hdHkh2ItJ0iMQOKxpPOE7t+5o=;
Message-ID: <176f5384-6e35-83bd-5f77-8b31412e8048@xen.org>
Date: Thu, 13 Apr 2023 21:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-18-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v8 17/22] xen/arm: ffa: support sharing memory
In-Reply-To: <20230413071424.3273490-18-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 13/04/2023 08:14, Jens Wiklander wrote:
>   static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
>                                         uint8_t msg)
>   {
> @@ -781,6 +862,400 @@ out:
>                resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & mask);
>   }
>   
> +/*
> + * Gets all page and assigns them to the supplied shared memory object. If
> + * this function fails then the caller is still expected to call
> + * put_shm_pages() as a cleanup.
> + */
> +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> +                         const struct ffa_address_range *range,
> +                         uint32_t range_count, unsigned int start_page_idx,
> +                         unsigned int *last_page_idx)
> +{
> +    unsigned int pg_idx = start_page_idx;
> +    gfn_t gfn;
> +    unsigned int n;
> +    unsigned int m;
> +    p2m_type_t t;
> +    uint64_t addr;
> +
> +    for ( n = 0; n < range_count; n++ )
> +    {
> +        for ( m = 0; m < range[n].page_count; m++ )
> +        {
> +            if ( pg_idx >= shm->page_count )
> +                return FFA_RET_INVALID_PARAMETERS;
> +
> +            addr = read_atomic(&range[n].address);

I am confused with the use of read_atomic() here. Is this part of the 
guest memory? If so, why don't page_count is also not read atomically?

Also, it looks like you are using you will read the same address 
atomically. Shouldn't this be moved just before the loop?

> +            gfn = gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
> +            shm->pages[pg_idx] = get_page_from_gfn(d, gfn_x(gfn), &t,
> +						   P2M_ALLOC);
> +            if ( !shm->pages[pg_idx] )
> +                return FFA_RET_DENIED;
> +            /* Only normal RAM for now */
> +            if ( !p2m_is_ram(t) )
> +                return FFA_RET_DENIED;
> +            pg_idx++;
> +        }
> +    }
> +
> +    *last_page_idx = pg_idx;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static void put_shm_pages(struct ffa_shm_mem *shm)
> +{
> +    unsigned int n;
> +
> +    for ( n = 0; n < shm->page_count && shm->pages[n]; n++ )
> +    {
> +        put_page(shm->pages[n]);
> +        shm->pages[n] = NULL;
> +    }
> +}
> +
> +static struct ffa_shm_mem *alloc_ffa_shm_mem(struct ffa_ctx *ctx,
> +                                             unsigned int page_count)
> +{
> +    struct ffa_shm_mem *shm;
> +
> +    if ( page_count >= FFA_MAX_SHM_PAGE_COUNT ||
> +         ctx->shm_count >= FFA_MAX_SHM_COUNT )
> +        return NULL;
> +
> +    shm = xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
> +    if ( shm )
> +    {
> +        ctx->shm_count++;
> +        shm->page_count = page_count;
> +    }
> +
> +    return shm;
> +}
> +
> +static void free_ffa_shm_mem(struct ffa_ctx *ctx, struct ffa_shm_mem *shm)
> +{
> +    if ( shm ) {

Coding style:

if ( ... )
{

but I would prefer if we remove one level of indentation and use:

if ( !shm )
   return;

> +        ASSERT(ctx->shm_count > 0);
> +        ctx->shm_count--;
> +        put_shm_pages(shm);
> +        xfree(shm);
> +    }
> +}

Cheers,

-- 
Julien Grall

