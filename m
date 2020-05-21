Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD51D1DC8F4
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 10:45:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbgpd-0008KA-Eh; Thu, 21 May 2020 08:45:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S6UB=7D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jbgpb-0008Iy-LU
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 08:45:35 +0000
X-Inumbo-ID: 6efb2dec-9b3f-11ea-aae5-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6efb2dec-9b3f-11ea-aae5-12813bfff9fa;
 Thu, 21 May 2020 08:45:34 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 5oCZn25bClIxw0GsmZhUudrBK0bc81jdjDBeG8szzRIMS6ZMavw5YrZokg9KZwKLk1OK7pqcoY
 pdKSf2ARU/DdrmEwwT5TyCS8M73sFyWIxgOeK3PEkduB9gWtpCQCXKSwLbvCQRL+d2gPrY2epk
 dAp+2xrO2dqg0+77oW9rWXq5xczobgRgRd1OugBEbyKmQrgDR7bPQpdi+X92u209nTsbrbcuaQ
 OsCjcnOHwrZIKh5uKUZvRuDMK9kEkDn+yLH7lZVjLOflz1RguNiQsOhv3tk8LzISkk0+OGvP1k
 6Ig=
X-SBRS: 2.7
X-MesageID: 18093687
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18093687"
Date: Thu, 21 May 2020 10:45:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
Message-ID: <20200521084523.GP54375@Air-de-Roger>
References: <20200515135802.63853-1-roger.pau@citrix.com>
 <20200515135802.63853-3-roger.pau@citrix.com>
 <eaa63636-6e39-d401-e218-14ae37440667@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <eaa63636-6e39-d401-e218-14ae37440667@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 10:30:11PM +0100, Andrew Cooper wrote:
> On 15/05/2020 14:58, Roger Pau Monne wrote:
> > Apply a workaround for Intel errata BDX99, CLX30, SKX100, CFW125,
> > BDF104, BDH85, BDM135, KWB131: "A Pending Fixed Interrupt May Be
> > Dispatched Before an Interrupt of The Same Priority Completes".
> 
> HSM175 et al, so presumably a HSD, and HSE as well.
> 
> On the broadwell side at least, BDD BDW in addition

But those are a different errata AFAICT ('An APIC Timer Interrupt
During Core C6 Entry May be Lost') and the workaround should also be
different I think. We should mark the lapic timer as not reliable on
C6 or higher states in lapic_timer_reliable_states, so that it's
disabled before entering sleep?

Thanks, Roger.

