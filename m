Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1284ACE0E6
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 17:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005626.1385034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpdx-0004q1-Or; Wed, 04 Jun 2025 15:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005626.1385034; Wed, 04 Jun 2025 15:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMpdx-0004na-La; Wed, 04 Jun 2025 15:03:05 +0000
Received: by outflank-mailman (input) for mailman id 1005626;
 Wed, 04 Jun 2025 15:03:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xa+O=YT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uMpdw-0004nU-6L
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 15:03:04 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 034eb98e-4155-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 17:03:03 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a375888297so751084f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jun 2025 08:03:03 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-450d7f8f1e7sm203568925e9.1.2025.06.04.08.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 08:03:01 -0700 (PDT)
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
X-Inumbo-ID: 034eb98e-4155-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749049383; x=1749654183; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0mgaArX06BoKL6s7D0jsLiXeLtQCXCOHLwG4c5t2ENg=;
        b=RnwkeUu96J8ZcNoB6HdZVuljB94mCN85b3C4KnxAzVslOxTauqTBHwZtbpwz/q2+zt
         zKDd4XPPNOOTkJw+MBEUbLHMf1gukcLL84xAvQEjIpDGeWt5JCU+ivYu3vDlZSHYXM99
         aHdupp7dzbQYwMgz+VtgFvtTRxZAX/r8cFCcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749049383; x=1749654183;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mgaArX06BoKL6s7D0jsLiXeLtQCXCOHLwG4c5t2ENg=;
        b=Zfr24dSR+KTWtkoyn9IsE01Ye8Y4kPhUIR3hqoJLWJ0ZU0nMHZRENKajo98aBZIxAG
         hxdXqgw7Y7t9li2ndccih3rUA1Vvmrci8mAxoggT8iDITNSj5Jwk85WG5mYFHbyEMsHF
         GGMmPkf93FG/Z81YQYf0s8pf8pZj9F/MItKXJVeen+jUJf5Q+y9Z7csozHiO0LsXSIYf
         KMR+4QUuC97ByTO0DmzEWzeKPkKvRS2p4lzhhglXIkO5F3WKdJ/w/2MHlPUA8vJD4xG4
         AIesIayAJ+gjC2tzr5TjCftWjiowdZ7mdbE7pA6EJN2k5YrxMLbgrdsiPnw+zf3vwmOz
         ofGA==
X-Forwarded-Encrypted: i=1; AJvYcCXAjbwsGPKyKRr9TciR4NeMiR0lHTwTTpzX2hnDhIcfOTinTT7dUOkOzgbBWw2SYUBn7O8ou5q324o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywodec6RWOE6dwu4TUpWfZ4wg8QFsMH1OXu/sQGdVIWM/MmoZcx
	RmimKAgfedalNFHsbwjr1HJHccEaKD2lH3efe+YuyYaUFMc5HxA9oxuOZSGaqfK0g4M=
X-Gm-Gg: ASbGnct9mupz5JnA3DkizfqfOtNcS9cHghMxcuDOFAPQcz4gE9fNQv+QWSx07FdDiEk
	8HpMT+kEnhoB534fRTEsTFykep0L2lEyFcDXxdtcs+gv+qfQjjjEDZEtpTU6wCIhpaRHeFUvl2R
	ZYj7C/vSPcqF/mJHeu5Lk8N8zkCO8+pykNLL69oepNZ+8uZDeMEaShH6+c5macNEQBfjL/AkIp3
	+q2JYzsbhLd3IfPy/2/z1DmPpbn6vtTiGmShU45i0urhhIKNZY0ObWnlA9Bm+3usJWbqtQL/ktX
	p39vDzlqHvugH7Yv0+4fobI8VG3ONsQzYMN+ZcA79cbLjszCDlPqpOZhN6CwRzsaMEDjW2N+MFC
	coawPcKUBou2kImuxP2Q=
X-Google-Smtp-Source: AGHT+IHiJjB0kJuY7q6ie9oSM6rLZ2lrNKWeiotz3Y1wEEbeSFBBk0RSbNnmot7MSXg/0azUFaxnVg==
X-Received: by 2002:a05:6000:250d:b0:3a4:da0e:517a with SMTP id ffacd0b85a97d-3a5141a819amr6829958f8f.23.1749049382197;
        Wed, 04 Jun 2025 08:03:02 -0700 (PDT)
Date: Wed, 4 Jun 2025 17:03:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/numa: introduce per-NUMA node flush locks
Message-ID: <aEBgJExBUtjviPJZ@macbook.local>
References: <20250522084815.825-1-roger.pau@citrix.com>
 <20250522084815.825-3-roger.pau@citrix.com>
 <d3856421-59ce-4cd1-9fc5-ad330bf760ca@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3856421-59ce-4cd1-9fc5-ad330bf760ca@suse.com>

On Wed, Jun 04, 2025 at 02:35:01PM +0200, Jan Beulich wrote:
> On 22.05.2025 10:48, Roger Pau Monne wrote:
> > Contention around the global flush_lock increases as the amount of physical
> > CPUs on the host also increases.  Sadly this doesn't scale on big boxes.
> > However most of the time Xen doesn't require broadcasting flushes to all
> > CPUs on the system, and hence more fine grained (ie: covering less CPUs)
> > locks could be used.
> > 
> > A natural boundary to use when splitting the locks are NUMA nodes.  Most
> > domains will be limited to running on a single node, specifically the one
> > where the domain memory has been allocated from.  Flushes related to
> > domains are most likely to be limited to a single NUMA node, and hence
> > being able to execute per-node flushes allows to reduce the contention
> > around the global flush_lock, while also allowing to perform concurrent
> > flushes on different nodes.
> > 
> > This however doesn't come for free.  A new vector must be allocated to be
> > used for the per-NUMA flushes, and more logic is required in the flush
> > dispatcher to figure out whether a flush is limited to a single node.
> > 
> > The figures on a 2-node NUMA system are as follows, after having been
> > running the same XenRT boot storm workload for 90 minutes.
> > 
> > Without the per-NUMA node flush:
> > 
> > Global flush_lock: addr=ffff82d040837340, lockval=d8ded8de, not locked
> >   lock:21878876(98178042228), block:1603338(6043805110)
> > 
> > So a total block time of ~6s, and average block time of 3.7us.
> > 
> > With the per-node locks:
> > 
> > Global flush_lock: addr=ffff82d040837360, lockval=78e678e6, not locked
> >   lock:6781028(41032945811), block:583712(2025657239)
> > NUMA node 1 flush_lock: addr=ffff832fd085b110, lockval=5cd65cd6, not locked
> >   lock:220374(766500536), block:4091(9933129)
> > NUMA node 0 flush_lock: addr=ffff8310336a7110, lockval=5c715c71, not locked
> >   lock:547953(1658170241), block:23856(51266297)
> > 
> > The total block time goes down to ~2s, and the average block time is 3.4us.
> > The total block time of the per-node locks is much lower compared to the
> > global flush_lock, 9ms and 51ms respectively.
> > 
> > Note the example here is possibly the system where such split locks don't
> > make a lot of difference, being a 2 node system, but still there's a
> > non-trivial difference between the block times.  On a 4 or 9 node system
> > the figures should likely be even better.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> The savings must be from TLB flushes only? Cache flushes, as we have discussed
> recently, need to be global anyway, and hence there are no savings to be had.
> This may want reflecting the subject and/or description.

Yeah, it's only TLB flushes.

> > @@ -126,3 +129,95 @@ int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
> >  
> >      return 0;
> >  }
> > +
> > +static struct arch_numa_node {
> > +    const void *flush_va;
> > +    unsigned int flush_flags;
> > +    cpumask_t flush_mask;
> > +    spinlock_t flush_lock;
> > +    struct lock_profile_qhead profile_head;
> > +} *node_info[MAX_NUMNODES];
> 
> __ro_after_init or at least __read_mostly?

__ro_after_init would be OK I think.

> > +static int __init cf_check arch_numa_init(void)
> > +{
> > +    unsigned int i;
> > +
> > +    if ( num_online_nodes() == 1 )
> > +        return 0;
> > +
> > +    for_each_online_node ( i )
> > +    {
> > +        struct arch_numa_node *node =
> > +            alloc_xenheap_pages(get_order_from_bytes(sizeof(*node)),
> > +                                                     MEMF_node(i));
> 
> A full page for what may cover just a cacheline or two? I realize ...
> 
> > +        if ( node )
> > +            clear_page(node);
> > +        else
> > +            node = xvzalloc(typeof(*node));
> 
> ... this (sadly) still has no NUMA-capable counterpart, but I'd have expected
> at least a brief comment to justify.

Oh, yes, it should better have a comment.

> > +void cf_check invalidate_tbl_numa(void)
> 
> Nit: s/tbl/tlb/ ?
> 
> > +bool flush_numa_node(const cpumask_t *mask, const void *va, unsigned int flags)
> > +{
> > +    nodeid_t node = num_online_nodes() > 1 ? cpumask_to_node(mask)
> > +                                           : NUMA_NO_NODE;
> > +    struct arch_numa_node *info;
> > +
> > +    if ( node == NUMA_NO_NODE )
> > +        return false;
> > +
> > +    info = node_info[node];
> > +
> > +    if ( !info )
> > +        return false;
> > +
> > +    spin_lock(&info->flush_lock);
> > +    cpumask_and(&info->flush_mask, mask, &cpu_online_map);
> > +    cpumask_clear_cpu(smp_processor_id(), &info->flush_mask);
> 
> IOW this function is strictly a helper of flush_area_mask(), relying on
> the local CPU to have had its flushing done already. Might it not be
> better if this was put as a static in smp.c then? Or, to keep struct
> arch_numa_node local to this file, split it into two parts?
> 
> > +    info->flush_va = va;
> > +    info->flush_flags = flags;
> > +    send_IPI_mask(&info->flush_mask, INVALIDATE_NUMA_VECTOR);
> 
> This one similarly depends on flush_area_mask() behavior, not calling here
> when mask has solely the local CPU set.
> 
> > --- a/xen/common/numa.c
> > +++ b/xen/common/numa.c
> > @@ -689,6 +689,29 @@ static int __init cf_check numa_setup(const char *opt)
> >  }
> >  custom_param("numa", numa_setup);
> >  
> > +/*
> > + * Return the NUMA node index if all CPUs in the mask belong to the same node,
> > + * otherwise return NUMA_NO_NODE.
> > + */
> > +nodeid_t cpumask_to_node(const cpumask_t *mask)
> > +{
> > +    unsigned int cpu;
> > +    nodeid_t node = NUMA_NO_NODE;
> > +
> > +    if ( num_online_nodes() == 1 )
> > +        return cpu_to_node[0];
> 
> The sole caller checks this already, so strictly speaking Misra would consider
> this dead / unreachable code.
> 
> Similarly Misra may not like this on Arm, where it's unused right now. Then
> again looks like NUMA work there was abandoned, so for now all ought to be
> fine here.

Thanks, given the feedback I think you consider this an improvement
worth pursuing then?

Regards, Roger.

