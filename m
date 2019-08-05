Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 423FA8206F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 17:38:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huf0V-0006uj-5n; Mon, 05 Aug 2019 15:34:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nlIb=WB=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1huf0U-0006ue-1B
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 15:34:42 +0000
X-Inumbo-ID: 8950a0ba-b796-11e9-8e5d-439c75b3fe30
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8950a0ba-b796-11e9-8e5d-439c75b3fe30;
 Mon, 05 Aug 2019 15:34:39 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MG3ZYEtER2WNBLk7cKJNOdkkcuRS1CfcERDgx+KKeOAZ18birOSwVaDoGmN6J5wHyqDQuNDlPo
 2NMP/2mVtpyvDFsDetJxnpfrW62aypu0V88gQNBuncwFTW4ERaK4LcQ5Yim3TVEPVBLsctvPNu
 POCTx4WHjJdznFWGZlWrdXHDb9DPv4N3W4CvLmcgUI+QW2gyVvI6JEeLWS+x7lTTyC2SXUqAP9
 nQ+DN+jzSXNcFnY+rTEx8Fdt+FA34PQ0zoc7N8tZJPVjhAojTm1my0ZBmZCZd918eQxIJ1kxWk
 hv8=
X-SBRS: 2.7
X-MesageID: 3880647
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,350,1559534400"; 
   d="scan'208";a="3880647"
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: <netdev@vger.kernel.org>
Date: Mon, 5 Aug 2019 16:34:34 +0100
Message-ID: <20190805153434.12144-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/netback: Reset nr_frags before freeing skb
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 "David S. Miller" <davem@davemloft.net>, Ross
 Lagerwall <ross.lagerwall@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhpcyBwb2ludCBucl9mcmFncyBoYXMgYmVlbiBpbmNyZW1lbnRlZCBidXQgdGhlIGZyYWcg
ZG9lcyBub3QgeWV0CmhhdmUgYSBwYWdlIGFzc2lnbmVkIHNvIGZyZWVpbmcgdGhlIHNrYiByZXN1
bHRzIGluIGEgY3Jhc2guIFJlc2V0Cm5yX2ZyYWdzIGJlZm9yZSBmcmVlaW5nIHRoZSBza2IgdG8g
cHJldmVudCB0aGlzLgoKU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25l
dGJhY2suYwppbmRleCAxZDk5NDBkNGU4YzcuLmM5MjYyZmZlZWZlNCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRi
YWNrL25ldGJhY2suYwpAQCAtOTI1LDYgKzkyNSw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl90eF9i
dWlsZF9nb3BzKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAogCQkJc2tiX3NoaW5mbyhza2Ip
LT5ucl9mcmFncyA9IE1BWF9TS0JfRlJBR1M7CiAJCQluc2tiID0geGVudmlmX2FsbG9jX3NrYigw
KTsKIAkJCWlmICh1bmxpa2VseShuc2tiID09IE5VTEwpKSB7CisJCQkJc2tiX3NoaW5mbyhza2Ip
LT5ucl9mcmFncyA9IDA7CiAJCQkJa2ZyZWVfc2tiKHNrYik7CiAJCQkJeGVudmlmX3R4X2Vycihx
dWV1ZSwgJnR4cmVxLCBleHRyYV9jb3VudCwgaWR4KTsKIAkJCQlpZiAobmV0X3JhdGVsaW1pdCgp
KQpAQCAtOTQwLDYgKzk0MSw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl90eF9idWlsZF9nb3BzKHN0
cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAogCiAJCQlpZiAoeGVudmlmX3NldF9za2JfZ3NvKHF1
ZXVlLT52aWYsIHNrYiwgZ3NvKSkgewogCQkJCS8qIEZhaWx1cmUgaW4geGVudmlmX3NldF9za2Jf
Z3NvIGlzIGZhdGFsLiAqLworCQkJCXNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MgPSAwOwogCQkJ
CWtmcmVlX3NrYihza2IpOwogCQkJCWtmcmVlX3NrYihuc2tiKTsKIAkJCQlicmVhazsKLS0gCjIu
MTcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
