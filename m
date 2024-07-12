Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2806492F8F9
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 12:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757853.1166987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDVQ-0001Nv-9U; Fri, 12 Jul 2024 10:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757853.1166987; Fri, 12 Jul 2024 10:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSDVQ-0001LT-6j; Fri, 12 Jul 2024 10:28:00 +0000
Received: by outflank-mailman (input) for mailman id 757853;
 Fri, 12 Jul 2024 10:27:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QfHc=OM=bounce.vates.tech=bounce-md_30504962.6691052a.v1-9361dbafef4c4bfdaf97a85e438f87e7@srs-se1.protection.inumbo.net>)
 id 1sSDVP-0001LN-CZ
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 10:27:59 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 668552c6-4039-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 12:27:55 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WL78V29tkz6CQ1rJ
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 10:27:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9361dbafef4c4bfdaf97a85e438f87e7; Fri, 12 Jul 2024 10:27:54 +0000
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
X-Inumbo-ID: 668552c6-4039-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720780074; x=1721040574;
	bh=5R9FyRyY+GnjFKVBfkalGAYaXy9sFcqtQIFzKRFbdgw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Dxb1DRFAOONXSanBYMwXdeTdITYGjxOC2NMFayF7lVcgB9/FiOjbnH/nIixCsHvPS
	 wlChjQ45cbNXTOTgMzsOPw1RvlkFvJXJKf27IZiAY0q6q1ok6MSOTcfa411rmyeco6
	 O15idRdrPazkZKfEVwnmhz4PdYrAomw9gCqyDXKNYy/vzbrzLv5dhjjBMu/Nu3YqwP
	 jWf8/acXAf3T4awwGl5ql9hRftQFcsP1/qS+OmKXLuVdrURn8T+j9vZCwysejpg/x9
	 kE1Gk628sXRNmYtH/dfv8nOxbu0AO/fBPWmiD9wg72cOVIq1XgmRH1hLnrmKWhlJpW
	 Evs6hfg3sbU8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720780074; x=1721040574; i=teddy.astie@vates.tech;
	bh=5R9FyRyY+GnjFKVBfkalGAYaXy9sFcqtQIFzKRFbdgw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OhF1Rwt+Zo+bip3l0Bfs7E/5wANwUYAA6J9AD5p/TjvHTa0D4qTAjejwJDk+Dd4me
	 DmYda2tqD+bGKb7119DaTiRB2MadDx5t8QErEe8um/885eXJ6GztXAU37yMgJp/yEa
	 b1Cdyfumhzbnejf9nvx/bq0ytR99aoc/ukkZLZv0iKZCBlylj1LmAuRd8TumONwQYZ
	 RODg9qcpdbSCXcGdJOE2+SGCQfSUljxHwjwxR6VFbmjl8gui9yjx804Z9oqWNGWTTO
	 scVGmSiNTQsg/2DIYFq8NjwXjFSnPTJe5U2dM3pvS18d1/6jyvm/AcDSpCzj8tCb6Y
	 kFwiaXwgWU5Nw==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v3=205/5]=20xen/public:=20Introduce=20PV-IOMMU=20hypercall=20interface?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720780072847
Message-Id: <fc6c45af-561b-46b0-ab96-6cd58ffe7726@vates.tech>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <cover.1720703078.git.teddy.astie@vates.tech> <f9ae663df38acc0d330b7582dfaa7ac199746aca.1720703078.git.teddy.astie@vates.tech> <D2MYC4AEBUQZ.3DNOIV8LEE7F9@cloud.com>
In-Reply-To: <D2MYC4AEBUQZ.3DNOIV8LEE7F9@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9361dbafef4c4bfdaf97a85e438f87e7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 10:27:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Alejandro,

>> +#define PVIOMMU_MAX_PAGES 256 /* Move to Kconfig ? */
> 
> It probably wants to be a cmdline argument, I think.
> 

Maybe, but in that sense, I think it should be a domain-specific limit 
rather than a global one. (e.g ability to prevent a DomU from having a 
very permissive limit).

>> +
>> +/* Allowed masks for each sub-operation */
>> +#define ALLOC_OP_FLAGS_MASK (0)
>> +#define FREE_OP_FLAGS_MASK (IOMMU_TEARDOWN_REATTACH_DEFAULT)
>> +
>> +static int get_paged_frame(struct domain *d, gfn_t gfn, mfn_t *mfn,
>> +                           struct page_info **page, int readonly)
>> +{
>> +    p2m_type_t p2mt;
>> +
>> +    *page = get_page_from_gfn(d, gfn_x(gfn), &p2mt,
>> +                             (readonly) ? P2M_ALLOC : P2M_UNSHARE);
>> +
>> +    if ( !(*page) )
>> +    {
>> +        *mfn = INVALID_MFN;
>> +        if ( p2m_is_shared(p2mt) )
>> +            return -EINVAL;
>> +        if ( p2m_is_paging(p2mt) )
>> +        {
>> +            p2m_mem_paging_populate(d, gfn);
>> +            return -EIO;
>> +        }
>> +
>> +        return -EPERM;
> 
> This is ambiguous with the other usage of EPERM.
> 

Yes, I think this part should be reviewed, because it may have 
implication with e.g DMA to grant mappings (not sure how it should be 
handled though). I am not an expert on Xen memory management though.

>> +static long map_pages_op(struct pv_iommu_op *op, struct domain *d)
>> +{
>> +    int ret = 0, flush_ret;
>> +    struct page_info *page = NULL;
>> +    mfn_t mfn;
>> +    unsigned int flags;
>> +    unsigned int flush_flags = 0;
>> +    size_t i = 0;
>> +
>> +    if ( op->map_pages.nr_pages > PVIOMMU_MAX_PAGES )
>> +        return -E2BIG;
>> +
>> +    if ( !iommu_check_context(d, op->ctx_no) )
>> +        return -EINVAL;
>> +
>> +    //printk("Mapping gfn:%lx-%lx to dfn:%lx-%lx on %hu\n",
>> +    //       op->map_pages.gfn, op->map_pages.gfn + op->map_pages.nr_pages - 1,
>> +    //       op->map_pages.dfn, op->map_pages.dfn + op->map_pages.nr_pages - 1,
>> +    //       op->ctx_no);
>> +
>> +    flags = 0;
>> +
>> +    if ( op->flags & IOMMU_OP_readable )
>> +        flags |= IOMMUF_readable;
>> +
>> +    if ( op->flags & IOMMU_OP_writeable )
>> +        flags |= IOMMUF_writable;
>> +
>> +    spin_lock(&dom_iommu(d)->lock);
>> +
>> +    for (i = 0; i < op->map_pages.nr_pages; i++)
> 
> This loop (and the unmap one) want to be bound by MIN(nr_pages, FOO), where  FOO
> is some upper bound to the number of hypercalls we're willing to do in a single
> continuation. If case of reaching that high number, we should create a new
> continuation and allow something else to run.
> 

That can be a good idea, although, it needs some care :
- we need to make sure that when we preempt, the state is well defined 
(e.g we need to do a iotlb_flush before preempting into a continuation)
- the hypercall result should account for all pages mapped in the 
hypercall and all continuations, and stop in case of error; reporting 
how much pages got actually mapped at the end

>> +    {
>> +        gfn_t gfn = _gfn(op->map_pages.gfn + i);
>> +        dfn_t dfn = _dfn(op->map_pages.dfn + i);
>> +
>> +        /* Lookup pages struct backing gfn */
>> +        ret = get_paged_frame(d, gfn, &mfn, &page, 0);
>> +
>> +        if ( ret )
>> +            break;
>> +
>> +        /* Check for conflict with existing mappings */
>> +        if ( !_iommu_lookup_page(d, dfn, &mfn, &flags, op->ctx_no) )
>> +        {
>> +            put_page(page);
>> +            ret = -EADDRINUSE;
>> +            break;
>> +        }
>> +
>> +        ret = _iommu_map(d, dfn, mfn, 1, flags, &flush_flags, op->ctx_no);
>> +
>> +        if ( ret )
>> +            break;
>> +    }
>> +
>> +    flush_ret = _iommu_iotlb_flush(d, _dfn(op->map_pages.dfn),
>> +                                   op->map_pages.nr_pages, flush_flags,
>> +                                   op->ctx_no);
>> +
>> +    spin_unlock(&dom_iommu(d)->lock);
>> +
>> +    op->map_pages.mapped = i;
>> +
>> +    if ( flush_ret )
>> +        printk("Flush operation failed (%d)\n", flush_ret);
> 
> I haven't looked at _iommu_iotlb_flush(), but a printk isn't good enough here.
> We want to set up a continuation to retry later, I think.
> 
> What might cause the error?
> 

I would say, it's mostly implementation-dependant (with x86 IOMMU 
drivers, iotlb_flush cannot fail though). The only other situation where 
_iommu_iotlb_flush can fail is when trying to do map/unmap on a IOMMU 
context that is being destroyed asynchronously (dying state). It makes 
all operations failing immediately with -EINVAL.
>> +
>> +    return ret;
>> +}
>> +
>> +static long lookup_page_op(struct pv_iommu_op *op, struct domain *d)
>> +{
>> +    mfn_t mfn;
>> +    gfn_t gfn;
>> +    unsigned int flags = 0;
>> +
>> +    if ( !iommu_check_context(d, op->ctx_no) )
>> +        return -EINVAL;
>> +
>> +    /* Check if there is a valid BFN mapping for this domain */
>> +    if ( iommu_lookup_page(d, _dfn(op->lookup_page.dfn), &mfn, &flags, op->ctx_no) )
>> +        return -ENOENT;
>> +
>> +    gfn = mfn_to_gfn(d, mfn);
>> +    BUG_ON(gfn_eq(gfn, INVALID_GFN));
>> +
>> +    op->lookup_page.gfn = gfn_x(gfn);
>> +
>> +    return 0;
>> +}
>> +
>> +long do_iommu_sub_op(struct pv_iommu_op *op)
>> +{
>> +    struct domain *d = current->domain;
>> +
>> +    if ( !can_use_iommu_check(d) )
>> +        return -EPERM;
> 
> This checks should be split, imo.
> 
> ```
>      if ( !iommu_enabled || !is_iommu_enabled(d) )
>          return -ENOTSUP;
>      if ( !is_hardware_domain(d) )
>          return -EPERM;
> ```
> 
> For the second, we probably want an XSM hook as well (or instead of, not sure).
> 

Yes (or at least, a way to know if the domain has ability to use 
PV-IOMMU and has devices for it).

>> +
>> +    switch ( op->subop_id )
>> +    {
>> +        case 0:
>> +            return 0;
> 
> IOMMUOP_noop?
> 

Could be a good fit

>> +/**
>> + * Query PV-IOMMU capabilities for this domain.
>> + */
>> +#define IOMMUOP_query_capabilities    1
>> +
>> +/**
>> + * Allocate an IOMMU context, the new context handle will be written to ctx_no.
>> + */
>> +#define IOMMUOP_alloc_context         2
> 
> Please, don't write to the header. It's an absolute pain to Rust-ify and highly
> unexpected when absolutely everything else will take that as an input parameter.
> 
> Provide the output as a dedicated OUT field in the alloc_context struct
> instead.
> 

Yes, as there may be cases where the current approach gets confusing 
(cloning context).

>> +
>> +/**
>> + * Destroy a IOMMU context.
>> + * All devices attached to this context are reattached to default context.
>> + *
>> + * The default context can't be destroyed (0).
>> + */
>> +#define IOMMUOP_free_context          3
>> +
>> +/**
>> + * Reattach the device to IOMMU context.
>> + */
>> +#define IOMMUOP_reattach_device       4
>> +
>> +#define IOMMUOP_map_pages             5
>> +#define IOMMUOP_unmap_pages           6
>> +
>> +/**
>> + * Get the GFN associated to a specific DFN.
>> + */
>> +#define IOMMUOP_lookup_page           7
>> +
>> +struct pv_iommu_op {
>> +    uint16_t subop_id;
>> +    uint16_t ctx_no;
> 
> Seeing how there's no polymorphism going on, why not put these on each struct?
> Then each handler can take a pointer to each substruct and everything is a lot
> safer.
> 

Do you mean something like

struct pv_iommu_op {
   uint16_t subop_id;
   uint16_t ctx_no; /* IN */
   void *subop_struct;
};

?

>> +
>> +/**
>> + * Create a context that is cloned from default.
>> + * The new context will be populated with 1:1 mappings covering the entire guest memory.
>> + */
>> +#define IOMMU_CREATE_clone (1 << 0)
>> +
>> +#define IOMMU_OP_readable (1 << 0)
>> +#define IOMMU_OP_writeable (1 << 1)
>> +    uint32_t flags;
> 
> This bitmap is used for different things in different subops, which highly
> suggests it should be per-struct instead.
> 

Having a flags field in each subop_struct ?

>> +
>> +    union {
>> +        struct {
> 
> Can you move these out to be first-class structs rather than anon? In pretty
> much the same way of the other major hypercall groups. I'd like to be able to
> generate them from IDL like I intend to do with all others.
> 

Yes

>> +            uint64_t gfn;
>> +            uint64_t dfn;
> 
> (a) I'd rather see descriptions in the missing gfn/dfn in various fields, and
> more specifically IN/OUT tags everywhere (i.e: as in /* IN: Number of pages to
> map */).
> 
> (b) Any 64bit numbers in the external ABI must be uint64_aligned_t so the
> alignment is 8 on 32bit architectures. I know this instance (and the others)
> happen to be aligned in both cases, but still.
> 

Makes sense

> That said, either these are 32bit frame numbers or otherwise we're better off
> using addresses instead.  It'd also be less confusing on systems with several
> page sizes, and it'd be specially less confusing if an additional parameter of
> "order" or "page size" was added here.
> 

It's something pretty similar to what Linux expects, and it is in fact 
in guest responsibility to ensure that addresses are aligned to page 
size and that the page size is actually supported.

While guest_addr (replacement for gfn) could be a good fit for phys_addr 
or something similar. I would keep dfn as uint64_t as it's perfectly 
valid to be able to map on >4G areas on a 32-bits platform.
But we want to make sure that all the guest memory can be represented as 
a phys_addr (e.g 32-bits addr may not be enough for a i686 guest due to 
PAE).

>> +            /* Number of pages to map */
>> +            uint32_t nr_pages;
>> +            /* Number of pages actually mapped after sub-op */
>> +            uint32_t mapped;
> 
> A more helpful output might some kind of err_addr with the offending page. Then
> the caller doesn't have to do arithmetic to print the error somewhere.
> 

This value is used as it is the kind of result Linux wants for IOMMU. 
Linux has a return value which is the number of pages actually mapped 
(if it's less than expected, it will retry though and if it is zero, it 
assumes it's a failure).

> Furthermore, seeing how this is something that should not happen I'd be tempted
> to amend the spec to somehow roll back whatever we just did, but that could be
> tricky with big numbers in `nr_pages`.
> 

Being able to rollback may be tricky as it supposes you keep previous 
state. For instance, when doing unmap, you practically need to backup 
parts of the pagetable or do CoW on it, so you can revert in case of 
something goes wrong.
Otherwise, all modifications made directly on the pagetable may be 
immediately effective if those entries are not cached by IOTLB.

That's possible, but needs a more sophisticated management logic of page 
tables at first.


---

I will try to do some changes on this interface with some eventual new 
features (even if unimplemented yet) and some of your proposals and 
publish it as an independent RFC.

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

