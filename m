Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B37E72E9330
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 11:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61056.107142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMyp-0008Ud-1c; Mon, 04 Jan 2021 10:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61056.107142; Mon, 04 Jan 2021 10:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwMyo-0008UE-UX; Mon, 04 Jan 2021 10:20:50 +0000
Received: by outflank-mailman (input) for mailman id 61056;
 Mon, 04 Jan 2021 10:20:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwMyn-0008U9-0u
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:20:49 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb6cfb95-c568-4a75-93f7-d97646e88084;
 Mon, 04 Jan 2021 10:20:45 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104AKbIC005829;
 Mon, 4 Jan 2021 11:20:37 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 5EBA5281D; Mon,  4 Jan 2021 11:20:37 +0100 (CET)
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
X-Inumbo-ID: eb6cfb95-c568-4a75-93f7-d97646e88084
Date: Mon, 4 Jan 2021 11:20:37 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [PATCH 05/24] Introduce locking functions for block device setup
 on NetBSD
Message-ID: <20210104102037.GA2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-6-bouyer@netbsd.org>
 <20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 04 Jan 2021 11:20:37 +0100 (MET)

On Tue, Dec 29, 2020 at 12:29:09PM +0100, Roger Pau Monné wrote:
> I think you want tot CC the tools dev on this one, specially Ian who
> knows how the Linux one is implemented and can likely give valuable
> input.
> 
> On Mon, Dec 14, 2020 at 05:36:04PM +0100, Manuel Bouyer wrote:
> > ---
> >  tools/hotplug/NetBSD/Makefile   |  1 +
> >  tools/hotplug/NetBSD/block      |  5 ++-
> >  tools/hotplug/NetBSD/locking.sh | 72 +++++++++++++++++++++++++++++++++
> 
> Seeing the file itself, I don't think there's any NetBSD specific
> stuff, so we might want to consider putting it in BSD/ instead, so it
> can be used by FreeBSD also?

I'm not sure if FreeBSD needs the locking stuff.
Also, there are certainly differences in block device handling between
FreeBSD and NetBSD. Both OSes have diverged in this area.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

