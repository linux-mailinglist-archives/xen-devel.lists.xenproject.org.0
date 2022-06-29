Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A7055FC5A
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 11:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357714.586463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6UFJ-0000sH-Ud; Wed, 29 Jun 2022 09:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357714.586463; Wed, 29 Jun 2022 09:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6UFJ-0000qU-Rf; Wed, 29 Jun 2022 09:44:29 +0000
Received: by outflank-mailman (input) for mailman id 357714;
 Wed, 29 Jun 2022 09:44:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=39p8=XE=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1o6UFI-0000qO-AU
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 09:44:28 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 109cf6ef-f790-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 11:44:27 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id v9so5958241wrp.7
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jun 2022 02:44:26 -0700 (PDT)
Received: from horizon ([2a01:e0a:19f:35f0:dde5:d55a:20f5:7ef5])
 by smtp.gmail.com with ESMTPSA id
 bk20-20020a0560001d9400b0021b8b998ca5sm15144659wrb.107.2022.06.29.02.44.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 02:44:25 -0700 (PDT)
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
X-Inumbo-ID: 109cf6ef-f790-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AlQeOmPpUQJBjKBz2Qp4KLbJ9+pcVkvjnIwLu7K9TMg=;
        b=gazambA0KHXnEeskYh5wqWbiGZrhGgzegB+YS3PJB0WPWdhhYJF/yr0z9owwyFxK15
         DyzBdL6EB7DHAbpbSfURhoqPp290OP6A9gN5C1/V8oPZqD/2guK1s2sM7pOJ0W5rHa1h
         n9HYhCEyBMpdYz9xNLZ8sukgXua8ZDXZgEv8pGZ6l7VRNFzh9b5fDYgDaVO4lD5o1ERA
         wrX3yn72HB0VrZXDfDGd0Ief/j/O+l6yF4U8epQionAoQfN2UxmbPTP8i6yetDj1QPTs
         B7sYH1/A0B49zC0o7pgA6BRNOlzHCYKgyR3Qm/EFlfHwTUQ/xAYTcJqMqxDtbOZwGMZN
         D+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AlQeOmPpUQJBjKBz2Qp4KLbJ9+pcVkvjnIwLu7K9TMg=;
        b=v84BVTo0P1n+EoHJORjkcJSUlJTkVaWMwbL2zb/q1UOzpCv9/66LcmQXAW326aO2vS
         3XvaXMX/cYcIUeFYlcnEl1/cKaz/pa8/0o4pVm0bxdFzwiWXhUtZqjEVBa9daYOFWqN1
         IEzyXEzf1SyldiEOXWB/5deE0shJEU51DJ79bgm7G55ZV9MNh5vwqtkAQV3cFi9WoEiW
         Wpzf6f09NKQlsvHo+AJ+LgMQ0In+MbL2BbQIv1HrszcAXL/enRcjT4SNxEhyuUH2NUyp
         kCi6PeYjfxTtQ1pfniEYw/4/yz63HDqE+yQsmR3bt8a/I0jzZJGeyB1PnqT9JSxaV7/4
         D2FQ==
X-Gm-Message-State: AJIora8ZAbEvLo0ML8vIFiN1tiTyS0zSxw3e29KV2sos5dohEILPh0T0
	pX/KTPu8I3Jpej8AEg04U6g=
X-Google-Smtp-Source: AGRyM1sIhUDszCCqY8InATbzKyazV7qIW99Vsxrxj6D6r5NJIZAZusPVchlaw56Dyu14wuO3rI244w==
X-Received: by 2002:a5d:5261:0:b0:21b:8740:382b with SMTP id l1-20020a5d5261000000b0021b8740382bmr2010526wrc.143.1656495866102;
        Wed, 29 Jun 2022 02:44:26 -0700 (PDT)
Date: Wed, 29 Jun 2022 11:44:23 +0200
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 1/2] xen/memory : Add stats_table resource type
Message-ID: <20220629094423.GA250661@horizon>
References: <cover.1652797713.git.matias.vara@vates.fr>
 <d0afb6657b1e78df4857ad7bcc875982e9c022b4.1652797713.git.matias.vara@vates.fr>
 <C9B7EF20-595D-4BCB-8545-F35611B718AF@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C9B7EF20-595D-4BCB-8545-F35611B718AF@citrix.com>

On Fri, Jun 17, 2022 at 08:54:34PM +0000, George Dunlap wrote:
> Preface: It looks like this may be one of your first hypervisor patches.  So thank you!  FYI there’s a lot that needs fixing up here; please don’t read a tone of annoyance into it, I’m just trying to tell you what needs fixing in the most efficient manner. :-)
> 

Thanks for the comments :) I have addressed some of them already in the response to the
cover letter.

> > On 17 May 2022, at 15:33, Matias Ezequiel Vara Larsen <matiasevara@gmail.com> wrote:
> > 
> > Allow to map vcpu stats using acquire_resource().
> 
> This needs a lot more expansion in terms of what it is that you’re doing in this patch and why.
> 

Got it. I'll improve the commit message in v1.

> > 
> > Signed-off-by: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>
> > ---
> > xen/common/domain.c         | 42 +++++++++++++++++++++++++++++++++++++
> > xen/common/memory.c         | 29 +++++++++++++++++++++++++
> > xen/common/sched/core.c     |  5 +++++
> > xen/include/public/memory.h |  1 +
> > xen/include/xen/sched.h     |  5 +++++
> > 5 files changed, 82 insertions(+)
> > 
> > diff --git a/xen/common/domain.c b/xen/common/domain.c
> > index 17cc32fde3..ddd9f88874 100644
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -132,6 +132,42 @@ static void vcpu_info_reset(struct vcpu *v)
> >     v->vcpu_info_mfn = INVALID_MFN;
> > }
> > 
> > +static void stats_free_buffer(struct vcpu * v)
> > +{
> > +    struct page_info *pg = v->stats.pg;
> > +
> > +    if ( !pg )
> > +        return;
> > +
> > +    v->stats.va = NULL;
> > +
> > +    if ( v->stats.va )
> > +        unmap_domain_page_global(v->stats.va);
> > +
> > +    v->stats.va = NULL;
> 
> Looks like you meant to delete the first `va->stats.va = NULL` but forgot?
> 

Apologies for this, I completely missed.

> > +
> > +    free_domheap_page(pg);
> 
> Pretty sure this will crash.
> 
> Unfortunately page allocation and freeing is somewhat complicated and requires a bit of boilerplate.  You can look at the vmtrace_alloc_buffer() code for a template, but the general sequence you want is as follows:
> 
> * On the allocate side:
> 
> 1. Allocate the page
> 
>    pg = alloc_domheap_page(d, MEMF_no_refcount);
> 
> This will allocate a page with the PGC_allocated bit set and a single reference count.  (If you pass a page with PGC_allocated set to free_domheap_page(), it will crash; which is why I said the above.)
> 
> 2.  Grab a general reference count for the vcpu struct’s reference to it; as well as a writable type count, so that it doesn’t get used as a special page
> 
> if (get_page_and_type(pg, d, PGT_writable_page)) {
>   put_page_alloc_ref(p);
>   /* failure path */
> }
> 
> * On the free side, don’t call free_domheap_pages() directly.  Rather, drop the allocation, then drop your own type count, thus:
> 
> v->stats.va <http://stats.va/> = NULL;
> 
> put_page_alloc_ref(pg);
> put_page_and_type(pg);
> 
> The issue here is that we can’t free the page until all references have dropped; and the whole point of this exercise is to allow guest userspace in dom0 to gain a reference to the page.  We can’t actually free the page until *all* references are gone, including the userspace one in dom0.  The put_page() which brings the reference count to 0 will automatically free the page.
> 

Thanks for the explanation. For some reason, this is not crashing. I will
reimplement the allocation, releasing, and then update the documentation that I
proposed at
https://lists.xenproject.org/archives/html/xen-devel/2022-05/msg01963.html. The
idea of this reference document is to guide someone that would like to export a new
resource by relying on the acquire-resource interface. 

> 
> > +}
> > +
> > +static int stats_alloc_buffer(struct vcpu *v)
> > +{
> > +    struct domain *d = v->domain;
> > +    struct page_info *pg;
> > +
> > +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> > +
> > +    if ( !pg )
> > +        return -ENOMEM;
> > +
> > +    v->stats.va = __map_domain_page_global(pg);
> > +    if ( !v->stats.va )
> > +        return -ENOMEM;
> > +
> > +    v->stats.pg = pg;
> > +    clear_page(v->stats.va);
> > +    return 0;
> > +}
> 
> The other thing to say about this is that the memory is being allocated unconditionally, even if nobody is planning to read it.  The vast majority of Xen users will not be running xcp-rrd, so it will be pointless overheard.
> 
> At a basic level, you want to follow suit with the vmtrace buffers, which are only allocated if the proper domctl flag is set on domain creation.  (We could consider instead, or in addition, having a global Xen command-line parameter which would enable this feature for all domains.)
>

I agree. I will add a domctl flag on domain creation to enable the allocation of
these buffers.
 
> > +
> > static void vmtrace_free_buffer(struct vcpu *v)
> > {
> >     const struct domain *d = v->domain;
> > @@ -203,6 +239,9 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
> >  */
> > static int vcpu_teardown(struct vcpu *v)
> > {
> > +
> > +    stats_free_buffer(v);
> > +
> >     vmtrace_free_buffer(v);
> > 
> >     return 0;
> > @@ -269,6 +308,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
> >     if ( vmtrace_alloc_buffer(v) != 0 )
> >         goto fail_wq;
> > 
> > +    if ( stats_alloc_buffer(v) != 0 )
> > +        goto fail_wq;
> > +
> >     if ( arch_vcpu_create(v) != 0 )
> >         goto fail_sched;
> > 
> > diff --git a/xen/common/memory.c b/xen/common/memory.c
> > index 297b98a562..39de6d9d05 100644
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -1099,6 +1099,10 @@ static unsigned int resource_max_frames(const struct domain *d,
> >     case XENMEM_resource_vmtrace_buf:
> >         return d->vmtrace_size >> PAGE_SHIFT;
> > 
> > +    // WIP: to figure out the correct size of the resource
> > +    case XENMEM_resource_stats_table:
> > +        return 1;
> > +
> >     default:
> >         return -EOPNOTSUPP;
> >     }
> > @@ -1162,6 +1166,28 @@ static int acquire_vmtrace_buf(
> >     return nr_frames;
> > }
> > 
> > +static int acquire_stats_table(struct domain *d,
> > +                                unsigned int id,
> > +                                unsigned int frame,
> > +                                unsigned int nr_frames,
> > +                                xen_pfn_t mfn_list[])
> > +{
> > +    const struct vcpu *v = domain_vcpu(d, id);
> > +    mfn_t mfn;
> > +
> 
> Maybe I’m paranoid, but I might add an “ASSERT(nr_frames == 1)” here
>

Thanks, I will have this in mind in v1.
 
> > +    if ( !v )
> > +        return -ENOENT;
> > +
> > +    if ( !v->stats.pg )
> > +        return -EINVAL;
> > +
> > +    mfn = page_to_mfn(v->stats.pg);
> > +    mfn_list[0] = mfn_x(mfn);
> > +
> > +    printk("acquire_perf_table: id: %d, nr_frames: %d, %p, domainid: %d\n", id, nr_frames, v->stats.pg, d->domain_id);
> > +    return 1;
> > +}
> > +
> > /*
> >  * Returns -errno on error, or positive in the range [1, nr_frames] on
> >  * success.  Returning less than nr_frames contitutes a request for a
> > @@ -1182,6 +1208,9 @@ static int _acquire_resource(
> >     case XENMEM_resource_vmtrace_buf:
> >         return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
> > 
> > +    case XENMEM_resource_stats_table:
> > +        return acquire_stats_table(d, id, frame, nr_frames, mfn_list);
> > +
> >     default:
> >         return -EOPNOTSUPP;
> >     }
> > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > index 8f4b1ca10d..2a8b534977 100644
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -264,6 +264,7 @@ static inline void vcpu_runstate_change(
> > {
> >     s_time_t delta;
> >     struct sched_unit *unit = v->sched_unit;
> > +    uint64_t * runstate;
> > 
> >     ASSERT(spin_is_locked(get_sched_res(v->processor)->schedule_lock));
> >     if ( v->runstate.state == new_state )
> > @@ -287,6 +288,10 @@ static inline void vcpu_runstate_change(
> >     }
> > 
> >     v->runstate.state = new_state;
> > +
> > +    // WIP: use a different interface
> > +    runstate = (uint64_t*)v->stats.va;
> 
> I think you should look at xen.git/xen/include/public/hvm/ioreq.h:shared_iopage_t for inspiration.  Basically, you cast the void pointer to that type, and then just access `iopage->vcpu_ioreq[vcpuid]`.   Put it in a public header, and then both the userspace consumer and Xen can use the same structure.
> 

Thanks for pointing it out. I've addresed this comment in the response to the cover
letter.

> As I said in my response to the cover letter, I think vcpu_runstate_info_t would be something to look at and gain inspiration from.
> 
> The other thing to say here is that this is a hot path; we don’t want to be copying lots of information around if it’s not going to be used.  So you should only allocate the buffers if specifically enabled, and you should only copy the information over if v->stats.va <http://stats.va/> != NULL.
> 
> I think that should be enough to start with; we can nail down more when you send v1.
> 

Thanks for the comments, I will tackle them in v1.

Matias

> Peace,
>  -George
> 



