Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54F312815A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 18:26:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiLzo-0007Ra-IO; Fri, 20 Dec 2019 17:23:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1+gY=2K=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iiLzm-0007RV-Od
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 17:23:22 +0000
X-Inumbo-ID: 66be5a88-234d-11ea-a914-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66be5a88-234d-11ea-a914-bc764e2007e4;
 Fri, 20 Dec 2019 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576862593;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=zvfvGbXGGcwjti2zy4M0c7LJxvvS4NUWyuGNRYX5tG0=;
 b=K4sk9hfUFcxQWChvASLekqP+HBwZkSxYoiXuqE1hhsrVd/mVkEkvj/Aj
 Vtouk78BokyiWm48YqadF3VrkFTuf21xALgtwhh9NML/dkxXR8FHYGSck
 OyDCxCrRt3zvSCNJW/UY1rKGoHSWzqBrTR48QGuYHtAFJrjeDZ6VfKp9l c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rywsNXeStD6SgdS2Ybb8ZQyE6xZ99Cm/+A7QQ6PYYjWT50w/muMA2HpSLvo9WppueySL32ghok
 mZk9Ax6iMiFkqkh8DsUShGIGTJeFte7m/kqm3ZHvOzQhZSrS8dKafc4gPIvw+L0soLLMra5RYk
 JB6jUXt0mi2Nfq+YWaEmJDZ5OAX+tsFjKWK46IY3ymZWn/WkoFRwuBj3535/ewe8DF2/n4v6RY
 tKsv3J6m5yf4ERCpispcfKDMt18BnSxlz+WDmNPjYQm2/hoP2yickabLgbPBYi7oqKgvjrgL3N
 vHA=
X-SBRS: 2.7
X-MesageID: 10368290
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,336,1571716800"; d="scan'208";a="10368290"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 20 Dec 2019 17:23:10 +0000
Message-ID: <20191220172310.27231-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] libxc/restore: Don't duplicate state in
 process_vcpu_basic()
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
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

dmNwdV9ndWVzdF9jb250ZXh0X2FueV90IGlzIGN1cnJlbnRseSBhbGxvY2F0ZWQgb24gdGhlIHN0
YWNrLCBhbmQgY29waWVkIGZyb20KYSBtdXRhYmxlIGJ1ZmZlciB3aGljaCBpcyBmcmVlZCBpbW1l
ZGlhdGVseSBhZnRlciBpdHMgdXNlIGhlcmUuCgpNdXRhdGUgdGhlIGJ1ZmZlciBpbiBwbGFjZSBp
bnN0ZWFkIG9mIGR1cGxpY2F0aW5nIGl0LgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBJYW4gSmFja3NvbiA8SWFuLkphY2tz
b25AY2l0cml4LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogdG9vbHMvbGlieGMv
eGNfc3JfcmVzdG9yZV94ODZfcHYuYyB8IDI5ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYuYyBiL3Rvb2xzL2xpYnhj
L3hjX3NyX3Jlc3RvcmVfeDg2X3B2LmMKaW5kZXggMGE1YjAwMTZiNC4uNzBiOGQyYWQ5NSAxMDA2
NDQKLS0tIGEvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYuYworKysgYi90b29scy9s
aWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9wdi5jCkBAIC0yMzYsMjggKzIzNiwyNSBAQCBzdGF0aWMg
aW50IHByb2Nlc3NfdmNwdV9iYXNpYyhzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4LAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHZjcHVpZCkKIHsKICAgICB4Y19p
bnRlcmZhY2UgKnhjaCA9IGN0eC0+eGNoOwotICAgIHZjcHVfZ3Vlc3RfY29udGV4dF9hbnlfdCB2
Y3B1OworICAgIHZjcHVfZ3Vlc3RfY29udGV4dF9hbnlfdCAqdmNwdSA9IGN0eC0+eDg2X3B2LnJl
c3RvcmUudmNwdXNbdmNwdWlkXS5iYXNpYzsKICAgICB4ZW5fcGZuX3QgcGZuLCBtZm47CiAgICAg
dW5zaWduZWQgaSwgZ2R0X2NvdW50OwogICAgIGludCByYyA9IC0xOwogCi0gICAgbWVtY3B5KCZ2
Y3B1LCBjdHgtPng4Nl9wdi5yZXN0b3JlLnZjcHVzW3ZjcHVpZF0uYmFzaWMsCi0gICAgICAgICAg
IGN0eC0+eDg2X3B2LnJlc3RvcmUudmNwdXNbdmNwdWlkXS5iYXNpY3N6KTsKLQogICAgIC8qIFZj
cHUgMCBpcyBzcGVjaWFsOiBDb252ZXJ0IHRoZSBzdXNwZW5kIHJlY29yZCB0byBhbiBtZm4uICov
CiAgICAgaWYgKCB2Y3B1aWQgPT0gMCApCiAgICAgewotICAgICAgICByYyA9IHByb2Nlc3Nfc3Rh
cnRfaW5mbyhjdHgsICZ2Y3B1KTsKKyAgICAgICAgcmMgPSBwcm9jZXNzX3N0YXJ0X2luZm8oY3R4
LCB2Y3B1KTsKICAgICAgICAgaWYgKCByYyApCiAgICAgICAgICAgICByZXR1cm4gcmM7CiAgICAg
ICAgIHJjID0gLTE7CiAgICAgfQogCi0gICAgU0VUX0ZJRUxEKCZ2Y3B1LCBmbGFncywKLSAgICAg
ICAgICAgICAgR0VUX0ZJRUxEKCZ2Y3B1LCBmbGFncywgY3R4LT54ODZfcHYud2lkdGgpIHwgVkdD
Rl9vbmxpbmUsCisgICAgU0VUX0ZJRUxEKHZjcHUsIGZsYWdzLAorICAgICAgICAgICAgICBHRVRf
RklFTEQodmNwdSwgZmxhZ3MsIGN0eC0+eDg2X3B2LndpZHRoKSB8IFZHQ0Zfb25saW5lLAogICAg
ICAgICAgICAgICBjdHgtPng4Nl9wdi53aWR0aCk7CiAKLSAgICBnZHRfY291bnQgPSBHRVRfRklF
TEQoJnZjcHUsIGdkdF9lbnRzLCBjdHgtPng4Nl9wdi53aWR0aCk7CisgICAgZ2R0X2NvdW50ID0g
R0VUX0ZJRUxEKHZjcHUsIGdkdF9lbnRzLCBjdHgtPng4Nl9wdi53aWR0aCk7CiAgICAgaWYgKCBn
ZHRfY291bnQgPiBGSVJTVF9SRVNFUlZFRF9HRFRfRU5UUlkgKQogICAgIHsKICAgICAgICAgRVJS
T1IoIkdEVCBlbnRyeSBjb3VudCAoJXUpIG91dCBvZiByYW5nZSAobWF4ICV1KSIsCkBAIC0yNzAs
NyArMjY3LDcgQEAgc3RhdGljIGludCBwcm9jZXNzX3ZjcHVfYmFzaWMoc3RydWN0IHhjX3NyX2Nv
bnRleHQgKmN0eCwKICAgICAvKiBDb252ZXJ0IEdEVCBmcmFtZXMgdG8gbWZucy4gKi8KICAgICBm
b3IgKCBpID0gMDsgaSA8IGdkdF9jb3VudDsgKytpICkKICAgICB7Ci0gICAgICAgIHBmbiA9IEdF
VF9GSUVMRCgmdmNwdSwgZ2R0X2ZyYW1lc1tpXSwgY3R4LT54ODZfcHYud2lkdGgpOworICAgICAg
ICBwZm4gPSBHRVRfRklFTEQodmNwdSwgZ2R0X2ZyYW1lc1tpXSwgY3R4LT54ODZfcHYud2lkdGgp
OwogICAgICAgICBpZiAoIHBmbiA+IGN0eC0+eDg2X3B2Lm1heF9wZm4gKQogICAgICAgICB7CiAg
ICAgICAgICAgICBFUlJPUigiR0RUIGZyYW1lICV1IChwZm4gJSNseCkgb3V0IG9mIHJhbmdlIiwg
aSwgcGZuKTsKQEAgLTI5MywxMSArMjkwLDExIEBAIHN0YXRpYyBpbnQgcHJvY2Vzc192Y3B1X2Jh
c2ljKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgsCiAgICAgICAgICAgICBnb3RvIGVycjsKICAg
ICAgICAgfQogCi0gICAgICAgIFNFVF9GSUVMRCgmdmNwdSwgZ2R0X2ZyYW1lc1tpXSwgbWZuLCBj
dHgtPng4Nl9wdi53aWR0aCk7CisgICAgICAgIFNFVF9GSUVMRCh2Y3B1LCBnZHRfZnJhbWVzW2ld
LCBtZm4sIGN0eC0+eDg2X3B2LndpZHRoKTsKICAgICB9CiAKICAgICAvKiBDb252ZXJ0IENSMyB0
byBhbiBtZm4uICovCi0gICAgcGZuID0gY3IzX3RvX21mbihjdHgsIEdFVF9GSUVMRCgmdmNwdSwg
Y3RybHJlZ1szXSwgY3R4LT54ODZfcHYud2lkdGgpKTsKKyAgICBwZm4gPSBjcjNfdG9fbWZuKGN0
eCwgR0VUX0ZJRUxEKHZjcHUsIGN0cmxyZWdbM10sIGN0eC0+eDg2X3B2LndpZHRoKSk7CiAgICAg
aWYgKCBwZm4gPiBjdHgtPng4Nl9wdi5tYXhfcGZuICkKICAgICB7CiAgICAgICAgIEVSUk9SKCJj
cjMgKHBmbiAlI2x4KSBvdXQgb2YgcmFuZ2UiLCBwZm4pOwpAQCAtMzIzLDEyICszMjAsMTIgQEAg
c3RhdGljIGludCBwcm9jZXNzX3ZjcHVfYmFzaWMoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCwK
ICAgICAgICAgZ290byBlcnI7CiAgICAgfQogCi0gICAgU0VUX0ZJRUxEKCZ2Y3B1LCBjdHJscmVn
WzNdLCBtZm5fdG9fY3IzKGN0eCwgbWZuKSwgY3R4LT54ODZfcHYud2lkdGgpOworICAgIFNFVF9G
SUVMRCh2Y3B1LCBjdHJscmVnWzNdLCBtZm5fdG9fY3IzKGN0eCwgbWZuKSwgY3R4LT54ODZfcHYu
d2lkdGgpOwogCiAgICAgLyogNjRiaXQgZ3Vlc3RzOiBDb252ZXJ0IENSMSAoZ3Vlc3QgcGFnZXRh
YmxlcykgdG8gbWZuLiAqLwotICAgIGlmICggY3R4LT54ODZfcHYubGV2ZWxzID09IDQgJiYgKHZj
cHUueDY0LmN0cmxyZWdbMV0gJiAxKSApCisgICAgaWYgKCBjdHgtPng4Nl9wdi5sZXZlbHMgPT0g
NCAmJiAodmNwdS0+eDY0LmN0cmxyZWdbMV0gJiAxKSApCiAgICAgewotICAgICAgICBwZm4gPSB2
Y3B1Lng2NC5jdHJscmVnWzFdID4+IFBBR0VfU0hJRlQ7CisgICAgICAgIHBmbiA9IHZjcHUtPng2
NC5jdHJscmVnWzFdID4+IFBBR0VfU0hJRlQ7CiAKICAgICAgICAgaWYgKCBwZm4gPiBjdHgtPng4
Nl9wdi5tYXhfcGZuICkKICAgICAgICAgewpAQCAtMzU1LDEwICszNTIsMTAgQEAgc3RhdGljIGlu
dCBwcm9jZXNzX3ZjcHVfYmFzaWMoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCwKICAgICAgICAg
ICAgIGdvdG8gZXJyOwogICAgICAgICB9CiAKLSAgICAgICAgdmNwdS54NjQuY3RybHJlZ1sxXSA9
ICh1aW50NjRfdCltZm4gPDwgUEFHRV9TSElGVDsKKyAgICAgICAgdmNwdS0+eDY0LmN0cmxyZWdb
MV0gPSAodWludDY0X3QpbWZuIDw8IFBBR0VfU0hJRlQ7CiAgICAgfQogCi0gICAgaWYgKCB4Y192
Y3B1X3NldGNvbnRleHQoeGNoLCBjdHgtPmRvbWlkLCB2Y3B1aWQsICZ2Y3B1KSApCisgICAgaWYg
KCB4Y192Y3B1X3NldGNvbnRleHQoeGNoLCBjdHgtPmRvbWlkLCB2Y3B1aWQsIHZjcHUpICkKICAg
ICB7CiAgICAgICAgIFBFUlJPUigiRmFpbGVkIHRvIHNldCB2Y3B1JXUncyBiYXNpYyBpbmZvIiwg
dmNwdWlkKTsKICAgICAgICAgZ290byBlcnI7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
