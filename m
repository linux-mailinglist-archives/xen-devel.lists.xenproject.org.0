Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EADB5FA77
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:00:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3Bk-0006Ch-7l; Thu, 04 Jul 2019 14:58:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8gU+=VB=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hj3Bi-0006BJ-FH
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:58:18 +0000
X-Inumbo-ID: 25ef8556-9e6c-11e9-a490-4b7844eca037
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25ef8556-9e6c-11e9-a490-4b7844eca037;
 Thu, 04 Jul 2019 14:58:14 +0000 (UTC)
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
IronPort-SDR: AjrJ982ije/yG3O6ggYcbOwxVFQQ7wacJKXpOL2ZR0wudHhR4zEeauCMkomFDRxgEeeMrR50Zo
 omthIIFfVWQ3xNdOgu5p+CZUuEpgoHXFIdZ7TF5LXxUVNraPZNxPbvr9p3O8gOu1uzyyygq7lh
 LyXp5A7xhZev1DDO3rbdNdIIe7Sg41CeYXIVHwgjNgrY0kWRX7WRyKZZmmbHhbKNDbYF61nPFe
 W42QuInPq44T8IsXbDVcWrtgrVup+bZC8rsnWSvS52H0cInekl6hMPp103CuvNA1fiq+Ouh/eL
 nlU=
X-SBRS: 2.7
X-MesageID: 2589148
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,451,1557201600"; 
   d="scan'208";a="2589148"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Thu, 4 Jul 2019 15:42:15 +0100
Message-ID: <20190704144233.27968-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704144233.27968-1-anthony.perard@citrix.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 17/35] OvmfPkg/XenPlatformPei: Reinit
 XenHypercallLib
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

VGhlIFhlblBsYXRmb3JtUGVpIG5lZWRzIHRvIG1ha2UgaHlwZXJjYWxscywgYnV0IHRoZSBYZW5I
eXBlcmNhbGxMaWIgd2FzCmluaXRpYWxpc2VkIGJlZm9yZSB0aGUgSHlwZXJQYWdlIHdhcyByZWFk
eS4gTm93IHRoYXQgWGVuUGxhdGZvcm1QZWkgaGFzCmluaXRpYWxpc2VkIHRoZSBIeXBlclBhZ2Us
IHJlaW5pdGlhbGlzZSB0aGUgWGVuSHlwZXJjYWxsTGliLgoKUmVmOiBodHRwczovL2J1Z3ppbGxh
LnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQoKTm90ZXM6CiAgICB2MzoK
ICAgIC0gbmV3IHBhdGNoIHNwbGl0IGZyb20gWGVuSHlwZXJjYWxsTGliOiBFbmFibGUgaXQgaW4g
UEVJTS4KICAgIC0gY2hlY2sgZm9yIExpYiBpbml0aWFsaXNhdGlvbiBmYWlsdXJlLgoKIE92bWZQ
a2cvWGVuUGxhdGZvcm1QZWkvWGVuUGxhdGZvcm1QZWkuaW5mIHwgMSArCiBPdm1mUGtnL1hlblBs
YXRmb3JtUGVpL1hlbi5jICAgICAgICAgICAgICB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL1hlblBsYXRmb3JtUGVp
L1hlblBsYXRmb3JtUGVpLmluZiBiL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuUGxhdGZvcm1Q
ZWkuaW5mCmluZGV4IDRkMDAyMDZkMDkuLjBlZjc3ZGI5MmMgMTAwNjQ0Ci0tLSBhL092bWZQa2cv
WGVuUGxhdGZvcm1QZWkvWGVuUGxhdGZvcm1QZWkuaW5mCisrKyBiL092bWZQa2cvWGVuUGxhdGZv
cm1QZWkvWGVuUGxhdGZvcm1QZWkuaW5mCkBAIC01OSw2ICs1OSw3IEBAIFtMaWJyYXJ5Q2xhc3Nl
c10KICAgTXRyckxpYg0KICAgTWVtRW5jcnlwdFNldkxpYg0KICAgUGNkTGliDQorICBYZW5IeXBl
cmNhbGxMaWINCiANCiBbUGNkXQ0KICAgZ1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkT3Zt
ZlBlaU1lbUZ2QmFzZQ0KZGlmZiAtLWdpdCBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMg
Yi9Pdm1mUGtnL1hlblBsYXRmb3JtUGVpL1hlbi5jCmluZGV4IGM1MjkzNDk4YzQuLjg3N2Q3NzZk
ZTggMTAwNjQ0Ci0tLSBhL092bWZQa2cvWGVuUGxhdGZvcm1QZWkvWGVuLmMKKysrIGIvT3ZtZlBr
Zy9YZW5QbGF0Zm9ybVBlaS9YZW4uYwpAQCAtMjYsNiArMjYsNyBAQAogI2luY2x1ZGUgPExpYnJh
cnkvUmVzb3VyY2VQdWJsaWNhdGlvbkxpYi5oPg0KICNpbmNsdWRlIDxMaWJyYXJ5L010cnJMaWIu
aD4NCiAjaW5jbHVkZSA8SW5kdXN0cnlTdGFuZGFyZC9YZW4vYXJjaC14ODYvaHZtL3N0YXJ0X2lu
Zm8uaD4NCisjaW5jbHVkZSA8TGlicmFyeS9YZW5IeXBlcmNhbGxMaWIuaD4NCiANCiAjaW5jbHVk
ZSAiUGxhdGZvcm0uaCINCiAjaW5jbHVkZSAiWGVuLmgiDQpAQCAtODgsNiArODksNyBAQCBYZW5D
b25uZWN0ICgKICAgRUZJX1hFTl9PVk1GX0lORk8gKkluZm87DQogICBDSEFSOCBTaWdbc2l6ZW9m
IChJbmZvLT5TaWduYXR1cmUpICsgMV07DQogICBVSU5UMzIgKlBWSFJlc2V0VmVjdG9yRGF0YTsN
CisgIFJFVFVSTl9TVEFUVVMgU3RhdHVzOw0KIA0KICAgQXNtQ3B1aWQgKFhlbkxlYWYgKyAyLCAm
VHJhbnNmZXJQYWdlcywgJlRyYW5zZmVyUmVnLCBOVUxMLCBOVUxMKTsNCiAgIG1YZW5JbmZvLkh5
cGVyUGFnZXMgPSBBbGxvY2F0ZVBhZ2VzIChUcmFuc2ZlclBhZ2VzKTsNCkBAIC0xNTIsNiArMTU0
LDEzIEBAIFhlbkNvbm5lY3QgKAogICAgIHNpemVvZihtWGVuSW5mbykNCiAgICAgKTsNCiANCisg
IC8vDQorICAvLyBJbml0aWFsaXplIHRoZSBYZW5IeXBlcmNhbGwgbGlicmFyeSwgbm93IHRoYXQg
dGhlIFhlbkluZm8gSE9CIGlzDQorICAvLyBhdmFpbGFibGUNCisgIC8vDQorICBTdGF0dXMgPSBY
ZW5IeXBlcmNhbGxMaWJJbml0ICgpOw0KKyAgQVNTRVJUX1JFVFVSTl9FUlJPUiAoU3RhdHVzKTsN
CisNCiAgIHJldHVybiBFRklfU1VDQ0VTUzsNCiB9DQogDQotLSAKQW50aG9ueSBQRVJBUkQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
