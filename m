Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707961EB7F7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 11:09:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg2um-0003bD-KH; Tue, 02 Jun 2020 09:08:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BVk0=7P=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jg2uk-0003b6-UG
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 09:08:54 +0000
X-Inumbo-ID: ae947dda-a4b0-11ea-9dbe-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae947dda-a4b0-11ea-9dbe-bc764e2007e4;
 Tue, 02 Jun 2020 09:08:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c3so2529810wru.12
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 02:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ibp+xKt5PP9drAqQA2xRugrbmqMz3rwjwdKXKe9l/h4=;
 b=Re+IzVD8WRVcfls6iC/TY7L0StB2ntSa9cjBQPwziphVr22batvb5bij4ixkvqRpzO
 LWszSUf2SRNiIpsabHYMVd/DzJjY5vPRf89fy/5qgLtSC8Ao9atBDzWlNtE6m/9yMnRe
 4InM06Jub9A3qUfq0BKT6pD/8xLVOZo91oZ68Sdp+vJRbqpjEFaHOi6GfYnNGqioLuvM
 LQqu6jCArjwKOa5+UsLixr6c5E6+Y6Elt2uuzhKT2afTyzXDg4bZw1RR4qWW5+iyaeGC
 bL7wCSI92PO2sldzbUxet7iYJjj9qNpvDWViO4pZjhntiP/9kH2S7T0cvTtlNPn53Q7z
 zo8w==
X-Gm-Message-State: AOAM530ZSwBl8lNo94cX/X6Qvm7zYHcjVzSGFCsTZPK+HhHWCYiAxTkf
 n1DqGk//qR89V3pG2JWAKfI=
X-Google-Smtp-Source: ABdhPJzs0tOPjipDIPNVUgCVsYq8A3AMHd+T5fBp+j+WGIAw1CnQyQTxMItbSrpZDeV8xu3HQ+Rrfw==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr24975008wrq.310.1591088933470; 
 Tue, 02 Jun 2020 02:08:53 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id j11sm2735544wru.69.2020.06.02.02.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 02:08:52 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:08:51 +0000
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hx242@xen.org>
Subject: Re: [PATCH 00/16] Remove the direct map
Message-ID: <20200602090851.hxfxwoiflip6kcym@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1588278317.git.hongyxia@amazon.com>
 <20200501120715.hjak2gjp7ialwfq5@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <689a7c860a8a551e3b6009b16590e812dbf21055.camel@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <689a7c860a8a551e3b6009b16590e812dbf21055.camel@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 01, 2020 at 02:53:08PM +0100, Hongyan Xia wrote:
> On Fri, 2020-05-01 at 12:07 +0000, Wei Liu wrote:
> > On Thu, Apr 30, 2020 at 09:44:09PM +0100, Hongyan Xia wrote:
> > > From: Hongyan Xia <hongyxia@amazon.com>
> > > 
> > > This series depends on Xen page table domheap conversion:
> > > 
> https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg01374.html
> > > .
> > > 
> > > After breaking the reliance on the direct map to manipulate Xen
> > > page
> > > tables, we can now finally remove the direct map altogether.
> > > 
> > > This series:
> > > - fixes many places that use the direct map incorrectly or assume
> > > the
> > >   presence of an always-mapped direct map in a wrong way.
> > > - includes the early vmap patches for global mappings.
> > > - initialises the mapcache for all domains, disables the fast path
> > > that
> > >   uses the direct map for mappings.
> > > - maps and unmaps xenheap on-demand.
> > > - adds a boot command line switch to enable or disable the direct
> > > map.
> > > 
> > > This previous version was in RFC state and can be found here:
> > > 
> https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg02647.html
> > > ,
> > > which has since been broken into small series.
> > 
> > OOI have you done any performance measurements?
> > 
> > Seeing that now even guest table needs mapping / unmapping during
> > restore, I'm curious to know how that would impact performance.
> 
> I actually have a lot of performance numbers but unfortunately on an
> older version of Xen, not staging. I need to evaluate it again before
> coming back to you. As you suspected, one strong signal from the
> performance results is definitely the impact of walking guest tables.
> For EPT, mapping and unmapping 20 times is no fun. This shows up in
> micro-benchmarks, although larger benchmarks tend to be fine.
> 
> My question is, do we care about hiding EPT? I think it is fine to just
> use xenheap pages (or any other form which does the job) so that we go
> down from 20 mappings to only 4. I have done this hack with EPT and saw
> significantly reduced impact for HVM guests in micro-benchmarks.

Not sure about hiding EPT. I will leave this question to Jan and
Andrew...

Wei.

> 
> Hongyan
> 

