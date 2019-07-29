Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 892BF79018
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:00:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82E-0002l0-38; Mon, 29 Jul 2019 15:58:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82C-0002jc-4f
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:00 +0000
X-Inumbo-ID: a2f77dc7-b219-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a2f77dc7-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:57:59 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zQk+uCIOehgvFDdxdrjGeN4hLn5ctXZzgqSkOdFkHEmNCY5rTWFuo7pt2O6NHTc+5mPhfs2OLD
 1tkJae9S8ZHij8AmrmMhUapTBWWcZn+Bv/hor73GuObCvjywyCgSvlCda/SHmZcr0GBs0YbxOE
 icavMSTHzSR4OKanf4NZ/3s9wVURCBdbsxYLxZBLApzjMaT52zbFHds1EH0wNgUF6ynq0mcupO
 wE3Z8dj3P4go3EvlTZtLSv9R9+qw0FYfj7xqw82qbFmiRfT8h4oXBPRnDHUMZWH3sjxJChJOk8
 iYQ=
X-SBRS: 2.7
X-MesageID: 3689428
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3689428"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:43 +0100
Message-ID: <20190729153944.24239-35-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 34/35] OvmfPkg: Move XenRealTimeClockLib from
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
Tm90ZXM6CiAgICB2NDoKICAgIC0gVXBkYXRlIE1haW50YWluZXJzLnR4dAogICAgCiAgICB2MzoK
ICAgIC0gZml4IHRoZSBjb21taXQgbWVzc2FnZSBib2R5CgogQXJtVmlydFBrZy9Bcm1WaXJ0WGVu
LmRzYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL0xp
YnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmluZiAgICAgICAg
IHwgMAogLi4uL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGli
LmMgICAgICAgICAgIHwgMAogTWFpbnRhaW5lcnMudHh0ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUge0FybVZpcnRQa2cgPT4gT3ZtZlBrZ30v
TGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuaW5mICgxMDAl
KQogcmVuYW1lIHtBcm1WaXJ0UGtnID0+IE92bWZQa2d9L0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9j
a0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmMgKDEwMCUpCgpkaWZmIC0tZ2l0IGEvQXJtVmlydFBr
Zy9Bcm1WaXJ0WGVuLmRzYyBiL0FybVZpcnRQa2cvQXJtVmlydFhlbi5kc2MKaW5kZXggNzkzMDRl
ZTYxZC4uMWI0MmE5YTgxMyAxMDA2NDQKLS0tIGEvQXJtVmlydFBrZy9Bcm1WaXJ0WGVuLmRzYwor
KysgYi9Bcm1WaXJ0UGtnL0FybVZpcnRYZW4uZHNjCkBAIC0yNyw3ICsyNyw3IEBAIFtEZWZpbmVz
XQogDQogW0xpYnJhcnlDbGFzc2VzXQ0KICAgU2VyaWFsUG9ydExpYnxPdm1mUGtnL0xpYnJhcnkv
WGVuQ29uc29sZVNlcmlhbFBvcnRMaWIvWGVuQ29uc29sZVNlcmlhbFBvcnRMaWIuaW5mDQotICBS
ZWFsVGltZUNsb2NrTGlifEFybVZpcnRQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hl
blJlYWxUaW1lQ2xvY2tMaWIuaW5mDQorICBSZWFsVGltZUNsb2NrTGlifE92bWZQa2cvTGlicmFy
eS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuaW5mDQogICBYZW5IeXBl
cmNhbGxMaWJ8T3ZtZlBrZy9MaWJyYXJ5L1hlbkh5cGVyY2FsbExpYi9YZW5IeXBlcmNhbGxMaWIu
aW5mDQogDQogICBBcm1HZW5lcmljVGltZXJDb3VudGVyTGlifEFybVZpcnRQa2cvTGlicmFyeS9Y
ZW5Bcm1HZW5lcmljVGltZXJWaXJ0Q291bnRlckxpYi9YZW5Bcm1HZW5lcmljVGltZXJWaXJ0Q291
bnRlckxpYi5pbmYNCmRpZmYgLS1naXQgYS9Bcm1WaXJ0UGtnL0xpYnJhcnkvWGVuUmVhbFRpbWVD
bG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmluZiBiL092bWZQa2cvTGlicmFyeS9YZW5SZWFs
VGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuaW5mCnNpbWlsYXJpdHkgaW5kZXggMTAw
JQpyZW5hbWUgZnJvbSBBcm1WaXJ0UGtnL0xpYnJhcnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5S
ZWFsVGltZUNsb2NrTGliLmluZgpyZW5hbWUgdG8gT3ZtZlBrZy9MaWJyYXJ5L1hlblJlYWxUaW1l
Q2xvY2tMaWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5pbmYKZGlmZiAtLWdpdCBhL0FybVZpcnRQa2cv
TGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuYyBiL092bWZQ
a2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliL1hlblJlYWxUaW1lQ2xvY2tMaWIuYwpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gQXJtVmlydFBrZy9MaWJyYXJ5L1hlblJlYWxU
aW1lQ2xvY2tMaWIvWGVuUmVhbFRpbWVDbG9ja0xpYi5jCnJlbmFtZSB0byBPdm1mUGtnL0xpYnJh
cnkvWGVuUmVhbFRpbWVDbG9ja0xpYi9YZW5SZWFsVGltZUNsb2NrTGliLmMKZGlmZiAtLWdpdCBh
L01haW50YWluZXJzLnR4dCBiL01haW50YWluZXJzLnR4dAppbmRleCA3OWRlZmQxM2JmLi45MTli
YWNjYzU2IDEwMDY0NAotLS0gYS9NYWludGFpbmVycy50eHQKKysrIGIvTWFpbnRhaW5lcnMudHh0
CkBAIC0xMTQsNyArMTE0LDYgQEAgUjogTGVpZiBMaW5kaG9sbSA8bGVpZi5saW5kaG9sbUBsaW5h
cm8ub3JnPgogQXJtVmlydFBrZzogbW9kdWxlcyB1c2VkIG9uIFhlbg0KIEY6IEFybVZpcnRQa2cv
QXJtVmlydFhlbi4qDQogRjogQXJtVmlydFBrZy9MaWJyYXJ5L1hlbkFybUdlbmVyaWNUaW1lclZp
cnRDb3VudGVyTGliLw0KLUY6IEFybVZpcnRQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGli
Lw0KIEY6IEFybVZpcnRQa2cvTGlicmFyeS9YZW5WaXJ0TWVtSW5mb0xpYi8NCiBGOiBBcm1WaXJ0
UGtnL1ByZVBpLw0KIEY6IEFybVZpcnRQa2cvWGVuQWNwaVBsYXRmb3JtRHhlLw0KQEAgLTM3NCw2
ICszNzMsNyBAQCBGOiBPdm1mUGtnL0xpYnJhcnkvWGVuQ29uc29sZVNlcmlhbFBvcnRMaWIvCiBG
OiBPdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliLw0KIEY6IE92bWZQa2cvTGlicmFyeS9Y
ZW5Jb01taW9MaWIvDQogRjogT3ZtZlBrZy9MaWJyYXJ5L1hlblBsYXRmb3JtTGliLw0KK0Y6IE92
bWZQa2cvTGlicmFyeS9YZW5SZWFsVGltZUNsb2NrTGliLw0KIEY6IE92bWZQa2cvT3ZtZlhlbi4q
DQogRjogT3ZtZlBrZy9Pdm1mWGVuRWxmSGVhZGVyR2VuZXJhdG9yLmMNCiBGOiBPdm1mUGtnL1Bs
YXRmb3JtUGVpL01lbURldGVjdC5jDQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
