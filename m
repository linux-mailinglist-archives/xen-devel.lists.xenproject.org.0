Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8958B7BE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:00:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVRQ-0001Dz-Eo; Tue, 13 Aug 2019 11:58:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxVRO-0001Ah-87
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:58:14 +0000
X-Inumbo-ID: a06d5153-bdc1-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a06d5153-bdc1-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VGkjR3cF6CnqJAI046WOY0XkuI+1XI6rnairspedIyc=;
 b=Soj+AYkCNyNVQi/Sk3CaYTiCruiZJmjayX2RRoLgWuqr8aQEPBYff2at
 /8FqUhJkZrWMH+FuAJ955ZsDHlg8BRTVGilgt7rzOjmCI0i2n7ttdZ9to
 QeKSiJgr/qo3j/j+tHrabv5XeFokQERrDTA7o8DpF2DIVKrdcFpwinG/h Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BkUH713FC1WKWIjCIRIDfuw2LkvZh6Hc8YcqXXJG/BzqzDu5LdXwvpMxTVAN3IF3uWfmLcNQ99
 NCtGMu6KJnTLbgaWM9Hu2wC8TnZesH0BtI8/B13f/defJoQsgt7KiTClD08/xNPEXHpSl7bIwV
 k5kyxVexEGrXe6fdnBcoR/r02pJY9slJeF/1Y2CIp3x5q4GEUQ1qyIZLLs24/9ulo4tgXwfdhb
 l/peZl/V6s8Qybg38VZh9BzEcAJgtjbpusiNDA+b5wwkTOqFUxXXuEYtBERh8n6c6iEA+3+97H
 Ub4=
X-SBRS: 2.7
X-MesageID: 4198448
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4198448"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:31:10 +0100
Message-ID: <20190813113119.14804-27-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 26/35] OvmfPkg/XenPlatformLib: Cache result
 for XenDetected
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIHJlcGxhY2UgWGVuRGV0ZWN0ZWQoKSBpbXBsZW1lbnRhdGlvbiBpbgpQ
bGF0Zm9ybUJvb3RNYW5hZ2VyTGliIGJ5IHRoZSBvbmUgaW4gWGVuUGxhdGZvcm1MaWIuClBsYXRm
b3JtQm9vdE1hbmFnZXJMaWIncyBpbXBsZW1lbnRhdGlvbiBkb2VzIGNhY2hlIHRoZSByZXN1bHQg
b2YKR2V0Rmlyc3RHdWlkSG9iKCksIHNvIHdlIGRvIHNvbWV0aGluZyBzaW1pbGFyIGluIFhlblBs
YXRmb3JtTGliLgoKUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcu
Y2dpP2lkPTE2ODkKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29t
PgotLS0KCk5vdGVzOgogICAgdjQ6CiAgICAtIGZpeCBjb2Rpbmcgc3R5bGUKICAgIAogICAgdjM6
CiAgICAtIG5ldyBwYXRjaAoKIC4uLi9MaWJyYXJ5L1hlblBsYXRmb3JtTGliL1hlblBsYXRmb3Jt
TGliLmMgICB8IDIwICsrKysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL092bWZQa2cvTGlicmFyeS9Y
ZW5QbGF0Zm9ybUxpYi9YZW5QbGF0Zm9ybUxpYi5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1hlblBsYXRm
b3JtTGliL1hlblBsYXRmb3JtTGliLmMKaW5kZXggOTc0YTBlNzNmMS4uOGYyMGFlMmQ0NSAxMDA2
NDQKLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1hlblBsYXRmb3JtTGliL1hlblBsYXRmb3JtTGliLmMK
KysrIGIvT3ZtZlBrZy9MaWJyYXJ5L1hlblBsYXRmb3JtTGliL1hlblBsYXRmb3JtTGliLmMKQEAg
LTI1LDE0ICsyNSwyNiBAQCBYZW5HZXRJbmZvSE9CICgKICAgVk9JRA0KICAgKQ0KIHsNCi0gIEVG
SV9IT0JfR1VJRF9UWVBFICAqR3VpZEhvYjsNCisgIEVGSV9IT0JfR1VJRF9UWVBFICAgKkd1aWRI
b2I7DQorICBTVEFUSUMgQk9PTEVBTiAgICAgIENhY2hlZCA9IEZBTFNFOw0KKyAgU1RBVElDIEVG
SV9YRU5fSU5GTyAqWGVuSW5mbzsNCisNCisgIC8vDQorICAvLyBSZXR1cm4gdGhlIGNhY2hlZCBy
ZXN1bHQgZm9yIHRoZSBiZW5lZml0IG9mIFhlbkRldGVjdGVkIHRoYXQgY2FuIGJlDQorICAvLyBj
YWxsZWQgbWFueSB0aW1lcy4NCisgIC8vDQorICBpZiAoQ2FjaGVkKSB7DQorICAgIHJldHVybiBY
ZW5JbmZvOw0KKyAgfQ0KIA0KICAgR3VpZEhvYiA9IEdldEZpcnN0R3VpZEhvYiAoJmdFZmlYZW5J
bmZvR3VpZCk7DQogICBpZiAoR3VpZEhvYiA9PSBOVUxMKSB7DQotICAgIHJldHVybiBOVUxMOw0K
KyAgICBYZW5JbmZvID0gTlVMTDsNCisgIH0gZWxzZSB7DQorICAgIFhlbkluZm8gPSAoRUZJX1hF
Tl9JTkZPICopIEdFVF9HVUlEX0hPQl9EQVRBIChHdWlkSG9iKTsNCiAgIH0NCi0NCi0gIHJldHVy
biAoRUZJX1hFTl9JTkZPICopIEdFVF9HVUlEX0hPQl9EQVRBIChHdWlkSG9iKTsNCisgIENhY2hl
ZCA9IFRSVUU7DQorICByZXR1cm4gWGVuSW5mbzsNCiB9DQogDQogLyoqDQotLSAKQW50aG9ueSBQ
RVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
