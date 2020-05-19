Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7AD1D9326
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 11:18:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jayOC-0000uS-Kp; Tue, 19 May 2020 09:18:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PPOd=7B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jayOA-0000uM-UE
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 09:18:18 +0000
X-Inumbo-ID: ace82950-99b1-11ea-ae69-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ace82950-99b1-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 09:18:18 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XYMfoYkHSsyFUFz//mHjRBhbbNozQp3u4Beu/gYByizNcYler69FW1HgM44fTVpAnsWN/jCHJ0
 akr1A4oQVAl8PCuuLtwm1iKnc1ATt3IwlYdo5yD3xILdSmcN6QT9St7VKHqKbq67T+2hoJV3sA
 DoDwvh+mADCX/h9ISHSjHqHYbogB/42nTQFSa1y3pSK+bJMnd+DMtM3PiGB2B/HeScwYSirhLc
 LyqxBRiXi3QsFvfQH76PQIomyGndYX/JeZELDuTN8GEHBBLwPy0urEDOKTV1Cnnm37gUOHWsE0
 eX8=
X-SBRS: 2.7
X-MesageID: 18126586
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,409,1583211600"; d="scan'208";a="18126586"
Date: Tue, 19 May 2020 11:18:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 2/3] x86: relax LDT check in arch_set_info_guest()
Message-ID: <20200519091810.GC54375@Air-de-Roger>
References: <b7a1a7fe-0bc5-1654-ff1c-e5eb787c579e@suse.com>
 <c36cac91-49ae-6bb2-b057-195031979d21@suse.com>
 <20200519090220.GA54375@Air-de-Roger>
 <50050054-b081-5d6e-13e8-c50e52afe42b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50050054-b081-5d6e-13e8-c50e52afe42b@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 11:12:49AM +0200, Jan Beulich wrote:
> On 19.05.2020 11:02, Roger Pau Monné wrote:
> > On Fri, Dec 20, 2019 at 02:50:06PM +0100, Jan Beulich wrote:
> >> It is wrong for us to check the base address when there's no LDT in the
> >> first place. Once we don't do this check anymore we can also set the
> >> base address to a non-canonical value when the LDT is empty.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > I wonder if a ldt_ents check should also be added to
> > pv_map_ldt_shadow_page in order to avoid trying to get the mapping of
> > the LDT.
> 
> We already have
> 
>     if ( unlikely((offset >> 3) >= curr->arch.pv.ldt_ents) )
>     {
>         ASSERT_UNREACHABLE();
>         return false;
>     }
> 
> What else do you mean?

Oh, I've missed that. I was searching for a check before accessing
ldt_base, which is done at initialization time. That's indeed fine.

Roger.

