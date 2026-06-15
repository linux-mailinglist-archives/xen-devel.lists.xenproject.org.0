Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3NOFIBnsL2pWJAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 14:12:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9127686074
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 14:12:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=g8YbbQLS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338201.1599209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ6AK-0000MJ-95; Mon, 15 Jun 2026 12:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338201.1599209; Mon, 15 Jun 2026 12:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ6AK-0000KB-5h; Mon, 15 Jun 2026 12:11:44 +0000
Received: by outflank-mailman (input) for mailman id 1338201;
 Mon, 15 Jun 2026 12:11:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZ6AJ-0000K4-G0
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 12:11:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ6AI-001mzL-BO
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:11:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2febfc-e002-0a2a0a5209dd-0a2a4507ba94-8
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 14:11:42 +0200
Received: from [74.125.224.51] (helo=mail-yx1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2febfd-229c-0a2a45070019-4a7de033b5c2-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 14:11:42 +0200
Received: by mail-yx1-f51.google.com with SMTP id
 956f58d0204a3-66062a414fcso3356307d50.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 05:11:41 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781525501; cv=none;
        d=google.com; s=arc-20240605;
        b=Me7N2hHBOadUtlS8NggcLOr3C+oQ5yrknG/6I2AqmTHFB/QXHYwn1bC0wlpLyKy+hW
         CmyJfKMIA0fowzeY9sXJ3kjOzGNNx3dF+BgEOEKwLJ1HppXElj8PZ83jVG9yR2tJKKG1
         95MTS0gZEtAFAcUkSaVmFAxe2KzbeqpwIureOyTZvjL6z8nCpmF2huKBaOmy4/t+6yfI
         roi3jnrSCsbfz4HhQ+nkohdiX0eyTU9dhrTLKntVcIVvsfccIWEbP8TYB8zxTietfkj9
         Yxk2Q9+cosWIIi3T/lMazDA7qGN1kKtbYhWt4VgoWz3IGVriZLjKk6MRbA4vaXrjrWZe
         I92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xJJ0TrZXxPaJpEr8KjLgXJgN11F7eEH2pTkQ47gPnMc=;
        fh=Q/zlzJTkmObwTVH018yy4y7EXpeeA/pAuMFrRuOAqsU=;
        b=cmqJKSvSe5VMq2UO7mwfSdpn8KiKUO0UmkX3i144eIrCDUdJa19vKB8yqVdhyHrBmr
         l/ysmHTimQrSCPLTybAsxk4P5KDxAKB9+Ux92sGnRyMN/BQhNvP39UlXci3ogIOUnQNr
         3NiBU8ovLxSZ4WSw76Rn02/RZVWNdLOZeR9RvPlE3cgqETBUQjMzhHvAtW/EzAGUwUVD
         bJd/darYOoKAWSS0VPAkWLxCGs0G407dJ1cdqDn85ns/tUpPOVyggP8y6uuvlm0+6PLw
         8lWNP2R+F2G+XHvFFuu22GSBci+m7c5qLDJ8U9WyVL750A6zkJ1gf1sJOh5BfjQrN5j7
         q+IQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525501; x=1782130301; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xJJ0TrZXxPaJpEr8KjLgXJgN11F7eEH2pTkQ47gPnMc=;
        b=g8YbbQLSBZxZ/Lu+r3+XV2aiivMgkXqAiOWD1cBgTbmpAjvZsg1DdMMgw8MwNnmAuc
         vXpbI0JZX6l7I7tUem9qP/wRsckOe7OlHS0q7EGytK60gC6t8KJEbD5IbU8SVZGZzjpE
         qM3I4L9QZjWCFMdM6+gP+NUTyv45oE0nxQjphAPjMyzO0PiVKtpMaKr6rssTO4fC99vo
         OOdMLqwS+D6S7EN7Agb3C0KxwSwzppBtGQkv2385UN2aGkCulJrNR/Hi/mYpJdvN+tgM
         E6BWjnd3Wm7JbaztkD6TKlLp6dMwtei+g8EMlueUJC7cvyqexiPKtlAPGtvXMVjA5JHq
         BjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525501; x=1782130301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJJ0TrZXxPaJpEr8KjLgXJgN11F7eEH2pTkQ47gPnMc=;
        b=aMoimqRC5HfieIB3PgRVeBJJVlAQ1ny0pOdZtsnU93r03PXgRJ2Rm1sWUd7bJKRrXE
         Q5HWnsOzzPeyZF2xQglrbeTaiJpb5Cfw+FB228bQlmtYkTsk3e8hfueK4CNK4fd7hbKR
         Fl24OGm4PMj+jAuPMJ76/z+8K3KpfE95nljv7e2eZqkpan4ZabK71nwmILWlzYIImfHy
         2eOcTk52EXzpPMl2yXhvQSTO5xvt6WuUEBBxjOcpz2R3nrydvQJprGmzK8402P71vXpQ
         r1nSin0RLtWcf5tsvHzpP3Y33dXU4NLxrXTrK/47MRnx5H+OvgWVSfrg8oAM6SU3+O7V
         AH7g==
X-Forwarded-Encrypted: i=1; AFNElJ8UTF1wFbJt+PW/JXTsA/sszFNOkq3UPOlOY8x/LGrY1xVtnboMJz+5UiymgU62ckkSYoP33Hi0jyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZr2kxqVaO/J61ZSN0QxSZZINJmUFp94WXkYcI+Kf7OphfdxA2
	+YkNeRHxbvqTGzZq+TMFuSFKmD9PYiAUQsPZVtMlF4gSJRR5dsgKhu7fvS8URiANLPi8Fhv84IM
	eT1qmPBTHCPLheiESlQKIZmKNZL2jIm4=
X-Gm-Gg: Acq92OFg49kZf+KIZl0sq/Agvm6Fwbg8fvULecUjPRocU7uk1sKarCd3WHt3WHyvqRo
	Q65nbfA1D9tJcFP8awrA09I1Sp6fNR19ExnUiewW3+sTz4wNFkQRS2XV2ueJ3MR2b+/wGhv/4ZT
	F6zXuNzZdh0CJ/zpkPwri5xd/Ap1bUemDfCtoUlvEsMp1p3jPAnpi8zf7ntGLU47ZIFN1ywlYjK
	iF5DnEwbVTEqXhP9vYkAkRrWBx3SRNWWIPMyyW5RxZo3Wa7WQPrbxUMDcTVX/PCFN3qXbOQf43N
	0ya3fbJrqFaqN57KpUd/YvE/S+pSE7vUskiK/6Y+Owfq+CbJ
X-Received: by 2002:a05:690e:d09:b0:661:75a5:3b5 with SMTP id
 956f58d0204a3-66277f19a0emr11922826d50.4.1781525500413; Mon, 15 Jun 2026
 05:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
 <20260613214749.20620-13-frediano.ziglio@cloud.com> <8289ea1d-ceca-40b6-a992-a778be053cd0@suse.com>
In-Reply-To: <8289ea1d-ceca-40b6-a992-a778be053cd0@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 15 Jun 2026 13:11:29 +0100
X-Gm-Features: AVVi8CcyBeIAZUuOOLlkUVyaaBm9VyuTLbAJHkRjG7xfFU1wFMt1gkyNWjfnIQ8
Message-ID: <CAHt6W4en1yMLrUXv+RbcoPr-=S_=pi2Rrcm2BC2PzMZT+0ksFw@mail.gmail.com>
Subject: Re: [PATCH v5 12/16] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ef75cf/1781525502-2176AC48-C600A2EF/0/0
X-purgate-type: clean
X-purgate-size: 11153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: B9127686074

On Mon, 15 Jun 2026 at 08:41, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 13.06.2026 23:47, Frediano Ziglio wrote:
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -1545,6 +1545,133 @@ static int acquire_resource(
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
> > +    if ( copy.flags & ~1U )
> > +        return -EINVAL;
> > +
> > +    direction = copy.flags & XENMEM_foreigncopy_direction;
> > +
> > +    if ( copy.nr_frames == 0 )
> > +        return 0;
> > +
> > +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
> > +    if ( rc )
> > +        return rc;
>
> Extending my v4 remark: How about a "fully foreign" copy? I.e. one between two
> pages in two foreign domains? Getting me back also to the un-answered v4
> question of mine as to MMUEXT_COPY_PAGE.
>

I really thought I replied to this but I cannot find it.
MMUEXT_COPY_PAGE was the first attempt to do this but mmuext is
designed for PV and extending was made the code confusing.

> Further, as to the order of checks: I'm not going to insist on re-ordering, yet
> I'd like to point out that copying 0 pages to/from a bad domid might better
> yield an error.
>

Not strong about this, changed to return -EINVAL. Reordering after
this change won't make much sense, -EINVAL is returned both for wrong
flags or no frames.

> > +    /*
> > +     * Check we are allowed to map and access these foreign pages.
> > +     */
> > +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> > +    if ( rc )
> > +        goto out;
>
> As per
>
> K:      xsm_.*
> K:      \b(xsm|XSM)\b
>
> in ./MAINTAINERS please Cc the XSM/Flask maintainer for such changes. I for one
> question the re-use of an existing predicate here.
>

Added for the next series.

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
> > +        for ( unsigned i = 0; i < todo; i++ )
>
> Nit: "unsigned int" please (like you have it above).
>

Changed. Note that "long" is also not a type but a modifier. Would it
be good to change both the above to "unsigned" instead for consistency
with "long" ?

> > +        {
> > +            struct page_info *foreign_page;
> > +            void *foreign;
> > +            p2m_type_t p2mt;
> > +            const unsigned long valid_mask =
> > +#ifdef CONFIG_X86
> > +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
> > +#else
> > +                p2m_to_mask(p2m_ram_rw);
> > +#endif
>
> What about, for example, p2m_ram_ro? Or p2m_ram_shared? Or p2m_grant_map_*?
> Etc. Any artificial constraining wants justifying in the description and/or
> mentioning in the public header.
>

The base of this was taken from migration code where there is such a check.
I suppose that adding p2m_ram_ro (where available) won't hurt.
p2m_ram_shared I'm not sure but seems fine too.
For p2m_grant_map_* it feels a bit a security issue to me. It would
allow a guest to give access to pages of other domains. It's true that
the current domain would have to have write access to this domain
anyway but extend these permissions sounds something it should not be
able to do.

> > +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
> > +
> > +            if ( unlikely(p2m_to_mask(p2mt) & valid_mask) && foreign_page )
>
> Was this meant to be
>
>             if ( unlikely(!(p2m_to_mask(p2mt) & valid_mask)) && foreign_page )
>
> ?
>

Yes, fixed.

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
> > +            /* A page is dirtied when it's being copied to. */
> > +            if ( direction == XENMEM_foreigncopy_to )
> > +                paging_mark_dirty(d, page_to_mfn(foreign_page));
> > +
> > +            foreign = map_domain_page(page_to_mfn(foreign_page));
>
> Latch page_to_mfn(foreign_page) into a local variable to avoid the redundant
> translation (which the compiler may not be able to fold)?
>

Sure.

> > +            if ( direction == XENMEM_foreigncopy_from )
> > +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> > +            else
> > +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
> > +            unmap_domain_page(foreign);
> > +            put_page(foreign_page);
> > +
> > +            if ( unlikely(rc) )
> > +            {
> > +                gdprintk(XENLOG_WARNING,
> > +                         "Error %d copying gfn %" PRI_gfn "\n",
> > +                         -rc, gfn_list[i]);
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
> > +
> > +        if ( copy.nr_frames && hypercall_preempt_check() )
> > +        {
> > +            rc = hypercall_create_continuation(
> > +                __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg);
> > +            goto out;
> > +        }
> > +    } while ( copy.nr_frames );
> > +
> > +    rc = 0;
> > +
> > + out:
> > +    rcu_unlock_domain(d);
> > +
> > +    /*
> > +     * Update in all cases, it allows the caller to know how many
> > +     * frames were successfully copied and the continuation to
> > +     * continue correctly.
> > +     */
> > +    if ( __copy_to_guest(arg, &copy, 1) )
> > +        rc = -EFAULT;
>
> It's not quite clear whether replacing an earlier non-zero value held in
> rc is a good thing here. The only time when it's strictly necessary is
> when you schedule a continuation. I'd suggest to add "&& rc >= 0".
>

Added. Looking at the possible client usage it could think that the
error happened copying the first page but otherwise the copy should
not fail as the opposite direction was fine.

> > @@ -2012,6 +2139,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >              start_extent);
> >          break;
> >
> > +    case XENMEM_foreigncopy:
> > +        if ( unlikely(start_extent) )
> > +            return -EINVAL;
>
> Please address review comments (verbally or by code changes) before submitting
> a new version. Here I had asked "Why make this different from other continuable
> sub-ops?"
>

There's already a comment in the same file for similar reason

    /*
     * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't ideal.  If
     * it ever becomes a practical problem, we can switch to mutating
     * xmar.{frame,nr_frames,frame_list} in guest memory.
     */

so to avoid the doubt and possible future change I mutate the structure.
Also I use the mutation to give more information to the caller, using
"start_entent" won't allow this.

> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -740,7 +740,45 @@ struct xen_vnuma_topology_info {
> >  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
> >  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
> >
> > -/* Next available subop number is 29 */
> > +/*
> > + * Copy memory from/to a given domain.
> > + */
> > +#define XENMEM_foreigncopy 29
> > +struct xen_foreigncopy {
> > +    /* IN - The domain whose resource is to be copied. */
>
> There's still "resource" here, when this really is about RAM (memory) only,
> not any other kind of resource.
>
> > +    domid_t domid;
> > +
> > +    /* IN - Flags. */
> > +#define XENMEM_foreigncopy_from 0
> > +#define XENMEM_foreigncopy_to 1
> > +#define XENMEM_foreigncopy_direction 1
> > +    uint16_t flags;
> > +
> > +    /*
> > +     * IN
> > +     *
> > +     * As an IN parameter number of frames of the domain to be copied.
> > +     */
> > +    uint32_t nr_frames;
>
> This isn't just an input, as you update the field (and the handles below).
> This property of fields wants reflecting here, so callers know that they (a)
> can't re-use the struct on a subsequent call without re-initializing the
> fields which may have changed, and (b) can't put the struct in r/o memory.
>

Update comments:

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
     * On output on error updated number of frames left.
     */
    uint32_t nr_frames;

    /*
     * IN/OUT
     *
     * Frames to be copied.
     * On output on error updated to point to first frame unhandled.
     */
    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;

    /*
     * IN/OUT
     *
     * Userspace buffer to read/write from.
     */
    XEN_GUEST_HANDLE(uint8) buffer;
};
typedef struct xen_foreigncopy xen_foreigncopy_t;
DEFINE_XEN_GUEST_HANDLE(xen_foreigncopy_t);

> > +    /*
> > +     * IN
> > +     *
> > +     * Frames to be copied.
> > +     */
> > +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
> > +
> > +    /*
> > +     * IN/OUT
> > +     *
> > +     * Userspace buffer to read/write from.
> > +     */
> > +    XEN_GUEST_HANDLE(uint8) buffer;
>
> With these two handles, there continues to be a need to (explicitly) deal
> with the compat case as well.
>

I don't agree with this. Domains having access to other domains are
limited (like stub domains for Qemu) and won't be 32 bits today so why
allow 32 bits guests if not ever used?

> Jan

Frediano

