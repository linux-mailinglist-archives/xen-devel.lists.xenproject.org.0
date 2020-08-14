Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC31244BCE
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 17:19:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6bUX-000729-IU; Fri, 14 Aug 2020 15:19:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iRrF=BY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1k6bUW-000724-Di
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 15:19:36 +0000
X-Inumbo-ID: 0256ae42-0195-4171-bf23-6bd31a0273a9
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0256ae42-0195-4171-bf23-6bd31a0273a9;
 Fri, 14 Aug 2020 15:19:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c19so8585882wmd.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2020 08:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=te807tuAGkjP2TPZQp75B3jcqgiNd2ahjVzsgvpxUUY=;
 b=foL4eu4sMMiZB6pa+Wa+dTFXDTPENMv0prd+JGxIiIwjjcyKIESu7OBv2wJ8uqJ0zG
 Ye3OBWGKmJFFvSTn0gC/nu/y/b4DOnZko3ojuvk1t8hlBivYewC7PJ9WbFx9iu1IYxYw
 xRpF3M2gPzTafPw9GLXLECFUqgbo6NcZW+4K8H1kBggie4J3GLpSDqWDG0mHB5zEz15Z
 8dzRY9/8H0pxoP2FWhBzC9FBgC6yiPdTVYkxOIo15h1bIBmxg5acoSMSdmoi0EKlu68m
 6genvYy8Zg+TO7PANrNw41D1wBllf/57yDJUW0KasM5DzP1rq1bOdM2TyuU+m+8uRQhQ
 lYdA==
X-Gm-Message-State: AOAM533xcX8mkwnJtVIQY8wQUj2KdDT7m1awwwXif/ICoSDiSN3i26B7
 o7qYXq6Vs4epchesWO2B5IQ=
X-Google-Smtp-Source: ABdhPJxS9pEGAId9b4erXauZ08frd8AE1N5tK42bvjxgM6d3oiyNybzJ3tun2n9CHEdgEdQ/vfMEjg==
X-Received: by 2002:a05:600c:21c2:: with SMTP id
 x2mr3085247wmj.142.1597418374849; 
 Fri, 14 Aug 2020 08:19:34 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id i22sm17994498wrb.45.2020.08.14.08.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 08:19:34 -0700 (PDT)
Date: Fri, 14 Aug 2020 15:19:32 +0000
From: Wei Liu <wl@xen.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Ian Jackson <ian.jackson@citrix.com>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do not abort xenstore-ls
 if a node disappears while iterating
Message-ID: <20200814151932.fo4eqpofbx2xnqyf@liuwe-devbox-debian-v2>
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <6ff2589e-3cb9-a8a3-ea22-0798b0574eb0@suse.com>
 <b9535ad9a1cc8a7c3a9aeb2fc5e7ea7560966ebb.camel@infradead.org>
 <336e14a1-2c8b-8257-de40-3c6305a4ffcb@suse.com>
 <24180.53085.835170.696701@mariner.uk.xensource.com>
 <8c5ccb8d5f3cb3426b5782cc80391c9f8bcb71b8.camel@infradead.org>
 <af5af47c-31ab-09bd-2f05-e5e2ce34780d@suse.com>
 <24194.8279.169315.476575@mariner.uk.xensource.com>
 <24194.8458.419698.4513@mariner.uk.xensource.com>
 <f139a3378b46a9d9ec84da26d40e3431384c49f2.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f139a3378b46a9d9ec84da26d40e3431384c49f2.camel@infradead.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 14, 2020 at 03:23:10PM +0100, David Woodhouse wrote:
> On Mon, 2020-03-30 at 17:40 +0100, Ian Jackson wrote:
> > Ian Jackson writes ("Re: [Xen-devel] [PATCH 1/2] tools/xenstore: Do
> > not abort xenstore-ls if a node disappears while iterating"):
> > > And making a node visible by XS_DIRECTORY[_PART] doesn't count as
> > > reading it.  But it does count as reading the parent ?
> > > In principle adding or removing a node could be made to count as a
> > > change to the containing directory.  But I don't think doing this
> > > as a
> > > response to David's issue is sensible.
> > 
> > So, err, putting that together and reviewing the state of the world:
> > 
> > I still think David's 1/ patch is good.
> > Everyone else: is there some reason we shouldn't commit 1/
> > immediately ?

OK I will turn this into an ack and apply this patch. Sorry this fell
off my radar somehow.

Wei.

> 
> It was deliberately split out so that it could indeed be applied
> immediately when it was posted in March.



