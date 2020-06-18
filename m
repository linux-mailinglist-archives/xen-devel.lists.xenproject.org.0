Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6B31FF216
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 14:40:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jltpX-00078l-PA; Thu, 18 Jun 2020 12:39:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jltpW-00078g-En
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 12:39:42 +0000
X-Inumbo-ID: c762a33e-b160-11ea-b7bb-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c762a33e-b160-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 12:39:41 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Vde6Lsb0Im3oy8Ro52P0XuqK9F/e+IpWZmeylbn043QgzeFa6UuA7tNdbQGhlZaiNTtnyYH6Th
 hGqY8TtUlpSZvyWv3+zNgRadANk7FMLcGNajE1H3VYC2NRyZ3lUw1jpJsowCDsbQZbsBt3E6Fr
 9m3eVUd3ce95GuD3rv7xqoDJfbcp+3VmJ4E6wUZy3gONEB/xMN+KQOB/L9SDbO0VzBCdEWm25J
 xyyrbj2r0hg3Kk1v6yGoXGeiSIse8bSFwHNtvLIjAiZkNvEROw+FWO4MQV924Bd/5UA9BxH90R
 Jd8=
X-SBRS: 2.7
X-MesageID: 20362933
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20362933"
Date: Thu, 18 Jun 2020 14:39:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] VT-x: simplify/clarify vmx_load_pdptrs()
Message-ID: <20200618123933.GM735@Air-de-Roger>
References: <b2bd8c84-9109-8b21-afb4-51e49b271a83@suse.com>
 <20200618101113.GI735@Air-de-Roger>
 <762c5e4a-4132-b82f-7234-3b3e9508d1ae@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <762c5e4a-4132-b82f-7234-3b3e9508d1ae@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jun 18, 2020 at 01:49:58PM +0200, Jan Beulich wrote:
> On 18.06.2020 12:11, Roger Pau Monné wrote:
> > On Thu, Jun 18, 2020 at 08:38:27AM +0200, Jan Beulich wrote:
> >> -    guest_pdptes = (uint64_t *)(p + (cr3 & ~PAGE_MASK));
> >> +    guest_pdptes = __map_domain_page(page) + (cr3 & ~PAGE_MASK);
> > 
> > Instead I think this could be:
> > 
> > guest_pdptes = __map_domain_page(page) + (cr3 & ~(PAGE_MASK | 0x1f));
> 
> ... I agree and will change to this; I'll assume your R-b stands
> with the change made (and the description adjusted accordingly).

Sure.

Thanks, Roger.

