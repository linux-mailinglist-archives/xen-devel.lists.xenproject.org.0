Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12772249803
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 10:12:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8JCL-0005EE-3m; Wed, 19 Aug 2020 08:11:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHFf=B5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8JCJ-0005E9-8u
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 08:11:51 +0000
X-Inumbo-ID: 60d5cec4-0d0e-48cc-93d0-01254989c4c0
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60d5cec4-0d0e-48cc-93d0-01254989c4c0;
 Wed, 19 Aug 2020 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597824711;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pMCox2W99hq7R6OpYTd3ZSVuD1ZAtbS2FcjdpDjSK5M=;
 b=UeZ97n6cVL1XjByoL7XQTADarQWqYWu2m4Kvsvm53/9kyDReh73zE9Z9
 rwP0sLaaEKKYteizuzrMknYoMGw7flYTcODortzxe2SAr/hlpaail+Ije
 sMMr8IYn0eC9fpxkmM/CTFKc9Q6NTXPvUIa04BADtotMvufIcWG50EB7P w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: OUEdJNbQBzBd7AzviGOBptx6vZkRafMaQJdvVpD3VW3ctuNOKllZ89CLRYIbAAYS3cngbunX7R
 7GMJNmOKZlYkmMXrqmtHC0dDNUxnPbE/lc+tJcTlE/hpyc5Kuc6KLkRSW3iWV1U/VYDhGDibPo
 c8zmaEf8sUZThe241GFYVJbx2IDo/peAFd2HQH0GsTVeJDkxC0SgXRQJqTZdOoeodR7NFs1Ue5
 jq5zVFGvyP1C2XfwFf5p37nUDesz9PIBUIsFSYim+T6FjNslcXcrMkherOdnbSsupjGFHwC56g
 0CA=
X-SBRS: 2.7
X-MesageID: 24849460
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,330,1592884800"; d="scan'208";a="24849460"
Date: Wed, 19 Aug 2020 09:59:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/7] x86: don't build with EFI support in
 shim-exclusive mode
Message-ID: <20200819075917.GP828@Air-de-Roger>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <1a501ca8-8cf0-6fd0-547e-30b709fec6fc@suse.com>
 <20200818130028.GL828@Air-de-Roger>
 <09fc953e-0b20-07f4-7af3-6221675e1d4d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09fc953e-0b20-07f4-7af3-6221675e1d4d@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Aug 19, 2020 at 09:33:47AM +0200, Jan Beulich wrote:
> On 18.08.2020 15:00, Roger Pau Monné wrote:
> > On Fri, Aug 07, 2020 at 01:32:38PM +0200, Jan Beulich wrote:
> >> There's no need for xen.efi at all, and there's also no need for EFI
> >> support in xen.gz since the shim runs in PVH mode, i.e. without any
> >> firmware (and hence by implication also without EFI one).
> >>
> >> The slightly odd looking use of $(space) is to ensure the new ifneq()
> >> evaluates consistently between "build" and "install" invocations of
> >> make.
> > 
> > I would likely add a comment to the code itself, as it's not obvious
> > without a hint IMO.
> 
> I did indeed consider this, as I agree in principle. The problem is
> where to put such a comment - ahead of the entire macro is not a
> good place imo, and I can't see any other good place either. As a
> result I thought that the use being odd looking will either make
> readers think of why it's there by itself, or direct them towards
> the commit introducing it.

Ahead of the efi-y assignation would be fine for me, but I guess
people would use git blame and find the right commit seeing the kind
of strange construction that we use there.

Thanks, Roger.

