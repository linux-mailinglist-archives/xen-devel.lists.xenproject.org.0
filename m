Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A914A663
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:42:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5ZZ-0003Ie-TG; Mon, 27 Jan 2020 14:41:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw5ZY-0003Hh-MX
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:41:04 +0000
X-Inumbo-ID: 090e335d-4113-11ea-855d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 090e335d-4113-11ea-855d-12813bfff9fa;
 Mon, 27 Jan 2020 14:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580136061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=gPYmytoJCiIil7BIfCHPDEH0I2F9VWQYPFwp/5YfzGQ=;
 b=XD2Vx4QL+99jZIRoTQEo2i+zAzSRaNJ6PuAQaS3ll2Bqs10Af2C5JtB3
 cIRXJk5XurpEVg/Yq6a+DIIcEwROxMCsE5IRCX8UeOs/DtAhuZWKr+anl
 EkLtxJKRqbr03acpJ55FIlZoBomRF58FQeDz2P7CluFsRLLdQqPbCYOs+ 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: P+khazJWuKPgOKI0jEBz4RTB1+ykFeNrQROppQ29fqfrhkqxvxH3vsSQxkeDOP76258QZ77jtH
 3ln0C8TrT7MICeRBn/PIa8UR0VjblLZXKVnaLUxag7QFsFheMNqVc0vGbqWEMqvxZ5VW/0woup
 +THHBoxDLvRpqEQGrbi2QAV2z1uIxXgznFA2OeVngXqGNIu0GlBOksT4Hz0Gd7IEc5W5olh1np
 uCZEKsHNzQzkg0C/lkADL0c7RFRx7WVskBn1UKl+9zWNh9M5hFrhDUOYYxfn/fgYj9OvuS+boK
 jbI=
X-SBRS: 2.7
X-MesageID: 12093220
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="12093220"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 14:34:41 +0000
Message-ID: <20200127143444.25538-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200127143444.25538-1-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 14/17] libxc/save: Write X86_{CPUID,
 MSR}_DATA records
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

V2l0aCBhbGwgb3RoZXIgcGx1bWJpbmcgaW4gcGxhY2UsIG9idGFpbiB0aGUgQ1BVIFBvbGljeSBm
cm9tIFhlbiBhbmQKd3JpdGUgaXQgaW50byB0aGUgbWlncmF0aW9uIHN0cmVhbS4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzog
SWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgotLS0KIHRvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbl94ODYuYyAgIHwgNTAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvbGlieGMveGNfc3JfY29tbW9u
X3g4Ni5oICAgfCAgNiArKysrKwogdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfaHZtLmMgfCAg
MiArLQogdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfcHYuYyAgfCAxMiArKysrKysrKystCiA0
IGZpbGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5jIGIvdG9vbHMvbGlieGMveGNfc3Jf
Y29tbW9uX3g4Ni5jCmluZGV4IDg5ODAyOTllOWEuLjYyNjc2NTVkYWIgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2xpYnhjL3hjX3NyX2NvbW1vbl94ODYuYworKysgYi90b29scy9saWJ4Yy94Y19zcl9jb21t
b25feDg2LmMKQEAgLTQyLDYgKzQyLDU2IEBAIGludCBoYW5kbGVfeDg2X3RzY19pbmZvKHN0cnVj
dCB4Y19zcl9jb250ZXh0ICpjdHgsIHN0cnVjdCB4Y19zcl9yZWNvcmQgKnJlYykKICAgICByZXR1
cm4gMDsKIH0KIAoraW50IHdyaXRlX3g4Nl9jcHVfcG9saWN5X3JlY29yZHMoc3RydWN0IHhjX3Ny
X2NvbnRleHQgKmN0eCkKK3sKKyAgICB4Y19pbnRlcmZhY2UgKnhjaCA9IGN0eC0+eGNoOworICAg
IHN0cnVjdCB4Y19zcl9yZWNvcmQgY3B1aWQgPSB7IC50eXBlID0gUkVDX1RZUEVfWDg2X0NQVUlE
X1BPTElDWSwgfTsKKyAgICBzdHJ1Y3QgeGNfc3JfcmVjb3JkIG1zcnMgID0geyAudHlwZSA9IFJF
Q19UWVBFX1g4Nl9NU1JfUE9MSUNZLCB9OworICAgIHVpbnQzMl90IG5yX2xlYXZlcyA9IDAsIG5y
X21zcnMgPSAwOworICAgIGludCByYzsKKworICAgIGlmICggeGNfZ2V0X2NwdV9wb2xpY3lfc2l6
ZSh4Y2gsICZucl9sZWF2ZXMsICZucl9tc3JzKSA8IDAgKQorICAgIHsKKyAgICAgICAgUEVSUk9S
KCJVbmFibGUgdG8gZ2V0IENQVSBQb2xpY3kgc2l6ZSIpOworICAgICAgICByZXR1cm4gLTE7Cisg
ICAgfQorCisgICAgY3B1aWQuZGF0YSA9IG1hbGxvYyhucl9sZWF2ZXMgKiBzaXplb2YoeGVuX2Nw
dWlkX2xlYWZfdCkpOworICAgIG1zcnMuZGF0YSAgPSBtYWxsb2MobnJfbXNycyAgICogc2l6ZW9m
KHhlbl9tc3JfZW50cnlfdCkpOworICAgIGlmICggIWNwdWlkLmRhdGEgfHwgIW1zcnMuZGF0YSAp
CisgICAgeworICAgICAgICBFUlJPUigiQ2Fubm90IGFsbG9jYXRlIG1lbW9yeSBmb3IgQ1BVIFBv
bGljeSIpOworICAgICAgICByYyA9IC0xOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAg
ICBpZiAoIHhjX2dldF9kb21haW5fY3B1X3BvbGljeSh4Y2gsIGN0eC0+ZG9taWQsICZucl9sZWF2
ZXMsIGNwdWlkLmRhdGEsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm5yX21z
cnMsIG1zcnMuZGF0YSkgKQorICAgIHsKKyAgICAgICAgUEVSUk9SKCJVbmFibGUgdG8gZ2V0IGQl
ZCBDUFUgUG9saWN5IiwgY3R4LT5kb21pZCk7CisgICAgICAgIHJjID0gLTE7CisgICAgICAgIGdv
dG8gb3V0OworICAgIH0KKworICAgIGNwdWlkLmxlbmd0aCA9IG5yX2xlYXZlcyAqIHNpemVvZih4
ZW5fY3B1aWRfbGVhZl90KTsKKyAgICBpZiAoIGNwdWlkLmxlbmd0aCApCisgICAgeworICAgICAg
ICByYyA9IHdyaXRlX3JlY29yZChjdHgsICZjcHVpZCk7CisgICAgICAgIGlmICggcmMgKQorICAg
ICAgICAgICAgZ290byBvdXQ7CisgICAgfQorCisgICAgbXNycy5sZW5ndGggPSBucl9tc3JzICog
c2l6ZW9mKHhlbl9tc3JfZW50cnlfdCk7CisgICAgaWYgKCBtc3JzLmxlbmd0aCApCisgICAgICAg
IHJjID0gd3JpdGVfcmVjb3JkKGN0eCwgJm1zcnMpOworCisgb3V0OgorICAgIGZyZWUoY3B1aWQu
ZGF0YSk7CisgICAgZnJlZShtc3JzLmRhdGEpOworCisgICAgcmV0dXJuIHJjOworfQorCiBpbnQg
aGFuZGxlX3g4Nl9jcHVpZF9wb2xpY3koc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCwgc3RydWN0
IHhjX3NyX3JlY29yZCAqcmVjKQogewogICAgIHhjX2ludGVyZmFjZSAqeGNoID0gY3R4LT54Y2g7
CmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19zcl9jb21tb25feDg2LmggYi90b29scy9saWJ4
Yy94Y19zcl9jb21tb25feDg2LmgKaW5kZXggYzQ1OGMxYWEzNy4uZDEwNTA5ODFkZCAxMDA2NDQK
LS0tIGEvdG9vbHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5oCisrKyBiL3Rvb2xzL2xpYnhjL3hj
X3NyX2NvbW1vbl94ODYuaApAQCAtMTUsNiArMTUsMTIgQEAgaW50IHdyaXRlX3g4Nl90c2NfaW5m
byhzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KTsKIGludCBoYW5kbGVfeDg2X3RzY19pbmZvKHN0
cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgsIHN0cnVjdCB4Y19zcl9yZWNvcmQgKnJlYyk7CiAKIC8q
CisgKiBPYnRhaW5zIGEgZG9tYWlucyBDUFUgUG9saWN5IGZyb20gWGVuLCBhbmQgd3JpdGVzIFg4
Nl97Q1BVSUQsTVNSfV9QT0xJQ1kKKyAqIHJlY29yZHMgaW50byB0aGUgc3RyZWFtLgorICovCitp
bnQgd3JpdGVfeDg2X2NwdV9wb2xpY3lfcmVjb3JkcyhzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4
KTsKKworLyoKICAqIFBhcnNlcyBhbiBYODZfQ1BVSURfUE9MSUNZIHJlY29yZCBhbmQgc3Rhc2hl
cyB0aGUgY29udGVudCBmb3IgYXBwbGljYXRpb24KICAqIHdoZW4gYSBTVEFUSUNfREFUQV9FTkQg
cmVjb3JkIGlzIGVuY291bnRlcmVkLgogICovCmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19z
cl9zYXZlX3g4Nl9odm0uYyBiL3Rvb2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2X2h2bS5jCmluZGV4
IDkzYmNjMWMyNzMuLmFjZjkyNjRkZWMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX3NyX3Nh
dmVfeDg2X2h2bS5jCisrKyBiL3Rvb2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2X2h2bS5jCkBAIC0x
NzIsNyArMTcyLDcgQEAgc3RhdGljIGludCB4ODZfaHZtX3NldHVwKHN0cnVjdCB4Y19zcl9jb250
ZXh0ICpjdHgpCiAKIHN0YXRpYyBpbnQgeDg2X2h2bV9zdGF0aWNfZGF0YShzdHJ1Y3QgeGNfc3Jf
Y29udGV4dCAqY3R4KQogewotICAgIHJldHVybiAwOworICAgIHJldHVybiB3cml0ZV94ODZfY3B1
X3BvbGljeV9yZWNvcmRzKGN0eCk7CiB9CiAKIHN0YXRpYyBpbnQgeDg2X2h2bV9zdGFydF9vZl9z
dHJlYW0oc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCkKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhj
L3hjX3NyX3NhdmVfeDg2X3B2LmMgYi90b29scy9saWJ4Yy94Y19zcl9zYXZlX3g4Nl9wdi5jCmlu
ZGV4IDQ2MDE5ZDk2MmQuLmM3ZTI0NmVmNGYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX3Ny
X3NhdmVfeDg2X3B2LmMKKysrIGIvdG9vbHMvbGlieGMveGNfc3Jfc2F2ZV94ODZfcHYuYwpAQCAt
MTA1NCw3ICsxMDU0LDE3IEBAIHN0YXRpYyBpbnQgeDg2X3B2X3NldHVwKHN0cnVjdCB4Y19zcl9j
b250ZXh0ICpjdHgpCiAKIHN0YXRpYyBpbnQgeDg2X3B2X3N0YXRpY19kYXRhKHN0cnVjdCB4Y19z
cl9jb250ZXh0ICpjdHgpCiB7Ci0gICAgcmV0dXJuIHdyaXRlX3g4Nl9wdl9pbmZvKGN0eCk7Cisg
ICAgaW50IHJjOworCisgICAgcmMgPSB3cml0ZV94ODZfcHZfaW5mbyhjdHgpOworICAgIGlmICgg
cmMgKQorICAgICAgICByZXR1cm4gcmM7CisKKyAgICByYyA9IHdyaXRlX3g4Nl9jcHVfcG9saWN5
X3JlY29yZHMoY3R4KTsKKyAgICBpZiAoIHJjICkKKyAgICAgICAgcmV0dXJuIHJjOworCisgICAg
cmV0dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgeDg2X3B2X3N0YXJ0X29mX3N0cmVhbShzdHJ1Y3Qg
eGNfc3JfY29udGV4dCAqY3R4KQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
