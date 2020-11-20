Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7D2BA59C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 10:13:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31806.62504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg2To-0001L2-Il; Fri, 20 Nov 2020 09:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31806.62504; Fri, 20 Nov 2020 09:13:20 +0000
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
	id 1kg2To-0001Kc-F0; Fri, 20 Nov 2020 09:13:20 +0000
Received: by outflank-mailman (input) for mailman id 31806;
 Fri, 20 Nov 2020 09:13:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GrQD=E2=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kg2Tm-0001KT-QK
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:13:18 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7142d15-b95a-4b6b-8262-c42da1162098;
 Fri, 20 Nov 2020 09:13:17 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AK9DBok002911
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 10:13:12 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 392B42E9CA8; Fri, 20 Nov 2020 10:13:06 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GrQD=E2=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kg2Tm-0001KT-QK
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 09:13:18 +0000
X-Inumbo-ID: f7142d15-b95a-4b6b-8262-c42da1162098
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f7142d15-b95a-4b6b-8262-c42da1162098;
	Fri, 20 Nov 2020 09:13:17 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AK9DBok002911
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2020 10:13:12 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 392B42E9CA8; Fri, 20 Nov 2020 10:13:06 +0100 (MET)
Date: Fri, 20 Nov 2020 10:13:06 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201120091306.GE1508@antioche.eu.org>
References: <20201118121403.GC3126@antioche.eu.org>
 <20201118143928.hvamuf7t7jycsrzb@Air-de-Roger>
 <bb2b6182-f3a6-61e5-ee70-90a65ae56435@suse.com>
 <20201119141915.igyb7djkw47rf2dt@Air-de-Roger>
 <20201119155718.GB4104@antioche.eu.org>
 <20201119165734.GA4903@antioche.eu.org>
 <20201119175733.GA6067@antioche.eu.org>
 <1a50e1e2-b69c-afd6-a179-316231512004@suse.com>
 <20201120082855.5z4cibcd5djlwmgp@Air-de-Roger>
 <5e637a72-085d-45b9-aa5c-01e138c81875@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e637a72-085d-45b9-aa5c-01e138c81875@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 20 Nov 2020 10:13:12 +0100 (MET)

On Fri, Nov 20, 2020 at 09:54:42AM +0100, Jan Beulich wrote:
> [...]
> >From the stack trace above the only possibility I could derive for
> now would be that we didn't run softirqs for a long time, but I don't
> think that's very realistic here. Otoh, Manuel, does the NMI watchdog
> work on that system? It certainly wouldn't hurt if you turned it on,
> just in case.

I just did, this doesn't changes anything.
For the record, my boot params are now

menu=Boot Xen PVH:load /test console=com0 root=dk0 -vx; multiboot /xen-test.gz dom0_mem=1024M console=com2 com2=57600,8n1,,0 loglvl=all guest_loglvl=all gnttab_max_nr_frames=64 dom0=pvh iommu=debug dom0_vcpus_pin sync_console dom0_max_vcpus=1 watchdog=force

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

