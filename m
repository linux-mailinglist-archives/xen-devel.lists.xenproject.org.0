Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698D3772A18
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 18:06:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578699.906329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2kL-000595-6l; Mon, 07 Aug 2023 16:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578699.906329; Mon, 07 Aug 2023 16:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT2kL-000579-42; Mon, 07 Aug 2023 16:06:17 +0000
Received: by outflank-mailman (input) for mailman id 578699;
 Mon, 07 Aug 2023 16:06:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JzBl=DY=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qT2kJ-000573-LF
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 16:06:15 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 546f3f79-353c-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 18:06:12 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fe5eb84d43so6743725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 09:06:13 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n20-20020a7bcbd4000000b003fe557829ccsm6630963wmi.28.2023.08.07.09.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:06:12 -0700 (PDT)
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
X-Inumbo-ID: 546f3f79-353c-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691424372; x=1692029172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PP9dYf284idr19PF7QLRc3SDpLEBWw6WZPJUbbBvNJQ=;
        b=EzC0yItmecwznpscBiheWkNwdjmzS5Auqj4VmLindz0GZ1x0yv8HnCFUo9qjdjv1ne
         L/ElDHoifE9n7OB+hzwxr2no6wDgnn0xJUPaGpzex9ZySvOqf6JbLEMDWv5u157xcigt
         B2Ca6CbdHHNHuoPpfB+mhMFhaGQWbn2lH3RB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691424372; x=1692029172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PP9dYf284idr19PF7QLRc3SDpLEBWw6WZPJUbbBvNJQ=;
        b=AVpPv1+dXaVm30tk5Zy4k7N6/wJtuWhaN8koqOJbUhf2JKC/Nvuu7+SXdFjSA7VlgE
         lTBypWDmNBwY8bjf4uZ3tCQGlDAgkKZPzwcuUwhNWZt722FJCsfvf6mlzr+HAHVTHbmr
         PvomhmjjqW1JBKWTgKfpzClVkgXcRHDmCGYwpvWqXmQhGOytMc0SQv+IAzOEkPX4e0vp
         hICWX6jrcR8+oIL7HVfvqYankGSwadeBcH0Mnt8sKO86IxTPLCPzlYMTtSAzhltyrdWG
         c1a7bgVkzlpgpaTKUGhmi8+GC8swOx0C745lYnccMrX3xIuA5XB2UxsSXYzw2tB16fl4
         Y+dg==
X-Gm-Message-State: AOJu0YyWxLoaAyWGeWUQ3kMICFG/clRU5wxTkXZCFYEFXdVRkDllLD8y
	K9C1jXboyQnxUYD6uLItAbc8Lg==
X-Google-Smtp-Source: AGHT+IFX6NQTwsiSqc6FDKMBUPAQgmy/jX9JdTf+My0E70BNtWEzICSYxS942Xw9iN4oLJ55RmtcpQ==
X-Received: by 2002:a1c:7511:0:b0:3fe:2bb1:11ba with SMTP id o17-20020a1c7511000000b003fe2bb111bamr7977474wmc.27.1691424372555;
        Mon, 07 Aug 2023 09:06:12 -0700 (PDT)
Message-ID: <64d11674.7b0a0220.ec9d0.7073@mx.google.com>
X-Google-Original-Message-ID: <ZNEWcudOc3ZzFvNM@EMEAENGAAD19049.>
Date: Mon, 7 Aug 2023 17:06:10 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
 <9f0b7ab4-090f-21ea-2cf8-6ecdc7c02225@citrix.com>
 <3470bc26-3cbc-e0de-53ae-203449493b51@citrix.com>
 <06a3f79e-4345-7a4b-be57-728a8b01befd@suse.com>
 <67b5c363-a653-3f5c-ea3a-f52bfac3dc49@citrix.com>
 <75a70fa0-ab40-e2b0-685d-db752c943a7d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75a70fa0-ab40-e2b0-685d-db752c943a7d@suse.com>

Hi,

A few days have passed. May I suggest taking a step back?

On Tue, Aug 01, 2023 at 09:57:57AM +0200, Jan Beulich wrote:
> On 31.07.2023 19:38, Andrew Cooper wrote:
> > There's one system which never made its way into production,
> > support-for-which in the no-op case is causing a 10% perf hit in at
> > least one metric, 17% in another.
> > 
> > ... and your seriously arguing that we should continue to take this perf
> > hit?
> 
> Have I asked anywhere to keep this enabled by default? Have I been the
> one to first propose a way to reduce this overhead?
> 
> > It is very likely that said machine(s) aren't even powered on these
> > days, and even if it is on, the vendor can take the overhead of turning
> > PDX compression on until such time as they make a production system.
> > 
> > Furthermore, it is unrealistic to think that such a machine will ever
> > make its way into production.  Linux has never PDX compression, and
> > by-and-large if it doesn't run Linux, you can't sell it in the first place.
> 
> I'm sure you recall that Linux has much more VA space for its directmap,
> so aiui there simply was no immediate need there.
> 
> > It is utterly unreasonable to be carrying this overhead in the first
> > place.  PDX compression *should not* have been committed on-by-default
> > in the first place.  (Yes, I know there was no Kconfig back then, and
> > the review process was non-existent, but someone really should have said
> > no).
> 
> Are you suggesting no code should be committed supporting new hardware,
> ahead of that hardware going public?
> 
> > It is equally unreasonable to offer people (under Expert or not) an
> > ability to shoot themselves in the foot like this.
> 
> Shoot themselves in the foot? If you enable EXPERT, you better know
> what you're doing.
> 
> >>>   Indeed, Julien's
> >>>> quick metric shows how much performance we waste by having it enabled.
> >>> Further to this, bloat-o-meter says net -30k of code and there are
> >>> plenty of fastpaths getting a several cacheline reduction from this.
> >> A similar reduction was achieved
> > 
> > Really?  You think that replacing the innermost shift and masking with
> > an alternative that has a shorter instruction sequence gets you the same
> > net reduction in code?
> > 
> > I do not find that claim credible.
> 
> Did you ever seriously look at those patches?
> 
> >>  by the BMI2-alt-patching series I
> >> had put together, yet you weren't willing to come to consensus on
> >> it.
> > 
> > You have AMD machines, and your patch was alleged to be a performance
> > improvement.  So the fact you didn't spot the problems with PEXT/PDEP on
> > all AMD hardware prior to Fam19h suggests there was insufficient testing
> > for an alleged performance improvement.
> > 
> > The patch you posted:
> > 
> > 1) Added extra complexity via alternatives, and
> > 2) Reduced performance on AMD systems prior to Fam19h.
> > 
> > in an area of code which useless on all shipping x86 systems.
> > 
> > You literally micro-anti-optimised a no-op path to a more expensive (on
> > one vendor at least) no-op path, claiming it to be a performance
> > improvement.
> 
> You appear to forget the patch patching to MOV instructions ("x86: use
> MOV for PFN/PDX conversion when possible"). Are you saying MOV has
> performance problems on any CPU?
> 
> Jan

I think we can all agree that (a) the _current_ pdx code implies taking a
perf hit and (b) that we can't just remove PDX compression because it's in
current use in certain systems. The contentious points seem to be strictly
in the status it should hold by default and the means to reduce the perf
hit when it's on.

For the status:

I think it's clear it must remain at least on ARM. I believe Jan argued
about the choice of default in terms of "when" to turn it off, rather than
"if". Seeing that...

> On 18.07.2023 9:33, Jan Beulich wrote:
> I disagree with this choice of default for x86. To avoid surprising
> downstreams, this should at best be a two-step process: Keep the
> default as Y right now, and switch to N a couple of releases later.
... so I think a more productive discussion is following up on that,
looking at the "why", "when", "how" and "risks-involved" rather than going
in circles (more on this at the end of the email).

Now, for the perf hit reduction:

An alt-patching series can probably make it very close to the perf win of
this patch as long as it transforms the conversion hunks into no-ops when
there's no hole. I looked into the 2018 patch, and I don't think it tried
to go that far (afaics it's purpose is to inline the compression parameters
into the code stream). I highly suspect it would still noticiably
underperform compared to this one, but I admit it's guesswork and I'd be
happy to be proven wrong through benchmarks.

Regardless that's a lot more complexity than I was willing to tackle here
seeing that it's use is limited on x86.

Compiling-out and alt-patching compression are not necessarily incompatible
with each other though. It would, in fact, do wonders for ARM, where the
exact same binary might have to run on separate processors with different
memory map configurations. I do think someone ought to do it in the long
run as a performance improvement for that port (if only because
alt-patching is arch-specific), but I really struggle to justify the dev
effort of writing, benchmarking, testing and maintining all that
infrastructure when there's no (known) machine I can buy to test it on.

Summary:
  * While alt-patching is an attractive alternative this series doesn't do
    that and in the spirit of keeping things simple I'd really rather keep
    it that way. Does this sound reasonable?
  * For the topic of when to disable compression by default on x86, I
    genuinely think now's as good a time as any. If we were to do it in 2
    steps any project downstream may very well not notice until 2 releases
    down the line, at which point they simply must turn compression back
    on, which is what they would have to do now anyway.
  * For the topic of allowing or not the option to be selectable, I think
    it would be a mistake to preclude it because while we don't know of
    physical memory maps with big holes on (publicly available) x86, Xen
    may be itself virtualized with arbitrary memory maps. Unlikely and far
    fetched as it is, it's IMO worth being at least cautious about. Gating
    the feature on EXPERT=y and adding a big warning should be good enough
    to avoid foot-shootouts.

Thanks,
Alejandro

