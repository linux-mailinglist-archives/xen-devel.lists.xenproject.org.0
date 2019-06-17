Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B584B4879F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 17:43:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hctky-0008Lm-FT; Mon, 17 Jun 2019 15:41:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JT4l=UQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hctkw-0008LV-VI
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 15:41:14 +0000
X-Inumbo-ID: 55dec5db-9116-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 55dec5db-9116-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 15:41:13 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wHzjo5RqYzLKZgmX1VIM9WWTH4C7NDFYDFwET3zmDSBfbUJrelHOdOjapYyhMLI+gijdDJCuqB
 dDZHgI7y9qV8b/uxpQ/zfxlISfJStj2t7rcR5U9AANVoikrNhtnHHjFeMySI1DjLHkSf1GPTix
 xA4WZiVvF/njwHXi2io9azkPD8YceIytBmhnC4hfaEGFThbQrW/Fe6jJlf0+BmVTpj1f+dGZUL
 /Gb7dsBHhBMb5kwW+snKEdrybT8WpXmskMLS8xT0ZRQ9bRlUeBOOlhiDAkgvw3MhuXR05qpPV6
 9vg=
X-SBRS: 2.7
X-MesageID: 1838524
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,385,1557201600"; 
   d="scan'208";a="1838524"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 17 Jun 2019 16:41:01 +0100
Message-ID: <20190617154105.32323-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/4] Fix build of Xen support + cleanup
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpGaXggdGhlIGJ1aWxkIGluIG9zc3Rlc3QgYW5kIHNvbWUgY2xlYW51cAoKRm9yIHJlZmVy
ZW5jZToKClJlY2VudCBmbGlnaHQgZmFpbHVyZToKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA2L21zZzAxMDIyLmh0bWwKCkJpc2VjdCBy
ZXN1bHQ6Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAxOS0wNi9tc2cwMTAyOS5odG1sCgpUaGFua3MuCgpBbnRob255IFBFUkFSRCAoNCk6CiAg
eGVuOiBGaXggYnVpbGQgd2l0aCBwdWJsaWMgaGVhZGVycwogIHhlbjogSW1wb3J0IG90aGVyIHhl
bi9pby8qLmgKICB4ZW46IEltcG9ydCBYZW4gcHVibGljIGhlYWRlcnMgdXNlZCBieSB4ZW4taHZt
LmMKICB4ZW46IEF2b2lkIFZMQQoKIGh3LzlwZnMveGVuLTlwZnMuaCAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICA0ICstCiBody9ibG9jay94ZW5fYmxraWYuaCAgICAgICAgICAgICAgICAgICAg
IHwgICAgNSArLQogaHcvY2hhci94ZW5fY29uc29sZS5jICAgICAgICAgICAgICAgICAgICB8ICAg
IDIgKy0KIGh3L2Rpc3BsYXkveGVuZmIuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgICA3ICst
CiBody9pMzg2L3hlbi94ZW4taHZtLmMgICAgICAgICAgICAgICAgICAgIHwgICAxNyArLQogaHcv
aTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMgICAgICAgICAgICAgICB8ICAgIDIgLQogaHcvbmV0L3hl
bl9uaWMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKy0KIGh3L3VzYi94ZW4tdXNi
LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAzICstCiBody94ZW4veGVuLWxlZ2FjeS1i
YWNrZW5kLmMgICAgICAgICAgICAgIHwgICAgMiAtCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2Uv
Z3JhbnRfdGFibGUuaCAgIHwgICAzNiArCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2U4
MjAuaCAgICAgIHwgICAyOCArCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2lvcmVxLmgg
ICAgIHwgIDEwMSArKysKIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9odm0vcGFyYW1zLmggICAg
fCAgIDMzICsKIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9ibGtpZi5oICAgICAgfCAgNzEy
ICsrKysrKysrKysrKysrKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2NvbnNvbGUuaCAg
ICB8ICAgNDYgKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2ZiaWYuaCAgICAgICB8ICAx
NTYgKysrKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2tiZGlmLmggICAgICB8ICA1NjYg
KysrKysrKysrKysrCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vbmV0aWYuaCAgICAgIHwg
MTAxMCArKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8v
cHJvdG9jb2xzLmggIHwgICA0MiArCiBpbmNsdWRlL2h3L3hlbi97ID0+IGludGVyZmFjZX0vaW8v
cmluZy5oIHwgICAgMAogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3VzYmlmLmggICAgICB8
ICAyNTQgKysrKysrCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8veGVuYnVzLmggICAgIHwg
ICA3MCArKwogaW5jbHVkZS9ody94ZW4veGVuX2NvbW1vbi5oICAgICAgICAgICAgICB8ICAgIDIg
Ky0KIDIzIGZpbGVzIGNoYW5nZWQsIDMwNzYgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2dyYW50X3RhYmxl
LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaHZtL2U4MjAu
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9odm0vaW9yZXEu
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9odm0vcGFyYW1z
LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vYmxraWYu
aAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9jb25zb2xl
LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vZmJpZi5o
CiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2tiZGlmLmgK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vbmV0aWYuaAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9wcm90b2NvbHMu
aAogcmVuYW1lIGluY2x1ZGUvaHcveGVuL3sgPT4gaW50ZXJmYWNlfS9pby9yaW5nLmggKDEwMCUp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3VzYmlmLmgK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8veGVuYnVzLmgK
Ci0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
