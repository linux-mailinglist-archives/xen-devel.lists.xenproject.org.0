Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 591781B2CDB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 18:40:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQvwJ-0000cX-Bv; Tue, 21 Apr 2020 16:40:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CVv8=6F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jQvwH-0000Vx-QQ
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 16:40:01 +0000
X-Inumbo-ID: be51a622-83ee-11ea-b58d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be51a622-83ee-11ea-b58d-bc764e2007e4;
 Tue, 21 Apr 2020 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587487201;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=4sTOet8CXQFB68zZkvtqHMQlWkrfatsJwLewDzbWoiE=;
 b=ScJ6/gNVIwqJlQ4hgFcMppPhY2vdmtth3ftVZmTsvqGSR+uZA+zKW/pI
 2xwfkS/HXy3GDHipGnmdg5FcbseexPMWjQfI8jQpqMhJ4gdqTpEEMyRsD
 9+HE6hOQdDNPxJbOZ3wo1dM96eysDt9IGtXja9aH2YshwU9PPv9K0Hu8E U=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2QcckzMJ06ZX/4Mnh4YFbuKk5Fjt+GNP+RD2eoFzAzzcxZl40vztVqLdNggTdiGEsdgu9B4W5F
 z5W/CHA6P/IMCZdzd1oxtTwudQoKzyeKjqv3SCFBLu3/2FbIrr4LDXQ/EcTptxpSu6nh6TFCqb
 Nk7dCaWmLHRNpXVm+DKlQsrHbaBWlTUKRtJqhiCNaPIe8p7mR8IXAc11VBzl1WW1am7IDTfd/H
 Y1br0jvRRZSHwFtr556+H3ivJUBiNlDUxYC3TCSpJPbpn8ZpBn7LkAwRpjgbenpkmb4abgC3+Z
 AJo=
X-SBRS: 2.7
X-MesageID: 16000719
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,410,1580792400"; d="scan'208";a="16000719"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24223.8666.764943.818163@mariner.uk.xensource.com>
Date: Tue, 21 Apr 2020 17:39:54 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH OSSTEST v3 2/2] make-flight: add a core scheduling job
In-Reply-To: <20200415141009.10912-2-roger.pau@citrix.com>
References: <20200415141009.10912-1-roger.pau@citrix.com>
 <20200415141009.10912-2-roger.pau@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("[PATCH OSSTEST v3 2/2] make-flight: add a core scheduling job"):
> Run a simple core scheduling tests on a host that has SMT support.
> This is only enabled for Xen >= 4.13.

Thanks, pushed to pretest.

Once it makes it through staging the test will appear, but it will
start failing (nonblockingly) until the SMT hostflag has been scanned.
It would be sensible for me to run a special examine job for that.

Ian.

