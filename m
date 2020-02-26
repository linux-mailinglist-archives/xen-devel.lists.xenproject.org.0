Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99217098A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 21:26:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j73Ce-0003ni-Oe; Wed, 26 Feb 2020 20:22:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j73Cd-0003mD-0I
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 20:22:43 +0000
X-Inumbo-ID: b595a90a-58d5-11ea-94dc-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b595a90a-58d5-11ea-94dc-12813bfff9fa;
 Wed, 26 Feb 2020 20:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582748548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OEZtdx2fk/4Ziy8SwPLeKsxlKT/7PZqtGcFqzT6kEz4=;
 b=CX+9O4Hd8eznDi5enc3mhXg1/w+np9LeOm3fEk5Bn3i0csxDRaT6nsOz
 LtTG0/2lpthEIjesbCEIOlwt7zRlEUPIAtZYsMcJWnh7Dys95YLZ/rxah
 72cZiCTnofmGoE4tvucvW2mVkp3c6K8uVjVOmjFxuA4NZnfR5kU2pUOIS 8=;
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
IronPort-SDR: s0SWoYFh7DFgFmCvfQgTEFWJ7ehGrZlV5SO68Yx7/X0nRHaH1KVC3Xs15ltF1RYzUBHH9otoae
 fEBxvssTSM9YfxmtUgOFXRs0Hwl4jlwM98+xiW2jCd7XkRT1h5LmbngYaLjoIbwEkwsFY2zTuJ
 t46mi1N6HL4O+AN3xiy+ncWPiNSNzbpp2xB8+Mx45W9Dn8IcrJazOS7GyX4or1/27AbppV+PyQ
 odGkGeuwo5ucoJ809dA/XNrN3pJNJAy+pLjlGxBdJ2pEdlvc4rZ+fmlgxbbPd+8OQCSI3LVgVo
 AO8=
X-SBRS: 2.7
X-MesageID: 13496574
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,489,1574139600"; d="scan'208";a="13496574"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 20:22:18 +0000
Message-ID: <20200226202221.6555-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200226202221.6555-1-andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 07/10] x86/cpuid: Compile out unused
 logic/objects
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

Q1BVSUQgUG9saWN5IG9iamVjdHMgYXJlIGxhcmdlICgxODYwIGJ5dGVzIGF0IHRoZSB0aW1lIG9m
IHdyaXRpbmcpLCBzbwpjb21waWxpbmcgdGhlbSBvdXQgYmFzZWQgb24gQ09ORklHX3tQVixIVk19
IG1ha2VzIGEgbG90IG9mIHNlbnNlLgoKVGhpcyBpbnZvbHZlcyBhIGJpdCBvZiBjb21wbGV4aXR5
IGluIGluaXRfZG9tYWluX2NwdWlkX3BvbGljeSgpIGFuZApyZWNhbGN1bGF0ZV9jcHVpZF9wb2xp
Y3koKSBhcyBpc19wdl9kb21haW4oKSBjYW4ndCBiZSBldmF1bGF0ZWQgYXQgY29tcGlsZQp0aW1l
LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3
bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQogeGVuL2FyY2gveDg2L2NwdWlkLmMgfCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDE0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHVpZC5jIGIveGVuL2Fy
Y2gveDg2L2NwdWlkLmMKaW5kZXggNTQ2YWUzMWJiOS4uY2Q5YTAyMTQzYyAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2NwdWlkLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdWlkLmMKQEAgLTk1LDEw
ICs5NSwxNCBAQCBzdGF0aWMgdm9pZCB6ZXJvX2xlYXZlcyhzdHJ1Y3QgY3B1aWRfbGVhZiAqbCwK
ICAgICBtZW1zZXQoJmxbZmlyc3RdLCAwLCBzaXplb2YoKmwpICogKGxhc3QgLSBmaXJzdCArIDEp
KTsKIH0KIAotc3RydWN0IGNwdWlkX3BvbGljeSBfX3JlYWRfbW9zdGx5IHJhd19jcHVpZF9wb2xp
Y3ksCi0gICAgX19yZWFkX21vc3RseSBob3N0X2NwdWlkX3BvbGljeSwKLSAgICBfX3JlYWRfbW9z
dGx5IHB2X21heF9jcHVpZF9wb2xpY3ksCi0gICAgX19yZWFkX21vc3RseSBodm1fbWF4X2NwdWlk
X3BvbGljeTsKK3N0cnVjdCBjcHVpZF9wb2xpY3kgX19yZWFkX21vc3RseSAgICAgcmF3X2NwdWlk
X3BvbGljeSwKKyAgICAgICAgICAgICAgICAgICAgX19yZWFkX21vc3RseSAgICBob3N0X2NwdWlk
X3BvbGljeTsKKyNpZmRlZiBDT05GSUdfUFYKK3N0cnVjdCBjcHVpZF9wb2xpY3kgX19yZWFkX21v
c3RseSAgcHZfbWF4X2NwdWlkX3BvbGljeTsKKyNlbmRpZgorI2lmZGVmIENPTkZJR19IVk0KK3N0
cnVjdCBjcHVpZF9wb2xpY3kgX19yZWFkX21vc3RseSBodm1fbWF4X2NwdWlkX3BvbGljeTsKKyNl
bmRpZgogCiBzdGF0aWMgdm9pZCBzYW5pdGlzZV9mZWF0dXJlc2V0KHVpbnQzMl90ICpmcykKIHsK
QEAgLTM4NCw5ICszODgsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY2FsY3VsYXRlX2h2bV9tYXhf
cG9saWN5KHZvaWQpCiAgICAgdW5zaWduZWQgaW50IGk7CiAgICAgY29uc3QgdWludDMyX3QgKmh2
bV9mZWF0dXJlbWFzazsKIAotICAgIGlmICggIWh2bV9lbmFibGVkICkKLSAgICAgICAgcmV0dXJu
OwotCiAgICAgKnAgPSBob3N0X2NwdWlkX3BvbGljeTsKICAgICBjcHVpZF9wb2xpY3lfdG9fZmVh
dHVyZXNldChwLCBodm1fZmVhdHVyZXNldCk7CiAKQEAgLTQ0Myw4ICs0NDQsMTIgQEAgdm9pZCBf
X2luaXQgaW5pdF9ndWVzdF9jcHVpZCh2b2lkKQogewogICAgIGNhbGN1bGF0ZV9yYXdfcG9saWN5
KCk7CiAgICAgY2FsY3VsYXRlX2hvc3RfcG9saWN5KCk7Ci0gICAgY2FsY3VsYXRlX3B2X21heF9w
b2xpY3koKTsKLSAgICBjYWxjdWxhdGVfaHZtX21heF9wb2xpY3koKTsKKworICAgIGlmICggSVNf
RU5BQkxFRChDT05GSUdfUFYpICkKKyAgICAgICAgY2FsY3VsYXRlX3B2X21heF9wb2xpY3koKTsK
KworICAgIGlmICggaHZtX2VuYWJsZWQgKQorICAgICAgICBjYWxjdWxhdGVfaHZtX21heF9wb2xp
Y3koKTsKIH0KIAogYm9vbCByZWNoZWNrX2NwdV9mZWF0dXJlcyh1bnNpZ25lZCBpbnQgY3B1KQpA
QCAtNDcyLDExICs0NzcsMTggQEAgYm9vbCByZWNoZWNrX2NwdV9mZWF0dXJlcyh1bnNpZ25lZCBp
bnQgY3B1KQogdm9pZCByZWNhbGN1bGF0ZV9jcHVpZF9wb2xpY3koc3RydWN0IGRvbWFpbiAqZCkK
IHsKICAgICBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwID0gZC0+YXJjaC5jcHVpZDsKLSAgICBjb25z
dCBzdHJ1Y3QgY3B1aWRfcG9saWN5ICptYXggPQotICAgICAgICBpc19wdl9kb21haW4oZCkgPyAm
cHZfbWF4X2NwdWlkX3BvbGljeSA6ICZodm1fbWF4X2NwdWlkX3BvbGljeTsKKyAgICBjb25zdCBz
dHJ1Y3QgY3B1aWRfcG9saWN5ICptYXggPSBpc19wdl9kb21haW4oZCkKKyAgICAgICAgPyAoSVNf
RU5BQkxFRChDT05GSUdfUFYpICA/ICAmcHZfbWF4X2NwdWlkX3BvbGljeSA6IE5VTEwpCisgICAg
ICAgIDogKElTX0VOQUJMRUQoQ09ORklHX0hWTSkgPyAmaHZtX21heF9jcHVpZF9wb2xpY3kgOiBO
VUxMKTsKICAgICB1aW50MzJfdCBmc1tGU0NBUElOVFNdLCBtYXhfZnNbRlNDQVBJTlRTXTsKICAg
ICB1bnNpZ25lZCBpbnQgaTsKIAorICAgIGlmICggIW1heCApCisgICAgeworICAgICAgICBBU1NF
UlRfVU5SRUFDSEFCTEUoKTsKKyAgICAgICAgcmV0dXJuOworICAgIH0KKwogICAgIHAtPng4Nl92
ZW5kb3IgPSB4ODZfY3B1aWRfbG9va3VwX3ZlbmRvcigKICAgICAgICAgcC0+YmFzaWMudmVuZG9y
X2VieCwgcC0+YmFzaWMudmVuZG9yX2VjeCwgcC0+YmFzaWMudmVuZG9yX2VkeCk7CiAKQEAgLTYx
MiwxMCArNjI0LDE3IEBAIHZvaWQgcmVjYWxjdWxhdGVfY3B1aWRfcG9saWN5KHN0cnVjdCBkb21h
aW4gKmQpCiAKIGludCBpbml0X2RvbWFpbl9jcHVpZF9wb2xpY3koc3RydWN0IGRvbWFpbiAqZCkK
IHsKLSAgICBzdHJ1Y3QgY3B1aWRfcG9saWN5ICpwID0KLSAgICAgICAgeG1lbWR1cChpc19wdl9k
b21haW4oZCkgPyAgJnB2X21heF9jcHVpZF9wb2xpY3kKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgOiAmaHZtX21heF9jcHVpZF9wb2xpY3kpOworICAgIHN0cnVjdCBjcHVpZF9wb2xp
Y3kgKnAgPSBpc19wdl9kb21haW4oZCkKKyAgICAgICAgPyAoSVNfRU5BQkxFRChDT05GSUdfUFYp
ICA/ICAmcHZfbWF4X2NwdWlkX3BvbGljeSA6IE5VTEwpCisgICAgICAgIDogKElTX0VOQUJMRUQo
Q09ORklHX0hWTSkgPyAmaHZtX21heF9jcHVpZF9wb2xpY3kgOiBOVUxMKTsKKworICAgIGlmICgg
IXAgKQorICAgIHsKKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAgICAgIHJldHVy
biAtRU9QTk9UU1VQUDsKKyAgICB9CiAKKyAgICBwID0geG1lbWR1cChwKTsKICAgICBpZiAoICFw
ICkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
