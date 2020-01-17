Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C70140B3F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:44:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isRsq-0005f8-Bj; Fri, 17 Jan 2020 13:41:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zPxh=3G=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1isRso-0005ew-Go
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 13:41:54 +0000
X-Inumbo-ID: 1ccbe826-392f-11ea-b52b-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ccbe826-392f-11ea-b52b-12813bfff9fa;
 Fri, 17 Jan 2020 13:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579268510;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=WZtQtfulNkgRj0SDLI/iWUnx8xlj7jpqozFS32XNe/w=;
 b=PQWkFlkekeDITCd+qRMuK4lWVuM44LbwdTt+JiLvUF/6p5hSOsg51g3l
 8Khh3Z5wJPPrtYPvDAELI2gn+SBTEbtgt6MXucSzOtGcW6Gv3b9nhdiY4
 ugamwiqA20cBW5IsHnAOAKKUewQ0PRhXTr/WFLO91YqrL6cjB6rQtt6V5 A=;
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
IronPort-SDR: 4xTB+bDOoVGK112jvUt71N0rTioyB0YGYY637GWeKbnVYDJV+KQSCpp4RRUrI5VkVlIeWm7/di
 6q8uu0WpohVWYcjCoVeeWJ5hODl/NH1i9b+4/m8amA9n4NkJVPFZs5gCdjOQZfQ8KAJdUjVWB4
 cL6FypsSI85/WN4KwEFo+sLt4c8GCyO+S5LAqQc7xnxYmnkKWRJ12/ODrHylzU74ndbeX0JNK/
 L7yCYfDJa18KbfGzXEJXUnOAsDy9XqkT23j39UgjIH2ol1BlGN6iTDEZdAAXagDzgwS9X9HouC
 Mtw=
X-SBRS: 2.7
X-MesageID: 11503955
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11503955"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24097.47515.321190.998423@mariner.uk.xensource.com>
Date: Fri, 17 Jan 2020 13:41:47 +0000
To: George Dunlap <george.dunlap@citrix.com>
In-Reply-To: <ee7672c1-bc8c-8a8c-6d18-4d854b000101@citrix.com>
References: <20200113170843.21332-1-ian.jackson@eu.citrix.com>
 <20200113170843.21332-8-ian.jackson@eu.citrix.com>
 <ee7672c1-bc8c-8a8c-6d18-4d854b000101@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 07/10] libxl: event: poller pipe
 optimisation
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogW1BBVENIIHYyIDA3LzEwXSBsaWJ4bDogZXZlbnQ6
IHBvbGxlciBwaXBlIG9wdGltaXNhdGlvbiIpOgo+IE9uIDEvMTMvMjAgNTowOCBQTSwgSWFuIEph
Y2tzb24gd3JvdGU6Cj4gPiBzcXVhc2ghIGxpYnhsOiBldmVudDogcG9sbGVyIHBpcGUgb3B0aW1p
c2F0aW9uCj4gCj4gU3RyYXkgInNxdWFzaCIgZGV0cml1cy4KCk9vcHMuCgo+IE90aGVyIHRoYW4g
dGhhdDoKPiAKPiBSZXZpZXdlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRy
aXguY29tPgoKVGhhbmtzLCBmaXhlZC4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
