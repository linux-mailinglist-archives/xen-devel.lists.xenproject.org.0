Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cmghNmZmOmpV8AcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 12:56:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D9A6B66D9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 12:56:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rJUGMhPo;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344195.1603317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbyng-00044B-62; Tue, 23 Jun 2026 10:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344195.1603317; Tue, 23 Jun 2026 10:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbyng-00041u-2m; Tue, 23 Jun 2026 10:56:16 +0000
Received: by outflank-mailman (input) for mailman id 1344195;
 Tue, 23 Jun 2026 10:56:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wbynd-00041o-Sa
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 10:56:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbync-00Aata-PR
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 12:56:12 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3a664b-bab6-0a2a0a5309dd-0a2a45069ffe-10
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 12:56:12 +0200
Received: from [74.125.224.52] (helo=mail-yx1-f52.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a3a664b-b690-0a2a45060019-4a7de034e809-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 12:56:12 +0200
Received: by mail-yx1-f52.google.com with SMTP id
 956f58d0204a3-662ebb1329aso2604259d50.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 03:56:12 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782212171; cv=none;
        d=google.com; s=arc-20240605;
        b=g5H6PZkkAPyYFL3ge3tHcpL7YMfWlz6Qxcj49bru4EsAqHYB+qysFmHCfGlV3NANk8
         kl2tjR4UOebsrs1IsCMTV4d81iTCfxDMaOZ0FRE7avAXnRba+mH6xuAhp5VC8R4kZJwE
         vsKisZL3bz2DZt8rjc0BeceZTOmDtnAk8wTkHkjFyNhExB1rfAFGeB6FpNXMaOxuuch5
         yHWhUt6JsUu+RkzrDUA4Pi0kCS4DdL1znShjaMpo6zogaQCU4xCdSINvjgk229haXvNz
         HRUPvFrAcagbo/17SkIVEgbfcRjO5ErJvFvGmhX/A5YyYJEGWZXMqc6a3CoWPsK6bkPA
         nSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wdGGmGll3Ht5YC6J3ISLcFBULbyrMD2jWIH0eULPVYk=;
        fh=q6YmllG+4Nuq2jB/7YclHQodtflgkS2EWtGkU+nirko=;
        b=XQlpvLpQZibWoRcldZvH40i80I0jcpFmFVjxTrihbKRyLK/4jp3Jfxc8ZirHCKogct
         8+y32LIiY5mh5xG/ALfZyq340EXiEKWs3YWkLcjBxRkvuX4cWb8ZqwvlpoWBexyPlhw6
         klvTERzI2Q2cFQU2jB9mN+v10iOcfMvuO5UsljrT5qaXEtAY66NpmmloIeMLYxR6LTV0
         pLFu1RGXS0iuqEC1K1HFWbEmblKhBZPIeLPnef4aNUgJsme3NisLjGbXSco3dEd+rFuk
         Zcok3espNpHyxqUrydxk4nCb5m0I4kFeHgwGSciNqBCIsIhTHE23uEt9GxTcCFJ2YfIv
         dZdQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782212171; x=1782816971; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wdGGmGll3Ht5YC6J3ISLcFBULbyrMD2jWIH0eULPVYk=;
        b=rJUGMhPo/wM+s+tO1dNaXr6oRkl42UMuaD87D4jSl5BiUPCBH4QiUskxg2Mk1HBwLu
         8yEi6204sFaWrrN0+idGLzuHLpbH76Xu846AMn+12fyo5pouXBHSoN/fij/YVgDG7N+r
         cUdqhBwHnR/pFQ7lApLO5RM/3F/yZXMt3gZ1SKjkMTDI4F0jNq4hwqIPTRyZSvXivOAI
         kCyXkT1ZkevmTwJKlqM/7eS41BHiUABLSrSuCP+6prqRXVyoeiBbIcVpIEAmt0/8I5qN
         +vd1Hsd/YzxS1uFXxeQ2UZAhVuDSs7C8ar1JjBlHYGyNy0sofu/aoekdEp12rUuUxp1Y
         6QkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212171; x=1782816971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdGGmGll3Ht5YC6J3ISLcFBULbyrMD2jWIH0eULPVYk=;
        b=UxCiOtBMCWVe8p0nz30km3q5VdZ7NgRlQV/d9Xl5XimvbxC8v74Br5W3OUNeJGLcDq
         uFdVoDjMcEEWmkp+DFPRltwDk8X5wXXcPVoQu41gwc3k3up0keSo3nnVEGZUFkl3f70+
         e9/aDcbh4+jcuP1q4dAt1uZq0lnCHzuNInzhlmd6qq0lrn25b75/6ZvGf/6w+UJDv2sS
         FRhFS3ymKWcW4Md6KjqlF2szJUwaOyIFjLvv5Bp6tKrjUPmghpq+SEifXYZuigd5EteN
         TW8/9whcwFiRmyhX2fxSFoybs8syTsX840Nw3qFiZqnQo2bEb+MIy7rSl6kVOoR9ocaH
         HwtA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+QmmyqcOKSPK8BUgyHaLoiGhWVE2Cqd5fVnTP+oBUb6MB38LaZxT0cH3v5igradu2Oca/bR4qgHU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFpuqE8o/KUlyKVOY08CLGvIzqtPqQuYB6h81SKgA7TDnokq2D
	t91/D8n/Ndaum1JfZjuz7HuS/DGCIYl4WHC6i6Dc9tzLd3v55vvH49+VynroGPd9rgftqBFjp5B
	x7mUmB7OztxK7aTjEBs+LJEF23gVi2kE=
X-Gm-Gg: AfdE7ckoDYS9gTq3rxZBfoULrbAYhFM6nSQOSxzvFDVZ6epaCYTRXqW8Egjw5DmCVZO
	sx5eVpVo6zk9aBrsZdLmX6n6ISomiqGVqvdkGr/h0AiRTRNYbGVY0JxJopQzC6VvXnklqwUKY9Q
	loADAOH58rwHJ6y3mT24TqnGDHTzSe6hEfbu9UKPK1qrpe/m1jxQ121WgpVjgETEZo3spw6McNa
	jCdEUT6sT8YZj3g2OSqQAXueqMHEaPHGUfD/d/uAXHlfsV0SrjPylZTqMGd+/+6bB0T4JO7XKLi
	YRCDvyh+pCGlMaeLrB1Urg8=
X-Received: by 2002:a05:690e:b87:b0:656:25e6:e127 with SMTP id
 956f58d0204a3-662ffc549cemr16198427d50.11.1782212170937; Tue, 23 Jun 2026
 03:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-13-frediano.ziglio@citrix.com> <c5f00fa4-4d9e-4227-87a0-6e657fd523e9@suse.com>
In-Reply-To: <c5f00fa4-4d9e-4227-87a0-6e657fd523e9@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 23 Jun 2026 11:55:58 +0100
X-Gm-Features: AVVi8Ccl3XRVLEnUhCTcMICQaGMcXbWZDyGQpLSOpq_fY0gE-R8axM_z_P0JUYU
Message-ID: <CAHt6W4c0FDaMZK-4-7CReG_PdV+L=HNxVGNjV5vUjDkKq3EMBA@mail.gmail.com>
Subject: Re: [PATCH v6 12/16] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-16d1c6/1782212172-397F3853-28D34310/0/0
X-purgate-type: clean
X-purgate-size: 11789
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,xenproject.org:url];
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
X-Rspamd-Queue-Id: 38D9A6B66D9

On Mon, 22 Jun 2026 at 11:34, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 19.06.2026 15:04, Frediano Ziglio wrote:
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -1545,6 +1545,139 @@ static int acquire_resource(
> >      return rc;
> >  }
> >
> > +/*
> > + * The "noinline" qualifier avoids the compiler to create a large function
> > + * consuming quite a lot of stack.
> > + */
> > +static int noinline mem_foreigncopy(
> > +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> > +{
> > +    struct domain *d, *const currd = current->domain;
> > +    xen_foreigncopy_t copy;
> > +    int rc, direction;
> > +
> > +    if ( copy_from_guest(&copy, arg, 1) )
> > +        return -EFAULT;
> > +
> > +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
> > +        return -EINVAL;
> > +
> > +    direction = copy.flags & XENMEM_foreigncopy_direction;
> > +
> > +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
>
> Iirc I did ask before why this isn't ..._by_any_id().
>

I probably was confused by the question about MMUEXT and the 2 domains.
There are different similar hypercalls (like the mentioned MMUEXT but
also hypercalls to map foreign domain memory) that have this check
(not the same domain). Any domain has, obviously, access to its own
memory, so it should not have to use hypercall to access its own
memory. If it does it looks like a mistake causing performance issues
or an attempt to circumvent security; in either case you would like to
avoid it.

> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( copy.nr_frames == 0 )
> > +    {
> > +        rcu_unlock_domain(d);
> > +        return 0;
> > +    }
>
> Any reason this cannot also be "goto out"? The more that now that you have
> moved this past the domid validity check, imo it should further move to ...
>

The only reason was style and to avoid a memory copy, but it's not a
hot case so I'll change to "goto out" (no strong about it).

> > +    /*
> > +     * Check we are allowed to map and access these foreign pages.
> > +     */
> > +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> > +    if ( rc )
> > +        goto out;
>
> ... below here. Perhaps simply as
>
>     if ( rc || !copy.nr_frames )
>         goto out;
>

I think this would be confusing with the above "Check we are allowed
to map and access these foreign pages" comment.
Are you okay with just the change above to "goto out" ?
Also moving here would potentially change the result and do a useless check.

> > +    do {
> > +        /*
> > +         * Arbitrary size.  Not too much stack space, and a reasonable stride
> > +         * for continuation checks.
> > +         */
> > +        xen_pfn_t gfn_list[32];
> > +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
> > +
> > +        rc = -EFAULT;
> > +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
> > +            goto out;
> > +
> > +        for ( unsigned int i = 0; i < todo; i++ )
> > +        {
> > +            struct page_info *foreign_page;
> > +            mfn_t foreign_mfn;
> > +            void *foreign;
> > +            p2m_type_t p2mt;
> > +            const unsigned long valid_mask =
> > +#ifdef CONFIG_X86
> > +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
> > +#else
> > +                p2m_to_mask(p2m_ram_rw);
> > +#endif
>
> The set of permitted types didn't change, yet a justification for the resulting
> limitation also didn't appear.
>

Yes, that's missing, indeed.
Should the set of types be different for reading and writing? For
instance do not allow writing to read-only memory?
Given that it looks like different architectures have different
meanings and definitions for these constants, should it not be better
to define some new constants for this specific usage? For instance
P2M_READ_TYPES and P2M_WRITE_TYPES?

> > +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
> > +
> > +            if ( unlikely(!(p2m_to_mask(p2mt) & valid_mask)) && foreign_page )
> > +            {
> > +                put_page(foreign_page);
> > +                foreign_page = NULL;
> > +            }
> > +            if ( unlikely(!foreign_page) )
> > +            {
> > +                gdprintk(XENLOG_WARNING,
> > +                         "Error accessing foreign gfn %" PRI_gfn "\n",
> > +                         gfn_list[i]);
> > +                rc = -EINVAL;
> > +                copy.nr_frames -= i;
> > +                guest_handle_add_offset(copy.frame_list, i);
> > +                goto out;
> > +            }
> > +
> > +            foreign_mfn = page_to_mfn(foreign_page);
> > +
> > +            /* A page is dirtied when it's being copied to. */
> > +            if ( direction == XENMEM_foreigncopy_to )
> > +                paging_mark_dirty(d, foreign_mfn);
> > +
> > +            foreign = map_domain_page(foreign_mfn);
> > +            if ( direction == XENMEM_foreigncopy_from )
> > +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> > +            else
> > +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
>
> You cannot validly write to the page without holding a PGT_writable ref.
> Else you might overwrite a page table or a descriptor table in a PV guest.
>

Given that this code was "inspired" by other hypercalls I'll also
check the other code.

> Once again - can you please make sure you have addressed earlier review
> comments, before sending a new version? I did point this out before.
>

Apparently not.

> > +            unmap_domain_page(foreign);
> > +            put_page(foreign_page);
> > +
> > +            if ( unlikely(rc) )
> > +            {
> > +                gdprintk(XENLOG_WARNING,
> > +                         "Error %d copying gfn %" PRI_gfn "\n",
> > +                         -rc, gfn_list[i]);
>
> Why "-rc"? (See other log messages including error codes.)
>

Because the errors are positive but for ABI we return them as negative.
But I suppose if for other messages we use the negated value this
should be just "rc".
I'll change.

> > +                copy.nr_frames -= i;
> > +                guest_handle_add_offset(copy.frame_list, i);
> > +                goto out;
> > +            }
> > +
> > +            guest_handle_add_offset(copy.buffer, PAGE_SIZE);
> > +        }
> > +
> > +        copy.nr_frames -= todo;
> > +        guest_handle_add_offset(copy.frame_list, todo);
>
> Don't you need to also update copy.buffer?
>

It's updated some lines above inside the loop.

> > @@ -2012,6 +2145,18 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >              start_extent);
> >          break;
> >
> > +    case XENMEM_foreigncopy:
> > +        /*
> > +         * Instead of using "start_extent" we update the structure back,
> > +         * we update it back in anyway to tell caller were the copy
> > +         * stopped.
> > +         */
> > +        if ( unlikely(start_extent) )
> > +            return -EINVAL;
>
> As before - please be precise with comments like this. We update it back also
> when encoding a continuation. Perhaps instead "..., to indicate the point of
> failure to the caller as well as to encode continuations without being
> constrained by MEMOP_EXTENT_SHIFT".
>

What about (trying to include your suggestion, to be fixed for line length):

        /*
         * Instead of using "start_extent" for the continuation, we
update the structure back,
         * we update the xen_foreigncopy structure back, so we are not
constrained
         * by MEMOP_EXTENT_SHIFT.
         * We copy it back also to tell the caller where the copy stopped.
         */

> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -740,7 +740,49 @@ struct xen_vnuma_topology_info {
> >  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
> >  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
> >
> > -/* Next available subop number is 29 */
> > +/*
> > + * Copy memory from/to a given domain.
> > + * As this call requires target access and guest with target access won't be
> > + * compat guests supported for compat guests this is not implemented.
>
> As before - I question this. You simply can't know. (I'm also struggling with
> wording / grammar.)
>

I was trying to code the compatibility layer. Is there a way to have
64 bit PFN even for compatibility guests instead of having to limit
and convert PFN numbers?

> > + */
> > +#define XENMEM_foreigncopy 29
> > +struct xen_foreigncopy {
> > +    /* IN - The domain whose memory is to be copied. */
> > +    domid_t domid;
> > +
> > +    /* IN - Flags. */
> > +#define XENMEM_foreigncopy_from 0
> > +#define XENMEM_foreigncopy_to 1
> > +#define XENMEM_foreigncopy_direction 1
> > +    uint16_t flags;
> > +
> > +    /*
> > +     * IN/OUT
> > +     *
> > +     * As an IN parameter number of frames of the domain to be copied.
> > +     * On output on error updated number of frames left.
> > +     */
> > +    uint32_t nr_frames;
> > +
> > +    /*
> > +     * IN/OUT
> > +     *
> > +     * Frames to be copied.
> > +     * On output on error updated to point to first frame unhandled.
>
> Is "on error" really correct / meaningful? The field can be updated at
> any intermediate point, when a continuation is scheduled. Perhaps:
>
>      * On output:
>      *  - on error updated to point to first frame which couldn't be handled,
>      *  - on success undefined.
>
> Along these lines for nr_frames then as well (if needed at all, seeing
> that it could as well be undefined in both cases, as the information is
> redundant with the frame_list update).
>
> > +     */
> > +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
> > +
> > +    /*
> > +     * IN/OUT
> > +     *
> > +     * Userspace buffer to read/write from.
>
> s/Userspace/Guest/ ?
>
> Also still no mention of when / how this field is updated.
>

What about:

/*
 * Copy memory from/to a given domain.
 */
#define XENMEM_foreigncopy 29
struct xen_foreigncopy {
    /* IN - The domain whose memory is to be copied. */
    domid_t domid;

    /* IN - Flags. */
#define XENMEM_foreigncopy_from 0
#define XENMEM_foreigncopy_to 1
#define XENMEM_foreigncopy_direction 1
    uint16_t flags;

    /*
     * IN/OUT
     *
     * As an IN parameter number of frames of the domain to be copied.
     * On output updated number of frames left (0 if success).
     */
    uint32_t nr_frames;

    /*
     * IN/OUT
     *
     * Frames to be copied.
     * On output updated to point to the first frame unhandled.
     */
    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;

    /*
     * IN/OUT
     *
     * Guest buffer to read/write from.
     * On output updated to point to the first frame unhandled.
     */
    XEN_GUEST_HANDLE(uint8) buffer;
};
typedef struct xen_foreigncopy xen_foreigncopy_t;
DEFINE_XEN_GUEST_HANDLE(xen_foreigncopy_t);

> > +     */
> > +    XEN_GUEST_HANDLE(uint8) buffer;
> > +};
>
> What was (again) left unaddressed is the question towards using GFNs on both
> sides of the copy. This would eliminate the need for the flags field, taken
> by a 2nd domid_t one then.
>

This was addressed in
https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00567.html
and in minor way by
https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00847.html.
It was considered but more complicated and worse from a performance perspective.

> Jan

Frediano

