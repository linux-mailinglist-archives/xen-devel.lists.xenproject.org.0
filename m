Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8566ADAD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 19:32:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnRFJ-0008MT-S3; Tue, 16 Jul 2019 17:28:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WCCO=VN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hnRFI-0008MN-Ab
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 17:28:08 +0000
X-Inumbo-ID: 115ffe5e-a7ef-11e9-be88-fba00a10b651
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 115ffe5e-a7ef-11e9-be88-fba00a10b651;
 Tue, 16 Jul 2019 17:28:04 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Qbv/xuPp/m2PlX63F33rRKOmiJj+2jq/t5PuFsb+XpS/RYB4i/A1QT+N8roUlVVE2jgFTTzL06
 x4izIbgBmTeEFoJwypd901xGPJvy4rCAGUAnpI864pFEsof5h+23j6F+Fy1l7+zpbReiS1Hb6B
 imydqFnOjNx/1HvpybGCkRR4lB/3Fe0hmt0K3DrtbXrQzP58YT5J3NkPgdICoKsPQ7r5z+dDO3
 3CDhnGFXwE+UcpuoSXVI9L7UTgtaVadZUZzhcjCqdKjkljK0FlvGuE5W53hgCwxLtRaK4HQwyn
 ZBw=
X-SBRS: 2.7
X-MesageID: 3094588
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,499,1557201600"; 
   d="scan'208";a="3094588"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 16 Jul 2019 18:28:01 +0100
Message-ID: <20190716172801.11518-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/mm: Provide more useful information in
 diagnostics
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ICogYWxsb2NfbD9fdGFibGUoKSBzaG91bGQgaWRlbnRpZnkgdGhlIGZhaWx1cmUsIG5vdCBqdXN0
IHN0YXRlIHRoYXQgdGhlcmUgaXMKICAgb25lLgogKiBnZXRfcGFnZSgpIHNob3VsZCB1c2UgJXBk
IGZvciB0aGUgdHdvIGRvbWFpbnMsIHRvIHJlbmRlciBzeXN0ZW0gZG9tYWlucyBpbgogICBhIG1v
cmUgb2J2aW91cyB3YXkuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4K
Q0M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0uYyB8IDE2ICsrKysrKysr
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRl
eCAxMzg2NjJlNzc3Li4wZjA3NjFkNjI0IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYwor
KysgYi94ZW4vYXJjaC94ODYvbW0uYwpAQCAtMTQwNyw3ICsxNDA3LDggQEAgc3RhdGljIGludCBh
bGxvY19sMV90YWJsZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQogICAgIHJldHVybiAwOwogCiAg
ZmFpbDoKLSAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywgIkZhaWx1cmUgaW4gYWxsb2NfbDFf
dGFibGU6IHNsb3QgJSN4XG4iLCBpKTsKKyAgICBnZHByaW50ayhYRU5MT0dfV0FSTklORywKKyAg
ICAgICAgICAgICAiRmFpbHVyZSBpbiBhbGxvY19sMV90YWJsZTogc2xvdCAlI3gsIHJldCAlZFxu
IiwgaSwgcmV0KTsKICBvdXQ6CiAgICAgd2hpbGUgKCBpLS0gPiAwICkKICAgICAgICAgcHV0X3Bh
Z2VfZnJvbV9sMWUocGwxZVtpXSwgZCk7CkBAIC0xNTA1LDcgKzE1MDYsOCBAQCBzdGF0aWMgaW50
IGFsbG9jX2wyX3RhYmxlKHN0cnVjdCBwYWdlX2luZm8gKnBhZ2UsIHVuc2lnbmVkIGxvbmcgdHlw
ZSkKICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICggcmMgPCAwICYmIHJjICE9IC1FSU5UUiAp
CiAgICAgICAgIHsKLSAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiRmFpbHVy
ZSBpbiBhbGxvY19sMl90YWJsZTogc2xvdCAlI3hcbiIsIGkpOworICAgICAgICAgICAgZ2Rwcmlu
dGsoWEVOTE9HX1dBUk5JTkcsCisgICAgICAgICAgICAgICAgICAgICAiRmFpbHVyZSBpbiBhbGxv
Y19sMl90YWJsZTogc2xvdCAlI3gsIHJjICVkXG4iLCBpLCByYyk7CiAgICAgICAgICAgICBpZiAo
IGkgKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIHBhZ2UtPm5yX3ZhbGlkYXRlZF9w
dGVzID0gaTsKQEAgLTE1OTksNyArMTYwMSw4IEBAIHN0YXRpYyBpbnQgYWxsb2NfbDNfdGFibGUo
c3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKICAgICAgICAgcmMgPSAtRUlOVkFMOwogICAgIGlmICgg
cmMgPCAwICYmIHJjICE9IC1FUkVTVEFSVCAmJiByYyAhPSAtRUlOVFIgKQogICAgIHsKLSAgICAg
ICAgZ2RwcmludGsoWEVOTE9HX1dBUk5JTkcsICJGYWlsdXJlIGluIGFsbG9jX2wzX3RhYmxlOiBz
bG90ICUjeFxuIiwgaSk7CisgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLAorICAgICAg
ICAgICAgICAgICAiRmFpbHVyZSBpbiBhbGxvY19sM190YWJsZTogc2xvdCAlI3gsIHJjICVkXG4i
LCBpLCByYyk7CiAgICAgICAgIGlmICggaSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHBhZ2Ut
Pm5yX3ZhbGlkYXRlZF9wdGVzID0gaTsKQEAgLTE3NjcsNyArMTc3MCw3IEBAIHN0YXRpYyBpbnQg
YWxsb2NfbDRfdGFibGUoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkKICAgICAgICAgewogICAgICAg
ICAgICAgaWYgKCByYyAhPSAtRUlOVFIgKQogICAgICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxP
R19XQVJOSU5HLAotICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsdXJlIGluIGFsbG9jX2w0
X3RhYmxlOiBzbG90ICUjeFxuIiwgaSk7CisgICAgICAgICAgICAgICAgICAgICAgICAgIkZhaWx1
cmUgaW4gYWxsb2NfbDRfdGFibGU6IHNsb3QgJSN4LCByYyAlZFxuIiwgaSwgcmMpOwogICAgICAg
ICAgICAgaWYgKCBpICkKICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICBwYWdlLT5ucl92
YWxpZGF0ZWRfcHRlcyA9IGk7CkBAIC0yNDgyLDkgKzI0ODUsOCBAQCBpbnQgZ2V0X3BhZ2Uoc3Ry
dWN0IHBhZ2VfaW5mbyAqcGFnZSwgc3RydWN0IGRvbWFpbiAqZG9tYWluKQogCiAgICAgaWYgKCAh
cGFnaW5nX21vZGVfcmVmY291bnRzKGRvbWFpbikgJiYgIWRvbWFpbi0+aXNfZHlpbmcgKQogICAg
ICAgICBncHJpbnRrKFhFTkxPR19JTkZPLAotICAgICAgICAgICAgICAgICJFcnJvciBtZm4gJSJQ
UklfbWZuIjogcmQ9JWQgb2Q9JWQgY2FmPSUwOGx4IHRhZj0lIiBQUnR5cGVfaW5mbyAiXG4iLAot
ICAgICAgICAgICAgICAgIG1mbl94KHBhZ2VfdG9fbWZuKHBhZ2UpKSwgZG9tYWluLT5kb21haW5f
aWQsCi0gICAgICAgICAgICAgICAgb3duZXIgPyBvd25lci0+ZG9tYWluX2lkIDogRE9NSURfSU5W
QUxJRCwKKyAgICAgICAgICAgICAgICAiRXJyb3IgbWZuICUiUFJJX21mbiI6IHJkPSVwZCBvZD0l
cGQgY2FmPSUwOGx4IHRhZj0lIlBSdHlwZV9pbmZvIlxuIiwKKyAgICAgICAgICAgICAgICBtZm5f
eChwYWdlX3RvX21mbihwYWdlKSksIGRvbWFpbiwgb3duZXIsCiAgICAgICAgICAgICAgICAgcGFn
ZS0+Y291bnRfaW5mbyAtICEhb3duZXIsIHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvKTsKIAogICAg
IGlmICggb3duZXIgKQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
