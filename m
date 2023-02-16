Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 052F3699861
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 16:08:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496610.767444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfrJ-00038x-DM; Thu, 16 Feb 2023 15:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496610.767444; Thu, 16 Feb 2023 15:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfrJ-00037F-9z; Thu, 16 Feb 2023 15:07:41 +0000
Received: by outflank-mailman (input) for mailman id 496610;
 Thu, 16 Feb 2023 15:07:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybaS=6M=gmail.com=matiasevara@srs-se1.protection.inumbo.net>)
 id 1pSfrI-00036q-1X
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 15:07:40 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a65e4f04-ae0b-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 16:07:38 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id r2so2146711wrv.7
 for <xen-devel@lists.xenproject.org>; Thu, 16 Feb 2023 07:07:38 -0800 (PST)
Received: from horizon (lfbn-gre-1-210-185.w90-112.abo.wanadoo.fr.
 [90.112.171.185]) by smtp.gmail.com with ESMTPSA id
 f3-20020adffcc3000000b002c559626a50sm1639991wrs.13.2023.02.16.07.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 07:07:36 -0800 (PST)
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
X-Inumbo-ID: a65e4f04-ae0b-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ANFFwi9DGJyiK5BAiCUNxp6zn6Ko4Szul0X7on6YAZo=;
        b=DM5w8qrm3c8AfxTjYH+3XETsQzdV+AkYtVOztBbLeQRxib1OX+ZBHIcqRIveSJ7eW0
         LBUKm+qoN3XeAlyZxfLZ7D7cOaeJR78FMbxVranWbJbhsMQaL+I2EMpvsvwdurqOXPYa
         s7uihutXrtx/8lfldAnv7U+y02oWlhW+bx2p4KDSh3pa4MhbRDxuHrp0F8qhLn+z4XAm
         ZZfKKT2l40j2EJvlIOVGdlN/Mesayv1DSTYaDe0O/bWV/7bpJOLToyTz64tM1jpv/guU
         8TknH9bHIOwEwrwgqhFedOEmJhmYFzEW9XOKW2q+KuznbvAGpJzdatqQJqwffimSdHFc
         kcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANFFwi9DGJyiK5BAiCUNxp6zn6Ko4Szul0X7on6YAZo=;
        b=O6uchdk+sA7Qhqoj6PmZzVb6lAmb5HVScrIV7glniMENXBuiW0pgq0pASPSDfIJR7i
         Nrm5DkRicLTUtIVPUnp1QlGrRTSrbR8Ib0D5bT07iHyMATxPQ7gLmlrbpSFFlfWYLLyb
         V04/4TGTMge2njGaDx58GlcLYGurGYg16FOdx8KxzAhw7pVw1vyrqC+CBw1zBpoNE3nT
         UY0/OoT6foXmt2ebGRfAu1mybByp5xWKC4sO4pQYIfPoQ4b7821wr1FRvDruLIhCHJPl
         JYqtETD0r6gRAXlNTjpANJSMos7XNHe+amlizaMnGFu1rR4xX4oHtwj0CKXCXCOvWSU0
         10ew==
X-Gm-Message-State: AO0yUKUyYyn74xBE3p3N9rGzCrcpmjKFJiXx+aeukfIb+n20Uq6cwC36
	lnlnxQyf7Uij4eqH5ceI4+8=
X-Google-Smtp-Source: AK7set9biJ33haA8caNkAWuGrSF7RrR3SwpGtODKlwQ6P/7YoxZyMjIX2lImPCCB1uL9xEIsmfLV7g==
X-Received: by 2002:a05:6000:43:b0:2c5:561e:808e with SMTP id k3-20020a056000004300b002c5561e808emr4834240wrx.12.1676560057177;
        Thu, 16 Feb 2023 07:07:37 -0800 (PST)
Date: Thu, 16 Feb 2023 16:07:34 +0100
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
Message-ID: <20230216150734.GB2137216@horizon>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <af6032c9f5863b7e6fb183a0a197407ec92bb067.1665138677.git.matias.vara@vates.fr>
 <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b59b6466-8d06-f7af-beb9-3c38c638a455@suse.com>

On Wed, Dec 14, 2022 at 08:29:53AM +0100, Jan Beulich wrote:
> On 07.10.2022 14:39, Matias Ezequiel Vara Larsen wrote:
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -1078,6 +1078,12 @@ unsigned int ioreq_server_max_frames(const struct domain *d)
> >       return nr;
> >  }
> >  
> > +unsigned int stats_table_max_frames(const struct domain *d)
> > +{
> > +    /* One frame per 512 vcpus. */
> > +    return 1;
> > +}
> 
> Beyond my earlier comment (and irrespective of this needing changing
> anyway): I guess this "512" was not updated to match the now larger
> size of struct vcpu_stats?

In the next series, I am calculating the number of frames by:

nr = DIV_ROUND_UP(d->max_vcpus * sizeof(struct vcpu_stats), PAGE_SIZE);

> 
> > +static int stats_vcpu_alloc_mfn(struct domain *d)
> > +{
> > +    struct page_info *pg;
> > +
> > +    pg = alloc_domheap_page(d, MEMF_no_refcount);
> 
> The ioreq and vmtrace resources are also allocated this way, but they're
> HVM-specific. The one here being supposed to be VM-type independent, I'm
> afraid such pages will be accessible by an "owning" PV domain (it'll
> need to guess the MFN, but that's no excuse).
> 
> > +    if ( !pg )
> > +        return -ENOMEM;
> > +
> > +    if ( !get_page_and_type(pg, d, PGT_writable_page) ) {
> > +        put_page_alloc_ref(pg);
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
> Beyond my earlier comment: I think that by the time the surrounding
> hypercall returns the page ought to contain valid data. Otherwise I
> see no way for the consumer to know from which point on the data is
> going to be valid.
> 
> > @@ -287,6 +289,20 @@ static inline void vcpu_runstate_change(
> >      }
> >  
> >      v->runstate.state = new_state;
> > +
> > +    vcpustats_va = (shared_vcpustatspage_t*)d->vcpustats_page.va;
> > +    if ( vcpustats_va )
> > +    {
> > +	vcpustats_va->vcpu_info[v->vcpu_id].version =
> > +	    version_update_begin(vcpustats_va->vcpu_info[v->vcpu_id].version);
> > +        smp_wmb();
> > +        memcpy(&vcpustats_va->vcpu_info[v->vcpu_id].runstate_running_time,
> > +               &v->runstate.time[RUNSTATE_running],
> > +               sizeof(v->runstate.time[RUNSTATE_running]));
> > +        smp_wmb();
> > +        vcpustats_va->vcpu_info[v->vcpu_id].version =
> > +            version_update_end(vcpustats_va->vcpu_info[v->vcpu_id].version);
> > +    }
> 
> A further aspect to consider here is cache line ping-pong. I think the
> per-vCPU elements of the array want to be big enough to not share a
> cache line. The interface being generic this presents some challenge
> in determining what the supposed size is to be. However, taking into
> account the extensibility question, maybe the route to take is to
> simply settle on a power-of-2 value somewhere between x86'es and Arm's
> cache line sizes and the pretty common page size of 4k, e.g. 512 bytes
> or 1k?
> 

I do not now how to address this. I was thinking to align each vcpu_stats
instance to a multiple of the cache-line. I would pick up the first multiple
that is bigger to the size of the vcpu_stats structure. For example, currently
the structure is 16 bytes so I would align each instance in a frame to 64
bytes. Would it make sense? 

> > --- a/xen/include/public/vcpu.h
> > +++ b/xen/include/public/vcpu.h
> > @@ -235,6 +235,22 @@ struct vcpu_register_time_memory_area {
> >  typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
> >  DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
> >  
> > +struct vcpu_stats{
> > +    /* If the least-significant bit of the version number is set then an update
> > +     * is in progress and the guest must wait to read a consistent set of values
> > +     * This mechanism is similar to Linux's seqlock.
> > +     */
> > +    uint32_t version;
> > +    uint32_t pad0;
> > +    uint64_t runstate_running_time;
> > +};
> > +
> > +struct shared_vcpustatspage {
> > +    struct vcpu_stats vcpu_info[1];
> > +};
> > +
> > +typedef struct shared_vcpustatspage shared_vcpustatspage_t;
> 
> For new additions please avoid further name space issues: All types
> and alike want to be prefixed by "xen_".
>

Should I name it "xen_shared_vcpustatspage_t" instead?

Matias 

