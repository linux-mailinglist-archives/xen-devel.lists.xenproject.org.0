Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A17DBD85
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:11:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625266.974393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUqm-0003Sa-9m; Mon, 30 Oct 2023 16:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625266.974393; Mon, 30 Oct 2023 16:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUqm-0003PS-6x; Mon, 30 Oct 2023 16:10:48 +0000
Received: by outflank-mailman (input) for mailman id 625266;
 Mon, 30 Oct 2023 16:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxUqk-0003PL-AK
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:10:46 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0eca2af-773e-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:10:44 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-53de0d1dc46so7896701a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 09:10:44 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 h29-20020a50cddd000000b0053ff311f388sm6417973edj.23.2023.10.30.09.10.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 09:10:43 -0700 (PDT)
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
X-Inumbo-ID: e0eca2af-773e-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698682244; x=1699287044; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HaxTUT+FOmwcKPdWyAD4f0bzPbIgorWRHMv/Tpkqck0=;
        b=fxLP5W8ASs33PqOcyI0jo7J8WRwAmG5MWI5d2qFSNpA7MA9JTkm/3vtBz7dDRkCXFN
         NqRtmhOwrwkszOKBmPsHWu356umJ6I3i7FLq/BdrvWoZlWusvJEMUwSPAkcaNpRxk9Ta
         cIfhUBOn6Nk4ZPRq8Qa8btfi3LIx/rhHGTQNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698682244; x=1699287044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaxTUT+FOmwcKPdWyAD4f0bzPbIgorWRHMv/Tpkqck0=;
        b=Kb8JMkasJd2gOmOswLpRxkDSfXz9u8GxZkZ5KH0RGBnQfG7Anlg2vGGwmpqenznP6j
         XckU87aywGVOwNjYy0J1cfnW6WqbdrFKKlS7s4q9nrLJwIqWGnCtf4542bfN3NvDId3Y
         Q3sGM4wYOklVUjPFkv1xQAlOvoYqE1r9O5rXRyq5tKrqhpTIciZkJWURZ24iLuvO+15c
         nRJ+ZJk3N60EknxZ4jZ2vgoGRP8CvNtGZZT82VSlnaO4At6WjxuWB/I7h5O/h7qZbUj3
         gln66SfdWTqiyevUBJG/6sZDB4ARGHtLSzvz+IpAHVDBHZCmWYjT9xms/oc2prIiwURo
         6uHA==
X-Gm-Message-State: AOJu0YyYKxSP7iUprQ4VRThrrSi/b65OjMwoDOid4hwA7TcvK0u7LvbU
	Du6IRBWwr/pZRtNagYahZOv3Aw==
X-Google-Smtp-Source: AGHT+IHqZRudvyWCHDL8vpRBAqayRPsLUbU5vAhTVkeOklNrS3rnxXOSPpoJk+hr3tjBemAZZqxdTg==
X-Received: by 2002:a50:9e87:0:b0:53d:a1c0:410f with SMTP id a7-20020a509e87000000b0053da1c0410fmr7395761edf.2.1698682243666;
        Mon, 30 Oct 2023 09:10:43 -0700 (PDT)
Date: Mon, 30 Oct 2023 17:10:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZT_VguxJLtOQeYK1@macbook>
References: <20231024135150.49232-1-roger.pau@citrix.com>
 <6734e477-0aa5-c74c-4f64-02ca0415ae9e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6734e477-0aa5-c74c-4f64-02ca0415ae9e@suse.com>

On Mon, Oct 30, 2023 at 03:32:56PM +0100, Jan Beulich wrote:
> On 24.10.2023 15:51, Roger Pau Monne wrote:
> > The current implementation of x2APIC requires to either use Cluster Logical or
> > Physical mode for all interrupts.  However the selection of Physical vs Logical
> > is not done at APIC setup, an APIC can be addressed both in Physical or Logical
> > destination modes concurrently.
> > 
> > Introduce a new x2APIC mode called mixed, which uses Logical Cluster mode for
> > IPIs, and Physical mode for external interrupts, thus attempting to use the
> > best method for each interrupt type.
> > 
> > Using Physical mode for external interrupts allows more vectors to be used, and
> > interrupt balancing to be more accurate.
> > 
> > Using Logical Cluster mode for IPIs allows less accesses to the ICR register
> > when sending those, as multiple CPUs can be targeted with a single ICR register
> > write.
> > 
> > A simple test calling flush_tlb_all() 10000 times in a tight loop on a 96 CPU
> > box gives the following average figures:
> > 
> > Physical mode: 26617931ns
> > Mixed mode:    23865337ns
> > 
> > So ~10% improvement versus plain Physical mode.
> 
> Nice.
> 
> >  Note that Xen uses Cluster
> > mode by default, and hence is already using the fastest way for IPI delivery at
> > the cost of reducing the amount of vectors available system-wide.
> > 
> > Make the newly introduced mode the default one.
> > 
> > Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Do we want to keep a full Logical Cluster mode available?  I don't see a reason
> > to target external interrupts in Logical Cluster mode, but maybe there's
> > something I'm missing.
> > 
> > It's not clear to me whether the ACPI FADT flags are meant to apply only to
> > external interrupt delivery mode, or also to IPI delivery.  If
> > ACPI_FADT_APIC_PHYSICAL is only meant to apply to external interrupts and not
> > IPIs then we could possibly get rid of physical mode IPI delivery.
> > 
> > Still need to put this under XenServer extensive testing, but wanted to get
> > some feedback before in case approach greatly changes.
> 
> Looks quite okay, just a couple of minor remarks:

Thanks.

Do we still want to keep the pure cluster mode?

We do need to keep the pure Physical mode in case the FADT flags force
us into using it, but there's no flag to force the usage of Logical
destination mode only.

> 
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -2802,6 +2802,14 @@ the watchdog.
> >  
> >  Permit use of x2apic setup for SMP environments.
> >  
> > +### x2apic-mode (x86)
> > +> `= physical | cluster | mixed`
> > +
> > +> Default: `physical` if **FADT** mandates physical mode, `mixed` otherwise.
> > +
> > +In the case that x2apic is in use, this option switches between modes to
> > +address APICs in the system as interrupt destinations.
> > +
> >  ### x2apic_phys (x86)
> >  > `= <boolean>`
> >  
> > @@ -2812,6 +2820,9 @@ In the case that x2apic is in use, this option switches between physical and
> >  clustered mode.  The default, given no hint from the **FADT**, is cluster
> >  mode.
> >  
> > +**WARNING: `x2apic_phys` is deprecated and superseded by `x2apic-mode`.
> > +The later takes precedence if both are set.**
> 
> s/later/latter/ ?
> 
> This may further want a CHANGELOG.md entry.

Yes, indeed.

> > --- a/xen/arch/x86/Kconfig
> > +++ b/xen/arch/x86/Kconfig
> > @@ -228,11 +228,18 @@ config XEN_ALIGN_2M
> >  
> >  endchoice
> >  
> > -config X2APIC_PHYSICAL
> > -	bool "x2APIC Physical Destination mode"
> > -	help
> > -	  Use x2APIC Physical Destination mode by default when available.
> > +choice
> > +	prompt "x2APIC Destination mode"
> > +	default X2APIC_MIXED
> > +	---help---
> 
> No new ---help--- please (also below); it ought to be just help going forward.

In this case we should replace existing instances of ---help---
otherwise I copy from one of those and forgot to adjust.

Kconfig is usually done by copy&paste (at least for me), and hence
having proper format everywhere will make that less error prone.

> > +	  Select APIC addressing when x2APIC is enabled.
> >  
> > +	  The default mode is mixed which should provide the best aspects
> > +	  of both physical and cluster modes.
> > +
> > +config X2APIC_PHYSICAL
> > +       tristate "Physical Destination mode"
> > +	---help---
> 
> Something's odd with indentation here. But first of all - why tristate? We
> don't have modules in Xen.

Ah, yes, got confused.

> 
> > --- a/xen/arch/x86/genapic/x2apic.c
> > +++ b/xen/arch/x86/genapic/x2apic.c
> > @@ -180,6 +180,25 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
> >      .send_IPI_self = send_IPI_self_x2apic
> >  };
> >  
> > +/*
> > + * Mixed x2APIC mode: use physical for external (device) interrupts, and
> > + * cluster for inter processor interrupt.  Such mode has the benefits of not
> > + * sharing the vector space with all CPUs on the cluster, while still allows
> > + * IPIs to be more efficiently delivered by not having to perform an ICR
> > + * write for each target CPU.
> > + */
> > +static const struct genapic __initconstrel apic_x2apic_mixed = {
> > +    APIC_INIT("x2apic_mixed", NULL),
> > +    /* NB: int_{delivery,dest}_mode are only used by non-IPI callers. */
> > +    .int_delivery_mode = dest_Fixed,
> > +    .int_dest_mode = 0 /* physical delivery */,
> > +    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
> > +    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
> > +    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> 
> You have a non-IPI-only comment further up, but that - if in fact 
> applicable here - would need to extend to these two hook functions as
> well.

Yes, all fields except for send_IPI_{mask,self} only apply to external
interrupts, not IPIs. And init_apic_ldr is kind of weird because it
just inits the data related fields in order to do the cluster
delivery, but doesn't clobber any data used by physical mode anyway.

Thanks, Roger.

