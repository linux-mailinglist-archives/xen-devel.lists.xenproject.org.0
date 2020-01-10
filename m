Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB3C1375AD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 19:00:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipyXY-0002d1-3N; Fri, 10 Jan 2020 17:57:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0O1r=27=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ipyXX-0002cw-1l
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 17:57:43 +0000
X-Inumbo-ID: adcf3290-33d2-11ea-ac27-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adcf3290-33d2-11ea-ac27-bc764e2007e4;
 Fri, 10 Jan 2020 17:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578679054;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=TSL2UtSnE0Emn9J8hyQhjfW7xSv4jewrCy3eumqz+2A=;
 b=HGz+9GMMZEst2CYioRROH/btAOBjmD9sWinry/X1duppwrLOFRTvwWnM
 hYeBaJIeCNrHJaBqcJ+QJ6xZ+A7tkxV3F2NYjide0cUhprsFuRM/Z+Lrr
 kyd1dgiW/O05tusSuNkl6bd2Y3WJeamolg22qRQ5/b6+lMDvPK5Q46sL9 8=;
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
IronPort-SDR: M5bPqwNqnf4K6CYyJ0dVKOUpjxDIecuV2MXXU+rOc76CvwZPrP6f05WB6s0BHMpEA9vMzmlC5Q
 XyTJtQcabvRwCO2IxrVorbzSEDgLUGNvH7F/82Lhe4WAONtd4WYOBxWZK2BUPED9ksJQzBhtzQ
 WPTgKTn9GIcJrMbtLbaCJ9D19dpf/zzxp8v32AhRjVR/7vWB4/eQv7ifjK7GfkKn8rboTIj3rE
 awCuMjJLPRK7eSXxM9oz5reDJOSHtcTGFgJV7Ge5HG05M/g1r5XQ/Kn3uItgSOrpk4MW4C4qA1
 ndM=
X-SBRS: 2.7
X-MesageID: 10772335
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,417,1571716800"; d="scan'208";a="10772335"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24088.47883.150054.174228@mariner.uk.xensource.com>
Date: Fri, 10 Jan 2020 17:57:31 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <20200109121227.949665-1-george.dunlap@citrix.com>
References: <20200109121227.949665-1-george.dunlap@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 1/2] libxl: Get rid of some trailing
 whitespace
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggdjIgMS8yXSBsaWJ4bDogR2V0IHJpZCBvZiBz
b21lIHRyYWlsaW5nIHdoaXRlc3BhY2UiKToKPiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuCgpBY2tl
ZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
