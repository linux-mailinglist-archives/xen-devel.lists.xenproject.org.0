Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD34E9E13
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 15:57:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPpNG-00038A-6n; Wed, 30 Oct 2019 14:55:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Sl5I=YX=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iPpNE-00037y-UG
 for xen-devel@lists.xen.org; Wed, 30 Oct 2019 14:55:00 +0000
X-Inumbo-ID: 3c55c4b7-fb25-11e9-9527-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c55c4b7-fb25-11e9-9527-12813bfff9fa;
 Wed, 30 Oct 2019 14:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572447295;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P7baffnUHo1jCBAVaJZGgOtzgVyT4RMajAmx/fFBT/4=;
 b=gA1j08W5OWzZ5iTzZDdVRWaGycqVLrdR3dAngevZ4AQ3qqgz/1v3Brgh
 9icLZ5RjoBsygWNynTudLEX1PLB4BpV8XDOX4ElGVzNNJLSxQz/leSXnD
 6TXW3NH2bY6vHLhzldxlrBSmKnSJUVJsRkuby3dPgl6b5sjOP4EJP7mHG Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /ZyavpBRSWzpAmyGMh+klFKt2+bLXBU68aPJy5dRnyaFoojVB7wU/R1MV1JeVtuKpcprWPmH3I
 rz+qlVGpJ2xtdgC68ksw1CiLXu6fZ7E4/vBZWUcEwfryg9u+n5AHhlqmpzqxoXmLFIp6dDBnXH
 zC/ulQk1atIlMnIu2lhWJFh5beLOPJEp2BgcJKxDzlZ+Dpm+RYYthcXbH1+1Vnwd/CPsLv2cQY
 qzhgv8JMtF3/UYu4MiG1ZQcJ8jIRXWPKMHaWdiVvjaEGHOM9UqDKkZzkhhU8fdXwfrgliuYGg+
 RZo=
X-SBRS: 2.7
X-MesageID: 8094669
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,247,1569297600"; 
   d="scan'208";a="8094669"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Wed, 30 Oct 2019 14:54:46 +0000
Message-ID: <20191030145447.11122-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 for 4.13 1/2] x86/boot: allow early usage of
 cpu_has_hypervisor
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TW92ZSBlYXJseV9jcHVfaW5pdCgpIHRvIGJlIG5lYXIgdGhlIHRvcCBvZiBfX3N0YXJ0X3hlbigp
LiBTaW5jZSB0aGVyZQppcyBubyBzZXJpYWwgLyB2Z2Egb3V0cHV0IGF0IHRoYXQgc3RhZ2UsIGlu
dHJvZHVjZSBhIG5ldyBmdW5jdGlvbgp0byBwcmludCBDUFUgaW5mb3JtYXRpb24gYXQgdGhlIHVz
dWFsIHBsYWNlIGR1cmluZyBib290LgoKRmluYWxseSwgY29udmVydCB1c2VycyBvZiBjcHVpZF9l
Y3goMSkgJiBYODZfRkVBVFVSRV9IWVBFUlZJU09SLgoKU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5
YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0t
CiB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jICAgfCAyNSArKysrKysrKysrKysrKysrKy0tLS0t
LS0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMgICAgfCAgMyArLS0KIHhlbi9hcmNoL3g4Ni9t
bS5jICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgfCAgNCAr
KystCiB4ZW4vaW5jbHVkZS9hc20teDg2L3NldHVwLmggfCAgMSArCiA1IGZpbGVzIGNoYW5nZWQs
IDIzIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9jcHUvY29tbW9uLmMgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCmluZGV4IDZjNmJk
NjMzMDEuLjRmMzM2ZjY0ZDMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMK
KysrIGIveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYwpAQCAtMTA5LDYgKzEwOSw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgY3B1X2RldiBkZWZhdWx0X2NwdSA9IHsKIAkuY19pbml0CT0gZGVmYXVs
dF9pbml0LAogfTsKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY3B1X2RldiAqdGhpc19jcHUgPSAmZGVm
YXVsdF9jcHU7CitzdGF0aWMgYm9vbCBfX2luaXRkYXRhIHVucmVjb2duaXNlZF9jcHU7CiAKIHN0
YXRpYyBERUZJTkVfUEVSX0NQVSh1aW50NjRfdCwgbXNyX21pc2NfZmVhdHVyZXMpOwogdm9pZCAo
KiBfX3JlYWRfbW9zdGx5IGN0eHRfc3dpdGNoX21hc2tpbmcpKGNvbnN0IHN0cnVjdCB2Y3B1ICpu
ZXh0KTsKQEAgLTMwMSw5ICszMDIsNyBAQCB2b2lkIF9faW5pdCBlYXJseV9jcHVfaW5pdCh2b2lk
KQogCWNhc2UgWDg2X1ZFTkRPUl9TSEFOR0hBSTogdGhpc19jcHUgPSAmc2hhbmdoYWlfY3B1X2Rl
djsgYnJlYWs7CiAJY2FzZSBYODZfVkVORE9SX0hZR09OOiAgICB0aGlzX2NwdSA9ICZoeWdvbl9j
cHVfZGV2OyAgICBicmVhazsKIAlkZWZhdWx0OgotCQlwcmludGsoWEVOTE9HX0VSUgotCQkgICAg
ICAgIlVucmVjb2duaXNlZCBvciB1bnN1cHBvcnRlZCBDUFUgdmVuZG9yICclLjEycydcbiIsCi0J
CSAgICAgICBjLT54ODZfdmVuZG9yX2lkKTsKKwkJdW5yZWNvZ25pc2VkX2NwdSA9IHRydWU7CiAJ
fQogCiAJY3B1aWQoMHgwMDAwMDAwMSwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7CkBAIC0zMTcs
MTEgKzMxNiw2IEBAIHZvaWQgX19pbml0IGVhcmx5X2NwdV9pbml0KHZvaWQpCiAJYy0+eDg2X2Nh
cGFiaWxpdHlbY3B1ZmVhdF93b3JkKFg4Nl9GRUFUVVJFX0ZQVSldID0gZWR4OwogCWMtPng4Nl9j
YXBhYmlsaXR5W2NwdWZlYXRfd29yZChYODZfRkVBVFVSRV9TU0UzKV0gPSBlY3g7CiAKLQlwcmlu
dGsoWEVOTE9HX0lORk8KLQkgICAgICAgIkNQVSBWZW5kb3I6ICVzLCBGYW1pbHkgJXUgKCUjeCks
IE1vZGVsICV1ICglI3gpLCBTdGVwcGluZyAldSAocmF3ICUwOHgpXG4iLAotCSAgICAgICB4ODZf
Y3B1aWRfdmVuZG9yX3RvX3N0cihjLT54ODZfdmVuZG9yKSwgYy0+eDg2LCBjLT54ODYsCi0JICAg
ICAgIGMtPng4Nl9tb2RlbCwgYy0+eDg2X21vZGVsLCBjLT54ODZfbWFzaywgZWF4KTsKLQogCWVh
eCA9IGNwdWlkX2VheCgweDgwMDAwMDAwKTsKIAlpZiAoKGVheCA+PiAxNikgPT0gMHg4MDAwICYm
IGVheCA+PSAweDgwMDAwMDA4KSB7CiAJCWVheCA9IGNwdWlkX2VheCgweDgwMDAwMDA4KTsKQEAg
LTM0Miw2ICszMzYsMjEgQEAgdm9pZCBfX2luaXQgZWFybHlfY3B1X2luaXQodm9pZCkKIAlpbml0
aWFsaXplX2NwdV9kYXRhKDApOwogfQogCit2b2lkIF9faW5pdCBlYXJseV9jcHVfcHJpbnRfaW5m
byh2b2lkKQoreworCXN0cnVjdCBjcHVpbmZvX3g4NiAqYyA9ICZib290X2NwdV9kYXRhOworCisJ
aWYgKHVucmVjb2duaXNlZF9jcHUpCisJCXByaW50ayhYRU5MT0dfRVJSCisJCSAgICAgICAiVW5y
ZWNvZ25pc2VkIG9yIHVuc3VwcG9ydGVkIENQVSB2ZW5kb3IgJyUuMTJzJ1xuIiwKKwkJICAgICAg
IGMtPng4Nl92ZW5kb3JfaWQpOworCisJcHJpbnRrKFhFTkxPR19JTkZPICJDUFUgVmVuZG9yOiAl
cywgRmFtaWx5ICV1ICglI3gpLCBNb2RlbCAldSAoJSN4KSwgIgorCQkJICAgIlN0ZXBwaW5nICV1
IChyYXcgJTA4eClcbiIsCisJICAgICAgIHg4Nl9jcHVpZF92ZW5kb3JfdG9fc3RyKGMtPng4Nl92
ZW5kb3IpLCBjLT54ODYsIGMtPng4NiwKKwkgICAgICAgYy0+eDg2X21vZGVsLCBjLT54ODZfbW9k
ZWwsIGMtPng4Nl9tYXNrLCBjcHVpZF9lYXgoMHgwMDAwMDAwMSkpOworfQorCiBzdGF0aWMgdm9p
ZCBnZW5lcmljX2lkZW50aWZ5KHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKIHsKIAl1MzIgZWF4LCBl
YngsIGVjeCwgZWR4LCB0bXA7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMg
Yi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMKaW5kZXggN2I3YTViYWRhYi4uOWI3NzZhZmVkOSAx
MDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC94ZW4uYwpAQCAtNzIsOCArNzIsNyBAQCB2b2lkIF9faW5pdCBwcm9iZV9oeXBlcnZpc29y
KHZvaWQpCiAgICAgaWYgKCB4ZW5fZ3Vlc3QgKQogICAgICAgICByZXR1cm47CiAKLSAgICAvKiBU
b28gZWFybHkgdG8gdXNlIGNwdV9oYXNfaHlwZXJ2aXNvciAqLwotICAgIGlmICggIShjcHVpZF9l
Y3goMSkgJiBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSFlQRVJWSVNPUikpICkKKyAgICBpZiAo
ICFjcHVfaGFzX2h5cGVydmlzb3IgKQogICAgICAgICByZXR1cm47CiAKICAgICBmaW5kX3hlbl9s
ZWF2ZXMoKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21t
LmMKaW5kZXggOTk4MTZmYzY3Yy4uNGNkY2NhYjhjOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L21tLmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTU5NDMsNyArNTk0Myw3IEBAIGNvbnN0
IHN0cnVjdCBwbGF0Zm9ybV9iYWRfcGFnZSAqX19pbml0IGdldF9wbGF0Zm9ybV9iYWRwYWdlcyh1
bnNpZ25lZCBpbnQgKmFycmF5CiAgICAgY2FzZSAweDAwMDgwNmUwOiAvKiBlcnJhdHVtIEtCTD8/
PyAqLwogICAgIGNhc2UgMHgwMDA5MDZlMDogLyogZXJyYXRhIEtCTD8/PyAvIEtCVzExNCAvIENG
VzEwMyAqLwogICAgICAgICAqYXJyYXlfc2l6ZSA9IChjcHVpZF9lYXgoMCkgPj0gNyAmJgotICAg
ICAgICAgICAgICAgICAgICAgICAhKGNwdWlkX2VjeCgxKSAmIGNwdWZlYXRfbWFzayhYODZfRkVB
VFVSRV9IWVBFUlZJU09SKSkgJiYKKyAgICAgICAgICAgICAgICAgICAgICAgIWNwdV9oYXNfaHlw
ZXJ2aXNvciAmJgogICAgICAgICAgICAgICAgICAgICAgICAoY3B1aWRfY291bnRfZWJ4KDcsIDAp
ICYgY3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hMRSkpKTsKICAgICAgICAgcmV0dXJuICZobGVf
YmFkX3BhZ2U7CiAgICAgfQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4v
YXJjaC94ODYvc2V0dXAuYwppbmRleCBkZWM2MGQwMzAxLi4wN2FkZmVkNTY2IDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtNzIz
LDYgKzcyMyw4IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxv
bmcgbWJpX3ApCiAgICAgLyogRW5hYmxlIE5NSXMuICBPdXIgbG9hZGVyIChlLmcuIFRib290KSBt
YXkgaGF2ZSBsZWZ0IHRoZW0gZGlzYWJsZWQuICovCiAgICAgZW5hYmxlX25taXMoKTsKIAorICAg
IGVhcmx5X2NwdV9pbml0KCk7CisKICAgICBpZiAoIHB2aF9ib290ICkKICAgICB7CiAgICAgICAg
IC8qCkBAIC0xNTE5LDcgKzE1MjEsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hl
bih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgIHNvZnRpcnFfaW5pdCgpOwogICAgIHRhc2tsZXRf
c3Vic3lzX2luaXQoKTsKIAotICAgIGVhcmx5X2NwdV9pbml0KCk7CisgICAgZWFybHlfY3B1X3By
aW50X2luZm8oKTsKIAogICAgIHBhZ2luZ19pbml0KCk7CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvc2V0dXAuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaAppbmRleCA4
NjFkNDZkNmFjLi4yNTExNTE1MDhkIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3Nl
dHVwLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9zZXR1cC5oCkBAIC0xNSw2ICsxNSw3IEBA
IGV4dGVybiBjaGFyIF9fMk1fcndkYXRhX3N0YXJ0W10sIF9fMk1fcndkYXRhX2VuZFtdOwogZXh0
ZXJuIHVuc2lnbmVkIGxvbmcgeGVuaGVhcF9pbml0aWFsX3BoeXNfc3RhcnQ7CiAKIHZvaWQgZWFy
bHlfY3B1X2luaXQodm9pZCk7Cit2b2lkIGVhcmx5X2NwdV9wcmludF9pbmZvKHZvaWQpOwogdm9p
ZCBlYXJseV90aW1lX2luaXQodm9pZCk7CiAKIHZvaWQgc2V0X25yX2NwdV9pZHModW5zaWduZWQg
aW50IG1heF9jcHVzKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
