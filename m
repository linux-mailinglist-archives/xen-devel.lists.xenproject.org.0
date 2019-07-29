Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D87F7901B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:00:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82G-0002nx-UT; Mon, 29 Jul 2019 15:58:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82E-0002lp-Il
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:02 +0000
X-Inumbo-ID: a252f518-b219-11e9-b1d6-736346dd0b99
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a252f518-b219-11e9-b1d6-736346dd0b99;
 Mon, 29 Jul 2019 15:57:58 +0000 (UTC)
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
IronPort-SDR: qOLaOccMLeUGVLrWJN7yBtgvKMzEWibyeYo5hBCJGKuRoULz0YH9BXyxD+Nd7Zdp+E9Y+wCbLY
 FmEk1XX5pwAlwWGlF2v5TpM0hY1ZA07MPwHY5/k1tqFSiEc2h55+EzDOEanhjwBKZG8DM0NF5O
 lbF8hxdCoqee4mYKOTP15MPbKJ/X4N78vTDBu49qt7OTkINIVXGm2lXeep8+UcZZTVxNBXEFNs
 E6jNHdqqof5bGqQiZtw8ExO4uxpIhcOvDoXzyVS91fOQtocnp6QDXEslzJV6lo8XeJ+pPA+AJr
 zXc=
X-SBRS: 2.7
X-MesageID: 3607265
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3607265"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:24 +0100
Message-ID: <20190729153944.24239-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 15/35] OvmfPkg/AcpiPlatformDxe: Use Xen PVH
 RSDP if it exist
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

SWYgdGhlIGZpcm13YXJlIGhhdmUgYmVlbiBzdGFydGVkIHZpYSB0aGUgWGVuIFBWSCBlbnRyeSBw
b2ludCwgYSBSU0RQCnBvaW50ZXIgd291bGQgaGF2ZSBiZWVuIHByb3ZpZGVkLiBVc2UgaXQuCgpS
ZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQpT
aWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4K
UmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQoKTm90ZXM6
CiAgICB2NDoKICAgIC0gZml4IGNvZGluZyBzdHlsZQogICAgCiAgICB2MzoKICAgIC0gcGF0Y2gg
c3BsaXRlZCBmcm9tIHRoZSBwcmV2aW91cyBvbmUKICAgIC0gRml4IERFQlVHIGZvcm1hdCBzdHJp
bmcsIHVzZSAlcCBmb3IgcG9pbnRlcnMuCiAgICAgIGFuZCB1c2UgZ0VmaUNhbGxlckJhc2VOYW1l
IHRvIHByaW50IG1vZHVsZSBuYW1lCgogT3ZtZlBrZy9BY3BpUGxhdGZvcm1EeGUvWGVuLmMgfCAx
NyArKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9Pdm1mUGtnL0FjcGlQbGF0Zm9ybUR4ZS9YZW4uYyBiL092bWZQa2cvQWNwaVBs
YXRmb3JtRHhlL1hlbi5jCmluZGV4IDgyNzk0YjkzM2UuLmY4MGRmZTFhNTcgMTAwNjQ0Ci0tLSBh
L092bWZQa2cvQWNwaVBsYXRmb3JtRHhlL1hlbi5jCisrKyBiL092bWZQa2cvQWNwaVBsYXRmb3Jt
RHhlL1hlbi5jCkBAIC0zNiwxMCArMzYsMjcgQEAgR2V0WGVuQWNwaVJzZHAgKAogICBFRklfQUNQ
SV8yXzBfUk9PVF9TWVNURU1fREVTQ1JJUFRJT05fUE9JTlRFUiAgICpSc2RwU3RydWN0dXJlUHRy
Ow0KICAgVUlOVDggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqWGVu
QWNwaVB0cjsNCiAgIFVJTlQ4ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgU3VtOw0KKyAgRUZJX1hFTl9JTkZPICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAqWGVuSW5mbzsNCiANCiAgIC8vDQogICAvLyBEZXRlY3QgdGhlIFJTRFAgc3RydWN0dXJlDQog
ICAvLw0KKw0KKyAgLy8NCisgIC8vIEZpcnN0IGxvb2sgZm9yIFBWSCBvbmUNCisgIC8vDQorICBY
ZW5JbmZvID0gWGVuR2V0SW5mb0hPQiAoKTsNCisgIEFTU0VSVCAoWGVuSW5mbyAhPSBOVUxMKTsN
CisgIGlmIChYZW5JbmZvLT5Sc2RwUHZoICE9IE5VTEwpIHsNCisgICAgREVCVUcgKChERUJVR19J
TkZPLCAiJWE6IFVzZSBBQ1BJIFJTRFAgdGFibGUgYXQgMHglcFxuIiwNCisgICAgICBnRWZpQ2Fs
bGVyQmFzZU5hbWUsIFhlbkluZm8tPlJzZHBQdmgpKTsNCisgICAgKlJzZHBQdHIgPSBYZW5JbmZv
LT5Sc2RwUHZoOw0KKyAgICByZXR1cm4gRUZJX1NVQ0NFU1M7DQorICB9DQorDQorICAvLw0KKyAg
Ly8gT3RoZXJ3aXNlLCBsb29rIGZvciB0aGUgSFZNIG9uZQ0KKyAgLy8NCiAgIGZvciAoWGVuQWNw
aVB0ciA9IChVSU5UOCopKFVJTlROKSBYRU5fQUNQSV9QSFlTSUNBTF9BRERSRVNTOw0KICAgICAg
ICBYZW5BY3BpUHRyIDwgKFVJTlQ4KikoVUlOVE4pIFhFTl9CSU9TX1BIWVNJQ0FMX0VORDsNCiAg
ICAgICAgWGVuQWNwaVB0ciArPSAweDEwKSB7DQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
