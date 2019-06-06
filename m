Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F28376B0
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 16:29:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYtLg-0006TK-1J; Thu, 06 Jun 2019 14:26:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JKzC=UF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hYtLe-0006TF-R1
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 14:26:34 +0000
X-Inumbo-ID: 14f2e1b2-8867-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 14f2e1b2-8867-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 14:26:33 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vV/4gN45zAQzaDeNGblsMm4v+dWwaANbglLDQtRNiajQygL/p1wft+Jt0Wyu4kCr5nLIBWYsS3
 3LWP+ighn3ZI70Ds9nBRPWdvI26kMYhZO+HKkCWOXQQLZ2635PYXsxqvRjt3nzdgEpiPHv2pop
 WWZCOLE/UFHHS1RR8/egaThm+XoTUthYouJgZxyRaWkWn+u9lA6rBXC+sPYi8JUJoLk2TQCoAO
 1GxsclvBMRsmKMN+QRS9AoJTS3s8uv34JMZrL7PVpAFLY3U8aeWK92Qr5+ui0iR46wfpu8DpV5
 NTk=
X-SBRS: -0.9
X-MesageID: 1399668
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1399668"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 6 Jun 2019 15:26:29 +0100
Message-ID: <1559831189-26103-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/irq: Fix undefined behaviour in
 irq_move_cleanup_interrupt()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VUJTQU4gcmVwb3J0czoKCiAgKFhFTikgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KICAoWEVOKSBV
QlNBTjogVW5kZWZpbmVkIGJlaGF2aW91ciBpbiBpcnEuYzo2ODI6MjIKICAoWEVOKSBsZWZ0IHNo
aWZ0IG9mIDEgYnkgMzEgcGxhY2VzIGNhbm5vdCBiZSByZXByZXNlbnRlZCBpbiB0eXBlICdpbnQn
CiAgKFhFTikgLS0tLVsgWGVuLTQuMTMtdW5zdGFibGUgIHg4Nl82NCAgZGVidWc9eSAgIE5vdCB0
YWludGVkIF0tLS0tCiAgKFhFTikgQ1BVOiAgICAxNgogIChYRU4pIFJJUDogICAgZTAwODpbPGZm
ZmY4MmQwODAyYTU0Y2U+XSB1YnNhbi5jI3Vic2FuX2VwaWxvZ3VlKzB4YS8weGMyCiAgPHNuaXA+
CiAgKFhFTikgWGVuIGNhbGwgdHJhY2U6CiAgKFhFTikgICAgWzxmZmZmODJkMDgwMmE1NGNlPl0g
dWJzYW4uYyN1YnNhbl9lcGlsb2d1ZSsweGEvMHhjMgogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDJh
NjAwOT5dIF9fdWJzYW5faGFuZGxlX3NoaWZ0X291dF9vZl9ib3VuZHMrMHgxNWQvMHgxNmMKICAo
WEVOKSAgICBbPGZmZmY4MmQwODAzMWFlNzc+XSBpcnFfbW92ZV9jbGVhbnVwX2ludGVycnVwdCsw
eDI1Yy8weDRhMAogIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMxYjU4NT5dIGRvX0lSUSsweDE5ZC8w
eDEwNGMKICAoWEVOKSAgICBbPGZmZmY4MmQwODA1MGM4YmE+XSBjb21tb25faW50ZXJydXB0KzB4
MTBhLzB4MTIwCiAgKFhFTikgICAgWzxmZmZmODJkMDgwM2IxM2E2Pl0gY3B1X2lkbGUuYyNhY3Bp
X2lkbGVfZG9fZW50cnkrMHgxZGUvMHgyNGIKICAoWEVOKSAgICBbPGZmZmY4MmQwODAzYjFkODM+
XSBjcHVfaWRsZS5jI2FjcGlfcHJvY2Vzc29yX2lkbGUrMHg1YzgvMHg5NGUKICAoWEVOKSAgICBb
PGZmZmY4MmQwODAyZmE4ZDY+XSBkb21haW4uYyNpZGxlX2xvb3ArMHhlZS8weDEwMQogIChYRU4p
CiAgKFhFTikgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KClN3aXRjaCB0byBhbiB1bnNpZ25lZCBz
aGlmdCwgYW5kIGNvcnJlY3QgdGhlIHN1cnJvdW5kaW5nIHN0eWxlLgoKU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1
bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2ly
cS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaXJxLmMgYi94ZW4vYXJjaC94ODYvaXJxLmMK
aW5kZXggZDY0NTFhOS4uNjg0N2ZiNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2lycS5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwpAQCAtNjc5LDcgKzY3OSw4IEBAIHZvaWQgaXJxX21vdmVf
Y2xlYW51cF9pbnRlcnJ1cHQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAgICAgICAq
IG5leHQgYXR0ZW1wdCBieSBzZW5kaW5nIGFub3RoZXIgSVJRX01PVkVfQ0xFQU5VUF9WRUNUT1IK
ICAgICAgICAgICogdG8gbXlzZWxmLgogICAgICAgICAgKi8KLSAgICAgICAgaWYgKGlyciAgJiAo
MSA8PCAodmVjdG9yICUgMzIpKSkgeworICAgICAgICBpZiAoIGlyciAmICgxdSA8PCAodmVjdG9y
ICUgMzIpKSApCisgICAgICAgIHsKICAgICAgICAgICAgIHNlbmRfSVBJX3NlbGYoSVJRX01PVkVf
Q0xFQU5VUF9WRUNUT1IpOwogICAgICAgICAgICAgVFJBQ0VfM0QoVFJDX0hXX0lSUV9NT1ZFX0NM
RUFOVVBfREVMQVksCiAgICAgICAgICAgICAgICAgICAgICBpcnEsIHZlY3Rvciwgc21wX3Byb2Nl
c3Nvcl9pZCgpKTsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
