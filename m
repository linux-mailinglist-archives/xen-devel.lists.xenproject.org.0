Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30441865D1
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 17:32:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvkMS-0002we-JL; Thu, 08 Aug 2019 15:29:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6/vj=WE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hvkMQ-0002wZ-Cl
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 15:29:50 +0000
X-Inumbo-ID: 5b3dc34a-b9f1-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5b3dc34a-b9f1-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 15:29:48 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KPetSwn3EtU2KXyIKP/RQ/fWo7KA/At1unOe3B1NbY4fChK8q1rBJUT4AMssSh0fA2LmUsmjky
 heOmv1fsbVX6v9ichiC4p27F3j7x5x253tuyx8gcfKgW7yKXSCZ/Ju4dTPab1NlsclFG4dESFN
 awAFVvgoAaM2FcPKbFzwsxDY3DOjz9bW4GmLg7U2sSCxXo4ymVynDohN4AFhY5bPHf0cF3qa3f
 8E2tFMTFiWbPfX/4klytRt5ij/2dFBtTq8eDIrA9Cow0A0OBg2jcpLolgH0iSx659WLC+zNKaS
 4M4=
X-SBRS: 2.7
X-MesageID: 4033239
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,361,1559534400"; 
   d="scan'208";a="4033239"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 8 Aug 2019 16:29:44 +0100
Message-ID: <20190808152944.16287-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] x86/atomic: Improvements and simplifications
 to assembly constraints
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

ICogQ29uc3RyYWludHMgaW4gdGhlIGZvcm0gIj1yIiAoeCkgOiAiMCIgKHgpIGNhbiBiZSBmb2xk
ZWQgdG8ganVzdCAiK3IiICh4KQogKiBTd2l0Y2ggdG8gdXNpbmcgbmFtZWQgcGFyYW1ldGVycyAo
bW9zdGx5IGZvciBsZWdpYmlsaXR5KSB3aGljaCBpbgogICBwYXJ0aWN1bGFyIGhlbHBzIHdpdGgu
Li4KICogX194Y2hnKCksIF9fY21weGNoZygpIGFuZCBfX2NtcHhjaGdfdXNlcigpIG1vZGlmeSB0
aGVpciBtZW1vcnkgb3BlcmFuZCwgc28KICAgbXVzdCBsaXN0IGl0IGFzIGFuIG91dHB1dCBvcGVy
YW5kLiAgVGhpcyBvbmx5IHdvcmtzIGJlY2F1c2UgdGhleSBlYWNoIGhhdmUKICAgYSBtZW1vcnkg
Y2xvYmJlciB0byBnaXZlIHRoZSBjb25zdHJ1Y3QgZnVsbCBjb21waWxlci1iYXJyaWVyIHByb3Bl
cnRpZXMuCiAqIEV2ZXJ5IG1lbW9yeSBvcGVyYW5kIGhhcyBhbiBleHBsaWNpdCBrbm93biBzaXpl
LiAgTGV0dGluZyB0aGUgY29tcGlsZXIgc2VlCiAgIHRoZSByZWFsIHNpemUgcmF0aGVyIHRoYW4g
b2JzY3VyaW5nIGl0IHdpdGggX194ZygpIGFsbG93cyBmb3IgdGhlIHJlbW92YWwKICAgb2YgdGhl
IGluc3RydWN0aW9uIHNpemUgc3VmZml4ZXMgd2l0aG91dCBpbnRyb2R1Y2luZyBhbWJpZ3VpdHku
CiAqIE1pc2Mgc3R5bGUgY2hhbmdlcy4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPgpDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKdjM6CiAqIFJldGFpbiAicSIKCnYyOgogKiBD
b3JyZWN0IGNvbW1lbnQgV1JUIDMyYml0IGJ1aWxkcyBhbmQgIj1xIiBjb25zdHJhaW50cwogKiBE
cm9wIHNlbWljb2xvbnMgYWZ0ZXIgdGhlIGxvY2sgcHJlZml4CiAqIEZ1cnRoZXIgcmVkdWNlIHRo
ZSB1c2Ugb2YgcG9zaXRpb25hbCBwYXJhbWV0ZXJzCgpUaGUgcmVhc29uIHRoZSB2b2xhdGlsZSBj
YXN0IGluIF9fY21weGNoZ191c2VyKCkgY2FuJ3QgYmUgZHJvcHBlZCBpcyBiZWNhdXNlCndpdGhv
dXQgaXQsIHRoZSBjb21waWxlciB1c2VzIGEgc3RhY2sgY29weSByYXRoZXIgdGhhbiB0aGUgaW4t
bWVtb3J5IGNvcHksCndoaWNoIGVuZHMgdXAgdHJpcHBpbmc6CgogIC8qIEFsbG93ZWQgdG8gY2hh
bmdlIGluIEFjY2Vzc2VkL0RpcnR5IGZsYWdzIG9ubHkuICovCiAgQlVHX09OKCh0IF4gb2xkKSAm
IH4oaW50cHRlX3QpKF9QQUdFX0FDQ0VTU0VEfF9QQUdFX0RJUlRZKSk7Ci0tLQogeGVuL2luY2x1
ZGUvYXNtLXg4Ni9zeXN0ZW0uaCAgICAgICAgfCA5OSArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3g4Nl82NC9zeXN0ZW0uaCB8IDM4ICsr
KysrKystLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyksIDcyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc3lzdGVtLmggYi94ZW4v
aW5jbHVkZS9hc20teDg2L3N5c3RlbS5oCmluZGV4IDMyNDY3OTdiZWMuLjZkZTkwZTQ2YjIgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvc3lzdGVtLmgKKysrIGIveGVuL2luY2x1ZGUv
YXNtLXg4Ni9zeXN0ZW0uaApAQCAtMjQsOSArMjQsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY2xm
bHVzaChjb25zdCB2b2lkICpwKQogI2RlZmluZSB4Y2hnKHB0cix2KSBcCiAgICAgKChfX3R5cGVv
Zl9fKCoocHRyKSkpX194Y2hnKCh1bnNpZ25lZCBsb25nKSh2KSwocHRyKSxzaXplb2YoKihwdHIp
KSkpCiAKLXN0cnVjdCBfX3hjaGdfZHVtbXkgeyB1bnNpZ25lZCBsb25nIGFbMTAwXTsgfTsKLSNk
ZWZpbmUgX194Zyh4KSAoKHZvbGF0aWxlIHN0cnVjdCBfX3hjaGdfZHVtbXkgKikoeCkpCi0KICNp
bmNsdWRlIDxhc20veDg2XzY0L3N5c3RlbS5oPgogCiAvKgpAQCAtNDAsMjggKzM3LDI0IEBAIHN0
YXRpYyBhbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgX194Y2hnKAogICAgIHN3aXRjaCAoIHNp
emUgKQogICAgIHsKICAgICBjYXNlIDE6Ci0gICAgICAgIGFzbSB2b2xhdGlsZSAoICJ4Y2hnYiAl
YjAsJTEiCi0gICAgICAgICAgICAgICAgICAgICAgIDogIj1xIiAoeCkKLSAgICAgICAgICAgICAg
ICAgICAgICAgOiAibSIgKCpfX3hnKHB0cikpLCAiMCIgKHgpCi0gICAgICAgICAgICAgICAgICAg
ICAgIDogIm1lbW9yeSIgKTsKKyAgICAgICAgYXNtIHZvbGF0aWxlICggInhjaGcgJWJbeF0sICVb
cHRyXSIKKyAgICAgICAgICAgICAgICAgICAgICAgOiBbeF0gIitxIiAoeCksIFtwdHJdICIrbSIg
KCoodWludDhfdCAqKXB0cikKKyAgICAgICAgICAgICAgICAgICAgICAgOjogIm1lbW9yeSIgKTsK
ICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSAyOgotICAgICAgICBhc20gdm9sYXRpbGUgKCAieGNo
Z3cgJXcwLCUxIgotICAgICAgICAgICAgICAgICAgICAgICA6ICI9ciIgKHgpCi0gICAgICAgICAg
ICAgICAgICAgICAgIDogIm0iICgqX194ZyhwdHIpKSwgIjAiICh4KQotICAgICAgICAgICAgICAg
ICAgICAgICA6ICJtZW1vcnkiICk7CisgICAgICAgIGFzbSB2b2xhdGlsZSAoICJ4Y2hnICV3W3hd
LCAlW3B0cl0iCisgICAgICAgICAgICAgICAgICAgICAgIDogW3hdICIrciIgKHgpLCBbcHRyXSAi
K20iICgqKHVpbnQxNl90ICopcHRyKQorICAgICAgICAgICAgICAgICAgICAgICA6OiAibWVtb3J5
IiApOwogICAgICAgICBicmVhazsKICAgICBjYXNlIDQ6Ci0gICAgICAgIGFzbSB2b2xhdGlsZSAo
ICJ4Y2hnbCAlazAsJTEiCi0gICAgICAgICAgICAgICAgICAgICAgIDogIj1yIiAoeCkKLSAgICAg
ICAgICAgICAgICAgICAgICAgOiAibSIgKCpfX3hnKHB0cikpLCAiMCIgKHgpCi0gICAgICAgICAg
ICAgICAgICAgICAgIDogIm1lbW9yeSIgKTsKKyAgICAgICAgYXNtIHZvbGF0aWxlICggInhjaGcg
JWtbeF0sICVbcHRyXSIKKyAgICAgICAgICAgICAgICAgICAgICAgOiBbeF0gIityIiAoeCksIFtw
dHJdICIrbSIgKCoodWludDMyX3QgKilwdHIpCisgICAgICAgICAgICAgICAgICAgICAgIDo6ICJt
ZW1vcnkiICk7CiAgICAgICAgIGJyZWFrOwogICAgIGNhc2UgODoKLSAgICAgICAgYXNtIHZvbGF0
aWxlICggInhjaGdxICUwLCUxIgotICAgICAgICAgICAgICAgICAgICAgICA6ICI9ciIgKHgpCi0g
ICAgICAgICAgICAgICAgICAgICAgIDogIm0iICgqX194ZyhwdHIpKSwgIjAiICh4KQotICAgICAg
ICAgICAgICAgICAgICAgICA6ICJtZW1vcnkiICk7CisgICAgICAgIGFzbSB2b2xhdGlsZSAoICJ4
Y2hnICVxW3hdLCAlW3B0cl0iCisgICAgICAgICAgICAgICAgICAgICAgIDogW3hdICIrciIgKHgp
LCBbcHRyXSAiK20iICgqKHVpbnQ2NF90ICopcHRyKQorICAgICAgICAgICAgICAgICAgICAgICA6
OiAibWVtb3J5IiApOwogICAgICAgICBicmVhazsKICAgICB9CiAgICAgcmV0dXJuIHg7CkBAIC04
MCwzMSArNzMsMjcgQEAgc3RhdGljIGFsd2F5c19pbmxpbmUgdW5zaWduZWQgbG9uZyBfX2NtcHhj
aGcoCiAgICAgc3dpdGNoICggc2l6ZSApCiAgICAgewogICAgIGNhc2UgMToKLSAgICAgICAgYXNt
IHZvbGF0aWxlICggImxvY2s7IGNtcHhjaGdiICViMSwlMiIKLSAgICAgICAgICAgICAgICAgICAg
ICAgOiAiPWEiIChwcmV2KQotICAgICAgICAgICAgICAgICAgICAgICA6ICJxIiAobmV3KSwgIm0i
ICgqX194ZyhwdHIpKSwKLSAgICAgICAgICAgICAgICAgICAgICAgIjAiIChvbGQpCisgICAgICAg
IGFzbSB2b2xhdGlsZSAoICJsb2NrIGNtcHhjaGcgJWJbbmV3XSwgJVtwdHJdIgorICAgICAgICAg
ICAgICAgICAgICAgICA6ICI9YSIgKHByZXYpLCBbcHRyXSAiK20iICgqKHVpbnQ4X3QgKilwdHIp
CisgICAgICAgICAgICAgICAgICAgICAgIDogW25ld10gInEiIChuZXcpLCAiYSIgKG9sZCkKICAg
ICAgICAgICAgICAgICAgICAgICAgOiAibWVtb3J5IiApOwogICAgICAgICByZXR1cm4gcHJldjsK
ICAgICBjYXNlIDI6Ci0gICAgICAgIGFzbSB2b2xhdGlsZSAoICJsb2NrOyBjbXB4Y2hndyAldzEs
JTIiCi0gICAgICAgICAgICAgICAgICAgICAgIDogIj1hIiAocHJldikKLSAgICAgICAgICAgICAg
ICAgICAgICAgOiAiciIgKG5ldyksICJtIiAoKl9feGcocHRyKSksCi0gICAgICAgICAgICAgICAg
ICAgICAgICIwIiAob2xkKQorICAgICAgICBhc20gdm9sYXRpbGUgKCAibG9jayBjbXB4Y2hnICV3
W25ld10sICVbcHRyXSIKKyAgICAgICAgICAgICAgICAgICAgICAgOiAiPWEiIChwcmV2KSwgW3B0
cl0gIittIiAoKih1aW50MTZfdCAqKXB0cikKKyAgICAgICAgICAgICAgICAgICAgICAgOiBbbmV3
XSAiciIgKG5ldyksICJhIiAob2xkKQogICAgICAgICAgICAgICAgICAgICAgICA6ICJtZW1vcnki
ICk7CiAgICAgICAgIHJldHVybiBwcmV2OwogICAgIGNhc2UgNDoKLSAgICAgICAgYXNtIHZvbGF0
aWxlICggImxvY2s7IGNtcHhjaGdsICVrMSwlMiIKLSAgICAgICAgICAgICAgICAgICAgICAgOiAi
PWEiIChwcmV2KQotICAgICAgICAgICAgICAgICAgICAgICA6ICJyIiAobmV3KSwgIm0iICgqX194
ZyhwdHIpKSwKLSAgICAgICAgICAgICAgICAgICAgICAgIjAiIChvbGQpCisgICAgICAgIGFzbSB2
b2xhdGlsZSAoICJsb2NrIGNtcHhjaGcgJWtbbmV3XSwgJVtwdHJdIgorICAgICAgICAgICAgICAg
ICAgICAgICA6ICI9YSIgKHByZXYpLCBbcHRyXSAiK20iICgqKHVpbnQzMl90ICopcHRyKQorICAg
ICAgICAgICAgICAgICAgICAgICA6IFtuZXddICJyIiAobmV3KSwgImEiIChvbGQpCiAgICAgICAg
ICAgICAgICAgICAgICAgIDogIm1lbW9yeSIgKTsKICAgICAgICAgcmV0dXJuIHByZXY7CiAgICAg
Y2FzZSA4OgotICAgICAgICBhc20gdm9sYXRpbGUgKCAibG9jazsgY21weGNoZ3EgJTEsJTIiCi0g
ICAgICAgICAgICAgICAgICAgICAgIDogIj1hIiAocHJldikKLSAgICAgICAgICAgICAgICAgICAg
ICAgOiAiciIgKG5ldyksICJtIiAoKl9feGcocHRyKSksCi0gICAgICAgICAgICAgICAgICAgICAg
ICIwIiAob2xkKQorICAgICAgICBhc20gdm9sYXRpbGUgKCAibG9jayBjbXB4Y2hnICVxW25ld10s
ICVbcHRyXSIKKyAgICAgICAgICAgICAgICAgICAgICAgOiAiPWEiIChwcmV2KSwgW3B0cl0gIitt
IiAoKih1aW50NjRfdCAqKXB0cikKKyAgICAgICAgICAgICAgICAgICAgICAgOiBbbmV3XSAiciIg
KG5ldyksICJhIiAob2xkKQogICAgICAgICAgICAgICAgICAgICAgICA6ICJtZW1vcnkiICk7CiAg
ICAgICAgIHJldHVybiBwcmV2OwogICAgIH0KQEAgLTExOSwyNCArMTA4LDI0IEBAIHN0YXRpYyBh
bHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgY21weGNoZ19sb2NhbF8oCiAgICAgc3dpdGNoICgg
c2l6ZSApCiAgICAgewogICAgIGNhc2UgMToKLSAgICAgICAgYXNtIHZvbGF0aWxlICggImNtcHhj
aGdiICViMiwgJTEiCi0gICAgICAgICAgICAgICAgICAgICAgIDogIj1hIiAocHJldiksICIrbSIg
KCoodWludDhfdCAqKXB0cikKLSAgICAgICAgICAgICAgICAgICAgICAgOiAicSIgKG5ldyksICIw
IiAob2xkKSApOworICAgICAgICBhc20gdm9sYXRpbGUgKCAiY21weGNoZyAlYltuZXddLCAlW3B0
cl0iCisgICAgICAgICAgICAgICAgICAgICAgIDogIj1hIiAocHJldiksIFtwdHJdICIrbSIgKCoo
dWludDhfdCAqKXB0cikKKyAgICAgICAgICAgICAgICAgICAgICAgOiBbbmV3XSAicSIgKG5ldyks
ICJhIiAob2xkKSApOwogICAgICAgICBicmVhazsKICAgICBjYXNlIDI6Ci0gICAgICAgIGFzbSB2
b2xhdGlsZSAoICJjbXB4Y2hndyAldzIsICUxIgotICAgICAgICAgICAgICAgICAgICAgICA6ICI9
YSIgKHByZXYpLCAiK20iICgqKHVpbnQxNl90ICopcHRyKQotICAgICAgICAgICAgICAgICAgICAg
ICA6ICJyIiAobmV3KSwgIjAiIChvbGQpICk7CisgICAgICAgIGFzbSB2b2xhdGlsZSAoICJjbXB4
Y2hnICV3W25ld10sICVbcHRyXSIKKyAgICAgICAgICAgICAgICAgICAgICAgOiAiPWEiIChwcmV2
KSwgW3B0cl0gIittIiAoKih1aW50MTZfdCAqKXB0cikKKyAgICAgICAgICAgICAgICAgICAgICAg
OiBbbmV3XSAiciIgKG5ldyksICJhIiAob2xkKSApOwogICAgICAgICBicmVhazsKICAgICBjYXNl
IDQ6Ci0gICAgICAgIGFzbSB2b2xhdGlsZSAoICJjbXB4Y2hnbCAlazIsICUxIgotICAgICAgICAg
ICAgICAgICAgICAgICA6ICI9YSIgKHByZXYpLCAiK20iICgqKHVpbnQzMl90ICopcHRyKQotICAg
ICAgICAgICAgICAgICAgICAgICA6ICJyIiAobmV3KSwgIjAiIChvbGQpICk7CisgICAgICAgIGFz
bSB2b2xhdGlsZSAoICJjbXB4Y2hnICVrW25ld10sICVbcHRyXSIKKyAgICAgICAgICAgICAgICAg
ICAgICAgOiAiPWEiIChwcmV2KSwgW3B0cl0gIittIiAoKih1aW50MzJfdCAqKXB0cikKKyAgICAg
ICAgICAgICAgICAgICAgICAgOiBbbmV3XSAiciIgKG5ldyksICJhIiAob2xkKSApOwogICAgICAg
ICBicmVhazsKICAgICBjYXNlIDg6Ci0gICAgICAgIGFzbSB2b2xhdGlsZSAoICJjbXB4Y2hncSAl
MiwgJTEiCi0gICAgICAgICAgICAgICAgICAgICAgIDogIj1hIiAocHJldiksICIrbSIgKCoodWlu
dDY0X3QgKilwdHIpCi0gICAgICAgICAgICAgICAgICAgICAgIDogInIiIChuZXcpLCAiMCIgKG9s
ZCkgKTsKKyAgICAgICAgYXNtIHZvbGF0aWxlICggImNtcHhjaGcgJXFbbmV3XSwgJVtwdHJdIgor
ICAgICAgICAgICAgICAgICAgICAgICA6ICI9YSIgKHByZXYpLCBbcHRyXSAiK20iICgqKHVpbnQ2
NF90ICopcHRyKQorICAgICAgICAgICAgICAgICAgICAgICA6IFtuZXddICJyIiAobmV3KSwgImEi
IChvbGQpICk7CiAgICAgICAgIGJyZWFrOwogICAgIH0KIApAQCAtMTYyLDIzICsxNTEsMjMgQEAg
c3RhdGljIGFsd2F5c19pbmxpbmUgdW5zaWduZWQgbG9uZyBfX3hhZGQoCiAgICAgc3dpdGNoICgg
c2l6ZSApCiAgICAgewogICAgIGNhc2UgMToKLSAgICAgICAgYXNtIHZvbGF0aWxlICggImxvY2s7
IHhhZGRiICViMCwlMSIKLSAgICAgICAgICAgICAgICAgICAgICAgOiAiK3IiICh2KSwgIittIiAo
Kl9feGcocHRyKSkKKyAgICAgICAgYXNtIHZvbGF0aWxlICggImxvY2sgeGFkZCAlYlt2XSwgJVtw
dHJdIgorICAgICAgICAgICAgICAgICAgICAgICA6IFt2XSAiK3EiICh2KSwgW3B0cl0gIittIiAo
Kih1aW50OF90ICopcHRyKQogICAgICAgICAgICAgICAgICAgICAgICA6OiAibWVtb3J5Iik7CiAg
ICAgICAgIHJldHVybiB2OwogICAgIGNhc2UgMjoKLSAgICAgICAgYXNtIHZvbGF0aWxlICggImxv
Y2s7IHhhZGR3ICV3MCwlMSIKLSAgICAgICAgICAgICAgICAgICAgICAgOiAiK3IiICh2KSwgIitt
IiAoKl9feGcocHRyKSkKKyAgICAgICAgYXNtIHZvbGF0aWxlICggImxvY2sgeGFkZCAld1t2XSwg
JVtwdHJdIgorICAgICAgICAgICAgICAgICAgICAgICA6IFt2XSAiK3IiICh2KSwgW3B0cl0gIitt
IiAoKih1aW50MTZfdCAqKXB0cikKICAgICAgICAgICAgICAgICAgICAgICAgOjogIm1lbW9yeSIp
OwogICAgICAgICByZXR1cm4gdjsKICAgICBjYXNlIDQ6Ci0gICAgICAgIGFzbSB2b2xhdGlsZSAo
ICJsb2NrOyB4YWRkbCAlazAsJTEiCi0gICAgICAgICAgICAgICAgICAgICAgIDogIityIiAodiks
ICIrbSIgKCpfX3hnKHB0cikpCisgICAgICAgIGFzbSB2b2xhdGlsZSAoICJsb2NrIHhhZGQgJWtb
dl0sICVbcHRyXSIKKyAgICAgICAgICAgICAgICAgICAgICAgOiBbdl0gIityIiAodiksIFtwdHJd
ICIrbSIgKCoodWludDMyX3QgKilwdHIpCiAgICAgICAgICAgICAgICAgICAgICAgIDo6ICJtZW1v
cnkiKTsKICAgICAgICAgcmV0dXJuIHY7CiAgICAgY2FzZSA4OgotICAgICAgICBhc20gdm9sYXRp
bGUgKCAibG9jazsgeGFkZHEgJXEwLCUxIgotICAgICAgICAgICAgICAgICAgICAgICA6ICIrciIg
KHYpLCAiK20iICgqX194ZyhwdHIpKQorICAgICAgICBhc20gdm9sYXRpbGUgKCAibG9jayB4YWRk
ICVxW3ZdLCAlW3B0cl0iCisgICAgICAgICAgICAgICAgICAgICAgIDogW3ZdICIrciIgKHYpLCBb
cHRyXSAiK20iICgqKHVpbnQ2NF90ICopcHRyKQogICAgICAgICAgICAgICAgICAgICAgICA6OiAi
bWVtb3J5Iik7CiAKICAgICAgICAgcmV0dXJuIHY7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9h
c20teDg2L3g4Nl82NC9zeXN0ZW0uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYveDg2XzY0L3N5c3Rl
bS5oCmluZGV4IGZhZTU3YmFjZTguLjg3ZTg5OWZjYTkgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYveDg2XzY0L3N5c3RlbS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYveDg2XzY0
L3N5c3RlbS5oCkBAIC0yNCw5ICsyNCwxMCBAQCBzdGF0aWMgYWx3YXlzX2lubGluZSBfX3VpbnQx
MjhfdCBfX2NtcHhjaGcxNmIoCiAgICAgQVNTRVJUKGNwdV9oYXNfY3gxNik7CiAKICAgICAvKiBE
b24ndCB1c2UgIj1BIiBoZXJlIC0gY2xhbmcgY2FuJ3QgZGVhbCB3aXRoIHRoYXQuICovCi0gICAg
YXNtIHZvbGF0aWxlICggImxvY2s7IGNtcHhjaGcxNmIgJTIiCi0gICAgICAgICAgICAgICAgICAg
OiAiPWQiIChwcmV2LmhpKSwgIj1hIiAocHJldi5sbyksICIrbSIgKCpfX3hnKHB0cikpCi0gICAg
ICAgICAgICAgICAgICAgOiAiYyIgKG5ldy5oaSksICJiIiAobmV3LmxvKSwgIjAiIChvbGQuaGkp
LCAiMSIgKG9sZC5sbykgKTsKKyAgICBhc20gdm9sYXRpbGUgKCAibG9jayBjbXB4Y2hnMTZiICVb
cHRyXSIKKyAgICAgICAgICAgICAgICAgICA6ICI9ZCIgKHByZXYuaGkpLCAiPWEiIChwcmV2Lmxv
KSwKKyAgICAgICAgICAgICAgICAgICAgIFtwdHJdICIrbSIgKCooX191aW50MTI4X3QgKilwdHIp
CisgICAgICAgICAgICAgICAgICAgOiAiYyIgKG5ldy5oaSksICJiIiAobmV3LmxvKSwgImQiIChv
bGQuaGkpLCAiYSIgKG9sZC5sbykgKTsKIAogICAgIHJldHVybiBwcmV2LnJhdzsKIH0KQEAgLTQy
LDkgKzQzLDEwIEBAIHN0YXRpYyBhbHdheXNfaW5saW5lIF9fdWludDEyOF90IGNtcHhjaGcxNmJf
bG9jYWxfKAogICAgIEFTU0VSVChjcHVfaGFzX2N4MTYpOwogCiAgICAgLyogRG9uJ3QgdXNlICI9
QSIgaGVyZSAtIGNsYW5nIGNhbid0IGRlYWwgd2l0aCB0aGF0LiAqLwotICAgIGFzbSB2b2xhdGls
ZSAoICJjbXB4Y2hnMTZiICUyIgotICAgICAgICAgICAgICAgICAgIDogIj1kIiAocHJldi5oaSks
ICI9YSIgKHByZXYubG8pLCAiK20iICgqKF9fdWludDEyOF90ICopcHRyKQotICAgICAgICAgICAg
ICAgICAgIDogImMiIChuZXcuaGkpLCAiYiIgKG5ldy5sbyksICIwIiAob2xkLmhpKSwgIjEiIChv
bGQubG8pICk7CisgICAgYXNtIHZvbGF0aWxlICggImNtcHhjaGcxNmIgJVtwdHJdIgorICAgICAg
ICAgICAgICAgICAgIDogIj1kIiAocHJldi5oaSksICI9YSIgKHByZXYubG8pLAorICAgICAgICAg
ICAgICAgICAgICAgW3B0cl0gIittIiAoKihfX3VpbnQxMjhfdCAqKXB0cikKKyAgICAgICAgICAg
ICAgICAgICA6ICJjIiAobmV3LmhpKSwgImIiIChuZXcubG8pLCAiZCIgKG9sZC5oaSksICJhIiAo
b2xkLmxvKSApOwogCiAgICAgcmV0dXJuIHByZXYucmF3OwogfQpAQCAtNjMsMzYgKzY1LDM4IEBA
IHN0YXRpYyBhbHdheXNfaW5saW5lIF9fdWludDEyOF90IGNtcHhjaGcxNmJfbG9jYWxfKAogICog
SWYgbm8gZmF1bHQgb2NjdXJzIHRoZW4gX28gaXMgdXBkYXRlZCB0byB0aGUgdmFsdWUgd2Ugc2F3
IGF0IF9wLiBJZiB0aGlzCiAgKiBpcyB0aGUgc2FtZSBhcyB0aGUgaW5pdGlhbCB2YWx1ZSBvZiBf
byB0aGVuIF9uIGlzIHdyaXR0ZW4gdG8gbG9jYXRpb24gX3AuCiAgKi8KLSNkZWZpbmUgX19jbXB4
Y2hnX3VzZXIoX3AsX28sX24sX2lzdWZmLF9vcHByZSxfcmVndHlwZSkgICAgICAgICAgICAgICAg
IFwKKyNkZWZpbmUgX19jbXB4Y2hnX3VzZXIoX3AsIF9vLCBfbiwgX29wcHJlLCBfcmVndHlwZSkg
ICAgICAgICAgICAgICAgICAgIFwKICAgICBzdGFjKCk7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICBhc20gdm9sYXRpbGUg
KCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
LSAgICAgICAgIjE6IGxvY2s7IGNtcHhjaGciX2lzdWZmIiAlIl9vcHByZSIyLCUzXG4iICAgICAg
ICAgICAgICAgICAgICAgIFwKKyAgICAgICAgIjE6IGxvY2sgY21weGNoZyAlIl9vcHByZSJbbmV3
XSwgJVtwdHJdXG4iICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgIjI6XG4iICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAg
ICAgICAgIi5zZWN0aW9uIC5maXh1cCxcImF4XCJcbiIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKLSAgICAgICAgIjM6ICAgICBtb3ZsICQxLCUxXG4iICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgIjM6ICAgICBtb3ZsICQx
LCAlW3JjXVxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAg
ICAgIiAgICAgICBqbXAgMmJcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKICAgICAgICAgIi5wcmV2aW91c1xuIiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICAgICAgX0FTTV9FWFRBQkxFKDFiLCAz
YikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAg
OiAiPWEiIChfbyksICI9ciIgKF9yYykgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKLSAgICAgICAgOiBfcmVndHlwZSAoX24pLCAibSIgKCpfX3hnKCh2b2xhdGlsZSB2
b2lkICopX3ApKSwgIjAiIChfbyksICIxIiAoMCkgXAorICAgICAgICA6ICIrYSIgKF9vKSwgW3Jj
XSAiPXIiIChfcmMpLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAorICAgICAg
ICAgIFtwdHJdICIrbSIgKCoodm9sYXRpbGUgdHlwZW9mKCooX3ApKSAqKShfcCkpICAgICAgICAg
ICAgICAgICAgXAorICAgICAgICA6IFtuZXddIF9yZWd0eXBlIChfbiksICJbcmNdIiAoMCkgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgICAgICA6ICJtZW1vcnkiKTsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAgIGNsYWMo
KQogCi0jZGVmaW5lIGNtcHhjaGdfdXNlcihfcCxfbyxfbikgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCisjZGVmaW5lIGNtcHhjaGdfdXNlcihfcCwgX28sIF9uKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAoeyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CiAgICAgaW50IF9yYzsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCi0gICAgc3dpdGNoICggc2l6ZW9mKCooX3ApKSApIHsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgc3dpdGNoICggc2l6ZW9m
KCooX3ApKSApICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisg
ICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCiAgICAgY2FzZSAxOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgICAgIF9fY21weGNoZ191c2Vy
KF9wLF9vLF9uLCJiIiwiYiIsInEiKTsgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAg
ICAgIF9fY21weGNoZ191c2VyKF9wLCBfbywgX24sICJiIiwgInEiKTsgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCiAgICAgICAgIGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgY2FzZSAyOiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0gICAgICAg
IF9fY21weGNoZ191c2VyKF9wLF9vLF9uLCJ3IiwidyIsInIiKTsgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCisgICAgICAgIF9fY21weGNoZ191c2VyKF9wLCBfbywgX24sICJ3IiwgInIiKTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgIGJyZWFrOyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgY2FzZSA0
OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCi0gICAgICAgIF9fY21weGNoZ191c2VyKF9wLF9vLF9uLCJsIiwiayIsInIiKTsgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgIF9fY21weGNoZ191c2VyKF9wLCBfbywg
X24sICJrIiwgInIiKTsgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgIGJyZWFr
OyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCiAgICAgY2FzZSA4OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCi0gICAgICAgIF9fY21weGNoZ191c2VyKF9wLF9vLF9uLCJx
IiwiIiwiciIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCisgICAgICAgIF9fY21weGNo
Z191c2VyKF9wLCBfbywgX24sICJxIiwgInIiKTsgICAgICAgICAgICAgICAgICAgICAgICAgICBc
CiAgICAgICAgIGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCiAgICAgfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgX3JjOyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
