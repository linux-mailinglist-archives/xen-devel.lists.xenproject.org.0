Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156591DE864
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 15:55:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc88b-0008U9-7T; Fri, 22 May 2020 13:55:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc88Z-0008U4-I4
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 13:54:59 +0000
X-Inumbo-ID: d28a5992-9c33-11ea-ae69-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d28a5992-9c33-11ea-ae69-bc764e2007e4;
 Fri, 22 May 2020 13:54:58 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: LOEMMvQG1ac9ouyD5JCkDfvFyZREDLzgACTZ7g+zx61aJv5f68UArgf0/6vGVvrDjGAhps7zm5
 FtHqkmdbfBRzfrufN+xt+E6qeSZesySCVtgVBKEYBl4TUk4K6irHifXGaFMLQk3yPrN7Zyxt2m
 4vA4qrebewRiE0kyd+UvvqMjlr0QVPxpz8XX55ZQf5E0C5l4t0lE6VoCYO5cGXdvgv8BIK+QQ4
 kiSt2hQ6OgN/iKwX6AM+9UE59xvF17VMMIraNWTdadK5lJqqDrJt7+BBJuz5RimStYPcRBVpqV
 OX8=
X-SBRS: 2.7
X-MesageID: 18543226
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,422,1583211600"; d="scan'208";a="18543226"
Date: Fri, 22 May 2020 15:54:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4] x86/idle: prevent entering C6 with in service
 interrupts on Intel
Message-ID: <20200522135429.GD54375@Air-de-Roger>
References: <20200521092258.82503-1-roger.pau@citrix.com>
 <b59a2d2e-e66d-f3a1-dd85-fd7c7eccc98a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <b59a2d2e-e66d-f3a1-dd85-fd7c7eccc98a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 03:42:10PM +0200, Jan Beulich wrote:
> On 21.05.2020 11:22, Roger Pau Monne wrote:
> > Apply a workaround for Intel errata BDX99, CLX30, SKX100, CFW125,
> > BDF104, BDH85, BDM135, KWB131: "A Pending Fixed Interrupt May Be
> > Dispatched Before an Interrupt of The Same Priority Completes".
> 
> While the change looks good to me as far as Broadwell goes, I
> think it was before this posting that Andrew also pointed at
> a specific Haswell erratum instance, still on the v3 thread.
> Am I to imply a v5 will follow adding affected Haswell models
> to the table?

Those refer to a different errata, see:

https://lore.kernel.org/xen-devel/84486d84-4452-af18-f7e7-753faf5a125d@citrix.com/

So we believe this also affects Haswell, but the errata is not published
for those CPUs (yet at least). If/when it's published I'm happy to add
it, in the meantime I think we should go with what has been published
by Intel.

Roger.

