Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638A41D36A6
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:38:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGrm-0006eZ-Kb; Thu, 14 May 2020 16:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGrk-0006eR-Pk
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:37:48 +0000
X-Inumbo-ID: 3e7a0f32-9601-11ea-9887-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3e7a0f32-9601-11ea-9887-bc764e2007e4;
 Thu, 14 May 2020 16:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474267;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=W4//fzUFWhbl5FZ6lmcht3748uvOPcgf8xtPcwPVNxY=;
 b=gCfjQ8zR1w2GvB3gFrHCWifCUSlglGnl2jti0bm9h4zac7wuVocuMiSp
 qFqWYyePVyNfqjZGEm+afqqtOcT2RziTXo+qjmGPLFy5ViU6kD0FxfoUN
 lCvrythOHRuJed3dOTnnFLL+u8LwKtUbPyzI0khCyPKPeyxSo46TGHzQ+ Y=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: KV/creLlsjvBVcTHvfj4rMq7xQQKE77or6YUq6cWkwPc5BevId5WYDFABMk4WdbKbc1p4tQ+ac
 p91+juzmAWpJKlux4xpfv/IkrLsHvqftZwtcgw4mHllB5WU0CsxLWmPlzun4ZGRxJhnnYejK+G
 z/0stFI2tfQM1X+qrPDjl0PsJJvOz+HDyp64L6teXTo6a/qFqMm/AkiqkGV67Sj6MwQcgIM9ZX
 UunKaEFnjxRWXFuQg05pv7f5sc3XiuQASLYXQPWqHY9nZ0spIXa33hh8lDYuTgStC+IjNpwHff
 i6c=
X-SBRS: 2.7
X-MesageID: 18244890
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="18244890"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.29628.780563.640276@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:37:16 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 11/21] tools: add simple vchan-socket-proxy
In-Reply-To: <20200428040433.23504-12-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-12-jandryuk@gmail.com>
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
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 11/21] tools: add simple vchan-socket-proxy"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Add a simple proxy for tunneling socket connection over vchan. This is
> based on existing vchan-node* applications, but extended with socket
> support. vchan-socket-proxy serves both as a client and as a server,
> depending on parameters. It can be used to transparently communicate
> with an application in another domian that normally expose UNIX socket
> interface. Specifically, it's written to communicate with qemu running
> within stubdom.
> 
> Server mode listens for vchan connections and when one is opened,
> connects to a pointed UNIX socket.  Client mode listens on UNIX
> socket and when someone connects, opens a vchan connection.  Only
> a single connection at a time is supported.
> 
> Additionally, socket can be provided as a number - in which case it's
> interpreted as already open FD (in case of UNIX listening socket -
> listen() needs to be already called). Or "-" meaning stdin/stdout - in
> which case it is reduced to vchan-node2 functionality.
> 
> Example usage:
> 
> 1. (in dom0) vchan-socket-proxy --mode=client <DOMID>
>     /local/domain/<DOMID>/data/vchan/1234 /run/qemu.(DOMID)
> 
> 2. (in DOMID) vchan-socket-proxy --mode=server 0
>    /local/domain/<DOMID>/data/vchan/1234 /run/qemu.(DOMID)
> 
> This will listen on /run/qemu.(DOMID) in dom0 and whenever connection is
> made, it will connect to DOMID, where server process will connect to
> /run/qemu.(DOMID) there. When client disconnects, vchan connection is
> terminated and server vchan-socket-proxy process also disconnects from
> qemu.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

I have not reviewed this.  It sounds very useful.  Thank you!
(I did skim over it.)

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

