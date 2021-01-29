Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE703087FF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78006.141696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RVw-0003O5-5d; Fri, 29 Jan 2021 11:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78006.141696; Fri, 29 Jan 2021 11:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RVw-0003Ng-2X; Fri, 29 Jan 2021 11:00:32 +0000
Received: by outflank-mailman (input) for mailman id 78006;
 Fri, 29 Jan 2021 11:00:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fs4s=HA=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5RVu-0003Nb-U8
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:00:30 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2804938-50c1-46c3-8fe4-ecca072ef8cd;
 Fri, 29 Jan 2021 11:00:29 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10TB0Q9C021792;
 Fri, 29 Jan 2021 12:00:26 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 30007281D; Fri, 29 Jan 2021 12:00:26 +0100 (CET)
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
X-Inumbo-ID: c2804938-50c1-46c3-8fe4-ecca072ef8cd
Date: Fri, 29 Jan 2021 12:00:26 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] NetBSD hotplug: fix block unconfigure on destroy
Message-ID: <20210129110026.GJ2015@antioche.eu.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-3-bouyer@netbsd.org>
 <YBKjxWbrlW+RgT1u@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YBKjxWbrlW+RgT1u@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 29 Jan 2021 12:00:26 +0100 (MET)

On Thu, Jan 28, 2021 at 12:45:09PM +0100, Roger Pau Monné wrote:
> On Tue, Jan 26, 2021 at 11:47:49PM +0100, Manuel Bouyer wrote:
> > When a domain is destroyed, xparams may not be available any more when
> > the block script is called to unconfigure the vnd.
> > Check xparam only at configure time, and just unconfigure any vnd present
> > in the xenstore.
> 
> Can you paste the output of `xl -vvv destroy ...` when this happens?
> I'm puzzled as to why the nodes would be removed before hotplug script
> execution. Could this somehow be done by NetBSD blkback?

I'll try. I've seen it mostly while running automated tests, so I'm
not sure I can reliably reproduce it.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

