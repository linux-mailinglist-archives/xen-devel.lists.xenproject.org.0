Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A56CE5FA6C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3Bv-0006Pa-Nu; Thu, 04 Jul 2019 14:58:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3Bt-0006NE-9J
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:29 +0000
X-Inumbo-ID: 2e076719-9e6c-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2e076719-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:58:27 +0000 (UTC)
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
IronPort-SDR: CX2wCejDg7Ql7Rtt78ssxEVb5MMTqCp+ARwyB+sRhTKW2At5Nknw+yGwVOqnZqpFfvgvaac0nw
 bNajFz59gbI0rAILIT4URtana9z29z8mniDqPrO/W5saAzPaIWE37/A/Sr6G6kzVDf4sr5iOvB
 12XePkY47zOX4g419DyTTE/9ZRHpGT1cNANOp7qSNTlBt5dWY/orYAGO5LZ47s5QgJIOEvgfA3
 59fz9yg5tSw2NpiHw2pwdw4qA2+s1f3eKsEQcPhQyj4X7OkzvDS4ej7i0A5EuZ+KuTsfo4gKKk
 HxI=
X-SBRS: 2.7
X-MesageID: 2623846
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2623846"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:25 +0100
Message-ID: <20190704144233.27968-28-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 27/35] OvmfPkg/XenPlatformLib: Cache result
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
QGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoKICAgIC0gbmV3IHBhdGNoCgogLi4uL0xp
YnJhcnkvWGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIuYyAgICB8IDE4ICsrKysrKysrKysr
KysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9MaWJyYXJ5L1hlblBsYXRmb3JtTGliL1hlblBsYXRmb3Jt
TGliLmMgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIuYwpp
bmRleCA2ZjI3Y2JmZmE4Li5iNTI1N2IwYzk3IDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJhcnkv
WGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIuYworKysgYi9Pdm1mUGtnL0xpYnJhcnkvWGVu
UGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIuYwpAQCAtMjYsMTMgKzI2LDI1IEBAIFhlbkdldElu
Zm9IT0IgKAogICApDQogew0KICAgRUZJX0hPQl9HVUlEX1RZUEUgICpHdWlkSG9iOw0KKyAgU1RB
VElDIEJPT0xFQU4gICAgIENhY2hlZCA9IEZBTFNFOw0KKyAgU1RBVElDIEVGSV9YRU5fSU5GTyAq
WGVuSW5mbzsNCisNCisgIC8vDQorICAvLyBSZXR1cm4gdGhlIGNhY2hlZCByZXN1bHQgZm9yIHRo
ZSBiZW5lZml0IG9mIFhlbkRldGVjdGVkIHRoYXQgY2FuIGJlDQorICAvLyBjYWxsZWQgbWFueSB0
aW1lcy4NCisgIC8vDQorICBpZiAoQ2FjaGVkKSB7DQorICAgIHJldHVybiBYZW5JbmZvOw0KKyAg
fQ0KIA0KICAgR3VpZEhvYiA9IEdldEZpcnN0R3VpZEhvYiAoJmdFZmlYZW5JbmZvR3VpZCk7DQog
ICBpZiAoR3VpZEhvYiA9PSBOVUxMKSB7DQotICAgIHJldHVybiBOVUxMOw0KKyAgICBYZW5JbmZv
ID0gTlVMTDsNCisgIH0gZWxzZSB7DQorICAgIFhlbkluZm8gPSAoRUZJX1hFTl9JTkZPICopIEdF
VF9HVUlEX0hPQl9EQVRBIChHdWlkSG9iKTsNCiAgIH0NCi0NCi0gIHJldHVybiAoRUZJX1hFTl9J
TkZPICopIEdFVF9HVUlEX0hPQl9EQVRBIChHdWlkSG9iKTsNCisgIENhY2hlZCA9IFRSVUU7DQor
ICByZXR1cm4gWGVuSW5mbzsNCiB9DQogDQogLyoqDQotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
