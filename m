Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKjMNRkh5mkMsAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 14:50:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4693442AF3F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 14:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285784.1567027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEo4c-0007k9-1F; Mon, 20 Apr 2026 12:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285784.1567027; Mon, 20 Apr 2026 12:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEo4b-0007h5-UK; Mon, 20 Apr 2026 12:49:57 +0000
Received: by outflank-mailman (input) for mailman id 1285784;
 Mon, 20 Apr 2026 12:49:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e620f1.v1-884f9eb010b443899f2b5441430958da@bounce.vates.tech>)
 id 1wEo4a-0007gz-Fi
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 12:49:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEo4Z-0004Q8-CA
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:49:55 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e620f1.v1-884f9eb010b443899f2b5441430958da@bounce.vates.tech>)
 id 69e620ea-2eae-0a2a0a5409dd-0a2a4505ec4a-44
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 14:49:55 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e620f1.v1-884f9eb010b443899f2b5441430958da@bounce.vates.tech>)
 id 69e620f1-aaa8-0a2a45050019-c602890b6efd-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 14:49:54 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fzlgj0s5lzDRSmvw
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 12:49:53 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 884f9eb010b443899f2b5441430958da; Mon, 20 Apr 2026 12:49:53 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776689393; x=1776959393;
	bh=c8iYYSuvv2dPJJ3UYz3BOeX/wQvSA1vuYJkQLpFfBZI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aE+rCooCHezqAMIS1CJIiW4LdvGSEAHAStYY7neoVNYWbUUXsRacXZIwEv4kGet9C
	 Mabn0NEI+oqzHZf3zy+EN2iDxxHGDYuVOuiP5eU1qZanWo+b9GkUT5auIYjwvIfKWa
	 fHljvypRrZvxDerFeq8CCjKfJGCI7osPQODlfy8+Azd3LPk0aA4zWNkcrDAbcd86rZ
	 DeIJ0u/sNdTISgBMD0dNYloGJWqs+BMtWEv8lsFKwZOrmYdIaVr7P9jNAHkGgEY69Y
	 UxkqsewML4RGCfwDrTHypqGtq3ZdFqGUUmmsJnS4UzAV22oKTsBeO9m/CkoEoz9OqJ
	 GzbDs48GZR2aQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776689393; x=1776949893; i=teddy.astie@vates.tech;
	bh=c8iYYSuvv2dPJJ3UYz3BOeX/wQvSA1vuYJkQLpFfBZI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=B2VYh0i+Oe9aaektlvVKuKNuqY8aBEW5vr0aFzbMDqo9mBBMH1LqPK7kM8SoXRHDW
	 uxN1D8SPBEmGznr6L21nglt3rePbMo43YcscjwXZMd2FtNt3T003HF+Ya4f8hXu2Fh
	 L46SaqQV6lsrMHYor8KWQ0QztnDWlqXoIrXnL24JtgTG3+NnCPaI8m/T05Vol3LIHG
	 r/yM/JLGbdOdjeackJ4ok+CxKEIIMTsbUXw2ABq/opa+FrRIGo+8GLUBKZYwOKqH2k
	 EMOEPKIC0JZVLgXUCQ7O2VlQFHw3xH4+H1raQwJZ2bc9L4pc0hq3VYy74kznl4d7Fk
	 LkwGqxOPFAdow==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6=203/3]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776689391815
Message-Id: <cd9b42bf-5399-471e-9b86-dcf13eaad9e6@vates.tech>
To: "Julian Vetter" <julian.vetter@vates.tech>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <20260420093820.825969-1-julian.vetter@vates.tech> <20260420093820.825969-4-julian.vetter@vates.tech>
In-Reply-To: <20260420093820.825969-4-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.884f9eb010b443899f2b5441430958da?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260420:md
Date: Mon, 20 Apr 2026 12:49:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1776689395-2A175443-44D4807A/0/0
X-purgate-type: clean
X-purgate-size: 9306
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	NEURAL_SPAM(0.00)[0.287];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.42.69.5:received];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4693442AF3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 20/04/2026 =C3=A0 11:41, Julian Vetter a =C3=A9crit=C2=A0:
> As the number of vCPUs grows, a single ioreq page of 128 slots may not
> be sufficient. Add support for allocating and mapping multiple ioreq
> pages so that the ioreq region can scale with d->max_vcpus.
> 
> Introduce nr_ioreq_pages() to compute the number of pages required for
> a given domain, and IOREQ_NR_PAGES_MAX as a compile-time upper bound
> (based on HVM_MAX_VCPUS).
> 
> ioreq_server_alloc_mfn() is updated to allocate nr_ioreq_pages() pages
> and map them contiguously via vmap().
> 
> is_ioreq_server_page() iterates over all ioreq pages when checking
> page ownership. ioreq_server_get_frame() allows callers to retrieve any
> ioreq page by index via the XENMEM_acquire_resource interface.
> 
> On x86, the legacy GFN mapping path (hvm_map_ioreq_gfn) is limited to
> a single ioreq page; device models requiring more ioreq slots must use
> the resource mapping interface (XENMEM_acquire_resource).
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v6:
> - Adapted the comment to not mention the guest, but the device model
> - Replaced the dynamic allocation for the mfns array by a static array
> - Fixed error handling in ioreq_server_alloc_mfn, using an extra
>    nr_alloc variable to track the already allocated pages
> - Dropped unnecessary void casts
> ---
>   xen/arch/x86/hvm/ioreq.c |  8 ++++
>   xen/common/ioreq.c       | 93 ++++++++++++++++++++++++++++------------
>   xen/include/xen/ioreq.h  | 12 ++++++
>   3 files changed, 86 insertions(+), 27 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index 3cabec141c..ee679bdf5a 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -166,6 +166,14 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s,=
 bool buf)
>       if ( d->is_dying )
>           return -EINVAL;
>   
> +    /*
> +     * The legacy GFN path supports only a single ioreq page. Device mod=
els
> +     * requiring more ioreq slots must use the resource mapping interfac=
e
> +     * (XENMEM_acquire_resource).
> +     */
> +    if ( !buf && nr_ioreq_pages(d) > 1 )
> +        return -EOPNOTSUPP;
> +
>       iorp->gfn =3D hvm_alloc_ioreq_gfn(s);
>   
>       if ( gfn_eq(iorp->gfn, INVALID_GFN) )
> diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
> index bae9b99c99..3a08e77597 100644
> --- a/xen/common/ioreq.c
> +++ b/xen/common/ioreq.c
> @@ -261,8 +261,11 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
>   static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>   {
>       struct ioreq_page *iorp =3D buf ? &s->bufioreq : &s->ioreq;
> -    struct page_info *page;
> -    mfn_t mfn;
> +    unsigned int i, nr_alloc =3D 0, nr_pages =3D buf ? 1 : nr_ioreq_page=
s(s->target);
> +    mfn_t mfns[IOREQ_NR_PAGES_MAX] =3D {};
> +    int rc;
> +
> +    ASSERT(nr_pages <=3D IOREQ_NR_PAGES_MAX);
>   
>       if ( iorp->va )
>       {
> @@ -277,11 +280,16 @@ static int ioreq_server_alloc_mfn(struct ioreq_serv=
er *s, bool buf)
>           return 0;
>       }
>   
> +    for ( i =3D 0; i < nr_pages; i++ )
>       {
> -        page =3D alloc_domheap_page(s->target, MEMF_no_refcount);
> +        struct page_info *page =3D alloc_domheap_page(s->target,
> +                                                    MEMF_no_refcount);
>   
>           if ( !page )
> -            return -ENOMEM;
> +        {
> +            rc =3D -ENOMEM;
> +            goto fail;
> +        }
>   
>           if ( !get_page_and_type(page, s->target, PGT_writable_page) )
>           {
> @@ -290,41 +298,59 @@ static int ioreq_server_alloc_mfn(struct ioreq_serv=
er *s, bool buf)
>                * here is a clear indication of something fishy going on.
>                */
>               domain_crash(s->emulator);
> -            return -ENODATA;
> +            rc =3D -ENODATA;
> +            goto fail;
>           }
>   
> -        mfn =3D page_to_mfn(page);
> +        mfns[nr_alloc++] =3D page_to_mfn(page);
>       }
> -    iorp->va =3D vmap(&mfn, 1);
> +
> +    iorp->va =3D vmap(mfns, nr_pages);
>       if ( !iorp->va )
> +    {
> +        rc =3D -ENOMEM;
>           goto fail;
> +    }
>   
> -    clear_page(iorp->va);
> +    memset(iorp->va, 0, nr_pages * PAGE_SIZE);
>       return 0;
>   
>    fail:
> -    put_page_alloc_ref(page);
> -    put_page_and_type(page);
> +    while ( nr_alloc-- )
> +    {
> +        struct page_info *page =3D mfn_to_page(mfns[nr_alloc]);
> +
> +        put_page_alloc_ref(page);
> +        put_page_and_type(page);
> +    }
>   
> -    return -ENOMEM;
> +    return rc;
>   }
>   
>   static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
>   {
>       struct ioreq_page *iorp =3D buf ? &s->bufioreq : &s->ioreq;
> -    struct page_info *page;
> +    unsigned int i, nr_pages =3D buf ? 1 : nr_ioreq_pages(s->target);
> +    struct page_info *pages[IOREQ_NR_PAGES_MAX];
>       void *va;
>   
>       if ( !iorp->va )
>           return;
>   
> +    ASSERT(nr_pages <=3D IOREQ_NR_PAGES_MAX);
> +
> +    for ( i =3D 0; i < nr_pages; i++ )
> +        pages[i] =3D vmap_to_page(iorp->va + i * PAGE_SIZE);
> +
>       va =3D iorp->va;
> -    page =3D vmap_to_page(va);
>       iorp->va =3D NULL;
>       vunmap(va);
>   
> -    put_page_alloc_ref(page);
> -    put_page_and_type(page);
> +    for ( i =3D 0; i < nr_pages; i++ )
> +    {
> +        put_page_alloc_ref(pages[i]);
> +        put_page_and_type(pages[i]);
> +    }
>   }
>   
>   bool is_ioreq_server_page(struct domain *d, const struct page_info *pag=
e)
> @@ -337,12 +363,25 @@ bool is_ioreq_server_page(struct domain *d, const s=
truct page_info *page)
>   
>       FOR_EACH_IOREQ_SERVER(d, id, s)
>       {
> -        if ( (s->ioreq.va && vmap_to_page(s->ioreq.va) =3D=3D page) ||
> -             (s->bufioreq.va && vmap_to_page(s->bufioreq.va) =3D=3D page=
) )
> +        unsigned int i;
> +
> +        if ( s->bufioreq.va && vmap_to_page(s->bufioreq.va) =3D=3D page =
)
>           {
>               found =3D true;
>               break;
>           }
> +
> +        for ( i =3D 0; i < nr_ioreq_pages(d) && s->ioreq.va; i++ )
> +        {
> +            if ( vmap_to_page(s->ioreq.va + i * PAGE_SIZE) =3D=3D page )
> +            {
> +                found =3D true;
> +                break;
> +            }
> +        }
> +
> +        if ( found )
> +            break;
>       }
>   
>       rspin_unlock(&d->ioreq_server.lock);
> @@ -816,26 +855,26 @@ int ioreq_server_get_frame(struct domain *d, ioserv=
id_t id,
>       if ( rc )
>           goto out;
>   
> -    switch ( idx )
> +    if ( idx =3D=3D XENMEM_resource_ioreq_server_frame_bufioreq )
>       {
> -    case XENMEM_resource_ioreq_server_frame_bufioreq:
>           rc =3D -ENOENT;
>           if ( !HANDLE_BUFIOREQ(s) )
>               goto out;
>   
>           *mfn =3D vmap_to_mfn(s->bufioreq.va);
>           rc =3D 0;
> -        break;
> +    }
> +    else if ( idx >=3D XENMEM_resource_ioreq_server_frame_ioreq(0) &&
> +              idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pa=
ges(d)) )
> +    {
> +        unsigned int page_idx =3D idx - XENMEM_resource_ioreq_server_fra=
me_ioreq(0);
>   
> -    case XENMEM_resource_ioreq_server_frame_ioreq(0):
> -        *mfn =3D vmap_to_mfn(s->ioreq.va);
> +        ASSERT(page_idx < nr_ioreq_pages(d));
> +        *mfn =3D vmap_to_mfn(s->ioreq.va + page_idx * PAGE_SIZE);
>           rc =3D 0;
> -        break;
> -
> -    default:
> -        rc =3D -EINVAL;
> -        break;
>       }
> +    else
> +        rc =3D -EINVAL;
>   
>    out:
>       rspin_unlock(&d->ioreq_server.lock);
> diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
> index d63fa4729e..d2a08c2371 100644
> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -35,6 +35,18 @@ struct ioreq_vcpu {
>       bool             pending;
>   };
>   
> +/*
> + * Maximum number of ioreq pages, based on the maximum number
> + * of vCPUs and the number of ioreq slots per page.
> + */
> +#define IOREQ_NR_PAGES_MAX \
> +    DIV_ROUND_UP(HVM_MAX_VCPUS, PAGE_SIZE / sizeof(ioreq_t))
> +
> +static inline unsigned int nr_ioreq_pages(const struct domain *d)
> +{
> +    return DIV_ROUND_UP(d->max_vcpus, PAGE_SIZE / sizeof(ioreq_t));
> +}
> +
>   #define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
>   #define MAX_NR_IO_RANGES  256
>   

Is there anything that would prevent the use of alloc_domheap_pages() to 
allocate a configuous set of pages at once; and vmap_contig() to map it 
in one go.
That also prevents the ioreq pages from being scattered around.

We would lose a few pages by aligning the size into a order, but that 
probably better than the alternatives.

That way, we would only have to keep the base gfn (or first page_info) 
and size of the allocation, and don't have to use a array of mfn nor 
have to reverse the vmap to track it.

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



