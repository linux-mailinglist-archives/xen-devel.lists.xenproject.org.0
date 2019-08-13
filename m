Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5A58B7BF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 14:00:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxVQw-0000qt-5j; Tue, 13 Aug 2019 11:57:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxVQv-0000qk-Ak
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:57:45 +0000
X-Inumbo-ID: 8ef91322-bdc1-11e9-bc13-972756575514
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ef91322-bdc1-11e9-bc13-972756575514;
 Tue, 13 Aug 2019 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565697464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BSJ21glTJz1A3HSQVh/qOJBp3tt10Nx6ZSgEtYzhl9c=;
 b=Zvg6oJ82nd4WNVJ874LehjMLy0AqnICC8EecDRm6jsnv2LhW2G1ncNEq
 3yseyMKjUY4wq3FYHHswVtC9tHgN+5jGYClIC5zENMk5fO1TDpXLUXvnb
 pfqvfSHyLRO3/+PeCAeNpu2hopyhPC1hLIMGdTpBt8bCHDSlXsOztK0GG Q=;
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
IronPort-SDR: XJ7aHeML77RlHXWSMObqCWwI21TLVYaeVeX/tyh3auEIF4cvE9eqE6rxJjEiGRGclgIAHWMmOr
 EgajjgLc15PF+VyCeQBU8wGyZ2OkjDN3uv2JBz+tqjD42W537YcOQE/kslTi1HpuktSHmplJoz
 SYgh5Gw+A/7vFcx04qdNMIW1+EdkTS7PxMT/7EnpNNfj8PToidBZQFjDiKg6MsLQoCLc2FgbPY
 fpL63a0TXJX1+2MK+8Ttup6jrusD57OL0j1fMlyWyQEw4yTV4dBx1837Tk9wlPlljPPgD/1EQg
 M6A=
X-SBRS: 2.7
X-MesageID: 4374816
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4374816"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:31:11 +0100
Message-ID: <20190813113119.14804-28-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 27/35] OvmfPkg/PlatformBootManagerLib: Use
 XenDetected from XenPlatformLib
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

UmVwbGFjZSB0aGUgWGVuRGV0ZWN0ZWQoKSBpbXBsZW1lbnRhdGlvbiBieSB0aGUgb25lIGZyb20K
WGVuUGxhdGZvcm1MaWIuCgpSZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93
X2J1Zy5jZ2k/aWQ9MTY4OQpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhh
dC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2NDoKICAgIC0gcmVtb3ZlZCBnRWZpWGVuSW5mb0d1aWQg
ZnJvbSBHdWlkcyBsaXN0IGFuZCB0aGUgYXNzb2NpYXRlZCBpbmNsdWRlIG9mCiAgICAgIEd1aWQv
WGVuSW5mby5oCiAgICAKICAgIHYzOgogICAgLSBuZXcgcGF0Y2gKCiAuLi4vUGxhdGZvcm1Cb290
TWFuYWdlckxpYi5pbmYgICAgICAgICAgICAgICAgfCAgMiArLQogLi4uL1BsYXRmb3JtQm9vdE1h
bmFnZXJMaWIvQmRzUGxhdGZvcm0uYyAgICAgIHwgMzQgKy0tLS0tLS0tLS0tLS0tLS0tLQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDM0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL092bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL1BsYXRmb3JtQm9vdE1h
bmFnZXJMaWIuaW5mIGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvUGxh
dGZvcm1Cb290TWFuYWdlckxpYi5pbmYKaW5kZXggMDYwYTNhYjRjNS4uMDRkNjE0Y2Q0OSAxMDA2
NDQKLS0tIGEvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvUGxhdGZvcm1C
b290TWFuYWdlckxpYi5pbmYKKysrIGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFn
ZXJMaWIvUGxhdGZvcm1Cb290TWFuYWdlckxpYi5pbmYKQEAgLTU0LDYgKzU0LDcgQEAgW0xpYnJh
cnlDbGFzc2VzXQogICBVZWZpTGliDQogICBQbGF0Zm9ybUJtUHJpbnRTY0xpYg0KICAgVGNnMlBo
eXNpY2FsUHJlc2VuY2VMaWINCisgIFhlblBsYXRmb3JtTGliDQogDQogW1BjZF0NCiAgIGdVZWZp
T3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZEVtdVZhcmlhYmxlRXZlbnQNCkBAIC03Myw3ICs3NCw2
IEBAIFtQcm90b2NvbHNdCiAgIGdFZmlGaXJtd2FyZVZvbHVtZTJQcm90b2NvbEd1aWQgICAgICAg
ICAgICAgICAjIFBST1RPQ09MIFNPTUVUSU1FU19DT05TVU1FRA0KIA0KIFtHdWlkc10NCi0gIGdF
ZmlYZW5JbmZvR3VpZA0KICAgZ0VmaUVuZE9mRHhlRXZlbnRHcm91cEd1aWQNCiAgIGdSb290QnJp
ZGdlc0Nvbm5lY3RlZEV2ZW50R3JvdXBHdWlkDQogICBnVWVmaVNoZWxsRmlsZUd1aWQNCmRpZmYg
LS1naXQgYS9Pdm1mUGtnL0xpYnJhcnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9y
bS5jIGIvT3ZtZlBrZy9MaWJyYXJ5L1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0u
YwppbmRleCA3OTc3MzFhNDFjLi5kNWQ1ZDIwZmQ4IDEwMDY0NAotLS0gYS9Pdm1mUGtnL0xpYnJh
cnkvUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jCisrKyBiL092bWZQa2cvTGli
cmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMKQEAgLTcsMTEgKzcsMTEg
QEAKICoqLw0KIA0KICNpbmNsdWRlICJCZHNQbGF0Zm9ybS5oIg0KLSNpbmNsdWRlIDxHdWlkL1hl
bkluZm8uaD4NCiAjaW5jbHVkZSA8R3VpZC9Sb290QnJpZGdlc0Nvbm5lY3RlZEV2ZW50R3JvdXAu
aD4NCiAjaW5jbHVkZSA8UHJvdG9jb2wvRmlybXdhcmVWb2x1bWUyLmg+DQogI2luY2x1ZGUgPExp
YnJhcnkvUGxhdGZvcm1CbVByaW50U2NMaWIuaD4NCiAjaW5jbHVkZSA8TGlicmFyeS9UY2cyUGh5
c2ljYWxQcmVzZW5jZUxpYi5oPg0KKyNpbmNsdWRlIDxMaWJyYXJ5L1hlblBsYXRmb3JtTGliLmg+
DQogDQogDQogLy8NCkBAIC0xMjI1LDM4ICsxMjI1LDYgQEAgUGNpQWNwaUluaXRpYWxpemF0aW9u
ICgKICAgSW9PcjE2ICgoUGNpUmVhZDMyIChQbWJhKSAmIH5CSVQwKSArIDQsIEJJVDApOw0KIH0N
CiANCi0vKioNCi0gIFRoaXMgZnVuY3Rpb24gZGV0ZWN0cyBpZiBPVk1GIGlzIHJ1bm5pbmcgb24g
WGVuLg0KLQ0KLSoqLw0KLVNUQVRJQw0KLUJPT0xFQU4NCi1YZW5EZXRlY3RlZCAoDQotICBWT0lE
DQotICApDQotew0KLSAgRUZJX0hPQl9HVUlEX1RZUEUgICAgICAgICAqR3VpZEhvYjsNCi0gIFNU
QVRJQyBJTlROICAgICAgICAgICAgICAgRm91bmRIb2IgPSAtMTsNCi0NCi0gIGlmIChGb3VuZEhv
YiA9PSAwKSB7DQotICAgIHJldHVybiBGQUxTRTsNCi0gIH0gZWxzZSBpZiAoRm91bmRIb2IgPT0g
MSkgew0KLSAgICByZXR1cm4gVFJVRTsNCi0gIH0NCi0NCi0gIC8vDQotICAvLyBTZWUgaWYgYSBY
ZW5JbmZvIEhPQiBpcyBhdmFpbGFibGUNCi0gIC8vDQotICBHdWlkSG9iID0gR2V0Rmlyc3RHdWlk
SG9iICgmZ0VmaVhlbkluZm9HdWlkKTsNCi0gIGlmIChHdWlkSG9iID09IE5VTEwpIHsNCi0gICAg
Rm91bmRIb2IgPSAwOw0KLSAgICByZXR1cm4gRkFMU0U7DQotICB9DQotDQotICBGb3VuZEhvYiA9
IDE7DQotICByZXR1cm4gVFJVRTsNCi19DQotDQogRUZJX1NUQVRVUw0KIEVGSUFQSQ0KIENvbm5l
Y3RSZWN1cnNpdmVseUlmUGNpTWFzc1N0b3JhZ2UgKA0KLS0gCkFudGhvbnkgUEVSQVJECgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
