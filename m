Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BC223BE4C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 18:43:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k300w-0001hG-Op; Tue, 04 Aug 2020 16:42:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e3JV=BO=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1k300u-0001h9-Ri
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 16:42:08 +0000
X-Inumbo-ID: 2efdb852-1011-45be-ae0a-f981828cacba
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2efdb852-1011-45be-ae0a-f981828cacba;
 Tue, 04 Aug 2020 16:42:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id v4so34653756ljd.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fp+iJT6C3dAg6jOiB3xVAFaJaKEb1vg9/C4xVCr/NCU=;
 b=I0eAguXD4G7wuk/9ZOOWkMhp3RVRQrizacSlb2U9yDnl2RXe3/l6NS8501BSIoUkKZ
 Siu1KGA9NzMa+9JPJBRACO3RjwqwEJmQM/28dnUUI34xLRh6NakqVFjuqvTkoyK6Hz8W
 jJ1QzzoylebmnNMoQC/XAz4vZYJcSzehVF68IETQL8mB03uBcfe15d3AVVxLYXEgtFGl
 QkLKhRPHtM1yce4qZ9vlW3Y0rxd7Gm1NZ9jMdaXXUKAnUp/FBvCZ/zDaOSq806/Yk1b3
 gqqUs9ueFFLd3/wqmGCu9/GeSF4OnQGWj1p+oaZf/liy/xAhxPhRm9/kT6GXvTCQkZrR
 udTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fp+iJT6C3dAg6jOiB3xVAFaJaKEb1vg9/C4xVCr/NCU=;
 b=DNqxX8w6wDMSfU4Ud+1dRQIoJjYXa/z2OMW5EbyBB5f0TzcVEVnPc0l7VbKiPEd5Ze
 UDT1UicWnPhKFnnzCdiMvHMg+EzSTDbLNLOSiJnCc8gVZ0KW/eIQTvdIPegVV2QBGxmb
 ZT6frpGHgC79znX97oAcHfkDuDg7qVSqRJTSGoFyqdcfcUDvJtSpep8G0BAkDVjaOWp8
 5Z9Iyk3Z4KrE+BoiMKuU8v2y8OF6XQqcNOXhQnhfwY+FejWgCDd+K9Mwtn0poNG5ME38
 W5oHAO+T5ap9mqvvFbCupRfWcyEl2qvt+76hPA2LeFjcUjyQ1I9m1rfvd5aBllPTj9up
 4Nuw==
X-Gm-Message-State: AOAM532YkkVf1SyatxmGcSD7HBfBjXnOK9TmyD4RhOHY+EodW5gGiAbm
 2Pv5LP2iTz2+vtvPpK6WAAG+Lxhp5JO4HygbjFw=
X-Google-Smtp-Source: ABdhPJx1RGduHOwZizmmY61EQTIxjBBceDacAlXmh7alNKz8UOMV8dGfNQ4V3ROD+7zCl3T1nBHBwgi02OYhZoNCPfY=
X-Received: by 2002:a05:651c:1182:: with SMTP id
 w2mr9680574ljo.197.1596559326615; 
 Tue, 04 Aug 2020 09:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
 <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
 <20200804155707.rrtzkksrle2nojbj@liuwe-devbox-debian-v2>
 <43f706e4-0292-5758-eb19-9fbb99b1337e@suse.com>
In-Reply-To: <43f706e4-0292-5758-eb19-9fbb99b1337e@suse.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Tue, 4 Aug 2020 12:41:54 -0400
Message-ID: <CAEBZRSc=xUjYq7ao9Rv-EEJsjiBkt5mio5QofvixErZj_SJUcw@mail.gmail.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 4, 2020 at 12:02 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 04.08.2020 17:57, Wei Liu wrote:
> > On Tue, Aug 04, 2020 at 05:53:49PM +0200, Jan Beulich wrote:
> >> On 04.08.2020 17:50, Wei Liu wrote:
> >>> On Tue, Aug 04, 2020 at 05:30:40PM +0200, Jan Beulich wrote:
> >>>> On 04.08.2020 17:22, Nick Rosbrook wrote:
> >>>>> On Tue, Aug 4, 2020 at 10:17 AM Wei Liu <wl@xen.org> wrote:
> >>>>>>
> >>>>>> On Mon, Aug 03, 2020 at 10:06:32AM +0200, Jan Beulich wrote:
> >>>>>>> While this doesn't address the real problem I've run into (attempting to
> >>>>>>> update r/o source files), not recursing into tools/golang/xenlight/ is
> >>>>>>> enough to fix the build for me for the moment. I don't currently see why
> >>>>>>> 60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
> >>>>>>> it necessary to invoke this build step unconditionally.
> >>>>>>>
> >>>>>>
> >>>>>> Perhaps an oversight?
> >>>>>
> >>>>> This is intentional, and I think the commit message in 60db5da62ac0
> >>>>> ("libxl: Generate golang bindings in libxl Makefile") explains the
> >>>>> reasoning well. But, to summarize, CONFIG_GOLANG is only used to
> >>>>> control the bindings actually being compiled (i.e. with `go build`).
> >>>>> However, we always want the code generation script
> >>>>> (tools/golang/xenlight/gengotypes.py) to run if e.g.
> >>>>> tools/libxl/libxl_types.idl is modified.
> >>>>>
> >>>>> I hope this helps.
> >>>>
> >>>> Not really - I'm still not seeing the "why" behind this behavior. I.e.
> >>>> why build _anything_ that's not used further in the build, nor getting
> >>>> installed? Also if (aiui) you effectively object to the change that
> >>>> Wei has given his ack for, would you mind providing an alternative fix
> >>>> for the problem at hand?
> >>>
> >>> Is the solution here to make the target check if IDL definition file is
> >>> actually changed before regenerating the bindings?
> >>
> >> I don't know - Nick? A move-if-changed based approach would likely deal
> >> with the r/o source problem at the same time (at least until such time
> >> where the directory containing the file(s) is also r/o).
> >
> > To make sure Nick and I understand your use case correct -- "r/o source
> > problem" means you want the tools source to be read-only? But you would
> > be fine recursing into tools directory to build all the libraries and
> > programs?
>
> Yes - until we support out-of-tree builds, nothing more can be expected
> to work.
>

Jan - is the problem specifically that a fresh clone,  or `git
checkout`, etc. changes file timestamps in a way that triggers make to
rebuild those targets? I have not used the move-if-changed approach
before, but AFAICT that would be sufficient.

-NR

