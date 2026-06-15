Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vlxbMEwVMGqXNAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:07:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F896877B0
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 17:07:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Jj3kkRnY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338362.1599387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ8ui-0006Ln-5N; Mon, 15 Jun 2026 15:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338362.1599387; Mon, 15 Jun 2026 15:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ8ui-0006J4-2F; Mon, 15 Jun 2026 15:07:48 +0000
Received: by outflank-mailman (input) for mailman id 1338362;
 Mon, 15 Jun 2026 15:07:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZ8ug-0006Iy-Mb
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 15:07:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ8ug-00D0cm-37
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 17:07:46 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a30152f-bab6-0a2a0a5309dd-0a2a4502dc54-26
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:07:46 +0200
Received: from [74.125.224.45] (helo=mail-yx1-f45.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a301540-af86-0a2a45020019-4a7de02ddd0a-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 17:07:45 +0200
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-6604176b575so2890975d50.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:07:45 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781536064; cv=none;
        d=google.com; s=arc-20240605;
        b=eSMqIUotVPNeanjukE2NmekFRtcepv24JkR0abbMAPiRGIsWrN4dW/GwF2BUstbOtY
         eUbqYepCymSN0ltL6MyARureynVUNm5USEbM/dusIYyQIYsuzIacglox4QBO/O37Qqqd
         IqKI2t4R50ZlorwtWWK9GcUZLbzjAYPeo3oYECz7VlkgAKbWvu/9YXm2Tm0TZeADsKsg
         lbMewea42ojjFGVZiH+bg/GjSRZjjqacUTK6U75gYMBQVmUHsqctsGrGRJJnr+64Mk2F
         Zk9UpxHiz3bRJsfh+c8/V3a32bu+8cnI52TmlnyD24XI0kJ2kNLO/YkdezRcznmtNLtR
         WIEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CndTcKfCH82aUKj/f1b9neCoIs2mCiGx0N/nrnCEwEQ=;
        fh=OtBKR5Ep8z1KYzMIrXbXTC77nuY2r0q5Jx/RIZj9FDQ=;
        b=ZCrpbivbct07BhXxqxBuZ6aL7OojHpl/lpuuobTDcgALfMgL9vfP5V2O0dfQWYDW6n
         P6H3xAXSI0WiExOPLsEI9PTgmh21kEZzrfCOfifimnblWz562C7HpsQTDJv8iv71tFZf
         3s2ruYuXK1DMaJc8H9kLzj4CHkRhi/1axFCmC8HPZXtGhPiIcAOqqxKpkCQE+Vx6wH0j
         nhj2B0vMa5a9oNpzrO412o9lyJtNdrTnUaIn067zGnBpjGuqWZ9w16EIbbGcpjEMPY6/
         L0y4V4VDsFvnE+r4wXc1abdDZMxdr6PfRXu4LD+SKmj/UQvaoMMzh6q7anN7EQikRB/a
         4YBA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781536064; x=1782140864; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CndTcKfCH82aUKj/f1b9neCoIs2mCiGx0N/nrnCEwEQ=;
        b=Jj3kkRnYDGPS2upM4yeDUL0z+x3ERWZvifwoTN1Ox2NKv2cQqyiuy+GgL6TxA1Sqns
         N2E9XTAUNEMxkccyAyIwHCLOMY5tyM2risrLLCYlKarMVnj9LMIUJZk9QyDTfBE2AiXe
         tmymPAUuOXet1GphS8Zzaay8ivID8AA5hB5mpzCeK+Cq3m+gqcidZX5bOn2PVajd97OG
         9gdfRa/otTUtZsNgMP77PXbLUUlfLa3gofs5x7rJuM3mV5sgtzOqXcr88GZBXFEOfL5M
         ZQ6GUNXtwIltswnTTqXY4fE8THP6zfh5qt3QiCF1N6cwZoLT7DIESZUB7Dx0mI3/RhsW
         wt3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536064; x=1782140864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CndTcKfCH82aUKj/f1b9neCoIs2mCiGx0N/nrnCEwEQ=;
        b=Wx3haF5D453bCHfP3lfMyAMugIz/7SzssUT76fQ/LgSNYHNLmf4uQZp1kLcqmBT/Hl
         ZnCr5OisaOU+cOUvYi4xUZi3EGhAnmzGvCX9/c143ynZhUc3PotkvSOjOpp1lWSmlRqY
         tX0RYdTPuheCw0ZlXsRiO3EMndFa5x1agLTDFK/5ow6EZKNTWQe/jXJbCqFjvvwOvK57
         VSjxeABLOfHrGMFmVE/bJhiX1UilBZc+aCCV8mBFfhnSIFQB37wMZFdbATMKI2iEmJal
         NQVxdYopbmKvnem/viSvoiPekWfXOHcmh0EOssgj5RUWHmspexaPmm96RSRVdp0mVC7e
         N6tw==
X-Forwarded-Encrypted: i=1; AFNElJ8ufyOvESrPT5D7x20L2XSKgL+ywEXfncPP2dNpI0+tbS4K540ed1VctL7EbOEvnZkGxPn6/8cB53M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykR4RanDM7BE4ItEL78r5Fnhqs924H/zrmg8Lv6RGBEonQ+lWt
	LdM9joVtrlFEazapxxudFo+sxvfFK260xe4H3I2EGX0HLpzLIjuaOw/Zn5dwazOmI8RIjv1hG4U
	nPtNCefHEiu2GbDvheuBrx3YJpEeJGFE=
X-Gm-Gg: Acq92OHsZwnEdOGKisg+E8hRTkgtqqvOSuulzMquVLFZ5G/2Ri18v0lCAR/EzQwuOoM
	d3IkMhwCRdvDDvAoOZhI51yFFY8vhspKF9zTdlfoCljvb+kY6f5KMywA5MEinaY58vK93+dXP1W
	lDFn0L7XRUQa0JvF56+OebLsjl1jnKdw8gbwb7/Ke8bsFxH5KnACFasW99S2zxPVs+ruGhnXdgY
	hnupwYKx5COmefksrNQfJ2JSEkeAWvz5DlfJ8/5Fh1uLHrCYq1fYLt29iKx9+6sjf1njgC1Wjsp
	CyNB5UkzkjzvXMyVpsUGuh+lfeZb9diSXeJCGA==
X-Received: by 2002:a05:690e:4410:b0:662:b352:d033 with SMTP id
 956f58d0204a3-662b353026cmr155645d50.29.1781536064280; Mon, 15 Jun 2026
 08:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
 <20260613214749.20620-13-frediano.ziglio@cloud.com> <8289ea1d-ceca-40b6-a992-a778be053cd0@suse.com>
 <CAHt6W4en1yMLrUXv+RbcoPr-=S_=pi2Rrcm2BC2PzMZT+0ksFw@mail.gmail.com> <1c1829d2-4cb4-4e29-9012-fdcbca8d79a9@suse.com>
In-Reply-To: <1c1829d2-4cb4-4e29-9012-fdcbca8d79a9@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 15 Jun 2026 16:07:32 +0100
X-Gm-Features: AVVi8Cd5iJI3srvx1iXlGkNW5-6W5xQwHX_hnkNjxeeI8lUv0FiYIaIPZ7Ex1Jc
Message-ID: <CAHt6W4daGuduOgRNUFOB8SZd+C5bxaubyQoU=xDcJSMzo97VDw@mail.gmail.com>
Subject: Re: [PATCH v5 12/16] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-720697/1781536066-80145161-2AB6A3F9/0/0
X-purgate-type: clean
X-purgate-size: 10917
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29F896877B0

On Mon, 15 Jun 2026 at 15:03, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.06.2026 14:11, Frediano Ziglio wrote:
> > On Mon, 15 Jun 2026 at 08:41, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 13.06.2026 23:47, Frediano Ziglio wrote:
> >>> --- a/xen/common/memory.c
> >>> +++ b/xen/common/memory.c
> >>> @@ -1545,6 +1545,133 @@ static int acquire_resource(
> >>>      return rc;
> >>>  }
> >>>
> >>> +/*
> >>> + * The "noinline" qualifier avoids the compiler to create a large function
> >>> + * consuming quite a lot of stack.
> >>> + */
> >>> +static int noinline mem_foreigncopy(
> >>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> >>> +{
> >>> +    struct domain *d, *const currd = current->domain;
> >>> +    xen_foreigncopy_t copy;
> >>> +    int rc, direction;
> >>> +
> >>> +    if ( copy_from_guest(&copy, arg, 1) )
> >>> +        return -EFAULT;
> >>> +
> >>> +    if ( copy.flags & ~1U )
> >>> +        return -EINVAL;
> >>> +
> >>> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> >>> +
> >>> +    if ( copy.nr_frames == 0 )
> >>> +        return 0;
> >>> +
> >>> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
> >>> +    if ( rc )
> >>> +        return rc;
> >>
> >> Extending my v4 remark: How about a "fully foreign" copy? I.e. one between two
> >> pages in two foreign domains? Getting me back also to the un-answered v4
> >> question of mine as to MMUEXT_COPY_PAGE.
> >
> > I really thought I replied to this but I cannot find it.
> > MMUEXT_COPY_PAGE was the first attempt to do this but mmuext is
> > designed for PV and extending was made the code confusing.
>
> We discussed this on the x86 call, and yes - the major op being PV-only is
> getting in the way here.
>

Added a comment in the commit message:

    Extending MMUEXT_COPY_PAGE seems better on first sight but considering
    that MMUEXT is meant for PV only and trying to change that sub-op this
    solution is better.

> >> Further, as to the order of checks: I'm not going to insist on re-ordering, yet
> >> I'd like to point out that copying 0 pages to/from a bad domid might better
> >> yield an error.
> >
> > Not strong about this, changed to return -EINVAL. Reordering after
> > this change won't make much sense, -EINVAL is returned both for wrong
> > flags or no frames.
>
> Please don't - copying 0 frames with all other arguments correct is not an
> error.
>

This comment seems to contradict  the not insisting  on re-ordering.
Changed the order so to check the domid before nr_frames == 0 :

    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
    if ( rc )
        return rc;

    if ( copy.nr_frames == 0 )
    {
        rcu_unlock_domain(d);
        return 0;
    }

> >>> +    do {
> >>> +        /*
> >>> +         * Arbitrary size.  Not too much stack space, and a reasonable stride
> >>> +         * for continuation checks.
> >>> +         */
> >>> +        xen_pfn_t gfn_list[32];
> >>> +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
> >>> +
> >>> +        rc = -EFAULT;
> >>> +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
> >>> +            goto out;
> >>> +
> >>> +        for ( unsigned i = 0; i < todo; i++ )
> >>
> >> Nit: "unsigned int" please (like you have it above).
> >
> > Changed. Note that "long" is also not a type but a modifier. Would it
> > be good to change both the above to "unsigned" instead for consistency
> > with "long" ?
>
> No, the way we spell types has historical reasons and isn't tied to the
> exact lexical meaning of the keywords.
>
> >>> +        {
> >>> +            struct page_info *foreign_page;
> >>> +            void *foreign;
> >>> +            p2m_type_t p2mt;
> >>> +            const unsigned long valid_mask =
> >>> +#ifdef CONFIG_X86
> >>> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
> >>> +#else
> >>> +                p2m_to_mask(p2m_ram_rw);
> >>> +#endif
> >>
> >> What about, for example, p2m_ram_ro? Or p2m_ram_shared? Or p2m_grant_map_*?
> >> Etc. Any artificial constraining wants justifying in the description and/or
> >> mentioning in the public header.
> >
> > The base of this was taken from migration code where there is such a check.
> > I suppose that adding p2m_ram_ro (where available) won't hurt.
>
> Just to mention, to avoid another round trip just because of this: p2m_ram_ro
> has different meaning on x86 vs Arm/RISC-V.
>

That's confusing... should not this be fixed somehow?
It won't save much from a round-trip. Should I allow it or not ?

> > p2m_ram_shared I'm not sure but seems fine too.
> > For p2m_grant_map_* it feels a bit a security issue to me. It would
> > allow a guest to give access to pages of other domains. It's true that
> > the current domain would have to have write access to this domain
> > anyway but extend these permissions sounds something it should not be
> > able to do.
>
> It could copy the contents of the grant mapped page by other means. Why not
> allow it in this new sub-op as well then?
>

I'm more afraid of writing the content of the grant pages than copying it.

> Talking of security: When the page you copy to is owned by a PV guest, I
> think you further need to obtain a PGT_writable type ref. (Of course it then
> likely is easier to always do this, not just for PV.)
>

Wondering how save/restore (or migration) works in this case.

> >>> @@ -2012,6 +2139,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>              start_extent);
> >>>          break;
> >>>
> >>> +    case XENMEM_foreigncopy:
> >>> +        if ( unlikely(start_extent) )
> >>> +            return -EINVAL;
> >>
> >> Please address review comments (verbally or by code changes) before submitting
> >> a new version. Here I had asked "Why make this different from other continuable
> >> sub-ops?"
> >>
> >
> > There's already a comment in the same file for similar reason
> >
> >     /*
> >      * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't ideal.  If
> >      * it ever becomes a practical problem, we can switch to mutating
> >      * xmar.{frame,nr_frames,frame_list} in guest memory.
> >      */
> >
> > so to avoid the doubt and possible future change I mutate the structure.
> > Also I use the mutation to give more information to the caller, using
> > "start_entent" won't allow this.
>
> You'll want to mention this in the description and/or a code comment. It
> wants to become clear that the inconsistency in behavior (with other sub-
> ops) is deliberate rather than accidental.
>

Added a comment in the code:

        if ( copy.nr_frames && hypercall_preempt_check() )
        {
            /*
             * Instead of using "start_extent" we update the structure back,
             * we update it back in anyway to tell caller were the copy
             * stopped.
             */
            rc = hypercall_create_continuation(
                __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg);
            goto out;
        }

> >>> --- a/xen/include/public/memory.h
> >>> +++ b/xen/include/public/memory.h
> >>> @@ -740,7 +740,45 @@ struct xen_vnuma_topology_info {
> >>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
> >>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
> >>>
> >>> -/* Next available subop number is 29 */
> >>> +/*
> >>> + * Copy memory from/to a given domain.
> >>> + */
> >>> +#define XENMEM_foreigncopy 29
> >>> +struct xen_foreigncopy {
> >>> +    /* IN - The domain whose resource is to be copied. */
> >>
> >> There's still "resource" here, when this really is about RAM (memory) only,
> >> not any other kind of resource.
> >>
> >>> +    domid_t domid;
> >>> +
> >>> +    /* IN - Flags. */
> >>> +#define XENMEM_foreigncopy_from 0
> >>> +#define XENMEM_foreigncopy_to 1
> >>> +#define XENMEM_foreigncopy_direction 1
> >>> +    uint16_t flags;
> >>> +
> >>> +    /*
> >>> +     * IN
> >>> +     *
> >>> +     * As an IN parameter number of frames of the domain to be copied.
> >>> +     */
> >>> +    uint32_t nr_frames;
> >>
> >> This isn't just an input, as you update the field (and the handles below).
> >> This property of fields wants reflecting here, so callers know that they (a)
> >> can't re-use the struct on a subsequent call without re-initializing the
> >> fields which may have changed, and (b) can't put the struct in r/o memory.
> >>
> >
> > Update comments:
> >
> > /*
> >  * Copy memory from/to a given domain.
> >  */
> > #define XENMEM_foreigncopy 29
> > struct xen_foreigncopy {
> >     /* IN - The domain whose memory is to be copied. */
> >     domid_t domid;
> >
> >     /* IN - Flags. */
> > #define XENMEM_foreigncopy_from 0
> > #define XENMEM_foreigncopy_to 1
> > #define XENMEM_foreigncopy_direction 1
> >     uint16_t flags;
> >
> >     /*
> >      * IN/OUT
> >      *
> >      * As an IN parameter number of frames of the domain to be copied.
> >      * On output on error updated number of frames left.
> >      */
> >     uint32_t nr_frames;
>
> This is updated not only on error, but also when encoding continuations.
>

Yes, but this seems more an implementation detail to me. I don't think
the caller cares about how the continuation is implemented.

> >>> +    /*
> >>> +     * IN
> >>> +     *
> >>> +     * Frames to be copied.
> >>> +     */
> >>> +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
> >>> +
> >>> +    /*
> >>> +     * IN/OUT
> >>> +     *
> >>> +     * Userspace buffer to read/write from.
> >>> +     */
> >>> +    XEN_GUEST_HANDLE(uint8) buffer;
> >>
> >> With these two handles, there continues to be a need to (explicitly) deal
> >> with the compat case as well.
> >
> > I don't agree with this. Domains having access to other domains are
> > limited (like stub domains for Qemu) and won't be 32 bits today so why
> > allow 32 bits guests if not ever used?
>
> How do you know? Why shouldn't e.g. XTF be permitted to test this in all
> possible modes? And even if all arguments end up in favor of "no compat
> support", this then wants spelling out to make clear this wasn't an
> oversight, but rather a conscious decision.
>

XTF can do something like

#if COMPAT_GUEST
    /* Compat guests are not supported, return success. */
    return 0;
# endif

(or can be done in the Makefiles I suppose).

Added a comment in memory.h:

    /*
     * Copy memory from/to a given domain.
     * As this call requires target access and guest with target access won't be
     * compat guests supported for compat guests this is not implemented.
     */
    #define XENMEM_foreigncopy 29
    struct xen_foreigncopy {

> Jan

Frediano

