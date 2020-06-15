Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DEC1F9C35
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 17:48:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrLH-0001LI-A1; Mon, 15 Jun 2020 15:48:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jkrLF-0001LD-PG
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 15:48:09 +0000
X-Inumbo-ID: 9c188d62-af1f-11ea-b80e-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c188d62-af1f-11ea-b80e-12813bfff9fa;
 Mon, 15 Jun 2020 15:48:09 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: M5VQRtnHRZQc3T9olrbNYlwXfbbZwNmuiSAHgGezLGeSiarwyP0Fy9i4UyLhCKimEUXe2yZ2W8
 LOkEDscE7ZI4mHHiEfooD+icyhInWe8nI5Wjj/erSWFgjF6ndV+03yteSwbbu3AvkZXLNPCDCH
 CiyBoAE4SI4ZrVpZOQCAoNWtncqJ58NxQVfBVERENejd7m3mglBFLrIjikwLIX0Xuw6/NWXtvX
 duN88D93Z4eNfOp64F/HJBimWIXFYHK8RUXes7PtGB0+CDRTPpAnpW3BgGwzdJrqcq8+jOiTvP
 +z0=
X-SBRS: 2.7
X-MesageID: 20090069
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,515,1583211600"; d="scan'208";a="20090069"
Date: Mon, 15 Jun 2020 17:47:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.14 8/8] x86/hvm: enable emulated PIT for PVH dom0
Message-ID: <20200615154759.GH735@Air-de-Roger>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-9-roger.pau@citrix.com>
 <b68cede9-360e-cc4f-d88b-737ee83e654e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <b68cede9-360e-cc4f-d88b-737ee83e654e@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 04:33:33PM +0100, Andrew Cooper wrote:
> On 12/06/2020 16:56, Roger Pau Monne wrote:
> > Some video BIOS require a PIT in order to work properly, hence classic
> > PV dom0 gets partial access to the physical PIT as long as it's not in
> > use by Xen.
> 
> Is this actually true today?

TBH I have no idea and asked the same thing myself.

> I can believe that it may have been necessary on old hardware, but the
> structure of systems has changed massively over the past 20 years, and
> the PIT is very legacy these days.

I also wondered whether video BIOSes really changed in the last 20
years, I really have no idea. FWIW, Wikipedia still lists PIT as being
used by video BIOSes on x86 systems [0] but there are no references to
specific models or video BIOSes.

Alternatively we could add this as a Xen command line option, ie:
dom0=pit or some such. It's however not very nice to not get output
because the video BIOS doesn't function properly due to lack of PIT.

Thanks, Roger.

[0] https://en.wikipedia.org/wiki/Intel_8253#IBM_PC_programming_tips_and_hints

