Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B65218F292
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 11:20:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGK9Y-0007bj-Jm; Mon, 23 Mar 2020 10:17:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGK9X-0007bM-Ck
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 10:17:51 +0000
X-Inumbo-ID: 8734dcb0-6cef-11ea-bec1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8734dcb0-6cef-11ea-bec1-bc764e2007e4;
 Mon, 23 Mar 2020 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584958661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YuwDMutCdhXNnj6m3wY7ONDkRuL1FQr6n5Vuwb42REI=;
 b=JTve5bus+HdOGgmWQ+te7ll5hLlq+Jmdl8DjJWpqY5TMsV1CTEBIGdVs
 utQZetnvximtbZ5JS6YDxrEI7tIp/VDVmX+KoIMrMbkMKjldt/kbeBufz
 sp5M1u35IPFOsrUk2yALOi8BykANgmdI9QoMqkywT1/LEfXg1q9AEDXRn c=;
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
IronPort-SDR: LdN1PqWwHepdNHdWfPMrGcPm7lz8T7vhmmOi8EQkQWVazvDah3hEtGu6V4Ns8oqUCYsBn3IY/9
 hoaWOvoGhCe8hOzNyewjzDBUMBBXbyz+1CAwljLO3eeEohzB156EUq9VF+jbdkfM04sBpxsXb0
 IV7ESCBEut4+yBAiKVAcxOTOPRj7dtAuKXRkD+ivzDWhGjDQ6EUQSA7Osxppq94MRhgPP+sFzn
 pAZ82cbhGuZcfTOn6oY9dxEJ4sK0E+6r4Pl23SldjqEYw+9qu15/WhRUUlIxTbv15j4QAwOeaf
 Go4=
X-SBRS: 2.7
X-MesageID: 15099737
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="15099737"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 23 Mar 2020 10:17:22 +0000
Message-ID: <20200323101724.15655-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200323101724.15655-1-andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/7] x86/ucode/intel: Clean up
 microcode_update_match()
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

SW1wbGVtZW50IGEgbmV3IGdldF9leHRfc2lndGFibGUoKSBoZWxwZXIgdG8gYWJzdHJhY3QgdGhl
IGxvZ2ljIGZvcgppZGVudGlmeWluZyB3aGV0aGVyIGFuIGV4dGVuZGVkIHNpZ25hdHVyZSB0YWJs
ZSBleGlzdHMuICBBcyBwYXJ0IG9mIHRoaXMsCnJlbmFtZSBtaWNyb2NvZGVfaW50ZWwuYml0cyB0
byBkYXRhIGFuZCBjaGFuZ2UgaXRzIHR5cGUgc28gaXQgY2FuIGJlIHVzZWZ1bGx5CnVzZWQgaW4g
Y29tYmluYXRpb24gd2l0aCB0aGUgZGF0YXNpemUgaGVhZGVyIGZpZWxkLgoKQWxzbywgcmVwbGFj
ZSB0aGUgc2lnbWF0Y2goKSBtYWNybyB3aXRoIGEgc3RhdGljIGlubGluZSB3aXRoIGEgbW9yZSB1
c2VmdWwKQVBJLCBhbmQgYW4gZXhwbGFuYXRpb24gb2Ygd2h5IGl0IGlzIHNhZmUgdG8gZHJvcCBv
bmUgb2YgdGhlIHByZXZpb3VzCmNvbmRpdGlvbmFscy4KCk5vIHByYWN0aWNhbCBjaGFuZ2UgaW4g
YmVoYXZpb3VyLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvaW50ZWwuYyB8IDc1ICsrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDkgaW5z
ZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Nw
dS9taWNyb2NvZGUvaW50ZWwuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL2ludGVsLmMK
aW5kZXggZGZlNDQ2NzliZS4uYmMzYmJmMTM5ZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2Nw
dS9taWNyb2NvZGUvaW50ZWwuYworKysgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9pbnRl
bC5jCkBAIC02MSw3ICs2MSw3IEBAIHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsIHsKIAog
c3RydWN0IG1pY3JvY29kZV9pbnRlbCB7CiAgICAgc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50
ZWwgaGRyOwotICAgIHVuc2lnbmVkIGludCBiaXRzWzBdOworICAgIHVpbnQ4X3QgZGF0YVtdOwog
fTsKIAogLyogbWljcm9jb2RlIGZvcm1hdCBpcyBleHRlbmRlZCBmcm9tIHByZXNjb3R0IHByb2Nl
c3NvcnMgKi8KQEAgLTk4LDggKzk4LDQxIEBAIHN0YXRpYyB1aW50MzJfdCBnZXRfdG90YWxzaXpl
KGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaGVhZGVyX2ludGVsICpoZHIpCiAgICAgcmV0dXJuIGhk
ci0+X3RvdGFsc2l6ZSA/OiBQUFJPX1VDT0RFX0RBVEFTSVpFICsgTUNfSEVBREVSX1NJWkU7CiB9
CiAKLSNkZWZpbmUgc2lnbWF0Y2goczEsIHMyLCBwMSwgcDIpIFwKLSAgICAgICAgKCgoczEpID09
IChzMikpICYmICgoKHAxKSAmIChwMikpIHx8ICgoKHAxKSA9PSAwKSAmJiAoKHAyKSA9PSAwKSkp
KQorLyoKKyAqIEEgcGllY2Ugb2YgbWljcm9jb2RlIGhhcyBhbiBleHRlbmRlZCBzaWduYXR1cmUg
dGFibGUgaWYgdGhlcmUgaXMgc3BhY2UKKyAqIGJldHdlZW4gdGhlIGVuZCBvZiBkYXRhW10gYW5k
IHRoZSB0b3RhbCBzaXplLiAgKFRoaXMgbG9naWMgYWxzbyB3b3JrcworICogYXBwcm9wcmlhdGVs
eSBmb3IgUGVudGl1bSBQcm8vSUkgbWljcm9jb2RlLCB3aGljaCBoYXMgMCBmb3IgYm90aCBzaXpl
CisgKiBmaWVsZHMsIGFuZCBubyBleHRlbmRlZCBzaWduYXR1cmUgdGFibGUuKQorICovCitzdGF0
aWMgY29uc3Qgc3RydWN0IGV4dGVuZGVkX3NpZ3RhYmxlICpnZXRfZXh0X3NpZ3RhYmxlKAorICAg
IGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKm1jKQoreworICAgIGlmICggbWMtPmhkci5f
dG90YWxzaXplID4gKE1DX0hFQURFUl9TSVpFICsgbWMtPmhkci5fZGF0YXNpemUpICkKKyAgICAg
ICAgcmV0dXJuICh2b2lkICopJm1jLT5kYXRhW21jLT5oZHIuX2RhdGFzaXplXTsKKworICAgIHJl
dHVybiBOVUxMOworfQorCisvKgorICogQSBwaWVjZSBvZiBtaWNyb2NvZGUgaXMgYXBwbGljYWJs
ZSBmb3IgYSBDUFUgaWY6CisgKiAgMSkgdGhlIHNpZ25hdHVyZXMgKENQVUlELjEuRUFYIC0gRmFt
aWx5L01vZGVsL1N0ZXBwaW5nKSBtYXRjaCwgYW5kCisgKiAgMikgVGhlIFBsYXRmb3JtIEZsYWdz
IGJpdG1hcCBpbnRlcnNlY3QuCisgKgorICogQSBDUFUgd2lsbCBoYXZlIGEgc2luZ2xlIFBsYXRm
b3JtIEZsYWcgYml0LCB3aGlsZSB0aGUgbWljcm9jb2RlIG1heSBiZQorICogY29tbW9uIHRvIG11
bHRpcGxlIHBsYXRmb3JtcyBhbmQgaGF2ZSBtdWx0aXBsZSBiaXRzIHNldC4KKyAqCisgKiBOb3Rl
OiBUaGUgUGVudGl1bSBQcm8vSUkgbWljcm9jb2RlIGRpZG4ndCB1c2UgcGxhdGZvcm0gZmxhZ3Ms
IGFuZCBzaG91bGQKKyAqIHRyZWF0IDAgYXMgYSBtYXRjaC4gIEhvd2V2ZXIsIFhlbiBiZWluZyA2
NGJpdCBtZWFucyB0aGF0IHRoZSBjcHUgc2lnbmF0dXJlCisgKiB3b24ndCBtYXRjaCwgYWxsb3dp
bmcgdXMgdG8gc2ltcGxpZnkgdGhlIGxvZ2ljLgorICovCitzdGF0aWMgYm9vbCBzaWduYXR1cmVf
bWFjaGVzKGNvbnN0IHN0cnVjdCBjcHVfc2lnbmF0dXJlICpjcHVfc2lnLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgdWNvZGVfc2lnLCB1bnNpZ25lZCBpbnQgdWNv
ZGVfcGYpCit7CisgICAgaWYgKCBjcHVfc2lnLT5zaWcgIT0gdWNvZGVfc2lnICkKKyAgICAgICAg
cmV0dXJuIGZhbHNlOworCisgICAgcmV0dXJuIGNwdV9zaWctPnBmICYgdWNvZGVfcGY7Cit9CiAK
ICNkZWZpbmUgZXh0dGFibGVfc2l6ZShldCkgKChldCktPmNvdW50ICogRVhUX1NJR05BVFVSRV9T
SVpFICsgRVhUX0hFQURFUl9TSVpFKQogCkBAIC0yMjEsMzYgKzI1NCwyNiBAQCBzdGF0aWMgaW50
IG1pY3JvY29kZV9zYW5pdHlfY2hlY2soY29uc3Qgc3RydWN0IG1pY3JvY29kZV9pbnRlbCAqbWMp
CiBzdGF0aWMgZW51bSBtaWNyb2NvZGVfbWF0Y2hfcmVzdWx0IG1pY3JvY29kZV91cGRhdGVfbWF0
Y2goCiAgICAgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9pbnRlbCAqbWMpCiB7Ci0gICAgY29uc3Qg
c3RydWN0IG1pY3JvY29kZV9oZWFkZXJfaW50ZWwgKm1jX2hlYWRlciA9ICZtYy0+aGRyOwotICAg
IGNvbnN0IHN0cnVjdCBleHRlbmRlZF9zaWd0YWJsZSAqZXh0X2hlYWRlcjsKLSAgICBjb25zdCBz
dHJ1Y3QgZXh0ZW5kZWRfc2lnbmF0dXJlICpleHRfc2lnOworICAgIGNvbnN0IHN0cnVjdCBleHRl
bmRlZF9zaWd0YWJsZSAqZXh0OwogICAgIHVuc2lnbmVkIGludCBpOwogICAgIHN0cnVjdCBjcHVf
c2lnbmF0dXJlICpjcHVfc2lnID0gJnRoaXNfY3B1KGNwdV9zaWcpOwotICAgIHVuc2lnbmVkIGlu
dCBzaWcgPSBjcHVfc2lnLT5zaWc7Ci0gICAgdW5zaWduZWQgaW50IHBmID0gY3B1X3NpZy0+cGY7
Ci0gICAgdW5zaWduZWQgaW50IHJldiA9IGNwdV9zaWctPnJldjsKLSAgICB1bnNpZ25lZCBsb25n
IGRhdGFfc2l6ZSA9IGdldF9kYXRhc2l6ZShtY19oZWFkZXIpOwotICAgIGNvbnN0IHZvaWQgKmVu
ZCA9IChjb25zdCB2b2lkICopbWNfaGVhZGVyICsgZ2V0X3RvdGFsc2l6ZShtY19oZWFkZXIpOwog
CiAgICAgQVNTRVJUKCFtaWNyb2NvZGVfc2FuaXR5X2NoZWNrKG1jKSk7Ci0gICAgaWYgKCBzaWdt
YXRjaChzaWcsIG1jX2hlYWRlci0+c2lnLCBwZiwgbWNfaGVhZGVyLT5wZikgKQotICAgICAgICBy
ZXR1cm4gKG1jX2hlYWRlci0+cmV2ID4gcmV2KSA/IE5FV19VQ09ERSA6IE9MRF9VQ09ERTsKIAot
ICAgIGV4dF9oZWFkZXIgPSAoY29uc3Qgdm9pZCAqKShtY19oZWFkZXIgKyAxKSArIGRhdGFfc2l6
ZTsKLSAgICBleHRfc2lnID0gKGNvbnN0IHZvaWQgKikoZXh0X2hlYWRlciArIDEpOworICAgIC8q
IENoZWNrIHRoZSBtYWluIG1pY3JvY29kZSBzaWduYXR1cmUuICovCisgICAgaWYgKCBzaWduYXR1
cmVfbWFjaGVzKGNwdV9zaWcsIG1jLT5oZHIuc2lnLCBtYy0+aGRyLnBmKSApCisgICAgICAgIGdv
dG8gZm91bmQ7CiAKLSAgICAvKgotICAgICAqIE1ha2Ugc3VyZSB0aGVyZSBpcyBlbm91Z2ggc3Bh
Y2UgdG8gaG9sZCBhbiBleHRlbmRlZCBoZWFkZXIgYW5kIGVub3VnaAotICAgICAqIGFycmF5IGVs
ZW1lbnRzLgotICAgICAqLwotICAgIGlmICggZW5kIDw9IChjb25zdCB2b2lkICopZXh0X3NpZyAp
Ci0gICAgICAgIHJldHVybiBNSVNfVUNPREU7Ci0KLSAgICBmb3IgKCBpID0gMDsgaSA8IGV4dF9o
ZWFkZXItPmNvdW50OyBpKysgKQotICAgICAgICBpZiAoIHNpZ21hdGNoKHNpZywgZXh0X3NpZ1tp
XS5zaWcsIHBmLCBleHRfc2lnW2ldLnBmKSApCi0gICAgICAgICAgICByZXR1cm4gKG1jX2hlYWRl
ci0+cmV2ID4gcmV2KSA/IE5FV19VQ09ERSA6IE9MRF9VQ09ERTsKKyAgICAvKiBJZiB0aGVyZSBp
cyBhbiBleHRlbmRlZCBzaWduYXR1cmUgdGFibGUsIGNoZWNrIGVhY2ggb2YgdGhlbS4gKi8KKyAg
ICBpZiAoIChleHQgPSBnZXRfZXh0X3NpZ3RhYmxlKG1jKSkgIT0gTlVMTCApCisgICAgICAgIGZv
ciAoIGkgPSAwOyBpIDwgZXh0LT5jb3VudDsgKytpICkKKyAgICAgICAgICAgIGlmICggc2lnbmF0
dXJlX21hY2hlcyhjcHVfc2lnLCBleHQtPnNpZ3NbaV0uc2lnLCBleHQtPnNpZ3NbaV0ucGYpICkK
KyAgICAgICAgICAgICAgICBnb3RvIGZvdW5kOwogCiAgICAgcmV0dXJuIE1JU19VQ09ERTsKKwor
IGZvdW5kOgorICAgIHJldHVybiBtYy0+aGRyLnJldiA+IGNwdV9zaWctPnJldiA/IE5FV19VQ09E
RSA6IE9MRF9VQ09ERTsKIH0KIAogc3RhdGljIGJvb2wgbWF0Y2hfY3B1KGNvbnN0IHN0cnVjdCBt
aWNyb2NvZGVfcGF0Y2ggKnBhdGNoKQpAQCAtMzAzLDcgKzMyNiw3IEBAIHN0YXRpYyBpbnQgYXBw
bHlfbWljcm9jb2RlKGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhdGNoKQogICAgIEJV
R19PTihsb2NhbF9pcnFfaXNfZW5hYmxlZCgpKTsKIAogICAgIC8qIHdyaXRlIG1pY3JvY29kZSB2
aWEgTVNSIDB4NzkgKi8KLSAgICB3cm1zcmwoTVNSX0lBMzJfVUNPREVfV1JJVEUsICh1bnNpZ25l
ZCBsb25nKW1jX2ludGVsLT5iaXRzKTsKKyAgICB3cm1zcmwoTVNSX0lBMzJfVUNPREVfV1JJVEUs
ICh1bnNpZ25lZCBsb25nKW1jX2ludGVsLT5kYXRhKTsKICAgICB3cm1zcmwoTVNSX0lBMzJfVUNP
REVfUkVWLCAweDBVTEwpOwogCiAgICAgLyogQXMgZG9jdW1lbnRlZCBpbiB0aGUgU0RNOiBEbyBh
IENQVUlEIDEgaGVyZSAqLwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
