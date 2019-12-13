Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0611EAF8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 20:08:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifqFK-0000Bi-9D; Fri, 13 Dec 2019 19:05:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=B4Jk=2D=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ifqFI-0000Ar-Nz
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 19:05:00 +0000
X-Inumbo-ID: 6c308a44-1ddb-11ea-b6f1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c308a44-1ddb-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 19:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576263885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YjF02GlWPriQhahOg2egLA3ecSJkJckuzJldhgBpkqk=;
 b=AMbIulpfxAY/3nU0r5I6F991hJu/pUhu1DgAWnx0xfRBPOXMD6O+UvTG
 8nzjmqXa/disnXp6JcOE7haC5J6Fx9qHoVfMzgVNFT3ItpAPla7DDYxSy
 H+raPKZcG3lui9AplYEKngwAjiJg5LNq5EnI0UJBi71Klluu7Ox7Ip1Cy o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sVC6s97+yMae/7I8P13eS0fk1llmRATX0vWljiMSUg3KEEA6Sp2dD/37HBnYPurVYS3CdfS5vu
 qJZ8FJq0XEob7Q5H568nPjAD/FZCIS0cmqTa3N5+yHH5NQT1cY3HgHg3uNlq6IOfBMCgFS4Jvp
 FjznNUuVAetEYLHfInICm199keV2uRhSQZRtid8pClYKO/MsnqTnGRHSl6pMJvMic3uP8rMu+p
 P7sG4uCc1Jnh9bKfY71tFZw404akL2/Qa9J0AFd/LbiEIHZQnSUakX4esyUFPIZJmfiSQl1bi9
 LNU=
X-SBRS: 2.7
X-MesageID: 9655076
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; 
   d="scan'208";a="9655076"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 13 Dec 2019 19:04:36 +0000
Message-ID: <20191213190436.24475-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191213190436.24475-1-andrew.cooper3@citrix.com>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 6/6] x86/suspend: Drop
 save_rest_processor_state() completely
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

Q29uc3RydWN0IHRoZSBzeXN0ZW0gbGlua2FnZSBNU1JzIHVzaW5nIHBlcmNwdV90cmFwc19pbml0
KCksIGJyaW5pbmcgdGhlIFMzCnBhdGggaW4gbGluZSB3aXRoIHRoZSBCU1AvQVAgcGF0aC4gIFJl
c3RvcmUgeGNyMCBmcm9tIHRoZSBwZXItY3B1IHNoYWRvdyBjb3B5LgoKVGhlIEZTL0dTIGJhc2Ug
dmFsdWVzIGFyZSB1bnVzZWQgaW4gWGVuIGNvbnRleHQsIGFuZCB3aWxsIGJlIGxvYWRlZAphcHBy
b3ByaWF0ZWx5IGJ5IHRoZSBuZXh0IHZjcHUgY29udGV4dCBzd2l0Y2guCgpUcmltIHRoZSBpbmNs
dWRlIGxpc3Qgc3Vic3RhbnRpYWxseSwgYXMgbW9zdCBhcmUgdW51c2VkLgoKU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4g
QmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L2FjcGkvc3VzcGVuZC5jICAgICB8IDU0ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TIHwgIDIgLS0KIDIgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvYWNwaS9zdXNwZW5kLmMgYi94ZW4vYXJjaC94ODYvYWNwaS9zdXNwZW5k
LmMKaW5kZXggMzJkMGY3MWZmZC4uNjI5ZDExNzk2NSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2FjcGkvc3VzcGVuZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3N1c3BlbmQuYwpAQCAtNCw0
MCArNCw4IEBACiAgKiAgQ29weXJpZ2h0IChjKSAyMDAxIFBhdHJpY2sgTW9jaGVsIDxtb2NoZWxA
b3NkbC5vcmc+CiAgKi8KIAotI2luY2x1ZGUgPHhlbi9hY3BpLmg+Ci0jaW5jbHVkZSA8eGVuL3Nt
cC5oPgotI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KLSNpbmNsdWRlIDxhc20vbXNyLmg+Ci0j
aW5jbHVkZSA8YXNtL2RlYnVncmVnLmg+Ci0jaW5jbHVkZSA8YXNtL2h2bS9odm0uaD4KLSNpbmNs
dWRlIDxhc20vaHZtL3N1cHBvcnQuaD4KLSNpbmNsdWRlIDxhc20vaTM4Ny5oPgorI2luY2x1ZGUg
PGFzbS9zeXN0ZW0uaD4KICNpbmNsdWRlIDxhc20veHN0YXRlLmg+Ci0jaW5jbHVkZSA8eGVuL2h5
cGVyY2FsbC5oPgotCi1zdGF0aWMgdW5zaWduZWQgbG9uZyBzYXZlZF9sc3Rhciwgc2F2ZWRfY3N0
YXI7Ci1zdGF0aWMgdW5zaWduZWQgbG9uZyBzYXZlZF9zeXNlbnRlcl9lc3AsIHNhdmVkX3N5c2Vu
dGVyX2VpcDsKLXN0YXRpYyB1bnNpZ25lZCBsb25nIHNhdmVkX2ZzX2Jhc2UsIHNhdmVkX2dzX2Jh
c2UsIHNhdmVkX2tlcm5lbF9nc19iYXNlOwotc3RhdGljIHVpbnQ2NF90IHNhdmVkX3hjcjA7Ci0K
LXZvaWQgc2F2ZV9yZXN0X3Byb2Nlc3Nvcl9zdGF0ZSh2b2lkKQotewotICAgIHNhdmVkX2ZzX2Jh
c2UgPSByZGZzYmFzZSgpOwotICAgIHNhdmVkX2dzX2Jhc2UgPSByZGdzYmFzZSgpOwotICAgIHJk
bXNybChNU1JfU0hBRE9XX0dTX0JBU0UsIHNhdmVkX2tlcm5lbF9nc19iYXNlKTsKLSAgICByZG1z
cmwoTVNSX0NTVEFSLCBzYXZlZF9jc3Rhcik7Ci0gICAgcmRtc3JsKE1TUl9MU1RBUiwgc2F2ZWRf
bHN0YXIpOwotCi0gICAgaWYgKCBjcHVfaGFzX3NlcCApCi0gICAgewotICAgICAgICByZG1zcmwo
TVNSX0lBMzJfU1lTRU5URVJfRVNQLCBzYXZlZF9zeXNlbnRlcl9lc3ApOwotICAgICAgICByZG1z
cmwoTVNSX0lBMzJfU1lTRU5URVJfRUlQLCBzYXZlZF9zeXNlbnRlcl9laXApOwotICAgIH0KLQot
ICAgIGlmICggY3B1X2hhc194c2F2ZSApCi0gICAgICAgIHNhdmVkX3hjcjAgPSBnZXRfeGNyMCgp
OwotfQotCiAKIHZvaWQgcmVzdG9yZV9yZXN0X3Byb2Nlc3Nvcl9zdGF0ZSh2b2lkKQogewpAQCAt
NDYsMjUgKzE0LDkgQEAgdm9pZCByZXN0b3JlX3Jlc3RfcHJvY2Vzc29yX3N0YXRlKHZvaWQpCiAg
ICAgLyogUmVzdG9yZSBmdWxsIENSNCAoaW5jIE1DRSkgbm93IHRoYXQgdGhlIElEVCBpcyBpbiBw
bGFjZS4gKi8KICAgICB3cml0ZV9jcjQobW11X2NyNF9mZWF0dXJlcyk7CiAKLSAgICAvKiBSZWNv
dmVyIHN5c2NhbGwgTVNScyAqLwotICAgIHdybXNybChNU1JfTFNUQVIsIHNhdmVkX2xzdGFyKTsK
LSAgICB3cm1zcmwoTVNSX0NTVEFSLCBzYXZlZF9jc3Rhcik7Ci0gICAgd3Jtc3JsKE1TUl9TVEFS
LCBYRU5fTVNSX1NUQVIpOwotICAgIHdybXNybChNU1JfU1lTQ0FMTF9NQVNLLCBYRU5fU1lTQ0FM
TF9NQVNLKTsKLQotICAgIHdyZnNiYXNlKHNhdmVkX2ZzX2Jhc2UpOwotICAgIHdyZ3NiYXNlKHNh
dmVkX2dzX2Jhc2UpOwotICAgIHdybXNybChNU1JfU0hBRE9XX0dTX0JBU0UsIHNhdmVkX2tlcm5l
bF9nc19iYXNlKTsKLQotICAgIGlmICggY3B1X2hhc19zZXAgKQotICAgIHsKLSAgICAgICAgLyog
UmVjb3ZlciBzeXNlbnRlciBNU1JzICovCi0gICAgICAgIHdybXNybChNU1JfSUEzMl9TWVNFTlRF
Ul9FU1AsIHNhdmVkX3N5c2VudGVyX2VzcCk7Ci0gICAgICAgIHdybXNybChNU1JfSUEzMl9TWVNF
TlRFUl9FSVAsIHNhdmVkX3N5c2VudGVyX2VpcCk7Ci0gICAgICAgIHdybXNyKE1TUl9JQTMyX1NZ
U0VOVEVSX0NTLCBfX0hZUEVSVklTT1JfQ1MsIDApOwotICAgIH0KKyAgICBwZXJjcHVfdHJhcHNf
aW5pdCgpOwogCi0gICAgaWYgKCBjcHVfaGFzX3hzYXZlICYmICFzZXRfeGNyMChzYXZlZF94Y3Iw
KSApCisgICAgaWYgKCBjcHVfaGFzX3hzYXZlICYmICFzZXRfeGNyMChnZXRfeGNyMCgpKSApCiAg
ICAgICAgIEJVRygpOwogCiAgICAgd3Jtc3JsKE1TUl9JQTMyX0NSX1BBVCwgWEVOX01TUl9QQVQp
OwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUyBiL3hlbi9hcmNo
L3g4Ni9hY3BpL3dha2V1cF9wcm90LlMKaW5kZXggMGNlOTZlMjZhOS4uZmVkMTE0YzBiMiAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUworKysgYi94ZW4vYXJjaC94
ODYvYWNwaS93YWtldXBfcHJvdC5TCkBAIC0xNSw4ICsxNSw2IEBAIEVOVFJZKGRvX3N1c3BlbmRf
bG93bGV2ZWwpCiAgICAgICAgIG1vdiAgICAgJWNyMCwgJXJheAogICAgICAgICBtb3YgICAgICVy
YXgsIHNhdmVkX2NyMCglcmlwKQogCi0gICAgICAgIGNhbGwgICAgc2F2ZV9yZXN0X3Byb2Nlc3Nv
cl9zdGF0ZQotCiAgICAgICAgIC8qIGVudGVyIHNsZWVwIHN0YXRlIHBoeXNpY2FsbHkgKi8KICAg
ICAgICAgbW92ICAgICAkMywgJWVkaQogICAgICAgICBjYWxsICAgIGFjcGlfZW50ZXJfc2xlZXBf
c3RhdGUKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
