Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB1025004B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 16:59:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kADw2-0001yf-Vx; Mon, 24 Aug 2020 14:58:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q2pW=CC=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1kADw1-0001yC-CO
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 14:58:57 +0000
X-Inumbo-ID: 0f7e8e40-f804-4859-801b-9250160a07d3
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f7e8e40-f804-4859-801b-9250160a07d3;
 Mon, 24 Aug 2020 14:58:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id k20so2801980qtq.11
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 07:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NeLWWubfjKxUu1xWBBr3uElA9ysZk/1WP0cJ/Dbo2Qg=;
 b=Xa+VlhhuJdLaSISVRGDubNo7SL4xLcG5sJqw6KJvP87Nr8sz/8Yy/YJzIDXfc4bayS
 r1lmRTfDR539xA4+IABWsUv1ClHP0L9IqLBZZBPo1rITaMBT6HQW2gF//8bff4qkYJOU
 wzR0oaFdMknjxKf/ceUJXy5N7lykxgHh9g+sZ6bwHPFelka8a7aCaGEt3F4pFi8A9IQy
 Dq7yk8/ibFV7tPfnylrmjSlskevNbtKKrkmgtqRGDbhJYrUU6OJCWZj/rXo3DEN0OI7c
 +J5f4GY/Hlz1YIb0dWUsM5N+IOOw6k8eKOArh2zlzlHwdf/m2xv61zKmEvVtn+9Bf1Or
 qDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NeLWWubfjKxUu1xWBBr3uElA9ysZk/1WP0cJ/Dbo2Qg=;
 b=EZ+aZx9Z/433yb9YokEhq3bpJVFKku5xpreVIhIAAU8p+XRAPhg+JKiNBlWgXBZL5O
 CEAAZWTwwhrNI7FqgOIe9VxuHDQ5Rl6n6xBV3YT+iWg/KaaGqqDOsHquT0phBgUKg1Z8
 XLf+ux900IR3IJp1YbL6ikFww/dlsra4I/S0w7m7HjYaurmsmH8rx6LZjz+rtwY7XoQd
 zdGAUBdUcByMjPFXtaQD65aAVzUSC/AdWwVspECEGVJFV/aI5DNEDEXlDxB1kUN7FfOd
 24CJRJy6ZkCBMuLR9Hx2cue+4qujbE628V7pjSRhCBPc9+CkOHe0qwyHICb13lSIDSN6
 Ie8A==
X-Gm-Message-State: AOAM532AQgYKps1mR3C7fxuD4/z+OE2ZxPmAEnQmydmniSbcPyIxGLjI
 r/1LcIhvRoUKgTtRkObH5/qkA/t0XrKXXg==
X-Google-Smtp-Source: ABdhPJwyIqud2KFFw+OLALGjFZHsclY425PWieX56w+thcCNAFRatjEpzAFwrgiVRmjaRWSfxjuvJg==
X-Received: by 2002:ac8:5303:: with SMTP id t3mr5267064qtn.159.1598281133460; 
 Mon, 24 Aug 2020 07:58:53 -0700 (PDT)
Received: from FED-nrosbr-BE.crux.rad.ainfosec.com
 (209-217-208-226.northland.net. [209.217.208.226])
 by smtp.gmail.com with ESMTPSA id q4sm9586938qkm.78.2020.08.24.07.58.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Aug 2020 07:58:51 -0700 (PDT)
Date: Mon, 24 Aug 2020 10:58:49 -0400
From: Nick Rosbrook <rosbrookn@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Message-ID: <20200824145849.GA8275@FED-nrosbr-BE.crux.rad.ainfosec.com>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
 <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
 <20200804155707.rrtzkksrle2nojbj@liuwe-devbox-debian-v2>
 <43f706e4-0292-5758-eb19-9fbb99b1337e@suse.com>
 <CAEBZRSc=xUjYq7ao9Rv-EEJsjiBkt5mio5QofvixErZj_SJUcw@mail.gmail.com>
 <289981a3-9baf-bf6a-abbd-e4d613709f2a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <289981a3-9baf-bf6a-abbd-e4d613709f2a@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 24, 2020 at 03:11:41PM +0200, Jan Beulich wrote:
> On 04.08.2020 18:41, Nick Rosbrook wrote:
> > On Tue, Aug 4, 2020 at 12:02 PM Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 04.08.2020 17:57, Wei Liu wrote:
> >>> On Tue, Aug 04, 2020 at 05:53:49PM +0200, Jan Beulich wrote:
> >>>> On 04.08.2020 17:50, Wei Liu wrote:
> >>>>> On Tue, Aug 04, 2020 at 05:30:40PM +0200, Jan Beulich wrote:
> >>>>>> On 04.08.2020 17:22, Nick Rosbrook wrote:
> >>>>>>> On Tue, Aug 4, 2020 at 10:17 AM Wei Liu <wl@xen.org> wrote:
> >>>>>>>>
> >>>>>>>> On Mon, Aug 03, 2020 at 10:06:32AM +0200, Jan Beulich wrote:
> >>>>>>>>> While this doesn't address the real problem I've run into (attempting to
> >>>>>>>>> update r/o source files), not recursing into tools/golang/xenlight/ is
> >>>>>>>>> enough to fix the build for me for the moment. I don't currently see why
> >>>>>>>>> 60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
> >>>>>>>>> it necessary to invoke this build step unconditionally.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Perhaps an oversight?
> >>>>>>>
> >>>>>>> This is intentional, and I think the commit message in 60db5da62ac0
> >>>>>>> ("libxl: Generate golang bindings in libxl Makefile") explains the
> >>>>>>> reasoning well. But, to summarize, CONFIG_GOLANG is only used to
> >>>>>>> control the bindings actually being compiled (i.e. with `go build`).
> >>>>>>> However, we always want the code generation script
> >>>>>>> (tools/golang/xenlight/gengotypes.py) to run if e.g.
> >>>>>>> tools/libxl/libxl_types.idl is modified.
> >>>>>>>
> >>>>>>> I hope this helps.
> >>>>>>
> >>>>>> Not really - I'm still not seeing the "why" behind this behavior. I.e.
> >>>>>> why build _anything_ that's not used further in the build, nor getting
> >>>>>> installed? Also if (aiui) you effectively object to the change that
> >>>>>> Wei has given his ack for, would you mind providing an alternative fix
> >>>>>> for the problem at hand?
> >>>>>
> >>>>> Is the solution here to make the target check if IDL definition file is
> >>>>> actually changed before regenerating the bindings?
> >>>>
> >>>> I don't know - Nick? A move-if-changed based approach would likely deal
> >>>> with the r/o source problem at the same time (at least until such time
> >>>> where the directory containing the file(s) is also r/o).
> >>>
> >>> To make sure Nick and I understand your use case correct -- "r/o source
> >>> problem" means you want the tools source to be read-only? But you would
> >>> be fine recursing into tools directory to build all the libraries and
> >>> programs?
> >>
> >> Yes - until we support out-of-tree builds, nothing more can be expected
> >> to work.
> > 
> > Jan - is the problem specifically that a fresh clone,  or `git
> > checkout`, etc. changes file timestamps in a way that triggers make to
> > rebuild those targets? I have not used the move-if-changed approach
> > before, but AFAICT that would be sufficient.
> 
> Since about three weeks have passed and - unless I've missed something -
> the issue is still there, I'd like to clarify who's going to address the
> (how I would call it) regression. I thought I had expressed that if my
> proposed version isn't acceptable, I'd rather see you deal with the issue.
> Did you perhaps imply the opposite?

Hi Jan,

My understanding was that you were going to use move-if-changed to fix
this for now (it seemed everyone agreed this was the quickest short-term fix).

The long-term plan (as George mentioned earlier in this thread) is to have 
a separate repository where the generated Go code is checked-in, rather
than xen.git. While this will eventually fix your problem, we are not
actively working on this yet.

Sorry for any misunderstanding.

-NR

