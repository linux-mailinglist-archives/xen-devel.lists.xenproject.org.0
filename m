Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893A37E0326
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 13:49:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627148.978044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qytay-0006Qk-I9; Fri, 03 Nov 2023 12:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627148.978044; Fri, 03 Nov 2023 12:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qytay-0006O1-FT; Fri, 03 Nov 2023 12:48:16 +0000
Received: by outflank-mailman (input) for mailman id 627148;
 Fri, 03 Nov 2023 12:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUT0=GQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qytaw-0006Nv-Nr
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 12:48:14 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fa22fe7-7a47-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 13:48:12 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c50fbc218bso25107271fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Nov 2023 05:48:12 -0700 (PDT)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05600c35d200b00401e32b25adsm2430774wmq.4.2023.11.03.05.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 05:48:11 -0700 (PDT)
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
X-Inumbo-ID: 3fa22fe7-7a47-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699015692; x=1699620492; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6z/CTwPVft9YxHQEffNlGVJ0NKXctBcOJcHsTZxNVdc=;
        b=C551k5yW5pSAVqyWUfIBnX1YdRmi/Ez+QH6y8N8SENk+jNQaoEg6rg7QU31yh++5nb
         cm40lrb5/gRZUzfswTu6hefvScmHbe9bhFXg1M+jkVPQaYVBQII7SJ1qVZsZjXsjXqpG
         Zx54napjCt/ALIZNpe0AQuw4iA9RWuuv16Ea4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699015692; x=1699620492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6z/CTwPVft9YxHQEffNlGVJ0NKXctBcOJcHsTZxNVdc=;
        b=NyJ5jEP04YO4jdEBkB/F1NaEutcJWvtRpuapIguf9U+i+3dQLYgeddaaI81ULFq4G+
         EcJ6lI2YHPaSy/C9emx+4Ky1kbh+nYMRMk/NI8Yo+Iam4QdCc550zbNQlEzzaQ6/pQ8g
         TAhXeEpEgRH6CPeeHbrZaCBIuppbGX0Q4hcUBK3UjROODbeTndMYgkI6O5TfWyKeOnBq
         FWxc4xWKzA2IjXfDdzi7aWUSyiYMAN+Oh7JGFxZdN0yxUwUe3Rh4Ho0xsoIQY22krvqM
         3HU+5Tw/j/RllRVdXoEGv8q84QrOw9o/ymbbcTyfzN25JkunDnu0B+Jp8J49iJkTybY9
         tRSg==
X-Gm-Message-State: AOJu0YyOX3V5UKZKEcmdQ7rkbRFA22VpiqEcFE8qHEJprPBbC0ge1oG8
	YB+3Gw1Ux0Iyx25pduRevBHiFg==
X-Google-Smtp-Source: AGHT+IHt2PjZulTb+AjCXvBlqginVjGhxzWBe2YVNUqReAkCZplB0PKrHMvuhMZyNGqfWY75/FAJFQ==
X-Received: by 2002:a05:651c:207:b0:2c5:1867:b0b7 with SMTP id y7-20020a05651c020700b002c51867b0b7mr15785511ljn.25.1699015691758;
        Fri, 03 Nov 2023 05:48:11 -0700 (PDT)
Date: Fri, 3 Nov 2023 13:48:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/x2apic: introduce a mixed physical/cluster mode
Message-ID: <ZUTsCjVYXQzJVVJi@macbook>
References: <20231031145259.77199-1-roger.pau@citrix.com>
 <e6ec9635-4856-6f3b-88f6-d1baddad4741@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e6ec9635-4856-6f3b-88f6-d1baddad4741@suse.com>

On Thu, Nov 02, 2023 at 02:38:09PM +0100, Jan Beulich wrote:
> On 31.10.2023 15:52, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/genapic/x2apic.c
> > +++ b/xen/arch/x86/genapic/x2apic.c
> > @@ -180,6 +180,29 @@ static const struct genapic __initconstrel apic_x2apic_cluster = {
> >      .send_IPI_self = send_IPI_self_x2apic
> >  };
> >  
> > +/*
> > + * Mixed x2APIC mode: use physical for external (device) interrupts, and
> > + * cluster for inter processor interrupts.  Such mode has the benefits of not
> > + * sharing the vector space with all CPUs on the cluster, while still allowing
> > + * IPIs to be more efficiently delivered by not having to perform an ICR write
> > + * for each target CPU.
> > + */
> > +static const struct genapic __initconstrel apic_x2apic_mixed = {
> > +    APIC_INIT("x2apic_mixed", NULL),
> > +    /*
> > +     * NB: IPIs use the send_IPI_{mask,self} hooks only, other fields are
> > +     * exclusively used by external interrupts and hence are set to use
> > +     * Physical destination mode handlers.
> > +     */
> > +    .int_delivery_mode = dest_Fixed,
> > +    .int_dest_mode = 0 /* physical delivery */,
> > +    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
> > +    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
> > +    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> > +    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
> > +    .send_IPI_self = send_IPI_self_x2apic
> > +};
> 
> I'm afraid the comment is still misleading in one respect: The .init_apic_ldr
> hook is also set to its Clustered mode handler (and validly so). As before my
> suggestion would be to leverage that we're using dedicated initializers here
> and have a Physical mode portion and a Clustered mode one, each clarifying in
> a brief leading comment where/how the handlers are used.

I've split this as:

/*
 * Mixed x2APIC mode: use physical for external (device) interrupts, and
 * cluster for inter processor interrupts.  Such mode has the benefits of not
 * sharing the vector space with all CPUs on the cluster, while still allowing
 * IPIs to be more efficiently delivered by not having to perform an ICR write
 * for each target CPU.
 */
static const struct genapic __initconstrel apic_x2apic_mixed = {
    APIC_INIT("x2apic_mixed", NULL),
    /*
     * The following fields are exclusively used by external interrupts and
     * hence are set to use Physical destination mode handlers.
     */
    .int_delivery_mode = dest_Fixed,
    .int_dest_mode = 0 /* physical delivery */,
    .vector_allocation_cpumask = vector_allocation_cpumask_phys,
    .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
    /*
     * The following fields are exclusively used by IPIs and hence are set to
     * use Cluster Logical destination mode handlers.  Note that init_apic_ldr
     * is not used by IPIs, but the per-CPU fields it initializes are only used
     * by the IPI hooks.
     */
    .init_apic_ldr = init_apic_ldr_x2apic_cluster,
    .send_IPI_mask = send_IPI_mask_x2apic_cluster,
    .send_IPI_self = send_IPI_self_x2apic
};

Pending whether the usage of some of the fields in connect_bsp_APIC()
can be removed.

Thanks, Roger.

