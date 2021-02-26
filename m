Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B501A325BD0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 04:01:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90032.170227 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTNr-00018Q-31; Fri, 26 Feb 2021 03:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90032.170227; Fri, 26 Feb 2021 03:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTNq-000181-Vc; Fri, 26 Feb 2021 03:01:38 +0000
Received: by outflank-mailman (input) for mailman id 90032;
 Fri, 26 Feb 2021 03:01:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwhq=H4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFTNq-00017w-02
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 03:01:38 +0000
Received: from mail-oi1-x22e.google.com (unknown [2607:f8b0:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a031f4d3-db69-4b53-ad69-665e2ab7306e;
 Fri, 26 Feb 2021 03:01:37 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id 18so8342943oiz.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 19:01:37 -0800 (PST)
Received: from thewall (142-79-211-230.starry-inc.net. [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id d26sm382988oos.32.2021.02.25.19.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:01:36 -0800 (PST)
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
X-Inumbo-ID: a031f4d3-db69-4b53-ad69-665e2ab7306e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iINldmOWG2GYwKGJ8xJW8Kn/cIvnI4L/9E7gMqDXLGo=;
        b=Eko+GlZUJ4kImAI3OsL7br6qICAJb/CbZqo61bDXHqomMgOHQG6DpjKVamM0m58EHp
         puMGLkIlRcvd7DWM0ISfAxDABRx4PP5Qse1LG0htr5BSTIXWYRmGAocwiueO9l8I2ule
         4szYXjVBBjxD+uh3+lyood+qLejgRPYRmnlb1ywib3R/Xfv022a5RhSJFxSukzIN3Ho6
         asFSElfuOERGv9yfc708TsVfLB3TBG/q5ZHi9b667HhJcYFfCZKc4ypnuamaWkHForkz
         oe+pIhoMX/ij3Gb41dEfLbvxL3InTL7k18+h/Rm3tM9QqXniTGFpUGcUxHShOhT5rcsX
         OX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iINldmOWG2GYwKGJ8xJW8Kn/cIvnI4L/9E7gMqDXLGo=;
        b=i71dydCcdnKxv+iokXMwAskm87ivehuSOArlFBCLDvyqZsTCblq5RcoBas9vg7p5x5
         WFnrioZcBzj9BIpS7rqxknKS9Q+JJEKBiFymnWIUr4h3jG3vSzRtNYQWLJMWhayWTQ1G
         FpTLupzFT+VCWgwdO77LvD44jTeUVavb7n2G9Pwiie8wLGo4WJhZ4lMm/4VzYtnYJhjw
         qcj69ts9FgJuhRUkuySDwxaBiyP1/6r8On/gAeRxd+Zs+Lkjp/NQvUzKm7s+bpnFBFYX
         jVmbQErpjzyMy3cUquMRf8y6rEV91T0JjnS/PWCrqehlsnN+W9+x33LIzg9QJ4mdvADN
         9dRQ==
X-Gm-Message-State: AOAM533+7tJAPrYmLhMLEk0G7ATtT38rNFnlUw9zKks/sFnSKOu3/rWa
	SM2MO7dHfWd9Vfnyuy5mk+M=
X-Google-Smtp-Source: ABdhPJx95cbTrIArfJ5MeJitpk/4PUk3B7Uh9rRWj77eb3j0vh3216/q5KYw5eCWpS3anxwUNog8wg==
X-Received: by 2002:a05:6808:130d:: with SMTP id y13mr628395oiv.167.1614308496737;
        Thu, 25 Feb 2021 19:01:36 -0800 (PST)
Date: Thu, 25 Feb 2021 20:01:34 -0700
From: Connor Davis <connojdavis@gmail.com>
To: Bob Eshleman <bobbyeshleman@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-next 3/6] xen/sched: Fix build when NR_CPUS == 1
Message-ID: <20210226030134.lj3zi3duf33shoz7@thewall>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
 <71840112-790f-24b9-115c-9030c8521b65@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71840112-790f-24b9-115c-9030c8521b65@gmail.com>

On Thu, Feb 25, 2021 at 02:55:45PM -0800, Bob Eshleman wrote:
> On 2/25/21 7:24 AM, Connor Davis wrote:
> > Return from cpu_schedule_up when either cpu is 0 or
> > NR_CPUS == 1. This fixes the following:
> > 
> > core.c: In function 'cpu_schedule_up':
> > core.c:2769:19: error: array subscript 1 is above array bounds
> > of 'struct vcpu *[1]' [-Werror=array-bounds]
> >  2769 |     if ( idle_vcpu[cpu] == NULL )
> >       |
> > 
> > Signed-off-by: Connor Davis <connojdavis@gmail.com>
> > ---
> >  xen/common/sched/core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > index 9745a77eee..f5ec65bf9b 100644
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -2763,7 +2763,7 @@ static int cpu_schedule_up(unsigned int cpu)
> >      cpumask_set_cpu(cpu, &sched_res_mask);
> >  
> >      /* Boot CPU is dealt with later in scheduler_init(). */
> > -    if ( cpu == 0 )
> > +    if ( cpu == 0 || NR_CPUS == 1 )
> >          return 0;
> >  
> >      if ( idle_vcpu[cpu] == NULL )
> > 
> 
> Interesting.  I wonder when this changed in GCC.
> 
> I haven't yet seen this issue compiling with:
>   NR_CPUS=1
>   ARCH=riscv64
>   riscv64-unknown-linux-gnu-gcc (GCC) 10.1.0
> 
> Which version of GCC are you seeing emit this?

The one from cloned from github.com/riscv/riscv-gnu-toolchain
in the docker container uses 10.2.0

    Connor

