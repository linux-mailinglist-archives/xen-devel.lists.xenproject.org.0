Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903E1E6649
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 17:37:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeKaa-0003mm-7i; Thu, 28 May 2020 15:37:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTQv=7K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jeKaZ-0003mh-AJ
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 15:36:59 +0000
X-Inumbo-ID: 10ec624c-a0f9-11ea-9947-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10ec624c-a0f9-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 15:36:58 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fW9UcRnGtaSb/vQbF641kwn586xwA1LwZHfddXB+nK3WepsVMyx1sDlsiOEs32UkPyqbzyc1NT
 fm3wZkgmXhG2Zq7OFSfRho9E86TMfhtFiqN1QSBQTlUj8omLtRSrYyCS0oH8WJFGU10loMclO0
 RBPaq0CI6ZInpHkMQhEzjDQWeWeOv0byxapIs+rS3m0r6RMPzzD3RanE4MHsTMScv9GZ9YxYpF
 FOUgd/FkjxPvGtyurdGDK4EDopUZRTzIBYWg3IybRLiMJUeT+KlXJgAIlFsjzlIQYO0QndLzj+
 m44=
X-SBRS: 2.7
X-MesageID: 18969184
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,445,1583211600"; d="scan'208";a="18969184"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24271.55958.888390.570837@mariner.uk.xensource.com>
Date: Thu, 28 May 2020 16:36:54 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [OSSTEST PATCH 01/38] ts-logs-capture: Cope if xl shutdown leaves
 domain running for a bit
In-Reply-To: <CAKf6xpt-0MRhFnQz2VBfdYEgE8GtPCj=mK+t-aQ88uTsJtL_sw@mail.gmail.com>
References: <20200519190230.29519-1-ian.jackson@eu.citrix.com>
 <20200519190230.29519-2-ian.jackson@eu.citrix.com>
 <CAKf6xpt-0MRhFnQz2VBfdYEgE8GtPCj=mK+t-aQ88uTsJtL_sw@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("Re: [OSSTEST PATCH 01/38] ts-logs-capture: Cope if xl shutdown leaves domain running for a bit"):
> My understanding is shutdown happens first when the guest stops and
> destruction happens afterward when all the resources are cleaned up.
> So your race is that the domain shutdown, but it still shows up in `xl
> list` since it hasn't been destroyed.
> 
> OpenXT has a hack to only wait for destruction
> https://github.com/OpenXT/xenclient-oe/blob/master/recipes-extended/xen/files/xl-shutdown-wait-for-domain-death.patch.
> I didn't write it, and the explanation isn't specific, but I think the
> purpose is to all resources are released before the OpenXT toolstack
> proceeds with (blktap) cleanup.
> 
> Maybe a new `xl shutdown` flag to wait for domain destruction would be
> worthwhile?

Yes!  Repeating the -w flag maybe.

Ian.

