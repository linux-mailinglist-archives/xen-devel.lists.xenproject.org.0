Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xVrwCouJPmqaHgkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 16:15:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F106CDD25
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 16:15:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Jzyd+v5f;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1346212.1604694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd7K6-0003mS-Sx; Fri, 26 Jun 2026 14:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346212.1604694; Fri, 26 Jun 2026 14:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd7K6-0003kZ-QK; Fri, 26 Jun 2026 14:14:26 +0000
Received: by outflank-mailman (input) for mailman id 1346212;
 Fri, 26 Jun 2026 14:14:26 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wd7K5-0003kT-Qe
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 14:14:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd7K5-007N2t-7Q
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 16:14:25 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e892b-bab6-0a2a0a5309dd-0a2a450be90c-28
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 16:14:25 +0200
Received: from [74.125.224.44] (helo=mail-yx1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e8940-ac48-0a2a450b0019-4a7de02ccc69-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 16:14:25 +0200
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-66493875766so1285470d50.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 07:14:24 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782483263; cv=none;
        d=google.com; s=arc-20260327;
        b=cMhzJk1Jr6q+LK9fVPcM2xEy3sZfd6vkPglwNaVZx04hic3Qc1wmosMvzK1otGywoL
         GiD12nf7Nf6zKPNjX7FaE0vbVGbGMQhkutG1q4RGrlLjQl6ix/W89WVrqmVX6o9k8a0y
         V1nogOSB3OraXIkjmUsgFHfT8HNdaov2ryqiC8tBc0a8encZkpM6HI6hVbQpj7l6IRql
         aankjjOYpjgPfFnC3gAPlNnfcox6sAje9lPVwveZMlSEYAffCCf5S63WkJi9nZFlGh+d
         zuqMR5wqD4tdGidNhzOwmEKRAp1f8i4HJIqMn1Jbeo0wlTIdqTENM520nh8kgSismuQr
         PzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oM/zylGJKaVcnbd5CR3L2Xo39J/1wOlY7y+FkLODX6Y=;
        fh=r/bSQHOXqKreMRuH+rT/9CKiQXFwCXJK2kdrgt7oTag=;
        b=Q5FWjDSkYR9hWAzpXrEblT55ZTulZLWgoO7z7mR5kGdjvATBZuo9pHiVlquG6lxYPX
         4c32wd61M9wAB0ZgD1SU7KszPeXW1Aeg3kMMz3tYrZqDNpwoCM3MOM4QSzunmT9CPtyH
         U+l1tR3JDl5fXNX+DnT5RSLEAHbLG1qPy+DzcQ0JuzkGyNAtGB+3sII+atv/0dVkHfBC
         ge88VE5+vAisgL8oJW4k1nKG6WKkMIbwBfe9oUclLaSFB7bHp39R23gA7a3BHgJswhUN
         b/EmYdne7HeSX8WN6EEnfEYNmLG0MP6W5S2k9ATFDmA29kgLbLa8j3vBWOCvWazxgz9v
         5C0A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782483263; x=1783088063; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oM/zylGJKaVcnbd5CR3L2Xo39J/1wOlY7y+FkLODX6Y=;
        b=Jzyd+v5fyIZG2Czmv3/2v1SoyB66TS7SHEDJsBxvoGB/xDrWFkN9ftfiL1nAKCBvAX
         42IbEjvejjtuXl03SF3xbxjvAuk1+TSZBZY/aSbJrlNvgGkhA7Rcmggh5fUgWnGGriCY
         bAYc3KAfkqiMYVOJpwoBV89u44tnFa3eXZS07Mmk0pIziYhtld45uaNiIWKqkmIkitY6
         DRmdpqj7OuwjeaHo/LY0oxFPAbFPRUE7El+RB8h+GPA0U7eY30YzkRdsAZNxngn8MVlf
         MlKippJ15YXxEBuh4YCPccXq4csBxxCgR9BLejY48X+rI9wK9oCvDon11Wyo3aSpI1oa
         TB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782483263; x=1783088063;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM/zylGJKaVcnbd5CR3L2Xo39J/1wOlY7y+FkLODX6Y=;
        b=DfGDBcgBQvDsVQzSeO3IFgqSRr/J711nuY4A7P+gWU6WGHLH2UKwSCiLNixtJ5JUWu
         OyMj/v+yDQOdWdVYC5bK7kX83ZT2+ek5Lfu+oAKjpD6l45d/KulSJyB/geEQdGLKObru
         kuj+dZTqz4AHR8KooD26T5Ulef1wowjATbTu5qCwXZp86TF18AUyn0fekmUqEpGi3kyH
         lB5PBeC0LMbMmqIc0Q+XVjLkUusfJmVZonDdyMGZzqD+0iZetM0JKudq6Db4Q/Gv5fvt
         7vAl9b7cXECbSoL3lU/03cjxoUpozd/AyW5UlGNJkxZMkzpRa6bJl24gPy1klu0nWG5l
         s9+g==
X-Forwarded-Encrypted: i=1; AHgh+RpyHkUDh6L86K6DtoxTSBph/GPacfnkmXfLVB4Aad3yMoyFNnYb076vFAyzTDsixpt4avpFYl12n30=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzepsAvhAyxrJAJOcNMIbZQ4XbbL8vwYVtZrmzm2jqJHLbNbTTL
	bwuSOz8euXvqSfs3VH9H90h52RK0nGHk/+CrTeUgepGoah65P4Kgq7OjLXZY5AAl03GqDBAdAVb
	cCGWOHbKjmjIhUpwe0Z3IENtwIXEe5ss=
X-Gm-Gg: AfdE7cn1Clk6rCwd5AaW+NFUg1+z792KnYpFTKCSCuNX9Zq6aFVt1Na1+QOTAnJTYHo
	Uv0Tsn6/aYCGzoeWGX56cIDqYyD2nCbCGtS2PdgYj6vGKvvoHs3WccK3GE5ztP3x8XJZIDZjOed
	uTJx4uqb/lRv7YAf0zKOD+3jztLf5g6IdFRwAiCuT8JRtkObWHthpYNEHlnpZ9336BqhnwYaEkO
	ES3wOxD8sMp0xvLn04HITEpha8WUcNgYTWo6s//2t8c+n+ulIw8SN5RgJD5lvo+aX++FWHw88e2
	1coK5/980tE9a1UG/8X0ybU=
X-Received: by 2002:a05:690e:1308:b0:660:9691:73cf with SMTP id
 956f58d0204a3-6648835b22bmr5812327d50.32.1782483263317; Fri, 26 Jun 2026
 07:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-13-frediano.ziglio@citrix.com> <c5f00fa4-4d9e-4227-87a0-6e657fd523e9@suse.com>
 <CAHt6W4c0FDaMZK-4-7CReG_PdV+L=HNxVGNjV5vUjDkKq3EMBA@mail.gmail.com>
 <2889dc4e-33ec-4d8f-b01d-026506a39cbf@suse.com> <CAHt6W4cghz1Rh=MXqmx6ZHA0iOz9xTBDNhFWaqtZ=npd4Hb=GQ@mail.gmail.com>
 <07b3bbb6-ef62-419c-b708-1b9ae2774462@suse.com>
In-Reply-To: <07b3bbb6-ef62-419c-b708-1b9ae2774462@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Fri, 26 Jun 2026 15:14:12 +0100
X-Gm-Features: AVVi8Cdp2M9mJ4m3S00bf1wG6u2Bhs0ff5gzZUPKqtB27ih4hCa0MbXXa_YFrvs
Message-ID: <CAHt6W4ckkQOKn9jvNpMG5meFeagY8uFZJsC6CEUsu9tfc17cHQ@mail.gmail.com>
Subject: Re: [PATCH v6 12/16] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1782483265-38D2F220-153F9906/0/0
X-purgate-type: clean
X-purgate-size: 14453
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.18 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[xen-devel-bounces@lists.xenproject.org:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31F106CDD25

On Wed, 24 Jun 2026 at 07:44, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 23.06.2026 23:18, Frediano Ziglio wrote:
> > On Tue, 23 Jun 2026 at 14:21, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 23.06.2026 12:55, Frediano Ziglio wrote:
> >>> On Mon, 22 Jun 2026 at 11:34, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 19.06.2026 15:04, Frediano Ziglio wrote:
> >>>>> --- a/xen/common/memory.c
> >>>>> +++ b/xen/common/memory.c
> >>>>> @@ -1545,6 +1545,139 @@ static int acquire_resource(
> >>>>>      return rc;
> >>>>>  }
> >>>>>
> >>>>> +/*
> >>>>> + * The "noinline" qualifier avoids the compiler to create a large function
> >>>>> + * consuming quite a lot of stack.
> >>>>> + */
> >>>>> +static int noinline mem_foreigncopy(
> >>>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> >>>>> +{
> >>>>> +    struct domain *d, *const currd = current->domain;
> >>>>> +    xen_foreigncopy_t copy;
> >>>>> +    int rc, direction;
> >>>>> +
> >>>>> +    if ( copy_from_guest(&copy, arg, 1) )
> >>>>> +        return -EFAULT;
> >>>>> +
> >>>>> +    if ( copy.flags & ~XENMEM_foreigncopy_direction )
> >>>>> +        return -EINVAL;
> >>>>> +
> >>>>> +    direction = copy.flags & XENMEM_foreigncopy_direction;
> >>>>> +
> >>>>> +    rc = rcu_lock_remote_domain_by_id(copy.domid, &d);
> >>>>
> >>>> Iirc I did ask before why this isn't ..._by_any_id().
> >>>
> >>> I probably was confused by the question about MMUEXT and the 2 domains.
> >>> There are different similar hypercalls (like the mentioned MMUEXT but
> >>> also hypercalls to map foreign domain memory) that have this check
> >>> (not the same domain). Any domain has, obviously, access to its own
> >>> memory, so it should not have to use hypercall to access its own
> >>> memory. If it does it looks like a mistake causing performance issues
> >>> or an attempt to circumvent security; in either case you would like to
> >>> avoid it.
> >>
> >> No. Self-grants are possible as well, for example, and for a good reason.
> >> Allowing normally-remote operations on oneself helps with testing, for
> >> example. It may also help avoid needing to special-case "self" in code
> >> which needs to cover both cases.
> >
> > But this is not a grant, it's a copy.
>
> Sure, but the underlying principle is what matters. Plus you don't prevent
> self-copy by using ..._by_id(), you only preclude the use of DOMID_SELF.
>

Sure about this? The current implementation is

int rcu_lock_remote_domain_by_id(domid_t dom, struct domain **d)
{
    if ( (*d = rcu_lock_domain_by_id(dom)) == NULL )
        return -ESRCH;

    if ( *d == current->domain )
    {
        rcu_unlock_domain(*d);
        return -EPERM;
    }

    return 0;
}

rcu_lock_domain_by_id returns NULL if the domain is DOMID_SELF so it
would be a -ESRCH, if it's the current domain it would be excluded by
*d == current->domain returning -EPERM.

> >>>>> +    if ( rc )
> >>>>> +        return rc;
> >>>>> +
> >>>>> +    if ( copy.nr_frames == 0 )
> >>>>> +    {
> >>>>> +        rcu_unlock_domain(d);
> >>>>> +        return 0;
> >>>>> +    }
> >>>>
> >>>> Any reason this cannot also be "goto out"? The more that now that you have
> >>>> moved this past the domid validity check, imo it should further move to ...
> >>>
> >>> The only reason was style and to avoid a memory copy, but it's not a
> >>> hot case so I'll change to "goto out" (no strong about it).
> >>>
> >>>>> +    /*
> >>>>> +     * Check we are allowed to map and access these foreign pages.
> >>>>> +     */
> >>>>> +    rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> >>>>> +    if ( rc )
> >>>>> +        goto out;
> >>>>
> >>>> ... below here. Perhaps simply as
> >>>>
> >>>>     if ( rc || !copy.nr_frames )
> >>>>         goto out;
> >>>>
> >>>
> >>> I think this would be confusing with the above "Check we are allowed
> >>> to map and access these foreign pages" comment.
> >>> Are you okay with just the change above to "goto out" ?
> >>
> >> I do want the order adjusted as indicated. I won't insist on (but I would
> >> prefer) folding both if()-s.
> >>
> >
> > What about
> >
> >     /*
> >      * Check we are allowed to map and access these foreign pages.
> >      */
> >     rc = xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> >     if ( rc )
> >         goto out;
> >
> >     while ( copy.nr_frames )
> >     {
> >         /*
> >          * Arbitrary size.  Not too much stack space, and a reasonable stride
> >          * for continuation checks.
> >          */
>
> That's fine.
>

Changed

> >>>>> +    do {
> >>>>> +        /*
> >>>>> +         * Arbitrary size.  Not too much stack space, and a reasonable stride
> >>>>> +         * for continuation checks.
> >>>>> +         */
> >>>>> +        xen_pfn_t gfn_list[32];
> >>>>> +        unsigned int todo = MIN(ARRAY_SIZE(gfn_list), copy.nr_frames);
> >>>>> +
> >>>>> +        rc = -EFAULT;
> >>>>> +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
> >>>>> +            goto out;
> >>>>> +
> >>>>> +        for ( unsigned int i = 0; i < todo; i++ )
> >>>>> +        {
> >>>>> +            struct page_info *foreign_page;
> >>>>> +            mfn_t foreign_mfn;
> >>>>> +            void *foreign;
> >>>>> +            p2m_type_t p2mt;
> >>>>> +            const unsigned long valid_mask =
> >>>>> +#ifdef CONFIG_X86
> >>>>> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
> >>>>> +#else
> >>>>> +                p2m_to_mask(p2m_ram_rw);
> >>>>> +#endif
> >>>>
> >>>> The set of permitted types didn't change, yet a justification for the resulting
> >>>> limitation also didn't appear.
> >>>>
> >>>
> >>> Yes, that's missing, indeed.
> >>> Should the set of types be different for reading and writing? For
> >>> instance do not allow writing to read-only memory?
> >>
> >> Of course.
> >>
> >>> Given that it looks like different architectures have different
> >>> meanings and definitions for these constants, should it not be better
> >>> to define some new constants for this specific usage? For instance
> >>> P2M_READ_TYPES and P2M_WRITE_TYPES?
> >>
> >> Perhaps, yes. The suggested names look overly generic to me, though.
> >
> > I suppose P2M_READABLE_TYPES and P2M_WRITABLE_TYPES are more correct
> > but still too generic.
> > P2M_EXPORTABLE_TYPES and P2M_IMPORTABLE_TYPES ?
>
> First: Do you foresee uses of those constants anywhere else? If not (I
> don't), tie the names to this particular operation. That'll make them
> entirely non-generic.
>
> >>>>> @@ -2012,6 +2145,18 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>>>              start_extent);
> >>>>>          break;
> >>>>>
> >>>>> +    case XENMEM_foreigncopy:
> >>>>> +        /*
> >>>>> +         * Instead of using "start_extent" we update the structure back,
> >>>>> +         * we update it back in anyway to tell caller were the copy
> >>>>> +         * stopped.
> >>>>> +         */
> >>>>> +        if ( unlikely(start_extent) )
> >>>>> +            return -EINVAL;
> >>>>
> >>>> As before - please be precise with comments like this. We update it back also
> >>>> when encoding a continuation. Perhaps instead "..., to indicate the point of
> >>>> failure to the caller as well as to encode continuations without being
> >>>> constrained by MEMOP_EXTENT_SHIFT".
> >>>>
> >>>
> >>> What about (trying to include your suggestion, to be fixed for line length):
> >>>
> >>>         /*
> >>>          * Instead of using "start_extent" for the continuation, we
> >>> update the structure back,
> >>>          * we update the xen_foreigncopy structure back, so we are not
> >>> constrained
> >>>          * by MEMOP_EXTENT_SHIFT.
> >>>          * We copy it back also to tell the caller where the copy stopped.
> >>>          */
> >>
> >> One of the things I take issue with (because it's hard to read that way,
> >> at least for me) is the repeated use of "update ... back", effectively
> >> saying the same things twice. The last sentence also wants disambiguating
> >> towards the "stopped" possibly being a non-error situation as well.
> >>
> >
> > Changed to
> >
> >         /*
> >          * Instead of using "start_extent" for the continuation, we update
> >          * the xen_foreigncopy structure back, so we are not constrained by
> >          * MEMOP_EXTENT_SHIFT.
> >          * We copy it back also to tell the caller where the copy stopped
> >          * (either for error or because all frames were copied).
> >          */
>
> Thanks.
>
> >>>>> +    XEN_GUEST_HANDLE(uint8) buffer;
> >>>>> +};
> >>>>
> >>>> What was (again) left unaddressed is the question towards using GFNs on both
> >>>> sides of the copy. This would eliminate the need for the flags field, taken
> >>>> by a 2nd domid_t one then.
> >>>>
> >>>
> >>> This was addressed in
> >>> https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00567.html
> >>
> >> Well, yes, but not in a satisfactory way. Back channels tell me that you
> >> actually got the same feedback already on internal review. Which makes it
> >> all the more puzzling that you insist on doing it differently. Multiple
> >> maintainers asking for the same thing may be an indication of something.
> >
> > Not needing to have backchannel feedback, I already wrote that a
> > similar approach was tried and made the code more complicated.
>
> Even if indeed so: Yet at the same time more flexible.
>
> > Both maintainers didn't comment on my replies so I assume they were
> > fine with it.
> > And you are failing to provide positive feedback.
> > I asked (that one internally) for examples of guest buffers provided
> > as frame numbers but I got no answer (or better the answer was more
> > "currently there are not").
> > Also note that the location of xen_foreigncopy_t structure is also
> > provided using a guest pointer.
> > I remember there were some discussions about ABI changes (2/3 years
> > ago) to address this and other issues but I cannot see much progress.
>
> And it's that (very slowly progressing effort) which made me ask. The
> fewer virtual addresses we bake into new sub-ops, the better for that
> effort. And no, that doesn't go as far as completely eliminating
> handles (presently representing virtual addresses) - that needs to be
> part of the new ABI.
>

In other words, you want me to code something temporary that you
already know that needs to be changed.

> To preempt the argument towards "fewer virtual addresses" not really
> being true when changing from handle-to-uint8 to handle-to-pfn: The
> former won't be able to express a buffer mapped contiguously in VA
> space, but discontiguous in PA space. The latter will, simply be
> avoiding buffer VAs in the first place (the array of frame numbers
> can e.g. be placed in a dedicated hypercall argument area known to be
> physically contiguous).
>

If it's mapped continuously in VA and you pass the VA I don't
understand the problem. From the way I see it's more the latter that's
the problem.

> > That's why I say this is out of scope.
>
> There's nothing scope related here. We're discussing how to shape the
> new sub-op interface.
>
> >>> and in minor way by
> >>> https://lists.xenproject.org/archives/html/xen-devel/2026-06/msg00847.html.
> >>> It was considered but more complicated and worse from a performance perspective.
> >>
> >> Okay, performance-wise worse would of course be relevant. But that would
> >> need supporting by numbers (for both PV and PVH Dom0, as the latter
> >> incurs extra overhead for virtual-address-based hypercall buffer operands).
> >
> > I'm more concerned about the PV case than PVH to be honest.
>
> For your (immediate) internal purposes that may be fine, but PVH Dom0
> more likely being the future, for upstream both need considering
> equally.
>

From an internal discussion:

--------------------
About HVM and VAs/PFNs, I was thinking. We pass a single PFN for a
page containing either
- a single list of PFNs fitting into the page (plus number of entries)
for small hypercalls (most of them)
- a page containing a list of PFNs pointing to arrays of PFNs for
large hypercalls (like kexec load and few others)
Now the GUEST_HANDLEs are treated differently, instead of VAs they
contain offset into array above plus page offset.

Okay, let's do an example. I want to call a DOMCTL which have a handle
to a small array, so I need to pass the domctl structure and the
array, I suppose I need 2 PFNs (unless domct or the array span
multiple pages) so kernel would need to build and pass an array of 2
PFNs, let's say 0xabcabc01 and 0xabcabc02. I build a page with
1- 2 (number of PFNs)
2- 0xabcabc01
3- 0xabcabc02
I pass the PFN of the above page (how it's a detail, probably an
additional register), number of hypercall and... a GUEST_HANDLE. Here
the guest handle would be something like 0x0000ppp where ppp is the
page offset inside 0xabcabc01 page. Why 0xabcabc01 ? Because the upper
part of the guest handle is 0 (so the first entry in the PFNs array
above). Inside the domctl structure the guest handle to the array will
be something like 0x0001ppp where the 0x0001 means 0xabcabc02 while
ppp here is the page offset into 0xabcabc02.
What if the array is bigger than a single page? Let's say it spans
into 3 pages, you would have something like
1- 4 (number of PFNs)
2- 0xabcabc01
3- 0xabcabc02
4- 0xabcabc03
5- 0xabcabc04
(okay, in all example pages are contiguous but not important)
The guest handle for the array would still be 0x0001ppp but the code
will continue on array entry 2 (0xabcabc03) and 3 (0xabcabc04)
--------------------
The distinction for the above could be a flag added to the hypercall
number or automatic on type of VM (PV/HVM) but for compatibility I
would go for the first. But these are details.
This would work without much API changes and minor hypervisor changes
(mainly copy_from_guest and similar macros).

Okay, the above is a bit OT here but the point is that the change you
are asking me won't help with this in the future, basically you are
asking me an implementation based on an implementation that is not
currently even on paper.

> Jan

Frediano

