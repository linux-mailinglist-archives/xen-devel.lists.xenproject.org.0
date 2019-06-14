Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB8E45B6D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:29:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkN4-0008QI-Q2; Fri, 14 Jun 2019 11:27:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkN3-0008Py-Cp
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:27:49 +0000
X-Inumbo-ID: 6e74fda4-8e97-11e9-9abd-4bc53f874d12
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e74fda4-8e97-11e9-9abd-4bc53f874d12;
 Fri, 14 Jun 2019 11:27:46 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jwL9937GfRuLE398m1u5dheaP/tcyGm3Qf4JNg45rY1Xqmi4saYzQNUhR7/8PxkDyh4q+DMeAZ
 lMx3ELcoctWTK1zS0FZm+cSMddS+BQL/O5bTKyaNYfZlwR38YvIT5si2jNmzdZqg8X4TTCOOJt
 s+eFgZIBtoYF+cJcmLfVC9hzCkauc5y9yq1UW7P1s9pL1aMn/knDOLvTjJpeXF6gjkYPvYD2fN
 9YABM+Dz1APUHNZEVyATIYESxTGgo+zGIZYhZ5UqFwF1iIRoV/MchGqESeODcU4NqoWCPCN7SQ
 n7I=
X-SBRS: 2.7
X-MesageID: 1726673
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1726673"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:40 +0100
Message-ID: <20190614112444.29980-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 11/15] libxl_usb: Fix wrong usage of asserts
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfdXNiLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwv
bGlieGxfdXNiLmMgYi90b29scy9saWJ4bC9saWJ4bF91c2IuYwppbmRleCAzZDM4OWMwMTk4Li42
OTQ4NzBhM2MzIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF91c2IuYworKysgYi90b29s
cy9saWJ4bC9saWJ4bF91c2IuYwpAQCAtMTQ4LDcgKzE0OCw3IEBAIHN0YXRpYyBpbnQgbGlieGxf
X2RldmljZV9mcm9tX3VzYmN0cmwobGlieGxfX2djICpnYywgdWludDMyX3QgZG9taWQsCiAgICAg
ICAgIGJyZWFrOwogICAgIGRlZmF1bHQ6CiAgICAgICAgIGFzc2VydCgwKTsgLyogY2FuJ3QgcmVh
bGx5IGhhcHBlbi4gKi8KLSAgICAgICAgYnJlYWs7CisgICAgICAgIHJldHVybiBFUlJPUl9JTlZB
TDsKICAgICB9CiAgICAgZGV2aWNlLT5kZXZpZCAgICAgICAgICAgPSB1c2JjdHJsLT5kZXZpZDsK
ICAgICBkZXZpY2UtPmRvbWlkICAgICAgICAgICA9IGRvbWlkOwpAQCAtMzcxLDcgKzM3MSw3IEBA
IHN0YXRpYyBpbnQgbGlieGxfX2RldmljZV91c2JjdHJsX2FkZF9odm0obGlieGxfX2djICpnYywg
dWludDMyX3QgZG9taWQsCiAgICAgICAgIGJyZWFrOwogICAgIGRlZmF1bHQ6CiAgICAgICAgIGFz
c2VydCgwKTsgLyogU2hvdWxkIG5vdCBiZSBwb3NzaWJsZS4gKi8KLSAgICAgICAgYnJlYWs7Cisg
ICAgICAgIHJldHVybiBFUlJPUl9JTlZBTDsKICAgICB9CiAKICAgICBmbGV4YXJyYXlfYXBwZW5k
X3BhaXIocW1wX2FyZ3MsICJpZCIsCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
