Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C2B2C2B07
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 16:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36538.68478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kha59-0002u7-ME; Tue, 24 Nov 2020 15:18:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36538.68478; Tue, 24 Nov 2020 15:18:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kha59-0002ti-J3; Tue, 24 Nov 2020 15:18:15 +0000
Received: by outflank-mailman (input) for mailman id 36538;
 Tue, 24 Nov 2020 15:18:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPq8=E6=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kha57-0002td-Iw
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:18:13 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d710ba67-ca12-47b6-b0ee-10dfec5c0959;
 Tue, 24 Nov 2020 15:18:12 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AOFI6RA001750
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 16:18:07 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id C56B52E9CAC; Tue, 24 Nov 2020 16:18:01 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=UPq8=E6=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kha57-0002td-Iw
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 15:18:13 +0000
X-Inumbo-ID: d710ba67-ca12-47b6-b0ee-10dfec5c0959
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d710ba67-ca12-47b6-b0ee-10dfec5c0959;
	Tue, 24 Nov 2020 15:18:12 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AOFI6RA001750
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 24 Nov 2020 16:18:07 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id C56B52E9CAC; Tue, 24 Nov 2020 16:18:01 +0100 (MET)
Date: Tue, 24 Nov 2020 16:18:01 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201124151801.GO2020@antioche.eu.org>
References: <20201120103824.GJ1508@antioche.eu.org>
 <20201123095713.orfpg72r73m7f46n@Air-de-Roger>
 <20201123113241.GE2520@antioche.eu.org>
 <20201123125112.q3zqb4e5nk6jg4hw@Air-de-Roger>
 <20201123143150.GG2520@antioche.eu.org>
 <20201123170610.kzfxvcgkdkvh3ex4@Air-de-Roger>
 <20201123173925.GG4662@antioche.eu.org>
 <b3912e97-9684-fe97-1053-ad7168a19721@suse.com>
 <ee63d6c2-4d0f-a3b7-37d0-8ce45c9e6fb1@suse.com>
 <20201124145927.zrbsmvs6qvaxh4hf@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201124145927.zrbsmvs6qvaxh4hf@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Tue, 24 Nov 2020 16:18:07 +0100 (MET)

On Tue, Nov 24, 2020 at 03:59:27PM +0100, Roger Pau Monné wrote:
> [...]
> 
> Sorry Manuel, you seem to have hit some kind of weird bug regarding
> interrupt management. If you want to progress further with NetBSD PVH
> dom0 it's likely to work on a different box,

the problem is, I don't have a different box with iommu to test it yet.

> but I would ask if you
> can keep the current box in order for us to continue debugging.

This systems isn't in production yet, and I can probably delay migrating the
domUs some more. I think we have 2 more weeks to work on this.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

