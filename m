Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B82CA15216
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2025 15:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874099.1284943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYnbn-0007ja-Eu; Fri, 17 Jan 2025 14:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874099.1284943; Fri, 17 Jan 2025 14:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYnbn-0007hp-C8; Fri, 17 Jan 2025 14:46:03 +0000
Received: by outflank-mailman (input) for mailman id 874099;
 Fri, 17 Jan 2025 14:46:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wado=UJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tYnbl-0007hj-Sa
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2025 14:46:01 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c47621a4-d4e1-11ef-a0e2-8be0dac302b0;
 Fri, 17 Jan 2025 15:46:00 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43618283d48so14936685e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jan 2025 06:46:00 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c753cc1fsm97868425e9.39.2025.01.17.06.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 06:45:58 -0800 (PST)
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
X-Inumbo-ID: c47621a4-d4e1-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737125160; x=1737729960; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bhZi52Q331IKB83Epo0yLj7+/mxBEWdhynpLcd6BGdA=;
        b=FGE0a3luGV0QG6cTQ8zkkkI/ztzjMu4r51pty1hAGwdUz7+qTkVLg5yj3j9U8huc9G
         PdkvZZC7eUX3loS3I2s523dAPurVCcESWd4PsQuqB8mainmcAgC9ZMnoa0pmVj9GSwJ3
         WcGQ7xKawtg/7Yp5DmOMJEYXLcnVANRu6nhmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737125160; x=1737729960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhZi52Q331IKB83Epo0yLj7+/mxBEWdhynpLcd6BGdA=;
        b=i4BywVDyLCpaQDGsNb8SfgBTsZg6FoeqSO2ze1zvGYNqwTjzyf/1pb6pY9C2jtHwFm
         fqcJkdseU5veAq+qnZEmTjL0mWaTjP1GOrRgBYGvKIHUL/GRQm4loU4zUNeFqBDHLdRF
         x5dHp5JYNXoW4JlJvfap/nLJiPj8sD8jxH2aISzp7Fg38u0sxDbpykhde+owcJ4Eowl3
         5YRAN5cRcSecc4D49Kegp4LzsqPGCRsarPkA6eUrzqvAfutc2dr5aURtdspxCYwXV45l
         bX2YCKCzFmVU165ne/mK9l5dvJt/TVVLES9KY0+9On4CzEkwiBvDo1tEMSUwdT3NolPY
         ZVkg==
X-Forwarded-Encrypted: i=1; AJvYcCU8OeKWOdQDJp+8OprDn4tX+iMkFm0mREY1uKtDsbPxpQ5HGiZqy9MykYblVQwmFWmIPC+lyLp/4Oc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYbII7YRQaHNON/dCTFOgZLDNsts4TbpE8FOgTSBOUfso9sCH2
	mqeNdmAxVBhRoOxV+98oDPlPujxUoK/7icnfpGLbF7VTYR6Tn/ZuZHO1jTg4m2o=
X-Gm-Gg: ASbGncuL9fK0RP4dZEJGF7PgmK8MGO3dsxoK8dXcamzvFXK4PY3AuZlQihRdYle+ZHU
	F+mezNgnDtjiE1BJqafY9qT36uuWXwhyU2GZLVr0tAOhiT85/qANM2VF/CIa91+n1INLuiQ7j8K
	xpHvn6VUi8bb5hRgZE/DUZkrERhhOrBTF+Vks3xiEI1H66jcanhVTpcdxf5OT/pHgAA6Ec/kiCw
	rb3Q/NBGWH8Gjm7ObHYgDsfnyenpa1wVotZ0umDBv5fFIYaAD5t90VrKv1z51maz9A=
X-Google-Smtp-Source: AGHT+IGXo+sI3Hqa/dapJ9upJMjmD+l/zOCOWl4b5b2dJgpzUKXE+WKzXQ/ExOwuxwiqWrM7hEvEVg==
X-Received: by 2002:a05:600c:5486:b0:434:f1e9:afae with SMTP id 5b1f17b1804b1-438913bfa0fmr26368815e9.1.1737125159566;
        Fri, 17 Jan 2025 06:45:59 -0800 (PST)
Date: Fri, 17 Jan 2025 15:45:57 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 00/18] x86: adventures in Address Space Isolation
Message-ID: <Z4ptJWmEwWdGsocD@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <8064a526-3525-4c48-8926-6ea99a8312a6@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8064a526-3525-4c48-8926-6ea99a8312a6@suse.com>

On Tue, Jan 14, 2025 at 05:20:04PM +0100, Jan Beulich wrote:
> On 08.01.2025 15:26, Roger Pau Monne wrote:
> > Hello,
> > 
> > The aim of this series is to introduce the functionality required to
> > create linear mappings visible to a single pCPU.
> > 
> > Doing so requires having a per-vCPU root page-table (L4), and hence
> > requires shadowing the guest selected L4 on PV guests.  As follow ups
> > (and partially to ensure the per-CPU mappings work fine) the CPU stacks
> > are switched to use per-CPU mappings, so that remote stack contents are
> > not by default mapped on all page-tables (note: for this to be true the
> > directmap entries for the stack pages would need to be removed also).
> > 
> > There's one known shortcoming with the presented code: migration of PV
> > guests using per-vCPU root page-tables is not working.  I need to
> > introduce extra logic to deal with PV shadow mode when using unique root
> > page-tables.  I don't think this should block the series however, such
> > missing functionality can always be added as follow up work.
> > paging_domctl() is adjusted to reflect this restriction.
> > 
> > The main differences compared to v1 are the usage of per-vCPU root page
> > tables (as opposed to per-pCPU), and the usage of the existing perdomain
> > family of functions to manage the mappings in the per-domain slot, that
> > now becomes per-vCPU.
> > 
> > All patches until 17 are mostly preparatory, I think there's a nice
> > cleanup and generalization of the creation and managing of per-domain
> > mappings, by no longer storing references to L1 page-tables in the vCPU
> > or domain struct.
> 
> Since you referred me to the cover letter, I've looked back here after
> making some more progress with the series. Along with my earlier comment
> towards the need or ultimate goal, ...
> 
> > Patch 13 introduces the command line option, and would need discussion
> > and integration with the sparse direct map series.  IMO we should get
> > consensus on how we want the command line to look ASAP, so that we can
> > basic parsing logic in place to be used by both the work here and the
> > direct map removal series.
> > 
> > As part of this series the map_domain_page() helpers are also switched
> > to create per-vCPU mappings (see patch 15), which converts an existing
> > interface into creating per-vCPU mappings.  Such interface can be used
> > to hide (map per-vCPU) further data that we don't want to be part of the
> > direct map, or even shared between vCPUs of the same domain.  Also all
> > existing users of the interface will already create per-vCPU mappings
> > without needing additional changes.
> > 
> > Note that none of the logic introduced in the series removes entries for
> > the directmap, so even when creating the per-CPU mappings the underlying
> > physical addresses are fully accessible when using it's direct map
> > entries.
> > 
> > I also haven't done any benchmarking.  Doesn't seem to cripple
> > performance up to the point that XenRT jobs would timeout before
> > finishing, that the only objective reference I can provide at the
> > moment.
> > 
> > The series has been extensively tested on XenRT, but that doesn't cover
> > all possible use-cases, so it's likely to still have some rough edges,
> > handle with care.
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (18):
> >   x86/mm: purge unneeded destroy_perdomain_mapping()
> >   x86/domain: limit window where curr_vcpu != current on context switch
> >   x86/mm: introduce helper to detect per-domain L1 entries that need
> >     freeing
> >   x86/pv: introduce function to populate perdomain area and use it to
> >     map Xen GDT
> >   x86/mm: switch destroy_perdomain_mapping() parameter from domain to
> >     vCPU
> >   x86/pv: set/clear guest GDT mappings using
> >     {populate,destroy}_perdomain_mapping()
> >   x86/pv: update guest LDT mappings using the linear entries
> >   x86/pv: remove stashing of GDT/LDT L1 page-tables
> >   x86/mm: simplify create_perdomain_mapping() interface
> >   x86/mm: switch {create,destroy}_perdomain_mapping() domain parameter
> >     to vCPU
> >   x86/pv: untie issuing FLUSH_ROOT_PGTBL from XPTI
> >   x86/mm: move FLUSH_ROOT_PGTBL handling before TLB flush
> >   x86/spec-ctrl: introduce Address Space Isolation command line option
> >   x86/mm: introduce per-vCPU L3 page-table
> >   x86/mm: introduce a per-vCPU mapcache when using ASI
> >   x86/pv: allow using a unique per-pCPU root page table (L4)
> >   x86/mm: switch to a per-CPU mapped stack when using ASI
> >   x86/mm: zero stack on context switch
> > 
> >  docs/misc/xen-command-line.pandoc    |  24 +++
> >  xen/arch/x86/cpu/mcheck/mce.c        |   4 +
> >  xen/arch/x86/domain.c                | 157 +++++++++++----
> >  xen/arch/x86/domain_page.c           | 105 ++++++----
> >  xen/arch/x86/flushtlb.c              |  28 ++-
> >  xen/arch/x86/hvm/hvm.c               |   6 -
> >  xen/arch/x86/include/asm/config.h    |  16 +-
> >  xen/arch/x86/include/asm/current.h   |  58 +++++-
> >  xen/arch/x86/include/asm/desc.h      |   6 +-
> >  xen/arch/x86/include/asm/domain.h    |  50 +++--
> >  xen/arch/x86/include/asm/flushtlb.h  |   2 +-
> >  xen/arch/x86/include/asm/mm.h        |  15 +-
> >  xen/arch/x86/include/asm/processor.h |   5 +
> >  xen/arch/x86/include/asm/pv/mm.h     |   5 +
> >  xen/arch/x86/include/asm/smp.h       |  12 ++
> >  xen/arch/x86/include/asm/spec_ctrl.h |   4 +
> >  xen/arch/x86/mm.c                    | 291 +++++++++++++++++++++------
> >  xen/arch/x86/mm/hap/hap.c            |   2 +-
> >  xen/arch/x86/mm/paging.c             |   6 +
> >  xen/arch/x86/mm/shadow/hvm.c         |   2 +-
> >  xen/arch/x86/mm/shadow/multi.c       |   2 +-
> >  xen/arch/x86/pv/descriptor-tables.c  |  47 ++---
> >  xen/arch/x86/pv/dom0_build.c         |  12 +-
> >  xen/arch/x86/pv/domain.c             |  57 ++++--
> >  xen/arch/x86/pv/mm.c                 |  43 +++-
> >  xen/arch/x86/setup.c                 |  32 ++-
> >  xen/arch/x86/smp.c                   |  39 ++++
> >  xen/arch/x86/smpboot.c               |  26 ++-
> >  xen/arch/x86/spec_ctrl.c             | 205 ++++++++++++++++++-
> >  xen/arch/x86/traps.c                 |  25 ++-
> >  xen/arch/x86/x86_64/mm.c             |   7 +-
> >  xen/common/smp.c                     |  10 +
> >  xen/common/stop_machine.c            |  10 +
> >  xen/include/xen/smp.h                |   8 +
> >  34 files changed, 1052 insertions(+), 269 deletions(-)
> 
> ... this diffstat (even after subtracting out the contribution of the last two
> patches in the series) doesn't really look like a cleanup / simplification.

To be fair you would need to subtract the contribution of the last 8
patches, as all those are strictly related to ASI.  The perdomain
mapping interface cleanup is just the first 10 patches.  Which leaves
a diffstat of:

 xen/arch/x86/domain.c                |  81 ++++++++++++----
 xen/arch/x86/domain_page.c           |  19 ++--
 xen/arch/x86/hvm/hvm.c               |   6 --
 xen/arch/x86/include/asm/desc.h      |   6 +-
 xen/arch/x86/include/asm/domain.h    |  13 +--
 xen/arch/x86/include/asm/mm.h        |  11 ++-
 xen/arch/x86/include/asm/processor.h |   5 +
 xen/arch/x86/mm.c                    | 175 ++++++++++++++++++++++++++---------
 xen/arch/x86/pv/descriptor-tables.c  |  47 +++++-----
 xen/arch/x86/pv/domain.c             |  24 ++---
 xen/arch/x86/pv/mm.c                 |   3 +-
 xen/arch/x86/smpboot.c               |   6 +-
 xen/arch/x86/traps.c                 |  12 +--
 xen/arch/x86/x86_64/mm.c             |   7 +-
 14 files changed, 260 insertions(+), 155 deletions(-)

That's including the context switch change and not differentiating
between lines of code vs comments.

However, I don't think cleanup / simplifications should be purely
based on diffstat LoC.  Arguably the current
create_perdomain_mapping() set of parameters are not the most obvious
ones:

int create_perdomain_mapping(struct domain *d, unsigned long va,
                             unsigned int nr, l1_pgentry_t **pl1tab,
                             struct page_info **ppg);

Compared to the result after the first 10 patches in the series:

int create_perdomain_mapping(struct vcpu *v, unsigned long va,
                             unsigned int nr, bool populate);

Together with the fact that callers no longer need to keep a reference
to the L1(s) tables to populate such area.

> Things becoming slightly slower (because of the L1 no longer directly available
> to modify) may, otoh, not be a significant issue, if we assume that GDT/LDT
> manipulation isn't normally a very frequent operation.

I introduce a fast path in both {populate,destroy}_perdomain_mapping()
that uses the recursive linear slot for manipulating the L1
page-table.  There's still a slow path that relies on walking the
page-tables, but that should only be used when the vCPU is not
running, and hence the added latency shouldn't be too critical.

As a side-effect of this logic the pages allocated for the per-domain
region page-tables can now uniformly be from domheap.  The usage of
xenheap pages for L1 page-tables is no longer needed once those are
not stashed in the domain structure anymore.

> IOW my earlier request stands: Can you please try to make more clear (in the
> patch descriptions) what exactly the motivation for these changes is? Just
> doing things differently with more code overall can't be it, I don't think.

The main motivation for the change is to remove stashing L1
page-tables for the per-domain area(s) in the domain struct, as with
the introduction of ASI Xen would need to stash L1 page-tables for the
per-domain area on the vcpu struct also, as a result of the per-domain
slot becoming per-vCPU.  IMO managing such references, and having
logic to deal with domain and vcpu L1 page-tables is too complex and
error prone.

Instead I propose to add an interface:
{populate,destroy}_perdomain_mapping() that can be used to manage
mappings on the per-domain area with callers being completely unaware
of whether the domain is running with per-vCPU mappings or not.

Please let me know if you are happy with the reasoning and arguments
provided.  I think the resulting perdomain mapping interface is much
better than what Xen currently does for manipulating per-domain
mapping entries, but I might be spoiled.

Thanks, Roger.

