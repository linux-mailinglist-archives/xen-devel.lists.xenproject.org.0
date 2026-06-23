Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RqtOBFf4OmrGNQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 23:19:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498C6BA3AE
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 23:19:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=noT+fdrD;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344508.1603550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc8WA-0002Yj-LZ; Tue, 23 Jun 2026 21:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344508.1603550; Tue, 23 Jun 2026 21:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wc8WA-0002Vz-Iu; Tue, 23 Jun 2026 21:18:50 +0000
Received: by outflank-mailman (input) for mailman id 1344508;
 Tue, 23 Jun 2026 21:18:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wc8W8-0002Vt-UQ
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 21:18:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wc8W7-00D7nY-KK
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 23:18:47 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3af7c8-2eae-0a2a0a5409dd-0a2a45059160-40
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 23:18:47 +0200
Received: from [74.125.224.43] (helo=mail-yx1-f43.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a3af836-ef3d-0a2a45050019-4a7de02bd9b1-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 23:18:47 +0200
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-662bf1dab83so346923d50.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 14:18:47 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782249526; cv=none;
        d=google.com; s=arc-20240605;
        b=G0efw4ipINLZ4bpQU8f9GSzvmSHjX8zGo3X0D+CvAW2Pjr2cBXSXxwnR27oGBacqV7
         rk/Fbu/sv4PuNPtb9s3RRKQIdhmhZjCBiKoLzvgpSq+gJu90UXxjRVe4lyTwhBm2E0Yf
         XwP8Mmv1z7dK8slQ4JLA3VBzKIuMsb+KAvPvsPNG4BT3Gs7SZjvJi8k2nit4MJrZXkk5
         UpOmQhbMbDuQUCoh6qya5pgSGX+svy4JBZr5llRj9GriHwn1140Ip7LqELPvQjNZqMhz
         7jbuug19m98eLWKQdJDZ8qgxmBH7n2K0tVgIb/P5TCyTc1VWr8zPVtTEVU0vZCPvVRoE
         pVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cnc2fuoXsJcrWpZAtUBKnM72S4LMmkdFSFVFY0TpXoA=;
        fh=6TZj3pGG48U2F8n7KqE0Z4H7JONILxc7zEHghnyScxc=;
        b=kQKKtxsNGaoy/nIDlSrhenL/t5+kEVhJxZfoaGYgAE+Wz8+1HBr9SzoKtfyU4DqiDE
         WvVTBAWzGjVhI3lIe409rfti+ZtMbrn+//25jh9udJhjzYPtjsPxbRM6P6HV0dg/OLR1
         u6IBTVCALqjk5yEmH6prg04q1Kl+6nTr+mJPVWl0lW/C8eHBdkwJJHbhtZLT5dy3sgLm
         3QLJFETWjbZ6BLUDb+dHTHE4Dosp6OBme6OV3jh9E1ip/u7/KH0fwrBbFX1p/5tzmHVP
         8nQM55EilX4OMynZw8M2GVmJU9yR2PHpVbEAbHhiFgYn5fMXLIFHCvhE31X6JXeZfyuD
         yHFw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782249526; x=1782854326; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cnc2fuoXsJcrWpZAtUBKnM72S4LMmkdFSFVFY0TpXoA=;
        b=noT+fdrDu30WSGdFMt6SejcCcRME6ElRz9o1INTC01n9edn0WQf3PW9WjY9n7KO+eE
         +Hdf+3EHWP5JPv2yW/akE2hDZGq2ZdPa1VYZgD5NKbBe9NKmSuXSnozUMRr41ZeeK207
         Z3i8ZN1w8fbBCrN4fa4z7+KcFpSOztcVJPXwcGmfcloYEaeLyh8UVGlyyn6Co3wmH/EX
         UXgoBT4D9cipPZexRCf9jtcnXn0sXNYTJLRD6oD1DLTbQzUMQNjVmv1v5/STK7pyZcVU
         kCtCMZq4SrNafjDozAsKZsHBeHAgaK3ITq6Edq7d0p2jnYCAGNVqTBD4jDM+RNm+MTWu
         j9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782249526; x=1782854326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cnc2fuoXsJcrWpZAtUBKnM72S4LMmkdFSFVFY0TpXoA=;
        b=TywuTOU5UosfwT7XGpm4FDHLaWxH7cuNbAvx47ak+3bxzC+hKNIqmCSxWYd5UrQ5+3
         3haLlNLylKejN60BHvNz/k19EbcoGdO2/DYpdqvD/nco2JZYQ0Q8/P6w1NbQq6Sw/Q80
         jz7kNt37DrM6DTQAmpIauoSIbKZZrgJ2ZP+2ORt3KcR+imeyiNg88QGvcsUxsNce1oSY
         MICCVf+xAXSSvzw6m5depRyz430Q+SXPuyOutLAb9Hukp/C/V3LVi8kgA0ENAxNKEx0y
         J/7S3xk5gYBehEIoHl1YUI26MRioDT7CxEh9TFr9Ixyz6RY818jQYiGKnuIfKh0lq8T7
         S+qQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyhJurq3CTmHfh5evQob+uRKY+BHkVzxoq8rJ3yhwmSmnuj5Y9+mkFKVAk/II+a7XHj4D0zzTVPiA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzM+qfZAjI9kgo2B9Qq9gyGCTxXxuOVj3ROum+XFycQD9mQBDKy
	OzN++3mXwIUrkTIj9cKpUxsAT/a2OPgiw2y3J9MzdUfQLVi3WSHADh34HxMLvCrvqtpanaifIax
	DBf1fdtamI1deRMgp1OTdQs5adfhDYgo=
X-Gm-Gg: AfdE7cmjx8ljUYAAfU65bfMggwN0CA2m6R3I3rkWuJAG9heZEUiwLViZ2eUrEPPYY69
	dzutRlwx58DAhwBrOpG3igAgPqD+nu2ZJ5TTigthU6VUY+FkficI8WUpxw5NBw0SQlO7cz0alAF
	V+b9I6SvZaivAx/dZNtYm3NYCdzX0Qdi36zAQfQJUgVd4ySGNmy5D6ql2vinhC+ULUQbEAu4hyw
	59x1YF8qetHAsxJs47W3EWOZkklfOPpPjpD7gdoz7GBhPDmsAGL3+SojMCIJSZ5tgEtcM0E7osE
	5misjpRzWEbhWcDM0CCBfns=
X-Received: by 2002:a05:690e:1287:b0:660:6199:2278 with SMTP id
 956f58d0204a3-6636e07b12cmr679601d50.0.1782249525659; Tue, 23 Jun 2026
 14:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-13-frediano.ziglio@citrix.com> <c5f00fa4-4d9e-4227-87a0-6e657fd523e9@suse.com>
 <CAHt6W4c0FDaMZK-4-7CReG_PdV+L=HNxVGNjV5vUjDkKq3EMBA@mail.gmail.com> <2889dc4e-33ec-4d8f-b01d-026506a39cbf@suse.com>
In-Reply-To: <2889dc4e-33ec-4d8f-b01d-026506a39cbf@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 23 Jun 2026 22:18:34 +0100
X-Gm-Features: AVVi8CdjT3MzD9ak5-49_5QuoAyo9bxgKfsnwOPCc8UoOYKpNnCo5p8zx9UE-ak
Message-ID: <CAHt6W4cghz1Rh=MXqmx6ZHA0iOz9xTBDNhFWaqtZ=npd4Hb=GQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/16] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1782249527-9DFC2127-C6C8509A/0/0
X-purgate-type: clean
X-purgate-size: 16718
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,xenproject.org:url,xen.org:url];
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
X-Rspamd-Queue-Id: 5498C6BA3AE

On Tue, 23 Jun 2026 at 14:21, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.06.2026 12:55, Frediano Ziglio wrote:
> > On Mon, 22 Jun 2026 at 11:34, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 19.06.2026 15:04, Frediano Ziglio wrote:
> >>> --- a/xen/common/memory.c
> >>> +++ b/xen/common/memory.c
> >>> @@ -1545,6 +1545,139 @@ static int acquire_resource(
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
> >>> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
> >>> +        return -EINVAL;
> >>> +
> >>> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> >>> +
> >>> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
> >>
> >> Iirc I did ask before why this isn't ..._by_any_id().
> >
> > I probably was confused by the question about MMUEXT and the 2 domains.
> > There are different similar hypercalls (like the mentioned MMUEXT but
> > also hypercalls to map foreign domain memory) that have this check
> > (not the same domain). Any domain has, obviously, access to its own
> > memory, so it should not have to use hypercall to access its own
> > memory. If it does it looks like a mistake causing performance issues
> > or an attempt to circumvent security; in either case you would like to
> > avoid it.
>
> No. Self-grants are possible as well, for example, and for a good reason.
> Allowing normally-remote operations on oneself helps with testing, for
> example. It may also help avoid needing to special-case "self" in code
> which needs to cover both cases.
>

But this is not a grant, it's a copy.

> >>> +    if ( rc )
> >>> +        return rc;
> >>> +
> >>> +    if ( copy.nr_frames == 0 )
> >>> +    {
> >>> +        rcu_unlock_domain(d);
> >>> +        return 0;
> >>> +    }
> >>
> >> Any reason this cannot also be "goto out"? The more that now that you have
> >> moved this past the domid validity check, imo it should further move to ...
> >
> > The only reason was style and to avoid a memory copy, but it's not a
> > hot case so I'll change to "goto out" (no strong about it).
> >
> >>> +    /*
> >>> +     * Check we are allowed to map and access these foreign pages.
> >>> +     */
> >>> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> >>> +    if ( rc )
> >>> +        goto out;
> >>
> >> ... below here. Perhaps simply as
> >>
> >>     if ( rc || !copy.nr_frames )
> >>         goto out;
> >>
> >
> > I think this would be confusing with the above "Check we are allowed
> > to map and access these foreign pages" comment.
> > Are you okay with just the change above to "goto out" ?
>
> I do want the order adjusted as indicated. I won't insist on (but I would
> prefer) folding both if()-s.
>

What about

    /*
     * Check we are allowed to map and access these foreign pages.
     */
    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
    if ( rc )
        goto out;

    while ( copy.nr_frames )
    {
        /*
         * Arbitrary size.  Not too much stack space, and a reasonable stride
         * for continuation checks.
         */


> > Also moving here would potentially change the result and do a useless check.
>
> Affecting the result is the goal of the re-ordering.
>

Changed.

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
> >>> +        for ( unsigned int i = 0; i < todo; i++ )
> >>> +        {
> >>> +            struct page_info *foreign_page;
> >>> +            mfn_t foreign_mfn;
> >>> +            void *foreign;
> >>> +            p2m_type_t p2mt;
> >>> +            const unsigned long valid_mask =
> >>> +#ifdef CONFIG_X86
> >>> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
> >>> +#else
> >>> +                p2m_to_mask(p2m_ram_rw);
> >>> +#endif
> >>
> >> The set of permitted types didn't change, yet a justification for the resulting
> >> limitation also didn't appear.
> >>
> >
> > Yes, that's missing, indeed.
> > Should the set of types be different for reading and writing? For
> > instance do not allow writing to read-only memory?
>
> Of course.
>
> > Given that it looks like different architectures have different
> > meanings and definitions for these constants, should it not be better
> > to define some new constants for this specific usage? For instance
> > P2M_READ_TYPES and P2M_WRITE_TYPES?
>
> Perhaps, yes. The suggested names look overly generic to me, though.
>

I suppose P2M_READABLE_TYPES and P2M_WRITABLE_TYPES are more correct
but still too generic.
P2M_EXPORTABLE_TYPES and P2M_IMPORTABLE_TYPES ?

> >>> +            foreign_page = get_page_from_gfn(d, gfn_list[i], &p2mt, P2M_ALLOC);
> >>> +
> >>> +            if ( unlikely(!(p2m_to_mask(p2mt) & valid_mask)) && foreign_page )
> >>> +            {
> >>> +                put_page(foreign_page);
> >>> +                foreign_page = NULL;
> >>> +            }
> >>> +            if ( unlikely(!foreign_page) )
> >>> +            {
> >>> +                gdprintk(XENLOG_WARNING,
> >>> +                         "Error accessing foreign gfn %" PRI_gfn "\n",
> >>> +                         gfn_list[i]);
> >>> +                rc = -EINVAL;
> >>> +                copy.nr_frames -= i;
> >>> +                guest_handle_add_offset(copy.frame_list, i);
> >>> +                goto out;
> >>> +            }
> >>> +
> >>> +            foreign_mfn = page_to_mfn(foreign_page);
> >>> +
> >>> +            /* A page is dirtied when it's being copied to. */
> >>> +            if ( direction == XENMEM_foreigncopy_to )
> >>> +                paging_mark_dirty(d, foreign_mfn);
> >>> +
> >>> +            foreign = map_domain_page(foreign_mfn);
> >>> +            if ( direction == XENMEM_foreigncopy_from )
> >>> +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> >>> +            else
> >>> +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
> >>
> >> You cannot validly write to the page without holding a PGT_writable ref.
> >> Else you might overwrite a page table or a descriptor table in a PV guest.
> >>
> >
> > Given that this code was "inspired" by other hypercalls I'll also
> > check the other code.
> >
> >> Once again - can you please make sure you have addressed earlier review
> >> comments, before sending a new version? I did point this out before.
> >
> > Apparently not.
>
> https://lists.xen.org/archives/html/xen-devel/2026-06/msg00850.html
>

The "apparently not" is the reply to "can you please make sure you
have addressed earlier review comments, before sending a new version".

> >>> +                copy.nr_frames -= i;
> >>> +                guest_handle_add_offset(copy.frame_list, i);
> >>> +                goto out;
> >>> +            }
> >>> +
> >>> +            guest_handle_add_offset(copy.buffer, PAGE_SIZE);
> >>> +        }
> >>> +
> >>> +        copy.nr_frames -= todo;
> >>> +        guest_handle_add_offset(copy.frame_list, todo);
> >>
> >> Don't you need to also update copy.buffer?
> >
> > It's updated some lines above inside the loop.
>
> Oh, sorry. Yet then - not doing all updates together is, as you can see,
> potentially confusing.
>
> >>> @@ -2012,6 +2145,18 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>              start_extent);
> >>>          break;
> >>>
> >>> +    case XENMEM_foreigncopy:
> >>> +        /*
> >>> +         * Instead of using "start_extent" we update the structure back,
> >>> +         * we update it back in anyway to tell caller were the copy
> >>> +         * stopped.
> >>> +         */
> >>> +        if ( unlikely(start_extent) )
> >>> +            return -EINVAL;
> >>
> >> As before - please be precise with comments like this. We update it back also
> >> when encoding a continuation. Perhaps instead "..., to indicate the point of
> >> failure to the caller as well as to encode continuations without being
> >> constrained by MEMOP_EXTENT_SHIFT".
> >>
> >
> > What about (trying to include your suggestion, to be fixed for line length):
> >
> >         /*
> >          * Instead of using "start_extent" for the continuation, we
> > update the structure back,
> >          * we update the xen_foreigncopy structure back, so we are not
> > constrained
> >          * by MEMOP_EXTENT_SHIFT.
> >          * We copy it back also to tell the caller where the copy stopped.
> >          */
>
> One of the things I take issue with (because it's hard to read that way,
> at least for me) is the repeated use of "update ... back", effectively
> saying the same things twice. The last sentence also wants disambiguating
> towards the "stopped" possibly being a non-error situation as well.
>

Changed to

        /*
         * Instead of using "start_extent" for the continuation, we update
         * the xen_foreigncopy structure back, so we are not constrained by
         * MEMOP_EXTENT_SHIFT.
         * We copy it back also to tell the caller where the copy stopped
         * (either for error or because all frames were copied).
         */

> >>> --- a/xen/include/public/memory.h
> >>> +++ b/xen/include/public/memory.h
> >>> @@ -740,7 +740,49 @@ struct xen_vnuma_topology_info {
> >>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
> >>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
> >>>
> >>> -/* Next available subop number is 29 */
> >>> +/*
> >>> + * Copy memory from/to a given domain.
> >>> + * As this call requires target access and guest with target access won't be
> >>> + * compat guests supported for compat guests this is not implemented.
> >>
> >> As before - I question this. You simply can't know. (I'm also struggling with
> >> wording / grammar.)
> >
> > I was trying to code the compatibility layer. Is there a way to have
> > 64 bit PFN even for compatibility guests instead of having to limit
> > and convert PFN numbers?
>
> compat_pfn_t is a typedef of unsigned int (since a 32-bit guest seeing
> "typedef unsigned long xen_pfn_t;" results in xen_pfn_t being a 32-bit
> quantity for it), so 32-bit guests can only supply 32-bit frame numbers.
> There's also no value in trying to be clever and using uint64_t instead
> for the frame_list handle, as 32-bit guests won't ever own pages with
> MFNs wider than 32 bits.
>

They don't need to own such pages. But probably they would also need
other hypercalls to support larger frame numbers. To be honest you
just point out a reason to not support this for compatible guests.

> >>> + */
> >>> +#define XENMEM_foreigncopy 29
> >>> +struct xen_foreigncopy {
> >>> +    /* IN - The domain whose memory is to be copied. */
> >>> +    domid_t domid;
> >>> +
> >>> +    /* IN - Flags. */
> >>> +#define XENMEM_foreigncopy_from 0
> >>> +#define XENMEM_foreigncopy_to 1
> >>> +#define XENMEM_foreigncopy_direction 1
> >>> +    uint16_t flags;
> >>> +
> >>> +    /*
> >>> +     * IN/OUT
> >>> +     *
> >>> +     * As an IN parameter number of frames of the domain to be copied.
> >>> +     * On output on error updated number of frames left.
> >>> +     */
> >>> +    uint32_t nr_frames;
> >>> +
> >>> +    /*
> >>> +     * IN/OUT
> >>> +     *
> >>> +     * Frames to be copied.
> >>> +     * On output on error updated to point to first frame unhandled.
> >>
> >> Is "on error" really correct / meaningful? The field can be updated at
> >> any intermediate point, when a continuation is scheduled. Perhaps:
> >>
> >>      * On output:
> >>      *  - on error updated to point to first frame which couldn't be handled,
> >>      *  - on success undefined.
> >>
> >> Along these lines for nr_frames then as well (if needed at all, seeing
> >> that it could as well be undefined in both cases, as the information is
> >> redundant with the frame_list update).
> >>
> >>> +     */
> >>> +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
> >>> +
> >>> +    /*
> >>> +     * IN/OUT
> >>> +     *
> >>> +     * Userspace buffer to read/write from.
> >>
> >> s/Userspace/Guest/ ?
> >>
> >> Also still no mention of when / how this field is updated.
> >>
> >
> > What about:
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
> >      * On output updated number of frames left (0 if success).
> >      */
> >     uint32_t nr_frames;
> >
> >     /*
> >      * IN/OUT
> >      *
> >      * Frames to be copied.
> >      * On output updated to point to the first frame unhandled.
>
> There may be no such frame, so at the very least add "..., if any"?
>

Added.

> >      */
> >     XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
> >
> >     /*
> >      * IN/OUT
> >      *
> >      * Guest buffer to read/write from.
> >      * On output updated to point to the first frame unhandled.
>
> There's no frame here, as long as you don't switch to using two frame
> lists (for source and destination).
>

Changed to

    /*
     * IN/OUT
     *
     * Guest buffer to read/write from.
     * On output updated to point to the first page pointer unhandled.
     */

> >      */
> >     XEN_GUEST_HANDLE(uint8) buffer;
> > };
> > typedef struct xen_foreigncopy xen_foreigncopy_t;
> > DEFINE_XEN_GUEST_HANDLE(xen_foreigncopy_t);
> >
> >>> +     */
> >>> +    XEN_GUEST_HANDLE(uint8) buffer;
> >>> +};
> >>
> >> What was (again) left unaddressed is the question towards using GFNs on both
> >> sides of the copy. This would eliminate the need for the flags field, taken
> >> by a 2nd domid_t one then.
> >>
> >
> > This was addressed in
> > https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00567.html
>
> Well, yes, but not in a satisfactory way. Back channels tell me that you
> actually got the same feedback already on internal review. Which makes it
> all the more puzzling that you insist on doing it differently. Multiple
> maintainers asking for the same thing may be an indication of something.
>

Not needing to have backchannel feedback, I already wrote that a
similar approach was tried and made the code more complicated.
Both maintainers didn't comment on my replies so I assume they were
fine with it.
And you are failing to provide positive feedback.
I asked (that one internally) for examples of guest buffers provided
as frame numbers but I got no answer (or better the answer was more
"currently there are not").
Also note that the location of xen_foreigncopy_t structure is also
provided using a guest pointer.
I remember there were some discussions about ABI changes (2/3 years
ago) to address this and other issues but I cannot see much progress.
That's why I say this is out of scope.

> > and in minor way by
> > https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00847.html.
> > It was considered but more complicated and worse from a performance perspective.
>
> Okay, performance-wise worse would of course be relevant. But that would
> need supporting by numbers (for both PV and PVH Dom0, as the latter
> incurs extra overhead for virtual-address-based hypercall buffer operands).
>

I'm more concerned about the PV case than PVH to be honest.

I was having an idea about solving the pointer/frames issue but, as I
said, it's out of scope here.

> Jan

Frediano

