Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CE6gHfYQp2k0cwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:48:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D16211F41A2
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:48:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244959.1544304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxSvH-0000CS-V2; Tue, 03 Mar 2026 16:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244959.1544304; Tue, 03 Mar 2026 16:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxSvH-0000AS-SN; Tue, 03 Mar 2026 16:48:39 +0000
Received: by outflank-mailman (input) for mailman id 1244959;
 Tue, 03 Mar 2026 16:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JEzs=BD=bounce.vates.tech=bounce-md_30504962.69a710df.v1-3bceb4a3bd1844479c02f3bb66892b6a@srs-se1.protection.inumbo.net>)
 id 1vxSvG-0000AK-Q6
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 16:48:38 +0000
Received: from mail177-30.suw61.mandrillapp.com
 (mail177-30.suw61.mandrillapp.com [198.2.177.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfea8744-1720-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Mar 2026 17:48:32 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-30.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4fQMFC1GGQzP0K0dQ
 for <xen-devel@lists.xenproject.org>; Tue,  3 Mar 2026 16:48:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3bceb4a3bd1844479c02f3bb66892b6a; Tue, 03 Mar 2026 16:48:31 +0000
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
X-Inumbo-ID: cfea8744-1720-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772556511; x=1772826511;
	bh=eUNoRhcDYCL60wG3kvxrWXAIPmTJ6jPDfNoSt1z/f7I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1S7GZ6RgiqZbcYlkph67vL4+CyQo/kNVNwLFzKuXg+lM0weV9P1h6MK0ijeLaNBd7
	 p1vAVfWQA7A/9lreNfoy/WafDEZfWsPQeyS/hKQS0ANfQqrmlVW8Ie7Cc6FpzD8jl8
	 oPuQ+oTLgo9fRpLg91FSHkZdZYOuJXx19GKmHxAePKKEtO94Lse4JSZXIroHMSQCXA
	 b5MoUyFMmzr9ip5gVjY9II10G+3CNYvM7ATrDOv7dcZ/ekyuIZh+ikthYazuR3Zp59
	 HV6HCL55qOUvRXdavoj3+J67/KoF79niXVHPKD+KgAEXO4qunEMpY0kSxZ/4WZT9v0
	 K2iEmgky2HFSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772556511; x=1772817011; i=julian.vetter@vates.tech;
	bh=eUNoRhcDYCL60wG3kvxrWXAIPmTJ6jPDfNoSt1z/f7I=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tI8lpF4roZ57dmZia2VEbDCLBkOrjzqw3uyE33hPglJRzOr1ZB2RFMMaIsgXVYKs4
	 SXttZhBw4lW9G1rIJ0xhRrUntSEE/wwplMkmcC6o/89Ie/5FJFjqfvtcVlDB0nYob0
	 nuFp67ufMnZsfFpSfUfSxAUQy6CzJ7fzIfHcC9M2tZ+3l81RlbjfFnT+UIoScvaVBz
	 frOKkSIYXHyofsMa5kVnNmeOISnHWjSBXLv3pSglZUIDaWFdnv+gtjDKOeaA0dy0HM
	 wkiS9BiyYDwdIBt3uNYPhoGSjOgeHmRJyQEBDxd3RyIbqPEU4tL/1KhUg5oyw/ztK1
	 gCmDZwtUNrM7w==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/2]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772556509850
Message-Id: <151c64e9-a605-410a-b3b0-2c86cdf6fd2c@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260223093831.475769-1-julian.vetter@vates.tech> <20260223093831.475769-2-julian.vetter@vates.tech> <c9126823-7c90-40bb-9fd1-c5649ffdb5cd@suse.com>
In-Reply-To: <c9126823-7c90-40bb-9fd1-c5649ffdb5cd@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3bceb4a3bd1844479c02f3bb66892b6a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260303:md
Date: Tue, 03 Mar 2026 16:48:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D16211F41A2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:url,vates.tech:mid];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.307];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 2/26/26 16:54, Jan Beulich wrote:
> On 23.02.2026 10:38, Julian Vetter wrote:
>> A single shared ioreq page provides PAGE_SIZE/sizeof(ioreq_t) = 128
>> slots, limiting HVM guests to 128 vCPUs. To support more vCPUs, extend
>> the ioreq server to use xvzalloc_array() for allocating a contiguous
>> virtual array of ioreq_t slots sized to d->max_vcpus, backed by
>> potentially non-contiguous physical pages.
>>
>> For the GFN-mapped path (x86), page and writable type references are
>> obtained directly via check_get_page_from_gfn() and get_page_type() for
>> each GFN. The pages are then combined into a single contiguous VA using
>> vmap(). The number of ioreq pages is computed at runtime via
>> nr_ioreq_pages(d) = DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE), so
>> small VMs only allocate one page. All existing single-page paths
>> (bufioreq, legacy clients) remain unchanged.
>>
>> Mark the now-unused shared_iopage_t in the public header as deprecated.
> 
> For this I think we need to settle on one of two options: Either it was a
> mistake that this was used in the hypervisor (and added to the public
> interface), in which case the removal of the use may want to be separate
> (without, imo, any need to mark the item deprecated in the public header,
> as the property remains). Or we deem it legitimate / useful, in which case
> you would want to continue using it (in struct ioreq_server).
> 

Thank you Jan for you feedback! It's very appreciated! You're right. But 
I'm wondering how would dropping the struct work? I looked into QEMU and 
varstored, and they both use this struct at the moment. But 
modifications to both of them would be minimal if we decide to drop the 
struct. And if they want to support multiple ioreq pages we would need 
to modify this struct anyway to not contain a single struct ioreq, but a 
pointer or [].

>> @@ -89,6 +91,39 @@ static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
>>       return hvm_alloc_legacy_ioreq_gfn(s);
>>   }
>>   
>> +static gfn_t hvm_alloc_ioreq_gfns(struct ioreq_server *s,
>> +                                  unsigned int nr_pages)
>> +{
>> +    struct domain *d = s->target;
>> +    unsigned long mask;
>> +    unsigned int i, run;
>> +
>> +    if ( nr_pages == 1 )
>> +        return hvm_alloc_ioreq_gfn(s);
>> +
>> +    /* Find nr_pages consecutive set bits */
>> +    mask = d->arch.hvm.ioreq_gfn.mask;
>> +
>> +    for ( i = 0, run = 0; i < BITS_PER_LONG; i++ )
>> +    {
>> +        if ( !test_bit(i, &mask) )
>> +            run = 0;
>> +        else if ( ++run == nr_pages )
>> +        {
>> +            /* Found a run - clear all bits and return base GFN */
>> +            unsigned int start = i - nr_pages + 1;
>> +            unsigned int j;
>> +
>> +            for ( j = start; j <= i; j++ )
>> +                clear_bit(j, &d->arch.hvm.ioreq_gfn.mask);
> 
> You using clear_bit() here doesn't make the while operation atomic. There will
> need to be synchronization (also with hvm_alloc_ioreq_gfn()), and once that's
> there (or if things are suitably synchronized already) __clear_bit() ought to
> suffice here.

Yes, sorry. I will drop the "legacy gfn multi page" part entirely. In 
your other reply you wrote: "Thinking about it - isn't this GFN based 
approach the legacy one? Can't we demand use of the resource mapping 
approach to support bigger guests?"
I didn't fully understand this path is the legacy path. So, I adapted it 
as well. Now, it's clear to me and I agree with your assement. I will 
remove the part for the legacy path, and will just check that if we take 
it, in 'hvm_map_ioreq_gfn' I will do:

if ( nr_ioreq_pages(d) > 1 )
     return -EOPNOTSUPP;

> 
>> +            return _gfn(d->arch.hvm.ioreq_gfn.base + start);
>> +        }
>> +    }
>> +
>> +    return INVALID_GFN;
>> +}
> 
> Did you consider whether fragmentation could get in the way here, as is usually
> the case when doing mixed-size allocations from a single pool? In how far is it
> necessary for the GFNs used to be consecutive?

Same as above. I will remove this part.

> 
>> @@ -134,16 +181,41 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
>>   
>>           hvm_free_ioreq_gfn(s, iorp->gfn);
>>           iorp->gfn = INVALID_GFN;
>> +        return;
>>       }
>> +
>> +    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
>> +        return;
>> +
>> +    nr_pages = nr_ioreq_pages(s->target);
>> +
>> +    for ( i = 0; i < nr_pages; i++ )
>> +    {
>> +        struct page_info *pg = vmap_to_page((char *)s->ioreq +
> 
> Please can you preferably cast to const void * (or void *)? But perhaps you
> would better latch the pointer into a local variable anyway, for ...
> 
>> +                                            i * PAGE_SIZE);
>> +
>> +        put_page_and_type(pg);
>> +        put_page(pg);
> 
>> +    }
>> +    vunmap(s->ioreq);
>> +    s->ioreq = NULL;
> 
> ... this clearing to move up ahead of any teardown done.
> 
>> +    hvm_free_ioreq_gfns(s, s->ioreq_gfn, nr_pages);
>> +    s->ioreq_gfn = INVALID_GFN;
> 
> This similarly may want moving up.
> 
> As to the loop body, destroy_ring_for_helper() has put_page_and_type(), but
> no put_page(). Why is this different here?

Yes, sorry. We don't need it here. I dropped it. I now do the same as 
'destroy_ring_for_helper'.

> 
>> @@ -173,30 +245,132 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
>>   
>>           return rc;
>>       }
>> +
>> +    /* ioreq: multi-page with contiguous VA */
>> +    if ( s->ioreq )
>> +    {
>> +        if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
>> +            return -EPERM;
> 
> The comment on the other path at least wants referencing here.
> 
>> +        return 0;
>> +    }
>> +
>> +    if ( d->is_dying )
>> +        return -EINVAL;
>> +
>> +    nr_pages = nr_ioreq_pages(d);
>> +    base_gfn = hvm_alloc_ioreq_gfns(s, nr_pages);
>> +
>> +    if ( gfn_eq(base_gfn, INVALID_GFN) )
>> +        return -ENOMEM;
>> +
>> +    mfns = xmalloc_array(mfn_t, nr_pages);
> 
> Especially when there are only a few MFNs, this dynamic allocation would be
> nice to avoid. If there was a not overly larger upper bound, using a per-CPU
> array might also be an option.
> 
> If the dynamic allocation stays, new code wants to use xvmalloc() and
> friends.

This all goes away for the legacy path we only have a single page so no 
xmalloc_array anymore.

> 
>> +    if ( !mfns )
>> +    {
>> +        hvm_free_ioreq_gfns(s, base_gfn, nr_pages);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    /*
>> +     * Obtain a page reference and writable type reference for each GFN.
>> +     * No per-page VA is needed; all pages are mapped as a single contiguous
>> +     * VA via vmap() below.
>> +     */
> 
> I think this comment wants to mention prepare_ring_for_helper(), so that if
> updates are done there, there's at least a fair chance that people might spot
> that changes need doing here as well.
> 
>> +    for ( i = 0; i < nr_pages; i++ )
>> +    {
>> +        struct page_info *pg;
>> +        p2m_type_t p2mt;
>> +
>> +        rc = check_get_page_from_gfn(d, _gfn(gfn_x(base_gfn) + i),
> 
> gfn_add() please
> 
>> +                                     false, &p2mt, &pg);
>> +        if ( rc )
>> +        {
>> +            if ( rc == -EAGAIN )
>> +                rc = -ENOENT;
>> +            goto fail;
>> +        }
>> +
>> +        if ( !get_page_type(pg, PGT_writable_page) )
>> +        {
>> +            put_page(pg);
>> +            rc = -EINVAL;
>> +            goto fail;
>> +        }
>> +
>> +        mfns[i] = page_to_mfn(pg);
>> +    }
>> +
>> +    /* Map all mfns as single contiguous VA */
>> +    s->ioreq = vmap(mfns, nr_pages);
>> +    if ( !s->ioreq )
>> +    {
>> +        rc = -ENOMEM;
>> +        goto fail;
>> +    }
>> +
>> +    s->ioreq_gfn = base_gfn;
>> +    xfree(mfns);
>> +
>> +    return 0;
>> +
>> + fail:
>> +    while ( i-- > 0 )
>> +    {
>> +        struct page_info *pg = mfn_to_page(mfns[i]);
>> +
>> +        put_page_and_type(pg);
>> +        put_page(pg);
> 
> Same issue here - I can't spot which page reference you're dropping. You
> obtained only one above.

yes, I forgot to call the alloc_domheap_page.
> 
>> @@ -208,6 +382,32 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
>>   
>>           return rc;
>>       }
>> +
>> +    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
>> +        return 0;
>> +
>> +    nr_pages = nr_ioreq_pages(d);
>> +    memset(s->ioreq, 0, nr_pages * PAGE_SIZE);
>> +
>> +    for ( i = 0; i < nr_pages; i++ )
>> +    {
>> +        gfn_t gfn = gfn_add(s->ioreq_gfn, i);
>> +        struct page_info *pg = vmap_to_page((char *)s->ioreq +
>> +                                            i * PAGE_SIZE);
>> +
>> +        rc = p2m_add_page(d, gfn, page_to_mfn(pg), 0, p2m_ram_rw);
>> +        if ( rc )
>> +            /*
>> +             * No rollback of previously added pages: The caller
>> +             * (arch_ioreq_server_disable) has no error handling path,
>> +             * and partial failure here will be cleaned up when the
>> +             * ioreq server is eventually destroyed.
>> +             */
>> +            return rc;
> 
> Shouldn't you continue the loop, to try to add back as many pages as
> you can, so the domain encountering problems later is as unlikely as
> possible (albeit a single missing page is already bad enough)?
> 
>> @@ -260,9 +259,32 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
>>   
>>   static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
>>   {
>> -    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
>> +    struct ioreq_page *iorp;
>>       struct page_info *page;
>>   
>> +    if ( !buf )
>> +    {
>> +        if ( s->ioreq )
>> +        {
>> +            /*
>> +             * If a guest frame has already been mapped (which may happen
>> +             * on demand if ioreq_server_get_info() is called), then
>> +             * allocating a page is not permitted.
>> +             */
>> +            if ( !gfn_eq(s->ioreq_gfn, INVALID_GFN) )
>> +                return -EPERM;
>> +
>> +            return 0;
>> +        }
>> +
>> +        s->ioreq = xvzalloc_array(ioreq_t, s->target->max_vcpus);
>> +
>> +        return s->ioreq ? 0 : -ENOMEM;
> 
> At this point you haven't fulfilled what the function is supposed to be
> doing. The pages you allocate also aren't associated with the domain,
> and you haven't obtained writable references.

yes, sorry, same as above I forgot the call to alloc_domheap_page.
> 
>> @@ -812,26 +861,30 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
>>       if ( rc )
>>           goto out;
>>   
>> -    switch ( idx )
>> +    if ( idx == XENMEM_resource_ioreq_server_frame_bufioreq)
>>       {
>> -    case XENMEM_resource_ioreq_server_frame_bufioreq:
>>           rc = -ENOENT;
>>           if ( !HANDLE_BUFIOREQ(s) )
>>               goto out;
>>   
>>           *mfn = page_to_mfn(s->bufioreq.page);
>>           rc = 0;
>> -        break;
>> -
>> -    case XENMEM_resource_ioreq_server_frame_ioreq(0):
>> -        *mfn = page_to_mfn(s->ioreq.page);
>> -        rc = 0;
>> -        break;
>> +    }
>> +    else if (( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) ) &&
>> +             ( idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pages(d)) ))
>> +    {
>> +        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
>>   
>> -    default:
>>           rc = -EINVAL;
>> -        break;
>> +        if ( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) &&
> 
> You checked this above already, didn't you?
> 
>> +             page_idx < nr_ioreq_pages(d) && s->ioreq )
> 
> The former part of this check also looks redundant with the earlier one.
> 
>> --- a/xen/include/xen/ioreq.h
>> +++ b/xen/include/xen/ioreq.h
>> @@ -19,9 +19,19 @@
>>   #ifndef __XEN_IOREQ_H__
>>   #define __XEN_IOREQ_H__
>>   
>> +#include <xen/macros.h>
>>   #include <xen/sched.h>
>>   
>>   #include <public/hvm/dm_op.h>
>> +#include <public/hvm/ioreq.h>
>> +
>> +/* 4096 / 32 = 128 ioreq slots per page */
>> +#define IOREQS_PER_PAGE  (PAGE_SIZE / sizeof(ioreq_t))
> 
> I think the comment wants dropping, as it would end up wrong / useless for
> page size different from 4k. I'm also not quite sure the #define is overly
> useful, as ...
> 
>> +static inline unsigned int nr_ioreq_pages(const struct domain *d)
>> +{
>> +    return DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE);
> 
> ... this is its only use.
> 
> Jan



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


