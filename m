Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE9F23BDA7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 17:57:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2zJR-0005EW-MG; Tue, 04 Aug 2020 15:57:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3j1i=BO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k2zJP-0005ER-LM
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:57:11 +0000
X-Inumbo-ID: ab04286e-6d85-415f-a82c-e70dd903725c
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ab04286e-6d85-415f-a82c-e70dd903725c;
 Tue, 04 Aug 2020 15:57:10 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d190so3148812wmd.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 08:57:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UoAcjfHvmyoQkWA3vl2d+30miFVgs9OkVz7RuVOksEY=;
 b=o8lIRHH8gXWoTCiPLp1C6yRpNaAVdwjGLEqLcrh/epMnrkVTg0aDcAUnKEKy7RcUSK
 YWaPOz7ystpaae/F44guEfxlUmxSqGJ4GIpqfeGy4pr4USqXVDxvKWqUrmkfAEPHa6jH
 ri45TufVCOPtZKwtfHf3H0zM+35Kn1ugJPy7IESlUQjrgWNv7XHvIoq7zs5+OG0jO++7
 KjyKgA7XGxaKsKX7qj9b4FjU9U4oLA9batvnU4oG8PzmGsxqWlinp13kGXY1UdJrICjT
 Ot2iKUa7YrboS9iGFlgALd2jZ2564vDkpzfgwluMAUVHaGmH7TVBJhJnZbm00CWDupcX
 zqvA==
X-Gm-Message-State: AOAM533RELCqejVm7Tv+bYL7omQMEg1VZosza56wEie/vliPFbAFGa8l
 /hEmv7l9IzfOOTjaaQ6Bx5M=
X-Google-Smtp-Source: ABdhPJyNKYbfzlBLa6T7QUi9jfa6byepNTQpOlrEs+ZOxzSxKkesGoHlL2ay4mzySXVtrxE6u2ugSQ==
X-Received: by 2002:a1c:ba83:: with SMTP id k125mr4698113wmf.160.1596556629627; 
 Tue, 04 Aug 2020 08:57:09 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 32sm35391243wrh.18.2020.08.04.08.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 08:57:08 -0700 (PDT)
Date: Tue, 4 Aug 2020 15:57:07 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Message-ID: <20200804155707.rrtzkksrle2nojbj@liuwe-devbox-debian-v2>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
 <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 04, 2020 at 05:53:49PM +0200, Jan Beulich wrote:
> On 04.08.2020 17:50, Wei Liu wrote:
> > On Tue, Aug 04, 2020 at 05:30:40PM +0200, Jan Beulich wrote:
> >> On 04.08.2020 17:22, Nick Rosbrook wrote:
> >>> On Tue, Aug 4, 2020 at 10:17 AM Wei Liu <wl@xen.org> wrote:
> >>>>
> >>>> On Mon, Aug 03, 2020 at 10:06:32AM +0200, Jan Beulich wrote:
> >>>>> While this doesn't address the real problem I've run into (attempting to
> >>>>> update r/o source files), not recursing into tools/golang/xenlight/ is
> >>>>> enough to fix the build for me for the moment. I don't currently see why
> >>>>> 60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
> >>>>> it necessary to invoke this build step unconditionally.
> >>>>>
> >>>>
> >>>> Perhaps an oversight?
> >>>
> >>> This is intentional, and I think the commit message in 60db5da62ac0
> >>> ("libxl: Generate golang bindings in libxl Makefile") explains the
> >>> reasoning well. But, to summarize, CONFIG_GOLANG is only used to
> >>> control the bindings actually being compiled (i.e. with `go build`).
> >>> However, we always want the code generation script
> >>> (tools/golang/xenlight/gengotypes.py) to run if e.g.
> >>> tools/libxl/libxl_types.idl is modified.
> >>>
> >>> I hope this helps.
> >>
> >> Not really - I'm still not seeing the "why" behind this behavior. I.e.
> >> why build _anything_ that's not used further in the build, nor getting
> >> installed? Also if (aiui) you effectively object to the change that
> >> Wei has given his ack for, would you mind providing an alternative fix
> >> for the problem at hand?
> > 
> > Is the solution here to make the target check if IDL definition file is
> > actually changed before regenerating the bindings?
> 
> I don't know - Nick? A move-if-changed based approach would likely deal
> with the r/o source problem at the same time (at least until such time
> where the directory containing the file(s) is also r/o).

To make sure Nick and I understand your use case correct -- "r/o source
problem" means you want the tools source to be read-only? But you would
be fine recursing into tools directory to build all the libraries and
programs?

Wei.

> 
> Jan

