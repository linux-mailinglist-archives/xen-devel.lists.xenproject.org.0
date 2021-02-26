Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788C9325BD6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 04:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90036.170239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTUc-0001Jj-RW; Fri, 26 Feb 2021 03:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90036.170239; Fri, 26 Feb 2021 03:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFTUc-0001JK-Nl; Fri, 26 Feb 2021 03:08:38 +0000
Received: by outflank-mailman (input) for mailman id 90036;
 Fri, 26 Feb 2021 03:08:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwhq=H4=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lFTUa-0001JF-UW
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 03:08:37 +0000
Received: from mail-oi1-x22e.google.com (unknown [2607:f8b0:4864:20::22e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e92d2932-b834-483c-8272-89de9c9e0b91;
 Fri, 26 Feb 2021 03:08:36 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w69so8410526oif.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Feb 2021 19:08:36 -0800 (PST)
Received: from thewall (142-79-211-230.starry-inc.net. [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id 7sm1569685otd.46.2021.02.25.19.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:08:35 -0800 (PST)
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
X-Inumbo-ID: e92d2932-b834-483c-8272-89de9c9e0b91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u2FzwyCxUmpQHvHWXPD7VYrKvvcH9DULb+HSsylESE0=;
        b=G57tr7WocuA+HVLqfHi4Gt78eb+XUH/fvStV2yOEjF40RB3HG/iCaTgd0j8y1lvgj2
         GsGwm+h0xV957FtSatyiGK+yMqM8NZpxPfFM9cRY9cyJL8O/l4oGOVI9FTNmQ2YaZqPE
         qd/e6rPErwRISBB/uD+pVxGwCTTcHQJQ6vWxziFL12GEeX7IBaz3qx09RMe939+g6Sy0
         5ft33ILiaLzW6fGp0Mdymfydc7OMxaT10ekKT9LFSdTp2z8EJU8uqkkCuCE7xogj/xBO
         lrK6IDOGihvQlajV2d/4nky5FXlzlrqv1UqjzhUMqFP20dA7iHiuCnhFqEFEjd5ZOF0t
         03hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u2FzwyCxUmpQHvHWXPD7VYrKvvcH9DULb+HSsylESE0=;
        b=oKEk8l0fnYaHRONkrBVWVx1GGWyXWJ7ciCd95LZjCb6VDKFMFLp+AkFfHUP/uclU2q
         tucrCgyJ3e4dR40jRJfAcepBZ9C8/8cY/o5dmVLZ331VlnYiQDPqQ10967vhHy44DyQn
         44qqn8p1wWJn68jFgNV6sRIy8fn1PTE3EdKsOHcOAc4dPGChPsk0Wvkx3fHe1nG8PEjE
         oHN11ziXmbm0v1vOeO6nCIoyPsOR7+FLS7d8EXVx+ezbG3GwwjN3xhFOu8oMo0MTCxzn
         utjJpHJwJaozQPo7nerd285DfpFGuL3EGJHB4HD3hH37Hl+bMfoJsTyfRlHAaWQ4kWQ0
         G5UA==
X-Gm-Message-State: AOAM5317CdM4wqx3ud26ekq7o/gKQyUlqKdOMXJX2ZYQqOIhbI/q4YVJ
	IMvz2Fhozzhb6019+knNmPE=
X-Google-Smtp-Source: ABdhPJzQUAqZ9ttedxveHAm0mlZ/D7/A3GWf+WoiWjSeDKfVEl6STsz4pV6LquIQDSm3Gy+SNCgl7w==
X-Received: by 2002:a54:4803:: with SMTP id j3mr669494oij.124.1614308915821;
        Thu, 25 Feb 2021 19:08:35 -0800 (PST)
Date: Thu, 25 Feb 2021 20:08:33 -0700
From: Connor Davis <connojdavis@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-next 3/6] xen/sched: Fix build when NR_CPUS == 1
Message-ID: <20210226030833.uugfojf5kkxhlpr7@thewall>
References: <cover.1614265718.git.connojdavis@gmail.com>
 <d0922adc698ab76223d76a0a7f328a72cedf00ad.1614265718.git.connojdavis@gmail.com>
 <b4ad0f83-e071-49f8-17a8-7fec0e226b9a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4ad0f83-e071-49f8-17a8-7fec0e226b9a@suse.com>

On Thu, Feb 25, 2021 at 04:50:02PM +0100, Jan Beulich wrote:
> On 25.02.2021 16:24, Connor Davis wrote:
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
> 
> I'm not convinced a compiler warning is due here, and in turn
> I'm not sure we want/need to work around this the way you do.

It seems like a reasonable warning to me, but of course I'm open
to dealing with it in a different way.

> First question is whether that's just a specific compiler
> version that's flawed. If it's not just a special case (e.g.

The docker container uses gcc 10.2.0 from
https://github.com/riscv/riscv-gnu-toolchain

> some unreleased version) we may want to think of possible
> alternatives - the addition looks really odd to me.
> 
> Jan

    Connor

