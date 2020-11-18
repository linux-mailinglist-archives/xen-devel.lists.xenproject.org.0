Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D552B7A5E
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29653.59235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJlQ-0006Hh-3e; Wed, 18 Nov 2020 09:28:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29653.59235; Wed, 18 Nov 2020 09:28:32 +0000
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
	id 1kfJlQ-0006HI-09; Wed, 18 Nov 2020 09:28:32 +0000
Received: by outflank-mailman (input) for mailman id 29653;
 Wed, 18 Nov 2020 09:28:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QZvP=EY=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kfJlN-0006HD-V5
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:28:29 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a2ac49f-803b-43d9-93ad-2492f99da677;
 Wed, 18 Nov 2020 09:28:29 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AI9SOHZ001422
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 10:28:25 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 40B382E9CA8; Wed, 18 Nov 2020 10:28:19 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QZvP=EY=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kfJlN-0006HD-V5
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:28:29 +0000
X-Inumbo-ID: 1a2ac49f-803b-43d9-93ad-2492f99da677
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1a2ac49f-803b-43d9-93ad-2492f99da677;
	Wed, 18 Nov 2020 09:28:29 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0AI9SOHZ001422
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2020 10:28:25 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 40B382E9CA8; Wed, 18 Nov 2020 10:28:19 +0100 (MET)
Date: Wed, 18 Nov 2020 10:28:19 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201118092819.GE1085@antioche.eu.org>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <8039a29c-4058-ab6e-56ef-d1383deb7e38@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8039a29c-4058-ab6e-56ef-d1383deb7e38@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Wed, 18 Nov 2020 10:28:25 +0100 (MET)

On Wed, Nov 18, 2020 at 10:16:17AM +0100, Jan Beulich wrote:
> On 17.11.2020 17:40, Manuel Bouyer wrote:
> > On Tue, Nov 17, 2020 at 04:58:07PM +0100, Roger Pau Monné wrote:
> >> [...]
> >>
> >> I have attached a patch below that will dump the vIO-APIC info as part
> >> of the 'i' debug key output, can you paste the whole output of the 'i'
> >> debug key when the system stalls?
> > 
> > see attached file. Note that the kernel did unstall while 'i' output was
> > being printed, so it is mixed with some NetBSD kernel output.
> 
> Could you try to run Xen's serial port without use of any IRQ
> (i.e. in "polling" mode), in an attempt to avoid this unstalling
> (which is likely to render the resulting output at least in part
> meaningless)?

It there a boot line option for that ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

