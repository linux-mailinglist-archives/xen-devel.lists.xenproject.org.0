Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CF322F383
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 17:10:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k04m9-0004d2-00; Mon, 27 Jul 2020 15:10:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1WzZ=BG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k04m7-0004cv-Nj
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 15:10:47 +0000
X-Inumbo-ID: 58f64a2b-d01b-11ea-8aca-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58f64a2b-d01b-11ea-8aca-bc764e2007e4;
 Mon, 27 Jul 2020 15:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595862647;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FySu7NYNkuhkayE6m51zCZc7Az18SjtYiAYtvXrdIJ0=;
 b=hzKGm89frz5lrozRIEGBcmne3Pxc2zfGLhlbxD3Pdl2s9Xz+U2rJA5ZI
 WXK15Qv+G5DgNQP9kHIe1iO2cT//urePke4yz3im14QJkBQ4NmU6YqcXC
 1kWHX/rPkHu+X1/01KpBlGAYWQYEJhfAuziK7VYqpLsG5t+/9QXOVx9kM 8=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: dSgr5E+vM4PNlPlc1sR9CerkiXuoznkHZYav8BJemLR0KjkXNoPsxHlynaiilZKGd2MVTS3q+V
 FpUYGOJc/ov5KZ/m7BgMr4RAnh7AfTJb9shBaOABmxZI7Ps4U3+I7vxNoY2ZNMxuTbKq2YHoRl
 aWSYDcwozAEYIbh0PIdkCFhlTRDeSjGL+q4ccor176FJEaRduWUdznn4/BpIN8bgbudAMZHCuK
 cJGcdAWxV1u8s2TE2p4jXCLX/99U0HwGBgFOziNu8XDxFLsniRqfkBkjI4hYQ0HPxPaM8/3cEV
 +xU=
X-SBRS: 2.7
X-MesageID: 23262252
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,402,1589256000"; d="scan'208";a="23262252"
Date: Mon, 27 Jul 2020 17:10:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/4] x86: drop ASM_{CL,ST}AC
Message-ID: <20200727151039.GT7191@Air-de-Roger>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <048c3702-f0b0-6f8e-341e-bec6cfaded27@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <048c3702-f0b0-6f8e-341e-bec6cfaded27@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 12:49:04PM +0200, Jan Beulich wrote:
> Use ALTERNATIVE directly, such that at the use sites it is visible that
> alternative code patching is in use. Similarly avoid hiding the fact in
> SAVE_ALL.
> 
> No change to generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think the code is correct, I'm not sure however whether open coding
ASM_CLAC/STAC is better than what we currently do. I will leave for
Andrew to decide, since he is more knowledgeable of such piece of
code.

Thanks, Roger.

