Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135C11C1549
	for <lists+xen-devel@lfdr.de>; Fri,  1 May 2020 15:53:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUW6L-0004Bh-JR; Fri, 01 May 2020 13:53:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Po+f=6P=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jUW6K-0004Bc-IU
 for xen-devel@lists.xenproject.org; Fri, 01 May 2020 13:53:12 +0000
X-Inumbo-ID: 18c1d566-8bb3-11ea-b9cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18c1d566-8bb3-11ea-b9cf-bc764e2007e4;
 Fri, 01 May 2020 13:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
 References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2y+h/GQCApgQHTFNSrRWEFRKreTRyjQ3vsBBRSP0fI=; b=VZkzW0mdgC07Vmj3+UOx5Jibre
 kzwFx3BPetv4xxRtSiUvvHBRSoHMHUkOPxyFr+uzHxoq4Fi4MTdFisqfaYLUic8cMd5a8Un1zByZT
 8Y0YsiV1mr5jsPtV6NCucbYSXCHgf8yFCvthv+qnso0RLGB8BdovWu55x3zdqln4BHbQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jUW6J-0002U0-H7; Fri, 01 May 2020 13:53:11 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jUW6J-0004y6-3U; Fri, 01 May 2020 13:53:11 +0000
Message-ID: <689a7c860a8a551e3b6009b16590e812dbf21055.camel@xen.org>
Subject: Re: [PATCH 00/16] Remove the direct map
From: Hongyan Xia <hx242@xen.org>
To: Wei Liu <wl@xen.org>
Date: Fri, 01 May 2020 14:53:08 +0100
In-Reply-To: <20200501120715.hjak2gjp7ialwfq5@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <cover.1588278317.git.hongyxia@amazon.com>
 <20200501120715.hjak2gjp7ialwfq5@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 2020-05-01 at 12:07 +0000, Wei Liu wrote:
> On Thu, Apr 30, 2020 at 09:44:09PM +0100, Hongyan Xia wrote:
> > From: Hongyan Xia <hongyxia@amazon.com>
> > 
> > This series depends on Xen page table domheap conversion:
> > 
https://lists.xenproject.org/archives/html/xen-devel/2020-04/msg01374.html
> > .
> > 
> > After breaking the reliance on the direct map to manipulate Xen
> > page
> > tables, we can now finally remove the direct map altogether.
> > 
> > This series:
> > - fixes many places that use the direct map incorrectly or assume
> > the
> >   presence of an always-mapped direct map in a wrong way.
> > - includes the early vmap patches for global mappings.
> > - initialises the mapcache for all domains, disables the fast path
> > that
> >   uses the direct map for mappings.
> > - maps and unmaps xenheap on-demand.
> > - adds a boot command line switch to enable or disable the direct
> > map.
> > 
> > This previous version was in RFC state and can be found here:
> > 
https://lists.xenproject.org/archives/html/xen-devel/2019-09/msg02647.html
> > ,
> > which has since been broken into small series.
> 
> OOI have you done any performance measurements?
> 
> Seeing that now even guest table needs mapping / unmapping during
> restore, I'm curious to know how that would impact performance.

I actually have a lot of performance numbers but unfortunately on an
older version of Xen, not staging. I need to evaluate it again before
coming back to you. As you suspected, one strong signal from the
performance results is definitely the impact of walking guest tables.
For EPT, mapping and unmapping 20 times is no fun. This shows up in
micro-benchmarks, although larger benchmarks tend to be fine.

My question is, do we care about hiding EPT? I think it is fine to just
use xenheap pages (or any other form which does the job) so that we go
down from 20 mappings to only 4. I have done this hack with EPT and saw
significantly reduced impact for HVM guests in micro-benchmarks.

Hongyan


