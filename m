Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16499170976
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 21:25:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j73Ca-0003lN-EM; Wed, 26 Feb 2020 20:22:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j73CY-0003kZ-H8
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 20:22:38 +0000
X-Inumbo-ID: b5c99f1c-58d5-11ea-aba8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5c99f1c-58d5-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 20:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582748548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mp3vTSIoidrYCPhEDJh/tjnLRnewseoGxmOw08frHcw=;
 b=MTZ7PpI89AApJug9ufrGP1CpJtsXRQLipeb2VQe3juUHqY132ohMITcQ
 QDshWLc7OjPjPgw7IegwOJbmFzvn7nfnQfdx3dW+drAkneMG9bGEoM8Eq
 4LLRkFyVHbiVajjJShzLuKM3pXVczRK9p+kTuOKVWWyHqe2n5Z6v+TGqI Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: AejszfvZE+XcYYqkqYKwVEOkhLUKIu8VPp0jacGP93nLGHeLOVlsxKbdlf3R7CC1SKGQkIH2lK
 +FWzux0Hr+M8P2TAwyXOSN47OTI533kvvJPFauRHbIsh8rXiJixjnTv18doDDhIgRmE6+YuNu3
 ugAXVpbf2CUmK9upAJ6STALnJ+d0I696/mjmD5Qzwyd9Cnr0U+HHrItQsY/qaW5enJYkFDM9/d
 mEJQr5yoIoDVihE2Jdi09Usey4rD56cJK8iR1Ni04/F4LqNxEoA78Noj6W4i9uh0R/xPYhRKHk
 AXw=
X-SBRS: 2.7
X-MesageID: 13496575
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,489,1574139600"; d="scan'208";a="13496575"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 20:22:20 +0000
Message-ID: <20200226202221.6555-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200226202221.6555-1-andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 09/10] x86/gen-cpuid: Distinguish default vs max
 in feature annotations
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

QWxsb3cgbG93ZXJjYXNlIGEvcy9oIHRvIGJlIHVzZWQgdG8gYW5ub3RhdGUgYSBub24tZGVmYXVs
dCBmZWF0dXJlLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQogeGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaCB8
IDIgKysKIHhlbi90b29scy9nZW4tY3B1aWQucHkgICAgICAgICAgICAgICAgICAgICAgfCA3ICsr
KystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4Ni9jcHVmZWF0dXJlc2V0Lmgg
Yi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC14ODYvY3B1ZmVhdHVyZXNldC5oCmluZGV4IDA4Njcz
NmFjN2IuLmQ3OWE1M2JlZmUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLXg4
Ni9jcHVmZWF0dXJlc2V0LmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZl
YXR1cmVzZXQuaApAQCAtODcsNiArODcsOCBAQCBlbnVtIHsKICAqICAgJ0EnID0gQWxsIGd1ZXN0
cy4KICAqICAgJ1MnID0gQWxsIEhWTSBndWVzdHMgKG5vdCBQViBndWVzdHMpLgogICogICAnSCcg
PSBIVk0gSEFQIGd1ZXN0cyAobm90IFBWIG9yIEhWTSBTaGFkb3cgZ3Vlc3RzKS4KKyAqICAgVXBw
ZXIgY2FzZSA9PiBBdmFpbGFibGUgYnkgZGVmYXVsdAorICogICBMb3dlciBjYXNlID0+IENhbiBi
ZSBvcHRlZC1pbiB0bywgYnV0IG5vdCBhdmFpbGFibGUgYnkgZGVmYXVsdC4KICAqLwogCiAvKiBJ
bnRlbC1kZWZpbmVkIENQVSBmZWF0dXJlcywgQ1BVSUQgbGV2ZWwgMHgwMDAwMDAwMS5lZHgsIHdv
cmQgMCAqLwpkaWZmIC0tZ2l0IGEveGVuL3Rvb2xzL2dlbi1jcHVpZC5weSBiL3hlbi90b29scy9n
ZW4tY3B1aWQucHkKaW5kZXggYWY1NjEwYTVlNi4uYzE3OGUyNDcwZCAxMDA3NTUKLS0tIGEveGVu
L3Rvb2xzL2dlbi1jcHVpZC5weQorKysgYi94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5CkBAIC0yMyw2
ICsyMyw3IEBAIGRlZiBfX2luaXRfXyhzZWxmLCBpbnB1dCwgb3V0cHV0KToKICAgICAgICAgc2Vs
Zi5yYXcgPSB7CiAgICAgICAgICAgICAnISc6IHNldCgpLAogICAgICAgICAgICAgJ0EnOiBzZXQo
KSwgJ1MnOiBzZXQoKSwgJ0gnOiBzZXQoKSwKKyAgICAgICAgICAgICdhJzogc2V0KCksICdzJzog
c2V0KCksICdoJzogc2V0KCksCiAgICAgICAgIH0KIAogICAgICAgICAjIFN0YXRlIGNhbGN1bGF0
ZWQKQEAgLTEzMyw5ICsxMzQsOSBAQCBkZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOgogICAgIHN0
YXRlLmh2bV9zaGFkb3dfZGVmID0gc3RhdGUucHZfZGVmIHwgc3RhdGUucmF3WydTJ10KICAgICBz
dGF0ZS5odm1faGFwX2RlZiA9IHN0YXRlLmh2bV9zaGFkb3dfZGVmIHwgc3RhdGUucmF3WydIJ10K
IAotICAgIHN0YXRlLnB2X21heCA9IHN0YXRlLnB2X2RlZgotICAgIHN0YXRlLmh2bV9zaGFkb3df
bWF4ID0gc3RhdGUuaHZtX3NoYWRvd19kZWYKLSAgICBzdGF0ZS5odm1faGFwX21heCA9IHN0YXRl
Lmh2bV9oYXBfZGVmCisgICAgc3RhdGUucHZfbWF4ID0gc3RhdGUucmF3WydBJ10gfCBzdGF0ZS5y
YXdbJ2EnXQorICAgIHN0YXRlLmh2bV9zaGFkb3dfbWF4ID0gc3RhdGUucHZfbWF4IHwgc3RhdGUu
cmF3WydTJ10gfCBzdGF0ZS5yYXdbJ3MnXQorICAgIHN0YXRlLmh2bV9oYXBfbWF4ID0gc3RhdGUu
aHZtX3NoYWRvd19tYXggfCBzdGF0ZS5yYXdbJ0gnXSB8IHN0YXRlLnJhd1snaCddCiAKICAgICAj
CiAgICAgIyBGZWF0dXJlIGRlcGVuZGVuY3kgaW5mb3JtYXRpb24uCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
