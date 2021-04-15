Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F17360FEC
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 18:12:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111402.213072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4bN-0004ax-65; Thu, 15 Apr 2021 16:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111402.213072; Thu, 15 Apr 2021 16:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX4bN-0004aY-2o; Thu, 15 Apr 2021 16:12:21 +0000
Received: by outflank-mailman (input) for mailman id 111402;
 Thu, 15 Apr 2021 16:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EEd9=JM=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lX4bL-0004aS-7P
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 16:12:19 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5e8f163-cc83-4c59-b42d-6a572eefc5f2;
 Thu, 15 Apr 2021 16:12:18 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lX4bJ-0008N1-QH; Thu, 15 Apr 2021 16:12:17 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e5e8f163-cc83-4c59-b42d-6a572eefc5f2
Date: Thu, 15 Apr 2021 17:12:17 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/shadow: adjust callback arrays
Message-ID: <YHhl4dej9GnFakkj@deinos.phlegethon.org>
References: <621aa6f6-d7f8-25eb-9aeb-f181a9cb3bbc@suse.com>
 <YHhi19OqHN2cqMBA@deinos.phlegethon.org>
 <20c9d5b3-6194-0e55-d6a1-94fd3323bb69@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20c9d5b3-6194-0e55-d6a1-94fd3323bb69@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 18:03 +0200 on 15 Apr (1618509812), Jan Beulich wrote:
> On 15.04.2021 17:59, Tim Deegan wrote:
> > At 12:42 +0200 on 12 Apr (1618231332), Jan Beulich wrote:
> >> Some of them have entries with stale comments. Rather than correcting
> >> these comments, re-arrange how these arrays get populated, shrinking
> >> their sizes at the same time (by omitting trailing NULL entries: Use
> >> dedicated element initializers, serving the purpose of what the
> >> comments did so far. This then also makes these arrays independent of
> >> the actual ordering of the individual SH_type_*.
> >>
> >> While tightening respective ASSERT()s in hash_{vcpu,domain}_foreach(),
> >> also tighten related ones in shadow_hash_{insert,delete}().
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Looks good, but please leave the arrays at full size.  With the full
> > array, a bug could lead to an assertion failure or NULL deref; with
> > a short array it could mean following a bogus funtion pointer.
> > 
> > With that change, Acked-by: Tim Deegan <tim@xen.org>
> 
> Thanks, but let me ask back about which of the two possble meanings
> of "full" you mean: Dimensioned by SH_type_unused, or dimensioned
> by SH_type_max_shadow + 1? The former would leave the arrays as they
> are now, while the latter would shrink them a little.

As they are now, please.

Cheers,

Tim.

