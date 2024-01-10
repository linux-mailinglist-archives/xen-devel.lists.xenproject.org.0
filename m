Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6489829ED9
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 17:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665697.1035964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNbuw-0004GV-NN; Wed, 10 Jan 2024 16:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665697.1035964; Wed, 10 Jan 2024 16:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNbuw-0004EE-Ju; Wed, 10 Jan 2024 16:59:02 +0000
Received: by outflank-mailman (input) for mailman id 665697;
 Wed, 10 Jan 2024 16:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sd/G=IU=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNbuu-0004E8-H1
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 16:59:00 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8af6833d-afd9-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 17:58:57 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e5afc18f5so1757715e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 08:58:57 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b0040e3733a32bsm2810521wmb.41.2024.01.10.08.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 08:58:56 -0800 (PST)
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
X-Inumbo-ID: 8af6833d-afd9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704905936; x=1705510736; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7mk9f+63h/LbYpWSQFDQljkWr17BU378Sy96AUV/MvI=;
        b=CfIUwf/U8M1UrwGMKnuHBYdje5Ji28Uhvor+TjZ9Ks3BBdi+3eDFfJLQDZKq8yC1Os
         sz6sPNj8Gch2l9hKefSusOd9p4FE4vxyTPT/l1K6PSvva7K1mtKEDeC6J4rL4t1LVPMW
         Jqi2RH5NNGEOUyNvZdpyMdZYQknCg99XhKx3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704905936; x=1705510736;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mk9f+63h/LbYpWSQFDQljkWr17BU378Sy96AUV/MvI=;
        b=RlYYWu8uY5aBzS/HdyFDcf7mp+I9Z7XRoU6oWC2/eTQkSqFVD+soOuDnlXwKZUhATX
         +SqJC4MqPWWcxTmGcmzuj7cfcRO7GNLz+deS0mpKvwch3H7IBdxK9XPAwv4maTGHthoG
         52NTzEqMHfop74XpRF7S68TjOyM7V0pFufhAikqozZCn2mLz2QQaNsByHSc6s2HU9D8J
         kijf2ryDFxJ7VEH0Gq4eBktxGBUdamjnV/NgducaBRmnnFv/gKKA5ob+9IBhJR22xs/1
         rdJ8tN5Q084XudqDsCv5Lh6ihn2ax8AO3Q2lSzTuG510mHbvpQcT7f5lW1okyVqd5nkZ
         /cEQ==
X-Gm-Message-State: AOJu0YxnRvbPvSZ5klVfHwiJ2JECaciJrbM7GawTybPEMZU8chXb3LFG
	hXnQmMTbiAxoCVMx+js6Zp8Z25+tWkP3Qw==
X-Google-Smtp-Source: AGHT+IHI92+n68uU9xYGmNn7sKv0YhC36BiiE3vnTVtIlMsigCI5tU4UEZaba2wh+d1TzqqFGA9xYQ==
X-Received: by 2002:a05:600c:1908:b0:40e:4a79:e119 with SMTP id j8-20020a05600c190800b0040e4a79e119mr767584wmq.114.1704905936534;
        Wed, 10 Jan 2024 08:58:56 -0800 (PST)
Date: Wed, 10 Jan 2024 17:58:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/nmi: ensure Global Performance Counter Control is
 setup correctly
Message-ID: <ZZ7Mz0HymYQGpTna@macbook>
References: <20240110153400.64017-1-roger.pau@citrix.com>
 <4bd7324f-69fc-42e5-9155-02a7e1a8a6e8@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bd7324f-69fc-42e5-9155-02a7e1a8a6e8@citrix.com>

On Wed, Jan 10, 2024 at 03:52:49PM +0000, Andrew Cooper wrote:
> On 10/01/2024 3:34 pm, Roger Pau Monne wrote:
> > When Architectural Performance Monitoring is available, the PERF_GLOBAL_CTRL
> > MSR contains per-counter enable bits that is ANDed with the enable bit in the
> > counter EVNTSEL MSR in order for a PMC counter to be enabled.
> >
> > So far the watchdog code seems to have relied on the PERF_GLOBAL_CTRL enable
> > bits being set by default, but at least on some Intel Sapphire and Emerald
> > Rapids this is no longer the case, and Xen reports:
> >
> > Testing NMI watchdog on all CPUs: 0 40 stuck
> >
> > The first CPU on each socket is started with PERF_GLOBAL_CTRL zeroed, so PMC0
> > doesn't start counting when the enable bit in EVNTSEL0 is set, due to the
> > relevant enable bit in PERF_GLOBAL_CTRL not being set.
> >
> > Fix by detecting when Architectural Performance Monitoring is available and
> > making sure the enable bit for PMC0 is set in PERF_GLOBAL_CTRL.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > The fact that it's only the first CPU on each socket that's started with
> > PERF_GLOBAL_CTRL clear looks like a firmware bug to me, but in any case making
> > sure PERF_GLOBAL_CTRL is properly setup should be done regardless.
> 
> It's each package-BSP, and yes, this is clearly a firmware bug.  It's
> probably worth saying that we're raising it with Intel, but this bug is
> out in production firmware for SPR and EMR.
> 
> > ---
> >  xen/arch/x86/nmi.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
> > index dc79c25e3ffd..7a6601c4fd31 100644
> > --- a/xen/arch/x86/nmi.c
> > +++ b/xen/arch/x86/nmi.c
> > @@ -335,6 +335,19 @@ static void setup_p6_watchdog(unsigned counter)
> >           nmi_p6_event_width > BITS_PER_LONG )
> >          return;
> >  
> > +    if ( cpu_has_arch_perfmon )
> > +    {
> > +        uint64_t global_ctrl;
> > +
> > +        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
> > +        /*
> > +         * Make sure PMC0 is enabled in global control, as the enable bit in
> > +         * PERF_GLOBAL_CTRL is AND'ed with the enable bit in EVNTSEL0.
> > +         */
> > +        if ( !(global_ctrl & 1) )
> > +            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl | 1);
> 
> My gut feeling is that we ought to reinstate all bits, not just bit 1. 
> If nothing else because that will make debugging using other counters
> more reliable too.

Hm, yes, I was borderline on enabling all possible counters in
PERF_GLOBAL_CTRL, as reported by CPUID.0AH: EAX[15:8].

But then wondered if it was going too far, as for the purposes here we
just care about PMC1.

My reasoning for not doing it would be that such wide setup of
PERF_GLOBAL_CTRL would then be gated on the watchdog being enabled,
usages of other counters apart from PMC0 will be gated on the watchdog
being enabled.  It seems more reliable to me to either do the setting
of PERF_GLOBAL_CTRL as part of CPU initialization, or defer to each
user of a PMC to take care of enabling it in PERF_GLOBAL_CTRL.

> vPMU (although mutually exclusive with watchdog) does context switch
> this register as a whole.
> 
> See how global_ctrl_mask gets set up, although I'm not sure how much of
> that infrastructure we really want to reuse here.

Yes, if we want to enable all possible counters we would need to use
something similar to what's done there, albeit without the fixed
counter part.

Thanks, Roger.

