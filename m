Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F09A78D3B57
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 17:49:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732212.1138103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLXq-0002h4-M1; Wed, 29 May 2024 15:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732212.1138103; Wed, 29 May 2024 15:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCLXq-0002ep-IT; Wed, 29 May 2024 15:48:54 +0000
Received: by outflank-mailman (input) for mailman id 732212;
 Wed, 29 May 2024 15:48:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCLXp-0002ej-Iw
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 15:48:53 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f23f3977-1dd2-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 17:48:52 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6ad7d743147so11467796d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 08:48:52 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ad766b860bsm38247616d6.30.2024.05.29.08.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 08:48:50 -0700 (PDT)
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
X-Inumbo-ID: f23f3977-1dd2-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716997731; x=1717602531; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PgRNgiYIQHb6g+NzeBggleQEhdVe/MdIKlY4mjx5K8A=;
        b=auWgE/i/CXcQd1Iwe2lbrpn2sB08KmqpZMOuxf02omjyHryVdpZ+sX0OifTkoS9bNj
         0UpUOibFjgZAXN+ObO9toxUK2XsoWbyTzk/YbSNEcyRmdWWcExSBSinDNQSst7sVba+O
         5FmSvR3gJUbmUCvhRQKIfsxfzD6etJVgl9c3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716997731; x=1717602531;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgRNgiYIQHb6g+NzeBggleQEhdVe/MdIKlY4mjx5K8A=;
        b=doxOocdehWwCFj1BekNtFbQV37mjJFMdn8fuPdQINc56zqN1K2cXnaELiHODI+SONI
         CRjyJQca+yyYd6M61vLO9yZGMAC+Y6Q4G8ZVVyPmyKHeNsaAC3/nOBPDoZlJln+Cll5U
         1VTkm8iN7kcT/riJ54yYe9c29W8ZRM2U4OSIMO1GKke6X1QQkM5o5ZHbdV1gL3AWOtAc
         44q+b+74TFdOHolLEz47iU/m0n9b6GXkLxOgz+QlMQMFr6KAbVxtclY/6aTS9v4QUQyR
         jorhPBV+LhBXNqcxYP1yxgmKryoVsdXPFt5ozH3vidF3tPigozX6t6FZsfvnx+bE/Gng
         oQqA==
X-Forwarded-Encrypted: i=1; AJvYcCXAQJPmsz+5pRiaIuQX+IesU35kjfInWmIjCjTZx4kmeMJpqhK8MIFGh+JKgagc1xO2X4tDQEDMukbYY/efbsFQij0VgezB98J17HBQ1FQ=
X-Gm-Message-State: AOJu0Yy41LOlU/PhytjK4bfFUk+uhCVKXJp5T6bF9rZfc6dsJWj2MZxY
	VrbixI/6tQotL4L/aBZSx7DecoYEL/RmN2zI1hAmAPtcuTMtvRWZBG8e5tcZtmA=
X-Google-Smtp-Source: AGHT+IETdG0QZ/AxtnexQjkf3YpxKM1RQB43AjgQshkIFB9F55dvSvLibJ1Ylz9/P9IG/qetI4zMFg==
X-Received: by 2002:a05:6214:519a:b0:6ad:5dbd:7452 with SMTP id 6a1803df08f44-6ad5dbd7b32mr152170496d6.19.1716997731109;
        Wed, 29 May 2024 08:48:51 -0700 (PDT)
Date: Wed, 29 May 2024 17:48:48 +0200
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
Message-ID: <ZldOYC4lE7eFFJOR@macbook>
References: <20240529090132.59434-1-roger.pau@citrix.com>
 <20240529090132.59434-3-roger.pau@citrix.com>
 <7954b3c2-e101-4db0-b317-a6585a6a8689@suse.com>
 <ZldHvAW_2nqAuWcq@macbook>
 <b427a74b-60e4-4bdf-96dd-164ea2506ba1@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b427a74b-60e4-4bdf-96dd-164ea2506ba1@suse.com>

On Wed, May 29, 2024 at 05:31:02PM +0200, Jan Beulich wrote:
> On 29.05.2024 17:20, Roger Pau Monné wrote:
> > On Wed, May 29, 2024 at 03:04:13PM +0200, Jan Beulich wrote:
> >> On 29.05.2024 11:01, Roger Pau Monne wrote:
> >>> The current callers of stop_machine_run() outside of init code already have the
> >>> CPU maps locked, and hence there's no reason for stop_machine_run() to attempt
> >>> to lock again.
> >>
> >> While purely from a description perspective this is okay, ...
> >>
> >>> --- a/xen/common/stop_machine.c
> >>> +++ b/xen/common/stop_machine.c
> >>> @@ -82,9 +82,15 @@ int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
> >>>      BUG_ON(!local_irq_is_enabled());
> >>>      BUG_ON(!is_idle_vcpu(current));
> >>>  
> >>> -    /* cpu_online_map must not change. */
> >>> -    if ( !get_cpu_maps() )
> >>> +    /*
> >>> +     * cpu_online_map must not change.  The only two callers of
> >>> +     * stop_machine_run() outside of init code already have the CPU map locked.
> >>> +     */
> >>
> >> ... the "two" here is not unlikely to quickly go stale; who knows what PPC
> >> and RISC-V will have as their code becomes more complete?
> >>
> >> I'm also unconvinced that requiring ...
> >>
> >>> +    if ( system_state >= SYS_STATE_active && !cpu_map_locked() )
> >>
> >> ... this for all future (post-init) uses of stop_machine_run() is a good
> >> idea. It is quite a bit more natural, to me at least, for the function to
> >> effect this itself, as is the case prior to your change.
> > 
> > This is mostly a pre-req for the next change that switches
> > get_cpu_maps() to return false if the current CPU is holding the CPU
> > maps lock in write mode.
> > 
> > IF we don't want to go this route we need a way to signal
> > send_IPI_mask() when a CPU hot{,un}plug operation is taking place,
> > because get_cpu_maps() enough is not suitable.
> > 
> > Overall I don't like the corner case where get_cpu_maps() returns true
> > if a CPU hot{,un}plug operation is taking place in the current CPU
> > context.  The guarantee of get_cpu_maps() is that no CPU hot{,un}plug
> > operations can be in progress if it returns true.
> 
> I'm not convinced of looking at it this way. To me the guarantee is
> merely that no CPU operation is taking place _elsewhere_. As indicated,
> imo the local CPU should be well aware of what context it's actually in,
> and hence what is (or is not) appropriate to do at a particular point in
> time.
> 
> I guess what I'm missing is an example of a concrete code path where
> things presently go wrong.

See the specific example in patch 3/9 with time_calibration() and it's
usage of send_IPI_mask() when called from a CPU executing in cpu_up()
context.

Thanks, Roger.

