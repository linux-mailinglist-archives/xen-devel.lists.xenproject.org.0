Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC85656C122
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 21:54:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363675.594352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9u3P-0003bM-DK; Fri, 08 Jul 2022 19:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363675.594352; Fri, 08 Jul 2022 19:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9u3P-0003Yk-9h; Fri, 08 Jul 2022 19:54:19 +0000
Received: by outflank-mailman (input) for mailman id 363675;
 Fri, 08 Jul 2022 19:54:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o9u3O-0003Ye-EK
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 19:54:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9u3O-0003eq-4j; Fri, 08 Jul 2022 19:54:18 +0000
Received: from [54.239.6.184] (helo=[192.168.18.9])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o9u3N-0006S2-MS; Fri, 08 Jul 2022 19:54:17 +0000
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
	bh=rsKtzebgHNoI9DQVWrmHNJdycQ8IO4uAkc5ns2Wozgk=; b=U972Z9fhhYYRU3TCEd0MS5ujsI
	A2ihkCR73Pkk8OjO7dhiJPxDTCC4IOT1BLOhXfgPSYP1dir5gmNx4YM6urQOel1NuapBWGn/EutZv
	zHBecNm+7cAPnycvVqm9IB/TYi3svmCXHmAJr/1OmLqjdJ8OxPPTROhrHrpAwQDQxiRU=;
Message-ID: <a6610563-38b2-bb66-feab-df2ea29a9bb8@xen.org>
Date: Fri, 8 Jul 2022 20:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v4 2/2] xen/arm: add FF-A mediator
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-3-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220622134219.1596613-3-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

This is the second part of the review.

On 22/06/2022 14:42, Jens Wiklander wrote:
> +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> +                         struct ffa_address_range *range, uint32_t range_count,

AFAICT, 'range' is not meant to be modified. So I would add 'const'.

> +                         unsigned int start_page_idx,
> +                         unsigned int *last_page_idx)
> +{
> +    unsigned int pg_idx = start_page_idx;
> +    unsigned long gfn;

Below you are using gaddr_to_gfn() which will return gfn_t. This is 
using the typesafe infrastructure: gfn_t will be a structure with 
CONFIG_DEBUG=y to allow type checking and a plain 'unsigned long' when 
CONFIG_DEBUG=n.

Please make sure to test build with CONFIG_DEBUG=y.

As a side note, I would suggest to try booting as CONFIG_DEBUG as it 
enables extra check for the common pitfalls.

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

Shouldn't we call put_page() to drop the references taken by 
get_page_from_gfn()?

> +
> +            addr = read_atomic(&range[n].address);

IIUC, range is part of the shared page with the guest. Where do you 
check that all the access will be within the shared page?

> +            gfn = gaddr_to_gfn(addr + m * PAGE_SIZE);

Is addr meant to be page-aligned? Also, you are using the hypervisor 
page size here when AFAICT page_count is provided by the domain.

How do you guarantee that both Xen and the domain agree on the page size?

> +            shm->pages[pg_idx] = get_page_from_gfn(d, gfn, &t, P2M_ALLOC);
> +            if ( !shm->pages[pg_idx] )
> +                return FFA_RET_DENIED;
> +            pg_idx++;
> +            /* Only normal RAM for now */

Similar to my earlier remark, the comment doesn't match the check below.

> +            if ( t != p2m_ram_rw )
> +                return FFA_RET_DENIED;
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
> +static void init_range(struct ffa_address_range *addr_range,
> +                       paddr_t pa) > +{
> +    memset(addr_range, 0, sizeof(*addr_range));
> +    addr_range->address = pa;
> +    addr_range->page_count = 1;
> +}
> +
> +static int share_shm(struct ffa_shm_mem *shm)

AFAIU, share_shm() cannot be concurrently called. You seem to use 
ffa_buffer_lock to guarantee that. So I would suggest to add:
   1) an ASSERT(spin_is_Locked(&ffa_buffer_lock))
   2) a comment on top of share_shm() explaining that the function 
should be called with ffa_buffer_lock taken.

> +{
> +    uint32_t max_frag_len = ffa_page_count * PAGE_SIZE;
> +    struct ffa_mem_transaction_1_1 *descr = ffa_tx;
> +    struct ffa_mem_access *mem_access_array;
> +    struct ffa_mem_region *region_descr;
> +    struct ffa_address_range *addr_range;
> +    paddr_t pa;
> +    paddr_t last_pa;
> +    unsigned int n;
> +    uint32_t frag_len;
> +    uint32_t tot_len;
> +    int ret;
> +    unsigned int range_count;
> +    unsigned int range_base;
> +    bool first;
> +
> +    memset(descr, 0, sizeof(*descr));
> +    descr->sender_id = shm->sender_id;
> +    descr->global_handle = shm->handle;
> +    descr->mem_reg_attr = FFA_NORMAL_MEM_REG_ATTR;
> +    descr->mem_access_count = 1;
> +    descr->mem_access_size = sizeof(*mem_access_array);
> +    descr->mem_access_offs = sizeof(*descr);
> +    mem_access_array = (void *)(descr + 1);
> +    region_descr = (void *)(mem_access_array + 1);

The (void *)(descr + 1) seems to be very common in your comment. Can you 
consider to add a wrapper? This will make easier to read the code?

> +
> +    memset(mem_access_array, 0, sizeof(*mem_access_array));
> +    mem_access_array[0].access_perm.endpoint_id = shm->ep_id;
> +    mem_access_array[0].access_perm.perm = FFA_MEM_ACC_RW;
> +    mem_access_array[0].region_offs = (vaddr_t)region_descr - (vaddr_t)ffa_tx;

Same for calculating the offset.

> +
> +    memset(region_descr, 0, sizeof(*region_descr));
> +    region_descr->total_page_count = shm->page_count;
> +
> +    region_descr->address_range_count = 1;
> +    last_pa = page_to_maddr(shm->pages[0]);
For hardening purpose, I would suggest to check if shm->page_count is at 
least 1. If you think this could be a programming error then you could 
write:

if ( .... )
{
   ASSERT_UNREACHABLE()
   return <error>;
}

> +    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
> +    {
> +        pa = page_to_maddr(shm->pages[n]);
> +        if ( last_pa + PAGE_SIZE == pa )
> +        {

Coding style: We usually avoid {} for single line.

> +            continue;
> +        }
> +        region_descr->address_range_count++;
> +    }
> +
> +    tot_len = sizeof(*descr) + sizeof(*mem_access_array) +
> +              sizeof(*region_descr) +
> +              region_descr->address_range_count * sizeof(*addr_range);

How do you make sure that you will not write past the end of ffa_tx?

I think it would be worth to consider adding an helper that would allow 
you to allocate space in ffa_tx and zero it. This would return an error 
if there is not enough space.

> +
> +    addr_range = region_descr->address_range_array;
> +    frag_len = (vaddr_t)(addr_range + 1) - (vaddr_t)ffa_tx;
> +    last_pa = page_to_maddr(shm->pages[0]);
> +    init_range(addr_range, last_pa);
> +    first = true;
> +    range_count = 1;
> +    range_base = 0;
> +    for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
> +    {
> +        pa = page_to_maddr(shm->pages[n]);
> +        if ( last_pa + PAGE_SIZE == pa )
> +        {
> +            addr_range->page_count++;
> +            continue;
> +        }
> +
> +        if ( frag_len == max_frag_len )
> +        {
> +            if ( first )
> +            {
> +                ret = ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +                first = false;
> +            }
> +            else
> +            {
> +                ret = ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> +            }
> +            if ( ret <= 0)

Coding style: Missing space before ).

> +                return ret;
> +            range_base = range_count;

You set range_base but don't seem to read it

> +            range_count = 0;

Same here.

> +            frag_len = sizeof(*addr_range);
> +            addr_range = ffa_tx;
> +        }
> +        else
> +        {
> +            frag_len += sizeof(*addr_range);
> +            addr_range++;
> +        }
> +        init_range(addr_range, pa);
> +        range_count++;
> +    }
> +
> +    if ( first )
> +        return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +    else
> +        return ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> +}
> +
> +static int read_mem_transaction(uint32_t ffa_vers, void *buf, size_t blen,

buf should be const if it is not meant to be modified by the function.

> +                                struct ffa_mem_transaction_x *trans)
> +{
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint32_t count;
> +    uint32_t offs;
> +    uint32_t size;
> +
> +    if ( ffa_vers >= FFA_VERSION_1_1 )
> +    {
> +        struct ffa_mem_transaction_1_1 *descr;
> +
> +        if ( blen < sizeof(*descr) )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr = buf;
> +        trans->sender_id = read_atomic(&descr->sender_id);
AFAIU, descr point to guest data. If yes, then we can't trust input. In 
which case, is this really necessary to use read_atomic() for every access?

The reason I am asking is read_atomic() is quite a hammer when a 
compiler barrier should be sufficient.

> +        mem_reg_attr = read_atomic(&descr->mem_reg_attr);
> +        flags = read_atomic(&descr->flags);
> +        trans->global_handle = read_atomic(&descr->global_handle);
> +        trans->tag = read_atomic(&descr->tag);
> +
> +        count = read_atomic(&descr->mem_access_count);
> +        size = read_atomic(&descr->mem_access_size);
> +        offs = read_atomic(&descr->mem_access_offs);
> +    }
> +    else
> +    {
> +        struct ffa_mem_transaction_1_0 *descr;
> +
> +        if ( blen < sizeof(*descr) )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr = buf;
> +        trans->sender_id = read_atomic(&descr->sender_id);
> +        mem_reg_attr = read_atomic(&descr->mem_reg_attr);
> +        flags = read_atomic(&descr->flags);
> +        trans->global_handle = read_atomic(&descr->global_handle);
> +        trans->tag = read_atomic(&descr->tag);
> +
> +        count = read_atomic(&descr->mem_access_count);
> +        size = sizeof(struct ffa_mem_access);
> +        offs = offsetof(struct ffa_mem_transaction_1_0, mem_access_array);
> +    }
> +
> +    if ( mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UINT8_MAX ||

AFAIU, these checks are to ensure that the fields fit in your structure 
below. However, it is not clear to me why we are capping the values 
provided by the domain.

I think this would be good to explain it in a comment.

> +        count > UINT8_MAX || offs > UINT16_MAX )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Check that the endpoint memory access descriptor array fits */
> +    if ( size * count + offs > blen )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    trans->mem_reg_attr = mem_reg_attr;
> +    trans->flags = flags;
> +    trans->mem_access_size = size;
> +    trans->mem_access_count = count;
> +    trans->mem_access_offs = offs;
> +    return 0;
> +}
> +
> +static int add_mem_share_frag(struct mem_frag_state *s, unsigned int offs,
> +                              unsigned int frag_len)
> +{
> +    struct domain *d = current->domain;
> +    unsigned int o = offs;
> +    unsigned int l;
> +    int ret;
> +
> +    if ( frag_len < o )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Fill up the first struct ffa_address_range */
> +    l = min_t(unsigned int, frag_len - o, sizeof(s->range) - s->range_offset);
> +    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
> +    s->range_offset += l;
> +    o += l;
> +    if ( s->range_offset != sizeof(s->range) )
> +        goto out;
> +    s->range_offset = 0;
> +
> +    while ( true )
> +    {
> +        ret = get_shm_pages(d, s->shm, &s->range, 1, s->current_page_idx,
> +                            &s->current_page_idx);
> +        if ( ret )
> +            return ret;
> +        if ( s->range_count == 1 )
> +            return 0;
> +        s->range_count--;
> +        if ( frag_len - o < sizeof(s->range) )
> +            break;
> +        memcpy(&s->range, s->buf + o, sizeof(s->range));
> +        o += sizeof(s->range);
> +    }
> +
> +    /* Collect any remaining bytes for the next struct ffa_address_range */
> +    s->range_offset = frag_len - o;
> +    memcpy(&s->range, s->buf + o, frag_len - o);
> +out:
> +    s->frag_offset += frag_len;
> +    return s->frag_offset;
> +}
> +
> +static void handle_mem_share(struct cpu_user_regs *regs)
> +{
> +    uint32_t tot_len = get_user_reg(regs, 1);
> +    uint32_t frag_len = get_user_reg(regs, 2);
> +    uint64_t addr = get_user_reg(regs, 3);
> +    uint32_t page_count = get_user_reg(regs, 4);
> +    struct ffa_mem_transaction_x trans;
> +    struct ffa_mem_access *mem_access;
> +    struct ffa_mem_region *region_descr;
> +    struct domain *d = current->domain;
> +    struct ffa_ctx *ctx = d->arch.ffa;
> +    struct ffa_shm_mem *shm = NULL;
> +    unsigned int last_page_idx = 0;
> +    uint32_t range_count;
> +    uint32_t region_offs;
> +    int ret = FFA_RET_DENIED;
> +    uint32_t handle_hi = 0;
> +    uint32_t handle_lo = 0;
> +
> +    /*
> +     * We're only accepting memory transaction descriptors via the rx/tx
> +     * buffer.
> +     */
> +    if ( addr )
> +    {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that fragment legnth doesn't exceed total length */

Typo: s/legnth/length/

> +    if ( frag_len > tot_len )
> +    {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    spin_lock(&ctx->lock);
> +
> +    if ( frag_len > ctx->page_count * PAGE_SIZE )
> +        goto out_unlock;
> +
> +    if ( !ffa_page_count )
> +    {
> +        ret = FFA_RET_NO_MEMORY;
> +        goto out_unlock;
> +    }
> +
> +    ret = read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &trans);
> +    if ( ret )
> +        goto out_unlock;
> +
> +    if ( trans.mem_reg_attr != FFA_NORMAL_MEM_REG_ATTR )
> +    {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
> +    /* Only supports sharing it with one SP for now */
> +    if ( trans.mem_access_count != 1 )
> +    {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    if ( trans.sender_id != get_vm_id(d) )
> +    {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that it fits in the supplied data */
> +    if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
> +        goto out_unlock;
> +
> +    mem_access = (void *)((vaddr_t)ctx->tx + trans.mem_access_offs);

There are a bit too much open-cast in this series. Please try to reduce 
the numbers.

In this case, the two casts are unnecessary because tx is already a void 
pointer.

In addition to that, ctx->tx could be a "const void *" because it is not 
meant to be written by Xen. The const would also needs to be propagated 
to mem_access & co.

> +    if ( read_atomic(&mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
> +    {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_offs = read_atomic(&mem_access->region_offs);
> +    if ( sizeof(*region_descr) + region_offs > frag_len )
> +    {
> +        ret = FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_descr = (void *)((vaddr_t)ctx->tx + region_offs);
> +    range_count = read_atomic(&region_descr->address_range_count);
> +    page_count = read_atomic(&region_descr->total_page_count);
> +
> +    shm = xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count)
This will allow a guest to allocate an arbitrarily large array in Xen. 
So please sanitize page_count before using it.

> +    if ( !shm )
> +    {
> +        ret = FFA_RET_NO_MEMORY;
> +        goto out;
> +    }
> +    shm->sender_id = trans.sender_id;
> +    shm->ep_id = read_atomic(&mem_access->access_perm.endpoint_id);
> +    shm->page_count = page_count;
> +
> +    if ( frag_len != tot_len )
> +    {
> +        struct mem_frag_state *s = xzalloc(struct mem_frag_state);
> +
> +        if ( !s )
> +        {
> +            ret = FFA_RET_NO_MEMORY;
> +            goto out;
> +        }
> +        s->shm = shm;
> +        s->range_count = range_count;
> +        s->buf = ctx->tx;
> +        s->buf_size = ffa_page_count * PAGE_SIZE;
> +        ret = add_mem_share_frag(s, sizeof(*region_descr)  + region_offs,
> +                                 frag_len);
> +        if ( ret <= 0 )
> +        {
> +            xfree(s);
> +            if ( ret < 0 )
> +                goto out;
> +        }
> +        else
> +        {
> +            shm->handle = next_handle++;
> +            reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> +            list_add_tail(&s->list, &ctx->frag_list);
> +        }
> +        goto out_unlock;
> +    }
> +
> +    /*
> +     * Check that the Composite memory region descriptor fits.
> +     */
> +    if ( sizeof(*region_descr) + region_offs +
> +         range_count * sizeof(struct ffa_address_range) > frag_len )
> +    {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret = get_shm_pages(d, shm, region_descr->address_range_array, range_count,
> +                        0, &last_page_idx);
> +    if ( ret )
> +        goto out;
> +    if ( last_page_idx != shm->page_count )
> +    {
> +        ret = FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    /* Note that share_shm() uses our tx buffer */
> +    spin_lock(&ffa_buffer_lock);
> +    ret = share_shm(shm);
> +    spin_unlock(&ffa_buffer_lock);
> +    if ( ret )
> +        goto out;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_add_tail(&shm->list, &ffa_mem_list);

A couple of questions:
   - What is the maximum size of the list?
   - Why is the list is global rather than per domain? In fact, looking 
at handle_mem_reclaim() it looks like a domain could potentially reclaim 
in memory (we don't seem to sanitize the input other than checking the 
handle is used). So it seems to me the list should be per-domain.

> +    spin_unlock(&ffa_mem_list_lock); > +
> +    reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> +
> +out:
> +    if ( ret && shm )
> +    {
> +        put_shm_pages(shm);
> +        xfree(shm);
> +    }
> +out_unlock:
> +    spin_unlock(&ctx->lock);
> +
> +    if ( ret > 0 )
> +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, trans.sender_id);
> +    else if ( ret == 0)

Coding style: missing space before ).

> +            set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            set_regs_error(regs, ret);
> +}
> +

I will continue the review later on.

-- 
Julien Grall

