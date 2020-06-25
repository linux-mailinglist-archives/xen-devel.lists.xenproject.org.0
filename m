Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B5209BB7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 11:07:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joNph-0006Fg-MB; Thu, 25 Jun 2020 09:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTrP=AG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1joNpg-0006Fb-Gu
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 09:06:08 +0000
X-Inumbo-ID: 16aaeb38-b6c3-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16aaeb38-b6c3-11ea-bb8b-bc764e2007e4;
 Thu, 25 Jun 2020 09:06:01 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NpTbVswjo87d4caBxN9k+22+xmt/dGD2e+OOGemKXq5UnATBigsn9aqNzbgmARQ7/NZ1wzWgmM
 681gYm76hdW8A1FxFmu6PUFIDlzY58IkHs5qkPuloyqIgoxXABYoWFyemp3cGlyLkZUTAURSkm
 aXBIneIttUtTvdlExngsVZpD7++5F0plLZcI9UtgGn+xzGr89iaK/bom22sOjnwu8Crd4LUcuO
 DW4KYScaA4G8Z2gH1YRHyybqaEudg3PM848kJX6IYS81NE396MYljv7yrnNKAhlIjXl8+h3ku3
 WJg=
X-SBRS: 2.7
X-MesageID: 20910537
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,278,1589256000"; d="scan'208";a="20910537"
Date: Thu, 25 Jun 2020 11:05:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14] mm: fix public declaration of struct
 xen_mem_acquire_resource
Message-ID: <20200625090552.GW735@Air-de-Roger>
References: <20200623135246.66170-1-roger.pau@citrix.com>
 <50e25ef7-e7a7-d2c1-5f78-ce32cae35f38@suse.com>
 <20200623155609.GS735@Air-de-Roger>
 <da8d4d26-0524-1d77-8516-e986dd0affaa@suse.com>
 <20200623172652.GU735@Air-de-Roger>
 <24d35c4d-e2b3-1f58-4c6e-71072de01b74@suse.com>
 <04410978-33bf-dedf-7401-248b1a038a9c@xen.org>
 <60ac0a67-1448-4b39-4489-42dc008b6355@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <60ac0a67-1448-4b39-4489-42dc008b6355@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 04:01:44PM +0200, Jan Beulich wrote:
> On 24.06.2020 15:41, Julien Grall wrote:
> > On 24/06/2020 11:12, Jan Beulich wrote:
> >> On 23.06.2020 19:26, Roger Pau Monné wrote:
> >>> I'm confused. Couldn't we switch from uint64_aligned_t to plain
> >>> uint64_t (like it's currently on the Linux headers), and then use the
> >>> compat layer in Xen to handle the size difference when called from
> >>> 32bit environments?
> >>
> >> And which size would we use there? The old or the new one (breaking
> >> future or existing callers respectively)? Meanwhile I think that if
> >> this indeed needs to not be tools-only (which I still question),
> > 
> > I think we now agreed on a subthread that the kernel needs to know the 
> > layout of the hypercall.
> > 
> >> then our only possible route is to add explicit padding for the
> >> 32-bit case alongside the change you're already making.
> > 
> > AFAICT Linux 32-bit doesn't have this padding. So wouldn't it make 
> > incompatible the two incompatible?
> 
> In principle yes. But they're putting the structure instance on the
> stack, so there's not risk from Xen reading 4 bytes too many. I'd
> prefer keeping the interface as is (i.e. with the previously
> implicit padding made explicit) to avoid risking to break other
> possible callers. But that's just my view on it, anyway ...

Adding the padding is cleaner because we don't need any compat stuff
in order to access the structure from the caller, and we also keep the
original layout currently present on Xen headers.

I can prepare a fix for the Linux kernel, if this approach is fine.

Roger.

