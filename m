Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B5248348
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 14:57:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcr9q-0002Lk-Qi; Mon, 17 Jun 2019 12:54:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ct8y=UQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hcr9o-0002Lf-Nb
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 12:54:44 +0000
X-Inumbo-ID: 1396042f-90ff-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1396042f-90ff-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 12:54:43 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PLSOq16NuV9vyrTibMrM2sT10ts7W+SDnc76MZHBG4CbMxsleI+xpkCSDqRzLZ7GiDE3aXXX3E
 F64IGkogs2+FkkrO1DWCoxzsrtzOqhSgCOjNs2Mkvsn3aEKY1kWTKItkeukAFX6c+b8wwXHM+5
 h27zDklHo0wIu0738P37LUro88u6d3zc4FE/KtD3IRqG+DM1vRMMizQ+fd0QeAok9J/YPwwBzq
 rI04K5Fb1T5JpAvujHzGybeaIfZIrI2gBVqD15pQcDGOWTE7ZZ52oW4F0GVzqFw5JiHbpXG5wA
 9Ic=
X-SBRS: 2.7
X-MesageID: 1819360
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1819360"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 17 Jun 2019 13:54:39 +0100
Message-ID: <1560776079-9866-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/svm: Fix svm_vmcb_dump() when used in
 current context
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
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Vk1FeGl0IGRvZXNuJ3Qgc3dpdGNoIGFsbCBzdGF0ZS4gIFRoZSBGUy9HUy9UUy9MRFRSL0dTQkFT
RSBzZWdtZW50CmluZm9ybWF0aW9uLCBhbmQgU1lTQ0FMTC9TWVNFTlRFUiBNU1JzIG1heSBzdGls
bCBiZSBjYWNoZWQgaW4gaGFyZHdhcmUsIHJhdGhlcgp0aGFuIHVwLXRvLWRhdGUgaW4gdGhlIFZN
Q0IuCgpFeHBvcnQgc3ZtX3N5bmNfdm1jYigpIHZpYSBzdm1kZWJ1Zy5oIHNvIHN2bV92bWNiX2R1
bXAoKSBjYW4gdXNlIGl0LCBhbmQgYnJpbmcKdGhlIFZNQ0IgaW50byBzeW5jIGluIGN1cnJlbnQg
Y29udGV4dC4KCkFzIGEgbWlub3Igb3B0aW1pc2F0aW9uLCBzd2l0Y2ggc3ZtX3N5bmNfdm1jYigp
IHRvIHVzZSBzdm1fdm17bG9hZCxzYXZlfV9wYSgpLAphcyBzdm0tPnZtY2JfcGEgaXMgYWx3YXlz
IGluIGNvcnJlY3QsIGFuZCB0aGlzIGF2b2lkcyBhIHJlZHVuZGFudCBfX3BhKCkKdHJhbnNsYXRp
b24gYmVoaW5kIHRoZSBzY2VuZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNsZS5jb20+CkNDOiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5p
dEBhbWQuY29tPgpDQzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMgICAgICAgICAgICAgfCA2ICsrKy0tLQogeGVuL2FyY2gv
eDg2L2h2bS9zdm0vc3ZtZGVidWcuYyAgICAgICAgfCA5ICsrKysrKysrKwogeGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vc3ZtL3N2bWRlYnVnLmggfCAxICsKIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZt
L3N2bS9zdm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCmluZGV4IGNkNmE2YjMuLjBl
YWM5Y2UgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL3N2bS5jCkBAIC02MjcsMjEgKzYyNywyMSBAQCBzdGF0aWMgdm9pZCBz
dm1fY3B1aWRfcG9saWN5X2NoYW5nZWQoc3RydWN0IHZjcHUgKnYpCiAgICAgICAgICAgICAgICAg
ICAgICAgY3AtPmV4dGQuaWJwYiA/IE1TUl9JTlRFUkNFUFRfTk9ORSA6IE1TUl9JTlRFUkNFUFRf
UlcpOwogfQogCi1zdGF0aWMgdm9pZCBzdm1fc3luY192bWNiKHN0cnVjdCB2Y3B1ICp2LCBlbnVt
IHZtY2Jfc3luY19zdGF0ZSBuZXdfc3RhdGUpCit2b2lkIHN2bV9zeW5jX3ZtY2Ioc3RydWN0IHZj
cHUgKnYsIGVudW0gdm1jYl9zeW5jX3N0YXRlIG5ld19zdGF0ZSkKIHsKICAgICBzdHJ1Y3Qgc3Zt
X3ZjcHUgKnN2bSA9ICZ2LT5hcmNoLmh2bS5zdm07CiAKICAgICBpZiAoIG5ld19zdGF0ZSA9PSB2
bWNiX25lZWRzX3Ztc2F2ZSApCiAgICAgewogICAgICAgICBpZiAoIHN2bS0+dm1jYl9zeW5jX3N0
YXRlID09IHZtY2JfbmVlZHNfdm1sb2FkICkKLSAgICAgICAgICAgIHN2bV92bWxvYWQoc3ZtLT52
bWNiKTsKKyAgICAgICAgICAgIHN2bV92bWxvYWRfcGEoc3ZtLT52bWNiX3BhKTsKIAogICAgICAg
ICBzdm0tPnZtY2Jfc3luY19zdGF0ZSA9IG5ld19zdGF0ZTsKICAgICB9CiAgICAgZWxzZQogICAg
IHsKICAgICAgICAgaWYgKCBzdm0tPnZtY2Jfc3luY19zdGF0ZSA9PSB2bWNiX25lZWRzX3Ztc2F2
ZSApCi0gICAgICAgICAgICBzdm1fdm1zYXZlKHN2bS0+dm1jYik7CisgICAgICAgICAgICBzdm1f
dm1zYXZlX3BhKHN2bS0+dm1jYl9wYSk7CiAKICAgICAgICAgaWYgKCBzdm0tPnZtY2Jfc3luY19z
dGF0ZSAhPSB2bWNiX25lZWRzX3ZtbG9hZCApCiAgICAgICAgICAgICBzdm0tPnZtY2Jfc3luY19z
dGF0ZSA9IG5ld19zdGF0ZTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bWRl
YnVnLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm1kZWJ1Zy5jCmluZGV4IGQzNWU0MDUuLjQy
OTNkOGQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bWRlYnVnLmMKKysrIGIv
eGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtZGVidWcuYwpAQCAtMjksNiArMjksMTUgQEAgc3RhdGlj
IHZvaWQgc3ZtX2R1bXBfc2VsKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IHN0cnVjdCBzZWdtZW50
X3JlZ2lzdGVyICpzKQogCiB2b2lkIHN2bV92bWNiX2R1bXAoY29uc3QgY2hhciAqZnJvbSwgY29u
c3Qgc3RydWN0IHZtY2Jfc3RydWN0ICp2bWNiKQogeworICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0g
Y3VycmVudDsKKworICAgIC8qCisgICAgICogSWYgd2UgYXJlIGR1bXBpbmcgdGhlIFZNQ0IgY3Vy
cmVudGx5IGluIGNvbnRleHQsIHNvbWUgZ3Vlc3Qgc3RhdGUgbWF5CisgICAgICogc3RpbGwgYmUg
Y2FjaGVkIGluIGhhcmR3YXJlLiAgUmV0cmlldmUgaXQuCisgICAgICovCisgICAgaWYgKCB2bWNi
ID09IGN1cnItPmFyY2guaHZtLnN2bS52bWNiICkKKyAgICAgICAgc3ZtX3N5bmNfdm1jYihjdXJy
LCB2bWNiX2luX3N5bmMpOworCiAgICAgcHJpbnRrKCJEdW1waW5nIGd1ZXN0J3MgY3VycmVudCBz
dGF0ZSBhdCAlcy4uLlxuIiwgZnJvbSk7CiAgICAgcHJpbnRrKCJTaXplIG9mIFZNQ0IgPSAlenUs
IHBhZGRyID0gJSJQUklwYWRkciIsIHZhZGRyID0gJXBcbiIsCiAgICAgICAgICAgIHNpemVvZihz
dHJ1Y3Qgdm1jYl9zdHJ1Y3QpLCB2aXJ0X3RvX21hZGRyKHZtY2IpLCB2bWNiKTsKZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS9zdm1kZWJ1Zy5oIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9odm0vc3ZtL3N2bWRlYnVnLmgKaW5kZXggNjU4Y2RkMy4uMzMwYzFkOSAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3N2bWRlYnVnLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vc3ZtL3N2bWRlYnVnLmgKQEAgLTIyLDYgKzIyLDcgQEAKICNpbmNs
dWRlIDxhc20vdHlwZXMuaD4KICNpbmNsdWRlIDxhc20vaHZtL3N2bS92bWNiLmg+CiAKK3ZvaWQg
c3ZtX3N5bmNfdm1jYihzdHJ1Y3QgdmNwdSAqdiwgZW51bSB2bWNiX3N5bmNfc3RhdGUgbmV3X3N0
YXRlKTsKIHZvaWQgc3ZtX3ZtY2JfZHVtcChjb25zdCBjaGFyICpmcm9tLCBjb25zdCBzdHJ1Y3Qg
dm1jYl9zdHJ1Y3QgKnZtY2IpOwogYm9vbCBzdm1fdm1jYl9pc3ZhbGlkKGNvbnN0IGNoYXIgKmZy
b20sIGNvbnN0IHN0cnVjdCB2bWNiX3N0cnVjdCAqdm1jYiwKICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBzdHJ1Y3QgdmNwdSAqdiwgYm9vbCB2ZXJib3NlKTsKLS0gCjIuMS40CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
