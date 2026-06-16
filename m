Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7zkjNs0bMWrsbgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:47:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFB968DADB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:47:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GZBIxFB2;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1338964.1600057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQOT-0002CX-9R; Tue, 16 Jun 2026 09:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338964.1600057; Tue, 16 Jun 2026 09:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQOT-0002AW-5h; Tue, 16 Jun 2026 09:47:41 +0000
Received: by outflank-mailman (input) for mailman id 1338964;
 Tue, 16 Jun 2026 09:47:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZQOR-000299-TV
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:47:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQOQ-0094xv-K1
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:47:38 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a311bb1-bab6-0a2a0a5309dd-0a2a4507c740-42
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:47:38 +0200
Received: from [74.125.224.53] (helo=mail-yx1-f53.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a311bb8-229c-0a2a45070019-4a7de035bc73-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:47:37 +0200
Received: by mail-yx1-f53.google.com with SMTP id
 956f58d0204a3-66049669d78so4142263d50.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:47:37 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1781603256; cv=none;
        d=google.com; s=arc-20240605;
        b=VpZlJYjEuP96KT+gUHS3SOrBTFbBh9XScCE7hsuLWAMOeQIsmy1z4DpSEkrQ1m0I6W
         1LDzJ1Jx3twGwWIetLN046jpzqKsAhBHHQQmmfluZhJzIDsmyVpj2+Baz7RIaD4DNcHR
         07AKf/HAKcojllq8NX5BAS5274vXH1pQzVrecABu4z2Uj5w9ca7A4Dr3YaguW+tok+H5
         NI5o+dQXOA/3dBf9g+8Fx6S83/X3uRDb8AB5DerxBuQzF2CGl1751ZTRjVTNbxU37elG
         2NLeR6KLRbzOXgbnrKfY6Ua3se8KjAq5SjWTvSbqczYqDAbHh19wp66797RKroFx+Q7K
         QOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3QZzknEigUzqWgdbUogp3gXKzG4Dw5l0ENS04KVvDsY=;
        fh=JOhR8Zt5h87etEMw9WfkhqB1RxmWzX37a+o61Ig76GI=;
        b=EweFymU5sJTd3lAYNale49XJvkq1TN4+JugLC81c8QyCzh+A6X9GjF09ds2qWi5SKD
         fwkkfVVCA6QIVBOz0tBnwDYJjyLX1PP8HNRcC3f81i6gPMkL+lwU8HnrILElBdQNNj1O
         k7IXvmyMAxWRTRSECrnR/ucvST3WZCXCayPgXxkbctjVpmDDw3IfNkVZNEeWzCyIcNAO
         D/qfr9s1a1zGvCRwBFbSWKyHxg5mbgIz92SuyR5uNDQjRj+Mu83OCQhAap9hGokqJqsU
         d5hjrnM9lqvD6FeM6j2J177ZfcdwCwy94vVlhfogB2wq1uuklDZvIYTBfcGOjIgUSGSD
         HS3w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781603256; x=1782208056; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3QZzknEigUzqWgdbUogp3gXKzG4Dw5l0ENS04KVvDsY=;
        b=GZBIxFB22RcZ+g24mMD7+S9FSlOaBBF37xV0cXxrjxbvSePWJc8ElsRCOsQPWPQekb
         qydpXAVkvMLah6pVLq7x08U33mtwmVDMcaPxKiSlOZFLpH/oNHrzPK+7AN7aXioODJb3
         TSqN3MXFambQwFrOus+M/wjYVllyfQzcE0ggMqVWq1cwDMqm4OuoyvsnJGFq6MU6vOCJ
         j8a11AgJC3Cjq5KYjIQ3GD1eMmg79qxsEfe5hwERhIT70a1tgl/OfUSlRM7VBN/SRkn/
         8jZ6py1XHEWvRV99SVz4UZJeypxqkPnEOKEkvHruHgC7k0jGeFztmF7BrLvXzoDUNXkz
         N1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603256; x=1782208056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3QZzknEigUzqWgdbUogp3gXKzG4Dw5l0ENS04KVvDsY=;
        b=QKYgzZlo/zO1LaSCUang6GhuDLC7roF6tKjdqCNmePPaf0EOHWontyk2nh7EPmVPYN
         kDHKRf/j/liG55aM1xbM309DyrmMXcqfEucjeRbk4sfbgf1p9zY4LcaxxUsFA9tRd1mt
         SFvB5JKtWBiRyVJsFyLVOP3jbuuROMRqD9yBrLLoJN+LWPwi4GfFfGmqW+KOgdOG+2NA
         E1g0Igy7Gr71wxwD4qGodaoLqWRCZKW39G0oMpv+HC/vkhFRrqYZxAyKsCB0T+iqHMOs
         eoknQGdXYgRFWd/uF8R5ZqeCFp6URvD79v5vql25QwXG97V8bDOzdE3ywfYe5yjC3kls
         FEag==
X-Forwarded-Encrypted: i=1; AFNElJ+uSGQJHf7Nq2ifnXq8odzP9DsAgVXNezZ4P0l25V93/vhO1RSVf0MB97+YzYIrN+iJXYjQKZ+50Nw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzG1ZfHUSNC0IdYPnCRlM9WU49kKXEmI0sUolJqo0T1ttkVu0uu
	bNmeoKKljg4pCwOZ7FvejLrPYV3qMjQSxLDWhCmU51S3LP2qF4+CGyIxL5Kw+WpZU6/41wH0siv
	GaUBU4grbG7Iy7GiGwloMQ+cuA8M2ERg=
X-Gm-Gg: Acq92OGZYR6Ob3tIgq97El+3MjpR57wRg+hZDF5B6n0o0QOUgePH2bz8IJRY5oEY7yM
	A8UYCu9rXInuzRGZrOh0aLlUfowZwAHDmPNDY7EFX/cTHvElF4tgWf1sndvsv2sK6vmRe7wg2cQ
	TUbxEZtnRel3JOdmqE2MzGSnIsc36LRnWOpSwAlLx+9tvTNREev9aYNasbwI3A3I2LzpBkiL0aT
	oZbAK2PkgNg3sfLCOPs2uuM9NxvKbjgeoM7cqI4KLVBlab51nnyahDOFq6Q/EC13y8vMtvp+iA8
	vo0krs4oyqJlmiF5uY9VAjeNXeRUHtyMdXEqyw==
X-Received: by 2002:a05:690e:12c1:b0:65e:1c98:83c7 with SMTP id
 956f58d0204a3-662782d6bd7mr13915534d50.36.1781603256250; Tue, 16 Jun 2026
 02:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
 <20260613214749.20620-13-frediano.ziglio@cloud.com> <8289ea1d-ceca-40b6-a992-a778be053cd0@suse.com>
 <CAHt6W4en1yMLrUXv+RbcoPr-=S_=pi2Rrcm2BC2PzMZT+0ksFw@mail.gmail.com>
 <1c1829d2-4cb4-4e29-9012-fdcbca8d79a9@suse.com> <CAHt6W4daGuduOgRNUFOB8SZd+C5bxaubyQoU=xDcJSMzo97VDw@mail.gmail.com>
 <024e626a-e1be-4959-bd78-4e229beade98@suse.com>
In-Reply-To: <024e626a-e1be-4959-bd78-4e229beade98@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 16 Jun 2026 10:47:24 +0100
X-Gm-Features: AVVi8Cd91XH6FxSePaHr4ktj52SqWfUG9PumqIvcgtNA0AbKNcBL7QrTN6kqAG8
Message-ID: <CAHt6W4d62wJyALu3pM52JB12FXfDS0+fDk6Hna9fP55acskSAA@mail.gmail.com>
Subject: Re: [PATCH v5 12/16] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ef75cf/1781603257-21D6FC48-21EBECB6/0/0
X-purgate-type: clean
X-purgate-size: 9232
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
X-Rspamd-Queue-Id: 3DFB968DADB

On Mon, 15 Jun 2026 at 16:23, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 15.06.2026 17:07, Frediano Ziglio wrote:
> > On Mon, 15 Jun 2026 at 15:03, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 15.06.2026 14:11, Frediano Ziglio wrote:
> >>> On Mon, 15 Jun 2026 at 08:41, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 13.06.2026 23:47, Frediano Ziglio wrote:
> >>>>> +        {
> >>>>> +            struct page_info *foreign_page;
> >>>>> +            void *foreign;
> >>>>> +            p2m_type_t p2mt;
> >>>>> +            const unsigned long valid_mask =
> >>>>> +#ifdef CONFIG_X86
> >>>>> +                p2m_to_mask(p2m_ram_rw) | p2m_to_mask(p2m_ram_logdirty);
> >>>>> +#else
> >>>>> +                p2m_to_mask(p2m_ram_rw);
> >>>>> +#endif
> >>>>
> >>>> What about, for example, p2m_ram_ro? Or p2m_ram_shared? Or p2m_grant_map_*?
> >>>> Etc. Any artificial constraining wants justifying in the description and/or
> >>>> mentioning in the public header.
> >>>
> >>> The base of this was taken from migration code where there is such a check.
> >>> I suppose that adding p2m_ram_ro (where available) won't hurt.
> >>
> >> Just to mention, to avoid another round trip just because of this: p2m_ram_ro
> >> has different meaning on x86 vs Arm/RISC-V.
> >
> > That's confusing... should not this be fixed somehow?
> > It won't save much from a round-trip. Should I allow it or not ?
>
> Ask the Arm maintainers. I raised this issue more than once, without any real
> success.
>
> >>> p2m_ram_shared I'm not sure but seems fine too.
> >>> For p2m_grant_map_* it feels a bit a security issue to me. It would
> >>> allow a guest to give access to pages of other domains. It's true that
> >>> the current domain would have to have write access to this domain
> >>> anyway but extend these permissions sounds something it should not be
> >>> able to do.
> >>
> >> It could copy the contents of the grant mapped page by other means. Why not
> >> allow it in this new sub-op as well then?
> >
> > I'm more afraid of writing the content of the grant pages than copying it.
>
> But the same is true for writing to the granted page: The domain could do so
> by other means.
>
> >> Talking of security: When the page you copy to is owned by a PV guest, I
> >> think you further need to obtain a PGT_writable type ref. (Of course it then
> >> likely is easier to always do this, not just for PV.)
> >
> > Wondering how save/restore (or migration) works in this case.
>
> Save is not relevant here. Restore happens before the guest gains control.
> Which is entirely different from hypercall handling.
>
> >>>>> @@ -2012,6 +2139,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >>>>>              start_extent);
> >>>>>          break;
> >>>>>
> >>>>> +    case XENMEM_foreigncopy:
> >>>>> +        if ( unlikely(start_extent) )
> >>>>> +            return -EINVAL;
> >>>>
> >>>> Please address review comments (verbally or by code changes) before submitting
> >>>> a new version. Here I had asked "Why make this different from other continuable
> >>>> sub-ops?"
> >>>>
> >>>
> >>> There's already a comment in the same file for similar reason
> >>>
> >>>     /*
> >>>      * Limiting nr_frames at (UINT_MAX >> MEMOP_EXTENT_SHIFT) isn't ideal.  If
> >>>      * it ever becomes a practical problem, we can switch to mutating
> >>>      * xmar.{frame,nr_frames,frame_list} in guest memory.
> >>>      */
> >>>
> >>> so to avoid the doubt and possible future change I mutate the structure.
> >>> Also I use the mutation to give more information to the caller, using
> >>> "start_entent" won't allow this.
> >>
> >> You'll want to mention this in the description and/or a code comment. It
> >> wants to become clear that the inconsistency in behavior (with other sub-
> >> ops) is deliberate rather than accidental.
> >>
> >
> > Added a comment in the code:
> >
> >         if ( copy.nr_frames && hypercall_preempt_check() )
> >         {
> >             /*
> >              * Instead of using "start_extent" we update the structure back,
> >              * we update it back in anyway to tell caller were the copy
> >              * stopped.
> >              */
> >             rc = hypercall_create_continuation(
> >                 __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg);
> >             goto out;
> >         }
>
> Please can this go into the hunk that I commented on?
>
> >>>>> --- a/xen/include/public/memory.h
> >>>>> +++ b/xen/include/public/memory.h
> >>>>> @@ -740,7 +740,45 @@ struct xen_vnuma_topology_info {
> >>>>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
> >>>>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
> >>>>>
> >>>>> -/* Next available subop number is 29 */
> >>>>> +/*
> >>>>> + * Copy memory from/to a given domain.
> >>>>> + */
> >>>>> +#define XENMEM_foreigncopy 29
> >>>>> +struct xen_foreigncopy {
> >>>>> +    /* IN - The domain whose resource is to be copied. */
> >>>>
> >>>> There's still "resource" here, when this really is about RAM (memory) only,
> >>>> not any other kind of resource.
> >>>>
> >>>>> +    domid_t domid;
> >>>>> +
> >>>>> +    /* IN - Flags. */
> >>>>> +#define XENMEM_foreigncopy_from 0
> >>>>> +#define XENMEM_foreigncopy_to 1
> >>>>> +#define XENMEM_foreigncopy_direction 1
> >>>>> +    uint16_t flags;
> >>>>> +
> >>>>> +    /*
> >>>>> +     * IN
> >>>>> +     *
> >>>>> +     * As an IN parameter number of frames of the domain to be copied.
> >>>>> +     */
> >>>>> +    uint32_t nr_frames;
> >>>>
> >>>> This isn't just an input, as you update the field (and the handles below).
> >>>> This property of fields wants reflecting here, so callers know that they (a)
> >>>> can't re-use the struct on a subsequent call without re-initializing the
> >>>> fields which may have changed, and (b) can't put the struct in r/o memory.
> >>>>
> >>>
> >>> Update comments:
> >>>
> >>> /*
> >>>  * Copy memory from/to a given domain.
> >>>  */
> >>> #define XENMEM_foreigncopy 29
> >>> struct xen_foreigncopy {
> >>>     /* IN - The domain whose memory is to be copied. */
> >>>     domid_t domid;
> >>>
> >>>     /* IN - Flags. */
> >>> #define XENMEM_foreigncopy_from 0
> >>> #define XENMEM_foreigncopy_to 1
> >>> #define XENMEM_foreigncopy_direction 1
> >>>     uint16_t flags;
> >>>
> >>>     /*
> >>>      * IN/OUT
> >>>      *
> >>>      * As an IN parameter number of frames of the domain to be copied.
> >>>      * On output on error updated number of frames left.
> >>>      */
> >>>     uint32_t nr_frames;
> >>
> >> This is updated not only on error, but also when encoding continuations.
> >>
> >
> > Yes, but this seems more an implementation detail to me. I don't think
> > the caller cares about how the continuation is implemented.
>
> You just can't know what a caller may or may not care about. You want to
> be precise.
>
> >>>>> +    /*
> >>>>> +     * IN
> >>>>> +     *
> >>>>> +     * Frames to be copied.
> >>>>> +     */
> >>>>> +    XEN_GUEST_HANDLE(xen_pfn_t) frame_list;
> >>>>> +
> >>>>> +    /*
> >>>>> +     * IN/OUT
> >>>>> +     *
> >>>>> +     * Userspace buffer to read/write from.
> >>>>> +     */
> >>>>> +    XEN_GUEST_HANDLE(uint8) buffer;
> >>>>
> >>>> With these two handles, there continues to be a need to (explicitly) deal
> >>>> with the compat case as well.
> >>>
> >>> I don't agree with this. Domains having access to other domains are
> >>> limited (like stub domains for Qemu) and won't be 32 bits today so why
> >>> allow 32 bits guests if not ever used?
> >>
> >> How do you know? Why shouldn't e.g. XTF be permitted to test this in all
> >> possible modes? And even if all arguments end up in favor of "no compat
> >> support", this then wants spelling out to make clear this wasn't an
> >> oversight, but rather a conscious decision.
> >>
> >
> > XTF can do something like
> >
> > #if COMPAT_GUEST
> >     /* Compat guests are not supported, return success. */
> >     return 0;
> > # endif
> >
> > (or can be done in the Makefiles I suppose).
> >
> > Added a comment in memory.h:
> >
> >     /*
> >      * Copy memory from/to a given domain.
> >      * As this call requires target access and guest with target access won't be
> >      * compat guests supported for compat guests this is not implemented.
> >      */
>
> Well, okay. Right now what I can say is that with this it's then going to be
> rather unlikely that I'd ack the overall change. You make assumptions on
> what people may or may not do. There are still benefits to 32-bit environments
> in certain situations, even more so that the x32 mode of x86-64 didn't really
> take off.
>

Won't it save some round trips if you just told this a couple of
emails earlier? If you already knew that compat is worth doing why
asking to put a comment on it?

Similar to the discussion about Arm, if you know the issue, can you
explain it in more details? The description for the constant is the
same in all architecture, so, what is the difference?

> Jan

Frediano

