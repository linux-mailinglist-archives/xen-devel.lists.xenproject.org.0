Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7C919DC3C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 18:57:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKPcu-0003Af-Pp; Fri, 03 Apr 2020 16:57:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4QVj=5T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jKPcs-0003Aa-R8
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 16:57:02 +0000
X-Inumbo-ID: 22ed39ec-75cc-11ea-bd4f-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22ed39ec-75cc-11ea-bd4f-12813bfff9fa;
 Fri, 03 Apr 2020 16:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585933022;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=RQLS0RDiCFAypcPh+9CLzjxQ/WuZPSOBdWc0aNk1xW0=;
 b=YRZp8lHEkmfhHrzwsWv+FHQGaO1Z1Xd9f2BN0ECCiLQVW2e+B8ER0QLB
 77iHHz/Qnw6Xt6kWKlgkHA49twQksUJLgQ3+SK8YpdYWs0ojklHJtofDe
 Bb1bBF4Voqj3gCEx9la4ZthnIfGU4tqSQI36/TRtyZZcQL+hfhGdv+RQM U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TEQBAxK0xM0jsFifeWVZI/0rCOP3mMGLErp2rORRkHbWd9iyyAkxl8rI++qRo6Wyz4Cxb0cHCw
 qhjmwjwp9jG8ztfeFso0s+nqiU/TDQsPNKxvao96LbbjuwpxU9s+YMkbAIbeyhI8Zm/fYpXqO8
 pAqRJFtSrlTK60+VyuKxTrM1lzNOknLdfQawpdmx/HXGVOhiCYniUebYTGo7DWDHdvipGwMkIj
 3jPsY3yWiE2xhxCv8/S2COJ6FoQNnR7+sfH/jW9GvHO9dj+Ro+GTc4ZCeDgk5zpm35LBEyjaBr
 qMo=
X-SBRS: 2.7
X-MesageID: 15158784
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15158784"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24199.27351.756049.773415@mariner.uk.xensource.com>
Date: Fri, 3 Apr 2020 17:56:55 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] docs: Render .md files using pandoc
In-Reply-To: <20200403131720.30140-1-andrew.cooper3@citrix.com>
References: <20200403131720.30140-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH] docs: Render .md files using pandoc"):
> This fixes the fact that qemu-deprivilege.md, non-cooperative-migration.md and
> xenstore-migration.md don't currently get rendered at all, and are therefore
> missing from xenbits.xen.org/docs
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Paul Durrant <paul.durrant@citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

> Ian - given qemu-deprivilege.md was in 4.12, this wants backporting.  It quite
> possibly needs some intermediate prerequisites

Cool.  Can you add a "Backport: 4.12" tag then ?

Thanks,
Ian.

