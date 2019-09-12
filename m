Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3EBB0E49
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:51:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Naf-0004O5-KE; Thu, 12 Sep 2019 11:48:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HORN=XH=citrix.com=christian.lindig@srs-us1.protection.inumbo.net>)
 id 1i8Nad-0004Ny-Of
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:48:43 +0000
X-Inumbo-ID: 44d99128-d553-11e9-978d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44d99128-d553-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568288923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1exp90w49We9vOmlGbou5Hq8R1Q87xf4gslcjsJP/M0=;
 b=bh44ks7u3iZKIu+YCQFof07+8wxEpPusMmLtmt+Kr58rQmRkB3L6+sVu
 +PXxmBb3UWCkZib0qwGE6dbJp25a7yLm08+PN6fKwA48SCB8sIHIJrgGd
 ZWZY/XNo+MeEcb7qTeyrOy8ekooQs1CmTKCZOhaoAR011qZRZD7bluDem k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=christian.lindig@citrix.com;
 spf=Pass smtp.mailfrom=christian.lindig@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 christian.lindig@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 christian.lindig@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="christian.lindig@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="christian.lindig@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ShdbG7iXmlrnGf3X3nj3yjVOZba+lp5M1mW/lZeHCyatqPSIncjFjNvtl0n76Oa09WarumRmDc
 jewdKFx66vC1KN+P25HaOAY8l/ekuj1YW7/GXoXe2CyVmssvoAbDEogfVFsqX3lT4OJ5h0Bd2c
 zti1AdjlX9PpyPaqi5ywPizhc2fJCbxkAulqDWGo5Vk93c2nQ7lvFbTvOshBJngC+5wtyn+zgi
 zaSJ3neFg/UllHfwP72JDWxZWGmXxiZgIqj7BejnSgNsX0r0n5fxesHj3JKaO8M7rlTbQX74Br
 S4M=
X-SBRS: 2.7
X-MesageID: 5673945
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,495,1559534400"; 
   d="scan'208";a="5673945"
From: Christian Lindig <christian.lindig@citrix.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v9 3/6] sysctl / libxl: report whether IOMMU/HAP page
 table sharing is supported
Thread-Index: AQHVaVu1i9SBq6Ve/E+ASNd9OM3d86cny8iA
Date: Thu, 12 Sep 2019 11:48:38 +0000
Message-ID: <BC6A5CD4-F8FF-4C76-AF07-66E3A10EFB88@citrix.com>
References: <20190912111744.40410-1-paul.durrant@citrix.com>
 <20190912111744.40410-4-paul.durrant@citrix.com>
In-Reply-To: <20190912111744.40410-4-paul.durrant@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <DDD9E9FBB345684582598DE81AD93C61@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v9 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David Scott <dave@recoil.org>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDEyIFNlcCAyMDE5LCBhdCAxMjoxNywgUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRA
Y2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsICAgICB8
IDEgKwo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbCAgfCAxICsKPiB0b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmwubWxpIHwgMiArLQoKQWNrZWQtYnk6IENocmlzdGlhbiBMaW5kaWcg
PGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
