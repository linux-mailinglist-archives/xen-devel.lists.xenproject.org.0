Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF8E2C63C1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 12:19:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39177.71983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kibmZ-0002rW-Nw; Fri, 27 Nov 2020 11:19:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39177.71983; Fri, 27 Nov 2020 11:19:19 +0000
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
	id 1kibmZ-0002r6-KI; Fri, 27 Nov 2020 11:19:19 +0000
Received: by outflank-mailman (input) for mailman id 39177;
 Fri, 27 Nov 2020 11:19:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kibmY-0002qz-GE
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:19:18 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30ea6b90-df7a-43a1-85b9-2d095bb91b90;
 Fri, 27 Nov 2020 11:19:16 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ARBJ9vS029288
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 12:19:10 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 9D7082E9CAC; Fri, 27 Nov 2020 12:19:04 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kibmY-0002qz-GE
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:19:18 +0000
X-Inumbo-ID: 30ea6b90-df7a-43a1-85b9-2d095bb91b90
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 30ea6b90-df7a-43a1-85b9-2d095bb91b90;
	Fri, 27 Nov 2020 11:19:16 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ARBJ9vS029288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2020 12:19:10 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 9D7082E9CAC; Fri, 27 Nov 2020 12:19:04 +0100 (MET)
Date: Fri, 27 Nov 2020 12:19:04 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201127111904.GG1717@antioche.eu.org>
References: <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
 <20201124150842.GN2020@antioche.eu.org>
 <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 27 Nov 2020 12:19:11 +0100 (MET)

On Fri, Nov 27, 2020 at 11:59:48AM +0100, Roger Pau Monné wrote:
> > 
> > I had to restart from a clean source tree to apply this patch, so to make
> > sure we're in sync I attached the diff from my sources
> 
> I'm quite confused about why your trace don't even get into
> hvm_do_IRQ_dpci, so I've added some more debug info.
> 
> Here is the new patch, sorry for so many rounds of testing.

No problem, it's expected for this kind of debug :)

http://www-soc.lip6.fr/~bouyer/xen-log11.txt

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

