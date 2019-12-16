Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A6E120806
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 15:05:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igqxN-00053X-DU; Mon, 16 Dec 2019 14:02:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SuIK=2G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1igqxM-00053P-11
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 14:02:40 +0000
X-Inumbo-ID: b34ef482-200c-11ea-b6f1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b34ef482-200c-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576504951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d+5CN1bbsgCynDpdONeTI6M48SZ2l36mbPg1F1H06kE=;
 b=h9eO1Pis+MgdlZihIj4DOLF6W6v1WHuEl5CC/gqbdLWhjdGgrjuS0DqY
 M9+s2K0YFTnDFeECmwahyPbyMuMdVDGMxSJ4/Cgmf0kjLtd2HqLIFjs+7
 HkOQHgIuhoOVuVdlsIkGDDtUHJwIISRilZhHac2UthAGwYjiyr7GPYsKh 8=;
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
IronPort-SDR: YTYB84jY1Yyf96GAq/RIRvQZKX9TNrljwV8mDXFfB+Z4thOIFDGPiqvF/HK0B3JbaR/3BcIN2q
 fZcpfyLbQ75p8UeVXjIBePpzVFWqTIOm7/4Tb/v/LcqM74GtIAdVaQGxoDewyJ5oZy+82RGLkf
 cqYckZkcpVwHIsjF//ACmdpx5yEUr2T/NiVCMIvnm4c+WCkcnKTlt9wdwzXacN9JFqj96cOtIY
 Lupdv+KQla/AN6x9mn0prJ8krg8ZKlnJPBz7ef81hvnKunee7cWcE5cDNERO6A1Ug5XdlSqGlF
 Vng=
X-SBRS: 2.7
X-MesageID: 10140307
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; d="scan'208";a="10140307"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 16 Dec 2019 14:02:27 +0000
Message-ID: <20191216140227.19234-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/pv: Fix `global-pages` to match the
 documentation
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

Yy9zIDVkZTk2MWQ5YzA5ICJ4ODY6IGRvIG5vdCBlbmFibGUgZ2xvYmFsIHBhZ2VzIHdoZW4gdmly
dHVhbGl6ZWQgb24gQU1EIG9yCkh5Z29uIGhhcmR3YXJlIiBpbiBmYWN0IGRvZXMuICBGaXggdGhl
IGNhbGN1bGF0aW9uIGluIHBnZV9pbml0KCkuCgpXaGlsZSBmaXhpbmcgdGhpcywgYWRqdXN0IHRo
ZSBjb21tYW5kIGxpbmUgZG9jdW1lbmF0aW9uLCBmaXJzdCB0byB1c2UgdGhlCm5ld2VyIHN0eWxl
LCBhbmQgdG8gZXhwYW5kIHRoZSBkZXNjcmlwdGlvbiB0byBkaXNjdXNzIGNhc2VzIHdoZXJlIHRo
ZSBvcHRpb24KbWlnaHQgYmUgdXNlZnVsIHRvIHVzZSwgYnV0IFhlbiBjYW4ndCBhY2NvdW50IGZv
ciBieSBkZWZhdWx0LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Ci0tLQogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIHwgMjQgKysr
KysrKysrKysrKysrLS0tLS0tLS0tCiB4ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMgICAgICAgICAg
fCAgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBiL2Rv
Y3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwppbmRleCA3YTFiZTg0Y2E5Li5jYjU0YTAw
MGZjIDEwMDY0NAotLS0gYS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKKysrIGIv
ZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCkBAIC0xMDg3LDE4ICsxMDg3LDI0IEBA
IHZhbHVlIHNldHRhYmxlIHZpYSBYZW4gdG9vbHMuCiAKIERvbTAgaXMgdXNpbmcgdGhpcyB2YWx1
ZSBmb3Igc2l6aW5nIGl0cyBtYXB0cmFjayB0YWJsZS4KIAotIyMjIGdsb2JhbC1wYWdlcyAoeDg2
KQotPiBgPSA8Ym9vbGVhbj5gCisjIyMgZ2xvYmFsLXBhZ2VzCisgICAgPSA8Ym9vbGVhbj4KKwor
ICAgIEFwcGxpY2FiaWxpdHk6IHg4NgorICAgIERlZmF1bHQ6IHRydWUgdW5sZXNzIHJ1bm5pbmcg
dmlydHVhbGl6ZWQgb24gQU1EIG9yIEh5Z29uIGhhcmR3YXJlCiAKLT4gRGVmYXVsdDogYHRydWVg
IHVubGVzcyBydW5uaW5nIHZpcnR1YWxpemVkIG9uIEFNRCBvciBIeWdvbiBoYXJkd2FyZQorQ29u
dHJvbCB3aGV0aGVyIHRvIHVzZSBnbG9iYWwgcGFnZXMgZm9yIFBWIGd1ZXN0cywgYW5kIHRodXMg
dGhlIG5lZWQgdG8KK3BlcmZvcm0gVExCIGZsdXNoZXMgYnkgd3JpdGluZyB0byBDUjQuICBUaGlz
IGlzIGEgcGVyZm9ybWFuY2UgdHJhZGUtb2ZmLgogCi1TZXQgd2hldGhlciB0aGUgUEdFIGJpdCBp
biBDUjQgd2lsbCBiZSBlbmFibGVkIGZvciBQViBndWVzdHMuIFRoaXMgY29udHJvbHMgdGhlCi11
c2FnZSBvZiBnbG9iYWwgcGFnZXMsIGFuZCB0aHVzIHRoZSBuZWVkIHRvIHBlcmZvcm0gdGxiIGZs
dXNoZXMgYnkgd3JpdGluZyB0bwotQ1I0LgorQU1EIFNWTSBkb2VzIG5vdCBzdXBwb3J0IHNlbGVj
dGl2ZSB0cmFwcGluZyBvZiBDUjQgd3JpdGVzLCB3aGljaCBtZWFucyB0aGF0IGEKK2dsb2JhbCBU
TEIgZmx1c2ggKHR3byBDUjQgd3JpdGVzKSB0YWtlcyB0d28gVk1FeGl0cywgYW5kIG1hc3NpdmVs
eSBvdXR3ZWlnaAordGhlIGJlbmVmaXQgb2YgdXNpbmcgZ2xvYmFsIHBhZ2VzIHRvIGJlZ2luIHdp
dGguICBUaGlzIGNhc2UgaXMgZWFzeSBmb3IgWGVuIHRvCitzcG90LCBhbmQgaXMgYWNjb3VudGVk
IGZvciBpbiB0aGUgZGVmYXVsdCBzZXR0aW5nLgogCi1Ob3RlIGl0J3MgZGlzYWJsZWQgYnkgZGVm
YXVsdCB3aGVuIHJ1bm5pbmcgdmlydHVhbGl6ZWQgb24gQU1EIG9yIEh5Z29uIGhhcmR3YXJlCi1z
aW5jZSBBTUQgU1ZNIGRvZXNuJ3Qgc3VwcG9ydCBzZWxlY3RpdmUgdHJhcHBpbmcgb2YgQ1I0LCBz
byBnbG9iYWwgcGFnZXMgYXJlCi1ub3QgZW5hYmxlZCBpbiBvcmRlciB0byByZWR1Y2UgdGhlIG92
ZXJoZWFkIG9mIFRMQiBmbHVzaGVzLgorT3RoZXIgY2FzZXMgd2hlcmUgdGhpcyBvcHRpb24gbWln
aHQgYmUgYSBiZW5lZml0IGlzIG9uIFZULXggaGFyZHdhcmUgd2hlbgorc2VsZWN0aXZlIENSNCB3
cml0ZXMgYXJlIG5vdCBzdXBwb3J0ZWQvZW5hYmxlZCBieSB0aGUgaHlwZXJ2aXNvciwgb3IgaW4g
YW55Cit2aXJ0dWFsaXNlZCBjYXNlIHVzaW5nIHNoYWRvdyBwYWdpbmcuICBUaGVzZSBhcmUgbm90
IGVhc3kgZm9yIFhlbiB0byBzcG90LCBzbworYXJlIG5vdCBhY2NvdW50ZWQgZm9yIGluIHRoZSBk
ZWZhdWx0IHNldHRpbmcuCiAKICMjIyBndWVzdF9sb2dsdmwKID4gYD0gPGxldmVsPlsvPHJhdGUt
bGltaXRlZCBsZXZlbD5dYCB3aGVyZSBsZXZlbCBpcyBgbm9uZSB8IGVycm9yIHwgd2FybmluZyB8
IGluZm8gfCBkZWJ1ZyB8IGFsbGAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4u
YyBiL3hlbi9hcmNoL3g4Ni9wdi9kb21haW4uYwppbmRleCBlNmUxYzUxNTQ4Li5lZDUxMTFmYzQ3
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvcHYvZG9tYWluLmMKKysrIGIveGVuL2FyY2gveDg2
L3B2L2RvbWFpbi5jCkBAIC0xMjUsOCArMTI1LDggQEAgc3RhdGljIGludCBfX2luaXQgcGdlX2lu
aXQodm9pZCkKIHsKICAgICBpZiAoIG9wdF9nbG9iYWxfcGFnZXMgPT0gLTEgKQogICAgICAgICBv
cHRfZ2xvYmFsX3BhZ2VzID0gIWNwdV9oYXNfaHlwZXJ2aXNvciB8fAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKFg4Nl9WRU5ET1JfQU1EIHwgWDg2X1ZFTkRPUl9IWUdPTikpOworICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIShib290X2NwdV9kYXRhLng4Nl92ZW5kb3IgJgorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAoWDg2X1ZFTkRPUl9BTUQgfCBYODZfVkVORE9SX0hZR09O
KSk7CiAKICAgICByZXR1cm4gMDsKIH0KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
