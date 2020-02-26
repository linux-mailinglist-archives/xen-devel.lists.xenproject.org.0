Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567E170987
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 21:26:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j73CZ-0003kn-4k; Wed, 26 Feb 2020 20:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dr0i=4O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j73CY-0003kH-00
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 20:22:38 +0000
X-Inumbo-ID: b4212d12-58d5-11ea-94dc-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4212d12-58d5-11ea-94dc-12813bfff9fa;
 Wed, 26 Feb 2020 20:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582748547;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yGMVzI6Kc0BempO1OOlS8e4RhhWkq+Lao6Js498e0JE=;
 b=UnRlzKeHqzdx271q3LkTy5SIPExkpW7UoON5+S2+Vu0YuxAftHsl3+4z
 jhSPUUrBrKaJcnYow+HkO6j89OJAOQGymJ8Zju1AHYtAqsXQL3tvM77c1
 dEtycsJ/5mLS5Zb9QnFFdsMSgfG67IoB2eUjdvjeRPIujT4K6EMJrV21w I=;
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
IronPort-SDR: 2DLAPFKL6rlBuGWIECs/44VMD8+yFW79E7c+AwEIQjWYZfRoE6HrqjT2HQ2oenAt77D9KwiXIu
 NYmozwMg+wH+W84qEJLx57DgfeG9c3ZKuqbdmEp422gJ0NPgYCKRoOUMTGpECL9serg1gO5Hwi
 v4CfV/whrPLZQymUVjEtmH/0BDUbSN0fJUYnastajOPLuEf+K7iZQjmW+Ggfazh6DypuC7e11F
 tPIF8u6jLn0Pa/o2gApqhAu+fPAcW2bZVTGl/ONQO9u55HDuiiPMOTKLetQlwYivVnKrjgktp2
 wN8=
X-SBRS: 2.7
X-MesageID: 13496569
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,489,1574139600"; d="scan'208";a="13496569"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 20:22:16 +0000
Message-ID: <20200226202221.6555-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200226202221.6555-1-andrew.cooper3@citrix.com>
References: <20200226202221.6555-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 05/10] x86/msr: Compile out unused logic/objects
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

QXJyYW5nZSB0byBjb21waWxlIG91dCB0aGUgUFYgb3IgSFZNIGxvZ2ljIGFuZCBvYmplY3RzIGFz
IGFwcGxpY2FibGUuICBUaGlzCmludm9sdmVzIGEgYml0IG9mIGNvbXBsZXhpdHkgaW4gaW5pdF9k
b21haW5fbXNyX3BvbGljeSgpIGFzIGlzX3B2X2RvbWFpbigpCmNhbid0IGJlIGV2YXVsYXRlZCBh
dCBjb21waWxlIHRpbWUuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4K
Q0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbXNyLmMgfCAzNCArKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21zci5jIGIveGVuL2FyY2gv
eDg2L21zci5jCmluZGV4IGUzOWJiNmRjZTQuLjczOGQ3MTIzZjkgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9tc3IuYworKysgYi94ZW4vYXJjaC94ODYvbXNyLmMKQEAgLTMxLDkgKzMxLDEzIEBA
CiBERUZJTkVfUEVSX0NQVSh1aW50MzJfdCwgdHNjX2F1eCk7CiAKIHN0cnVjdCBtc3JfcG9saWN5
IF9fcmVhZF9tb3N0bHkgICAgIHJhd19tc3JfcG9saWN5LAotICAgICAgICAgICAgICAgICAgX19y
ZWFkX21vc3RseSAgICBob3N0X21zcl9wb2xpY3ksCi0gICAgICAgICAgICAgICAgICBfX3JlYWRf
bW9zdGx5IGh2bV9tYXhfbXNyX3BvbGljeSwKLSAgICAgICAgICAgICAgICAgIF9fcmVhZF9tb3N0
bHkgIHB2X21heF9tc3JfcG9saWN5OworICAgICAgICAgICAgICAgICAgX19yZWFkX21vc3RseSAg
ICBob3N0X21zcl9wb2xpY3k7CisjaWZkZWYgQ09ORklHX1BWCitzdHJ1Y3QgbXNyX3BvbGljeSBf
X3JlYWRfbW9zdGx5ICBwdl9tYXhfbXNyX3BvbGljeTsKKyNlbmRpZgorI2lmZGVmIENPTkZJR19I
Vk0KK3N0cnVjdCBtc3JfcG9saWN5IF9fcmVhZF9tb3N0bHkgaHZtX21heF9tc3JfcG9saWN5Owor
I2VuZGlmCiAKIHN0YXRpYyB2b2lkIF9faW5pdCBjYWxjdWxhdGVfcmF3X3BvbGljeSh2b2lkKQog
ewpAQCAtNTYsOSArNjAsNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgY2FsY3VsYXRlX2h2bV9tYXhf
cG9saWN5KHZvaWQpCiB7CiAgICAgc3RydWN0IG1zcl9wb2xpY3kgKm1wID0gJmh2bV9tYXhfbXNy
X3BvbGljeTsKIAotICAgIGlmICggIWh2bV9lbmFibGVkICkKLSAgICAgICAgcmV0dXJuOwotCiAg
ICAgKm1wID0gaG9zdF9tc3JfcG9saWN5OwogCiAgICAgLyogSXQncyBhbHdheXMgcG9zc2libGUg
dG8gZW11bGF0ZSBDUFVJRCBmYXVsdGluZyBmb3IgSFZNIGd1ZXN0cyAqLwpAQCAtNzYsMTYgKzc3
LDI3IEBAIHZvaWQgX19pbml0IGluaXRfZ3Vlc3RfbXNyX3BvbGljeSh2b2lkKQogewogICAgIGNh
bGN1bGF0ZV9yYXdfcG9saWN5KCk7CiAgICAgY2FsY3VsYXRlX2hvc3RfcG9saWN5KCk7Ci0gICAg
Y2FsY3VsYXRlX2h2bV9tYXhfcG9saWN5KCk7Ci0gICAgY2FsY3VsYXRlX3B2X21heF9wb2xpY3ko
KTsKKworICAgIGlmICggSVNfRU5BQkxFRChDT05GSUdfUFYpICkKKyAgICAgICAgY2FsY3VsYXRl
X3B2X21heF9wb2xpY3koKTsKKworICAgIGlmICggaHZtX2VuYWJsZWQgKQorICAgICAgICBjYWxj
dWxhdGVfaHZtX21heF9wb2xpY3koKTsKIH0KIAogaW50IGluaXRfZG9tYWluX21zcl9wb2xpY3ko
c3RydWN0IGRvbWFpbiAqZCkKIHsKLSAgICBzdHJ1Y3QgbXNyX3BvbGljeSAqbXAgPQotICAgICAg
ICB4bWVtZHVwKGlzX3B2X2RvbWFpbihkKSA/ICAmcHZfbWF4X21zcl9wb2xpY3kKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgOiAmaHZtX21heF9tc3JfcG9saWN5KTsKKyAgICBzdHJ1
Y3QgbXNyX3BvbGljeSAqbXAgPSBpc19wdl9kb21haW4oZCkKKyAgICAgICAgPyAoSVNfRU5BQkxF
RChDT05GSUdfUFYpICA/ICAmcHZfbWF4X21zcl9wb2xpY3kgOiBOVUxMKQorICAgICAgICA6IChJ
U19FTkFCTEVEKENPTkZJR19IVk0pID8gJmh2bV9tYXhfbXNyX3BvbGljeSA6IE5VTEwpOworCisg
ICAgaWYgKCAhbXAgKQorICAgIHsKKyAgICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAg
ICAgIHJldHVybiAtRU9QTk9UU1VQUDsKKyAgICB9CiAKKyAgICBtcCA9IHhtZW1kdXAobXApOwog
ICAgIGlmICggIW1wICkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
