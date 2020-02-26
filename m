Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4B3170977
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 21:25:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j73Cj-0003rc-8E; Wed, 26 Feb 2020 20:22:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j73Ci-0003rA-0M
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 20:22:48 +0000
X-Inumbo-ID: b554081a-58d5-11ea-94dc-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b554081a-58d5-11ea-94dc-12813bfff9fa;
 Wed, 26 Feb 2020 20:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582748548;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gh7zvT2QF4Vx8o2fLYvtD5CfhlnyOcj3YGLCny2yNI8=;
 b=JKvLq0rpHH2tDwxjqjAk5A58Wtt1Uwe31LFWJ09Tf2Y9su8bnSpolhCt
 x3y3Mm1RHOVLui2Nw4JlEA5kvnzdk4L+5yO7WR5taxEuE8SYzLHnvNyEa
 oKLJgxxKio7YPzcdW5WyTjJIr2YrKZVLLao73xFd+lttOvjquIvz/vWmZ w=;
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
IronPort-SDR: dZXbkmdwAMbW4Wf01LZHbVu9Kh+kI8sy9YcBytPH3uQGEs5KGSrpDTrlkKEfWCErhwC1XnYh8I
 FQmRdS8OCmLgwfOiVrTDLTVXa/ONoGUI21gkpqX6VvNTg512iFtrYLIpb21AcvUrdCgpSadcoZ
 RE6g+OZRTl8l9aqb+Kv6paO0iKgjEuvvJBqULKR1b6meNGhUC9uC3JYrlkWwnJ+Z2V5uTUp8jC
 Bmie3c4iXyKyhlOsMS1dKU+hghqIGpidvepkVS7GemqQkpQaUFoPACB69V2s6Si9u8hPzYFc86
 b20=
X-SBRS: 2.7
X-MesageID: 13496573
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,489,1574139600"; d="scan'208";a="13496573"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 20:22:17 +0000
Message-ID: <20200226202221.6555-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200226202221.6555-1-andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 06/10] x86/msr: Introduce and use default MSR
 policies
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

Rm9yIG5vdywgdGhlIGRlZmF1bHQgYW5kIG1heCBwb2xpY2llcyByZW1haW4gaWRlbnRpY2FsLCBi
dXQgdGhpcyB3aWxsIGNoYW5nZQppbiB0aGUgZnV0dXJlLgoKVXBkYXRlIFhFTl9TWVNDVExfZ2V0
X2NwdV9wb2xpY3kgYW5kIGluaXRfZG9tYWluX21zcl9wb2xpY3koKSB0byB1c2UgdGhlCmRlZmF1
bHQgcG9saWNpZXMuCgpUYWtlIHRoZSBvcHBvcnR1bml0eSBzb3J0IFBWIGFoZWFkIG9mIEhWTSwg
YXMgaXMgdGhlIHByZXZhaWxpbmcgc3R5bGUKZWxzZXdoZXJlLgoKU2lnbmVkLW9mZi1ieTogQW5k
cmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGlj
aCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L21zci5j
ICAgICAgICB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiB4ZW4vYXJjaC94
ODYvc3lzY3RsLmMgICAgIHwgIDQgKystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9tc3IuaCB8ICA0
ICsrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbXNyLmMgYi94ZW4vYXJjaC94ODYvbXNyLmMKaW5k
ZXggNzM4ZDcxMjNmOS4uNTE5MjIyYTJiOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21zci5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwpAQCAtMzQsOSArMzQsMTEgQEAgc3RydWN0IG1zcl9w
b2xpY3kgX19yZWFkX21vc3RseSAgICAgcmF3X21zcl9wb2xpY3ksCiAgICAgICAgICAgICAgICAg
ICBfX3JlYWRfbW9zdGx5ICAgIGhvc3RfbXNyX3BvbGljeTsKICNpZmRlZiBDT05GSUdfUFYKIHN0
cnVjdCBtc3JfcG9saWN5IF9fcmVhZF9tb3N0bHkgIHB2X21heF9tc3JfcG9saWN5Oworc3RydWN0
IG1zcl9wb2xpY3kgX19yZWFkX21vc3RseSAgcHZfZGVmX21zcl9wb2xpY3k7CiAjZW5kaWYKICNp
ZmRlZiBDT05GSUdfSFZNCiBzdHJ1Y3QgbXNyX3BvbGljeSBfX3JlYWRfbW9zdGx5IGh2bV9tYXhf
bXNyX3BvbGljeTsKK3N0cnVjdCBtc3JfcG9saWN5IF9fcmVhZF9tb3N0bHkgaHZtX2RlZl9tc3Jf
cG9saWN5OwogI2VuZGlmCiAKIHN0YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfcmF3X3BvbGlj
eSh2b2lkKQpAQCAtNTYsNiArNTgsMjAgQEAgc3RhdGljIHZvaWQgX19pbml0IGNhbGN1bGF0ZV9o
b3N0X3BvbGljeSh2b2lkKQogICAgIG1wLT5wbGF0Zm9ybV9pbmZvLmNwdWlkX2ZhdWx0aW5nID0g
Y3B1X2hhc19jcHVpZF9mYXVsdGluZzsKIH0KIAorc3RhdGljIHZvaWQgX19pbml0IGNhbGN1bGF0
ZV9wdl9tYXhfcG9saWN5KHZvaWQpCit7CisgICAgc3RydWN0IG1zcl9wb2xpY3kgKm1wID0gJnB2
X21heF9tc3JfcG9saWN5OworCisgICAgKm1wID0gaG9zdF9tc3JfcG9saWN5OworfQorCitzdGF0
aWMgdm9pZCBfX2luaXQgY2FsY3VsYXRlX3B2X2RlZl9wb2xpY3kodm9pZCkKK3sKKyAgICBzdHJ1
Y3QgbXNyX3BvbGljeSAqbXAgPSAmcHZfZGVmX21zcl9wb2xpY3k7CisKKyAgICAqbXAgPSBwdl9t
YXhfbXNyX3BvbGljeTsKK30KKwogc3RhdGljIHZvaWQgX19pbml0IGNhbGN1bGF0ZV9odm1fbWF4
X3BvbGljeSh2b2lkKQogewogICAgIHN0cnVjdCBtc3JfcG9saWN5ICptcCA9ICZodm1fbWF4X21z
cl9wb2xpY3k7CkBAIC02NiwxMSArODIsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGNhbGN1bGF0
ZV9odm1fbWF4X3BvbGljeSh2b2lkKQogICAgIG1wLT5wbGF0Zm9ybV9pbmZvLmNwdWlkX2ZhdWx0
aW5nID0gdHJ1ZTsKIH0KIAotc3RhdGljIHZvaWQgX19pbml0IGNhbGN1bGF0ZV9wdl9tYXhfcG9s
aWN5KHZvaWQpCitzdGF0aWMgdm9pZCBfX2luaXQgY2FsY3VsYXRlX2h2bV9kZWZfcG9saWN5KHZv
aWQpCiB7Ci0gICAgc3RydWN0IG1zcl9wb2xpY3kgKm1wID0gJnB2X21heF9tc3JfcG9saWN5Owor
ICAgIHN0cnVjdCBtc3JfcG9saWN5ICptcCA9ICZodm1fZGVmX21zcl9wb2xpY3k7CiAKLSAgICAq
bXAgPSBob3N0X21zcl9wb2xpY3k7CisgICAgKm1wID0gaHZtX21heF9tc3JfcG9saWN5OwogfQog
CiB2b2lkIF9faW5pdCBpbml0X2d1ZXN0X21zcl9wb2xpY3kodm9pZCkKQEAgLTc5LDE3ICs5NSwy
MyBAQCB2b2lkIF9faW5pdCBpbml0X2d1ZXN0X21zcl9wb2xpY3kodm9pZCkKICAgICBjYWxjdWxh
dGVfaG9zdF9wb2xpY3koKTsKIAogICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfUFYpICkKKyAg
ICB7CiAgICAgICAgIGNhbGN1bGF0ZV9wdl9tYXhfcG9saWN5KCk7CisgICAgICAgIGNhbGN1bGF0
ZV9wdl9kZWZfcG9saWN5KCk7CisgICAgfQogCiAgICAgaWYgKCBodm1fZW5hYmxlZCApCisgICAg
ewogICAgICAgICBjYWxjdWxhdGVfaHZtX21heF9wb2xpY3koKTsKKyAgICAgICAgY2FsY3VsYXRl
X2h2bV9kZWZfcG9saWN5KCk7CisgICAgfQogfQogCiBpbnQgaW5pdF9kb21haW5fbXNyX3BvbGlj
eShzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIHN0cnVjdCBtc3JfcG9saWN5ICptcCA9IGlzX3B2
X2RvbWFpbihkKQotICAgICAgICA/IChJU19FTkFCTEVEKENPTkZJR19QVikgID8gICZwdl9tYXhf
bXNyX3BvbGljeSA6IE5VTEwpCi0gICAgICAgIDogKElTX0VOQUJMRUQoQ09ORklHX0hWTSkgPyAm
aHZtX21heF9tc3JfcG9saWN5IDogTlVMTCk7CisgICAgICAgID8gKElTX0VOQUJMRUQoQ09ORklH
X1BWKSAgPyAgJnB2X2RlZl9tc3JfcG9saWN5IDogTlVMTCkKKyAgICAgICAgOiAoSVNfRU5BQkxF
RChDT05GSUdfSFZNKSA/ICZodm1fZGVmX21zcl9wb2xpY3kgOiBOVUxMKTsKIAogICAgIGlmICgg
IW1wICkKICAgICB7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMgYi94ZW4vYXJj
aC94ODYvc3lzY3RsLmMKaW5kZXggN2VhOGMzODc5Ny4uY2FkNzUzNDM3MyAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L3N5c2N0bC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwpAQCAtNDks
NyArNDksNyBAQCBjb25zdCBzdHJ1Y3QgY3B1X3BvbGljeSBzeXN0ZW1fcG9saWNpZXNbNl0gPSB7
CiAgICAgfSwKICAgICBbIFhFTl9TWVNDVExfY3B1X3BvbGljeV9wdl9kZWZhdWx0IF0gPSB7CiAg
ICAgICAgICZwdl9tYXhfY3B1aWRfcG9saWN5LAotICAgICAgICAmcHZfbWF4X21zcl9wb2xpY3ks
CisgICAgICAgICZwdl9kZWZfbXNyX3BvbGljeSwKICAgICB9LAogI2VuZGlmCiAjaWZkZWYgQ09O
RklHX0hWTQpAQCAtNTksNyArNTksNyBAQCBjb25zdCBzdHJ1Y3QgY3B1X3BvbGljeSBzeXN0ZW1f
cG9saWNpZXNbNl0gPSB7CiAgICAgfSwKICAgICBbIFhFTl9TWVNDVExfY3B1X3BvbGljeV9odm1f
ZGVmYXVsdCBdID0gewogICAgICAgICAmaHZtX21heF9jcHVpZF9wb2xpY3ksCi0gICAgICAgICZo
dm1fbWF4X21zcl9wb2xpY3ksCisgICAgICAgICZodm1fZGVmX21zcl9wb2xpY3ksCiAgICAgfSwK
ICNlbmRpZgogfTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLmggYi94ZW4v
aW5jbHVkZS9hc20teDg2L21zci5oCmluZGV4IGJjYTQxYTM2NzAuLjQxMzk3ZTE5Y2YgMTAwNjQ0
Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbXNyLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9tc3IuaApAQCAtMjY5LDggKzI2OSwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgd3Jtc3JfdHNj
X2F1eCh1aW50MzJfdCB2YWwpCiAKIGV4dGVybiBzdHJ1Y3QgbXNyX3BvbGljeSAgICAgcmF3X21z
cl9wb2xpY3ksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaG9zdF9tc3JfcG9saWN5LAor
ICAgICAgICAgICAgICAgICAgICAgICAgICBwdl9tYXhfbXNyX3BvbGljeSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgcHZfZGVmX21zcl9wb2xpY3ksCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgaHZtX21heF9tc3JfcG9saWN5LAotICAgICAgICAgICAgICAgICAgICAgICAgICBwdl9tYXhf
bXNyX3BvbGljeTsKKyAgICAgICAgICAgICAgICAgICAgICAgICBodm1fZGVmX21zcl9wb2xpY3k7
CiAKIC8qIENvbnRhaW5lciBvYmplY3QgZm9yIHBlci12Q1BVIE1TUnMgKi8KIHN0cnVjdCB2Y3B1
X21zcnMKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
