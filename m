Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE17819F3DF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:53:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPMw-0008EM-4c; Mon, 06 Apr 2020 10:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=67tO=5W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jLPMu-0008E2-P3
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:52:40 +0000
X-Inumbo-ID: bbccc63a-77f4-11ea-bfdd-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbccc63a-77f4-11ea-bfdd-12813bfff9fa;
 Mon, 06 Apr 2020 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586170359;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=dOt/vdl1r5KXrsqdH0pv+VkO8BnaCTJNerPzdw66VMI=;
 b=OksiYLwrx3TU5C2h9CpLdGok4NXe4jsNYBV+C7ceIz6T9LDilV3n828G
 g237fpVVFmMmKUUXNXj7ayhkuLqAcvkBsZEQEGWzpOPoARxqJrAIXGXtX
 z6YX//Icb7GaLX69JRIbrw9RsnOOhyYEfY7mM1moNnu+tE3H6UMfKGnIC E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3aaEiyEbz4RPsvcA6IOyDBGLKcXCi3m9z/JuZ+ck+NkFXZ/DjlWw1/qJLXTQnA9ntL0ryu1MdJ
 y0qTxrs6km/IxODIEqOW1RO8f7RbG3tKSjnkqJKECo0JFxrvwTRKTddHPqpepQOCl1jpGM5RcO
 oSUnlgtpyTYXXrn8+8pLBuVPL+r1dkAs11dq1Lq5OPsESdI0EABv1TK+SdxYL0cbvmudmy/25d
 fRoYGomKb6sfD7yhzQfhaxeKbpLHjLqrHwrGfmZ4ROA9G0BI+qkgZc7Dcy9I27HC+56utCjs57
 PrA=
X-SBRS: 2.7
X-MesageID: 15547686
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15547686"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24203.2546.728186.463143@mariner.uk.xensource.com>
Date: Mon, 6 Apr 2020 11:52:34 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus
In-Reply-To: <8a6f6e41-9395-6c68-eae9-4c1aeb7d96e2@suse.com>
References: <20200406082704.13994-1-jgross@suse.com>
 <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
 <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
 <26161282-7bad-5888-16c9-634647e6fde8@xen.org>
 <8a6f6e41-9395-6c68-eae9-4c1aeb7d96e2@suse.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jürgen Groß writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
> Okay, what about moving the default setting of b_info->event_channels
> into libxl__arch_domain_build_info_setdefault() then?

FTAOD, if this satisfies ARM maintainers then I am content with it,
even though I doubt the utility.

I guess you should make two patches 1. duplicate the existing formula
(no functional change) 2. change the x86 formula.

I would ack the first and be guided by x86 folks for the 2nd.

Ian.

