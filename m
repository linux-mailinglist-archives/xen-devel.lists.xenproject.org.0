Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54679004
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 17:59:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs82H-0002ox-Bf; Mon, 29 Jul 2019 15:58:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q6P6=V2=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hs82E-0002mM-Vd
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 15:58:03 +0000
X-Inumbo-ID: a47be9a8-b219-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a47be9a8-b219-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 15:58:01 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lMHgU7ZkGJO1fE1FBwEX/wI5Q24m8fSVKDrJQ+D9PYHETVi5PkcEW18aeQsTEAqiK6bBSqaDdP
 ZdpO5LiMEkCxhfvhpkv3I1FUGlbUdWGZCa2CbQBIJ2E3l0FgzkONnR0jVp13HNiJHCF3JMskvm
 WpHBdzMfHdXrD1gtgRn1b6UGtry4ql8hcvMukPoq7V5lXNODLcid11Whd16pqX7yO6avyoDL5j
 C27sSO0UKXDF0l/OP9hV0O81JcIM2MTx/5Wpk0GQKD2R8Nertelgi79OPJAN68V5T8XOp3i/Ah
 xsI=
X-SBRS: 2.7
X-MesageID: 3710501
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,323,1559534400"; 
   d="scan'208";a="3710501"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
Date: Mon, 29 Jul 2019 16:39:41 +0100
Message-ID: <20190729153944.24239-33-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729153944.24239-1-anthony.perard@citrix.com>
References: <20190729153944.24239-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 32/35] OvmfPkg: Introduce PcdXenGrantFrames
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

SW50cm9kdWNlIFBjZFhlbkdyYW50RnJhbWVzIHRvIHJlcGxhY2UgYSBkZWZpbmUgaW4gWGVuQnVz
RHhlIGFuZCBhbGxvdwp0aGUgc2FtZSB2YWx1ZSB0byBiZSB1c2VkIGluIGEgZGlmZmVyZW50IG1v
ZHVsZS4KClRoZSByZWFzb24gZm9yIHRoZSBudW1iZXIgb2YgcGFnZSB0byBiZSA0IGRvZXNuJ3Qg
ZXhpc3QgYW55bW9yZSwgc28Kc2ltcGx5IHJlbW92ZSB0aGUgY29tbWVudC4KClNpZ25lZC1vZmYt
Ynk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0KIE92bWZQ
a2cvT3ZtZlBrZy5kZWMgICAgICAgICAgICAgfCAzICsrKwogT3ZtZlBrZy9YZW5CdXNEeGUvWGVu
QnVzRHhlLmluZiB8IDIgKysKIE92bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5oICAgfCAxICsK
IE92bWZQa2cvWGVuQnVzRHhlL0dyYW50VGFibGUuYyAgfCAzICstLQogNCBmaWxlcyBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvT3ZtZlBrZy9P
dm1mUGtnLmRlYyBiL092bWZQa2cvT3ZtZlBrZy5kZWMKaW5kZXggMDRkNWUyOTI3Mi4uZDVmZWU4
MDVlZiAxMDA2NDQKLS0tIGEvT3ZtZlBrZy9Pdm1mUGtnLmRlYworKysgYi9Pdm1mUGtnL092bWZQ
a2cuZGVjCkBAIC0yMjUsNiArMjI1LDkgQEAgW1BjZHNGaXhlZEF0QnVpbGRdCiAgIGdVZWZpT3Zt
ZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZFhlblB2aFN0YXJ0T2ZEYXlTdHJ1Y3RQdHJ8MHgwfFVJTlQz
MnwweDE3DQogICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3VpZC5QY2RYZW5QdmhTdGFydE9mRGF5
U3RydWN0UHRyU2l6ZXwweDB8VUlOVDMyfDB4MzINCiANCisgICMjIE51bWJlciBvZiBwYWdlIGZy
YW1lcyB0byB1c2UgZm9yIHN0b3JpbmcgZ3JhbnQgdGFibGUgZW50cmllcy4NCisgIGdVZWZpT3Zt
ZlBrZ1Rva2VuU3BhY2VHdWlkLlBjZFhlbkdyYW50RnJhbWVzfDR8VUlOVDMyfDB4MzMNCisNCiBb
UGNkc0R5bmFtaWMsIFBjZHNEeW5hbWljRXhdDQogICBnVWVmaU92bWZQa2dUb2tlblNwYWNlR3Vp
ZC5QY2RFbXVWYXJpYWJsZUV2ZW50fDB8VUlOVDY0fDINCiAgIGdVZWZpT3ZtZlBrZ1Rva2VuU3Bh
Y2VHdWlkLlBjZE92bWZGbGFzaFZhcmlhYmxlc0VuYWJsZXxGQUxTRXxCT09MRUFOfDB4MTANCmRp
ZmYgLS1naXQgYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaW5mIGIvT3ZtZlBrZy9YZW5C
dXNEeGUvWGVuQnVzRHhlLmluZgppbmRleCA4NmUwZmI4MjI0Li4wYjc4Y2QwYWY0IDEwMDY0NAot
LS0gYS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaW5mCisrKyBiL092bWZQa2cvWGVuQnVz
RHhlL1hlbkJ1c0R4ZS5pbmYKQEAgLTU5LDMgKzU5LDUgQEAgW1Byb3RvY29sc10KICAgZ1hlbkJ1
c1Byb3RvY29sR3VpZA0KICAgZ1hlbklvUHJvdG9jb2xHdWlkDQogDQorW0ZpeGVkUGNkXQ0KKyAg
Z1VlZmlPdm1mUGtnVG9rZW5TcGFjZUd1aWQuUGNkWGVuR3JhbnRGcmFtZXMNCmRpZmYgLS1naXQg
YS9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5CdXNEeGUuaCBiL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1
c0R4ZS5oCmluZGV4IDg1MTAzNjFiY2EuLmIxZGNjMzU0OWMgMTAwNjQ0Ci0tLSBhL092bWZQa2cv
WGVuQnVzRHhlL1hlbkJ1c0R4ZS5oCisrKyBiL092bWZQa2cvWGVuQnVzRHhlL1hlbkJ1c0R4ZS5o
CkBAIC0yMiw2ICsyMiw3IEBACiAjaW5jbHVkZSA8TGlicmFyeS9VZWZpTGliLmg+DQogI2luY2x1
ZGUgPExpYnJhcnkvRGV2aWNlUGF0aExpYi5oPg0KICNpbmNsdWRlIDxMaWJyYXJ5L0RlYnVnTGli
Lmg+DQorI2luY2x1ZGUgPExpYnJhcnkvUGNkTGliLmg+DQogDQogDQogLy8NCmRpZmYgLS1naXQg
YS9Pdm1mUGtnL1hlbkJ1c0R4ZS9HcmFudFRhYmxlLmMgYi9Pdm1mUGtnL1hlbkJ1c0R4ZS9HcmFu
dFRhYmxlLmMKaW5kZXggNjU3NWU5Yjg4Yy4uMTEzMDQwNGNkMSAxMDA2NDQKLS0tIGEvT3ZtZlBr
Zy9YZW5CdXNEeGUvR3JhbnRUYWJsZS5jCisrKyBiL092bWZQa2cvWGVuQnVzRHhlL0dyYW50VGFi
bGUuYwpAQCAtMjIsOCArMjIsNyBAQAogDQogI2RlZmluZSBOUl9SRVNFUlZFRF9FTlRSSUVTIDgN
CiANCi0vKiBOUl9HUkFOVF9GUkFNRVMgbXVzdCBiZSBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gdGhh
dCBjb25maWd1cmVkIGluIFhlbiAqLw0KLSNkZWZpbmUgTlJfR1JBTlRfRlJBTUVTIDQNCisjZGVm
aW5lIE5SX0dSQU5UX0ZSQU1FUyAoRml4ZWRQY2RHZXQzMiAoUGNkWGVuR3JhbnRGcmFtZXMpKQ0K
ICNkZWZpbmUgTlJfR1JBTlRfRU5UUklFUyAoTlJfR1JBTlRfRlJBTUVTICogRUZJX1BBR0VfU0la
RSAvIHNpemVvZihncmFudF9lbnRyeV92MV90KSkNCiANCiBTVEFUSUMgZ3JhbnRfZW50cnlfdjFf
dCAqR3JhbnRUYWJsZSA9IE5VTEw7DQotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
