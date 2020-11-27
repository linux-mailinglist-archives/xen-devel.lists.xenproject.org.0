Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4272C668C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:19:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39307.72160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kideB-00077X-QM; Fri, 27 Nov 2020 13:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39307.72160; Fri, 27 Nov 2020 13:18:47 +0000
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
	id 1kideB-000778-N3; Fri, 27 Nov 2020 13:18:47 +0000
Received: by outflank-mailman (input) for mailman id 39307;
 Fri, 27 Nov 2020 13:18:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kideB-000773-0t
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:18:47 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d120b587-f368-4529-9839-6c2163d600ce;
 Fri, 27 Nov 2020 13:18:46 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ARDIfCJ023726
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 14:18:42 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 5A98B2E9CAC; Fri, 27 Nov 2020 14:18:36 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kideB-000773-0t
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:18:47 +0000
X-Inumbo-ID: d120b587-f368-4529-9839-6c2163d600ce
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d120b587-f368-4529-9839-6c2163d600ce;
	Fri, 27 Nov 2020 13:18:46 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ARDIfCJ023726
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2020 14:18:42 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 5A98B2E9CAC; Fri, 27 Nov 2020 14:18:36 +0100 (MET)
Date: Fri, 27 Nov 2020 14:18:36 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201127131836.GM1717@antioche.eu.org>
References: <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <20201127111904.GG1717@antioche.eu.org>
 <89aecc1b-bfe5-26fb-9d11-bec4f0aa7b84@suse.com>
 <20201127131004.GH1717@antioche.eu.org>
 <66716bca-4187-30c2-aba7-f6f973b194e4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66716bca-4187-30c2-aba7-f6f973b194e4@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 27 Nov 2020 14:18:42 +0100 (MET)

On Fri, Nov 27, 2020 at 02:14:55PM +0100, Jan Beulich wrote:
> Ah yes. In your respective mail the link said 9 though instead of 10.

Ops, sorry. I forgot to update the link I guess ...

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

