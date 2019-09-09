Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21491ADA6A
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 15:50:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7K0Z-0005EV-SX; Mon, 09 Sep 2019 13:47:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLmJ=XE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7K0Y-0005EQ-Ce
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 13:47:06 +0000
X-Inumbo-ID: 4ead8f4e-d308-11e9-ac0b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ead8f4e-d308-11e9-ac0b-12813bfff9fa;
 Mon, 09 Sep 2019 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568036824;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZZPKatzjvpvJM+0BL9Uaj4EmUnjuDNrA24QUh/u9/e4=;
 b=CDoib4VSdUtRxhk2Ar1KXGTAMPEj+lWajJ5IleagIKZrH+D4FJV2A4qJ
 3wHu2LYxiuaF0n8KA7b7Dvwz61CvAQQfNi3IovRv6kW9OIVY3JDCzEgvZ
 MsbASBYo7om9wIedPxXLm5o/DKyTEVTO/exS6PqRZVi9vXYuDj8jFth/p Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4/6G4BvnTzAUYC3OgHn1xQNBJZCdD+5Bsl7apCJm+C+boaSt1X8wwDuRJUODfowcQF7IQlIaVZ
 T3q2KF0fH4uR/+tV1oFwOGaYfUAiq5COGTslMcrG9F9I0ppnQruuXiM0/s0x7WKiqdr9LGogYu
 Q3CAv0vSEk0m+u6NW60Rwko+3ta7l+KF6Iq1FxJ9EEh2ajkpbWo+n3+6vmKvL86IvewHDDmPVD
 9mUcml1UQWNgRrwNvQYt61woJiiw6sOyTfcIVCIHLJfrymhy5LnP7elcPCdSc94Y3M+PbNJwfo
 +MI=
X-SBRS: 2.7
X-MesageID: 5504432
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5504432"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 9 Sep 2019 14:47:01 +0100
Message-ID: <20190909134701.12477-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190906143021.28261-3-roger.pau@citrix.com>
References: <20190906143021.28261-3-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] fixup sysctl/libxl: choose a sane default for
 HAP
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Rob Hoes <Rob.Hoes@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBkZWx0YSB3YW50cyBmb2xkaW5nIHRvIGtlZXAgdGhlIE9jYW1sIHN0dWJzIGluIGxpbmUu
CgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PgotLS0KQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPgpDQzogV2VpIExp
dSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
PgpDQzogQ2hyaXN0aWFuIExpbmRpZyA8Y2hyaXN0aWFuLmxpbmRpZ0BjaXRyaXguY29tPgpDQzog
Um9iIEhvZXMgPFJvYi5Ib2VzQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvb2NhbWwvbGlicy94Yy94
ZW5jdHJsLm1sICAgICAgfCAxICsKIHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgICAg
IHwgMSArCiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYyB8IDMgKystCiB4ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggICAgICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1s
L2xpYnMveGMveGVuY3RybC5tbCBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbAppbmRl
eCBjZDdlOTVhNmZhLi41ZGE3Yzk2Y2VlIDEwMDY0NAotLS0gYS90b29scy9vY2FtbC9saWJzL3hj
L3hlbmN0cmwubWwKKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sCkBAIC0xMDEs
NiArMTAxLDcgQEAgdHlwZSBwaHlzaW5mb19jYXBfZmxhZyA9CiAJfCBDQVBfSFZNCiAJfCBDQVBf
UFYKIAl8IENBUF9EaXJlY3RJTworCXwgQ0FQX0hBUAogCiB0eXBlIHBoeXNpbmZvID0KIHsKZGlm
ZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgYi90b29scy9vY2FtbC9s
aWJzL3hjL3hlbmN0cmwubWxpCmluZGV4IDBiZDA2ZWQ5MjAuLmI0ZTc2YjgyN2UgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkKKysrIGIvdG9vbHMvb2NhbWwvbGli
cy94Yy94ZW5jdHJsLm1saQpAQCAtODYsNiArODYsNyBAQCB0eXBlIHBoeXNpbmZvX2NhcF9mbGFn
ID0KICAgfCBDQVBfSFZNCiAgIHwgQ0FQX1BWCiAgIHwgQ0FQX0RpcmVjdElPCisgIHwgQ0FQX0hB
UAogdHlwZSBwaHlzaW5mbyA9IHsKICAgdGhyZWFkc19wZXJfY29yZSA6IGludDsKICAgY29yZXNf
cGVyX3NvY2tldCA6IGludDsKZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3Ry
bF9zdHVicy5jIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMKaW5kZXggY2U4
ZGJiYTQzNy4uMTBiMzA2ZjlmOCAxMDA2NDQKLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5j
dHJsX3N0dWJzLmMKKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMKQEAg
LTY5MCw3ICs2OTAsOCBAQCBDQU1McHJpbSB2YWx1ZSBzdHViX3hjX3BoeXNpbmZvKHZhbHVlIHhj
aCkKIAlCVUlMRF9CVUdfT04oWEVOX1NZU0NUTF9QSFlTQ0FQX2h2bSAgICAgICE9ICgxdSA8PCAg
MCkpOwogCUJVSUxEX0JVR19PTihYRU5fU1lTQ1RMX1BIWVNDQVBfcHYgICAgICAgIT0gKDF1IDw8
ICAxKSk7CiAJQlVJTERfQlVHX09OKFhFTl9TWVNDVExfUEhZU0NBUF9kaXJlY3RpbyAhPSAoMXUg
PDwgIDIpKTsKLQlCVUlMRF9CVUdfT04oWEVOX1NZU0NUTF9QSFlTQ0FQX01BWCAgICAgICE9IFhF
Tl9TWVNDVExfUEhZU0NBUF9kaXJlY3Rpbyk7CisJQlVJTERfQlVHX09OKFhFTl9TWVNDVExfUEhZ
U0NBUF9oYXAgICAgICAhPSAoMXUgPDwgIDMpKTsKKwlCVUlMRF9CVUdfT04oWEVOX1NZU0NUTF9Q
SFlTQ0FQX01BWCAgICAgICE9IFhFTl9TWVNDVExfUEhZU0NBUF9oYXApOwogCWNhcF9saXN0ID0g
Y19iaXRtYXBfdG9fb2NhbWxfbGlzdChjX3BoeXNpbmZvLmNhcGFiaWxpdGllcyk7CiAKIAlwaHlz
aW5mbyA9IGNhbWxfYWxsb2NfdHVwbGUoMTApOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVi
bGljL3N5c2N0bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCmluZGV4IGMzMjVhZTQ5
NmMuLmQ0YjQ1NTYxOWMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAor
KysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKQEAgLTk1LDcgKzk1LDcgQEAgc3RydWN0
IHhlbl9zeXNjdGxfdGJ1Zl9vcCB7CiAjZGVmaW5lIFhFTl9TWVNDVExfUEhZU0NBUF9oYXAgICAg
ICAgICAgICgxdTw8X1hFTl9TWVNDVExfUEhZU0NBUF9oYXApCiAKIC8qIE1heCBYRU5fU1lTQ1RM
X1BIWVNDQVBfKiBjb25zdGFudC4gIFVzZWQgZm9yIEFCSSBjaGVja2luZy4gKi8KLSNkZWZpbmUg
WEVOX1NZU0NUTF9QSFlTQ0FQX01BWCBYRU5fU1lTQ1RMX1BIWVNDQVBfZGlyZWN0aW8KKyNkZWZp
bmUgWEVOX1NZU0NUTF9QSFlTQ0FQX01BWCBYRU5fU1lTQ1RMX1BIWVNDQVBfaGFwCiAKIHN0cnVj
dCB4ZW5fc3lzY3RsX3BoeXNpbmZvIHsKICAgICB1aW50MzJfdCB0aHJlYWRzX3Blcl9jb3JlOwot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
