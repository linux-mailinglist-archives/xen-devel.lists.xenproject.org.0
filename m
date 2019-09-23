Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D7BB53B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:29:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOMq-0000J1-Qf; Mon, 23 Sep 2019 13:27:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sJPS=XS=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iCOMo-0000Iw-KW
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:27:02 +0000
X-Inumbo-ID: d2f5af2c-de05-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2f5af2c-de05-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 13:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569245221;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ShnbNASyOSZsx7FYaTt5TD/I99itV6s8oSeJ4g1qJpo=;
 b=f5lPwiTJ4WDyrOuptoUqp8MQ4gdofqso9fYaISyJoKk0xKfmTsZQWWW9
 oGO4la+XGz0dsOtKcyejhaXdrCagRR7jSu3mo2IAI0DnbODWgtMGT4xM4
 iuyoFSDbEuaiUm+NAWzdRE9jzjRyzyZlJyvkSrWHYfcBiXG3ccZ50OdNa E=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: j+wl6/kg+ufD3wuB/6GlpHrzz4o5rcqBL9hjwXBHedKM/EO6e/z1DE/610CE94QZrYWoeYV4Gx
 z/DUwPPJA1ujh93srFBeIdSqZUnd+uH2UdsKsEo1zPQ63jrjrmmvmh1RGbI6anc/9xwAtAuer6
 fxLY43/nUJGrbKpOHwiCPSU/gptd9w+hB3RDLUtYVx5eaqjmfOhs1X6CX4IGH1X64gPIjdGGOG
 EcPcuPOU1M8MVVpdg1kO6JrFaMdC/EN3oZ9+NS+TY5I2uvZP9uKC8AN+OahsxlJw8LglgBa3AL
 F38=
X-SBRS: 2.7
X-MesageID: 5991296
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,540,1559534400"; 
   d="scan'208";a="5991296"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 23 Sep 2019 14:26:52 +0100
Message-ID: <20190923132652.205526-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxl: Fix build when LIBXL_API_VERSION is set
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbXBhdGliaWxpdHkgZnVuY3Rpb24gbWlzdGFrZW5seSBjYWxsZWQgaXRzZWxmLgoKRml4
ZXM6IDk1NjI3Yjg3YzMxNTk5Mjg0NThlZTU4NmU4YzVjNTkzYmRkMjQ4ZDgKU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMv
bGlieGwvbGlieGwuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9saWJ4
bC9saWJ4bC5oCmluZGV4IGJhNDhlN2U5MDBkMy4uMzQyMWU1YWE5ODZkIDEwMDY0NAotLS0gYS90
b29scy9saWJ4bC9saWJ4bC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKQEAgLTI0MTMsNyAr
MjQxMyw3IEBAIGludCBsaWJ4bF9zZW5kX3RyaWdnZXIobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90
IGRvbWlkLAogc3RhdGljIGlubGluZSBpbnQgbGlieGxfc2VuZF90cmlnZ2VyXzB4MDQxMjAwKAog
ICAgIGxpYnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgbGlieGxfdHJpZ2dlciB0cmlnZ2Vy
LCB1aW50MzJfdCB2Y3B1aWQpCiB7Ci0gICAgcmV0dXJuIGxpYnhsX3NlbmRfdHJpZ2dlcl8weDA0
MTIwMChjdHgsIGRvbWlkLCB0cmlnZ2VyLCB2Y3B1aWQsIE5VTEwpOworICAgIHJldHVybiBsaWJ4
bF9zZW5kX3RyaWdnZXIoY3R4LCBkb21pZCwgdHJpZ2dlciwgdmNwdWlkLCBOVUxMKTsKIH0KICNk
ZWZpbmUgbGlieGxfc2VuZF90cmlnZ2VyIGxpYnhsX3NlbmRfdHJpZ2dlcl8weDA0MTIwMAogI2Vu
ZGlmCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
