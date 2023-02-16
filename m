Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 061876997D7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 15:50:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496589.767411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfZK-0007Gf-8o; Thu, 16 Feb 2023 14:49:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496589.767411; Thu, 16 Feb 2023 14:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfZK-0007ED-5h; Thu, 16 Feb 2023 14:49:06 +0000
Received: by outflank-mailman (input) for mailman id 496589;
 Thu, 16 Feb 2023 14:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybaS=6M=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pSfZH-0007E7-Me
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 14:49:04 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bb40a5e-ae09-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 15:49:00 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso4435493wms.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Feb 2023 06:48:59 -0800 (PST)
Received: from horizon (lfbn-gre-1-210-185.w90-112.abo.wanadoo.fr.
 [90.112.171.185]) by smtp.gmail.com with ESMTPSA id
 a4-20020a05600c348400b003df5be8987esm5631000wmq.20.2023.02.16.06.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:48:57 -0800 (PST)
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
X-Inumbo-ID: 0bb40a5e-ae09-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbcwOI6QCFT+xxiW7wlkzeD2YXX+nd7ZaVAqHfsbFuM=;
        b=dOe0xofmqlFsYGTxOMJ75iMCNOkHaUr+dWd3EKnk6nZL8kc7SQxYPBdIIz6Pq2BTBu
         LE02eOS7KmNJ0gecNTYjPF0Xr5SjB9v9qX+obuVu+RyhMWzBZGtWuonmEih/XRmGvR3X
         mKX3b63sNH43NbPbN5pO+HxMq2+0LTeMfcGqJLLkf9lvI2mkRvpfIXbCur2pPlBoU8t7
         L8zMdsd1+OZ05BZD7qhyxX8TcFQlqI2uDNRGs0z7TJaHfARyb2vtEctLhAe4nU5gt6DR
         FUcM8Z86eE2PfDzYQAVymNDL+Htj//doLxzs041qu9XWlgj2vkjG3korSkCi1OlwSKBr
         bvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbcwOI6QCFT+xxiW7wlkzeD2YXX+nd7ZaVAqHfsbFuM=;
        b=8K/U4pS3Zvf0nOw1c0Pnf5DvHB4Ok2/q+ocSFL/3vs+ty4zSGNZ+sU+9cYq1VZ11TO
         nJfX9rX/8REneYsTGbslijQbuDIrsUDyfUlIbLucOQKI9zaOsZDwqQU3C0uCpwRaUuZm
         ySMhYmgF6a5nG/GowdPHQ7bme0s6mKl+M9hGlnfK4dA8t73EQPi8NuwtoKo1GWmZjMAD
         9u0AUbXvA2IAvXD1HtNW/jNd8g7Nx0Qmi1hePoIhGRKAs+l5fsg/yxDcyo6hQHXhf10x
         rRnu2IpBi+BndP8l2wPt1N7vfJz6nCObNrOONQPI6PJ4aZr15BM/64E85pb+fKwdWlF/
         hzFw==
X-Gm-Message-State: AO0yUKX0qGha0/p5HkwbU79fcYegNG7O/U88caaeFmb7nPskRHU2FQJG
	zGc9WwLmEQVai8jkYaH78qA=
X-Google-Smtp-Source: AK7set9vqTDmx23r4clfb/ixU6dBGVMEAyKwi5DBQBPXCkwuNbvHV1BPOxRJV6vQ9ynZlcTBL1D7rQ==
X-Received: by 2002:a05:600c:180a:b0:3df:e41f:8396 with SMTP id n10-20020a05600c180a00b003dfe41f8396mr5045161wmp.37.1676558938671;
        Thu, 16 Feb 2023 06:48:58 -0800 (PST)
Date: Thu, 16 Feb 2023 15:48:56 +0100
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH v2 1/2] xen/memory : Add a stats_table resource type
Message-ID: <20230216144856.GA2137216@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <283a8095-3046-3324-3e8a-8671dc1ee8e7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <283a8095-3046-3324-3e8a-8671dc1ee8e7@suse.com>

Hello Jan and thanks for your comments. I addressed most of the them but
I've still some questions. Please find my questions below:

On Tue, Dec 13, 2022 at 06:02:55PM +0100, Jan Beulich wrote:
> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> > This commit proposes a new mechanism to query the RUNSTATE_running counter for
> > a given vcpu from a dom0 userspace application. This commit proposes to expose
> > that counter by using the acquire_resource interface. The current mechanism
> > relies on the XEN_DOMCTL_getvcpuinfo and holds a single global domctl_lock for
> > the entire hypercall; and iterate over every vcpu in the system for every
> > update thus impacting operations that share that lock.
> > 
> > This commit proposes to expose vcpu RUNSTATE_running via the
> > xenforeignmemory interface thus preventing to issue the hypercall and holding
> > the lock. For that purpose, a new resource type named stats_table is added. The
> > first frame of this resource stores per-vcpu counters. The frame has one entry
> > of type struct vcpu_stats per vcpu. The allocation of this frame only happens
> > if the resource is requested. The frame is released after the domain is
> > destroyed.
> > 
> > Note that the updating of this counter is in a hot path, thus, in this commit,
> > copying only happens if it is specifically required.
> > 
> > Note that the exposed structure is extensible in two ways. First, the structure
> > vcpu_stats can be extended with new per-vcpu counters while it fits in a frame.
> 
> I'm afraid I don't see how this is "extensible". I would recommend that
> you outline for yourself how a change would look like to actually add
> such a 2nd counter. While doing that keep in mind that whatever changes
> you make may not break existing consumers.
> 
> It's also not clear what you mean with "fits in a frame": struct
> shared_vcpustatspage is a container for an array with a single element.
> I may guess (looking at just the public interface) that this really is
> meant to be a flexible array (and hence should be marked as such - see
> other uses of XEN_FLEX_ARRAY_DIM in the public headers). Yet if that's
> the case, then a single page already won't suffice for a domain with
> sufficiently many vCPU-s.
> 

I taclked this by using "d->max_vcpus" to calculate the number of required frames
to allocate for a given guest. Also, I added a new type-specific resource named
XENMEM_resource_stats_table_id_vcpustats to host per-vcpu counters. I
completely forgot the "id" in the previous series.

> > Second, new frames can be added in case new counters are required.
> 
> Are you talking of "new counters" here which aren't "new per-vcpu
> counters"? Or else what's the difference from the 1st way?

Yes, I was talking about that sort of counters. In the next series, that sort
of counters could be added by adding a new type-specific resource id.

> 
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -741,6 +741,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
> >  
> >      ioreq_server_destroy_all(d);
> >  
> > +    stats_free_vcpu_mfn(d);
> 
> How come this lives here? Surely this new feature should be not only
> guest-type independent, but also arch-agnostic? Clearly you putting
> the new data in struct domain (and not struct arch_domain or yet
> deeper in the hierarchy) indicates you may have been meaning to make
> it so.
> 

The whole feature shall to be guest-type independent and also arch-agnostic.
Would it be better to put it at xen/common/domain.c:domain_kill()?
 
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -1078,6 +1078,12 @@ unsigned int ioreq_server_max_frames(const struct domain *d)
> >      return nr;
> >  }
> >  
> > +unsigned int stats_table_max_frames(const struct domain *d)
> > +{
> > +    /* One frame per 512 vcpus. */
> > +    return 1;
> > +}
> 
> As alluded to earlier already - 1 isn't going to be suitable for
> arbitrary size domains. (Yes, HVM domains are presently limited to
> 128 vCPU-s, but as per above this shouldn't be a HVM-only feature.)
>

I am going to use "d->max_vcpus" to calculate the number of required frames for
per-vcpu counters for a given guest.
 
> > @@ -1162,6 +1171,88 @@ static int acquire_vmtrace_buf(
> >      return nr_frames;
> >  }
> >  
> > +void stats_free_vcpu_mfn(struct domain * d)
> > +{
> > +    struct page_info *pg = d->vcpustats_page.pg;
> > +
> > +    if ( !pg )
> > +        return;
> > +
> > +    d->vcpustats_page.pg = NULL;
> > +
> > +    if ( d->vcpustats_page.va )
> > +        unmap_domain_page_global(d->vcpustats_page.va);
> > +
> > +    d->vcpustats_page.va = NULL;
> 
> We ought to gain UNMAP_DOMAIN_PAGE_GLOBAL() for purposes like this one,
> paralleling UNMAP_DOMAIN_PAGE().
> 

I do not understand this comment. Could you elaborate it?

> > +    put_page_alloc_ref(pg);
> > +    put_page_and_type(pg);
> > +}
> > +
> > +static int stats_vcpu_alloc_mfn(struct domain *d)
> > +{
> > +    struct page_info *pg;
> > +
> > +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> > +
> > +    if ( !pg )
> > +        return -ENOMEM;
> > +
> > +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
> 
> Style: Brace placement (more elsewhere).
> 
> > +        put_page_alloc_ref(pg);
> 
> This is not allowed when what you may put is the last reference.
> See other examples we have in the tree.
> 

I do not understand this comment. Could you point me to an example? I used
ioreq_server_alloc_mfn() as example but it may not be a good example. 

> > +        return -ENODATA;
> > +    }
> > +
> > +    d->vcpustats_page.va = __map_domain_page_global(pg);
> > +    if ( !d->vcpustats_page.va )
> > +        goto fail;
> > +
> > +    d->vcpustats_page.pg = pg;
> > +    clear_page(d->vcpustats_page.va);
> 
> I guess this should happen before you globally announce the
> address.
> 

If I understand correctly, I should invoke clear_page() before I assign the
address to "d->vcpustats_page.va". Am I right?

> > +    return 1;
> 
> Functions returning -errno on error want to return 0 on success,
> unless e.g. multiple success indicators are needed.
> 
> > +fail:
> 
> Style: Label indentation.
> 
> > +    put_page_alloc_ref(pg);
> > +    put_page_and_type(pg);
> > +
> > +    return -ENOMEM;
> > +}
> > +
> > +static int acquire_stats_table(struct domain *d,
> > +                                unsigned int id,
> > +                                unsigned int frame,
> > +                                unsigned int nr_frames,
> > +                                xen_pfn_t mfn_list[])
> 
> Style: Indentation.
> 
> > +{
> > +    mfn_t mfn;
> > +    int rc;
> > +    unsigned int i;
> > +
> > +    if ( !d )
> > +        return -ENOENT;
> > +
> > +    for ( i = 0; i < nr_frames; i++ )
> > +    {
> > +        switch ( i )
> > +        {
> > +        case XENMEM_resource_stats_frame_vcpustats:
> 
> Isn't this supposed to be indexed by "id" (which presently you ignore
> altogether, which can't be right)?

I forgot the "id". I added a new type-specific resource id in the next
series. 

> 
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -264,6 +264,8 @@ static inline void vcpu_runstate_change(
> >  {
> >      s_time_t delta;
> >      struct sched_unit *unit = v->sched_unit;
> > +    shared_vcpustatspage_t * vcpustats_va;
> 
> Style: Stray blank (more elsewhere).
> 
> > @@ -287,6 +289,20 @@ static inline void vcpu_runstate_change(
> >      }
> >  
> >      v->runstate.state = new_state;
> > +
> > +    vcpustats_va = (shared_vcpustatspage_t*)d->vcpustats_page.va;
> 
> There should be no need for a cast here.
> 
> > +    if ( vcpustats_va )
> > +    {
> > +	vcpustats_va->vcpu_info[v->vcpu_id].version =
> 
> Style: Hard tab.
> 
> > +	    version_update_begin(vcpustats_va->vcpu_info[v->vcpu_id].version);
> > +        smp_wmb();
> > +        memcpy(&vcpustats_va->vcpu_info[v->vcpu_id].runstate_running_time,
> > +               &v->runstate.time[RUNSTATE_running],
> > +               sizeof(v->runstate.time[RUNSTATE_running]));
> 
> Why memcpy() and not a plain assignment?
> 
> > +        smp_wmb();
> > +        vcpustats_va->vcpu_info[v->vcpu_id].version =
> > +            version_update_end(vcpustats_va->vcpu_info[v->vcpu_id].version);
> > +    }
> 
> Overall latching &vcpustats_va->vcpu_info[v->vcpu_id] into a helper
> variable would likely help readability quite a bit.
> 
> > --- a/xen/include/public/vcpu.h
> > +++ b/xen/include/public/vcpu.h
> > @@ -235,6 +235,22 @@ struct vcpu_register_time_memory_area {
> >  typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
> >  DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
> >  
> > +struct vcpu_stats{
> 
> Style: Missing blank.
> 
> > +    /* If the least-significant bit of the version number is set then an update
> 
> Style: Comment layout.
> 

Thanks for the comments regarding style.

Matias

