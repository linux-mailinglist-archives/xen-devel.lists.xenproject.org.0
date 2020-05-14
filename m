Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE561D36DC
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:45:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGyk-0007wU-Ri; Thu, 14 May 2020 16:45:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGyj-0007wM-Jq
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:45:01 +0000
X-Inumbo-ID: 4051c575-9602-11ea-a4b1-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4051c575-9602-11ea-a4b1-12813bfff9fa;
 Thu, 14 May 2020 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474701;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=EobmdpSmoUNR44WE9j3Dk3qZK//9w89cvSj+HAZSL6I=;
 b=MI/QDT/IkgggMDVKzjGuzqL99mHDbYIMuPjXYu/WEmMeLn1C7AkacXgZ
 U/eTaFA+8ny0lHUCiqKEDiYZhvnAXEBmQtAqcpwAWBxhMG9dcHnSeFGXZ
 6phvmPEV8WxmMurwf0FwydWfShQUz+FmIynoB2/HZludGgsj92l+XFQWY g=;
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
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: O4snGjlQuoA9GBZSYtcXQ42dBBD/AXvO9CQTMDJCdMJ49rO17RF5Us4oXUr+wAuTUrniSzU/Ta
 gQ8PuMRjnPjDDBvnjkPvdBtJesalFh1VFa0YNljfvUdL+dc6As0CAPS6k+SzjrtBfK/kNdQ9dL
 167rSIvIxPnnB9XDI+cze/f0R/FExQkRrAFwp7ggr4qRrJGEL9qGiaXcJyGOfpQYq5Tenez4bI
 5WPYoVLxg3p1DQ5BoHzsyItnNfMsQqbLS4owvhZ7Aan4bp/3qOEaD0XYMD8mFxfJL6vxUH24Qj
 Bt8=
X-SBRS: 2.7
X-MesageID: 17572092
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17572092"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.30078.812654.307279@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:44:46 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 17/21] docs: Add device-model-domid to xenstore-paths
In-Reply-To: <20200428040433.23504-18-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-18-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 17/21] docs: Add device-model-domid to xenstore-paths"):
> Document device-model-domid for when using a device model stubdomain.
> 

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

