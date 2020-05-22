Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A10581DE522
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 13:13:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc5ca-0008PL-4x; Fri, 22 May 2020 11:13:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc5cZ-0008PG-Dp
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 11:13:47 +0000
X-Inumbo-ID: 4d358fea-9c1d-11ea-abb2-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d358fea-9c1d-11ea-abb2-12813bfff9fa;
 Fri, 22 May 2020 11:13:46 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 8fL352PuG9f5QMJ2FfSj/JcrUwDdpE7MsH8LrDH5TDs81SkadWchJ77puOkGmVTm5AlzKe0gVG
 lR/V/WctzZB4URk7L5fpcdsL3XOIMUNYEZh05Mb8P7BoYjVaIgXbY+j25hpLu790fMASjX5I9s
 1alP4Rr19rQbPWckGPCGXFzekOQFksHRFgRgkhws5yFb55sefpeBO/EvlNFI3d+ZjknaYj38XI
 yw5e9tUqqJRWXMEqWyd+kvXQ5Ohb04k6aRDNbw2vwQ4s279Z1LWglgo8nH1OaNvDY8BNvnCq4L
 O9I=
X-SBRS: 2.7
X-MesageID: 18451695
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18451695"
Date: Fri, 22 May 2020 13:13:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 1/5] x86: suppress XPTI-related TLB flushes when
 possible
Message-ID: <20200522111337.GA54375@Air-de-Roger>
References: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
 <ae47cb2c-2fff-cd08-0a26-683cef1f3303@suse.com>
 <17f1b674-92f9-6ee9-8e10-0fc30f055fe8@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <17f1b674-92f9-6ee9-8e10-0fc30f055fe8@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 22, 2020 at 12:00:14PM +0100, Andrew Cooper wrote:
> On 25/09/2019 16:23, Jan Beulich wrote:
> > When there's no XPTI-enabled PV domain at all, there's no need to issue
> > respective TLB flushes. Hardwire opt_xpti_* to false when !PV, and
> > record the creation of PV domains by bumping opt_xpti_* accordingly.
> >
> > As to the sticky opt_xpti_domu vs increment/decrement of opt_xpti_hwdom,
> > this is done this way to avoid
> > (a) widening the former variable,
> > (b) any risk of a missed flush, which would result in an XSA if a DomU
> >     was able to exercise it, and
> > (c) any races updating the variable.
> > Fundamentally the TLB flush done when context switching out the domain's
> > vCPU-s the last time before destroying the domain ought to be
> > sufficient, so in principle DomU handling could be made match hwdom's.
> >
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I am still concerned about the added complexity for no obvious use case.
> 
> Under what circumstances do we expect to XPTI-ness come and go on a
> system, outside of custom dev-testing scenarios?

XPTI-ness will be sticky, in the sense that once enabled cannot be
disabled anymore.

Roger.

