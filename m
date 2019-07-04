Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E405FA6E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3CD-0006oN-VY; Thu, 04 Jul 2019 14:58:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3CB-0006kf-6J
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:47 +0000
X-Inumbo-ID: 38b0febf-9e6c-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 38b0febf-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:58:45 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: G/tltgAy+zTctT9Gyaz7C/Upd5a9xKVJbugBhAUQ1ou0Jut389RqXAo5AZwj3HciKzwdP1UQ8U
 oGfJ/VorkmLT/NUgfTaaWaX+yk3BRpXVtzb3wTzYwipFBSP2BIx6/PpLGjD4xMVRiqNjt6hOlk
 cYg6O3dLcPIOrj+ZFhPZhZlK55b/CeXqpJRQ2y+EOFGW8hIPzZO1fc9L3lVLDRKIIrMWXN0P38
 /bXrp4VrJoBq3W2dCfN2JQEFEAC4kSBCNTgi2SDddnRsBKbUQ5pa/5RjocEyA8ZDPq+866I5pL
 4pw=
X-SBRS: 2.7
X-MesageID: 2623863
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2623863"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:21 +0100
Message-ID: <20190704144233.27968-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 23/35] OvmfPkg/XenPlatformPei: no hvmloader:
 get the E820 table via hypercall
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

V2hlbiB0aGUgWGVuIFBWSCBlbnRyeSBwb2ludCBoYXMgYmVlbiB1c2VkLCBodm1sb2FkZXIgaGFz
bid0IHJ1biBhbmQKaGFzbid0IHByZXBhcmVkIGFuIEU4MjAgdGFibGUuIFRoZSBvbmx5IHdheSBs
ZWZ0IHRvIGdldCBhbiBFODIwIHRhYmxlCmlzIHRvIGFzayBYZW4gdmlhIGFuIGh5cGVyY2FsbCwg
dGhlIGNhbGwgY2FuIG9ubHkgYmUgbWFkZSBvbmNlIHNvIGtlZXAKdGhlIHJlc3VsdCBjYWNoZWQg
Zm9yIGxhdGVyLgoKUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcu
Y2dpP2lkPTE2ODkKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgot
LS0KCk5vdGVzOgogICAgdjM6CiAgICAtIGZpeCBjb21taXQgbWVzc2FnZQogICAgLSBhZGQgJ20n
IHByZWZpeCB0byB0aGUgZ2xvYmFsIHZhcmlhYmxlcwogICAgICBhbmQgbWFrZSB0aGVtIHN0YXRp
YwoKIE92bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMgfCA0NiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYyBiL092
bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKaW5kZXggMTg4ZTgzMWM1Yy4uY2JmZDgwNThmYyAx
MDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5QbGF0Zm9ybVBlaS9YZW4uYworKysgYi9Pdm1mUGtnL1hl
blBsYXRmb3JtUGVpL1hlbi5jCkBAIC0yNyw2ICsyNyw3IEBACiAjaW5jbHVkZSA8TGlicmFyeS9N
dHJyTGliLmg+DQogI2luY2x1ZGUgPEluZHVzdHJ5U3RhbmRhcmQvWGVuL2FyY2gteDg2L2h2bS9z
dGFydF9pbmZvLmg+DQogI2luY2x1ZGUgPExpYnJhcnkvWGVuSHlwZXJjYWxsTGliLmg+DQorI2lu
Y2x1ZGUgPEluZHVzdHJ5U3RhbmRhcmQvWGVuL21lbW9yeS5oPg0KIA0KICNpbmNsdWRlICJQbGF0
Zm9ybS5oIg0KICNpbmNsdWRlICJYZW4uaCINCkBAIC00MCw2ICs0MSw4IEBAIEVGSV9YRU5fSU5G
TyBtWGVuSW5mbzsKIC8vIE9ubHkgdGhlIEU4MjAgdGFibGUgaXMgdXNlZCBieSBPVk1GLg0KIC8v
DQogRUZJX1hFTl9PVk1GX0lORk8gKm1YZW5Idm1sb2FkZXJJbmZvOw0KK1NUQVRJQyBFRklfRTgy
MF9FTlRSWTY0IG1FODIwRW50cmllc1sxMjhdOw0KK1NUQVRJQyBVSU5UMzIgbUU4MjBFbnRyaWVz
Q291bnQ7DQogDQogLyoqDQogICBSZXR1cm5zIEU4MjAgbWFwIHByb3ZpZGVkIGJ5IFhlbg0KQEAg
LTU1LDYgKzU4LDEyIEBAIFhlbkdldEU4MjBNYXAgKAogICBVSU5UMzIgKkNvdW50DQogICApDQog
ew0KKyAgSU5UTiBSZXR1cm5Db2RlOw0KKyAgeGVuX21lbW9yeV9tYXBfdCBQYXJhbWV0ZXJzOw0K
KyAgVUlOVE4gTG9vcEluZGV4Ow0KKyAgVUlOVE4gSW5kZXg7DQorICBFRklfRTgyMF9FTlRSWTY0
IFRtcEVudHJ5Ow0KKw0KICAgLy8NCiAgIC8vIEdldCBFODIwIHByb2R1Y2VkIGJ5IGh2bWxvYWRl
cg0KICAgLy8NCkBAIC02Niw3ICs3NSw0MiBAQCBYZW5HZXRFODIwTWFwICgKICAgICByZXR1cm4g
RUZJX1NVQ0NFU1M7DQogICB9DQogDQotICByZXR1cm4gRUZJX05PVF9GT1VORDsNCisgIC8vDQor
ICAvLyBPdGhlcndpc2UsIGdldCB0aGUgRTgyMCB0YWJsZSBmcm9tIHRoZSBYZW4gaHlwZXJ2aXNv
cg0KKyAgLy8NCisNCisgIGlmIChtRTgyMEVudHJpZXNDb3VudCA+IDApIHsNCisgICAgKkVudHJp
ZXMgPSBtRTgyMEVudHJpZXM7DQorICAgICpDb3VudCA9IG1FODIwRW50cmllc0NvdW50Ow0KKyAg
ICByZXR1cm4gRUZJX1NVQ0NFU1M7DQorICB9DQorDQorICBQYXJhbWV0ZXJzLm5yX2VudHJpZXMg
PSAxMjg7DQorICBzZXRfeGVuX2d1ZXN0X2hhbmRsZSAoUGFyYW1ldGVycy5idWZmZXIsIG1FODIw
RW50cmllcyk7DQorDQorICAvLyBSZXR1cm5zIGEgZXJybm8NCisgIFJldHVybkNvZGUgPSBYZW5I
eXBlcmNhbGxNZW1vcnlPcCAoWEVOTUVNX21lbW9yeV9tYXAsICZQYXJhbWV0ZXJzKTsNCisgIEFT
U0VSVCAoUmV0dXJuQ29kZSA9PSAwKTsNCisNCisgIG1FODIwRW50cmllc0NvdW50ID0gUGFyYW1l
dGVycy5ucl9lbnRyaWVzOw0KKw0KKyAgLy8NCisgIC8vIFNvcnQgRTgyMCBlbnRyaWVzDQorICAv
Lw0KKyAgZm9yIChMb29wSW5kZXggPSAxOyBMb29wSW5kZXggPCBtRTgyMEVudHJpZXNDb3VudDsg
TG9vcEluZGV4KyspIHsNCisgICAgZm9yIChJbmRleCA9IExvb3BJbmRleDsgSW5kZXggPCBtRTgy
MEVudHJpZXNDb3VudDsgSW5kZXgrKykgew0KKyAgICAgIGlmIChtRTgyMEVudHJpZXNbSW5kZXgg
LSAxXS5CYXNlQWRkciA+IG1FODIwRW50cmllc1tJbmRleF0uQmFzZUFkZHIpIHsNCisgICAgICAg
IFRtcEVudHJ5ID0gbUU4MjBFbnRyaWVzW0luZGV4XTsNCisgICAgICAgIG1FODIwRW50cmllc1tJ
bmRleF0gPSBtRTgyMEVudHJpZXNbSW5kZXggLSAxXTsNCisgICAgICAgIG1FODIwRW50cmllc1tJ
bmRleCAtIDFdID0gVG1wRW50cnk7DQorICAgICAgfQ0KKyAgICB9DQorICB9DQorDQorICAqQ291
bnQgPSBtRTgyMEVudHJpZXNDb3VudDsNCisgICpFbnRyaWVzID0gbUU4MjBFbnRyaWVzOw0KKw0K
KyAgcmV0dXJuIEVGSV9TVUNDRVNTOw0KIH0NCiANCiAvKioNCi0tIApBbnRob255IFBFUkFSRAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
