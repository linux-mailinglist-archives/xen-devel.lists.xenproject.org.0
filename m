Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6921A1D6BA2
	for <lists+xen-devel@lfdr.de>; Sun, 17 May 2020 19:56:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaNWH-0004eF-6t; Sun, 17 May 2020 17:56:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqg2=67=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1jaNWF-0004dj-M7
 for xen-devel@lists.xenproject.org; Sun, 17 May 2020 17:56:11 +0000
X-Inumbo-ID: b0ad470a-9867-11ea-b07b-bc764e2007e4
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0ad470a-9867-11ea-b07b-bc764e2007e4;
 Sun, 17 May 2020 17:56:10 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 04HHu79t023460;
 Sun, 17 May 2020 19:56:07 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 23E682810; Sun, 17 May 2020 19:56:07 +0200 (CEST)
Date: Sun, 17 May 2020 19:56:07 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
Message-ID: <20200517175607.GA8793@antioche.eu.org>
References: <20200515202912.GA11714@antioche.eu.org>
 <d623cd12-4024-82ba-7388-21f606e1a0bd@citrix.com>
 <20200515210629.GA10976@antioche.eu.org>
 <b1dfc07d-bf0f-da26-79f0-8cf93952689e@citrix.com>
 <20200515215335.GA9991@antioche.eu.org>
 <d22b6b7c-9d1c-4cfb-427a-ca6f440a9b08@citrix.com>
 <20200517173259.GA7285@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200517173259.GA7285@antioche.eu.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]);
 Sun, 17 May 2020 19:56:07 +0200 (MEST)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, May 17, 2020 at 07:32:59PM +0200, Manuel Bouyer wrote:
> I've been looking a bit deeper in the Xen kernel.
> The mapping is failed in ./arch/x86/mm/p2m.c:p2m_get_page_from_gfn(),
>         /* Error path: not a suitable GFN at all */
> 	if ( !p2m_is_ram(*t) && !p2m_is_paging(*t) && !p2m_is_pod(*t) ) {
> 	    gdprintk(XENLOG_ERR, "p2m_get_page_from_gfn2: %d is_ram %ld is_paging %ld is_pod %ld\n", *t, p2m_is_ram(*t), p2m_is_paging(*t), p2m_is_pod(*t) );
> 	    return NULL;
> 	}
> 
> *t is 4, which translates to p2m_mmio_dm
> 
> it looks like p2m_get_page_from_gfn() is not ready to handle this case
> for dom0.

And so it looks like I need to implement osdep_xenforeignmemory_map_resource()
for NetBSD

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

