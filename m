Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C532C8220
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:28:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40794.73733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgQD-000830-VB; Mon, 30 Nov 2020 10:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40794.73733; Mon, 30 Nov 2020 10:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgQD-00082b-S0; Mon, 30 Nov 2020 10:28:41 +0000
Received: by outflank-mailman (input) for mailman id 40794;
 Mon, 30 Nov 2020 10:28:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I3zd=FE=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kjgQC-00082V-Cy
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:28:40 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f038c638-b2bf-4372-9635-c787039fffda;
 Mon, 30 Nov 2020 10:28:38 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0AUASTND013861
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 11:28:30 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 7138D2E9CAC; Mon, 30 Nov 2020 11:28:24 +0100 (MET)
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
X-Inumbo-ID: f038c638-b2bf-4372-9635-c787039fffda
Date: Mon, 30 Nov 2020 11:28:24 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201130102824.GB1084@antioche.eu.org>
References: <20201127131324.GJ1717@antioche.eu.org>
 <714e9393-d7f4-ed47-d1ed-aff79f3552a0@suse.com>
 <20201127133121.GN1717@antioche.eu.org>
 <96aa5a9b-3f4a-ce9d-0f41-4a24d409ed55@suse.com>
 <20201127135929.GR1717@antioche.eu.org>
 <20201127202211.eqrxloii5x54zode@Air-de-Roger>
 <20201127214420.GA637@antioche.eu.org>
 <20201128145311.3gmzq5lnkz6ajdtr@Air-de-Roger>
 <20201128171430.GB631@antioche.eu.org>
 <819e859e-0fd2-cdbf-6126-46c924364d12@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <819e859e-0fd2-cdbf-6126-46c924364d12@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 30 Nov 2020 11:28:30 +0100 (MET)

On Mon, Nov 30, 2020 at 11:00:23AM +0100, Jan Beulich wrote:
> On 28.11.2020 18:14, Manuel Bouyer wrote:
> > On Sat, Nov 28, 2020 at 03:53:11PM +0100, Roger Pau Monn� wrote:
> >>> the trace is at
> >>> http://www-soc.lip6.fr/~bouyer/xen-log13.txt
> >>
> >> Thanks! I think I've found the issue and I'm attaching a possible fix
> >> (fix.patch) to this email. In any case I've also attached a further
> >> debug patch, in case the fix turns out to be wrong. Please test the
> >> fix first, as the debug patch will end up triggering a panic when the
> >> buffer is full.
> > 
> > Yes, fix.patch does make the system boot as expected !
> 
> May I translate this to a Tested-by?

Sure !

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

