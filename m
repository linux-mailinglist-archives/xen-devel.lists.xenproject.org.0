Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C113EAD443
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 09:55:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7ETQ-00078D-5B; Mon, 09 Sep 2019 07:52:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q4AO=XE=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i7ETO-000780-UG
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 07:52:30 +0000
X-Inumbo-ID: c5b00e64-d2d6-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5b00e64-d2d6-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 07:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568015550;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HOu90C0S/vcu2scrZ2wy/LDoUJWwGWMA+8rUepwWyoM=;
 b=Ny/3Zax2iUHxBdyi+ZlyZnxLRwEkbrkqT6cYxa8hhDqQqy6BNG9xapCy
 ZwNBmxcjzLETRqWuSYl1HRuydoq1Sbq6OD1y+bu8CDPoBcN57Ge25qzye
 jPQFj8JxGAby0EoIPfenT61nRagupYkpKaznXbEx4BzkV0TR49EK/CcTK k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 9OdzJmLw6zgP2/wJbGOO2gEloDmN2curVsdNU8Wy0kfpfNWU7tYhqc7vLSQM17h3avHA39X+1h
 +REcWx5eD8EI+5log1lMcnJVWMCLaIcI0chtZ9WkmKFBvfHaV8CiKOvEnGYKty72Ce+YJ7TrNc
 o9doO6UdtOc0UgzX4bQ1C6y3kiImZ4t9YuUqB2yfXKP+P8ui3/LrGpQH0RyPTpJbq6uBSJ94Ki
 mnglmOvf2+rzoeMrFn0x/G4drqEfpuwrVlRsmd0zL9pRJkHXBvAjgBndqVaXauO/MgKkdkPMpk
 5WQ=
X-SBRS: 2.7
X-MesageID: 5300687
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5300687"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "'jgross@suse.com'" <jgross@suse.com>
Thread-Topic: [ANNOUNCE] Xen 4.13 Development Update
Thread-Index: AQHVZIZyu9jSiaITdU2E6rnNwue3w6ci/WkQ
Date: Mon, 9 Sep 2019 07:52:25 +0000
Message-ID: <d3ee40a33d344aa0883f75f7daf4544f@AMSPEX02CL03.citrite.net>
References: <20190906074058.21782-1-jgross@suse.com>
In-Reply-To: <20190906074058.21782-1-jgross@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Cc: "luwei.kang@intel.com" <luwei.kang@intel.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>,
 "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "olekstysh@gmail.com" <olekstysh@gmail.com>,
 "JBeulich@suse.com" <JBeulich@suse.com>, "puwen@hygon.cn" <puwen@hygon.cn>,
 "chao.gao@intel.com" <chao.gao@intel.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+IA0KPiA9PT0geDg2ID09PQ0K
PiANCj4gKiAgUFYtSU9NTVUgKHY3KQ0KPiAgIC0gIFBhdWwgRHVycmFudA0KDQpUaGlzIGlzIG5v
dCBoYXBwZW5pbmcsIGJ1dCBJIHdpbGwgYmUgcG9zdGluZyB2OSBvZiBteSAiYWRkIHBlci1kb21h
aW4gSU9NTVUgY29udHJvbCIgc2VyaWVzIGZhaXJseSBzaG9ydGx5Lg0KDQogIFBhdWwNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
