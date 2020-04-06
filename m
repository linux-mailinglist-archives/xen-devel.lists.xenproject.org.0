Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B56A919F3FB
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 13:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPUD-0001CP-Pl; Mon, 06 Apr 2020 11:00:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=67tO=5W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jLPUB-0001Bw-NO
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 11:00:11 +0000
X-Inumbo-ID: c8957230-77f5-11ea-bfe0-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8957230-77f5-11ea-bfe0-12813bfff9fa;
 Mon, 06 Apr 2020 11:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586170812;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=2FwxIFRYXkcgeQXPV7OgRwJs+V0kS3Mqn0XwObKBG48=;
 b=ApaOGw7bssfePSFvJPGh750LuW0gc1tdAUCB/TR81KrsZD9reoYEPzx3
 ShHnmS7VNCpSXOJhGOQw7VFxUEL7ScHmkva9Z0VE3RFEU71dc2VbNjZq9
 7r9IHOmZt9k3Y+RFBkI4oPKRjGkLt164FeY59VeIbHe02FwuZNuDrfZEh w=;
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
IronPort-SDR: CXQ0V6V+QwygP6k4DhewJzCrtODy10VYOvIE8aHWZj1eikKuR0dgG8uwzQBWrO1ilJ2J4+forw
 /4LPpyj7Q9/O8bJfOrHuPMjOspa3F4VIpqMkCFBYeaXcGkroa8Up6Ele5aMGnUQ3VQUbhK7AbS
 Nv7fqcLQoKoiosVsJWVuRtJD5S+6Msq44u3y7cxBvVjYwIFw4mu13RgunU2/gvTyZ2ttfVWFXW
 s0DBbwBTdphtoKE76YGCZOqlZkh9BfQNQcrISFtRXW6XrdC1wqt0X8Zp4vpIWvQXogurZBFS2Q
 g40=
X-SBRS: 2.7
X-MesageID: 15236678
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15236678"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24203.2996.819908.965198@mariner.uk.xensource.com>
Date: Mon, 6 Apr 2020 12:00:04 +0100
To: Julien Grall <julien@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus [and 1 more messages]
In-Reply-To: <24203.2546.728186.463143@mariner.uk.xensource.com>,
 <fd09220a-7470-4679-ce16-f4553579171b@xen.org>
References: <20200406082704.13994-1-jgross@suse.com>
 <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
 <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
 <24203.2251.628483.557280@mariner.uk.xensource.com>
 <fd09220a-7470-4679-ce16-f4553579171b@xen.org>
 <26161282-7bad-5888-16c9-634647e6fde8@xen.org>
 <8a6f6e41-9395-6c68-eae9-4c1aeb7d96e2@suse.com>
 <24203.2546.728186.463143@mariner.uk.xensource.com>
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
> There are no correlation between event channels and vCPUs. The number of 
> event channels only depends on the number of frontend you have in your 
> guest. So...
> 
> Hi Ian,
> 
> On 06/04/2020 11:47, Ian Jackson wrote:
> > If ARM folks want to have a different formula for the default then
> > that is of course fine but I wonder whether this might do ARMk more
> > harm than good in this case.
> 
> ... 1023 event channels is going to be plenty enough for most of the use 
> cases.

OK, thanks for the quick reply.

So, Jürgen, I think everyone will be happy with this:

Ian Jackson writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
> I guess you should make two patches 1. duplicate the existing formula
> (no functional change) 2. change the x86 formula.
> 
> I would ack the first and be guided by x86 folks for the 2nd.

Ian.

