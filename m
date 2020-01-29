Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530114CA92
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 13:14:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwmD8-0007ny-FD; Wed, 29 Jan 2020 12:12:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wV5r=3S=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iwmD6-0007nj-Om
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 12:12:44 +0000
X-Inumbo-ID: a4decb92-4290-11ea-a933-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4decb92-4290-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 12:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580299961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aArLmxPM9DwiBfPlhyio5NlNLz4Qkb83CFP5Dlh3g7w=;
 b=BvML12VUH/HwZidDyO03qoaOlNzQ5AQDQlkzX2kaO3YI7ZDHUKIerEHG
 YRRWs4ud3pX46Xkh21BSPiJJrGESPmfUzrmvHxpk2Xo6LrmAG68xdOTa7
 R+AMDkezf0/1J5lp6vlCj0XuBZjgauqAaU24WDfqctsonALUYBMsOlqD5 I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Eo5GR9ZukIp/K4oOrV7OAGbhC5PEFly7uPsUFJl6UzEPJrUvppafFkkayQsy6rQmPifbI+QpyW
 hkR4q/g4sSxZecFqIxKnHLnPi5KMFn5rJS8mgSlW/oJu2o4mVkpxBDGK3FCuYaEMAk55d3plZe
 492T8bkp6UVrqsqm0amR7DmB09QT99gLEeTdIh6qhC9ff14dqWooiJgmSkakbQwnvBqZeoJsAj
 OQ70He0zf19HBMrF5Mqu+Hr6BSHUz0lIwHJTMvbvv9679y09G8Cu09N7/YxqfnmKFkSpEzKQMJ
 V0A=
X-SBRS: 2.7
X-MesageID: 11606516
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,377,1574139600"; d="scan'208";a="11606516"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Wed, 29 Jan 2020 12:12:33 +0000
Message-ID: <20200129121235.1814563-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129121235.1814563-1-anthony.perard@citrix.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/5] OvmfPkg/IndustryStandard/Xen: Apply EDK2
 coding style to XEN_VCPU_TIME_INFO
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
Cc: Julien Grall <julien@xen.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, Liming
 Gao <liming.gao@intel.com>, Anthony Perard <anthony.perard@citrix.com>,
 Michael D Kinney <michael.d.kinney@intel.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIGdvaW5nIHRvIHVzZSBuZXcgZmllbGRzIGZyb20gdGhlIFhlbiBoZWFkZXJzLiBBcHBs
eSB0aGUgRURLMgpjb2Rpbmcgc3R5bGUgc28gdGhhdCB0aGUgY29kZSB0aGF0IGlzIGdvaW5nIHRv
IHVzZSBpdCBkb2Vzbid0IGxvb2sgb3V0Cm9mIHBsYWNlLgoKUmVmOiBodHRwczovL2J1Z3ppbGxh
LnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTI0OTAKU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogT3ZtZlBrZy9JbmNsdWRl
L0luZHVzdHJ5U3RhbmRhcmQvWGVuL3hlbi5oIHwgMTcgKysrKysrKysrLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
T3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL3hlbi5oIGIvT3ZtZlBrZy9JbmNs
dWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL3hlbi5oCmluZGV4IGU1NWQ5MzI2MzI4NS4uYWM5MTU1
MDg5OTAyIDEwMDY0NAotLS0gYS9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4v
eGVuLmgKKysrIGIvT3ZtZlBrZy9JbmNsdWRlL0luZHVzdHJ5U3RhbmRhcmQvWGVuL3hlbi5oCkBA
IC0xODMsMTAgKzE4MywxMCBAQCBzdHJ1Y3QgdmNwdV90aW1lX2luZm8gewogICAgICAqIFRoZSBj
b3JyZWN0IHdheSB0byBpbnRlcmFjdCB3aXRoIHRoZSB2ZXJzaW9uIG51bWJlciBpcyBzaW1pbGFy
IHRvDQogICAgICAqIExpbnV4J3Mgc2VxbG9jazogc2VlIHRoZSBpbXBsZW1lbnRhdGlvbnMgb2Yg
cmVhZF9zZXFiZWdpbi9yZWFkX3NlcXJldHJ5Lg0KICAgICAgKi8NCi0gICAgVUlOVDMyIHZlcnNp
b247DQorICAgIFVJTlQzMiBWZXJzaW9uOw0KICAgICBVSU5UMzIgcGFkMDsNCi0gICAgVUlOVDY0
IHRzY190aW1lc3RhbXA7ICAgLyogVFNDIGF0IGxhc3QgdXBkYXRlIG9mIHRpbWUgdmFscy4gICov
DQotICAgIFVJTlQ2NCBzeXN0ZW1fdGltZTsgICAgIC8qIFRpbWUsIGluIG5hbm9zZWNzLCBzaW5j
ZSBib290LiAgICAqLw0KKyAgICBVSU5UNjQgVFNDVGltZXN0YW1wOyAgIC8qIFRTQyBhdCBsYXN0
IHVwZGF0ZSBvZiB0aW1lIHZhbHMuICAqLw0KKyAgICBVSU5UNjQgU3lzdGVtVGltZTsgICAgIC8q
IFRpbWUsIGluIG5hbm9zZWNzLCBzaW5jZSBib290LiAgICAqLw0KICAgICAvKg0KICAgICAgKiBD
dXJyZW50IHN5c3RlbSB0aW1lOg0KICAgICAgKiAgIHN5c3RlbV90aW1lICsNCkBAIC0xOTQsMTEg
KzE5NCwxMSBAQCBzdHJ1Y3QgdmNwdV90aW1lX2luZm8gewogICAgICAqIENQVSBmcmVxdWVuY3kg
KEh6KToNCiAgICAgICogICAoKDEwXjkgPDwgMzIpIC8gdHNjX3RvX3N5c3RlbV9tdWwpID4+IHRz
Y19zaGlmdA0KICAgICAgKi8NCi0gICAgVUlOVDMyIHRzY190b19zeXN0ZW1fbXVsOw0KLSAgICBJ
TlQ4ICAgdHNjX3NoaWZ0Ow0KKyAgICBVSU5UMzIgVFNDVG9TeXN0ZW1NdWx0aXBsaWVyOw0KKyAg
ICBJTlQ4ICAgVFNDU2hpZnQ7DQogICAgIElOVDggICBwYWQxWzNdOw0KIH07IC8qIDMyIGJ5dGVz
ICovDQotdHlwZWRlZiBzdHJ1Y3QgdmNwdV90aW1lX2luZm8gdmNwdV90aW1lX2luZm9fdDsNCit0
eXBlZGVmIHN0cnVjdCB2Y3B1X3RpbWVfaW5mbyBYRU5fVkNQVV9USU1FX0lORk87DQogDQogc3Ry
dWN0IHZjcHVfaW5mbyB7DQogICAgIC8qDQpAQCAtMjM0LDcgKzIzNCw3IEBAIHN0cnVjdCB2Y3B1
X2luZm8gewogI2VuZGlmIC8qIFhFTl9IQVZFX1BWX1VQQ0FMTF9NQVNLICovDQogICAgIHhlbl91
bG9uZ190IGV2dGNobl9wZW5kaW5nX3NlbDsNCiAgICAgc3RydWN0IGFyY2hfdmNwdV9pbmZvIGFy
Y2g7DQotICAgIHN0cnVjdCB2Y3B1X3RpbWVfaW5mbyB0aW1lOw0KKyAgICBzdHJ1Y3QgdmNwdV90
aW1lX2luZm8gVGltZTsNCiB9OyAvKiA2NCBieXRlcyAoeDg2KSAqLw0KICNpZm5kZWYgX19YRU5f
Xw0KIHR5cGVkZWYgc3RydWN0IHZjcHVfaW5mbyB2Y3B1X2luZm9fdDsNCkBAIC0yNTAsNyArMjUw
LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgdmNwdV9pbmZvIHZjcHVfaW5mb190OwogICogb2YgdGhpcyBz
dHJ1Y3R1cmUgcmVtYWluaW5nIGNvbnN0YW50Lg0KICAqLw0KIHN0cnVjdCBzaGFyZWRfaW5mbyB7
DQotICAgIHN0cnVjdCB2Y3B1X2luZm8gdmNwdV9pbmZvW1hFTl9MRUdBQ1lfTUFYX1ZDUFVTXTsN
CisgICAgc3RydWN0IHZjcHVfaW5mbyBWY3B1SW5mb1tYRU5fTEVHQUNZX01BWF9WQ1BVU107DQog
DQogICAgIC8qDQogICAgICAqIEEgZG9tYWluIGNhbiBjcmVhdGUgImV2ZW50IGNoYW5uZWxzIiBv
biB3aGljaCBpdCBjYW4gc2VuZCBhbmQgcmVjZWl2ZQ0KQEAgLTI5OSw2ICsyOTksNyBAQCBzdHJ1
Y3Qgc2hhcmVkX2luZm8gewogfTsNCiAjaWZuZGVmIF9fWEVOX18NCiB0eXBlZGVmIHN0cnVjdCBz
aGFyZWRfaW5mbyBzaGFyZWRfaW5mb190Ow0KK3R5cGVkZWYgc3RydWN0IHNoYXJlZF9pbmZvIFhF
Tl9TSEFSRURfSU5GTzsNCiAjZW5kaWYNCiANCiAvKiBUdXJuIGEgcGxhaW4gbnVtYmVyIGludG8g
YSBDIFVJTlROIGNvbnN0YW50LiAqLw0KLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
