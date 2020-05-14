Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3D81D367E
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:30:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGkH-00065R-Vx; Thu, 14 May 2020 16:30:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZGkF-0005nF-MN
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:30:03 +0000
X-Inumbo-ID: 2920d00e-9600-11ea-a4b1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2920d00e-9600-11ea-a4b1-12813bfff9fa;
 Thu, 14 May 2020 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589473803;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/9nygPkkp5Q+lpg2QhK9iP++CHjileKsIkdOdkAm6YE=;
 b=O9ZwrLxHaB5AtRq5wyzVBbja8Pg+9vgqNJI+dfjDnZ/fvcp3SygtMfcU
 YJrcCiSRCxGisG57KW2plTLSzDCEPy7bHkteW79ModPtDXCWU3xrj+bJO
 1I7pGfYB34T3pKK9iQHBWzsxPtFULzzpTCwSKClwM/7XZwp+G9K/tNFxq A=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: uiOcC6PytHKgVWXDkSN386MNBT6O4rE2AsztKQw0bcwYqVetUPKuSxyG5FnwlMY1zdpmU8Kh0t
 TklHLq14m3Zqmqd4dj9yDgyO6AbDpvdZ704OlI7fdZEU0pSIQQBLfrxrYkYuXbbzE5U4E+aL09
 nueJ9N2HUbEizLw1W7JplXGS31YzYBrfOzJMqg/wUQQNQKinGY3w7oZILxp4M871FxytfW7JRj
 k7JYMYCt33+CIHyOZYbi+KTuwreE/UkujJhgbHvsN1oWQ5l4qy+v0ANEWkTkdYadZFeEoLQ6Ny
 tJ0=
X-SBRS: 2.7
X-MesageID: 17541766
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17541766"
Date: Thu, 14 May 2020 18:29:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 5/6] x86/mem-paging: move code to its dedicated source
 file
Message-ID: <20200514162955.GJ54375@Air-de-Roger>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
 <b9b189b1-9484-4501-6085-adf86e73f262@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b9b189b1-9484-4501-6085-adf86e73f262@suse.com>
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
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 10:39:17AM +0200, Jan Beulich wrote:
> Do a little bit of style adjustment along the way, and drop the
> "p2m_mem_paging_" prefixes from the now static functions.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

