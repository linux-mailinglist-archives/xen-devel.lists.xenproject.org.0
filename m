Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169FF5CCBB
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 11:38:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiFB8-0006hv-Qr; Tue, 02 Jul 2019 09:34:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/Ug=U7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hiFB7-0006hO-0W
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 09:34:21 +0000
X-Inumbo-ID: 90829035-9cac-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 90829035-9cac-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 09:34:18 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QOeEvmqeDn2y8LhM9IQdpvkMKjljaoGNQBsxDvL5rOOCgP4LmIIJxnSzF90D8Wsacom0h3d+AR
 oD+ysq6ciKGh7ByIufg6DabMigdYBrPYMqdBBCK0O5k0/pcXOAkihfMtizeMFQEaAa9+l8yldJ
 XkRQpQ1dPaIITX4UwdA0S1Gr7VOaX0yGk/L41WezmoC3H0h1jWhmSjgubmC7LvE1PM8IPZuVdp
 aG+tRskqTXQTSBJV5QPIp/6iy1RZOP43LSTHPw2pI+A1vaiOil9lg0ocMNBFU/+qIZZM5qa5kp
 uK8=
X-SBRS: 2.7
X-MesageID: 2491006
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,442,1557201600"; 
   d="scan'208";a="2491006"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 2 Jul 2019 10:34:14 +0100
Message-ID: <20190702093414.27798-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/msi: fix loop termination condition in
 pci_msi_conf_write_intercept()
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGZvciBsb29wIHRoYXQgZGVhbHMgd2l0aCBNU0kgbWFza2luZyBpcyBjb2RlZCBhcyBmb2xs
b3dzOgoKZm9yICggcG9zID0gMDsgcG9zIDwgZW50cnktPm1zaS5udmVjOyArK3BvcywgKytlbnRy
eSApCgpUaHVzIHRoZSBsb29wIHRlcm1pbmF0aW9uIGNvbmRpdGlvbiBpcyBkZXJlZmVyZW5jaW5n
IGEgc3RydWN0IHBvaW50ZXIgdGhhdAppcyBiZWluZyBpbmNyZW1lbnRlZCBieSB0aGUgbG9vcC4g
SG93ZXZlciwgaXQgaXMgY2xlYXIgZnJvbSBmb2xsb3dpbmcgY29kZQpwYXRocyBpbiBtc2lfY2Fw
YWJpbGl0eV9pbml0KCkgdGhhdCB0aGlzIGlzIHVuc2FmZSBhcyBmb3IgaW5zdGFuY2UsIGluIHRo
ZQpjYXNlIG9mIG52ZWMgPT0gMSwgZW50cnkgd2lsbCBwb2ludCBhdCBhIHNpbmdsZSBzdHJ1Y3Qg
bXNpX2Rlc2MgYWxsb2NhdGlvbgphbmQgdGh1cyB0aGUgbG9vcCB3aWxsIHdhbGsgYmV5b25kIHRo
ZSBib3VuZHMgb2YgdGhlIGFsbG9jYXRpb24gYmVmb3JlCmRlcmVmZXJlbmNpbmcgdGhlIG1lbW9y
eSB0byBkZXRlcm1pbmUgd2hldGhlciB0aGUgbG9vcCBzaG91bGQgdGVybWluYXRlLgpBbHNvLCBi
ZWNhdXNlIHRoZSBib2R5IG9mIHRoZSBsb29wIHdyaXRlcyB2aWEgdGhlIGVudHJ5IHBvaW50ZXIs
IHRoaXMgY2FuCnRoZW4gbGVhZCB0byBoZWFwIG1lbW9yeSBjb3JydXB0aW9uLCBvciBpbmRlZWQg
Y29ycnVwdGlvbiBvZiBhbnl0aGluZyBpbgp0aGUgZGlyZWN0IG1hcC4KClRoaXMgcGF0Y2ggc2lt
cGx5IGluaXRpYWxpemVzIGEgc3RhY2sgdmFyaWFibGUgdG8gdGhlIHZhbHVlIG9mCmVudHJ5LT5t
c2kubnZlYyBiZWZvcmUgc3RhcnRpbmcgdGhlIGxvb3AgYW5kIHRoZW4gdXNlcyB0aGF0IGluIHRo
ZQp0ZXJtaW5hdGlvbiBjb25kaXRpb24gaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgpDYzogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJp
eC5jb20+CgpDcmVkaXQgdG8gQW5kcmV3IENvb3BlciBhbmQgSWdvciBEcnV6aGluaW4gZm9yIGhl
bHBpbmcgbmFycm93IGRvd24gdGhlCnNvdXJjZSBvZiB0aGUgbWVtb3J5IGNvcnJ1cHRpb24uIEl0
IGhhcyB0YWtlbiBtYW55IHdlZWtzIG9mIGhlYWQtc2NyYXRjaGluZwp0byBnZXQgdG8gdGhpcyBm
aXguCi0tLQogeGVuL2FyY2gveDg2L21zaS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbXNp
LmMgYi94ZW4vYXJjaC94ODYvbXNpLmMKaW5kZXggYmFiYzQxNDdjNC4uODllNjExNjBlOSAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L21zaS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tc2kuYwpAQCAt
MTMyOCw2ICsxMzI4LDcgQEAgaW50IHBjaV9tc2lfY29uZl93cml0ZV9pbnRlcmNlcHQoc3RydWN0
IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsCiAgICAgewogICAgICAgICB1aW50MTZf
dCBjbnRsOwogICAgICAgICB1aW50MzJfdCB1bnVzZWQ7CisgICAgICAgIHVuc2lnbmVkIGludCBu
dmVjID0gZW50cnktPm1zaS5udmVjOwogCiAgICAgICAgIHBvcyA9IGVudHJ5LT5tc2lfYXR0cmli
LnBvczsKICAgICAgICAgaWYgKCByZWcgPCBwb3MgfHwgcmVnID49IGVudHJ5LT5tc2kubXBvcyAr
IDggKQpAQCAtMTM0MCw3ICsxMzQxLDcgQEAgaW50IHBjaV9tc2lfY29uZl93cml0ZV9pbnRlcmNl
cHQoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsCiAKICAgICAgICAgY250
bCA9IHBjaV9jb25mX3JlYWQxNihzZWcsIGJ1cywgc2xvdCwgZnVuYywgbXNpX2NvbnRyb2xfcmVn
KHBvcykpOwogICAgICAgICB1bnVzZWQgPSB+KHVpbnQzMl90KTAgPj4gKDMyIC0gbXVsdGlfbXNp
X2NhcGFibGUoY250bCkpOwotICAgICAgICBmb3IgKCBwb3MgPSAwOyBwb3MgPCBlbnRyeS0+bXNp
Lm52ZWM7ICsrcG9zLCArK2VudHJ5ICkKKyAgICAgICAgZm9yICggcG9zID0gMDsgcG9zIDwgbnZl
YzsgKytwb3MsICsrZW50cnkgKQogICAgICAgICB7CiAgICAgICAgICAgICBlbnRyeS0+bXNpX2F0
dHJpYi5ndWVzdF9tYXNrZWQgPQogICAgICAgICAgICAgICAgICpkYXRhID4+IGVudHJ5LT5tc2lf
YXR0cmliLmVudHJ5X25yOwotLSAKMi4yMC4xLjIuZ2IyMWViYjY3MQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
