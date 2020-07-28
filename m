Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C04D2305F2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 10:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0LRR-0008C0-7O; Tue, 28 Jul 2020 08:58:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWt7=BH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0LRQ-0008Bv-Kc
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 08:58:32 +0000
X-Inumbo-ID: 822dafce-d0b0-11ea-8b1b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 822dafce-d0b0-11ea-8b1b-bc764e2007e4;
 Tue, 28 Jul 2020 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595926710;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sUvuB+SQAcx3A3Ddb7pG9ZwS7HsLQy3Nggy8p7965gE=;
 b=TGaisiGi0ePOPNkXq/Jj2AzhT8vFjD84xrrlU0IjrYhthTVj2Mwv7TOA
 YCJq0adrJsExUhApIzhFk+AH3EHM9FnSQDJRVfOPfX/YqwBkjuNR8E91t
 LX8KezvnjWTXIS4FEiT7UhvAHKFFahrWP0lxuIRQVcxiitNEn5x0MgJXP s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: /bZkDnZuXjo0SWY7PwnfnFfGpru2vPR112n/AkE305ku0uelirJMTzl1CNgdCMVtSFeIrfCMas
 1tFUaiYgODKpcIbW7ltXyvR/Ie4ojvYaRMvJwT1r2pJ2TtTags9CgqoKPUVqd8Y9Y09tNKDRg9
 LMZHN6Ge9XQCD8ckxOmixPSKMBSZg3hBNJ4vfWIRUORJRDhU18AcJAtoLSak+lKW9skwRbCea+
 QcHDVfT4eKoODdhezggYh6X+mYxb4dNIHNbT0gR1jrsne4mJ0ce+U9XnpDfcXprbf+Xv4RakOq
 dwA=
X-SBRS: 2.7
X-MesageID: 23515422
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,405,1589256000"; d="scan'208";a="23515422"
Date: Tue, 28 Jul 2020 10:58:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Eslam Elnikety <elnikety@amazon.com>
Subject: Re: [PATCH] x86/vhpet: Fix type size in timer_int_route_valid
Message-ID: <20200728085815.GY7191@Air-de-Roger>
References: <20200728083357.77999-1-elnikety@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200728083357.77999-1-elnikety@amazon.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <pdurrant@amazon.co.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 28, 2020 at 08:33:57AM +0000, Eslam Elnikety wrote:
> The macro timer_int_route_cap evalutes to a 64 bit value. Extend the
> size of left side of timer_int_route_valid to match.

I'm very dull with this things, so forgive me.

Isn't the left side just promoted to an unsigned 64bit value?

Also timer_int_route will strictly be <= 31, which makes the shift
safe?

I'm not opposed to switching to use unsigned long, but I think I'm not
understanding the issue.

Thanks, Roger.

