Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5188A5FA6F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3BO-0005sz-GJ; Thu, 04 Jul 2019 14:57:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3BN-0005s5-LU
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:57:57 +0000
X-Inumbo-ID: 1b580ac4-9e6c-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1b580ac4-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:57:56 +0000 (UTC)
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
IronPort-SDR: zftlYgdAdLBWyNt2PfWbkPvrKDZ16hN15fEeF52Wkf9B4SR3vRyi1aWXzt+PSC39DnEF0oEFy1
 ild2AN73SBA5QahkwCtJCgJPJFOhdlksAfY1r9wWisOhjT5jGKqRJWoHBGEtxv2cGVdI3sjApj
 GcIg3lyNR+7tabPayXoDJRhYjepFQf+Ib9T5jP7L+wtD+frHsRzFRDROrUOptSifVV8mlVQ5oq
 4XfdHELxsDYIA/IFZDV6Iddx2dQMbtZEhzkpzaQvawfVN2geVS9bveKQtFXEUMpS7fjVtk9jdW
 +lU=
X-SBRS: 2.7
X-MesageID: 2617756
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2617756"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:32 +0100
Message-ID: <20190704144233.27968-35-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 34/35] OvmfPkg: Move XenRealTimeClockLib from
 ArmVirtPkg
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

TW92ZSBYZW5SZWFsVGltZUNsb2NrTGliIGZyb20gQXJtVmlydFBrZyB0byBPdm1mUGtnIHNvIGl0
IGNhbiBiZSB1c2VkCmZyb20gdGhlIE92bWZQa2cgYnkgdGhlIGZvbGxvd2luZyBwYXRjaCwgIk92
bWZQa2cvT3ZtZlhlbjogdXNlClJlYWxUaW1lQ2xvY2tSdW50aW1lRHhlIGZyb20gRW1iZWRkZWRQ
a2ciCgpSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9
MTY4OQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KUmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQoK
Tm90ZXM6CiAgICB2MzoKICAgIC0gZml4IHRoZSBjb21taXQgbWVzc2FnZSBib2R5CgogQXJtVmly
dFBrZy9Bcm1WaXJ0WGVuLmRzYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArLQogLi4uL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2Nr
TGliLmluZiAgICAgICAgIHwgMAogLi4uL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5S
ZWFsVGltZUNsb2NrTGliLmMgICAgICAgICAgIHwgMAogMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIHtBcm1WaXJ0UGtnID0+IE92bWZQa2d9L0xp
YnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmluZiAoMTAwJSkK
IHJlbmFtZSB7QXJtVmlydFBrZyA9PiBPdm1mUGtnfS9MaWJyYXJ5L1hlblJlYWxUaW1lQ2xvY2tM
aWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5jICgxMDAlKQoKZGlmZiAtLWdpdCBhL0FybVZpcnRQa2cv
QXJtVmlydFhlbi5kc2MgYi9Bcm1WaXJ0UGtnL0FybVZpcnRYZW4uZHNjCmluZGV4IDc5MzA0ZWU2
MWQuLjFiNDJhOWE4MTMgMTAwNjQ0Ci0tLSBhL0FybVZpcnRQa2cvQXJtVmlydFhlbi5kc2MKKysr
IGIvQXJtVmlydFBrZy9Bcm1WaXJ0WGVuLmRzYwpAQCAtMjcsNyArMjcsNyBAQCBbRGVmaW5lc10K
IA0KIFtMaWJyYXJ5Q2xhc3Nlc10NCiAgIFNlcmlhbFBvcnRMaWJ8T3ZtZlBrZy9MaWJyYXJ5L1hl
bkNvbnNvbGVTZXJpYWxQb3J0TGliL1hlbkNvbnNvbGVTZXJpYWxQb3J0TGliLmluZg0KLSAgUmVh
bFRpbWVDbG9ja0xpYnxBcm1WaXJ0UGtnL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5S
ZWFsVGltZUNsb2NrTGliLmluZg0KKyAgUmVhbFRpbWVDbG9ja0xpYnxPdm1mUGtnL0xpYnJhcnkv
WGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmluZg0KICAgWGVuSHlwZXJj
YWxsTGlifE92bWZQa2cvTGlicmFyeS9YZW5IeXBlcmNhbGxMaWIvWGVuSHlwZXJjYWxsTGliLmlu
Zg0KIA0KICAgQXJtR2VuZXJpY1RpbWVyQ291bnRlckxpYnxBcm1WaXJ0UGtnL0xpYnJhcnkvWGVu
QXJtR2VuZXJpY1RpbWVyVmlydENvdW50ZXJMaWIvWGVuQXJtR2VuZXJpY1RpbWVyVmlydENvdW50
ZXJMaWIuaW5mDQpkaWZmIC0tZ2l0IGEvQXJtVmlydFBrZy9MaWJyYXJ5L1hlblJlYWxUaW1lQ2xv
Y2tMaWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5pbmYgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuUmVhbFRp
bWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmluZgpzaW1pbGFyaXR5IGluZGV4IDEwMCUK
cmVuYW1lIGZyb20gQXJtVmlydFBrZy9MaWJyYXJ5L1hlblJlYWxUaW1lQ2xvY2tMaWIvWGVuUmVh
bFRpbWVDbG9ja0xpYi5pbmYKcmVuYW1lIHRvIE92bWZQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNs
b2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuaW5mCmRpZmYgLS1naXQgYS9Bcm1WaXJ0UGtnL0xp
YnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmMgYi9Pdm1mUGtn
L0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmMKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIEFybVZpcnRQa2cvTGlicmFyeS9YZW5SZWFsVGlt
ZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuYwpyZW5hbWUgdG8gT3ZtZlBrZy9MaWJyYXJ5
L1hlblJlYWxUaW1lQ2xvY2tMaWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5jCi0tIApBbnRob255IFBF
UkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
