Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C57F224D7E
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 20:20:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwrRx-00038Z-C5; Sat, 18 Jul 2020 18:20:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=++/D=A5=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1jwrRv-00038R-UD
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 18:20:39 +0000
X-Inumbo-ID: 619f2510-c923-11ea-b7bb-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 619f2510-c923-11ea-b7bb-bc764e2007e4;
 Sat, 18 Jul 2020 18:20:39 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1jwrRt-000Cou-3S; Sat, 18 Jul 2020 18:20:37 +0000
Date: Sat, 18 Jul 2020 19:20:37 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 5/5] x86/shadow: l3table[] and gl3e[] are HVM only
Message-ID: <20200718182037.GA48915@deinos.phlegethon.org>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
 <a3b9b496-e860-e657-2afc-c0658871fa3f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <a3b9b496-e860-e657-2afc-c0658871fa3f@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

At 12:00 +0200 on 15 Jul (1594814409), Jan Beulich wrote:
> ... by the very fact that they're 3-level specific, while PV always gets
> run in 4-level mode. This requires adding some seemingly redundant
> #ifdef-s - some of them will be possible to drop again once 2- and
> 3-level guest code doesn't get built anymore in !HVM configs, but I'm
> afraid there's still quite a bit of disentangling work to be done to
> make this possible.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Looks good.  It seems like the new code for '3-level non-HVM' in
guest-walks ought to have some sort of assert-unreachable in them too
- or is there a reason to to?

Cheers,

Tim.


