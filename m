Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3FB8035
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:43:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB0Qi-0004cE-Bv; Thu, 19 Sep 2019 17:41:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB0Qg-0004Zt-6f
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:41:18 +0000
X-Inumbo-ID: abed1cf2-db04-11e9-978d-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abed1cf2-db04-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 17:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568914873;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDiLQjrmBn9FqhHJY55/fbZV77Ew85zyUCNIqcXWb4E=;
 b=L3gRMs/cvaTIO3NlHWos+5ug/9WlJt3R3TM4KmC8r0WzhJWpZv7mGl1d
 CvwGybO21xG6MvnwV6lQzLQKuF0oDc+uylUF5F03aM/Ct88GENpXQjPOa
 GPzdCr1WYsUc+/OuXUJo0Yd9DWlrUBueOrYiSANQgQwYkn11QeqYbQbHn A=;
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
IronPort-SDR: FKx1F/tdUawXrIT7xL8tnR3V7sGXPCaSJs+Ruftbsujdy6XRJCn4lccU1wz3HRoCdeF+wAjcNl
 m8Gnu8KIaMtJqtCxBUj1UR8Lma6ePzhFaZlaGtOAVtnNTbcYx5dDEX/FJKyaBGX6dS7im0mzT9
 AJyE6rDe/qu2SxfJN4yGViNLb5sfBkF9No0eIkqemkML048ImVWVW9b9syyXrik4oO8drBlb/F
 TtPl8lB71SCHCIxaV1BO/OGkz+2R1PnfSapyN3kEIjK+748edlKuUORArsUkT0S8U1qZjs3uvd
 JlI=
X-SBRS: 2.7
X-MesageID: 5864910
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5864910"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:33 +0100
Message-ID: <20190919171656.899649-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190919171656.899649-1-anthony.perard@citrix.com>
References: <20190919171656.899649-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 13/35] libxl_dm: Update libxl__spawn_stub_dm
 to use libxl__domain_unpause
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0
b29scy9saWJ4bC9saWJ4bF9kbS5jICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrLQog
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMjIg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xp
YnhsX2RtLmMgYi90b29scy9saWJ4bC9saWJ4bF9kbS5jCmluZGV4IDI0NmM1NzAxMjFkMy4uYzAw
MzU2YTJmMTZhIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kbS5jCisrKyBiL3Rvb2xz
L2xpYnhsL2xpYnhsX2RtLmMKQEAgLTIwODIsNiArMjA4Miw5IEBAIHN0YXRpYyB2b2lkIHNwYXdu
X3N0dWJfbGF1bmNoX2RtKGxpYnhsX19lZ2MgKmVnYywKIHN0YXRpYyB2b2lkIHN0dWJkb21fcHZx
ZW11X2NiKGxpYnhsX19lZ2MgKmVnYywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxp
YnhsX19tdWx0aWRldiAqYW9kZXZzLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IHJjKTsKK3N0YXRpYyB2b2lkIHN0dWJkb21fcHZxZW11X3VucGF1c2VkKGxpYnhsX19lZ2MgKmVn
YywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kbV9yZXN1bWVf
c3RhdGUgKmRtcnMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcmMp
OwogCiBzdGF0aWMgdm9pZCBzdHViZG9tX3hzd2FpdF9jYihsaWJ4bF9fZWdjICplZ2MsIGxpYnhs
X194c3dhaXRfc3RhdGUgKnhzd2FpdCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCByYywgY29uc3QgY2hhciAqcCk7CkBAIC0yNDA0LDcgKzI0MDcsMjQgQEAgc3RhdGljIHZvaWQg
c3R1YmRvbV9wdnFlbXVfY2IobGlieGxfX2VnYyAqZWdjLAogICAgICAgICBnb3RvIG91dDsKICAg
ICB9CiAKLSAgICByYyA9IGxpYnhsX19kb21haW5fdW5wYXVzZV9kZXByZWNhdGVkKGdjLCBkbV9k
b21pZCk7CisgICAgc2Rzcy0+cHZxZW11LmRtcnMuYW8gPSBhbzsKKyAgICBzZHNzLT5wdnFlbXUu
ZG1ycy5kb21pZCA9IGRtX2RvbWlkOworICAgIHNkc3MtPnB2cWVtdS5kbXJzLmNhbGxiYWNrID0g
c3R1YmRvbV9wdnFlbXVfdW5wYXVzZWQ7CisgICAgbGlieGxfX2RvbWFpbl91bnBhdXNlKGVnYywg
JnNkc3MtPnB2cWVtdS5kbXJzKTsgLyogbXVzdCBiZSBsYXN0ICovCisgICAgcmV0dXJuOworb3V0
OgorICAgIHN0dWJkb21fcHZxZW11X3VucGF1c2VkKGVnYywgJnNkc3MtPnB2cWVtdS5kbXJzLCBy
Yyk7Cit9CisKK3N0YXRpYyB2b2lkIHN0dWJkb21fcHZxZW11X3VucGF1c2VkKGxpYnhsX19lZ2Mg
KmVnYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19kbV9yZXN1
bWVfc3RhdGUgKmRtcnMsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQg
cmMpCit7CisgICAgbGlieGxfX3N0dWJfZG1fc3Bhd25fc3RhdGUgKnNkc3MgPQorICAgICAgICBD
T05UQUlORVJfT0YoZG1ycywgKnNkc3MsIHB2cWVtdS5kbXJzKTsKKyAgICBTVEFURV9BT19HQyhz
ZHNzLT5kbS5zcGF3bi5hbyk7CisgICAgdWludDMyX3QgZG1fZG9taWQgPSBzZHNzLT5wdnFlbXUu
Z3Vlc3RfZG9taWQ7CisKICAgICBpZiAocmMpIGdvdG8gb3V0OwogCiAgICAgc2Rzcy0+eHN3YWl0
LmFvID0gYW87CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIGIvdG9v
bHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAppbmRleCBhMGNiNmQyODg1OGYuLjExNDRhYWEzYTU2
OSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaAorKysgYi90b29scy9s
aWJ4bC9saWJ4bF9pbnRlcm5hbC5oCkBAIC0zOTg1LDYgKzM5ODUsNyBAQCBzdHJ1Y3QgbGlieGxf
X2RtX3NwYXduX3N0YXRlIHsKICAgICBsaWJ4bF9fc3Bhd25fc3RhdGUgc3Bhd247CiAgICAgbGli
eGxfX2V2X3FtcCBxbXA7CiAgICAgbGlieGxfX2V2X3RpbWUgdGltZW91dDsKKyAgICBsaWJ4bF9f
ZG1fcmVzdW1lX3N0YXRlIGRtcnM7CiAgICAgLyogZmlsbGVkIGluIGJ5IHVzZXIsIG11c3QgcmVt
YWluIHZhbGlkOiAqLwogICAgIHVpbnQzMl90IGd1ZXN0X2RvbWlkOyAvKiBkb21haW4gYmVpbmcg
c2VydmVkICovCiAgICAgbGlieGxfZG9tYWluX2NvbmZpZyAqZ3Vlc3RfY29uZmlnOwotLSAKQW50
aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
