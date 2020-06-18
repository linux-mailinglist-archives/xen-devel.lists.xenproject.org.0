Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D661FF5E3
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 16:56:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlvxk-0003d8-9G; Thu, 18 Jun 2020 14:56:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlvxi-0003d2-TJ
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 14:56:18 +0000
X-Inumbo-ID: dd4588f2-b173-11ea-baa8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd4588f2-b173-11ea-baa8-12813bfff9fa;
 Thu, 18 Jun 2020 14:56:18 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: RrLxoiyedqh8lE2oi+FyysfBzYSjYD/jI5T7A8N1IHFW0tCCAxkEAJ9kWGUYR4898bA4eJX0MS
 BlGOUoKFy9PObVxDadkrna4XO+T8R85vmgYDP7VS2sRXz5CIepuvA6PAcO6sTL65nkhY0eHitn
 Tf+pYxsPURNgxJO7bgM6f6q5hdSeMZb6xD4NjP16TcrbgLLJSg+eQusEybIaIEuDe8ntSZIM8O
 0ySClCj5xVKNbvE3jESrw9RGCdCnqcDc2/HEJxOWKgSVN85U1h3ILR57rOzJhtp76eCE4Qk5K+
 E64=
X-SBRS: 2.7
X-MesageID: 20681338
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20681338"
Date: Thu, 18 Jun 2020 16:56:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 4/8] x86/vpt: only try to resume timers
 belonging to enabled devices
Message-ID: <20200618145610.GU735@Air-de-Roger>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-5-roger.pau@citrix.com>
 <e58d5470-fd99-3dfb-4611-35a0ad732bf4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e58d5470-fd99-3dfb-4611-35a0ad732bf4@suse.com>
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
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 04:37:57PM +0200, Jan Beulich wrote:
> On 12.06.2020 17:56, Roger Pau Monne wrote:
> > Check whether the emulated device is actually enabled before trying to
> > resume the associated timers.
> > 
> > Thankfully all those structures are zeroed at initialization, and
> > since the devices are not enabled they are never populated, which
> > triggers the pt->vcpu check at the beginning of pt_resume forcing an
> > exit from the function.
> 
> So really this is a benign transformation then, rather than fixing
> anything? If that's correct understanding of mine ...

Yes, that's my understanding also.

> > While there limit the scope of i and make it unsigned.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, Roger.

