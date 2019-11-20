Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A05104055
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 17:08:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXSTS-0008UC-CD; Wed, 20 Nov 2019 16:04:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BA8v=ZM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iXSTQ-0008U7-Kc
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 16:04:56 +0000
X-Inumbo-ID: 7e055508-0baf-11ea-b678-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e055508-0baf-11ea-b678-bc764e2007e4;
 Wed, 20 Nov 2019 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574265896;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=NT7zq2/Oef+zxKQ6d1J1trYBQL/07iWQIn4LqtMv0pQ=;
 b=bBJwKbGaBMqjOIZK4akWtT9yD3rK6vNLu4QHGS2ty89m5DZPG9icYV7+
 +V38hIhxPFBsbGAEF3wcf2Y6pBkqDKkoAmFuVVRFYuCPlqX1Eh+7eL5qz
 ASOii9GHFe0ivb2HPTIv4gFAAK+JRQqKdRDOTgirf0udpqmroGKdId2jT Q=;
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
IronPort-SDR: KMQhKZZbeeg987S+tExWIxggftef1jc5aXFbsurQSvF0LwOx3h4AEMPKQ79pFWe3Y1Vefdf5ur
 kme8g0xExgz5+xomu26m+vmGQNu+pZIoTXI6WCHjzOPKjvf5/A9/LHzWnCPzFCs+p1xF8N00fr
 dcJzfN7XIGdwF88VS56KPK2MDfiJjA16shE7ZCzkfHYlaa9rHptKP+4tGLRPqfgZFyyqZpGefQ
 4Khq/MxwevlbfGQ8t019W8L+QkiH3nKxg/abBUGnAZRg3c9J2uKg5EHw1TNHMzhW/Ms7gShzY4
 +Pc=
X-SBRS: 2.7
X-MesageID: 8720503
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,222,1571716800"; 
   d="scan'208";a="8720503"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24021.25635.630591.146645@mariner.uk.xensource.com>
Date: Wed, 20 Nov 2019 16:04:51 +0000
To: Oleksandr Grytsov <al1img@gmail.com>
In-Reply-To: <CACvf2oXNrgs4BLiDSz_Lzqau2_e_ykmJYPqvYsRCreTM9-zagg@mail.gmail.com>
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
 <24018.56094.533062.819238@mariner.uk.xensource.com>
 <CACvf2oXNrgs4BLiDSz_Lzqau2_e_ykmJYPqvYsRCreTM9-zagg@mail.gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH for-4.13 v1 1/2] libxl: introduce new
 backend type VINPUT
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
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Juergen Gross <jgross@suse.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiUmU6IFtQQVRDSCBmb3ItNC4xMyB2MSAxLzJdIGxp
YnhsOiBpbnRyb2R1Y2UgbmV3IGJhY2tlbmQgdHlwZSBWSU5QVVQiKToKPiBJIHdpbGwgc3VibWl0
IFYyIHdpdGggcmVuYW1pbmcgYW5kIGNvbW1lbnRzIGFkZHJlc3NlZCBmb3Igc2Vjb25kIGNvbW1p
dCBbM10KPiBvZiB0aGUgcGF0Y2hzZXQuCgpUaGFua3MuICBKdWVyZ2VuIHRlbGxzIHRoaXMgaXMg
T0sgaW4gcHJpbmNpcGxlIGJ1dCBtZSBoZSB3YW50cyB0byB0YWtlCm9ubHkgY3JpdGljYWwgZml4
ZXMgYWZ0ZXIgdGhlIG5leHQgUkMuICBTbyBwbGVhc2UgYmUgcXVpY2sgaWYgeW91IGNhbgo6LSku
CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
