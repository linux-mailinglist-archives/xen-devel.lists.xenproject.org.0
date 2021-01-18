Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAEC2FA903
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:41:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69979.125507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZSe-0000dc-SJ; Mon, 18 Jan 2021 18:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69979.125507; Mon, 18 Jan 2021 18:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZSe-0000dD-P2; Mon, 18 Jan 2021 18:41:08 +0000
Received: by outflank-mailman (input) for mailman id 69979;
 Mon, 18 Jan 2021 18:41:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skM3=GV=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l1ZSc-0000d8-Uk
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:41:06 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0006f9a3-1577-4a01-ba0f-4dc6f87fede8;
 Mon, 18 Jan 2021 18:41:05 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10IIf0wB000564;
 Mon, 18 Jan 2021 19:41:00 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 17387281D; Mon, 18 Jan 2021 19:41:00 +0100 (CET)
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
X-Inumbo-ID: 0006f9a3-1577-4a01-ba0f-4dc6f87fede8
Date: Mon, 18 Jan 2021 19:41:00 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD: remove xenbackendd
Message-ID: <20210118184100.GA910@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-6-bouyer@antioche.eu.org>
 <20210115153105.nuqikbadcb2q6ic5@Air-de-Roger>
 <a37c7fff-44e1-2058-9d12-6ad7ea5c51ba@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a37c7fff-44e1-2058-9d12-6ad7ea5c51ba@citrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Mon, 18 Jan 2021 19:41:00 +0100 (MET)

On Mon, Jan 18, 2021 at 06:31:45PM +0000, Andrew Cooper wrote:
> On 15/01/2021 15:31, Roger Pau Monné wrote:
> > On Tue, Jan 12, 2021 at 07:12:26PM +0100, Manuel Bouyer wrote:
> >> From: Manuel Bouyer <bouyer@netbsd.org>
> >>
> >> NetBSD doens't need xenbackendd with xl toolstack so don't build it.
> >> Remove now unused xenbackendd directory/files.
> >>
> >> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> >
> > Thanks, Roger.
> 
> $ git grep backendd -- :/
> ../.gitignore:282:tools/xenbackendd/_paths.h
> ../.gitignore:283:tools/xenbackendd/xenbackendd
> ../tools/hotplug/Linux/init.d/sysconfig.xencommons.in:91:## Default: Not
> defined, xenbackendd debug mode off
> ../tools/hotplug/Linux/init.d/sysconfig.xencommons.in:93:# Running
> xenbackendd in debug mode
> ../tools/hotplug/NetBSD/block:4:# Called by xenbackendd
> ../tools/hotplug/NetBSD/rc.d/xencommons.in:25:XENBACKENDD_PIDFILE="@XEN_RUN_DIR@/xenbackendd.pid"
> ../tools/hotplug/NetBSD/vif-bridge:4:# Called by xenbackendd
> ../tools/hotplug/NetBSD/vif-ip:4:# Called by xenbackendd
> 
> I propose folding in the following deletions, if you're both happy?

Sure, please do !

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

