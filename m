Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA15449F1D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 13:26:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdCDL-0001Uw-OJ; Tue, 18 Jun 2019 11:23:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OpMR=UR=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hdCDJ-0001TZ-T5
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 11:23:45 +0000
X-Inumbo-ID: 884b2f77-91bb-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 884b2f77-91bb-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 11:23:44 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: A2bladOBuTxayASWh72KMp+5U0jfv7eGwE94lJFaZrLMrBPbJs47GsZ2iNT22rCqE0MLJqeXfw
 8KGdqEVAxzPV9RkgmJ3/QHw6MdLyz1fTp2Mx4LUNLZsQzNpyi1ZFR0Xsmj+wgwylE1D47ttfrb
 a8PZ2ZNyk2HDYWFPZHNXRTylP17PkdWIDC+5c1GoF27NKTYHKVmx7UKnL7FMyIh1jzPQZPzcoo
 ut/mHIBjYjGePtycN2FkH2Wvuz1nMilUznEsGTjbnZ0d+VTnker7KF1XEzEX7muRO/aXsycKYS
 jV4=
X-SBRS: 2.7
X-MesageID: 1860620
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,389,1557201600"; 
   d="scan'208";a="1860620"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 18 Jun 2019 12:23:37 +0100
Message-ID: <20190618112341.513-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/4] Fix build of Xen support + cleanup
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
 Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
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
bi9pby8qLmgKICB4ZW46IERyb3AgaW5jbHVkZXMgb2YgeGVuL2h2bS9wYXJhbXMuaAogIHhlbjog
QXZvaWQgVkxBCgogaHcvOXBmcy94ZW4tOXBmcy5oICAgICAgICAgICAgICAgICAgICAgICB8ICAg
IDQgKy0KIGh3L2Jsb2NrL3hlbl9ibGtpZi5oICAgICAgICAgICAgICAgICAgICAgfCAgICA1ICst
CiBody9jaGFyL3hlbl9jb25zb2xlLmMgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQogaHcv
ZGlzcGxheS94ZW5mYi5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDcgKy0KIGh3L2kzODYv
eGVuL3hlbi1odm0uYyAgICAgICAgICAgICAgICAgICAgfCAgIDE2ICstCiBody9pMzg2L3hlbi94
ZW4tbWFwY2FjaGUuYyAgICAgICAgICAgICAgIHwgICAgMiAtCiBody9uZXQveGVuX25pYy5jICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArLQogaHcvdXNiL3hlbi11c2IuYyAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDMgKy0KIGh3L3hlbi94ZW4tbGVnYWN5LWJhY2tlbmQuYyAg
ICAgICAgICAgICAgfCAgICAyIC0KIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9ncmFudF90YWJs
ZS5oICAgfCAgIDM2ICsKIGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9ibGtpZi5oICAgICAg
fCAgNzEyICsrKysrKysrKysrKysrKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2NvbnNv
bGUuaCAgICB8ICAgNDYgKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2ZiaWYuaCAgICAg
ICB8ICAxNTYgKysrKwogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2tiZGlmLmggICAgICB8
ICA1NjYgKysrKysrKysrKysrCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vbmV0aWYuaCAg
ICAgIHwgMTAxMCArKysrKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZh
Y2UvaW8vcHJvdG9jb2xzLmggIHwgICA0MiArCiBpbmNsdWRlL2h3L3hlbi97ID0+IGludGVyZmFj
ZX0vaW8vcmluZy5oIHwgICAgMAogaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3VzYmlmLmgg
ICAgICB8ICAyNTQgKysrKysrCiBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8veGVuYnVzLmgg
ICAgIHwgICA3MCArKwogaW5jbHVkZS9ody94ZW4veGVuX2NvbW1vbi5oICAgICAgICAgICAgICB8
ICAgIDIgKy0KIDIwIGZpbGVzIGNoYW5nZWQsIDI5MTQgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRp
b25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2dyYW50
X3RhYmxlLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8v
YmxraWYuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9j
b25zb2xlLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8v
ZmJpZi5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL2ti
ZGlmLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8vbmV0
aWYuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcveGVuL2ludGVyZmFjZS9pby9wcm90
b2NvbHMuaAogcmVuYW1lIGluY2x1ZGUvaHcveGVuL3sgPT4gaW50ZXJmYWNlfS9pby9yaW5nLmgg
KDEwMCUpCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9ody94ZW4vaW50ZXJmYWNlL2lvL3Vz
YmlmLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2h3L3hlbi9pbnRlcmZhY2UvaW8veGVu
YnVzLmgKCi0tIApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
