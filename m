Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1C9A1A5BB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 15:25:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876281.1286661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tay8J-0004ZS-Io; Thu, 23 Jan 2025 14:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876281.1286661; Thu, 23 Jan 2025 14:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tay8J-0004XJ-GD; Thu, 23 Jan 2025 14:24:35 +0000
Received: by outflank-mailman (input) for mailman id 876281;
 Thu, 23 Jan 2025 14:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lw3w=UP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tay8I-0004XC-06
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 14:24:34 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c195849e-d995-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 15:24:29 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so165377366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 06:24:29 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73ef6c37sm10287257a12.81.2025.01.23.06.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 06:24:28 -0800 (PST)
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
X-Inumbo-ID: c195849e-d995-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737642269; x=1738247069; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TtV2w0OkMULVw/3Ztxc5AaC/n0VuTCkq4bSs96ssGoY=;
        b=vBWBlSJLuMKPfabLNUKXnf28jVqrPloJbdEOdiwo8CuzfRwc28Jcv7WQ1vb2frDyj7
         GzOgjeL8EeA0BLB+Z8NIwhmtuVa1PnVlFlfT7Zk06Xb+2TZKnc95fIQXpflDuBL7STQL
         +3tAyBn7AbKrTNC9QWzg1hmHZQ/O4RW4Bu/5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737642269; x=1738247069;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TtV2w0OkMULVw/3Ztxc5AaC/n0VuTCkq4bSs96ssGoY=;
        b=QdeXgXNYA7OkOTMa5XAjUqc8YrBIEY0mJF7RqMUVXf044uJ4MH3mGQlBCR1o6tu6sh
         ZWgq6RV5/Sf7Go6LT7QA/BOopwSjtvtTrzFv91AX+DH1GPOWHn3cAdr3qmynlOnfX0+B
         DcNCeLDEZStqqwYIgu6dLOqQNCwyWvIv3Bm9RYntIhMR+OSBKlMrc8ya5k6GECkYIJy9
         fvouAqukbd9jaWpFYzbqGkEvxrV4Sf8ZRl2h3hoHWBtImBn9okJhxtJrcy+TIVjlnLKF
         VU3MI8dQm2qW4DRBKkQI3zpFF0XwIpB7VPjItD2B2PZOKf1FsFdXI7kGBkhesQL7trpO
         C/HA==
X-Gm-Message-State: AOJu0YxbRfnrYIk3yaJQTTZr56A6dxkNkoNvK8B/Bg4gs++iBlDJ5K0g
	IAvATMwQqDxmyI4w8AQ5CIKpP29LF2tvRdCYsdLWyQHQ80fTYzrJkcaUKx7n8eE=
X-Gm-Gg: ASbGnctKeGzE6aTGOB/sRHBw7S9avWoiM+vriUIoDHg47kMXT27g/Dd/G2sr5k6PCjH
	Jt2FxDzveQiGqBDnkPG93DEqsIGPp50CakSbT9N2vXWMGZRRhFYzBal6k5Za9uAWrWgL+Cz4vOL
	Qu9G2H0bjFGCxz+ysZ3UBIwM9PZCcwMRwrRti+lVqYvN3exHjG85sQ6D0lhPfQSMLASyVVJNIXV
	ZwWcz3yHUvjvioe4hLp6jW8TkUZfZ4useC4Lvo2giDr/ZxgfyNHUI9oBqHp9KK0lBTG05bj9OUx
	lBa7TnnvpQ==
X-Google-Smtp-Source: AGHT+IHV2gMEoUueAD6cnOH1KMgkg7v+oXBWRu1U+psNzHq4ec37QY4gbF0Bt/rxi8Qw7dJ3ie/gcw==
X-Received: by 2002:a17:906:6a20:b0:aac:23f4:f971 with SMTP id a640c23a62f3a-ab38b1b45e1mr2276902866b.33.1737642268750;
        Thu, 23 Jan 2025 06:24:28 -0800 (PST)
Date: Thu, 23 Jan 2025 15:24:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v3 02/12] x86/HVM: improve CET-IBT pruning of ENDBR
Message-ID: <Z5JRGwA51lOs65t5@macbook.local>
References: <293e5aef-8843-461c-bc96-709a605b2680@suse.com>
 <537b0d9c-1936-4cf5-a012-d50b1097a22d@suse.com>
 <Z5I5D_uVxijLF6sK@macbook.local>
 <f0e2a3f3-3081-414d-824c-bf940134aece@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f0e2a3f3-3081-414d-824c-bf940134aece@suse.com>

On Thu, Jan 23, 2025 at 02:18:41PM +0100, Jan Beulich wrote:
> On 23.01.2025 13:41, Roger Pau Monné wrote:
> > On Mon, Feb 26, 2024 at 05:42:20PM +0100, Jan Beulich wrote:
> >> --- a/xen/arch/x86/hvm/hvm.c
> >> +++ b/xen/arch/x86/hvm/hvm.c
> >> @@ -161,10 +161,15 @@ static int __init cf_check hvm_enable(vo
> >>      else if ( cpu_has_svm )
> >>          fns = start_svm();
> >>  
> >> +    if ( fns )
> >> +        hvm_funcs = *fns;
> >> +
> >> +    prune_vmx();
> >> +    prune_svm();
> > 
> > Isn't it actually the opposite of pruning.  What the helpers do is
> > fill all the pointers in the structure.
> 
> With the goal of their ENDBR to then be pruned. I agree though that the
> functions don't do any pruning themselves. Yet
> {svm,vmx}_prepare_for_cet_ibt_pruning() is a little awkward for my taste
> (although it would properly document the purpose). Plus ...
> 
> >  I would rather name them {vmx,svm}_fill_hvm_funcs() or similar.
> 
> ... while I can use those names (perhaps without the "hvm" infix), the
> present names have the advantage that any other pruning that we may
> find desirable could also be put there. Hence also why the cpu_has_*
> checks live there.

Hm, I'm unsure.  What else do you see becoming part of those
functions?  It's hard for me to suggest a name when it's unclear what
future logic do you think they could contain.

Given the current code I still think something that contains 'fill' or
similar is way more appropriate, the more if the IBT check is pulled
out into the caller.

> >  And possibly pull the
> > cpu_has_xen_ibt check outside the functions:
> > 
> > if ( cpu_has_xen_ibt )
> > {
> >     /*
> >      * Now that svm_function_table was copied, populate all function pointers
> >      * which may have been left at NULL, for __initdata_cf_clobber to have as
> >      * much of an effect as possible.
> >      */
> >     vmx_fill_hvm_funcs();
> >     svm_fill_hvm_funcs();
> > }
> 
> Which would leave the SVM function entirely empty.

You could possible declare it as an static inline in the hvm.h header
for the time being?

> The intention was for
> that to not be the case, and also for the comment you have added above
> to also live in the per-vendor functions.

Isn't that a bit redundant?  I would prefer to not have duplicated
comments over the code, hence my suggestion to place part of the logic
in the caller.

> > I would be nice to avoid directly exporting more vmx and smv specific
> > helpers, as if we ever want to compile out vmx or svm it would be more
> > churn to deal with those.  I however cannot think of any good way to
> > do this here, so it's fine to export those functions.
> 
> It could be another hook, just that the hook pointer then would point
> into .init.text (i.e. become stale once we purge .init.*). We could zap
> it of course after invoking it ...

Yes, I also think this is not great, and prefer your current proposal.

> Note that the vendor function invocations have meanwhile, in the course
> of re-basing, gained "if ( IS_ENABLED(CONFIG_...) )", so no extra
> (future) churn for the (already available) option you talk about.

Oh, OK, that's better then.

Thanks, Roger.

