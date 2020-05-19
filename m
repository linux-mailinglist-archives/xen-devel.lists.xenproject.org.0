Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795A11D925D
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 10:46:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaxtK-00067K-79; Tue, 19 May 2020 08:46:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o3Eh=7B=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1jaxtI-00067E-NM
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 08:46:24 +0000
X-Inumbo-ID: 37532dd8-99ad-11ea-b9cf-bc764e2007e4
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37532dd8-99ad-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 08:46:23 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 04J8kFgN015594;
 Tue, 19 May 2020 10:46:15 +0200 (MEST)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 2B1F62810; Tue, 19 May 2020 10:46:15 +0200 (CEST)
Date: Tue, 19 May 2020 10:46:15 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: IOCTL_PRIVCMD_MMAPBATCH on Xen 4.13.0
Message-ID: <20200519084615.GB1782@antioche.eu.org>
References: <d623cd12-4024-82ba-7388-21f606e1a0bd@citrix.com>
 <20200515210629.GA10976@antioche.eu.org>
 <b1dfc07d-bf0f-da26-79f0-8cf93952689e@citrix.com>
 <20200515215335.GA9991@antioche.eu.org>
 <d22b6b7c-9d1c-4cfb-427a-ca6f440a9b08@citrix.com>
 <20200517173259.GA7285@antioche.eu.org>
 <20200517175607.GA8793@antioche.eu.org>
 <000a01d62ce7$093b7f50$1bb27df0$@xen.org>
 <20200518173111.GA13512@antioche.eu.org>
 <cd60e91a-a4a4-d14e-eead-c93f7682413d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd60e91a-a4a4-d14e-eead-c93f7682413d@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3
 (chassiron.antioche.eu.org [151.127.5.145]);
 Tue, 19 May 2020 10:46:15 +0200 (MEST)
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 09:34:30AM +0200, Jan Beulich wrote:
> On 18.05.2020 19:31, Manuel Bouyer wrote:
> > From what I found it seems that all unallocated memory is tagged p2m_mmio_dm,
> > is it right ?
> 
> Yes. For many years there has been a plan to better separate this from
> p2m_invalid ...

thanks.

So for some reason, MMU_NORMAL_PT_UPDATE thinks that the memory is not
allocated for this domain. This is true for both the ioreq page, and
when trying to load the BIOS rom in the guest memory.
I traced the hypercall in the tools and the memory is allocated with
XENMEM_populate_physmap (and the gfn returned by XENMEM_populate_physmap
and passed to MMU_NORMAL_PT_UPDATE do match).

Still looking ...

Note that I'm using the 4.13.0 release sources, not the top of branch.
Is it something that could have been fixed after the release ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

