Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D371D36A8
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:40:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGtj-0006oV-1F; Thu, 14 May 2020 16:39:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGth-0006oP-NE
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:39:49 +0000
X-Inumbo-ID: 86b1c5c4-9601-11ea-b07b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86b1c5c4-9601-11ea-b07b-bc764e2007e4;
 Thu, 14 May 2020 16:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474389;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=AqKWdpfdTTJgLBP6wY9qmTHo4s2pjhm8KYmzS1XJjpQ=;
 b=faIjd4Qmre6+cfoOt6RYWQ4+nXXq1YlFttDlIJLwM+ab+U6kqug3FKI6
 Hpzy3p/ugGjEBUCWkzJyTRnV84EkldX7EeCSQShfJJuyTEF9ljN3VLGjA
 SSM6D6buaDem89JYS6wMXzNJxbNIA5uxQiUH28EjErqGLnsPj1/Yx0uqm o=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: jv4vrkbNMnRObN497itbi0poQfmoPvTIHdb4n5BkSqqvLVc7tLvZYK76sE0bKRu+PgqjKFwv4Z
 N4VAVLzYYNnGFrCEKlViPTv32k4xLZPSPL80FQDPA4MN7J5tvrk6QGAidPfgbPo5S1iyT7BxAl
 HbjWz6e2u4Hhx+bSdh7LjOpv66Hq8JOrKddt7AEKI+fXT6NPIpOQo7o/RfNG0ITvWy1UbZJeeE
 ipMcwWJMuB12/MZUCcLMem+BFCXXKCcZnX3P+9Ro092YeH0jvGd8hjfAIwqQIFLSvQh1mhYbE6
 YiU=
X-SBRS: 2.7
X-MesageID: 17910432
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17910432"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.29774.668013.710363@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:39:42 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 12/21] libxl: use vchan for QMP access with Linux
 stubdomain
In-Reply-To: <20200428040433.23504-13-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-13-jandryuk@gmail.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 12/21] libxl: use vchan for QMP access with Linux stubdomain"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Access to QMP of QEMU in Linux stubdomain is possible over vchan
> connection. Handle the actual vchan connection in a separate process
> (vchan-socket-proxy). This simplified integration with QMP (already
> quite complex), but also allows preliminary filtering of (potentially
> malicious) QMP input.
> Since only one client can be connected to vchan server at the same time
> and it is not enforced by the libxenvchan itself, additional client-side
> locking is needed. It is implicitly implemented by vchan-socket-proxy,
> as it handle only one connection at a time. Note that qemu supports only
> one simultaneous client on a control socket anyway (but in UNIX socket
> case, it enforce it server-side), so it doesn't add any extra
> limitation.

You might mention in your commit message libxl qmp client code already
has locking to avoid attempts to talk concurrently to the same qemu.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,
Ian.

