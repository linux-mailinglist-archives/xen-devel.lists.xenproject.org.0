Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F914A702
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 16:16:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw65q-0007W1-4E; Mon, 27 Jan 2020 15:14:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ksAf=3Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iw65o-0007Vs-Hl
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 15:14:24 +0000
X-Inumbo-ID: ac822c24-4117-11ea-8561-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac822c24-4117-11ea-8561-12813bfff9fa;
 Mon, 27 Jan 2020 15:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580138053;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=uoeDcBiT4P8AgWV60POCsnnv8JVPvN7GlUyBKuP8KdU=;
 b=FjdvhR45MJ09B3NwygoLVXfsZVG2lPwJH302g1YGVZ4spafTHiN0H8ME
 iX+IQkhEsP7bgjAf5nrrXW0chr1rqpYVsJ9/nWZn+RYiZToNqt/3ivspW
 mnvaZE7iXC8UJXOZoFx6UuWWkIOb7OzcQt6xjZeVrnipmpTJn6nwYtHzg c=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: i842vg0PhjeYFJ59vMIv880zJ4Oc7LLipeC96EgKcsw4wUbYaX2pgqMgsu6RKoMYRXs5fHUbCV
 oAj07U4ijRQKC8ntH/J49KP4FK5M1xTl5k66S2SpfOkewXOC94he9sG43s21H6BkczyibC82lr
 iL797khPMablZeqTSgsXattor/QE+D2Wk1VSdr1Gzba+IIBUGw547t98KqL/LKvder5ak0x0lX
 jiw+eYRhVVEqsq95Wx186+2GkpVjFIraZbYZ7eobotY0TkHCBlJjKNiOxMZRjQc3yIIgQ7L80h
 LCo=
X-SBRS: 2.7
X-MesageID: 11928727
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11928727"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24110.65070.650427.446768@mariner.uk.xensource.com>
Date: Mon, 27 Jan 2020 15:13:50 +0000
To: Lars Kurth <lars.kurth@citrix.com>
In-Reply-To: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
References: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [Vote] For Xen Project Code of Conduct (deadline
 March 31st)
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
Cc: "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGFycyBLdXJ0aCB3cml0ZXMgKCJbVm90ZV0gRm9yIFhlbiBQcm9qZWN0IENvZGUgb2YgQ29uZHVj
dCAoZGVhZGxpbmUgTWFyY2ggMzFzdCkiKToKPiBQZW9wbGUgYWxsb3dlZCB0byB2b3RlIG9uIGJl
aGFsZiBvZiB0aGUgSHlwZXJ2aXNvciBwcm9qZWN0IGFyZToKPiBKdWxpZW4gR3JhbGwsIEFuZHkg
Q29vcGVyLCBHZW9yZ2UgRHVubGFwLCBJYW4gSmFja3NvbiwgSmFuIEJldWxpY2gsIEtvbnJhZCBS
Cj4gV2lsaywgU3RlZmFubyBTdGFiZWxsaW5pLCBXZWkgTGl1IGFuZCBQYXVsIER1cnJhbnQgKGFz
IFJlbGVhc2UgTWFuYWdlcikuCgorMQoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
