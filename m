Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8B8B536A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:53:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGgv-00006d-G7; Tue, 17 Sep 2019 16:51:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGgt-00005p-F5
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:50:59 +0000
X-Inumbo-ID: 522319c8-d96b-11e9-961b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 522319c8-d96b-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739058;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=DymHzIlQ063CNutwXELwu4SnV1Hc85evVoCU97X9Ee8=;
 b=fHxZLIDMGa8cqtUqqdkjbHjYtM0omr7Rz1idiEt0gNxWlAO1M0cm/4GQ
 aDIM0YNDN8qthsldYR8rzwicl7+r6xvSLA0OupO3FYa6pQ9Igx7AM3QNC
 M3LnWHdPaXFPMU1NVTGuAuzat5FSypd8i+GUtsUv+CD2pR1z9YjPGOmXA Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: A4YVWfkMLA32QpWsNx8OhltqouD6dk7uy1WsQAhW6/XeLwoR8T4lIGpjgfxQgn3iXBIexN5lEU
 hObREaU65BpFG4bTGvP/Y2fm4Lz0o1m+jUUdZ/EyWwn962dtVyqSuMXNRWnwOR/f9LXI6mfzbG
 DjcSU1DWPSQl05t2byQGIIu/WOGIvDNjhVeS74etuQc1UZUVeEe3y1wMfscDizM0/RejDwX4TM
 KsU6lpCZ3TnJy/tcI/2BBmMpKYrGTH4eQb2OAdvyGWA6YVIYhwlI2vHyQcwuiDyn2J7WA5ZWJp
 Y0A=
X-SBRS: 2.7
X-MesageID: 5682126
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5682126"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.3822.552523.584156@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:50:54 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-6-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-6-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 05/35] libxl: Make
 libxl_qemu_monitor_command async
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDA1LzM1XSBsaWJ4bDogTWFrZSBsaWJ4bF9x
ZW11X21vbml0b3JfY29tbWFuZCBhc3luYyIpOgo+IC4uIGJlY2F1c2UgaXQgbWFrZXMgUU1QIGNh
bGxzIHdoaWNoIGFyZSBnb2luZyB0byBiZSBhc3luYy4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
