Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB461F994A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 15:49:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpTN-0004ij-P8; Mon, 15 Jun 2020 13:48:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7yVv=74=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jkpTM-0004ib-93
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 13:48:24 +0000
X-Inumbo-ID: e10bee16-af0e-11ea-b7fc-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e10bee16-af0e-11ea-b7fc-12813bfff9fa;
 Mon, 15 Jun 2020 13:48:23 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: aBBBU2g03LugTNHfIOz64CIynLCdrXlWJMMpPaL7zydFaZpBZhwrcIBYm0d58Fihmv64Ra4L1p
 kNLbmx4dPMMrRI8+hT7DqT2mi6KYYFPUuscm45kxZJnX1hsbeO8LqoqC2Ms/Hx/4fq1f25SJ7N
 P4FeG1KLmnHOhZi0kCug61xeIYk6YiI9NkQzDTgknTDx4feMRkGro7uhIfBoIfX2YfrErHezQQ
 e3rmqk/yCXIiHsOlEQjiTwgviUdllzaHvHxDgiEXOyD8wyX1ttvNQXTsSg8CLqYwLmuCtDg95o
 0Wc=
X-SBRS: 2.7
X-MesageID: 20296205
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20296205"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24295.31778.201405.748753@mariner.uk.xensource.com>
Date: Mon, 15 Jun 2020 14:48:18 +0100
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH for-4.14] tools: check go compiler version if present
In-Reply-To: <20200612215028.GA6286@six>
References: <d2ca8de34a0711313e5eb1d5fb7d438ff3add7d0.1591971605.git.rosbrookn@ainfosec.com>
 <24291.45045.185355.587474@mariner.uk.xensource.com>
 <20200612215028.GA6286@six>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Nick Rosbrook writes ("Re: [PATCH for-4.14] tools: check go compiler version if present"):
> On Fri, Jun 12, 2020 at 05:40:21PM +0100, Ian Jackson wrote:
> > Nick Rosbrook writes ("[PATCH for-4.14] tools: check go compiler version if present"):
> > > Currently, no minimum go compiler version is required by the configure
> > > scripts. However, the go bindings actually will not build with some
> > > older versions of go. Add a check for a minimum go version of 1.11.1 in
> > > accordance with tools/golang/xenlight/go.mod.
...
> > I don't understand this code.  Why are you checking $enable_golang in
> > your new code whereas the old code checks $golang ?  I actually read
> > the generated code trying to see where $golang is set and AFAICT it is
> > only ever set to n ?
> 
> For some background, in an attempt to be consistent with existing code
> here, I basically copied the logic for enabling the ocaml tools. 
> 
> The logic is setup in a way that (unless --disable-golang is set) if a
> suitable version of the go compiler is found, then golang is enabled by
> default. If, however, a suitable go compiler is not found (either go
> is not present at all, or it is too old), then golang is disabled. This
> part happens silently unless --enable-golang is _explicitly_ set by the
> user, in which case an error is thrown by ./configure. This is why
> $enable_golang is checked.

Thanks.  Well, I have to say I still don't understand the code.

But as you note, the behaviour you describe is the one I would want.
And the confusingness doesn't seem to have been your fault.  It would
probably be worse to have two different arrangements.  Let's leave it
as it is for now.

> > This is all very weird.  Surely golang should be enabled by default
> > when the proper compiler is present, and disabled by default
> > otherwise.  I think this effect will be quite hard to achieve with
> > AX_ARG_DEFAULT_ENABLE.  Probably you should be using AC_ARG_ENABLE
> > and doing the defaulting yourself so that you can use a computed
> > default etc.
> 
> I believe the behavior you described here is the same as I described
> above (and is acheived in this patch). But, I'm happy to re-work the
> implementation if necessary so that the code is more clear.

Ideally at some point maybe we would make this clearer but not now.

Have you tested the situations you describe ?  That might be a better
way of checking that it's right than the code inspection which is
obviously failing for me now...

I definitely think we want to fix this for 4.14.  So thanks for your
continued help!

Ian.

