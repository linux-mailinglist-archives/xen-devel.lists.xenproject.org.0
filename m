Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PsYyHa3jJ2qH4AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:58:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B735C65EA1C
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:58:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YhUzOZo1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332580.1595046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWtDD-00065R-ID; Tue, 09 Jun 2026 09:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332580.1595046; Tue, 09 Jun 2026 09:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWtDD-00062q-Ed; Tue, 09 Jun 2026 09:57:35 +0000
Received: by outflank-mailman (input) for mailman id 1332580;
 Tue, 09 Jun 2026 09:57:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wWtDC-000602-IC
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:57:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWtDB-00Fooj-Ts
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:57:33 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27e37c-2eae-0a2a0a5409dd-0a2a450785dc-34
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:57:33 +0200
Received: from [74.125.224.45] (helo=mail-yx1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27e38c-229c-0a2a45070019-4a7de02de5c4-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:57:33 +0200
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-66077c46c5cso4713584d50.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:57:33 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780999052; cv=none;
        d=google.com; s=arc-20240605;
        b=hCloAgWDiKCJiQpUevjX1dQV2kyo68mCkKCi99Sqx1M1cLf5l+A0igNQsAn+8WvsP7
         NIHn3zGFZ2FUJ5E7GTyzKJZjd4HUIaSLQ0H3s1DDi1ONyjQ+gR/oLA8l/JnrDySK7ly/
         Tj9LUj2MhjgLeh2Nk2/+q5U209TEKGfH+7Qq/CVSHp9bg4vrGRXSzEFye7FelptCob3G
         6eDRJlJXf6m8l5vgUb2S31qp9LM54atHMlW56B8cifCXYs/EyftISZRAVX6vFiyTJlEV
         Lm8fQR25KMNsCOgfazwS9tWtWG/9Z+ncB/5S+1mRQytan8faFT70sACuSaI/HL9MHrI/
         zVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iSJ3S61A5YYvehrw2IUj0tAyNXo2un6snsejc7TM+80=;
        fh=/+lVIvc/fLRLiJZVkidsbGp56ebj8ErFVA+AxgRIuZo=;
        b=h+3u1vOwEQ+g5un5hqg3hKyEjI1uCA/9T9pEa0V1gT/yQLCfKOQw4jp2s7lk+WXwH2
         Tfsde029K8v9FvJyLpvAysox+iP+secMTJaDtiSfxWOgtiZUjUHhdDQlVy4u2de3fQ4H
         JvcLECY6aOxFSeoyFMMnhZ81yA7ry+ZmgpOx0AfO7N+2xKxbdy2yTp/8xB/oLw1g03mx
         29177sRGxxIoQplA7bzgdJoaEGOYi89bxUA9oWQ0otTRbw/+8CiaiYDb6ddZzWO4M3po
         Dtn5jxE0MP/WHBZpodRlBRbwUbDDa2ipYccG4r+Cw1MiWnogkauUCOfOn+DJLSUDNOad
         u65A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780999052; x=1781603852; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSJ3S61A5YYvehrw2IUj0tAyNXo2un6snsejc7TM+80=;
        b=YhUzOZo1FQ7xa75HVkGJJ+gj19zHI6yKtN9qQtfOKpX8Yx0/Cmjdl90/L7TBrT+aoJ
         6oHtpFLYklEhtiWVjXUdAPYJb2pBX9g9UlgRsXXYGwuWRdz26DzGUVVAHDPocuQe7L3h
         gNCRUKqHee7nfwqFtbH3rvdr9yzvkH44BSGRrwyXbN9ZCF6iGHkD+qkaSrialM4/9PC+
         at8qJZonwydS7FxxbsNFQiZsat0cNBrxOuS4pMj8DaQiEGdn03m1fU9sFqXi2QPmBClC
         bQKdFH0jqCsLTmInz3wdlPairQFW/LJ8RPZZQq0nXTWKKrg5Y2Q3AyPPMTsZvQabAmWn
         3SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780999052; x=1781603852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSJ3S61A5YYvehrw2IUj0tAyNXo2un6snsejc7TM+80=;
        b=Cek1gphDt6SUKElBX/muKT6g42Imb/e8KkGvYBP/38uComDsuYhUs8B8kU0eoFHxcB
         AvmDfB/0MRvpJP7cVwXwtZ/dChJVsjVvEt/YN8BUtiKKHz1rXzYpYn3SXd7yoHReZVCs
         0JdLoAa6KbUPfqLQ8X0qDIRjchnNv3Kx09DeYdWAf39cE5TdAPx6wFwKUwgd8O6iQjEU
         gtpCWwT0kty4/KcAw2d6CkCWYvDzDNfKjJIB0BmqP1eC2LlCGJjtA0C8rgha+zy0fNXe
         Hmakq1PTY9hHfp/CQWYuiRacBRisJ22kRXraAZaUeSAP7Q3h3+iZHehX6xTUs4iNPLEI
         R43w==
X-Gm-Message-State: AOJu0YwmzpauJjW8vTnK1xniJnlRn74GwQGP0aEehwHiUkKpdd/92+QI
	0x7qJvR/mzH92h0W4manITrL5oUzawtuKvT6DUTfZxXVmATjKqu2KTZmFdn60ErOlmP+pEvorqs
	3bHfzE5sBh2v7S4DmfJAhwMQyjgKGVxk=
X-Gm-Gg: Acq92OGOrAgTcueIBgfJJ1I3cZB5eXHZVPh+AWUnnUbbSFowR6R7CvX3RfqxMo7k4us
	gMu+xoyEHLoXc7xGTpdMnL6YB50wyiphZQh00b0o73RyE4JDjlAVHbUp255YcHQk0IQib+WfwGo
	+Kp4CTIS4mmhUOW/G4vBYNDVidaSEqQd9qvOlPBLcT9+wQb2SpyYFiImy04xmQ1VEwdjqbcTBl1
	AycgzKyjuejrf9sh4A3G629rm0Da9BjtyHhp8LD4wPMtgb8P/RTUJ1RSHToKDd0zjQMU3RzoImy
	iUJGYtmyH7RX6vMepChdTBQabfqtntjPBA6886oXSWWhW9Lv
X-Received: by 2002:a05:690e:480b:b0:657:a0f4:ac1d with SMTP id
 956f58d0204a3-66106dda5abmr12463754d50.12.1780999051857; Tue, 09 Jun 2026
 02:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-13-frediano.ziglio@cloud.com> <1780930777.8631fc262581453bbf619ec5b2062170.19ea7bf10cd000701b@vates.tech>
In-Reply-To: <1780930777.8631fc262581453bbf619ec5b2062170.19ea7bf10cd000701b@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 9 Jun 2026 10:57:20 +0100
X-Gm-Features: AVVi8Cf1oads9qcl3pwOQ2iF8_XqPzFeY9pbJ-IBrXH-Jb3dnOSmMbLLDLrZoyo
Message-ID: <CAHt6W4c_E3wmV=KNG-_4FNgX9Wq4s7t-RoXzpf6NWPj7s0oH3A@mail.gmail.com>
Subject: Re: [PATCH v4 12/16] xen: implement new foreign copy hypercall
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1780999053-0AF76C48-C48AA6C0/0/0
X-purgate-type: clean
X-purgate-size: 8419
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
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,citrix.com:email,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B735C65EA1C

On Mon, 8 Jun 2026 at 15:59, Teddy Astie <teddy.astie@vates.tech> wrote:
>
> Le 03/06/2026 =C3=A0 15:08, Frediano Ziglio a =C3=A9crit :
> > From: Frediano Ziglio <frediano.ziglio@citrix.com>
> >
> > Add a sub hypercall to __HYPERVISOR_memory_op to allow to
> > read/write memory from/to a foreign domain.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> > ---
> >   xen/common/memory.c         | 133 +++++++++++++++++++++++++++++++++++=
+
> >   xen/include/public/memory.h |  40 ++++++++++-
> >   2 files changed, 172 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/common/memory.c b/xen/common/memory.c
> > index 3672bda025..6a2d9c3190 100644
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -1545,6 +1545,132 @@ static int acquire_resource(
> >       return rc;
> >   }
> >
> > +/*
> > + * The "noinline" qualifier avoid the compiler to create a large funct=
ion
> > + * consuming quite a lot of stack.
> > + */
> > +static int noinline mem_foreigncopy(
> > +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> > +{
> > +    struct domain *d, *const currd =3D current->domain;
> > +    xen_foreigncopy_t copy;
> > +    int rc, direction;
> > +
> > +    if ( !arch_acquire_resource_check(currd) )
> > +        return -EACCES;
> > +
> > +    if ( copy_from_guest(&copy, arg, 1) )
> > +        return -EFAULT;
> > +
> > +    if ( copy.flags & ~1u )
> > +        return -EINVAL;
> > +
> > +    direction =3D copy.flags & XENMEM_foreigncopy_direction;
> > +
> > +    if ( copy.nr_frames =3D=3D 0 )
> > +        return 0;
> > +
> > +    rc =3D rcu_lock_remote_domain_by_id(copy.domid, &d);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    /*
> > +     * Check we are allowed to map and access these foreign pages.
> > +     */
> > +    rc =3D xsm_map_gmfn_foreign(XSM_TARGET, currd, d);
> > +    if ( rc )
> > +        goto out;
> > +
> > +    do {
> > +        /*
> > +         * Arbitrary size.  Not too much stack space, and a reasonable=
 stride
> > +         * for continuation checks.
> > +         */
> > +        xen_pfn_t gfn_list[32];
> > +        unsigned int todo =3D MIN(ARRAY_SIZE(gfn_list), copy.nr_frames=
);
> > +
> > +        rc =3D -EFAULT;
> > +        if ( copy_from_guest(gfn_list, copy.frame_list, todo) )
> > +            goto out;
> > +
> > +        for ( unsigned i =3D 0; i < todo; i++ )
> > +        {
> > +            struct page_info *foreign_page;
> > +            void *foreign;
> > +            p2m_type_t p2mt;
> > +
> > +            foreign_page =3D get_page_from_gfn(d, gfn_list[i], &p2mt, =
P2M_ALLOC);
> > +
> > +            if ( unlikely(p2mt !=3D p2m_ram_rw
> > +#ifdef CONFIG_X86
> > +                 && p2mt !=3D p2m_ram_logdirty
> > +#endif
> > +                 ) && foreign_page )
> > +            {
> > +                put_page(foreign_page);
> > +                foreign_page =3D NULL;
> > +            }
> > +            if ( unlikely(!foreign_page) )
> > +            {
> > +                gdprintk(XENLOG_WARNING,
> > +                         "Error accessing foreign mfn %" PRI_mfn "\n",
> > +                         gfn_list[i]);
> > +                rc =3D -EINVAL;
> > +                copy.nr_frames -=3D i;
> > +                guest_handle_add_offset(copy.frame_list, i);
> > +                goto out;
> > +            }
> > +
> > +            /* A page is dirtied when it's being copied to. */
> > +            if ( direction =3D=3D XENMEM_foreigncopy_to )
> > +                paging_mark_dirty(d, page_to_mfn(foreign_page));
> > +
> > +            foreign =3D map_domain_page(page_to_mfn(foreign_page));
> > +            if ( direction =3D=3D XENMEM_foreigncopy_from )
> > +                rc =3D copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> > +            else
> > +                rc =3D copy_from_guest(foreign, copy.buffer, PAGE_SIZE=
);
> > +            unmap_domain_page(foreign);
> > +            put_page(foreign_page);
> > +
> > +            if ( unlikely(rc) )
> > +            {
> > +                gdprintk(XENLOG_WARNING,
> > +                         "Error copying to mfn %" PRI_mfn "\n", gfn_li=
st[i]);
> > +                copy.nr_frames -=3D i;
> > +                guest_handle_add_offset(copy.frame_list, i);
> > +                goto out;
> > +            }
> > +
> > +            guest_handle_add_offset(copy.buffer, PAGE_SIZE);
> > +        }
> > +
> > +        copy.nr_frames -=3D todo;
> > +        guest_handle_add_offset(copy.frame_list, todo);
> > +
> > +        if ( copy.nr_frames && hypercall_preempt_check() )
> > +        {
> > +            rc =3D hypercall_create_continuation(
> > +                __HYPERVISOR_memory_op, "lh", XENMEM_foreigncopy, arg)=
;
> > +            goto out;
> > +        }
> > +    } while ( copy.nr_frames );
> > +
> > +    rc =3D 0;
> > +
> > + out:
> > +    rcu_unlock_domain(d);
> > +
> > +    /* Update in all cases, it allows the caller to know how many
> > +     * frames were successfully copied and the continuation to
> > +     * continue correctly.
> > +     */
> > +    if ( copy_to_guest(arg, &copy, 1) )
> > +        rc =3D -EFAULT;
> > +
> > +    return rc;
> > +}
> > +
> >   long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg=
)
> >   {
> >       struct domain *d, *curr_d =3D current->domain;
> > @@ -2012,6 +2138,13 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_H=
ANDLE_PARAM(void) arg)
> >               start_extent);
> >           break;
> >
> > +    case XENMEM_foreigncopy:
> > +        if ( unlikely(start_extent) )
> > +            return -EINVAL;
> > +
> > +        rc =3D mem_foreigncopy(guest_handle_cast(arg, xen_foreigncopy_=
t));
> > +        break;
> > +
> >       default:
> >           rc =3D arch_memory_op(cmd, arg);
> >           break;
> > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > index bd9fc37b52..b48d1f378f 100644
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -740,7 +740,45 @@ struct xen_vnuma_topology_info {
> >   typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
> >   DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
> >
> > -/* Next available subop number is 29 */
> > +/*
> > + * Copy memory from/to a given domain.
> > + */
> > +#define XENMEM_foreigncopy 29
> > +struct xen_foreigncopy {
> > +    /* IN - The domain whose resource is to be copied. */
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
> > +
>
> The interface only allows copies to be made at page granularity, while
> that can be ok, that probably wants to be stated.
>
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
> > +};
>
> The interface looks a bit asymetric, on one hand, it takes pfns and on
> the other hand, it takes a guest virtual address.
>
> Though, using guest pointers is not great for PVH domains, as it
> requires expensive pagewalks (especially for a lot of pages).
>
> Would it be preferable to have a list of gmfn for both sides ?
>

All this was considered and the interface could accept either virtual
pointer or GFNs.
However, the code was more complicated and I think to resolve this
correctly is out of scope here.
How is the structure passed using the hypercall? With a virtual
pointer? Why not complain also about that pointer? It would be good
for PVH not to use virtual addresses at all.
The PFN/virtual should be solved more generically.

> > +typedef struct xen_foreigncopy xen_foreigncopy_t;
> > +DEFINE_XEN_GUEST_HANDLE(xen_foreigncopy_t);
> > +
> > +/* Next available subop number is 30 */
> >
> >   #endif /* __XEN_PUBLIC_MEMORY_H__ */
> >
>
> Teddy

Frediano

