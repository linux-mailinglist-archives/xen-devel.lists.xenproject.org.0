Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B185FA3A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 16:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj2wg-0003Ev-8O; Thu, 04 Jul 2019 14:42:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj2we-0003Dm-4f
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:42:44 +0000
X-Inumbo-ID: fab3b13c-9e69-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fab3b13c-9e69-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:42:42 +0000 (UTC)
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
IronPort-SDR: HdSXsIp65/UZA0y+tN7Ih+YP31aCQGHMs1rnNhF3SeUhEkQ/hJhff6kEKso41Qd6eK47rE5n3V
 jGfEdzSNARm4vrjD/l4T8oproKUzYxh39upQzUViHJj9zwnv/htqohYrcyZnoW+oNUbqd8DKRa
 zlbdXab06p3wyRIhbRBk2U7IlfEJRxAtERUDEv2OpSKPxBVSPeYbp8UtkDsJH7JFR0VwRo8p5g
 PK8vK8ITiJUEc6EDGzi8/tVRGMo73JaFeqK0qJEkqvwIQynRjOShqShDP3jCAqrScgj0oJgjry
 tuA=
X-SBRS: 2.7
X-MesageID: 2588785
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2588785"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:05 +0100
Message-ID: <20190704144233.27968-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 07/35] OvmfPkg/XenResetVector: Saving start
 of day pointer for PVH guests
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

QXMgZGVzY3JpYmVkIGluIHRoZSBYZW4gUFZIIGRvY3VtZW50YXRpb24gWzFdLCAiZWJ4OiBjb250
YWlucyB0aGUKcGh5c2ljYWwgbWVtb3J5IGFkZHJlc3Mgd2hlcmUgdGhlIGxvYWRlciBoYXMgcGxh
Y2VkIHRoZSBib290IHN0YXJ0IGluZm8Kc3RydWN0dXJlIi4gVG8gaGF2ZSB0aGlzIHBvaW50ZXIg
c2F2ZWQgdG8gYmUgYWJsZSB0byB1c2UgaXQgbGF0ZXIgaW4gdGhlClBFSSBwaGFzZSwgd2UgYWxs
b2NhdGUgc29tZSBzcGFjZSBpbiB0aGUgTUVNRkQgZm9yIGl0LiBXZSB1c2UgJ1hQVkgnIGFzCmEg
c2lnbmF0dXJlIChmb3IgIlhlbiBQVkgiKS4KClsxXSBodHRwczovL3hlbmJpdHMueGVucHJvamVj
dC5vcmcvZG9jcy91bnN0YWJsZS9taXNjL3B2aC5odG1sCgpSZWY6IGh0dHBzOi8vYnVnemlsbGEu
dGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTY4OQpTaWduZWQtb2ZmLWJ5OiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KQWNrZWQtYnk6IExhc3psbyBFcnNl
ayA8bGVyc2VrQHJlZGhhdC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoKICAgIC0gcmVuYW1lIFBj
ZFhlblN0YXJ0T2ZEYXkqIHRvIFBjZFhlblB2aFN0YXJ0T2ZEYXkqCiAgICAtIFVzZSBmaXJzdCBh
dmFpbGFibGUgdG9rZW4gdmFsdWUgZm9yIHRob3NlICgweDE3IGFuZCAweDI4KQoKIE92bWZQa2cv
T3ZtZlBrZy5kZWMgICAgICAgICAgICAgICAgICAgICAgICAgfCAzICsrKwogT3ZtZlBrZy9Pdm1m
WGVuLmZkZiAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKysrKwogT3ZtZlBrZy9YZW5SZXNl
dFZlY3Rvci9YZW5SZXNldFZlY3Rvci5pbmYgICB8IDMgKysrCiBPdm1mUGtnL1hlblJlc2V0VmVj
dG9yL0lhMzIvWGVuUFZITWFpbi5hc20gIHwgNiArKysrKysKIE92bWZQa2cvWGVuUmVzZXRWZWN0
b3IvWGVuUmVzZXRWZWN0b3IubmFzbWIgfCAyICsrCiA1IGZpbGVzIGNoYW5nZWQsIDE4IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL092bWZQa2cuZGVjIGIvT3ZtZlBrZy9Pdm1m
UGtnLmRlYwppbmRleCA5NjQwMzYwZjYyLi5jMmEyZWJmYjk1IDEwMDY0NAotLS0gYS9Pdm1mUGtn
L092bWZQa2cuZGVjCisrKyBiL092bWZQa2cvT3ZtZlBrZy5kZWMKQEAgLTIxOCw2ICsyMTgsOSBA
QCBbUGNkc0ZpeGVkQXRCdWlsZF0KICAgIyAgVGhlIHZhbHVlIHNob3VsZCBiZSBhIG11bHRpcGxl
IG9mIDRLQi4NCiAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZEhpZ2hQbW1NZW1vcnlT
aXplfDB4NDAwMDAwfFVJTlQzMnwweDMxDQogDQorICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3Vp
ZC5QY2RYZW5QdmhTdGFydE9mRGF5U3RydWN0UHRyfDB4MHxVSU5UMzJ8MHgxNw0KKyAgZ1VlZmlP
dm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVuUHZoU3RhcnRPZkRheVN0cnVjdFB0clNpemV8MHgw
fFVJTlQzMnwweDMyDQorDQogW1BjZHNEeW5hbWljLCBQY2RzRHluYW1pY0V4XQ0KICAgZ1VlZmlP
dm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkRW11VmFyaWFibGVFdmVudHwwfFVJTlQ2NHwyDQogICBn
VWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RPdm1mRmxhc2hWYXJpYWJsZXNFbmFibGV8RkFM
U0V8Qk9PTEVBTnwweDEwDQpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9Pdm1mWGVuLmZkZiBiL092bWZQ
a2cvT3ZtZlhlbi5mZGYKaW5kZXggNDNjMjY4ZjZjYi4uNDk5OTdmZWU5YiAxMDA2NDQKLS0tIGEv
T3ZtZlBrZy9Pdm1mWGVuLmZkZgorKysgYi9Pdm1mUGtnL092bWZYZW4uZmRmCkBAIC0xNzIsNiAr
MTcyLDEwIEBAIFtGRC5NRU1GRF0KIDB4MDA3MDAwfDB4MDAxMDAwDQogZ0VmaU1kZVBrZ1Rva2Vu
U3BhY2VHdWlkLlBjZEd1aWRlZEV4dHJhY3RIYW5kbGVyVGFibGVBZGRyZXNzfGdVZWZpT3ZtZlBr
Z1Rva2VuU3BhY2VHdWlkLlBjZEd1aWRlZEV4dHJhY3RIYW5kbGVyVGFibGVTaXplDQogDQorMHgw
MDgwMDB8MHgwMDEwMDANCisjIFVzZWQgYnkgWGVuUmVzZXRWZWN0b3IgdG8gY29tbXVuaWNhdGUg
d2l0aCBYZW5QbGF0Zm9ybVBlaQ0KK2dVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZFhlblB2
aFN0YXJ0T2ZEYXlTdHJ1Y3RQdHJ8Z1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVuUHZo
U3RhcnRPZkRheVN0cnVjdFB0clNpemUNCisNCiAweDAxMDAwMHwweDAxMDAwMA0KIGdVZWZpT3Zt
ZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZE92bWZTZWNQZWlUZW1wUmFtQmFzZXxnVWVmaU92bWZQa2dU
b2tlblNwYWNlR3VpZC5QY2RPdm1mU2VjUGVpVGVtcFJhbVNpemUNCiANCmRpZmYgLS1naXQgYS9P
dm1mUGtnL1hlblJlc2V0VmVjdG9yL1hlblJlc2V0VmVjdG9yLmluZiBiL092bWZQa2cvWGVuUmVz
ZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IuaW5mCmluZGV4IDA5N2ZjOWI1YjQuLjQ2YjEzM2E4MzQg
MTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IuaW5mCisr
KyBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IuaW5mCkBAIC0zNiwzICsz
Niw2IEBAIFtCdWlsZE9wdGlvbnNdCiBbUGNkXQ0KICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1
aWQuUGNkT3ZtZlNlY1BhZ2VUYWJsZXNCYXNlDQogICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3Vp
ZC5QY2RPdm1mU2VjUGFnZVRhYmxlc1NpemUNCisNCisgIGdVZWZpT3ZtZlBrZ1Rva2VuU3BhY2VH
dWlkLlBjZFhlblB2aFN0YXJ0T2ZEYXlTdHJ1Y3RQdHINCisgIGdVZWZpT3ZtZlBrZ1Rva2VuU3Bh
Y2VHdWlkLlBjZFhlblB2aFN0YXJ0T2ZEYXlTdHJ1Y3RQdHJTaXplDQpkaWZmIC0tZ2l0IGEvT3Zt
ZlBrZy9YZW5SZXNldFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtIGIvT3ZtZlBrZy9YZW5SZXNl
dFZlY3Rvci9JYTMyL1hlblBWSE1haW4uYXNtCmluZGV4IDJhMTdmZWQ1MmYuLmY0MmRmM2RiYTIg
MTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWEzMi9YZW5QVkhNYWluLmFzbQor
KysgYi9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20KQEAgLTIyLDYg
KzIyLDEyIEBAIHhlblBWSE1haW46CiAgICAgOw0KICAgICB4b3IgICAgIGVzcCwgZXNwDQogDQor
ICAgIDsNCisgICAgOyBTdG9yZSAiU3RhcnQgb2YgZGF5IiBzdHJ1Y3QgcG9pbnRlciBmb3IgbGF0
ZXIgdXNlDQorICAgIDsNCisgICAgbW92ICAgICBkd29yZFtQVkhfU1BBQ0UgKDApXSwgZWJ4DQor
ICAgIG1vdiAgICAgZHdvcmRbUFZIX1NQQUNFICg0KV0sICdYUFZIJw0KKw0KICAgICBtb3YgICAg
IGVieCwgQUREUl9PRihnZHRyKQ0KICAgICBsZ2R0ICAgIFtlYnhdDQogDQpkaWZmIC0tZ2l0IGEv
T3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5uYXNtYiBiL092bWZQa2cvWGVu
UmVzZXRWZWN0b3IvWGVuUmVzZXRWZWN0b3IubmFzbWIKaW5kZXggMGRiYzRmMmMxZC4uYjJjYjQw
NWQ1NCAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9YZW5SZXNldFZlY3Rvci5u
YXNtYgorKysgYi9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL1hlblJlc2V0VmVjdG9yLm5hc21iCkBA
IC0zNCw2ICszNCw4IEBACiANCiAlaW5jbHVkZSAiQ29tbW9uTWFjcm9zLmluYyINCiANCislZGVm
aW5lIFBWSF9TUEFDRShPZmZzZXQpIChGaXhlZFBjZEdldDMyIChQY2RYZW5QdmhTdGFydE9mRGF5
U3RydWN0UHRyKSArIChPZmZzZXQpKQ0KKw0KICVpbmNsdWRlICJQb3N0Q29kZXMuaW5jIg0KIA0K
ICVpZmRlZiBERUJVR19QT1JUODANCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
