Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CD21411E4
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 20:36:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isXNS-0007HU-Lr; Fri, 17 Jan 2020 19:33:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z7Pq=3G=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1isXNR-0007HJ-J3
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 19:33:53 +0000
X-Inumbo-ID: 41dfa478-3960-11ea-b604-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41dfa478-3960-11ea-b604-12813bfff9fa;
 Fri, 17 Jan 2020 19:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579289619;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=M/abRlCCq88Mh6yJullZn7PN09OWKqwaHSAUMd3cPiE=;
 b=Y2AcvT9CQW3pQtIXCHD6sUbHF1HXKa2Hxb/6tw8mfmt6u3vlNncDshPH
 Zm4KM/Wk35es/njRmCflKh3TyDDYnvpqsbPvo73KmIuPkWRZpAMUc1MUS
 BkzfvG/yaKlDcKkp286QFrhvowM3QKAPi1KHHopknZgscFE8vppX1lorM M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
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
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: UMyFQC8jD3EHPwUgTrpNlAZDFTrF7ulGVlLQXsEhX7A/mkXWwPsB7qMmHEuHLgAqSxnCjeYU3S
 prkoHKM9Bhctbi5hZ3DUT1v1KXeoxcxPQWleKPjBv3WBaNEg75rhAlzyqFb3KVntG8Ncort9pj
 5ovqP3hmBMxO5eqTKUp1PHFBYCmas3ZNP+FRzv5aIXkde4pVeBpB7ojlnq37xMNzhqfolR/SE0
 aOWyQt2QdxGvINLsHgOMVs1jpz3se+qZiKvOfxuOLF7ZOrzwStz6e1Q0nUXS/jtO4GmFGesAez
 eyM=
X-SBRS: 2.7
X-MesageID: 11261417
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,331,1574139600"; d="scan'208";a="11261417"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "xen-api@lists.xenproject.org"
 <xen-api@lists.xenproject.org>, "win-pv-devel@lists.xenproject.org"
 <win-pv-devel@lists.xenproject.org>
Thread-Topic: [Vote] For Xen Project Code of Conduct (deadline March 31st)
Thread-Index: AQHVzWoFYs8FGD9/QUu11lcL/Sdp7KfvLlWA
Date: Fri, 17 Jan 2020 19:33:15 +0000
Message-ID: <6C7D77F3-8CC6-4BBA-9B92-B7B15DAB125F@citrix.com>
References: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
In-Reply-To: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.12.200112
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <E43A46773F1EB34D84E15FE152B23696@citrix.com>
MIME-Version: 1.0
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
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXBvbG9naWVzLA0KDQpzb21lIG9mIHRoZSBsaW5rcyBJIGFkZGVkIGZvciBjb252ZW5pZW5jZSBk
byBub3Qgd29yaw0KDQo+IEl0IHNob3VsZCBiZSByZWFkIGluIHRoZSBmb2xsb3dpbmcgb3JkZXIN
ClRoZSBjb3JyZWN0IGxpbmtzIGFyZQ0KDQogICAgKiBodHRwOi8veGVuYml0cy54ZW5wcm9qZWN0
Lm9yZy9naXR3ZWIvP3A9cGVvcGxlL2xhcnNrL2NvZGUtb2YtY29uZHVjdC5naXQ7YT1ibG9iO2Y9
Y29kZS1vZi1jb25kdWN0Lm1kO2hiPXJlZnMvaGVhZHMvQ29DLXY1IA0KICAgICogaHR0cDovL3hl
bmJpdHMueGVucHJvamVjdC5vcmcvZ2l0d2ViLz9wPXBlb3BsZS9sYXJzay9jb2RlLW9mLWNvbmR1
Y3QuZ2l0O2E9YmxvYjtmPWNvbW11bmljYXRpb24tZ3VpZGUubWQ7aGI9cmVmcy9oZWFkcy9Db0Mt
djUNCiAgICAqIGh0dHA6Ly94ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdHdlYi8/cD1wZW9wbGUv
bGFyc2svY29kZS1vZi1jb25kdWN0LmdpdDthPWJsb2I7Zj1jb2RlLXJldmlldy1ndWlkZS5tZDto
Yj1yZWZzL2hlYWRzL0NvQy12NQ0KICAgICogaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcv
Z2l0d2ViLz9wPXBlb3BsZS9sYXJzay9jb2RlLW9mLWNvbmR1Y3QuZ2l0O2E9YmxvYjtmPWNvbW11
bmljYXRpb24tcHJhY3RpY2UubWQ7aGI9cmVmcy9oZWFkcy9Db0MtdjUNCiAgICAqIGh0dHA6Ly94
ZW5iaXRzLnhlbnByb2plY3Qub3JnL2dpdHdlYi8/cD1wZW9wbGUvbGFyc2svY29kZS1vZi1jb25k
dWN0LmdpdDthPWJsb2I7Zj1yZXNvbHZpbmctZGlzYWdyZWVtZW50Lm1kO2hiPXJlZnMvaGVhZHMv
Q29DLXY1DQogICAgDQpMYXJzDQogICAgDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
