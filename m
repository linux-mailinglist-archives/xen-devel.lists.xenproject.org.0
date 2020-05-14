Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE21D36EE
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:48:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZH2H-0008O5-4q; Thu, 14 May 2020 16:48:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZH2F-0008Nw-VK
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:48:39 +0000
X-Inumbo-ID: c29a366a-9602-11ea-a4b3-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c29a366a-9602-11ea-a4b3-12813bfff9fa;
 Thu, 14 May 2020 16:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474918;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=aOSwwwpAP8vxN4YJ8ydW7xghPeM4DBW79TLTtqIM1LU=;
 b=AeFN5DEPe8dtUEyUzRALxXRohdNQqsGhrIanWLmaJWV/UizvVOvgSun0
 WDE7tyFwm8bCMJdm3tE7+PTQcoRc1HUw07Q0EA5VJqBcvdDoN0gC5r9AU
 lqa1O4taC9LMMb+Q392ruz76xsLlEa120zTJufTiua5QETuQ/RWCOp7N6 g=;
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
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: m70DffVekrkTeA0ohNqCuFaij02MzVE3SpMwAz5VRQMCmQVnrHJ9oWto/mWzKuVK/UXQClknE1
 HdyByvzBW5R3tuqjd386197E9kUOMnPzIi1DDx/7Lbx/AJ6mul6TdKmCl8V/vKs1cYtTTE111c
 UNbfY7VTyANIEr12Hvg8sMFP1CavG/zKgiCknaVaaR+8ITLKtOKGLfLOia0gWQsE7sU5sdNMdM
 fzgnZseznRSBLm1CKpwvOHAqfWSbheSKeG/cb4t0FJIM3HuQmcDmHEMehdWd52mfk3iX6HL+vY
 bOg=
X-SBRS: 2.7
X-MesageID: 17816542
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17816542"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.30307.935419.913847@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:48:35 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 21/21] tools: Clean up vchan-socket-proxy socket
In-Reply-To: <20200428040433.23504-22-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-22-jandryuk@gmail.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 21/21] tools: Clean up vchan-socket-proxy socket"):
> To avoid socket files lingering in /run/xen, have vchan-socket-proxy
> clean up the sockets it creates.  Use a signal handler as well as atexit
> to handle both means of termination.

This should be done in [lib]xl destroy, not here.  That way if the
proxy crashes or something it will also get cleaned up.

Thanks,
Ian.

