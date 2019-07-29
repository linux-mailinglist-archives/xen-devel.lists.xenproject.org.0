Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE58479014
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82W-00035U-6i; Mon, 29 Jul 2019 15:58:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82U-000345-KK
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:18 +0000
X-Inumbo-ID: ad925313-b219-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ad925313-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:58:17 +0000 (UTC)
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
IronPort-SDR: BZNIgitR2hz8Jve4CWcQw+g71IGTzDMyyKPEgY7/A6zzEe8w37VxKrFdZNBCkvjQeFyZYCqNaL
 sAZzhgTlzmXHVu+I3IjESrqS4Kk/Ly33+p18zU9FFZP/shosG5x+fnSZO7VtYQpeMCuUTeK3Yf
 LLacKGqD11sk7OQUQGI6yg4RwBNjkFZ+qHup7uJ9rlEtc6qQArh354J+8tv8OnbTboWUAOBSFp
 0Rn6T6kYW42SIQtJpFN/eJczMWKINc5C1eTaPgO8RAn85u3X7pHnsNowf0QeXxUfUtuz+P3lT0
 Y08=
X-SBRS: 2.7
X-MesageID: 3565747
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3565747"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:29 +0100
Message-ID: <20190729153944.24239-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 20/35] OvmfPkg/XenPlatformPei: Introduce
 XenPvhDetected
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

WGVuUHZoRGV0ZWN0ZWQoKSBjYW4gYmUgdXNlZCB0byBmaWd1cmUgb3V0IGlmIE9WTUYgaGFzIHN0
YXJ0ZWQgdmlhIHRoZQpYZW4gUFZIIGVudHJ5IHBvaW50LgoKUmVmOiBodHRwczovL2J1Z3ppbGxh
LnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBMYXN6bG8gRXJz
ZWsgPGxlcnNla0ByZWRoYXQuY29tPgotLS0KIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvUGxhdGZv
cm0uaCB8ICA1ICsrKysrCiBPdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jICAgICAgfCAxMyAr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1BsYXRmb3JtLmggYi9Pdm1mUGtnL1hlblBsYXRm
b3JtUGVpL1BsYXRmb3JtLmgKaW5kZXggNGE4MDA1N2JkYy4uZGI5YTYyNTcyZiAxMDA2NDQKLS0t
IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9QbGF0Zm9ybS5oCisrKyBiL092bWZQa2cvWGVuUGxh
dGZvcm1QZWkvUGxhdGZvcm0uaApAQCAtOTksNiArOTksMTEgQEAgWGVuSHZtbG9hZGVyRGV0ZWN0
ZWQgKAogICBWT0lEDQogICApOw0KIA0KK0JPT0xFQU4NCitYZW5QdmhEZXRlY3RlZCAoDQorICBW
T0lEDQorICApOw0KKw0KIFZPSUQNCiBBbWRTZXZJbml0aWFsaXplICgNCiAgIFZPSUQNCmRpZmYg
LS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jIGIvT3ZtZlBrZy9YZW5QbGF0Zm9y
bVBlaS9YZW4uYwppbmRleCAyOWI0MmI3NDZjLi43MWZlNWRlNDQ2IDEwMDY0NAotLS0gYS9Pdm1m
UGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCisrKyBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVu
LmMKQEAgLTIxNCw2ICsyMTQsMTkgQEAgWGVuSHZtbG9hZGVyRGV0ZWN0ZWQgKAogICByZXR1cm4g
KG1YZW5Idm1sb2FkZXJJbmZvICE9IE5VTEwpOw0KIH0NCiANCitCT09MRUFODQorWGVuUHZoRGV0
ZWN0ZWQgKA0KKyAgVk9JRA0KKyAgKQ0KK3sNCisgIC8vDQorICAvLyBUaGlzIGZ1bmN0aW9uIHNo
b3VsZCBvbmx5IGJlIHVzZWQgYWZ0ZXIgWGVuQ29ubmVjdA0KKyAgLy8NCisgIEFTU0VSVCAobVhl
bkluZm8uVmVyc2lvbk1ham9yICE9IDApOw0KKw0KKyAgcmV0dXJuIG1YZW5Idm1sb2FkZXJJbmZv
ID09IE5VTEw7DQorfQ0KKw0KIFZPSUQNCiBYZW5QdWJsaXNoUmFtUmVnaW9ucyAoDQogICBWT0lE
DQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
