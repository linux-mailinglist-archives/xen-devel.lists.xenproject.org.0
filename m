Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4289995154
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 16:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813160.1225980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syB4E-0004HD-5K; Tue, 08 Oct 2024 14:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813160.1225980; Tue, 08 Oct 2024 14:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syB4E-0004DI-1d; Tue, 08 Oct 2024 14:20:02 +0000
Received: by outflank-mailman (input) for mailman id 813160;
 Tue, 08 Oct 2024 14:20:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NioN=RE=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1syB4C-00046T-Lv
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 14:20:00 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6621b78c-8580-11ef-99a2-01e77a169b0f;
 Tue, 08 Oct 2024 16:19:58 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so7783411e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 07:19:58 -0700 (PDT)
Received: from EMEAENGAAD91498 ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e8145b8sm511780266b.225.2024.10.08.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 07:19:57 -0700 (PDT)
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
X-Inumbo-ID: 6621b78c-8580-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728397198; x=1729001998; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ly/H240SVE3aP56lLZibBqlGTjhAjXksO5m7IpCVeeA=;
        b=FYGS0JAg5erV9WVhU9pUfr75mcnSJxdE56eANfBKCiK5ucuiO61kpWSTk5XaEJKu2l
         DAxFaTbb0cXT3vXY64lhjmNF4rW2df/tPmtz3vntknkT3EwHF9GN2XRmNMzkJ2Aow2De
         SlzV8D9JCqgmClnx+ShKkAQwOAv7aSBm5Dje4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397198; x=1729001998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ly/H240SVE3aP56lLZibBqlGTjhAjXksO5m7IpCVeeA=;
        b=sNruvk+z6LVZbfB64x+bvZ+SSC2ClyeTRxAWhWUQyg3dSF5pPGCRaULOfzBPhAPc3J
         cV8vYhc8s8CYCcisnFfqNk3Pp8M3zTqDF2gmhfwmwFzeqQFFIqXM+rmdpG6oxnXzbm83
         5iYd2gXnGMxO/A4izq0plRvxwofG94E2xf0azmtliHKSdx9NNI5e7yIGlrJkZrw4jpVT
         DffEi0wBA7Vi+l+W0hq96yr2GrXJyIzNEFJp/2XdsKSs7YrWS2FO/7nTRg5NxblAQqVQ
         8mIvE/xYIMh82ANZwLGwOYB6RVWeBzsrmcFvK8d9ic3x3wSWhUvqSM9KrSR6277HoBdG
         yB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQHA0z8TD/fQcWWZFXbNxrqa31gXoU7cdQ5dx/KrjZTpxAIXspdpdKRSpxzWW4SUY8X5X8VhPRc3M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhoC2bDuV2ao7TxyGwMSov3RXcfedZqdiEj7CwMUzsg1NvDyMM
	RnPI4x17EHCRsbBS+/axWa3VarEKqTZ25UlyHTjVwH/4LIxSOw6p4JdHq7oKZWw=
X-Google-Smtp-Source: AGHT+IFvQl0/JPSRqTdYCJvOVzbQiBqb+LD0kIKz7cogjPRmPr+clclewLzggZqCrgW63braPXQevg==
X-Received: by 2002:a05:6512:3e01:b0:530:aea3:4659 with SMTP id 2adb3069b0e04-539ab84a2f2mr8609531e87.9.1728397198155;
        Tue, 08 Oct 2024 07:19:58 -0700 (PDT)
Date: Tue, 8 Oct 2024 15:19:52 +0100
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/APIC: Switch flat driver to use phys dst for ext
 ints
Message-ID: <rr7iespn4r23lbzgobw3vwduwza3a6ii7rkw2jjagpebz4bzzb@b34z676rcaou>
References: <0db68e62ffc428f553a30397df1e79068d26bb5f.1728311378.git.matthew.barnes@cloud.com>
 <4e493976-549d-4c63-8fc6-61479ceebe9b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e493976-549d-4c63-8fc6-61479ceebe9b@suse.com>

On Tue, Oct 08, 2024 at 03:47:41PM +0200, Jan Beulich wrote:
> On 07.10.2024 16:34, Matthew Barnes wrote:
> > --- a/xen/arch/x86/include/asm/genapic.h
> > +++ b/xen/arch/x86/include/asm/genapic.h
> > @@ -44,29 +44,11 @@ extern const struct genapic apic_bigsmp;
> >  void cf_check send_IPI_self_legacy(uint8_t vector);
> >  
> >  void cf_check init_apic_ldr_flat(void);
> > -unsigned int cf_check cpu_mask_to_apicid_flat(const cpumask_t *cpumask);
> > +const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
> 
> Why does this decl move to between two flat decls, rather than ...
> 
> >  void cf_check send_IPI_mask_flat(const cpumask_t *cpumask, int vector);
> > -const cpumask_t *cf_check vector_allocation_cpumask_flat(int cpu);
> > -#define GENAPIC_FLAT \
> > -	.int_delivery_mode = dest_LowestPrio, \
> > -	.int_dest_mode = 1 /* logical delivery */, \
> > -	.init_apic_ldr = init_apic_ldr_flat, \
> > -	.vector_allocation_cpumask = vector_allocation_cpumask_flat, \
> > -	.cpu_mask_to_apicid = cpu_mask_to_apicid_flat, \
> > -	.send_IPI_mask = send_IPI_mask_flat, \
> > -	.send_IPI_self = send_IPI_self_legacy
> >  
> >  void cf_check init_apic_ldr_phys(void);
> >  unsigned int cf_check cpu_mask_to_apicid_phys(const cpumask_t *cpumask);
> >  void cf_check send_IPI_mask_phys(const cpumask_t *mask, int vector);
> > -const cpumask_t *cf_check vector_allocation_cpumask_phys(int cpu);
> 
> ... staying where it was, next to other phys ones?

My bad, it's a remnant from an older version of this patch.
There's no reason for the declaration to move.

- Matt

