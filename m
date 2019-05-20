Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E923132
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 12:21:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSfNB-00085r-PW; Mon, 20 May 2019 10:18:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EBqs=TU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hSfN9-00085P-VR
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 10:18:23 +0000
X-Inumbo-ID: 981ad59c-7ae8-11e9-8277-5781eda551ae
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 981ad59c-7ae8-11e9-8277-5781eda551ae;
 Mon, 20 May 2019 10:18:21 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: +BMD2r4VwSHOxe19ETszbshqGZr3HjLzcw9oBiySnffhyTpABUlqI4824O2xPNLDWki2+wYKZo
 SczsCjfTs+SbmL0Mo55vlvGpoMspvxX7V+m9Hu7klkOSgbXHt2YG95gw3C4gqZYaWDa8smFryV
 x4vCD80QLhGYnjOpg9O8bY83LAkdUIjHkkKGM0iSWLt7cWG+E1GlbXWbYwpBIN65Jj4e/SAPKi
 PJCoCrigJfpS9ugiEX4FedY5CaRyTUb+Y6pPk5WVnz6IcOFwnAMbXQR2v62/l36mHltSPcnvIO
 azQ=
X-SBRS: 2.7
X-MesageID: 629047
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="629047"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 20 May 2019 11:18:12 +0100
Message-ID: <1558347494-21640-3-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
References: <1558347494-21640-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] x86/boot: Rename dom0_{pvh,
 verbose} variables to have an opt_ prefix
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

Rm9yIGNvbnNpc3RlbmN5IHdpdGggb3RoZXIgY29tbWFuZCBsaW5lIG9wdGlvbnMuCgpObyBmdW5j
dGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpD
QzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICAgIHwg
MTIgKysrKysrLS0tLS0tCiB4ZW4vYXJjaC94ODYvaHZtL2RvbTBfYnVpbGQuYyB8ICAyICstCiB4
ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICB8ICAyICstCiB4ZW4vaW5jbHVkZS9hc20teDg2
L3NldHVwLmggICB8ICA0ICsrLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyBi
L3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKaW5kZXggNzNmNTQwNy4uMjczMTVkNSAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvZG9tMF9i
dWlsZC5jCkBAIC0yNjEsNyArMjYxLDcgQEAgdW5zaWduZWQgaW50IF9faW5pdCBkb20wX21heF92
Y3B1cyh2b2lkKQogICAgICAgICBtYXhfdmNwdXMgPSBvcHRfZG9tMF9tYXhfdmNwdXNfbWluOwog
ICAgIGlmICggb3B0X2RvbTBfbWF4X3ZjcHVzX21heCA8IG1heF92Y3B1cyApCiAgICAgICAgIG1h
eF92Y3B1cyA9IG9wdF9kb20wX21heF92Y3B1c19tYXg7Ci0gICAgbGltaXQgPSBkb20wX3B2aCA/
IEhWTV9NQVhfVkNQVVMgOiBNQVhfVklSVF9DUFVTOworICAgIGxpbWl0ID0gb3B0X2RvbTBfcHZo
ID8gSFZNX01BWF9WQ1BVUyA6IE1BWF9WSVJUX0NQVVM7CiAgICAgaWYgKCBtYXhfdmNwdXMgPiBs
aW1pdCApCiAgICAgICAgIG1heF92Y3B1cyA9IGxpbWl0OwogCkBAIC0yODAsOCArMjgwLDggQEAg
c3RydWN0IHZjcHUgKl9faW5pdCBhbGxvY19kb20wX3ZjcHUwKHN0cnVjdCBkb21haW4gKmRvbTAp
CiAjaWZkZWYgQ09ORklHX1NIQURPV19QQUdJTkcKIGJvb2wgX19pbml0ZGF0YSBvcHRfZG9tMF9z
aGFkb3c7CiAjZW5kaWYKLWJvb2wgX19pbml0ZGF0YSBkb20wX3B2aCA9ICFJU19FTkFCTEVEKENP
TkZJR19QVik7Ci1ib29sIF9faW5pdGRhdGEgZG9tMF92ZXJib3NlOworYm9vbCBfX2luaXRkYXRh
IG9wdF9kb20wX3B2aCA9ICFJU19FTkFCTEVEKENPTkZJR19QVik7Citib29sIF9faW5pdGRhdGEg
b3B0X2RvbTBfdmVyYm9zZTsKIAogc3RhdGljIGludCBfX2luaXQgcGFyc2VfZG9tMF9wYXJhbShj
b25zdCBjaGFyICpzKQogewpAQCAtMjk2LDE1ICsyOTYsMTUgQEAgc3RhdGljIGludCBfX2luaXQg
cGFyc2VfZG9tMF9wYXJhbShjb25zdCBjaGFyICpzKQogICAgICAgICAgICAgc3MgPSBzdHJjaHIo
cywgJ1wwJyk7CiAKICAgICAgICAgaWYgKCBJU19FTkFCTEVEKENPTkZJR19QVikgJiYgIWNtZGxp
bmVfc3RyY21wKHMsICJwdiIpICkKLSAgICAgICAgICAgIGRvbTBfcHZoID0gZmFsc2U7CisgICAg
ICAgICAgICBvcHRfZG9tMF9wdmggPSBmYWxzZTsKICAgICAgICAgZWxzZSBpZiAoIElTX0VOQUJM
RUQoQ09ORklHX0hWTSkgJiYgIWNtZGxpbmVfc3RyY21wKHMsICJwdmgiKSApCi0gICAgICAgICAg
ICBkb20wX3B2aCA9IHRydWU7CisgICAgICAgICAgICBvcHRfZG9tMF9wdmggPSB0cnVlOwogI2lm
ZGVmIENPTkZJR19TSEFET1dfUEFHSU5HCiAgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2Vf
Ym9vbGVhbigic2hhZG93Iiwgcywgc3MpKSA+PSAwICkKICAgICAgICAgICAgIG9wdF9kb20wX3No
YWRvdyA9IHZhbDsKICNlbmRpZgogICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBhcnNlX2Jvb2xl
YW4oInZlcmJvc2UiLCBzLCBzcykpID49IDAgKQotICAgICAgICAgICAgZG9tMF92ZXJib3NlID0g
dmFsOworICAgICAgICAgICAgb3B0X2RvbTBfdmVyYm9zZSA9IHZhbDsKICAgICAgICAgZWxzZQog
ICAgICAgICAgICAgcmMgPSAtRUlOVkFMOwogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZt
L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCmluZGV4IGFhNTk5
ZjAuLjg4NDUzOTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vZG9tMF9idWlsZC5jCkBAIC00ODQsNyArNDg0LDcgQEAgc3Rh
dGljIGludCBfX2luaXQgcHZoX3BvcHVsYXRlX3AybShzdHJ1Y3QgZG9tYWluICpkKQogICAgICAg
ICAgICAgcmV0dXJuIHJjOwogICAgIH0KIAotICAgIGlmICggZG9tMF92ZXJib3NlICkKKyAgICBp
ZiAoIG9wdF9kb20wX3ZlcmJvc2UgKQogICAgICAgICBwcmludF9vcmRlcl9zdGF0cyhkKTsKIAog
ICAgIHJldHVybiAwOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJj
aC94ODYvc2V0dXAuYwppbmRleCA5NTY2YjFkLi4wZWQ5NGE2IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtMTcxMyw3ICsxNzEz
LDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlf
cCkKICAgICBpbml0X2d1ZXN0X2NwdWlkKCk7CiAgICAgaW5pdF9ndWVzdF9tc3JfcG9saWN5KCk7
CiAKLSAgICBpZiAoIGRvbTBfcHZoICkKKyAgICBpZiAoIG9wdF9kb20wX3B2aCApCiAgICAgewog
ICAgICAgICBkb20wX2NmZy5mbGFncyB8PSAoWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0IHwKICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICgoaHZtX2hhcF9zdXBwb3J0ZWQoKSAmJiAhb3B0X2Rv
bTBfc2hhZG93KSA/CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3NldHVwLmggYi94
ZW4vaW5jbHVkZS9hc20teDg2L3NldHVwLmgKaW5kZXggYmI0YzM4NS4uMTVkNjM2MyAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zZXR1cC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvc2V0dXAuaApAQCAtNjQsOCArNjQsOCBAQCBleHRlcm4gYm9vbCBvcHRfZG9tMF9zaGFkb3c7
CiAjZWxzZQogI2RlZmluZSBvcHRfZG9tMF9zaGFkb3cgZmFsc2UKICNlbmRpZgotZXh0ZXJuIGJv
b2wgZG9tMF9wdmg7Ci1leHRlcm4gYm9vbCBkb20wX3ZlcmJvc2U7CitleHRlcm4gYm9vbCBvcHRf
ZG9tMF9wdmg7CitleHRlcm4gYm9vbCBvcHRfZG9tMF92ZXJib3NlOwogCiAjZGVmaW5lIG1heF9p
bml0X2RvbWlkICgwKQogCi0tIAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
