Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D7B197DD9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 16:07:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIv2Q-0003jg-JP; Mon, 30 Mar 2020 14:05:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IY4r=5P=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jIv2P-0003jb-2v
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 14:05:13 +0000
X-Inumbo-ID: 788ab7de-728f-11ea-b58d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 788ab7de-728f-11ea-b58d-bc764e2007e4;
 Mon, 30 Mar 2020 14:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585577112;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=oAdTqKrlucbKQzUzTAv2exLTDQOcQIz7jZp5ODOp28w=;
 b=PLOXHY+Pn+uRXeyIBFHU1j8bJnrZAuB/sdLrUByvyzdbyPPPECRG0S6h
 u/EAQtL36+b7LztEVUeo1oXaKXmxZfEIzZnEYtweSBwPfMiP4vbz8D2Yt
 FPi2oitDdixynIBx2XJbtPyYDL7fW6hPAk6wFpKFFCU4Rzu7hYLyrgTvv U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UPMXgkILv0/r1CVis4ZbV94JLM6BlySFYgQOni2lmvJmKBVedcPHucwR70stJrJSXPcAMRcj+Y
 e1Ta1AHb/P7fJqrjNxrodygqpBKQgO/owUPAvdfgOWb8hFT5XNlJWC2+tdxf9H1J21b8Qwzm10
 jzbZdFNsF4ritZJrzGiPnpmqDypKfXbJQC616s/mtlgbTLesyEo8yVe6S14WKg+N4BeXdonC+7
 HL10u/fHDeHfMNV9pLOgT7ECMmkB3Lsdm2uwdwrf7tT2cGUYH/wTcg6CNgKEQS/+qVjWlgvv8Q
 q9U=
X-SBRS: 2.7
X-MesageID: 15081129
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,324,1580792400"; d="scan'208";a="15081129"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24193.64660.488422.800836@mariner.uk.xensource.com>
Date: Mon, 30 Mar 2020 15:05:08 +0100
To: Wei Liu <wl@xen.org>
In-Reply-To: <20200328111939.imm5t2v6ls5tktba@debian>
References: <27a883ea723d5d123cb3a10d2a6092ad54a6171e.1584485918.git.m.a.young@durham.ac.uk>
 <20200324023226.GK18599@mail-itl>	<20200328111939.imm5t2v6ls5tktba@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH] mismatch between pyxc_methods flags and
 PyObject definitions
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, "YOUNG,
 MICHAEL A." <m.a.young@durham.ac.uk>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Wei Liu writes ("Re: [XEN PATCH] mismatch between pyxc_methods flags and PyObject definitions"):
> Ian, this needs to be backported to at least 4.13 since we started
> supported Python 3 in that version.
> 
> Backport: 4.13

Noted.

Ian.

