Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169FC8D3AA0
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732166.1138032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCL6P-0001qd-22; Wed, 29 May 2024 15:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732166.1138032; Wed, 29 May 2024 15:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCL6O-0001oH-Ut; Wed, 29 May 2024 15:20:32 +0000
Received: by outflank-mailman (input) for mailman id 732166;
 Wed, 29 May 2024 15:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCL6N-0001nJ-6m
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:20:31 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbdea2a0-1dce-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 17:20:29 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-354c5b7fafaso1837521f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 08:20:30 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a1c930esm14934098f8f.84.2024.05.29.08.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 08:20:29 -0700 (PDT)
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
X-Inumbo-ID: fbdea2a0-1dce-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716996029; x=1717600829; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZngnzdVwUETCzNF4W0WI6nHjkGn2lJLP9Y8fUsjVkM=;
        b=nlV19uGNivcEuV4CU1ZZwxWhjoqToojwwLryfAuK22HRLhB9C88R6KEgoiFZptf7ew
         36o1F5bss+egHhrJ9BYXzGtNHppIoc7lbwOtyMGDkLEWi8dZmdEFxENIKeRDF/kMoOa6
         KwWaFicmkPGNwZ5c8rzuIpSYWQVqVAbeRG/rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716996029; x=1717600829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZngnzdVwUETCzNF4W0WI6nHjkGn2lJLP9Y8fUsjVkM=;
        b=dSJy+4SXJvr4R9+ucPsoCmyYlg5/VhO4HrJv4RSdcWFm4TMYlOPuh4qvHWpohJbNPo
         HengI/wR4C1hRn1XXP8GOnljTbpOLQkIkpLMZnFmfzpA4zw3q6DlvwqtTDG2uodcWsRH
         P/hgS5eAu/X26mTydp2YC3qTyy23pH94kQr4NTgOsbDGJ0SqPxLT6Pndg4I+xr3YMS1K
         ClOEhDKBbeRA8YciX9IdOvhfoTs5M/BS/39CrJyo4Lpszu1qrq53u9gRIfehac1JHTal
         CilstBroYdx4DfrBoFliGnMgw3yD5fKT1hRgJPdy07IMI92+K/G9CzFQDC/ZbDaGqZn8
         mwHg==
X-Forwarded-Encrypted: i=1; AJvYcCVx6WktvrwYG+SwhEKD4fmy3l11lNxbWXBiEXO4OhDd+b076qXIZrYi6/ikffuR1jwvMDUKyjwyfZ0ujxS+urx0skO1/EkNUFuSlE9o68A=
X-Gm-Message-State: AOJu0YzlWWffVPoHtOjiMIa6O96LCMU/O6yZQ2JYwzxbB1YENXiigfkd
	oTiC8/Ld9F0N6aizDaJrEhDrXIKUUNOp4bRmYx+X1eQVZa5pLrOwNHWrV9v9cT0=
X-Google-Smtp-Source: AGHT+IGg4nxxVTkPZuL3F8YUOV6oczXJrhH85Qfkwhqm3yRfXpCC9vdY2G2LU2F5xavIlL1l1KOZEw==
X-Received: by 2002:a5d:58ed:0:b0:355:7ab:2a84 with SMTP id ffacd0b85a97d-3552fde1980mr10303633f8f.49.1716996029334;
        Wed, 29 May 2024 08:20:29 -0700 (PDT)
Date: Wed, 29 May 2024 17:20:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH for-4.19 2/9] xen/cpu: do not get the CPU map in
 stop_machine_run()
Message-ID: <ZldHvAW_2nqAuWcq@macbook>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-3-roger.pau@citrix.com>
 <7954b3c2-e101-4db0-b317-a6585a6a8689@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7954b3c2-e101-4db0-b317-a6585a6a8689@suse.com>

On Wed, May 29, 2024 at 03:04:13PM +0200, Jan Beulich wrote:
> On 29.05.2024 11:01, Roger Pau Monne wrote:
> > The current callers of stop_machine_run() outside of init code already have the
> > CPU maps locked, and hence there's no reason for stop_machine_run() to attempt
> > to lock again.
> 
> While purely from a description perspective this is okay, ...
> 
> > --- a/xen/common/stop_machine.c
> > +++ b/xen/common/stop_machine.c
> > @@ -82,9 +82,15 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
> >      BUG_ON(!local_irq_is_enabled());
> >      BUG_ON(!is_idle_vcpu(current));
> >  
> > -    /* cpu_online_map must not change. */
> > -    if ( !get_cpu_maps() )
> > +    /*
> > +     * cpu_online_map must not change.  The only two callers of
> > +     * stop_machine_run() outside of init code already have the CPU map locked.
> > +     */
> 
> ... the "two" here is not unlikely to quickly go stale; who knows what PPC
> and RISC-V will have as their code becomes more complete?
> 
> I'm also unconvinced that requiring ...
> 
> > +    if ( system_state >= SYS_STATE_active && !cpu_map_locked() )
> 
> ... this for all future (post-init) uses of stop_machine_run() is a good
> idea. It is quite a bit more natural, to me at least, for the function to
> effect this itself, as is the case prior to your change.

This is mostly a pre-req for the next change that switches
get_cpu_maps() to return false if the current CPU is holding the CPU
maps lock in write mode.

IF we don't want to go this route we need a way to signal
send_IPI_mask() when a CPU hot{,un}plug operation is taking place,
because get_cpu_maps() enough is not suitable.

Overall I don't like the corner case where get_cpu_maps() returns true
if a CPU hot{,un}plug operation is taking place in the current CPU
context.  The guarantee of get_cpu_maps() is that no CPU hot{,un}plug
operations can be in progress if it returns true.

Thanks, Roger.

