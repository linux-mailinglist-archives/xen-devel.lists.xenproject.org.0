Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E266C12A300
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 16:43:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijmIn-0003dW-Kh; Tue, 24 Dec 2019 15:40:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AG6B=2O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ijmIm-0003dQ-3S
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 15:40:52 +0000
X-Inumbo-ID: be703bca-2663-11ea-88e7-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be703bca-2663-11ea-88e7-bc764e2007e4;
 Tue, 24 Dec 2019 15:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577202044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=4fBapI9z/Ms+ixWeUrkyCN8fJrLRsHqVO9a2fRn+69o=;
 b=W2qzTilsVB3tY4QCsI4OANP2Env+btfBLp7ZVKONQMEiYdS7U7cnBf7R
 XwVV+qafhEsjof6EXeH0K2Q8z5QNwOEIm96oNeVuZbHyLYP0aycB9x3Ap
 IFtWqckuvyS+dRg+w1TLPgVi03ha7hWytq+fdXSW8GIt+Nrkm9fPXxpbG w=;
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
IronPort-SDR: lhpDStWcvWfCljV8jH97FFhZwk42l0YOizboElBhUSSaoulaJ60VPQrSnVxal9gm6CQfc1W4t3
 HhRieveMpjpiXGxGY7WuBg6FawKspkW9ZMyCFqn4YnOCEczEr23cLjCmHvrNyAggFGqhSROJsG
 HymPF4LHIiL8GVS2qA6xnO4XfSijGmGCELrv3EmUHmWxx1hc+cedzSJkSJxb2XcRl8lBiPWsWZ
 DHlwgoSWlysEwpubJwzEjVyROICMsF7805byyADjRYLB65f2OH0O0lO2is85IBVOHttBxYO17B
 OiY=
X-SBRS: 2.7
X-MesageID: 10129278
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10129278"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 15:19:31 +0000
Message-ID: <20191224151932.6304-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191224151932.6304-1-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 11/12] libxc/restore: Handle X86_{CPUID,
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

Rm9yIG5vdywgdGhlIGRhdGEgYXJlIGp1c3Qgc3Rhc2hlZCwgYW5kIGRpc2NhcmRlZCBhdCB0aGUg
ZW5kLiAgVGhpcyB3aWxsCmJlIGFkZHJlc3NlZCB3aGVuIHRoZSBUT0RPIGluIHg4Nl9zdGF0aWNf
ZGF0YV9jb21wbGV0ZSgpIGlzIGFkZHJlc3NlZC4KCk5vIHByYWN0aWNhbCBjaGFuZ2UgdG8gYmVo
YXZpb3VyIC0gdGhpcyBpcyBhbGwgcGx1bWJpbmcgd29yay4KClNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tzb24g
PElhbi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHRv
b2xzL2xpYnhjL3hjX3NyX2NvbW1vbi5oICAgICAgICAgIHwgMTAgKysrKysrKysrKwogdG9vbHMv
bGlieGMveGNfc3JfY29tbW9uX3g4Ni5jICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiB0b29scy9saWJ4Yy94Y19zcl9jb21tb25feDg2LmggICAgICB8IDE0
ICsrKysrKysrKysrKysKIHRvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmVfeDg2X2h2bS5jIHwgIDkg
KysrKysrKysrCiB0b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9wdi5jICB8ICA5ICsrKysr
KysrKwogNSBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlieGMveGNfc3JfY29tbW9uLmggYi90b29scy9saWJ4Yy94Y19zcl9jb21tb24uaAppbmRl
eCAzZjUyZWY3ZDUzLi4zMzdjNzQ2ZTE3IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19zcl9j
b21tb24uaAorKysgYi90b29scy9saWJ4Yy94Y19zcl9jb21tb24uaApAQCAtMzA4LDYgKzMwOCwx
NiBAQCBzdHJ1Y3QgeGNfc3JfY29udGV4dAogICAgIHsKICAgICAgICAgc3RydWN0IC8qIHg4NiAq
LwogICAgICAgICB7CisgICAgICAgICAgICAvKiBDb21tb24gc2F2ZS9yZXN0b3JlIGRhdGEuICov
CisgICAgICAgICAgICB1bmlvbgorICAgICAgICAgICAgeworICAgICAgICAgICAgICAgIHN0cnVj
dAorICAgICAgICAgICAgICAgIHsKKyAgICAgICAgICAgICAgICAgICAgLyogWDg2X3tDUFVJRCxN
U1J9X0RBVEEgYmxvYnMgZm9yIENQVSBQb2xpY3kuICovCisgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCB4Y19zcl9ibG9iIGNwdWlkLCBtc3I7CisgICAgICAgICAgICAgICAgfSByZXN0b3JlOwor
ICAgICAgICAgICAgfTsKKwogICAgICAgICAgICAgc3RydWN0IC8qIHg4NiBQViBndWVzdC4gKi8K
ICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAvKiA0IG9yIDg7IDMyIG9yIDY0IGJpdCBk
b21haW4gKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX3NyX2NvbW1vbl94ODYuYyBiL3Rv
b2xzL2xpYnhjL3hjX3NyX2NvbW1vbl94ODYuYwppbmRleCAwODM0NTRkMjU2Li5kNGQ4NmJiMTJm
IDEwMDY0NAotLS0gYS90b29scy9saWJ4Yy94Y19zcl9jb21tb25feDg2LmMKKysrIGIvdG9vbHMv
bGlieGMveGNfc3JfY29tbW9uX3g4Ni5jCkBAIC00OSw2ICs0OSw0NiBAQCBpbnQgeDg2X3N0YXRp
Y19kYXRhX2NvbXBsZXRlKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgpCiAgICAgcmV0dXJuIDA7
CiB9CiAKK2ludCBoYW5kbGVfeDg2X2NwdWlkX3BvbGljeShzdHJ1Y3QgeGNfc3JfY29udGV4dCAq
Y3R4LCBzdHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMpCit7CisgICAgeGNfaW50ZXJmYWNlICp4Y2gg
PSBjdHgtPnhjaDsKKyAgICBpbnQgcmM7CisKKyAgICBpZiAoIHJlYy0+bGVuZ3RoID09IDAgfHwK
KyAgICAgICAgIHJlYy0+bGVuZ3RoICUgc2l6ZW9mKHhlbl9jcHVpZF9sZWFmX3QpICE9IDAgKQor
ICAgIHsKKyAgICAgICAgRVJST1IoIlg4Nl9DUFVJRF9QT0xJQ1kgc2l6ZSAldSBzaG91bGQgYmUg
bXVsdGlwbGUgb2YgJXp1IiwKKyAgICAgICAgICAgICAgcmVjLT5sZW5ndGgsIHNpemVvZih4ZW5f
Y3B1aWRfbGVhZl90KSk7CisgICAgICAgIHJldHVybiAtMTsKKyAgICB9CisKKyAgICByYyA9IHVw
ZGF0ZV9ibG9iKCZjdHgtPng4Ni5yZXN0b3JlLmNwdWlkLCByZWMtPmRhdGEsIHJlYy0+bGVuZ3Ro
KTsKKyAgICBpZiAoIHJjICkKKyAgICAgICAgRVJST1IoIlVuYWJsZSB0byBhbGxvY2F0ZSAldSBi
eXRlcyBmb3IgWDg2X0NQVUlEX1BPTElDWSIsIHJlYy0+bGVuZ3RoKTsKKworICAgIHJldHVybiBy
YzsKK30KKworaW50IGhhbmRsZV94ODZfbXNyX3BvbGljeShzdHJ1Y3QgeGNfc3JfY29udGV4dCAq
Y3R4LCBzdHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMpCit7CisgICAgeGNfaW50ZXJmYWNlICp4Y2gg
PSBjdHgtPnhjaDsKKyAgICBpbnQgcmM7CisKKyAgICBpZiAoIHJlYy0+bGVuZ3RoID09IDAgfHwK
KyAgICAgICAgIHJlYy0+bGVuZ3RoICUgc2l6ZW9mKHhlbl9tc3JfZW50cnlfdCkgIT0gMCApCisg
ICAgeworICAgICAgICBFUlJPUigiWDg2X01TUl9QT0xJQ1kgc2l6ZSAldSBzaG91bGQgYmUgbXVs
dGlwbGUgb2YgJXp1IiwKKyAgICAgICAgICAgICAgcmVjLT5sZW5ndGgsIHNpemVvZih4ZW5fY3B1
aWRfbGVhZl90KSk7CisgICAgICAgIHJldHVybiAtMTsKKyAgICB9CisKKyAgICByYyA9IHVwZGF0
ZV9ibG9iKCZjdHgtPng4Ni5yZXN0b3JlLm1zciwgcmVjLT5kYXRhLCByZWMtPmxlbmd0aCk7Cisg
ICAgaWYgKCByYyApCisgICAgICAgIEVSUk9SKCJVbmFibGUgdG8gYWxsb2NhdGUgJXUgYnl0ZXMg
Zm9yIFg4Nl9NU1JfUE9MSUNZIiwgcmVjLT5sZW5ndGgpOworCisgICAgcmV0dXJuIHJjOworfQor
CiAvKgogICogTG9jYWwgdmFyaWFibGVzOgogICogbW9kZTogQwpkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlieGMveGNfc3JfY29tbW9uX3g4Ni5oIGIvdG9vbHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5o
CmluZGV4IDdjMmQ0MmVmZTguLmY3ZmE0ZmU2MmIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hj
X3NyX2NvbW1vbl94ODYuaAorKysgYi90b29scy9saWJ4Yy94Y19zcl9jb21tb25feDg2LmgKQEAg
LTE5LDYgKzE5LDIwIEBAIGludCBoYW5kbGVfeDg2X3RzY19pbmZvKHN0cnVjdCB4Y19zcl9jb250
ZXh0ICpjdHgsIHN0cnVjdCB4Y19zcl9yZWNvcmQgKnJlYyk7CiAgKi8KIGludCB4ODZfc3RhdGlj
X2RhdGFfY29tcGxldGUoc3RydWN0IHhjX3NyX2NvbnRleHQgKmN0eCk7CiAKKy8qCisgKiBQYXJz
ZXMgYW4gWDg2X0NQVUlEX1BPTElDWSByZWNvcmQgYW5kIHN0YXNoZXMgdGhlIGNvbnRlbnQgZm9y
IGFwcGxpY2F0aW9uCisgKiB3aGVuIGEgU1RBVElDX0RBVEFfRU5EIHJlY29yZCBpcyBlbmNvdW50
ZXJlZC4KKyAqLworaW50IGhhbmRsZV94ODZfY3B1aWRfcG9saWN5KHN0cnVjdCB4Y19zcl9jb250
ZXh0ICpjdHgsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhjX3NyX3JlY29y
ZCAqcmVjKTsKKworLyoKKyAqIFBhcnNlcyBhbiBYODZfTVNSX1BPTElDWSByZWNvcmQgYW5kIHN0
YXNoZXMgdGhlIGNvbnRlbnQgZm9yIGFwcGxpY2F0aW9uCisgKiB3aGVuIGEgU1RBVElDX0RBVEFf
RU5EIHJlY29yZCBpcyBlbmNvdW50ZXJlZC4KKyAqLworaW50IGhhbmRsZV94ODZfbXNyX3BvbGlj
eShzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4LAorICAgICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgeGNfc3JfcmVjb3JkICpyZWMpOworCiAjZW5kaWYKIC8qCiAgKiBMb2NhbCB2YXJpYWJs
ZXM6CmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9odm0uYyBiL3Rv
b2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmVfeDg2X2h2bS5jCmluZGV4IDk0ZjQ3ZjI1ODkuLjkxOTBl
ZGFlZTcgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmVfeDg2X2h2bS5jCisr
KyBiL3Rvb2xzL2xpYnhjL3hjX3NyX3Jlc3RvcmVfeDg2X2h2bS5jCkBAIC0xNzEsNiArMTcxLDEy
IEBAIHN0YXRpYyBpbnQgeDg2X2h2bV9wcm9jZXNzX3JlY29yZChzdHJ1Y3QgeGNfc3JfY29udGV4
dCAqY3R4LAogICAgIGNhc2UgUkVDX1RZUEVfSFZNX1BBUkFNUzoKICAgICAgICAgcmV0dXJuIGhh
bmRsZV9odm1fcGFyYW1zKGN0eCwgcmVjKTsKIAorICAgIGNhc2UgUkVDX1RZUEVfWDg2X0NQVUlE
X1BPTElDWToKKyAgICAgICAgcmV0dXJuIGhhbmRsZV94ODZfY3B1aWRfcG9saWN5KGN0eCwgcmVj
KTsKKworICAgIGNhc2UgUkVDX1RZUEVfWDg2X01TUl9QT0xJQ1k6CisgICAgICAgIHJldHVybiBo
YW5kbGVfeDg2X21zcl9wb2xpY3koY3R4LCByZWMpOworCiAgICAgZGVmYXVsdDoKICAgICAgICAg
cmV0dXJuIFJFQ09SRF9OT1RfUFJPQ0VTU0VEOwogICAgIH0KQEAgLTIyNyw2ICsyMzMsOSBAQCBz
dGF0aWMgaW50IHg4Nl9odm1fY2xlYW51cChzdHJ1Y3QgeGNfc3JfY29udGV4dCAqY3R4KQogewog
ICAgIGZyZWUoY3R4LT54ODYuaHZtLnJlc3RvcmUuY29udGV4dC5wdHIpOwogCisgICAgZnJlZShj
dHgtPng4Ni5yZXN0b3JlLmNwdWlkLnB0cik7CisgICAgZnJlZShjdHgtPng4Ni5yZXN0b3JlLm1z
ci5wdHIpOworCiAgICAgcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hj
X3NyX3Jlc3RvcmVfeDg2X3B2LmMgYi90b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9wdi5j
CmluZGV4IDkwYjFlNTQyN2IuLjNkNTkzNzUzYWIgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hj
X3NyX3Jlc3RvcmVfeDg2X3B2LmMKKysrIGIvdG9vbHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZf
cHYuYwpAQCAtMTEwMiw2ICsxMTAyLDEyIEBAIHN0YXRpYyBpbnQgeDg2X3B2X3Byb2Nlc3NfcmVj
b3JkKHN0cnVjdCB4Y19zcl9jb250ZXh0ICpjdHgsCiAgICAgY2FzZSBSRUNfVFlQRV9YODZfVFND
X0lORk86CiAgICAgICAgIHJldHVybiBoYW5kbGVfeDg2X3RzY19pbmZvKGN0eCwgcmVjKTsKIAor
ICAgIGNhc2UgUkVDX1RZUEVfWDg2X0NQVUlEX1BPTElDWToKKyAgICAgICAgcmV0dXJuIGhhbmRs
ZV94ODZfY3B1aWRfcG9saWN5KGN0eCwgcmVjKTsKKworICAgIGNhc2UgUkVDX1RZUEVfWDg2X01T
Ul9QT0xJQ1k6CisgICAgICAgIHJldHVybiBoYW5kbGVfeDg2X21zcl9wb2xpY3koY3R4LCByZWMp
OworCiAgICAgZGVmYXVsdDoKICAgICAgICAgcmV0dXJuIFJFQ09SRF9OT1RfUFJPQ0VTU0VEOwog
ICAgIH0KQEAgLTExNzMsNiArMTE3OSw5IEBAIHN0YXRpYyBpbnQgeDg2X3B2X2NsZWFudXAoc3Ry
dWN0IHhjX3NyX2NvbnRleHQgKmN0eCkKICAgICBpZiAoIGN0eC0+eDg2LnB2Lm0ycCApCiAgICAg
ICAgIG11bm1hcChjdHgtPng4Ni5wdi5tMnAsIGN0eC0+eDg2LnB2Lm5yX20ycF9mcmFtZXMgKiBQ
QUdFX1NJWkUpOwogCisgICAgZnJlZShjdHgtPng4Ni5yZXN0b3JlLmNwdWlkLnB0cik7CisgICAg
ZnJlZShjdHgtPng4Ni5yZXN0b3JlLm1zci5wdHIpOworCiAgICAgcmV0dXJuIDA7CiB9CiAKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
