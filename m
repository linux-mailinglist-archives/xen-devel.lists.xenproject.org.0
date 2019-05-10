Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407BD1A300
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 20:31:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPAFh-0006vm-59; Fri, 10 May 2019 18:28:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hPAFf-0006vX-Nk
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 18:28:11 +0000
X-Inumbo-ID: 5d84b725-7351-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5d84b725-7351-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 18:28:11 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,454,1549929600"; d="scan'208";a="85337738"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 10 May 2019 19:28:04 +0100
Message-ID: <1557512884-32395-5-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] xen/watchdog: Support disable all watchdog
 timers in one go
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>,
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rm9yIGEgZG9tYWluIHdoaWNoIGhhcyBiZWVuIHVzaW5nIHdhdGNoZG9ncywgYnV0IHdhbnRzIHRv
IGNsZWFubHkgcmVib290LApzdG9wcGluZyBhbGwgYWN0aXZlIHRpbWVycyBpcyBuZWNlc3Nhcnkg
dG8gYXZvaWQgY3Jhc2hpbmcgbGF0ZSBkdXJpbmcKc2h1dGRvd24uCgpUaGUgbnVtYmVyIG9mIHdh
dGNoZG9ncyBpc24ndCBwYXJ0IG9mIFhlbidzIEFCSSwgc28gdG8gc2ltcGxpZnkgY2xlYW51cCBh
bmQKZXJyb3IgaGFuZGxpbmcgbG9naWMsIHN1cHBvcnQgdXNpbmcgaWQgPSAwLCB0aW1lb3V0ID0g
MCB0byBkZWFjdGl2YXRlIGFsbAp0aW1lcnMgaW4gb25lIGdvLgoKU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpD
QzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkNDOiBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNDOiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgpDQzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRy
aXguY29tPgpDQzogRWR3aW4gVMO2csO2ayA8ZWR2aW4udG9yb2tAY2l0cml4LmNvbT4KQ0M6IENo
cmlzdGlhbiBMaW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KQ0M6IFBhdSBSdWl6
IFNhZm9udCA8cGF1LnNhZm9udEBjaXRyaXguY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUu
YyAgICAgIHwgOSArKysrKysrKy0KIHhlbi9pbmNsdWRlL3B1YmxpYy9zY2hlZC5oIHwgNiArKysr
LS0KIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMK
aW5kZXggOThjMmMzNS4uMjg0ZjY1NyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5j
CisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtMTA2Niw3ICsxMDY2LDcgQEAgc3RhdGlj
IGxvbmcgZG9tYWluX3dhdGNoZG9nKHN0cnVjdCBkb21haW4gKmQsIHVpbnQzMl90IGlkLCB1aW50
MzJfdCB0aW1lb3V0KQogICAgICAgICAgICAgZ290byB1bmxvY2s7CiAgICAgICAgIH0KICAgICB9
Ci0gICAgZWxzZSAvKiBBbGxvY2F0ZSB0aGUgbmV4dCBhdmFpbGFibGUgdGltZXIuICovCisgICAg
ZWxzZSBpZiAoIHRpbWVvdXQgKSAvKiBBbGxvY2F0ZSB0aGUgbmV4dCBhdmFpbGFibGUgdGltZXIu
ICovCiAgICAgewogICAgICAgICBpZCA9IGZmcyh+ZC0+d2F0Y2hkb2dfaW51c2VfbWFwKSAtIDE7
CiAKQEAgLTEwNzksNiArMTA3OSwxMyBAQCBzdGF0aWMgbG9uZyBkb21haW5fd2F0Y2hkb2coc3Ry
dWN0IGRvbWFpbiAqZCwgdWludDMyX3QgaWQsIHVpbnQzMl90IHRpbWVvdXQpCiAgICAgICAgIF9f
c2V0X2JpdChpZCwgJmQtPndhdGNoZG9nX2ludXNlX21hcCk7CiAgICAgICAgIHJjID0gaWQgKyAx
OwogICAgIH0KKyAgICBlbHNlIC8qIGlkIDAsIHRpbWVvdXQgMCA9PiBkaXNhYmxlIGFsbCB0aW1l
cnMuICovCisgICAgeworICAgICAgICBkLT53YXRjaGRvZ19pbnVzZV9tYXAgPSAwOworICAgICAg
ICBmb3IgKCA7IGlkIDwgTlJfRE9NQUlOX1dBVENIRE9HX1RJTUVSUzsgKytpZCApCisgICAgICAg
ICAgICBzdG9wX3RpbWVyKCZkLT53YXRjaGRvZ190aW1lcltpZF0pOworICAgICAgICBnb3RvIHVu
bG9jazsKKyAgICB9CiAKICAgICAvKiAocmUtKWFybSwgb3IgY2xlYXIgYSBzcGVjaWZpYyB0aW1l
ci4gKi8KICAgICBpZiAoIHVubGlrZWx5KHRpbWVvdXQgPT0gMCkgKQpkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUvcHVibGljL3NjaGVkLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvc2NoZWQuaAppbmRl
eCA4MTFiZDg3Li45OTRhMGU1IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvc2NoZWQu
aAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvc2NoZWQuaApAQCAtMTEyLDggKzExMiwxMCBAQAog
LyoKICAqIFNldHVwLCBwb2tlIGFuZCBkZXN0cm95IGEgZG9tYWluIHdhdGNoZG9nIHRpbWVyLgog
ICogQGFyZyA9PSBwb2ludGVyIHRvIHNjaGVkX3dhdGNoZG9nX3Qgc3RydWN0dXJlLgotICogV2l0
aCBpZCA9PSAwLCBzZXR1cCBhIGRvbWFpbiB3YXRjaGRvZyB0aW1lciB0byBjYXVzZSBkb21haW4g
c2h1dGRvd24KLSAqICAgICAgICAgICAgICAgYWZ0ZXIgdGltZW91dCwgcmV0dXJucyB3YXRjaGRv
ZyBpZC4KKyAqIFdpdGggaWQgPT0gMCBhbmQgdGltZW91dCAhPSAwLCBzZXR1cCBhIGRvbWFpbiB3
YXRjaGRvZyB0aW1lciB0byBjYXVzZQorICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGRvbWFpbiBzaHV0ZG93biBhZnRlciB0aW1lb3V0LCByZXR1cm5zCisgKiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgd2F0Y2hkb2cgaWQuCisgKiBXaXRoIGlkID09IDAgYW5kIHRpbWVv
dXQgPT0gMCwgZGVzdHJveSBhbGwgd2F0Y2hkb2cgdGltZXJzLgogICogV2l0aCBpZCAhPSAwIGFu
ZCB0aW1lb3V0ID09IDAsIGRlc3Ryb3kgZG9tYWluIHdhdGNoZG9nIHRpbWVyLgogICogV2l0aCBp
ZCAhPSAwIGFuZCB0aW1lb3V0ICE9IDAsIHBva2Ugd2F0Y2hkb2cgdGltZXIgYW5kIHNldCBuZXcg
dGltZW91dC4KICAqLwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
