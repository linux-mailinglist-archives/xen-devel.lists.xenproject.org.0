Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8A786348
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 15:38:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hviZe-0001II-M3; Thu, 08 Aug 2019 13:35:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gKpt=WE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hviZd-0001ID-D0
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:35:21 +0000
X-Inumbo-ID: 5bfa1bd0-b9e1-11e9-9a01-872d344808b2
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bfa1bd0-b9e1-11e9-9a01-872d344808b2;
 Thu, 08 Aug 2019 13:35:17 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nEDU6LVRbg88KTlTux6ru2PgFlw3LZjUfq4C1Lk4MHjAdYYLx5hH5dgAN+PxYLeziP35n1JIkU
 V9/9gTTKBFaujkKcXN+7jTqPGwdxUON4C8t9vauc6bqqS5VS2VfgYKYCgkoY0mPwr3McBoUsMN
 bRXbiVpK7UnxHm2OUDKfgczWJCS1nMhKNkWTo0BYps8sKTld02npKy+2E2kcAibKuNvv6aWJeW
 uPS33gMZybumugUioywI5gGjPgweC8x1Al6DE1locvpzmoxG/q3OOVbjPNnzHDRPL6qIZxb2j3
 tEA=
X-SBRS: 2.7
X-MesageID: 4024476
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4024476"
Date: Thu, 8 Aug 2019 15:35:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chuhong Yuan <hslester96@gmail.com>
Message-ID: <20190808133510.tre6twn764pv3e7m@Air-de-Roger>
References: <20190808131100.24751-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808131100.24751-1-hslester96@gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/3] xen/blkback: Use refcount_t for refcount
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
Cc: Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDk6MTE6MDBQTSArMDgwMCwgQ2h1aG9uZyBZdWFuIHdy
b3RlOgo+IFJlZmVyZW5jZSBjb3VudGVycyBhcmUgcHJlZmVycmVkIHRvIHVzZSByZWZjb3VudF90
IGluc3RlYWQgb2YKPiBhdG9taWNfdC4KPiBUaGlzIGlzIGJlY2F1c2UgdGhlIGltcGxlbWVudGF0
aW9uIG9mIHJlZmNvdW50X3QgY2FuIHByZXZlbnQKPiBvdmVyZmxvd3MgYW5kIGRldGVjdCBwb3Nz
aWJsZSB1c2UtYWZ0ZXItZnJlZS4KPiBTbyBjb252ZXJ0IGF0b21pY190IHJlZiBjb3VudGVycyB0
byByZWZjb3VudF90LgoKVGhhbmtzIQoKSSB0aGluayB0aGVyZSBhcmUgbW9yZSByZWZlcmVuY2Ug
Y291bnRlcnMgaW4gYmxrYmFjayB0aGFuCnRoZSBvbmUgeW91IGZpeGVkLiBUaGVyZSdzIGFsc28g
YW4gaW5mbGlnaHQgZmllbGQgaW4geGVuX2Jsa2lmX3JpbmcsCmFuZCBhIHBlbmRjbnQgaW4gcGVu
ZGluZ19yZXEgd2hpY2ggbG9vayBsaWtlIHBvc3NpYmxlIGNhbmRpZGF0ZXMgdG8Kc3dpdGNoIHRv
IHVzZSByZWZjb3VudF90LCBoYXZlIHlvdSBsb29rZWQgaW50byBzd2l0Y2hpbmcgdGhvc2UgdHdv
CmFsc28/CgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
