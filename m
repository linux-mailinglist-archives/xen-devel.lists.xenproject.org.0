Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353C28B706
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 13:35:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxV1X-0006Ox-T1; Tue, 13 Aug 2019 11:31:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxV1V-0006Ln-Ee
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 11:31:29 +0000
X-Inumbo-ID: e3ad4b4e-bdbd-11e9-a9f0-a314ad3f28dc
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3ad4b4e-bdbd-11e9-a9f0-a314ad3f28dc;
 Tue, 13 Aug 2019 11:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565695888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w+liTcVRavSpZGXaMp7ZRfUQNjZhlY2McqyT6sGd3Fw=;
 b=M5eQP6h4sjHr6wwNS3BpjJBV2XO5Ayn+X1wzP/rZhnk3pDq4NTSDP7WE
 mDlg9dfiTqRQL7AxLfml9xTuGJfZxyiB8/RlSJfw/4nUYC4AcEHzS+5Gy
 Wioir/YEdcghgSNzXdlX7DkaNuQeRcQ1UhizxYno0rZOF+e5ghzkbTTlH I=;
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
IronPort-SDR: dhQjzfxImr2P6pDDCFMMa3hYL1AuaaHfBiSLaDhrkVLAB319UuqdN1BFvjrmT1CEUhemaNkDJ1
 Uur8nbXJOKVeYoq9Upx4X44G6sVeicd97V0Wgm0ppvvffdh15xT+S65I6gOYv2cwqHVEtkyi+e
 nParxWU0F4HU69G0BRpb+pHcK8YQAa9C3ILVD0zJXlraGCNZ/bZO3yozt5vHwxCJQLoMiDu8rQ
 8B4b0YU4MSzxZhWz7tDCxgDSLsk4sUyTkNMnTAXz4mPnkfxfbM6pHyz69zWC5ZkA2MtGwlNFFU
 Hx8=
X-SBRS: 2.7
X-MesageID: 4374132
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,381,1559534400"; 
   d="scan'208";a="4374132"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Tue, 13 Aug 2019 12:30:51 +0100
Message-ID: <20190813113119.14804-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190813113119.14804-1-anthony.perard@citrix.com>
References: <20190813113119.14804-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 07/35] OvmfPkg/XenResetVector: Saving start
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
ICVpZmRlZiBERUJVR19QT1JUODANCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
