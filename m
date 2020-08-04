Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC7023BD8F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 17:51:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2zDF-0004kO-2l; Tue, 04 Aug 2020 15:50:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3j1i=BO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k2zDD-0004kD-Hi
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:50:47 +0000
X-Inumbo-ID: 3957bb7d-4e80-46ef-b4d4-924741db5f8f
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3957bb7d-4e80-46ef-b4d4-924741db5f8f;
 Tue, 04 Aug 2020 15:50:46 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c15so1658336wrs.11
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 08:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6XBMq2OUK/ORpEVxRNpgI9GI/0wcOHymaMOtJI3tPKA=;
 b=fQb43r+i/RfpXyLIMvst09+jVfsqm03jPk+WeEj5yOEpeXMFrDAoFeRysGKhZ74/TV
 8ywuXItfXe0tRE4TmQkHZ+q31AICl6f2HOcDELs9uu5F2AScgvd4Agaycj9EvAYxMGqe
 GpM6nuQFACmS5tNocisns3KxUquBT/T5RDLw1VKSgUPHBMxbF25qa1DzXwKQ6HyyTBPK
 8/DFP7F7/owwSbHEqy3AwaHfvIzp+4SxdcRIrfRRdZpJKZ7WOAykoZ5JqYgrZ0v8PRR2
 QIMjiosuDf4KotQOX0FcvOjGuFxr7W+q/TSby9CdNgCa044FZ2kXhTisb9mhrCLF6mBM
 VWrQ==
X-Gm-Message-State: AOAM530x8mdYLvF32hC6yax2O6lz4xF8PuDY3zoVFMMGuBoJ7OC4IYNA
 fwTygfNLE7KWnfLiTAqt+qk=
X-Google-Smtp-Source: ABdhPJxV6Elycqx1dRICdiCNg79b4Htqdl3dOeDDKtv9plNUw3cTgOknWkb2K4DTrDHt370T7qeSHQ==
X-Received: by 2002:a5d:55d2:: with SMTP id i18mr19291070wrw.378.1596556245535; 
 Tue, 04 Aug 2020 08:50:45 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 69sm5417207wmb.8.2020.08.04.08.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 08:50:44 -0700 (PDT)
Date: Tue, 4 Aug 2020 15:50:43 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
Message-ID: <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
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

On Tue, Aug 04, 2020 at 05:30:40PM +0200, Jan Beulich wrote:
> On 04.08.2020 17:22, Nick Rosbrook wrote:
> > On Tue, Aug 4, 2020 at 10:17 AM Wei Liu <wl@xen.org> wrote:
> >>
> >> On Mon, Aug 03, 2020 at 10:06:32AM +0200, Jan Beulich wrote:
> >>> While this doesn't address the real problem I've run into (attempting to
> >>> update r/o source files), not recursing into tools/golang/xenlight/ is
> >>> enough to fix the build for me for the moment. I don't currently see why
> >>> 60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
> >>> it necessary to invoke this build step unconditionally.
> >>>
> >>
> >> Perhaps an oversight?
> > 
> > This is intentional, and I think the commit message in 60db5da62ac0
> > ("libxl: Generate golang bindings in libxl Makefile") explains the
> > reasoning well. But, to summarize, CONFIG_GOLANG is only used to
> > control the bindings actually being compiled (i.e. with `go build`).
> > However, we always want the code generation script
> > (tools/golang/xenlight/gengotypes.py) to run if e.g.
> > tools/libxl/libxl_types.idl is modified.
> > 
> > I hope this helps.
> 
> Not really - I'm still not seeing the "why" behind this behavior. I.e.
> why build _anything_ that's not used further in the build, nor getting
> installed? Also if (aiui) you effectively object to the change that
> Wei has given his ack for, would you mind providing an alternative fix
> for the problem at hand?

Is the solution here to make the target check if IDL definition file is
actually changed before regenerating the bindings?

Admittedly I had misunderstood what CONFIG_GOLANG meant.

Wei.

> 
> Jan

