Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F081348C4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:03:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEhS-0007jC-RW; Wed, 08 Jan 2020 17:00:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/AM3=25=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ipEhR-0007j7-K8
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:00:53 +0000
X-Inumbo-ID: 684f4d04-3238-11ea-b1f0-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 684f4d04-3238-11ea-b1f0-bc764e2007e4;
 Wed, 08 Jan 2020 17:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578502844;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jV/HQ45EaL2pnMlfwyFunb2FcePKMKqVE1cSDu3XnZE=;
 b=XGD4jha2NW4nRN1fSVg/47dpj9DFOv6CCywESvAEzMdiM8zuc9sD/y89
 iujUEQA7W74oYmhqZcHF8oaErsL1a1Sjr7YMIlRQvNTXea8GfKjVCxct/
 u3t8Bu2Uta6rJ9OfwqKDsKMGEZ29XHViRIQdZyELIdyIfO/jEcQ4VbMp0 o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WAaJUkaTBakYE+mqm7rOBuvG/UGrAVSGzn0bqPa/ojUeLQzdHIKEU7XgoiFT6rggPXMqjcr2Yf
 u5GzYm4yMrn+ukL4rgUCfqZql/e8Y4ylTSTJeWIoWIRLDizs744dGFGQCvzt/+Trb8pQheFzLc
 Wfbjk+PKkE8Omxgtlu3g06tEMwBsqDUpB/0WG/wPmlWTc4zGwKlc9R1TbYSnh2DGgvacLcmKOy
 MZZcgsoYZAkWkic+w5kDOKdC5fBFcrX/V2XNRUasOHzbdKKQvGrJfbuZwTlOL7Z31TnwG9BDSM
 61I=
X-SBRS: 2.7
X-MesageID: 10653259
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="10653259"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 8 Jan 2020 17:00:40 +0000
Message-ID: <20200108170040.7728-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Rationalise stack handling during
 early boot
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

VGhlIHRvcCAobnVtZXJpY2FsbHkgaGlnaGVyIGFkZHJlc3Nlcykgb2YgY3B1MF9zdGFja1tdIGNv
bnRhaW5zIHRoZSBCU1AncwpjcHVfaW5mbyBibG9jay4gIExvZ2ljIGluIFhlbiBleHBlY3RzIHRo
aXMgdG8gYmUgaW5pdGlhbGlzZWQgdG8gMCwgYnV0IHRoaXMKYXJlYSBvZiBzdGFjayBpcyBhbHNv
IHVzZWQgZHVyaW5nIGVhcmx5IGJvb3QuCgpVcGRhdGUgdGhlIGhlYWQuUyBjb2RlIHRvIGF2b2lk
IHVzaW5nIHRoZSBjcHVfaW5mbyBibG9jay4gIEFkZGl0aW9uYWxseSwKdXBkYXRlIHRoZSBzdGFj
a19zdGFydCB2YXJpYWJsZSB0byBtYXRjaCwgd2hpY2ggYXZvaWRzIF9faGlnaF9zdGFydCgpIGFu
ZAplZmlfYXJjaF9wb3N0X2V4aXRfYm9vdCgpIG5lZWRpbmcgdG8gbWFrZSB0aGUgYWRqdXN0bWVu
dCBtYW51YWxseS4KCkZpbmFsbHksIGxlYXZlIGEgYmlnIHdhcm5pbmcgYnkgdGhlIEJJT1MgQlNT
IGluaXRpYWxpc2F0aW9uLCBiZWNhdXNlIGl0IGlzIGJ5Cm5vIG1lYW5zIG9idmlvdXMgdGhhdCB0
aGUgc3RhY2sgZG9lc24ndCBzdXJ2aXZlIHRoZSBSRVAgU1RPUy4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxp
Y2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ib290
L2hlYWQuUyAgICB8IDEwICsrKysrKystLS0KIHhlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TICB8
ICAzICstLQogeGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oIHwgMTMgKysrKysrKy0tLS0tLQog
eGVuL2FyY2gveDg2L3NtcGJvb3QuYyAgICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2Jvb3QvaGVhZC5TIGIveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCmluZGV4IDhkMGZmYmQxYjAu
LjIzODJiNjFkZDQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUworKysgYi94
ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKQEAgLTQwMCw3ICs0MDAsNyBAQCBfX3B2aF9zdGFydDoK
ICAgICAgICAgc3ViICAgICAkc3ltX29mZnMoMWIpLCAlZXNpCiAKICAgICAgICAgLyogU2V0IHVw
IHN0YWNrLiAqLwotICAgICAgICBsZWEgICAgIFNUQUNLX1NJWkUgKyBzeW1fZXNpKGNwdTBfc3Rh
Y2spLCAlZXNwCisgICAgICAgIGxlYSAgICAgU1RBQ0tfU0laRSAtIENQVUlORk9fc2l6ZW9mICsg
c3ltX2VzaShjcHUwX3N0YWNrKSwgJWVzcAogCiAgICAgICAgIG1vdiAgICAgJWVieCwgc3ltX2Vz
aShwdmhfc3RhcnRfaW5mb19wYSkKIApAQCAtNDQ3LDcgKzQ0Nyw3IEBAIF9fc3RhcnQ6CiAgICAg
ICAgIHN1YiAgICAgJHN5bV9vZmZzKDFiKSwgJWVzaQogCiAgICAgICAgIC8qIFNldCB1cCBzdGFj
ay4gKi8KLSAgICAgICAgbGVhICAgICBTVEFDS19TSVpFICsgc3ltX2VzaShjcHUwX3N0YWNrKSwg
JWVzcAorICAgICAgICBsZWEgICAgIFNUQUNLX1NJWkUgLSBDUFVJTkZPX3NpemVvZiArIHN5bV9l
c2koY3B1MF9zdGFjayksICVlc3AKIAogICAgICAgICAvKiBCb290bG9hZGVycyBtYXkgc2V0IG11
bHRpYm9vdHsxLDJ9Lm1lbV9sb3dlciB0byBhIG5vbnplcm8gdmFsdWUuICovCiAgICAgICAgIHhv
ciAgICAgJWVkeCwlZWR4CkBAIC02MTYsNyArNjE2LDExIEBAIHRyYW1wb2xpbmVfc2V0dXA6CiAg
ICAgICAgIGNtcGIgICAgJDAsc3ltX2ZzKGVmaV9wbGF0Zm9ybSkKICAgICAgICAgam56ICAgICAx
ZgogCi0gICAgICAgIC8qIEluaXRpYWxpemUgQlNTIChubyBuYXN0eSBzdXJwcmlzZXMhKS4gKi8K
KyAgICAgICAgLyoKKyAgICAgICAgICogSW5pdGlhbGlzZSB0aGUgQlNTLgorICAgICAgICAgKgor
ICAgICAgICAgKiAhISEgV0FSTklORyAtIGFsc28gemVyb2VzIHRoZSBjdXJyZW50IHN0YWNrICEh
IQorICAgICAgICAgKi8KICAgICAgICAgbW92ICAgICAkc3ltX29mZnMoX19ic3Nfc3RhcnQpLCVl
ZGkKICAgICAgICAgbW92ICAgICAkc3ltX29mZnMoX19ic3NfZW5kKSwlZWN4CiAgICAgICAgIHB1
c2ggICAgJWZzCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUyBiL3hlbi9h
cmNoL3g4Ni9ib290L3g4Nl82NC5TCmluZGV4IGI1NGQzYWNlZWEuLjBhY2Y1ZTg2MGMgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290
L3g4Nl82NC5TCkBAIC0xNiw3ICsxNiw2IEBAIEVOVFJZKF9faGlnaF9zdGFydCkKICAgICAgICAg
bW92ICAgICAlcmN4LCVjcjQKIAogICAgICAgICBtb3YgICAgIHN0YWNrX3N0YXJ0KCVyaXApLCVy
c3AKLSAgICAgICAgb3IgICAgICAkKFNUQUNLX1NJWkUtQ1BVSU5GT19zaXplb2YpLCVyc3AKIAog
ICAgICAgICAvKiBSZXNldCBFRkxBR1MgKHN1YnN1bWVzIENMSSBhbmQgQ0xEKS4gKi8KICAgICAg
ICAgcHVzaHEgICAkMApAQCAtNDIsNyArNDEsNyBAQCBtdWx0aWJvb3RfcHRyOgogICAgICAgICAu
bG9uZyAgIDAKIAogR0xPQkFMKHN0YWNrX3N0YXJ0KQotICAgICAgICAucXVhZCAgIGNwdTBfc3Rh
Y2sKKyAgICAgICAgLnF1YWQgICBjcHUwX3N0YWNrICsgU1RBQ0tfU0laRSAtIENQVUlORk9fc2l6
ZW9mCiAKICAgICAgICAgLnNlY3Rpb24gLmRhdGEucGFnZV9hbGlnbmVkLCAiYXciLCBAcHJvZ2Jp
dHMKICAgICAgICAgLmFsaWduIFBBR0VfU0laRSwgMApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L2VmaS9lZmktYm9vdC5oIGIveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCmluZGV4IDY3NmQ2
MTZmZjguLjhkZWJkYzdjYTggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3Qu
aAorKysgYi94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKQEAgLTI0OSwyMyArMjQ5LDI0IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBub3JldHVybiBlZmlfYXJjaF9wb3N0X2V4aXRfYm9vdCh2b2lk
KQogICAgICAgICAgICAgICAgICAgICJvciAgICAgJCJfX3N0cmluZ2lmeShYODZfQ1I0X1BHRSki
LCAlW2NyNF1cblx0IgogICAgICAgICAgICAgICAgICAgICJtb3YgICAgJVtjcjRdLCAlJWNyNFxu
XHQiCiAjZW5kaWYKLSAgICAgICAgICAgICAgICAgICAibW92YWJzICRfX3N0YXJ0X3hlbiwgJVty
aXBdXG5cdCIKICAgICAgICAgICAgICAgICAgICAibGdkdCAgIGJvb3RfZ2R0ciglJXJpcClcblx0
IgotICAgICAgICAgICAgICAgICAgICJtb3YgICAgc3RhY2tfc3RhcnQoJSVyaXApLCAlJXJzcFxu
XHQiCiAgICAgICAgICAgICAgICAgICAgIm1vdiAgICAlW2RzXSwgJSVzc1xuXHQiCiAgICAgICAg
ICAgICAgICAgICAgIm1vdiAgICAlW2RzXSwgJSVkc1xuXHQiCiAgICAgICAgICAgICAgICAgICAg
Im1vdiAgICAlW2RzXSwgJSVlc1xuXHQiCiAgICAgICAgICAgICAgICAgICAgIm1vdiAgICAlW2Rz
XSwgJSVmc1xuXHQiCiAgICAgICAgICAgICAgICAgICAgIm1vdiAgICAlW2RzXSwgJSVnc1xuXHQi
Ci0gICAgICAgICAgICAgICAgICAgIm1vdmwgICAlW2NzXSwgOCglJXJzcClcblx0IgotICAgICAg
ICAgICAgICAgICAgICJtb3YgICAgJVtyaXBdLCAoJSVyc3ApXG5cdCIKLSAgICAgICAgICAgICAg
ICAgICAibHJldHEgICVbc3Rrb2ZmXS0xNiIKKworICAgICAgICAgICAgICAgICAgIC8qIEp1bXAg
dG8gaGlnaGVyIG1hcHBpbmdzLiAqLworICAgICAgICAgICAgICAgICAgICJtb3YgICAgc3RhY2tf
c3RhcnQoJSVyaXApLCAlJXJzcFxuXHQiCisgICAgICAgICAgICAgICAgICAgIm1vdmFicyAkX19z
dGFydF94ZW4sICVbcmlwXVxuXHQiCisgICAgICAgICAgICAgICAgICAgInB1c2ggICAlW2NzXVxu
XHQiCisgICAgICAgICAgICAgICAgICAgInB1c2ggICAlW3JpcF1cblx0IgorICAgICAgICAgICAg
ICAgICAgICJscmV0cSIKICAgICAgICAgICAgICAgICAgICA6IFtyaXBdICI9JnIiIChlZmVyLyog
YW55IGRlYWQgNjQtYml0IHZhcmlhYmxlICovKSwKICAgICAgICAgICAgICAgICAgICAgIFtjcjRd
ICIrJnIiIChjcjQpCiAgICAgICAgICAgICAgICAgICAgOiBbY3IzXSAiciIgKGlkbGVfcGdfdGFi
bGUpLAogICAgICAgICAgICAgICAgICAgICAgW2NzXSAiaXIiIChfX0hZUEVSVklTT1JfQ1MpLAog
ICAgICAgICAgICAgICAgICAgICAgW2RzXSAiciIgKF9fSFlQRVJWSVNPUl9EUyksCi0gICAgICAg
ICAgICAgICAgICAgICBbc3Rrb2ZmXSAiaSIgKFNUQUNLX1NJWkUgLSBzaXplb2Yoc3RydWN0IGNw
dV9pbmZvKSksCiAgICAgICAgICAgICAgICAgICAgICAiRCIgKCZtYmkpCiAgICAgICAgICAgICAg
ICAgICAgOiAibWVtb3J5IiApOwogICAgIHVucmVhY2hhYmxlKCk7CmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvc21wYm9vdC5jIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwppbmRleCA3ZTI5NzA0
MDgwLi4wZDA1MjZlMmIyIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCisrKyBi
L3hlbi9hcmNoL3g4Ni9zbXBib290LmMKQEAgLTU1NCw3ICs1NTQsNyBAQCBzdGF0aWMgaW50IGRv
X2Jvb3RfY3B1KGludCBhcGljaWQsIGludCBjcHUpCiAgICAgICAgIHByaW50aygiQm9vdGluZyBw
cm9jZXNzb3IgJWQvJWQgZWlwICVseFxuIiwKICAgICAgICAgICAgICAgIGNwdSwgYXBpY2lkLCBz
dGFydF9laXApOwogCi0gICAgc3RhY2tfc3RhcnQgPSBzdGFja19iYXNlW2NwdV07CisgICAgc3Rh
Y2tfc3RhcnQgPSBzdGFja19iYXNlW2NwdV0gKyBTVEFDS19TSVpFIC0gc2l6ZW9mKHN0cnVjdCBj
cHVfaW5mbyk7CiAKICAgICAvKiBUaGlzIGdydW5nZSBydW5zIHRoZSBzdGFydHVwIHByb2Nlc3Mg
Zm9yIHRoZSB0YXJnZXRlZCBwcm9jZXNzb3IuICovCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
