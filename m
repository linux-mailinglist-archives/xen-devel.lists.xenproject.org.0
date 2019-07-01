Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96785BCBC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 15:20:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhwBy-0005M6-LB; Mon, 01 Jul 2019 13:17:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vScv=U6=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hhwBx-0005M1-C5
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 13:17:57 +0000
X-Inumbo-ID: a27e6d56-9c02-11e9-9bd2-a3353d4c32af
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a27e6d56-9c02-11e9-9bd2-a3353d4c32af;
 Mon, 01 Jul 2019 13:17:54 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ntUv4B+JvyZc0doTSt9gv4jsFStS0PixuBcTlgyhmFboBCxQn2sAZWvlVrPDOQYG5UpEJMh5zi
 crDfEZKbrTK0k7CeGs/E2n6CHq9EqCmuTNFI7i5V7pgzYZe/cWAjUFCwLcieQMcsymhOmvkK+g
 7efh4jkQTPTSUf0xjjdZIjznnWidBOHM4xL45I3Hc3mkGz9rmxnR9o2ooVg2dOITCO8FIelJ7r
 /JJEYm5AJt21BzDHmQzTRKtRbzG9se7G6Cm2IUmUxUxspx7Q68wyNpP5xks2ZHGiHXFiUZNn2u
 o5U=
X-SBRS: 2.7
X-MesageID: 2459934
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,439,1557201600"; 
   d="scan'208";a="2459934"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 1 Jul 2019 14:17:50 +0100
Message-ID: <20190701131750.37855-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] passthrough/pci: properly qualify the
 mem_sharing_enabled check...
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uaW4gYXNzaWduX2RldmljZSgpLgoKVGhlIGNoZWNrIG9mIGFyY2guaHZtLm1lbV9zaGFyaW5n
X2VuYWJsZWQgZmxhZyBhdCB0aGUgdG9wIG9mCmRyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmM6YXNz
aWduX2RldmljZSgpIGRvZXMgbm90IG1ha2Ugc3VyZSB0aGF0IHRoZQpkb21haW4gaXMgYWN0dWFs
bHkgYW4gSFZNIGRvbWFpbi4KClRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGJ5IG1vdmluZyB0
aGUgZGVmaW5pdGlvbiBvZiB0aGUKbWVtX3NoYXJpbmdfZW5hYmxlZCgpIG1hY3JvIGZyb20gbWVt
X3NoYXJpbmcuYyBpbnRvIGFzbS04Ni9odm0vZG9tYWluLmggYW5kCnRoZW4gdXNpbmcgdGhhdCBp
bnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbT4KLS0tCkNjOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNjOiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ2M6ICJSb2dlciBQYXUgTW9ubsOp
IiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5n
LmMgICAgfCAzIC0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgfCAyICstCiB4
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaCB8IDMgKysrCiAzIGZpbGVzIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvbW0vbWVtX3NoYXJpbmcuYyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCmluZGV4
IGYxNmEzZjUzMjQuLmRiMDJmNGRmZDUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1f
c2hhcmluZy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCkBAIC0xNDksOSAr
MTQ5LDYgQEAgc3RhdGljIGlubGluZSBzaHJfaGFuZGxlX3QgZ2V0X25leHRfaGFuZGxlKHZvaWQp
CiAgICAgcmV0dXJuIHggKyAxOwogfQogCi0jZGVmaW5lIG1lbV9zaGFyaW5nX2VuYWJsZWQoZCkg
XAotICAgIChpc19odm1fZG9tYWluKGQpICYmIChkKS0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5h
YmxlZCkKLQogc3RhdGljIGF0b21pY190IG5yX3NhdmVkX21mbnMgICA9IEFUT01JQ19JTklUKDAp
OyAKIHN0YXRpYyBhdG9taWNfdCBucl9zaGFyZWRfbWZucyAgPSBBVE9NSUNfSU5JVCgwKTsKIApk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYwppbmRleCBlODg2ODk0MjVkLi43Njk3ZWM0NDBkIDEwMDY0NAotLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYwpAQCAtMTQ1MCw3ICsxNDUwLDcgQEAgc3RhdGljIGludCBhc3NpZ25fZGV2aWNl
KHN0cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sIHUzMiBmbGFnKQog
CiAgICAgLyogUHJldmVudCBkZXZpY2UgYXNzaWduIGlmIG1lbSBwYWdpbmcgb3IgbWVtIHNoYXJp
bmcgaGF2ZSBiZWVuIAogICAgICAqIGVuYWJsZWQgZm9yIHRoaXMgZG9tYWluICovCi0gICAgaWYg
KCB1bmxpa2VseShkLT5hcmNoLmh2bS5tZW1fc2hhcmluZ19lbmFibGVkIHx8CisgICAgaWYgKCB1
bmxpa2VseShtZW1fc2hhcmluZ19lbmFibGVkKGQpIHx8CiAgICAgICAgICAgICAgICAgICB2bV9l
dmVudF9jaGVja19yaW5nKGQtPnZtX2V2ZW50X3BhZ2luZykgfHwKICAgICAgICAgICAgICAgICAg
IHAybV9nZXRfaG9zdHAybShkKS0+Z2xvYmFsX2xvZ2RpcnR5KSApCiAgICAgICAgIHJldHVybiAt
RVhERVY7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaCBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oCmluZGV4IDZjN2M0ZjVhYTYuLjFlNmUzY2Uw
NzggMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oCisrKyBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oCkBAIC0xOTcsOCArMTk3LDExIEBAIHN0cnVj
dCBodm1fZG9tYWluIHsKIAogI2lmZGVmIENPTkZJR19IVk0KICNkZWZpbmUgaGFwX2VuYWJsZWQo
ZCkgIChpc19odm1fZG9tYWluKGQpICYmIChkKS0+YXJjaC5odm0uaGFwX2VuYWJsZWQpCisjZGVm
aW5lIG1lbV9zaGFyaW5nX2VuYWJsZWQoZCkgXAorICAgIChpc19odm1fZG9tYWluKGQpICYmIChk
KS0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5hYmxlZCkKICNlbHNlCiAjZGVmaW5lIGhhcF9lbmFi
bGVkKGQpICAoeyh2b2lkKShkKTsgZmFsc2U7fSkKKyNkZWZpbmUgbWVtX3NoYXJpbmdfZW5hYmxl
ZChkKSAgKHsodm9pZCkoZCk7IGZhbHNlO30pCiAjZW5kaWYKIAogI2VuZGlmIC8qIF9fQVNNX1g4
Nl9IVk1fRE9NQUlOX0hfXyAqLwotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
