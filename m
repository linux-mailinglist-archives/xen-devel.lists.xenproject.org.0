Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD3CEAE0D
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 11:59:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ87m-0008AF-NX; Thu, 31 Oct 2019 10:56:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A/tI=YY=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iQ87l-0008AA-A8
 for xen-devel@lists.xen.org; Thu, 31 Oct 2019 10:56:17 +0000
X-Inumbo-ID: 0ea03334-fbcd-11e9-953f-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ea03334-fbcd-11e9-953f-12813bfff9fa;
 Thu, 31 Oct 2019 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572519375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WbqMkY73khVsNFDFekH6v2zn10iTBHvbFxhcwutb1+o=;
 b=ZRtSyvbVPluXXAalhUxzV7LA3KiAsnW9XSymADLArc+7dsJ5kowio0no
 V3hFrRWfEn/2NYGN1TaSroNFfkx+twi51rVAWp+wVYlubplvJtGBPcYAw
 nktAACjCBCcgLm9Obp4bMaJF+g2AWvia/So9yDpmrJm8pAXZPmVJUVJfX 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sbVw4qmjjlrWo1mi+8mvET7aEZBtR6Ph+euXcyuB85/ls0yWGgeBWO24e1GTr9dVrZlTBWmfiz
 n3fmleFkjQqQfMa0q4tELDjL3LEnpcD8I3TZUI+EU8+snHQjzTMGc9bDCOPNiOYRX0Hhc6Qel0
 xuNMNq7HayUeqmt97i3tr3MRUyD2ejff4Pz6wrd1cHJnDJqQU8zDQudhOzefjFJiqinCdXisfj
 vAcQ9CKuVit3iLyi8CgVtaLKn5F+k6JMA+MzCeY3N2YWiApxcKYyYEm51+SkpG72N2CyJJ7tx8
 gwE=
X-SBRS: 2.7
X-MesageID: 7996217
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,250,1569297600"; 
   d="scan'208";a="7996217"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>
Date: Thu, 31 Oct 2019 10:56:09 +0000
Message-ID: <20191031105609.21819-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 for 4.13] x86/e820: fix 640k - 1M region
 reservation logic
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

Q29udmVydGluZyBhIGd1ZXN0IGZyb20gUFYgdG8gUFYtaW4tUFZIIG1ha2VzIHRoZSBndWVzdCB0
byBoYXZlIDM4NGsKbGVzcyBtZW1vcnksIHdoaWNoIG1heSBjb25mdXNlIGd1ZXN0J3MgYmFsbG9v
biBkcml2ZXIuIFRoaXMgaGFwcGVucwpiZWNhdXNlIFhlbiB1bmNvbmRpdGlvbmFsbHkgcmVzZXJ2
ZXMgNjQwayAtIDFNIHJlZ2lvbiBpbiBFODIwIGRlc3BpdGUKdGhlIGZhY3QgdGhhdCBpdCdzIHJl
YWxseSBhIHVzYWJsZSBSQU0gaW4gUFZIIGJvb3QgbW9kZS4KCkZpeCB0aGlzIGJ5IHNraXBwaW5n
IHJlZ2lvbiB0eXBlIGNoYW5nZSBpbiB2aXJ0dWFsaXNlZCBlbnZpcm9ubWVudHMsCnRydXN0aW5n
IHdoYXRldmVyIG1lbW9yeSBtYXAgb3VyIGh5cGVydmlzb3IgaGFzIHByb3ZpZGVkLgoKVGFrZSBh
IHJlZmFjdG9yaW5nIG9wcG9ydHVuaXR5IHRvIGludHJvZHVjZSBlYXJseV9jcHVfaGFzX2h5cGVy
dmlzb3IoKS4KClNpZ25lZC1vZmYtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0
cml4LmNvbT4KLS0tCnYyIC0tPiB2MzoKLSBlYXJseV9jcHVfaGFzX2h5cGVydmlzb3IoKSBpcyBh
ZGRlZAoKQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpD
QzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jICAg
fCA5ICsrKysrKysrKwogeGVuL2FyY2gveDg2L2U4MjAuYyAgICAgICAgIHwgNiArKysrLS0KIHhl
bi9hcmNoL3g4Ni9ndWVzdC94ZW4uYyAgICB8IDQgKystLQogeGVuL2FyY2gveDg2L21tLmMgICAg
ICAgICAgIHwgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9zZXR1cC5oIHwgMSArCiA1IGZpbGVz
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9uLmMKaW5k
ZXggNmM2YmQ2MzMwMS4uYWRlZGI1NTdkZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2NwdS9j
b21tb24uYworKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCkBAIC0yNzQsNiArMjc0LDE1
IEBAIHN0YXRpYyBpbmxpbmUgdTMyIHBoeXNfcGtnX2lkKHUzMiBjcHVpZF9hcGljLCBpbnQgaW5k
ZXhfbXNiKQogCXJldHVybiBfcGh5c19wa2dfaWQoZ2V0X2FwaWNfaWQoKSwgaW5kZXhfbXNiKTsK
IH0KIAorLyoKKyAqIFNvbWV0aW1lcyBpdCdzIHRvbyBlYXJseSB0byB1c2UgY3B1X2hhc19oeXBl
cnZpc29yIHdoaWNoIGlzIGF2YWlsYWJsZSBvbmx5CisgKiBhZnRlciBlYXJseV9jcHVfaW5pdCgp
LgorICovCitib29sIF9faW5pdCBlYXJseV9jcHVfaGFzX2h5cGVydmlzb3Iodm9pZCkKK3sKKwly
ZXR1cm4gY3B1aWRfZWN4KDEpICYgY3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1Ip
OworfQorCiAvKiBEbyBtaW5pbXVtIENQVSBkZXRlY3Rpb24gZWFybHkuCiAgICBGaWVsZHMgcmVh
bGx5IG5lZWRlZDogdmVuZG9yLCBjcHVpZF9sZXZlbCwgZmFtaWx5LCBtb2RlbCwgbWFzaywgY2Fj
aGUgYWxpZ25tZW50LgogICAgVGhlIG90aGVycyBhcmUgbm90IHRvdWNoZWQgdG8gYXZvaWQgdW53
YW50ZWQgc2lkZSBlZmZlY3RzLgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2U4MjAuYyBiL3hl
bi9hcmNoL3g4Ni9lODIwLmMKaW5kZXggOGU4YTJjNGUxYi4uZGJiZTZjYWMwYSAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L2U4MjAuYworKysgYi94ZW4vYXJjaC94ODYvZTgyMC5jCkBAIC0xMCw2
ICsxMCw3IEBACiAjaW5jbHVkZSA8YXNtL210cnIuaD4KICNpbmNsdWRlIDxhc20vbXNyLmg+CiAj
aW5jbHVkZSA8YXNtL2d1ZXN0Lmg+CisjaW5jbHVkZSA8YXNtL3NldHVwLmg+CiAKIC8qCiAgKiBv
cHRfbWVtOiBMaW1pdCBtYXhpbXVtIGFkZHJlc3Mgb2YgcGh5c2ljYWwgUkFNLgpAQCAtMzE4LDkg
KzMxOSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBjb3B5X2U4MjBfbWFwKHN0cnVjdCBlODIwZW50
cnkgKiBiaW9zbWFwLCB1bnNpZ25lZCBpbnQgbnJfbWFwKQogCiAgICAgICAgIC8qCiAgICAgICAg
ICAqIFNvbWUgQklPU2VzIGNsYWltIFJBTSBpbiB0aGUgNjQwayAtIDFNIHJlZ2lvbi4KLSAgICAg
ICAgICogTm90IHJpZ2h0LiBGaXggaXQgdXAuCisgICAgICAgICAqIE5vdCByaWdodC4gRml4IGl0
IHVwLCBidXQgb25seSB3aGVuIHJ1bm5pbmcgb24gYmFyZSBtZXRhbC4KICAgICAgICAgICovCi0g
ICAgICAgIGlmICh0eXBlID09IEU4MjBfUkFNKSB7CisgICAgICAgIGlmICggIWVhcmx5X2NwdV9o
YXNfaHlwZXJ2aXNvcigpICYmIHR5cGUgPT0gRTgyMF9SQU0gKQorICAgICAgICB7CiAgICAgICAg
ICAgICBpZiAoc3RhcnQgPCAweDEwMDAwMFVMTCAmJiBlbmQgPiAweEEwMDAwVUxMKSB7CiAgICAg
ICAgICAgICAgICAgaWYgKHN0YXJ0IDwgMHhBMDAwMFVMTCkKICAgICAgICAgICAgICAgICAgICAg
YWRkX21lbW9yeV9yZWdpb24oc3RhcnQsIDB4QTAwMDBVTEwtc3RhcnQsIHR5cGUpOwpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi5j
CmluZGV4IDdiN2E1YmFkYWIuLjQ4ZWEzMjI0ZWEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC94ZW4uYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMKQEAgLTMxLDYgKzMxLDcg
QEAKICNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4KICNpbmNsdWRlIDxhc20vbXNyLmg+CiAjaW5jbHVk
ZSA8YXNtL3Byb2Nlc3Nvci5oPgorI2luY2x1ZGUgPGFzbS9zZXR1cC5oPgogCiAjaW5jbHVkZSA8
cHVibGljL2FyY2gteDg2L2NwdWlkLmg+CiAjaW5jbHVkZSA8cHVibGljL2h2bS9wYXJhbXMuaD4K
QEAgLTcyLDggKzczLDcgQEAgdm9pZCBfX2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKQogICAg
IGlmICggeGVuX2d1ZXN0ICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgLyogVG9vIGVhcmx5IHRv
IHVzZSBjcHVfaGFzX2h5cGVydmlzb3IgKi8KLSAgICBpZiAoICEoY3B1aWRfZWN4KDEpICYgY3B1
ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpKSApCisgICAgaWYgKCAhZWFybHlfY3B1
X2hhc19oeXBlcnZpc29yKCkgKQogICAgICAgICByZXR1cm47CiAKICAgICBmaW5kX3hlbl9sZWF2
ZXMoKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMK
aW5kZXggOTk4MTZmYzY3Yy4uZGYxNjQxNjM0YyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21t
LmMKKysrIGIveGVuL2FyY2gveDg2L21tLmMKQEAgLTU5NDMsNyArNTk0Myw3IEBAIGNvbnN0IHN0
cnVjdCBwbGF0Zm9ybV9iYWRfcGFnZSAqX19pbml0IGdldF9wbGF0Zm9ybV9iYWRwYWdlcyh1bnNp
Z25lZCBpbnQgKmFycmF5CiAgICAgY2FzZSAweDAwMDgwNmUwOiAvKiBlcnJhdHVtIEtCTD8/PyAq
LwogICAgIGNhc2UgMHgwMDA5MDZlMDogLyogZXJyYXRhIEtCTD8/PyAvIEtCVzExNCAvIENGVzEw
MyAqLwogICAgICAgICAqYXJyYXlfc2l6ZSA9IChjcHVpZF9lYXgoMCkgPj0gNyAmJgotICAgICAg
ICAgICAgICAgICAgICAgICAhKGNwdWlkX2VjeCgxKSAmIGNwdWZlYXRfbWFzayhYODZfRkVBVFVS
RV9IWVBFUlZJU09SKSkgJiYKKyAgICAgICAgICAgICAgICAgICAgICAgIWVhcmx5X2NwdV9oYXNf
aHlwZXJ2aXNvcigpICYmCiAgICAgICAgICAgICAgICAgICAgICAgIChjcHVpZF9jb3VudF9lYngo
NywgMCkgJiBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSExFKSkpOwogICAgICAgICByZXR1cm4g
JmhsZV9iYWRfcGFnZTsKICAgICB9CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3Nl
dHVwLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3NldHVwLmgKaW5kZXggODYxZDQ2ZDZhYy4uZGRk
Mzc5MDdmMSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zZXR1cC5oCisrKyBiL3hl
bi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaApAQCAtMTYsNiArMTYsNyBAQCBleHRlcm4gdW5zaWdu
ZWQgbG9uZyB4ZW5oZWFwX2luaXRpYWxfcGh5c19zdGFydDsKIAogdm9pZCBlYXJseV9jcHVfaW5p
dCh2b2lkKTsKIHZvaWQgZWFybHlfdGltZV9pbml0KHZvaWQpOworYm9vbCBlYXJseV9jcHVfaGFz
X2h5cGVydmlzb3Iodm9pZCk7CiAKIHZvaWQgc2V0X25yX2NwdV9pZHModW5zaWduZWQgaW50IG1h
eF9jcHVzKTsKIAotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
