Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B8A7FE03
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 18:01:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZx6-0006sI-9N; Fri, 02 Aug 2019 15:58:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZx5-0006qy-77
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:58:43 +0000
X-Inumbo-ID: 660fee57-b53e-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 660fee57-b53e-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 15:58:41 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Mys2SgZAiQ9+r4VKCFV0wLPXOxfBN32PVeRIpoIlAUqt7QX7+WksXIWn9KgFlRZ55VdMJG7LeV
 lfQdShPfbSMCFd9obnvCzzg0HobA9Jokwn88hnWfg4Fv5IURQSLpJhBiVzksd/ScvGW1zZn6AG
 RF6nO52ifIVDbffKxbYToh/CeyGiJ4yJuD/f8cfxJ1YqG0kW1zNZ2vKJ0YSHsYUHh2kZALkecp
 V89B04qqY3MKyLMMsh8kE74HxV4zlAD8O4jXB8pYoGc1FTrxYia6F9sp3vcLUZrJH5+nWjpHu8
 DG8=
X-SBRS: 2.7
X-MesageID: 3797676
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3797676"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:44 +0100
Message-ID: <20190802153606.32061-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802153606.32061-1-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 13/35] libxl_dm: Update libxl__spawn_stub_dm to
 use libxl__domain_unpause
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

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGxfZG0uYyAgICAgICB8IDIyICsrKysrKysrKysrKysrKysr
KysrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAgMSArCiAyIGZpbGVzIGNoYW5n
ZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9s
aWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwppbmRleCAyNDZjNTcwMTIx
Li5jMDAzNTZhMmYxIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kbS5jCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX2RtLmMKQEAgLTIwODIsNiArMjA4Miw5IEBAIHN0YXRpYyB2b2lkIHNw
YXduX3N0dWJfbGF1bmNoX2RtKGxpYnhsX19lZ2MgKmVnYywKIHN0YXRpYyB2b2lkIHN0dWJkb21f
cHZxZW11X2NiKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpYnhsX19tdWx0aWRldiAqYW9kZXZzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50IHJjKTsKK3N0YXRpYyB2b2lkIHN0dWJkb21fcHZxZW11X3VucGF1c2VkKGxpYnhsX19lZ2Mg
KmVnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kbV9yZXN1
bWVfc3RhdGUgKmRtcnMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
cmMpOwogCiBzdGF0aWMgdm9pZCBzdHViZG9tX3hzd2FpdF9jYihsaWJ4bF9fZWdjICplZ2MsIGxp
YnhsX194c3dhaXRfc3RhdGUgKnhzd2FpdCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGludCByYywgY29uc3QgY2hhciAqcCk7CkBAIC0yNDA0LDcgKzI0MDcsMjQgQEAgc3RhdGljIHZv
aWQgc3R1YmRvbV9wdnFlbXVfY2IobGlieGxfX2VnYyAqZWdjLAogICAgICAgICBnb3RvIG91dDsK
ICAgICB9CiAKLSAgICByYyA9IGxpYnhsX19kb21haW5fdW5wYXVzZV9kZXByZWNhdGVkKGdjLCBk
bV9kb21pZCk7CisgICAgc2Rzcy0+cHZxZW11LmRtcnMuYW8gPSBhbzsKKyAgICBzZHNzLT5wdnFl
bXUuZG1ycy5kb21pZCA9IGRtX2RvbWlkOworICAgIHNkc3MtPnB2cWVtdS5kbXJzLmNhbGxiYWNr
ID0gc3R1YmRvbV9wdnFlbXVfdW5wYXVzZWQ7CisgICAgbGlieGxfX2RvbWFpbl91bnBhdXNlKGVn
YywgJnNkc3MtPnB2cWVtdS5kbXJzKTsgLyogbXVzdCBiZSBsYXN0ICovCisgICAgcmV0dXJuOwor
b3V0OgorICAgIHN0dWJkb21fcHZxZW11X3VucGF1c2VkKGVnYywgJnNkc3MtPnB2cWVtdS5kbXJz
LCByYyk7Cit9CisKK3N0YXRpYyB2b2lkIHN0dWJkb21fcHZxZW11X3VucGF1c2VkKGxpYnhsX19l
Z2MgKmVnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kbV9y
ZXN1bWVfc3RhdGUgKmRtcnMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnQgcmMpCit7CisgICAgbGlieGxfX3N0dWJfZG1fc3Bhd25fc3RhdGUgKnNkc3MgPQorICAgICAg
ICBDT05UQUlORVJfT0YoZG1ycywgKnNkc3MsIHB2cWVtdS5kbXJzKTsKKyAgICBTVEFURV9BT19H
QyhzZHNzLT5kbS5zcGF3bi5hbyk7CisgICAgdWludDMyX3QgZG1fZG9taWQgPSBzZHNzLT5wdnFl
bXUuZ3Vlc3RfZG9taWQ7CisKICAgICBpZiAocmMpIGdvdG8gb3V0OwogCiAgICAgc2Rzcy0+eHN3
YWl0LmFvID0gYW87CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCAxY2ZlM2NmODNmLi43Y2FiZmQ2MWI3
IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oCisrKyBiL3Rvb2xzL2xp
YnhsL2xpYnhsX2ludGVybmFsLmgKQEAgLTM5ODQsNiArMzk4NCw3IEBAIHN0cnVjdCBsaWJ4bF9f
ZG1fc3Bhd25fc3RhdGUgewogICAgIGxpYnhsX19zcGF3bl9zdGF0ZSBzcGF3bjsKICAgICBsaWJ4
bF9fZXZfcW1wIHFtcDsKICAgICBsaWJ4bF9fZXZfdGltZSB0aW1lb3V0OworICAgIGxpYnhsX19k
bV9yZXN1bWVfc3RhdGUgZG1yczsKICAgICAvKiBmaWxsZWQgaW4gYnkgdXNlciwgbXVzdCByZW1h
aW4gdmFsaWQ6ICovCiAgICAgdWludDMyX3QgZ3Vlc3RfZG9taWQ7IC8qIGRvbWFpbiBiZWluZyBz
ZXJ2ZWQgKi8KICAgICBsaWJ4bF9kb21haW5fY29uZmlnICpndWVzdF9jb25maWc7Ci0tIApBbnRo
b255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
